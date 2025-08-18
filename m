Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B014B29CB4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 10:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085664.1443980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ8-0006Q2-8C; Mon, 18 Aug 2025 08:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085664.1443980; Mon, 18 Aug 2025 08:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unvZ8-0006L1-13; Mon, 18 Aug 2025 08:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1085664;
 Mon, 18 Aug 2025 08:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HFvU=26=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1unvZ6-0005gf-Ly
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 08:50:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5410581f-7c10-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 10:50:02 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55ce528022eso4210518e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 01:50:02 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef351579sm1571950e87.4.2025.08.18.01.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 01:49:59 -0700 (PDT)
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
X-Inumbo-ID: 5410581f-7c10-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755507001; x=1756111801; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=UJilwVKl8v1Hiym+CCGJObk6o8weilog7NRSjetJglxjcdzH2H4nmPHEIf0XRtOZFf
         3Z8t1EPSkqIeiSPfwgb08dE4FcdkLv4xY3VtJmLgJ+MVUXhL8YIUsC54yG2ucyT0RM0J
         n6l168AVwcPIbQQSqnzBdZ5iiSWEK09QGmYhsvxbvbOkZS+XUm49g/Ju6AAMwbBjrplh
         XrNfsnzQdnUSMeFp77hibPTNHMavAKs+8gw9xHGQb3C1Cf1rrPEYUwYu007Z+GIo9r/Z
         XCD2siahN1O58uu2LgBqCP9E3XH3xGTP7JH6VvH54wV9o2Bss+ZmLplJeNawJrCAwaDt
         Mjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755507001; x=1756111801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=oGHfiONwmkvta9XY5097PvPFg3+6bggzEehlZF4uS3UzSq6/i1D0OZ6UQkKvWj/KO3
         /0RIqKN+Uu5FLo7pm8IZMNFNud6rexTzvDR82LHFECqt2NG30MF1C2HTaPsf7abOJLqr
         S0RBzVMBFXaiaLQnOn6zMHIqfwP+0lc8jYJyquCu9swAznl5Zq8CI92qc1GrInkFpO7C
         cwHcQjf1tvuBXDY8aYheny2iDWugBIX44/7gE3iJuLWz4gJ1pt0Khz7kiqAxxiH++Ek1
         AFilMvLcHe53AT8hFQozKIZsXJx2V3FutIKb23U9j44Pje0qKxDSHa+eQyZ+6ssIaIDg
         3rXg==
X-Gm-Message-State: AOJu0Yx9mbt6RS8LF6WLyPaiiJx3qU/6Wmwz9vNTHJIU+dyN54NYpF2H
	dPJs8JUExIKF8zLl3inN7PZaobBDWRHBG1U3hpflx8r0vKBQXqZNTGHFknyNIQ==
X-Gm-Gg: ASbGncvd0sdi0htfmufs966pCSZmtrYTe+vr39aaJvM/R+9lN4Djiwiq9lcyc38H0vI
	09UrCyWhd3mY6nJeCKLowe1dAzYqQbyaLd2X05+m2iVBFdph4d3sV3VXfehiWHqNk0vGPAS64fB
	4obRDIq0bRah2ZpLu98tZuHVsFNv7cgE26Q1+pKIWjgobGYabeC9EJazQtJDrcChh7ZnKx9EGxS
	+rtGWA9dqMahANkdF0K19BSE40ItNwAnPwnirxKOYzXnRn7kN5d9HD9NKZ/J11X5qLBjVLqT9+8
	4Ie3EIuV3Ulf9T+phrXzlKmukBVGkaENtCQZxqXyE5FQiwWV6dfhnf5OGryHOt5TCSDfaMxb/+i
	oykFTd4FMZ9alu0AbhaqLPx38KHoR0hJOszeGtZTOv6W+Vg43ifVuZQ/Ih8HE+3thCCFeajXk
X-Google-Smtp-Source: AGHT+IERO8Ep+xUY8smoumIQzfhUwoe1nQke3+EHmR9SoaAFhFdmVrI9o4YNspXRsI1oGW0jo61fgg==
X-Received: by 2002:a05:6512:145c:20b0:55d:fb2d:3c39 with SMTP id 2adb3069b0e04-55dfb2d3df9mr106422e87.40.1755507000857;
        Mon, 18 Aug 2025 01:50:00 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v9 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Mon, 18 Aug 2025 11:49:25 +0300
Message-ID: <60c29f80837b0642fcf225aaff3cd2b07310c0ce.1755506449.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1755506449.git.mykola_kvach@epam.com>
References: <cover.1755506449.git.mykola_kvach@epam.com>
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


