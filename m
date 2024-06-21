Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CFA912B24
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 18:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745393.1152514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgwg-0004jz-4o; Fri, 21 Jun 2024 16:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745393.1152514; Fri, 21 Jun 2024 16:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKgwg-0004hR-1q; Fri, 21 Jun 2024 16:17:02 +0000
Received: by outflank-mailman (input) for mailman id 745393;
 Fri, 21 Jun 2024 16:17:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKgwf-0004hL-6a
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 16:17:01 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af81ea30-2fe9-11ef-b4bb-af5377834399;
 Fri, 21 Jun 2024 18:16:59 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6f51660223so122609166b.0
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 09:16:59 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d303da3d6sm1120207a12.13.2024.06.21.09.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 09:16:57 -0700 (PDT)
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
X-Inumbo-ID: af81ea30-2fe9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718986618; x=1719591418; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZhNWuzpiBITLcC1Y0U8SCKMSOyBGsap/FB26vtaMnqg=;
        b=Fe7EN1uGQIxoMn2F8Ag/l4bp+xtRwxWx/PLfuUSJ4jqKujgDu37aBDrd7dC6djtLZb
         2S2r0o58ptPTqUf9jtmVQ+PrptnWhSiU3IMUUAO7qgUqLzy/H4TUpVnHH9geuYVozoFO
         O0e1rPaVHxxWOWnDLUTDQkWZU9u+3z54DgyTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718986618; x=1719591418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZhNWuzpiBITLcC1Y0U8SCKMSOyBGsap/FB26vtaMnqg=;
        b=WXCzGjwGz9Gwr1Y2k1CgBstnMgDfVYQWajXVj7aBOq9FM9xvGLxLde5daZ2u6Pzz+U
         niXy4tivOuAO0AyUeeI+eAbm8xDmJAVdBIgIac7tDdw5yBXZZS5iWY5Y5S5KWcFr7NQD
         +paywc5uLGnhCEWnHo1JoI8/k26yBW8OXBxofoibvpXDQcC8nEvDA+WaYTbfOCMfdjLV
         0EGdTazYi7Zt41w5ea+4eKWSDXRYyR4yqRQ0s2ROMlP7pJfdMNXsWVeOB5RYLA2rbaQC
         8o9CTAqRyzBHklCbFGAxM6+fhbNpVelwUnQ7dppehI31bLJ4iO+nSknFybSMo0lxqstt
         Ynqg==
X-Gm-Message-State: AOJu0Yx6iLQEA2c3qlBGutv0hDjBfMWKSGfmBkO7/tYZeTMLKLQgeduK
	EfPhAD11oFi0/75uc6pSnUobAXK5oTBZMOFJ/3esMd2U7DgXW8wG3dIZboKQNbbQOJ7KChzGaKj
	Ic48=
X-Google-Smtp-Source: AGHT+IEYuZvg7pzZXOdLUnH/tGa2L6NR/gZmRQem6PqCCkbR8asQ8R/U4LrZfx0g6M7LdVAIONo62A==
X-Received: by 2002:a50:8ad8:0:b0:57c:5d4a:4122 with SMTP id 4fb4d7f45d1cf-57d07e0d432mr5709478a12.9.1718986618242;
        Fri, 21 Jun 2024 09:16:58 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH for-4.19 v2] tools/xl: Open xldevd.log with O_CLOEXEC
Date: Fri, 21 Jun 2024 17:16:56 +0100
Message-Id: <20240621161656.63576-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`xl devd` has been observed leaking /var/log/xldevd.log into children.

Note this is specifically safe; dup2() leaves O_CLOEXEC disabled on newfd, so
after setting up stdout/stderr, it's only the logfile fd which will close on
exec().

Link: https://github.com/QubesOS/qubes-issues/issues/8292
Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Also entirely speculative based on the QubesOS ticket.

v2:
 * Extend the commit message to explain why stdout/stderr aren't closed by
   this change

For 4.19.  This bugfix was posted earlier, but fell between the cracks.
---
 tools/xl/xl_utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xl/xl_utils.c b/tools/xl/xl_utils.c
index 17489d182954..060186db3a59 100644
--- a/tools/xl/xl_utils.c
+++ b/tools/xl/xl_utils.c
@@ -270,7 +270,7 @@ int do_daemonize(const char *name, const char *pidfile)
         exit(-1);
     }
 
-    CHK_SYSCALL(logfile = open(fullname, O_WRONLY|O_CREAT|O_APPEND, 0644));
+    CHK_SYSCALL(logfile = open(fullname, O_WRONLY | O_CREAT | O_APPEND | O_CLOEXEC, 0644));
     free(fullname);
     assert(logfile >= 3);
 
-- 
2.39.2


