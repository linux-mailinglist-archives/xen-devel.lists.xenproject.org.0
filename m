Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B98B106A6
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 11:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1055531.1423905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSe-0008HP-In; Thu, 24 Jul 2025 09:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1055531.1423905; Thu, 24 Jul 2025 09:42:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uesSe-0008FA-Fm; Thu, 24 Jul 2025 09:42:00 +0000
Received: by outflank-mailman (input) for mailman id 1055531;
 Thu, 24 Jul 2025 09:41:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t79f=2F=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uesSc-0007nR-Oa
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 09:41:58 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ffc2a90-6872-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 11:41:56 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-55b50590cb2so791353e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 24 Jul 2025 02:41:56 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-331e08e98aesm2418261fa.54.2025.07.24.02.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jul 2025 02:41:54 -0700 (PDT)
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
X-Inumbo-ID: 6ffc2a90-6872-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753350116; x=1753954916; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pex6Ej+2o+mdbgt0MgnBZKJZc6lsBhLQsNhwotC5eNw=;
        b=m5f+9lxNBwBOlVRtXfexTAdVgrCjvs07NRD9OtCClH3iXDX2+jdHU7TWKlXsFXfDQ8
         cJLPCSibmNO01GbqrUW0+MQWCVeayVw1Iu1qwE62xYudKdbsbq+mapfs1h/mwux5Mn51
         8UWhIGXEYPK3lDh9flDS/G+Mq7mzyzAGMi/xvjcUriE8UfzdUKD/uOywqyWu3KT1H5mT
         NxSiMxnlS0wwPE/92ltoYofTA1KNoOL5WUcG0DA/QPzjgcuOoQC/w3y0qAUO9A4kfLpO
         ZA054+i122T/bTZEhb/Efca/356yDbM1qT4iJEmoCUPGsj8IeIsjalwGGGirYhFOP7UX
         NYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350116; x=1753954916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pex6Ej+2o+mdbgt0MgnBZKJZc6lsBhLQsNhwotC5eNw=;
        b=l8yEYHdbzLBjOWGUbuDjOht7HJfOINcawraC50fP82/se7QKBu/2t3EE/WuqrsRq9g
         Rrnka/OzJT7JPhLGfjgjGEStEldeT1ATHHXhCECHk4UfEbjX53OALe6b0cKYx+Fgip8C
         WL2qs68+D5rSoan224OF0XdjnDTh/abVX9qNXUaW3IEMbqk/oaclpVVdMzowtJL9/rSW
         ShUHMf5lUM4LWuVjlBVfD50AQq1Dl+UkRRNu95HRdmXRtfcqEt48JXuL87yTnTrTbSNq
         sVNCAQjh+HN2gG0RWOAXG+hKmsNj315LQV8PI7smoENNQ5HbwxDjRBTm7YUxb+olYgaZ
         ICKg==
X-Gm-Message-State: AOJu0Yy0of20AIkmlT5BiyZxPyVqm4Nt3fSs+NFU22b+WOZ7CjvabQNA
	/27U2C3+iO/zilSagiyoVVRzJ3uK/Q48Pmf2ISVjkHHb3EJvdw85gRlmSPraug==
X-Gm-Gg: ASbGncu1Ptv5A8GcMJePxSLcpFkWJU+KNCVdStM/MqYl8XQoSimAPc9zGWiQOe70u7j
	OCGsreIS7WQbxCMObk+3Ai/oVpfLgGugaqecO6Xw/AZRnVA2pf7l1NfXYW85ZvYSDonE5kE4YZR
	8sAc/AHjAKUdNA8ZDFyaAAes/d14AzchdEYy6aCoLFkao+9xRBLKLcLr+ANb4cyilD5kY/JjbYd
	XlBb1zrgEtBwElD2WGM6wYE8EO4A0y4zpt70K3LP9WKi7KeOFjv4dN076Dcxj4oIaZy7rYyFmPY
	3C6n29X6rTFTXkwXcz8WQvwB72Boj2P0Htjdev1p3A+8jHC720AwwlX0KNswZW4hVuEXMNitN8E
	4n/jYBAONJBEMjuMD6PK+03oMfAS6jQ1PceC2aWQ70022KJJCMQWcI0vE94M+Yg==
