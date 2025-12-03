Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 942B6C9E9E1
	for <lists+xen-devel@lfdr.de>; Wed, 03 Dec 2025 11:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1176558.1501027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjev-000495-Hi; Wed, 03 Dec 2025 10:00:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1176558.1501027; Wed, 03 Dec 2025 10:00:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQjev-000433-By; Wed, 03 Dec 2025 10:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1176558;
 Wed, 03 Dec 2025 10:00:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1EAn=6J=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vQjet-0003xW-R9
 for xen-devel@lists.xenproject.org; Wed, 03 Dec 2025 10:00:27 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3bb2761-d02e-11f0-980a-7dc792cee155;
 Wed, 03 Dec 2025 11:00:25 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so12009464a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Dec 2025 02:00:25 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-211.as6723.net. [185.5.253.211])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510615c0sm18190969a12.30.2025.12.03.02.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 02:00:24 -0800 (PST)
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
X-Inumbo-ID: e3bb2761-d02e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764756025; x=1765360825; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aadf3ko+I/c1Yg3RWCNNDblN+tC0Sr7zOTobR7NNsys=;
        b=fOxl6yX3bOxfJ7nvs7mVnGeq2X6ErnN9Je8TlxfEtZCl9zzHS58Rlm6SjL5Wc/fXk9
         1IiPbC04iMqKXg7ulEvcE7IpsK27pAhmm4LWYmMqPGF/HCiWiyjioIYdcBN8VWu9cXY/
         h01n38Lc6CHf9W8Be42boiND2gDmOzJYL50YC3QIS38O8mW6NXRgGGAIL2BR40vZi1x7
         l0ZtbbeKEPwKlFXWF9EW4NqCBRsEa/axoNVHlW0xMioonjxH6559rEAJmrexXhbr4gNF
         LzULhtIz3kYQwNMtrH8+5XOR2ajco5j4pGPrrSluNmKup6mwuLfLZW25Cz/UVjhBdpCe
         M5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764756025; x=1765360825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aadf3ko+I/c1Yg3RWCNNDblN+tC0Sr7zOTobR7NNsys=;
        b=d4z2vvD19w/3xTB+bRw5/Sms9ZV0bRYo/Cr49IeiNaQXmSFSNS1Uba5m+38qqRfdRV
         hFg90FBV3QFk8mvuE9+njFplxjc/PHxOsdjWOaM/jeN/RoBy14+MC3A5d5vqX6FWPwLF
         W9T3la44nartYJtKOyVAvBAqtmUKqJQzoFlvE+PfhEj1QJRExzOrXXpsS/60o7hOv9c7
         GDSgg7SfpfSgXG9y+nsJ3B7JJEjWCBpE/VZJGdKKbra6ZIEB4jZDtx0yz3pumVKbsRMi
         Wa21/teIeTDMHTDPBn4dk7wlcJcb8KzsJo0Sly4RqX5RH9YVjBu5LIQCq+Y4XQ0sO/Cw
         KuhA==
X-Gm-Message-State: AOJu0YwO5/imDco+kdCdES0R5mJnjaBp/2vgd6eUZtmONKgy5hN4XplT
	LGw4i2J2dIDF1YEkmO1imcSwk0aS/ITCxpb32wSYufSjex5LK4jJMwSzHhymsWjM
X-Gm-Gg: ASbGncuxOR5ImlrTosWt9gFPjXOt2FIVCFXZMWW5508n3X1egbJGwhoz14TguygXVwB
	kcKWFI4mRQyc4DDAQP8Jr8fgzB9/RVhnWG7KfcfyE0YHQI9p82Q5P8rppgKA8pXT5bp2aoqFLWT
	R0bT3gpc7hvLWiQHFOAxEdAxJ4gJfB0u3POrmyP8VpuBPxBgA08c5s8LplNdjnvm90lQNnTwWCR
	nR7erzwSeDhVzOd62BpYqUwsrky08U9Ur/kSxvk3D61cGQn9g9CAopK/1wC5bTI4pxU/l7hLdeG
	ZPNmfuNSk8UtSI09VmnMJwTnOFim+yV/lIzw5aU4ut7EUeSh65nU/6y+eIgooutS8CVMVKo3iq5
	xOKRLrc8B7Zdkt0dq2/z/osqtUlzYqfzDF/S47Alb3RM4Ysgf57/4sa5gFDA2JSM6aPd03Cn05W
	E9T27pROPoYR6MrECUrOF+taTcNMOM099IEw7QcODzp0ZnqA==
