Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C08B1DD84
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 21:40:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073700.1436582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TB-0003vq-8x; Thu, 07 Aug 2025 19:40:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073700.1436582; Thu, 07 Aug 2025 19:40:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk6TB-0003ra-3b; Thu, 07 Aug 2025 19:40:09 +0000
Received: by outflank-mailman (input) for mailman id 1073700;
 Thu, 07 Aug 2025 19:40:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uk6T8-0003Yg-UG
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 19:40:06 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 517a9fca-73c6-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 21:40:05 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-55b8b8e00caso1646312e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 12:40:05 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b8898bfc6sm2759188e87.10.2025.08.07.12.40.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 12:40:04 -0700 (PDT)
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
X-Inumbo-ID: 517a9fca-73c6-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754595605; x=1755200405; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=Fjkza2zmh2l5E+cZhNCKsg5Yvi+tUOMiAn1SFO94o1AY4hfqKZqTdGg5z+Y6JX4gwX
         FTtSChmRaT5sW/cPEexRXwB46eX2w+AFr3lJHxm3+QSs8esUubwI7JM6vKf06PWg03kh
         UI1tChyJl8hWeI7I7EkymKxdY1SfFdDIDOAGEJi6dSgd5RVRlH8pOONsmrbm/ws50gzX
         mLPUAXJpOVgW3KOw++9EuQLqcTGCnvo1qdBBz9MfucFbPNl8gTq+3gX0YpyAUyy7T68z
         0aHJyQoDJOfXKiJ0Fcdr/nRa8HBK1SVmSL4SVVsZIk98fRemPORHZUPLXNSphpMTrZdA
         ME0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754595605; x=1755200405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=dExmHx++cdxipzLO5hNWp4ka8M4pgm2TKeNIX7wPV5BRqIMb3OG0nbm6H5PS2um53D
         xZDk6DMhY74gMAodYNfh/U/JeI1lntwKYYyqJ4TfsRtVBkCS1qAfGt1Ydtd7cC27wtxA
         s2JZE6FXYO9b7l8lf4q4akYIsiBOic7924dt7KXw9NNOvDmP9618CU7KzlEb2IiLYdoA
         CiQE9/22wr1aOYwDVI5yyin8PJ5Vl7vviMPqp1GA/85Ios4qKDaDX/+E7btNAg/VfZHG
         8WjSL2oPAshQ0LwnXWnSys1RIqPTnXEL7992QMribduhqzRZz5L/uXaTtfH6c0BIjmF4
         Huyg==
X-Gm-Message-State: AOJu0Yytu24YdrJ0zB7k1daMxUwQwpexq7ENGlj0Dr/qHdwWdUk7rh6T
	adRRfsPVwyGCHcvVxKt3IPhQcXyxmjddbDptV7e+ON1bLYATdm3zV08XKHOU6t2T10Y=
X-Gm-Gg: ASbGncvXHJNAmEo0KUpNRtFYVN7DvNE5AphNDfBJ/ApQxpkB+RQ4Y7ECuPzv0+Pg094
	iidkDObwuPatjVI7uOBMCYEfC+riU7vuaXtI704FcSmML4UYwj3ENOSV9033UngItFH35njPOs8
	i+c1CBHQT7Cd/UfA/4rdz9+zF2vmjffI3XVQ9qUlpjbtKlZfx5V1nANfcYNajlC5bNgj5NB8whw
	XMhMi+rue4n65HmnsQlbFzAPgoEPkMmGP10Ldh8VLIXp3JcHPEnAuwx/W+Gotf5gN9uioFmqnS1
	GaLfoT8rRL6VCCyNK7IECreydMEOV0AsmSlC/K2B2gIGf7fJPPSlYtLlQ4YS6FY8L+WZ+eFyoKo
	ZqrNqXV0F74woLLO/y+oTUcpjgmZv8lYgozEAGRZLB4k/XR7o5lJhvG5exGmahw==
X-Google-Smtp-Source: AGHT+IHdckCE7TiG/8zuVJAAQKkrn/Dz72NRaBEBYSXYLEPrGbCVJrfIM5mAHyOtZQ2IC9q9ld3OAQ==
X-Received: by 2002:a05:6512:130e:b0:55b:9424:dda5 with SMTP id 2adb3069b0e04-55cc011952emr5500e87.44.1754595604816;
        Thu, 07 Aug 2025 12:40:04 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v8 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Thu,  7 Aug 2025 22:39:26 +0300
Message-ID: <d9320d7ef2deb330f99a0b20d9f9cf3c8d7d4f70.1754595198.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1754595198.git.mykola_kvach@epam.com>
References: <cover.1754595198.git.mykola_kvach@epam.com>
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


