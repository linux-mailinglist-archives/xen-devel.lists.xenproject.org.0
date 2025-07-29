Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92613B14A77
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 10:52:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062243.1427900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4X-0006W6-KT; Tue, 29 Jul 2025 08:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062243.1427900; Tue, 29 Jul 2025 08:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugg4X-0006Rh-Eu; Tue, 29 Jul 2025 08:52:33 +0000
Received: by outflank-mailman (input) for mailman id 1062243;
 Tue, 29 Jul 2025 08:52:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R+Pi=2K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ugg4W-0006C0-6y
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 08:52:32 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cd43c03-6c59-11f0-a31e-13f23c93f187;
 Tue, 29 Jul 2025 10:52:31 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-553ba7f11cbso5731660e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 01:52:31 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b63375ca4sm1584998e87.124.2025.07.29.01.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 01:52:30 -0700 (PDT)
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
X-Inumbo-ID: 5cd43c03-6c59-11f0-a31e-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753779151; x=1754383951; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+sWQJKeBDFdiPLTp8aPAqIiX1r4WoXR6KMm4vOtk3U=;
        b=Pq6kqr6sVBRdRK8V6d7GaMVREcMFoitMcgbGv+yMDi1jPomNBtBIK3Sqmspzq6SJDw
         foVyEOZp5A9D2bl1T8CSGGEiLuGcVLJoW505ZeHUatQlAO5VemrQy3JzAe0S1A2LNaEY
         8xagiUDwz/82ZN10fQuHVDdZ6sx4QtjAWOnwARajpzCwv4j0f8jFA9oQxFxCGXt/8d/U
         at1rtoR14GP0bzgo1VMn6/g4ao/KDXIhq2W+UgoUdHXX8Tu6xiQnc/PH7P2+at7l3emd
         2XgQdDk8U6G0eG0yqLLP/9mWGPaAufzpT9P+qy1L3grHWu5o83mJRyhHXK1dcVi9eQrN
         sXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753779151; x=1754383951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+sWQJKeBDFdiPLTp8aPAqIiX1r4WoXR6KMm4vOtk3U=;
        b=Z11bn0CHnCI4UN6Zjd84Hm/8HxmiAoL0Yax/ZMWk0T5kzADcNoLmygi0koa197Gf1a
         X4qdfJsH2GG5Hd/Mhz3nfGwuJmE2ug0GL1/HIiQICg+hYBIVA6wfrwwFgY5+OSEmrD/t
         1djINsZcr/7CvWxRtUrE5POanFLMo+J2ruDPNKTcAgj8PazMW0TuMEd9/6v1i3E+NoIt
         EVQfzmcLGHp8+yl2lYUYEIljbgmMES7k60wXyd6EFoqrLQ8Z25cHDflMp+uGpiGJMj5q
         da0omQB5M74KL2/VzUfWEHJTVJMa2UG5YJceCR54mp0lsw6q825cTUW3+rYjRCMk4inB
         1r7Q==
X-Gm-Message-State: AOJu0Yz3XlvBdT5lJxp0rASwqGesGmcn5/MltzJhzcLF4rz3fOROC9qq
	Hce0GLzwUGUhH1Y8IG9vYgYWRtgXdxE4JYUsy7cN7g6IBOJ4en+4Xo3UOX6Lig==
X-Gm-Gg: ASbGncsU1N1drwTiOYDvMUxqV9l1gJNfZMmQ1SCmXY6So5uSzBty1GCv0mmZ2vFCyIw
	ZHiejv8553vO6KktH8Hs8/B4Wu9rjYu5wmUNvKSu2jA2c8+1bhmLsq9qp0q3hc5Kbqkgge34UFd
	SUHCAovAhVMPA7b2WyeBWuiADJrvqboF2U86j0VdmY3ZxsKHwhgpJsZviOySlyRf/rkjUDcP7Si
	EpHGUMoCHEa3Ho0dOCvHC0nqIJn6Rkke1zxg8YrYIDyPmVH/6OjyLgDx3YMftIFCuWhK6TOZIpX
	rJIu9cdykPh3AIp4JVCUHBYo2A8JQYcJSJktDbzwNJKX6spDug8to4mRjadU/hukq0bf+Jn+OkV
	RG5ITfeuSMs3/Qkr1iqK3xAmg/H9HnvEAB2G5Y+TsBw1xpOBPrAY5VUbZsHExukTbjYRo/KsD
X-Google-Smtp-Source: AGHT+IHOmZXLHkYG+xZYnthWDLlRakbFM8nUItbevJL3N6gcww1XX+UgFct4ylmqMR6B7g4R4YZ0nw==
X-Received: by 2002:a05:6512:a8e:b0:553:2dce:3aad with SMTP id 2adb3069b0e04-55b5f3cf7c3mr3959045e87.7.1753779150596;
        Tue, 29 Jul 2025 01:52:30 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v7 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Tue, 29 Jul 2025 11:52:12 +0300
Message-ID: <1394ced0f1268244bfe4875152874f3f8ee0378a.1753778926.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753778926.git.mykola_kvach@epam.com>
References: <cover.1753778926.git.mykola_kvach@epam.com>
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
index d6b6e5d2dd..94fc0354be 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1134,7 +1134,6 @@ typedef struct libxl__ctx libxl_ctx;
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


