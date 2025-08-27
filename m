Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3729B38B4B
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 23:23:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1096966.1451493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc5-0003xQ-8e; Wed, 27 Aug 2025 21:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1096966.1451493; Wed, 27 Aug 2025 21:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urNc5-0003o3-2X; Wed, 27 Aug 2025 21:23:25 +0000
Received: by outflank-mailman (input) for mailman id 1096966;
 Wed, 27 Aug 2025 21:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4G5n=3H=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1urNc4-0003ij-2w
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 21:23:24 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fcbe830-838c-11f0-aeb2-fb57b961d000;
 Wed, 27 Aug 2025 23:23:23 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-333f8d1cbcdso2561161fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 14:23:23 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3365e2687acsm29844061fa.32.2025.08.27.14.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Aug 2025 14:23:21 -0700 (PDT)
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
X-Inumbo-ID: 0fcbe830-838c-11f0-aeb2-fb57b961d000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756329802; x=1756934602; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=YQBmqZlvdNOlbS2xu5IXSjrxFAnA/+W/VAoYp3M7/1q7exH5ItRQlFLcFgkduZEmFN
         Q3CkMG9FmoMBVAa0UJW4dwfOlVmWRunr3sDKXqSCvwgbVGgNIoGTlAsdugSr+YYTPZFn
         l4Kv0fDGOnBz5Uj/I/52bWJoc3TpW0kS0Jf7fNkibO0Adtwzf62xPshICRXERXJCAoUC
         Y15H11D283Vxag6wV+XUm/aLHXpwspskf5fgcqvu4++jekiilsXNFmkPHBR0Sxk64jna
         2SyDxOFhcXobbRVLYF3WWsqeV56WRKs0ZsAkBrFB6mKwXDgBjx4b3eg7loIGBlM/T3tx
         srww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756329802; x=1756934602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=cvqbnxf6yAEOGJsgvKvzewvsRqXPWHcneIPczsXNbS19qYL75lmj4XTXvkX9aLROVE
         8TarEE4z4UzxFk+gSxnIAXL5LQuaeuSzt3mnh0LbE5ZeKCS/KjmlKhxJpmLCoSuF3xJe
         xmvTAiwTugzuGfErFIYIHPyjy+0Let3VW5a3xfGxQdR59n1Kf8KWSUYrYeIkBp5PIPsT
         zvRnDkvf/n3w6AzWU8m8RHn6YBwVRR0S/9IRbNZeZBMlL//ik1ekLalEDUZLnYScL0kw
         qg79BJb/SHz+yXuzYxrn0PG+CiuRhtHt99zsQV5zYXNI3aht90eXhT9zczWQ0N6hPfyD
         2HYA==
X-Gm-Message-State: AOJu0Yymy1O+/2/AH5DxHGcDctuzFqNXIJCWMD9Bv9DDqLF3Yh0Z6lIZ
	3W/54ks291I0rIwLj0h+7F7NKSXkqXaeJ4Wf4jZp9xnTjOvu3GRv+1ubThsdMA==
X-Gm-Gg: ASbGnctV+aYlyOzagSU5ipICu92aQPxebawUhofnOdzU8+2kvmyEApmuo6ktTVGJ8Lh
	n8GbnbS/AQ3svpriCWw4t4h5c58eFFqIxWzQXkBNs0LBKefe9KXUP6baZ7K1VxXsC1CgoxX+Jo8
	wt8fj24PlLRNzcz3HHX1o9xeSawDN/YhUV7o6USEGE+tq0takZnRbwJmPl9dNkIMdOmAV8vm0vz
	tzaHxa53GHLtNInjcrcOPKkYsgkOKlbMKhyt/sI7Y5+xnha3pKh6aIRV/KUBHX37cWAPjWAe/u1
	AqPkANCZiFT0d1r6S/b1bKuETKZ4BBGGOufzg52MZi8nbdXccCedSV3L97joAKAHkfICTuC8occ
	FkYR/40ljjTV6u0Ai6H5Nzq6zW5z4eWJklBCiydTV9dEO3COVDI7XVpqz4Z4o79SEZ7Dob8JiQ/
	bPLXYDc68=
X-Google-Smtp-Source: AGHT+IFKD4im2fCSMD6wlT7xxn4p7lUBqI5bQeETy+XGT2HEISXdKhzwjzEGrxwYm1y8W7DGuHZgug==
X-Received: by 2002:a2e:b8d5:0:b0:336:7df1:7616 with SMTP id 38308e7fff4ca-3367df1a4camr27986921fa.44.1756329802044;
        Wed, 27 Aug 2025 14:23:22 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v10 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Thu, 28 Aug 2025 00:21:34 +0300
Message-ID: <d6bfbd7c1e04851e2017783ccd2cacdbe39afa18.1756329091.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756329091.git.mykola_kvach@epam.com>
References: <cover.1756329091.git.mykola_kvach@epam.com>
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


