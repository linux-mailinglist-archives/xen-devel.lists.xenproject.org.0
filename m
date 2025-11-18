Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 710BCC6A5B6
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 16:40:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1165057.1491894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo8-0004xY-2A; Tue, 18 Nov 2025 15:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1165057.1491894; Tue, 18 Nov 2025 15:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLNo7-0004sR-TZ; Tue, 18 Nov 2025 15:39:51 +0000
Received: by outflank-mailman (input) for mailman id 1165057;
 Tue, 18 Nov 2025 15:39:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n9C8=52=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1vLNo7-0004pf-5y
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 15:39:51 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d0f0c1a9-c494-11f0-980a-7dc792cee155;
 Tue, 18 Nov 2025 16:39:48 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b737cd03d46so474861266b.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 07:39:48 -0800 (PST)
Received: from EPUAKYIW02F7.. (pool185-5-253-54.as6723.net. [185.5.253.54])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b734fd80d27sm1391385266b.40.2025.11.18.07.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 07:39:47 -0800 (PST)
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
X-Inumbo-ID: d0f0c1a9-c494-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763480388; x=1764085188; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtJsp+Y7Ad5QPg8ye5d7pLJWb0PeKCJcdGH4glFeQow=;
        b=MrlxMqFr13zKyf25Us093sbrZ3A0US66KoR0Ga8XCFAFz2X3zivbM2wuoDV9eU6cz5
         BhfxrZbIxny8as+RF7U+jOYK8t+vI7TsMwoTtH+MBkz94UiXfjQdImtwRfWeMC5VbFbt
         ouTQzvbOGHaj3dK6c29fYTx/Vsb3tsxnOVo/mzw6JMOEmzAglUZsnk30jD37C/dRiLDD
         x+itJz+/DMXLCe0LLmeIlgsN0ZAZSaDBi0HeKJObUrNNq4MiGx5idcnVmJjeIii0ePUd
         MApIEEEYMRMNyPeEwY6y4RVSo8VmEKIC74UAj1h76ICe5guDxPJgSCKV7IkOQmUkSK8u
         hWbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763480388; x=1764085188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtJsp+Y7Ad5QPg8ye5d7pLJWb0PeKCJcdGH4glFeQow=;
        b=nNB0WKrvYokoekFsga5Y9pV4KTa9PCRCEtkPDe+k7OUpMfuwVb+wV/nbAqViSC3Rfe
         PQIg3eoDCq6Pk7mQ7Wk9GIuhpoCykAr/Iw5CS5K/ULJ2ihBxZ8Kc5859Y1HB6zW2DVPM
         YzRGvKzxTICZFiGlxd8gBi6lydu7SzKi/dW6bIv3O0oOj9Vsg+Qw3ZxXBRK1KUar3pTY
         wnmfYG1ErNXo8PXziwYY7lwepVt9SiX9/y32uNVWPqmjbZQlsf7n1w3A6KpZhrSzOx/u
         u9fj3MvmRn6rovAGaabGv0pcNL+/n3PrR+Ve2CyNcJmwDFmpObsX/6iBPTiRSKPiqmL9
         AAJQ==
X-Gm-Message-State: AOJu0Yzuhx9Fcj4kaAUOPc5lzrhi/zCXX9DytLChZGpJ12WEn3uzt3Hr
	ljbICLKwRxNPGSJbjeL+b2Qe9Ed99NXSxHOW7ZXRaidclZTEsY1VsjUx69U7X+Y3kHI=
X-Gm-Gg: ASbGncsHkNt5MCDrqcVI2TvPqxRNEO2HoBlMQNP+R+pWklD6eh0fqj2cTth6mgYPDQS
	wmc6Dulym75KMiW7aWeQqQeC/f/LxM+3f7dVXA8AU+EUheMRWBQ+IeHrULfGeo7ganeeufmFZ/u
	kRjFh9NZkiRGs5Htk+fXfQtsMv/vIlUJTW+xPtoGE2KVfieAxxjHZ+94KWQxoajpEObkerRwaeX
	9VfbhgUIIUTEB+pgxJfQ03xo6dRzSkmt081yurOlrwvLXvqKzPibVDC314WGjR8OzhMo/9IddW+
	EHWqSbqUCL7P+3IflVuuXnBn7iw1YikHjt6PBuWGhHF7nkB01Uxro8ul+/F0x3esDrNzcmerXBK
	vk9bf/MwFrLpMUESrB+B5J3vrhbAEO6APm/y68hVIM/pVlgJha0gP3FZu6gjF+OBzcE9jXmlm0+
	4iEd+0S6QOAORI7sFGTB0M8NGgVOKaIgTr99Yciif2o78=
X-Google-Smtp-Source: AGHT+IHN7q6Juj4WaqvIxtRIkp31ytolu4qwoxqjU7orr59NszcHd7IzkMLpwOP27ZHwRVXKLZuiLQ==
X-Received: by 2002:a17:907:3fa0:b0:b70:b13c:3634 with SMTP id a640c23a62f3a-b73678dd5c0mr1785833666b.25.1763480388000;
        Tue, 18 Nov 2025 07:39:48 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v14 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Tue, 18 Nov 2025 17:37:29 +0200
Message-ID: <78e37e1b1d2ea50568a372d8950f4fc9e86567eb.1763479083.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1763479083.git.xakep.amatop@gmail.com>
References: <cover.1763479083.git.xakep.amatop@gmail.com>
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
Changes in v14:
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


