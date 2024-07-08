Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE39B92A57A
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 17:16:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755488.1163859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQq5R-0003hU-VN; Mon, 08 Jul 2024 15:15:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755488.1163859; Mon, 08 Jul 2024 15:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQq5R-0003fK-Rw; Mon, 08 Jul 2024 15:15:29 +0000
Received: by outflank-mailman (input) for mailman id 755488;
 Mon, 08 Jul 2024 15:15:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQq5Q-0003fE-T1
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 15:15:28 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7a3bc23-3d3c-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 17:15:26 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a728f74c23dso481373766b.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 08:15:26 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a872df7sm2306066b.224.2024.07.08.08.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 08:15:24 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e7a3bc23-3d3c-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720451725; x=1721056525; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JorMuW4I5W/Tw/+HTvqxoRUw26KYmT9WGUSw3CyJxJk=;
        b=GIdsnE9ITZj69Qxfh/B07MhuPVK73xfPJFzV8TLoxtG6NoUlW2BXfH7yLo71+OEoWZ
         fuVbAtgHZn4F1+ojZ29kU89NlCAQXQbJ5Q28DKFxGz8zLDpiI8UcGOMKr/MyRr7Gz3bZ
         zJScDL4dDxjJnSERnh++4h19hQJ6dKVTR/VlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720451725; x=1721056525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JorMuW4I5W/Tw/+HTvqxoRUw26KYmT9WGUSw3CyJxJk=;
        b=j9oCh2Z1uKOehWAbML8N1UpSs5eoSnvy/nBN52KQeO954Fq9bEIzxn2UP1wfkbXabs
         RJniwKhiHgLTuux0yWHvE+y9J0/PFMBkzesuksNjO2DX79RRoPSHGkO/iMQ4nAVMecuC
         pTagqGR0yIxb/5r7jhUfmHovV1zscMt6pVUE1UfX2ogMPw/dYdUYAQtXIJSK9yimYfFH
         LGwPncnZDMiEp4SdXLaAcUT02YCnnw+4r1XHejfDjKDV6Tvib3LhIHWbYHUwV4XCRJ33
         KXYCEaWI9kb0sL7F55XYU0eIVz3lyvu0oql0KSA8a0JEMaPKVLxfnQs5/swcDTPetb/2
         92sQ==
X-Gm-Message-State: AOJu0YzsbMfdD3Aw3X7d+mLOhvuGP6nuewOHiOG6tZsQom5tMz2MJS/U
	SNWuoUtBl3amkbdngVTdEyPemECgOIyUwT1EsUY0DS02SS4akthwinO4zXUx3nhL4vJBSU+38fh
	i
X-Google-Smtp-Source: AGHT+IFnbEosj0cuR/WmvUenjK8i+dT+ovnQFtFih9q68pm05a0xRhwtiufROB/43GZoqB9X+sl5TA==
X-Received: by 2002:a17:906:1c13:b0:a77:c002:e4ac with SMTP id a640c23a62f3a-a77c002eafbmr657468766b.0.1720451725269;
        Mon, 08 Jul 2024 08:15:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Jan Beulich <JBeulich@suse.com>
Subject: [PATCH for-4.19] tools/libxs: Fix fcntl() invocation in set_cloexec()
Date: Mon,  8 Jul 2024 16:15:22 +0100
Message-Id: <20240708151522.2176290-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

set_cloexec() had a bit too much copy&pate from setnonblock(), and
insufficient testing on ancient versions of Linux...

As written (emulating ancient linux by undef'ing O_CLOEXEC), strace shows:

  open("/dev/xen/xenbus", O_RDWR)         = 3
  fcntl(3, F_GETFL)                       = 0x8002 (flags O_RDWR|O_LARGEFILE)
  fcntl(3, 0x8003 /* F_??? */, 0x7ffe4a771d90) = -1 EINVAL (Invalid argument)
  close(3)                                = 0

which is obviously nonsense.

Switch F_GETFL -> F_GETFD, and fix the second invocation to use F_SETFD.  With
this, strace is rather happer:

  open("/dev/xen/xenbus", O_RDWR)         = 3
  fcntl(3, F_GETFD)                       = 0
  fcntl(3, F_SETFD, FD_CLOEXEC)           = 0

Fixes: bf7c1464706a ("tools/libxs: Fix CLOEXEC handling in get_dev()")
Reported-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Ross Lagerwall <ross.lagerwall@citrix.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Jan Beulich <JBeulich@suse.com>

I'm embarassed to say that this was only spotted by Ross when I was
cherrypicking fixes from staging-4.17 into the XenServer patchqueue.

This is urgent to take for 4.19, and to backport into 4.17/18 seeing as the
breakage has been backported already.
---
 tools/libs/store/xs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index c8845b69e284..38a6ce3cf2ea 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -182,12 +182,12 @@ static bool setnonblock(int fd, int nonblock) {
 
 static bool set_cloexec(int fd)
 {
-	int flags = fcntl(fd, F_GETFL);
+	int flags = fcntl(fd, F_GETFD);
 
 	if (flags < 0)
 		return false;
 
-	return fcntl(fd, flags | FD_CLOEXEC) >= 0;
+	return fcntl(fd, F_SETFD, flags | FD_CLOEXEC) >= 0;
 }
 
 static int pipe_cloexec(int fds[2])
-- 
2.39.2


