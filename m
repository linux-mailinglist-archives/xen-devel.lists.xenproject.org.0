Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A977BB3F985
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 11:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105852.1456712 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvq-0001H1-KP; Tue, 02 Sep 2025 09:04:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105852.1456712; Tue, 02 Sep 2025 09:04:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utMvq-0001D3-Gr; Tue, 02 Sep 2025 09:04:02 +0000
Received: by outflank-mailman (input) for mailman id 1105852;
 Tue, 02 Sep 2025 09:04:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X/no=3N=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1utMvo-0000FE-RS
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 09:04:00 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c036c170-87db-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 11:03:54 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-336bbcebca9so27128181fa.1
 for <xen-devel@lists.xenproject.org>; Tue, 02 Sep 2025 02:03:54 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-560827aabf5sm524019e87.137.2025.09.02.02.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 02:03:52 -0700 (PDT)
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
X-Inumbo-ID: c036c170-87db-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756803833; x=1757408633; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=Mrw+WBgRuEPBe/fKIgym6g029AmtebPFYdTWgpyryjuY7ONrd1nqBN1gAz7kxCfZMf
         95VxTGF2bdac1EWNKGlZklXMSn4vRnPQ2TeBeAPYMwLHu2yITF9kPgUM94fbc8rrEETq
         NfPUDskod38zj0/cEZEm4dtZk9IlKVdgnIK2F/rYA4rfgmwwlUKzCPcaAtIJNDgsSpxO
         N51TLV+8HLTFg+ZovxgbcO/kmz1Rxh/affSmh5WYrapUlYnrLgDl/h0PEicdU7IaXRgW
         kvNlnPEZGiP26gLs5w0avRVy+QWrBobkeCTSHitsjDQHp3WrRHXAxpI3muV7DGUmGmZW
         Ro5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803833; x=1757408633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=CmnIhyyyPYnx7ki7LvnLxbRC3Si+V8z0zvqKCg5jJJeQqQK36cMutPSlH2h8EItD1p
         8/8NOcloseQSZlU3enQg8XtatiyW0FQlF2Xxj2QxD2wulgBuGGMUg2PX9JJABV4Fq8GN
         VQv6fBq5AaapF16t60OEN4dYhtU4Shz35xjk7KA5vPNngdmGAc5sha74+rqsi+LsKgv5
         W5tOGaPXyBgt+LySeJYjHT1bMy7hj5wPMqvIJt7UXSotLKb6XYnQyoWyrqdN45GusHxE
         bKAFKkz6RN30FG5Dh3wp0j2bAnfYkWnTqxSKjMEKgN6sNMMGtAUFgaTQSmH2ZxQd1xEX
         Wp/A==
X-Gm-Message-State: AOJu0Yw82+HvFvbPmihKq2jTHxEemZDj7k1OGyZMm5cc2U0wzuHVY2Qt
	h4vDTLBECRHQ0Uha1KdX5bNefLIEYQWotZSeoti9YoxGxiQn5AOuqQTrihw3oApv
X-Gm-Gg: ASbGncus30o4RK1RXUu9p29A8dNT+fer/rjTCl2nT8n/5X2XDXu5SH2ZXwUAsO9fbS2
	kAovmeihLneoLQC2n9xvAUChImb6QFYTYinKzp9UgsOf2a3raNyBM/Ohqb4AU+U/08vwODlpPvt
	UYfvIx+0NVyd2E+fuWNNUbBKW3N65gRh+RFgxrwf3vTWbHhI0aQKiOIqSPjDM6nHRAuBkBjWs7v
	vHA6hMU2oykNQkmqfhPf4sBmUexy0TEra4uuMMQL2yMGlaLoU/95/Zbt/Nl2zT9aZPy78GElQVn
	V72IEGpgE4XvN8S7MmaljeAzGJJMNGZXxveeSiMNkwhdJXcP9Tsq0zGOWwoOW6bHkEi6bGb63J6
	d6WUuovB1a2fYuxcMNGNWsv9TI94MHL4HpTe7r3BY+GZS5/kVWiS3y5hWvpV1dQ==
X-Google-Smtp-Source: AGHT+IHWIeHHjMI4/q8ByA7QG0siSIFWtMD4pXqXFl9/kNEueqD20PIykgcXRmt500riGkhpKcKNMw==
X-Received: by 2002:a05:651c:150b:b0:336:e0b3:235a with SMTP id 38308e7fff4ca-336e0b33082mr22657221fa.8.1756803833160;
        Tue, 02 Sep 2025 02:03:53 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v13 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Tue,  2 Sep 2025 12:03:46 +0300
Message-ID: <6553b10eb258b6f3a481d70d535731b397607c75.1756803419.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756803419.git.mykola_kvach@epam.com>
References: <cover.1756803419.git.mykola_kvach@epam.com>
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


