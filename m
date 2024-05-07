Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A369C8BE0AE
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 13:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718009.1120496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Ig9-00035g-Bg; Tue, 07 May 2024 11:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718009.1120496; Tue, 07 May 2024 11:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Ig9-000343-8i; Tue, 07 May 2024 11:08:13 +0000
Received: by outflank-mailman (input) for mailman id 718009;
 Tue, 07 May 2024 11:08:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mcW=MK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4Ig7-00033x-EY
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 11:08:11 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 164a0621-0c62-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 13:08:09 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-572669fd9f9so182499a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 04:08:09 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 ig13-20020a056402458d00b0056bc0c44f02sm5710900edb.96.2024.05.07.04.08.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 May 2024 04:08:08 -0700 (PDT)
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
X-Inumbo-ID: 164a0621-0c62-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715080088; x=1715684888; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vAJJDFqhGr764DmADsx5a1oN1JBCRdtQwgQVTLAGJcQ=;
        b=pUsuV21O4GtmwYn9xRkkZA/HQEwao6095lbE0zOiJ445AgX/wZfu/w43/eYtwPPgxy
         W2TK1zuRY+ix5J+dPd8bWqKSvRFOwR+B0nTTcyuCn1nyTy/EgIQsarNAdx/xcuPFCxb2
         OE5ZgWKb0raZAlGdtEv+Ob2UUkfnE8wfvC84M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715080088; x=1715684888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAJJDFqhGr764DmADsx5a1oN1JBCRdtQwgQVTLAGJcQ=;
        b=fIJZ6P49PefyjBHGi0X7Ru+r2b0A/8Da6iWGbEp3Ys1fhW71xyWmJ+wv9ZT4OXtYND
         cFIOL/BqpC3RzbhOCMY6F2KVuoHcDVxCjuV7eNuta0AIzgxHyz6xfvzwyVswvySMrBAM
         lBq/6iFhH6keu1FA7dCDWblY74P617dvtmrWPvY4oMSPOtGsqoa/IwYjJVQV1UBkmLtE
         foxWRXlbvMHjNMtCE5vVtubY4bfnBNKanhoCRk1wK9pBMC9YtfgjOraYyrBm2ToWAvMI
         FZlgG2mSXOwhWuNKzLtx331P0C0q0ID7Hc6ArKiSMKsx450lYl9YolaGWtSeYkyofvdL
         Sc+g==
X-Gm-Message-State: AOJu0YxFYrRmmUsGCuCp53Z7tyBtlkJeKH66kIr6aRSwwO9LnJCUjKzy
	WteeUKMjcwKztn8QBpp48bzSicIflzF2+b5AEEUeiYQ2apaa7/pfppCxWSXyVWtpsJt8c2Fqbkp
	y
X-Google-Smtp-Source: AGHT+IHPINCMaGIC5WIiPHeKp+Mfb7tXVN1pbWnI2M4wLw3sBt8Uh2jIu226664I6aaGxji56nsMbw==
X-Received: by 2002:a50:cd15:0:b0:570:2198:b3ca with SMTP id z21-20020a50cd15000000b005702198b3camr9284848edi.14.1715080088452;
        Tue, 07 May 2024 04:08:08 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Demi Marie Obenour <demi@invisiblethingslab.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: [PATCH] tools/xl: Open xldevd.log with O_CLOEXEC
Date: Tue,  7 May 2024 12:08:06 +0100
Message-Id: <20240507110806.1692135-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`xl devd` has been observed leaking /var/log/xldevd.log into children.

Link: https://github.com/QubesOS/qubes-issues/issues/8292
Reported-by: Demi Marie Obenour <demi@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony@xenproject.org>
CC: Juergen Gross <jgross@suse.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Also entirely speculative based on the QubesOS ticket.
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
 

base-commit: ebab808eb1bb8f24c7d0dd41b956e48cb1824b81
prerequisite-patch-id: 212e50457e9b6bdfd06a97da545a5aa7155bb919
-- 
2.30.2