X-Google-Smtp-Source: AGHT+IE0MQF8l25JjMYXbPcSZXJf3o8vuh5/gMD01xS+vVTBfObUuXV5mMk2AzaCkfgQZJk678w6Rw==
X-Received: by 2002:a05:6512:b1b:b0:553:1f90:cca4 with SMTP id 2adb3069b0e04-55a5135666amr1656946e87.13.1753350115359;
        Thu, 24 Jul 2025 02:41:55 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v6 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Thu, 24 Jul 2025 12:40:57 +0300
Message-ID: <48ea1dfb5bbcbc993332acb8508060d7cba342fc.1753349109.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1753349108.git.mykola_kvach@epam.com>
References: <cover.1753349108.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

The "xl resume" command was previously excluded from Arm builds because
system suspend/resume (e.g., SYSTEM_SUSPEND via vPSCI) was not
implemented. On x86, this command is used for ACPI S3 suspend/resume.

This change enables compilation of `xl resume` on Arm regardless of the
underlying implementation status, making the tool available for testing
and future feature support. The relevant libxl infrastructure and handler
functions are already present and usable.

The macro `LIBXL_HAVE_NO_SUSPEND_RESUME` has been renamed to
`LIBXL_HAVE_NO_SUSPEND` to better reflect the updated semantics.

Note: This does not imply full system suspend/resume support on Arm.
      The `xl suspend` command still does not work on Arm platforms.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in v6:
- Renamed macro from LIBXL_HAVE_NO_SUSPEND_RESUME to LIBXL_HAVE_NO_SUSPEND
  to better reflect the scope of this change
- Applied cosmetic changes based on review feedback
---
 tools/include/libxl.h     |  5 ++---
 tools/xl/xl.h             | 10 +++++-----
 tools/xl/xl_cmdtable.c    |  8 ++++----
 tools/xl/xl_migrate.c     |  4 ++--
 tools/xl/xl_saverestore.c |  4 ++--
 tools/xl/xl_vmcontrol.c   | 14 +++++++-------
 6 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index d6b6e5d2dd..632264912a 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1128,17 +1128,16 @@ typedef struct libxl__ctx libxl_ctx;
 #define LIBXL_HAVE_SIGCHLD_SHARING 1
 
 /*
- * LIBXL_HAVE_NO_SUSPEND_RESUME
+ * LIBXL_HAVE_NO_SUSPEND
  *
  * Is this is defined then the platform has no support for saving,
  * restoring or migrating a domain. In this case the related functions
  * should be expected to return failure. That is:
  *  - libxl_domain_suspend
- *  - libxl_domain_resume
  *  - libxl_domain_remus_start
  */
 #if defined(__arm__) || defined(__aarch64__)
-#define LIBXL_HAVE_NO_SUSPEND_RESUME 1
+#define LIBXL_HAVE_NO_SUSPEND 1
 #endif
 
 /*
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 45745f0dbb..4d4a5bb1c8 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -56,7 +56,7 @@ int create_domain(struct domain_create *dom_info);
 static const char savefileheader_magic[32]=
     "Xen saved domain, xl format\n \0 \r";
 
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
 static const char migrate_receiver_banner[]=
     "xl migration receiver ready, send binary domain data.\n";
 static const char migrate_receiver_ready[]=
@@ -65,7 +65,7 @@ static const char migrate_permission_to_go[]=
     "domain is yours, you are cleared to unpause";
 static const char migrate_report[]=
     "my copy unpause results are as follows";
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND */
 
   /* followed by one byte:
    *     0: everything went well, domain is running
@@ -124,14 +124,14 @@ int main_pciattach(int argc, char **argv);
 int main_pciassignable_add(int argc, char **argv);
 int main_pciassignable_remove(int argc, char **argv);
 int main_pciassignable_list(int argc, char **argv);
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
 int main_restore(int argc, char **argv);
 int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
 int main_suspend(int argc, char **argv);
+#endif /* !LIBXL_HAVE_NO_SUSPEND */
 int main_resume(int argc, char **argv);
