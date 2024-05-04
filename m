Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 844B38BB911
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 03:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716761.1118991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s340i-0006OJ-Vf; Sat, 04 May 2024 01:16:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716761.1118991; Sat, 04 May 2024 01:16:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s340i-0006MG-SM; Sat, 04 May 2024 01:16:20 +0000
Received: by outflank-mailman (input) for mailman id 716761;
 Sat, 04 May 2024 01:16:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kUU4=MH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s340g-0006MA-Tc
 for xen-devel@lists.xenproject.org; Sat, 04 May 2024 01:16:18 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e869971c-09b3-11ef-909c-e314d9c70b13;
 Sat, 04 May 2024 03:16:17 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-51f17ac14daso279508e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2024 18:16:17 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r7-20020a170906350700b00a57e2d39d56sm2352639eja.223.2024.05.03.18.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 18:16:16 -0700 (PDT)
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
X-Inumbo-ID: e869971c-09b3-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714785377; x=1715390177; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AmgLG2/r7crf4VeZKFy4V6sV4ajE44kBgHnEhpJVc4s=;
        b=UoDnbu04hRFPUIlZ49zs/K/NR7vMhHdbtT7+KlqW9KTnmChWPycI4c6fLiuc6QvVQQ
         Qja4VG1kp1ytH5y77/ENolCxd9mK3ZHA4LVEjEXN7oQ8UM0wTzI5IV8KBbxwV6ORe8op
         nPJ/65Nx9nRK2LR/Z4u1MzEu9HwNKNZnVaUKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714785377; x=1715390177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmgLG2/r7crf4VeZKFy4V6sV4ajE44kBgHnEhpJVc4s=;
        b=wWpOeTBBfe4I3cXy75jWZX0ug4mInDykJtRQH+mI96E/egy2Fmj4BluTPpfJyHGsrM
         yuBaDjm4lapqKbb43EWBwCMd88aGOozEggnxyUN/dUov7wQwJzbYIGbgo0XRYc49wmXs
         Qkf3v9yOKf4m14BD18QE2HTsvfzwq8DOIKzFY55xF36+LhRcxMUV5Zml+DsFgFQ4bXHT
         HZ+E9l7D4iJOiKdBPnOpo973Dv8hYM5L98WAy8/vp20IRslcgkeF1uIuVqI/m4FwBTmX
         CINfs1OB0OQF+nlSYEDpyLhN6vQ/wKwKUWcsmxzk/CrpdeNxDK5KL+fjuFHpJratto97
         vHbA==
X-Gm-Message-State: AOJu0Yy5mmJjUqkrt5e8z1h5BMVuUvAZWW8BTo8KaVJVDcMGUrQ5Stoh
	5d5cBkkgNxmaMNVIBgbiXwwGrHPFkRH9bsQMSIR23uz7zH9NKjhaHDlGa0CROnDJ3OaGoWzhwxw
	i
X-Google-Smtp-Source: AGHT+IHqI0krkuqGwRYB+NnZPz4XCKxWW9sv2ZAYTyzVfM13n0PbKNPYSKmS1DOhIMjCipdqFX/H4A==
X-Received: by 2002:a05:6512:3108:b0:51d:4260:4bf8 with SMTP id n8-20020a056512310800b0051d42604bf8mr2815739lfb.35.1714785376732;
        Fri, 03 May 2024 18:16:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] tools/libxs: Open /dev/xen/xenbus fds as O_CLOEXEC
Date: Sat,  4 May 2024 02:16:14 +0100
Message-Id: <20240504011614.1645851-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The header description for xs_open() goes as far as to suggest that the fd is
O_CLOEXEC, but it isn't actually.

`xl devd` has been observed leaking /dev/xen/xenbus into children.

Link: https://github.com/QubesOS/qubes-issues/issues/8292
Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Entirely speculative patch based on a Matrix report
---
 tools/libs/store/xs.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/libs/store/xs.c b/tools/libs/store/xs.c
index 140b9a28395e..1f74fb3c44a2 100644
--- a/tools/libs/store/xs.c
+++ b/tools/libs/store/xs.c
@@ -54,6 +54,10 @@ struct xs_stored_msg {
 #include <dlfcn.h>
 #endif
 
+#ifndef O_CLOEXEC
+#define O_CLOEXEC 0
+#endif
+
 struct xs_handle {
 	/* Communications channel to xenstore daemon. */
 	int fd;
@@ -227,7 +231,7 @@ static int get_socket(const char *connect_to)
 static int get_dev(const char *connect_to)
 {
 	/* We cannot open read-only because requests are writes */
-	return open(connect_to, O_RDWR);
+	return open(connect_to, O_RDWR|O_CLOEXEC);
 }
 
 static int all_restrict_cb(Xentoolcore__Active_Handle *ah, domid_t domid) {

base-commit: feb9158a620040846d76981acbe8ea9e2255a07b
-- 
2.30.2