X-Google-Smtp-Source: AGHT+IEPKN9ig1SmVj1r8aKUz0n3VdZ1BtKrDstgoQy287j01bQoX3YsT6ulbwJFZvNqLbpgmaa/Ig==
X-Received: by 2002:a05:6402:1473:b0:640:947e:70ce with SMTP id 4fb4d7f45d1cf-6479c4431b5mr1258903a12.5.1764756024703;
        Wed, 03 Dec 2025 02:00:24 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v15 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Wed,  3 Dec 2025 11:57:05 +0200
Message-ID: <0518a53a9e20f37a275ac9e507c2b8be8b2a809c.1764755558.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764755558.git.xakep.amatop@gmail.com>
References: <cover.1764755558.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

The "xl resume" command was previously excluded from Arm builds because
system suspend/resume (e.g., SYSTEM_SUSPEND via vPSCI) was not
implemented. On x86, this command is used for resume.

This change enables compilation of `xl resume` on Arm regardless of the
underlying implementation status, making the tool available for testing
and future feature support. The relevant libxl infrastructure and handler
functions are already present and usable.

Note: This does not imply full system suspend/resume support on Arm.
      The `xl suspend` command still does not work on Arm platforms.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
Acked-by: Anthony PERARD <anthony.perard@vates.tech>
---
Changes in v15:
- no chnages
---
 tools/include/libxl.h     |  1 -
 tools/xl/xl.h             |  4 ++--
 tools/xl/xl_cmdtable.c    |  4 ++--
 tools/xl/xl_migrate.c     |  2 +-
 tools/xl/xl_saverestore.c |  2 +-
 tools/xl/xl_vmcontrol.c   | 12 ++++++------
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index bc35e412da..14b9e4a859 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1145,7 +1145,6 @@ typedef struct libxl__ctx libxl_ctx;
  * restoring or migrating a domain. In this case the related functions
  * should be expected to return failure. That is:
  *  - libxl_domain_suspend
- *  - libxl_domain_resume
  *  - libxl_domain_remus_start
  */
 #if defined(__arm__) || defined(__aarch64__)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 9000df00de..63db30a6eb 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -65,7 +65,7 @@ static const char migrate_permission_to_go[]=
     "domain is yours, you are cleared to unpause";
 static const char migrate_report[]=
     "my copy unpause results are as follows";
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
   /* followed by one byte:
    *     0: everything went well, domain is running
@@ -130,8 +130,8 @@ int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
 int main_suspend(int argc, char **argv);
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 int main_resume(int argc, char **argv);
-#endif
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
 int main_unpause(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 06a0039718..bcb2d233cc 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -198,12 +198,12 @@ const struct cmd_spec cmd_table[] = {
       "Suspend a domain to RAM",
       "<Domain>",
     },
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
     { "resume",
       &main_resume, 0, 1,
       "Resume a domain from RAM",
       "<Domain>",
     },
-#endif
     { "dump-core",
       &main_dump_core, 0, 1,
       "Core dump a domain",
@@ -548,7 +548,7 @@ const struct cmd_spec cmd_table[] = {
       "                        checkpoint must be disabled.\n"
       "-p                      Use COLO userspace proxy."
     },
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
     { "devd",
       &main_devd, 0, 1,
       "Daemon that listens for devices and launches backends",
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index b8594f44a5..4b4a379aa1 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -767,7 +767,7 @@ int main_remus(int argc, char **argv)
     close(send_fd);
     return EXIT_FAILURE;
 }
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
 
 /*
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 953d791d1a..747094ec7b 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -270,7 +270,7 @@ int main_save(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-#endif /* LIBXL_HAVE_NO_SUSPEND_RESUME */
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
 
 
 
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index c813732838..93766f631b 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -38,11 +38,6 @@ static void suspend_domain(uint32_t domid)
     libxl_domain_suspend_only(ctx, domid, NULL);
 }
 
-static void resume_domain(uint32_t domid)
-{
-    libxl_domain_resume(ctx, domid, 1, NULL);
-}
-
 int main_suspend(int argc, char **argv)
 {
     int opt;
@@ -55,6 +50,12 @@ int main_suspend(int argc, char **argv)
 
     return EXIT_SUCCESS;
 }
+#endif /* !LIBXL_HAVE_NO_SUSPEND_RESUME */
+
+static void resume_domain(uint32_t domid)
+{
+    libxl_domain_resume(ctx, domid, 1, NULL);
+}
 
 int main_resume(int argc, char **argv)
 {
@@ -68,7 +69,6 @@ int main_resume(int argc, char **argv)
 
     return EXIT_SUCCESS;
 }
-#endif
 
 static void pause_domain(uint32_t domid)
 {
-- 
2.43.0