-#endif
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
 int main_unpause(int argc, char **argv);
@@ -202,7 +202,7 @@ int main_cpupoolnumasplit(int argc, char **argv);
 int main_getenforce(int argc, char **argv);
 int main_setenforce(int argc, char **argv);
 int main_loadpolicy(int argc, char **argv);
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
 int main_remus(int argc, char **argv);
 #endif
 int main_devd(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 06a0039718..03f0970bb7 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -152,7 +152,7 @@ const struct cmd_spec cmd_table[] = {
       "                         -autopass\n"
       "--vncviewer-autopass     (consistency alias for --autopass)"
     },
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
     { "save",
       &main_save, 0, 1,
       "Save a domain state to restore later",
@@ -198,12 +198,12 @@ const struct cmd_spec cmd_table[] = {
       "Suspend a domain to RAM",
       "<Domain>",
     },
+#endif /* !LIBXL_HAVE_NO_SUSPEND */
     { "resume",
       &main_resume, 0, 1,
       "Resume a domain from RAM",
       "<Domain>",
     },
-#endif
     { "dump-core",
       &main_dump_core, 0, 1,
       "Core dump a domain",
@@ -524,7 +524,7 @@ const struct cmd_spec cmd_table[] = {
       "Loads a new policy into the Flask Xen security module",
       "<policy file>",
     },
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
     { "remus",
       &main_remus, 0, 1,
       "Enable Remus HA for domain",
@@ -548,7 +548,7 @@ const struct cmd_spec cmd_table[] = {
       "                        checkpoint must be disabled.\n"
       "-p                      Use COLO userspace proxy."
     },
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND */
     { "devd",
       &main_devd, 0, 1,
       "Daemon that listens for devices and launches backends",
diff --git a/tools/xl/xl_migrate.c b/tools/xl/xl_migrate.c
index b8594f44a5..a8e2c39944 100644
--- a/tools/xl/xl_migrate.c
+++ b/tools/xl/xl_migrate.c
@@ -30,7 +30,7 @@
 #include "xl_utils.h"
 #include "xl_parse.h"
 
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
 
 static pid_t create_migration_child(const char *rune, int *send_fd,
                                         int *recv_fd)
@@ -767,7 +767,7 @@ int main_remus(int argc, char **argv)
     close(send_fd);
     return EXIT_FAILURE;
 }
-#endif
+#endif /* !LIBXL_HAVE_NO_SUSPEND */
 
 
 /*
diff --git a/tools/xl/xl_saverestore.c b/tools/xl/xl_saverestore.c
index 953d791d1a..cb10b869b9 100644
--- a/tools/xl/xl_saverestore.c
+++ b/tools/xl/xl_saverestore.c
@@ -29,7 +29,7 @@
 #include "xl_utils.h"
 #include "xl_parse.h"
 
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
 
 void save_domain_core_begin(uint32_t domid,
                             int preserve_domid,
@@ -270,7 +270,7 @@ int main_save(int argc, char **argv)
     return EXIT_SUCCESS;
 }
 
-#endif /* LIBXL_HAVE_NO_SUSPEND_RESUME */
+#endif /* !LIBXL_HAVE_NO_SUSPEND */
 
 
 
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index c813732838..49484ca3e2 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -32,17 +32,12 @@
 
 static int fd_lock = -1;
 
-#ifndef LIBXL_HAVE_NO_SUSPEND_RESUME
+#ifndef LIBXL_HAVE_NO_SUSPEND
 static void suspend_domain(uint32_t domid)
 {
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
+#endif /* !LIBXL_HAVE_NO_SUSPEND */
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


