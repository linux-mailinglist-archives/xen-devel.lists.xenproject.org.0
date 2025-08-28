Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75EBFB3A2C3
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 16:54:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1099033.1452964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1B-0007MV-Je; Thu, 28 Aug 2025 14:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1099033.1452964; Thu, 28 Aug 2025 14:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ure1B-0007DZ-AJ; Thu, 28 Aug 2025 14:54:25 +0000
Received: by outflank-mailman (input) for mailman id 1099033;
 Thu, 28 Aug 2025 14:54:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mimg=3I=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ure19-00074Y-KN
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 14:54:23 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e14836fd-841e-11f0-8dd7-1b34d833f44b;
 Thu, 28 Aug 2025 16:54:21 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-55f3fc15e09so1120092e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 07:54:21 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f42101509sm2635661e87.106.2025.08.28.07.54.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Aug 2025 07:54:19 -0700 (PDT)
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
X-Inumbo-ID: e14836fd-841e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756392860; x=1756997660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=DlfdhW2hY/jl+/E7YN1CemCzvKyI8PiPPZT8Iy4tc6IE6SZKmf/KgfqECreNHr6OE9
         daInHWuqgH8ozXF21JWu7T3ACmUiT2sz8U9EzHUrWUdlHuw333hVxVIkaF5hZuMbZjRr
         ED7NZyPWIfukpco9rnPiyKWFeBBgP7nu4/V+E48BSbAQtt+de5TUGfgcPZDbpjIQVWIs
         cw3dGnqB9ggIUy9RPlXto4P+mgNdSQfU5KXhFDnv2wBQnviXZLTSyjixp/oa97DuF+6p
         yTMVDQhQ20tR63psAaChrqrq7mosYWMyThEUyKHOtXmYagIhnjQLhRpMnjYc5+XHZtqs
         ZuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756392860; x=1756997660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=m/8Ovwv89IZrY6Ky7yk9uXlEU1Q6yO0FyHYNsRjQheEBXgzrvUbPyRm0DaKYORT1NQ
         Rv6PdE45w4vjGaR3+1n8as1hRJUrSj6/Va5Sdo/k5hFbKb99Vozs5OjHR7GaochDhA+S
         sUSofTkk8zULQnTv262zfvAiHJaBtR7sKTN1R8xGdBvujg/IFrP8ukavBcLLtujHa7vO
         ZzvgGfLH+JKnafmFtsrkr9+LU8+9fMVnhyKXVnHhMWGtOZmeAguanp7+cGvGWSB0ML+i
         sIUiofSK8dYAIywAtsox7/rWG0OCuQ2bL+VqEWCwUMmrPf6Uw6hDR4z2i8EiOcGuYEEk
         mdYg==
X-Gm-Message-State: AOJu0YwWyIAnTsgOzbvfAE7p17LBb7KpU6bsERzqWL4O0klk9VgDCoqt
	CZ8e/FZxeDVYpkdFfyPBUjLGQGkod33gwnn0NQlf1geuMjqySPUSz6UMmjYYgw==
X-Gm-Gg: ASbGncuPFwV4zxrtG7U9Dk+2xXLb7d6DulQoqtc01BOwVV19fAumPMDhtTQDO3pg2aO
	C0y/+C7Z83y+JVwpMgqrQZFe8HulMMW1gfAetkkfvPtEB5BDnyRxdbHrVYmapq5pPA8ZeX9CFT1
	PmFEZA1bHVNMt6gkVM5lu1+5Q6aDGQBGGNW4MdftIsu3+LbL2RZDlZr5WbS5sTGhVDlsK27H7iE
	SaOcZA9fG2jQp9mQMTJ6gaAkz04/3CGbbo1czXoTPnhySkhVIMgPXJ5GhEdmLHV+8Jp6A+GVcHf
	SKqADCEiiOwlclRbsjwM1u5wsKorerjfJsNUJmBf3OMVIAebwbQu3b4FI9064B2hn7bw4axDnrh
	nTPuDA8DPQsoCalB7DuL37qxuJMzSHO723MIdXMOKjDqqX5NDuU0lKlc/1sPnhQ==
X-Google-Smtp-Source: AGHT+IF0KzeE8Ug4viy9lY6uK85pKNO5bQ1smWxObDJalZkHecuTFyErGv1hdcu99okAdQfuqdIvwQ==
X-Received: by 2002:a05:6512:438b:b0:55f:4bf6:efeb with SMTP id 2adb3069b0e04-55f4bf6f674mr4119534e87.43.1756392860229;
        Thu, 28 Aug 2025 07:54:20 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v11 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Thu, 28 Aug 2025 17:54:05 +0300
Message-ID: <71189bf8f220b678829b8d58f4aa9a4877156eb4.1756392094.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756392094.git.mykola_kvach@epam.com>
References: <cover.1756392094.git.mykola_kvach@epam.com>
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
Changes in v7:
- dropped renaming of LIBXL_HAVE_NO_SUSPEND_RESUME macro

Changes in v6:
- Renamed macro from LIBXL_HAVE_NO_SUSPEND_RESUME to LIBXL_HAVE_NO_SUSPEND
  to better reflect the scope of this change
- Applied cosmetic changes based on review feedback
---
 tools/include/libxl.h     |  1 -
 tools/xl/xl.h             |  4 ++--
 tools/xl/xl_cmdtable.c    |  4 ++--
 tools/xl/xl_migrate.c     |  2 +-
 tools/xl/xl_saverestore.c |  2 +-
 tools/xl/xl_vmcontrol.c   | 12 ++++++------
 6 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index 185f74d8a8..b204fc5e2e 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1140,7 +1140,6 @@ typedef struct libxl__ctx libxl_ctx;
  * restoring or migrating a domain. In this case the related functions
  * should be expected to return failure. That is:
  *  - libxl_domain_suspend
- *  - libxl_domain_resume
  *  - libxl_domain_remus_start
  */
 #if defined(__arm__) || defined(__aarch64__)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 45745f0dbb..9233b73f85 100644
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
2.48.1


