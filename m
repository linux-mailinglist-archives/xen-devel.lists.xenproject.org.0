Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1916CB3CFC2
	for <lists+xen-devel@lfdr.de>; Sun, 31 Aug 2025 00:12:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1103290.1455086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTnf-0004IC-Tc; Sat, 30 Aug 2025 22:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1103290.1455086; Sat, 30 Aug 2025 22:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1usTnf-0004Eb-Nz; Sat, 30 Aug 2025 22:11:55 +0000
Received: by outflank-mailman (input) for mailman id 1103290;
 Sat, 30 Aug 2025 22:11:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IC44=3K=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1usTne-0004DI-Cp
 for xen-devel@lists.xenproject.org; Sat, 30 Aug 2025 22:11:54 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 553875bd-85ee-11f0-8dd7-1b34d833f44b;
 Sun, 31 Aug 2025 00:11:52 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-336630769a6so30525011fa.3
 for <xen-devel@lists.xenproject.org>; Sat, 30 Aug 2025 15:11:52 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-336d0e3f39dsm4662091fa.45.2025.08.30.15.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Aug 2025 15:11:51 -0700 (PDT)
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
X-Inumbo-ID: 553875bd-85ee-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756591912; x=1757196712; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=LYocE1w8ycdRv/rn3bzWdnrckPFEWWCHY3fkd6fGXaTRiO81m609m406HnoBXkZ+cO
         wrg3EeMLuGSPb39lhlLj00iMJQR5MQyDDmUbNpyAHcd8rmMQcQRYs+5+R/rt8ZOBSYW8
         jJr3+DBFDoGPecHMZo+/HsJq2wJStytEzrIiW8i9bnKnbrs9gUxUXhhxiwhway1HIlNs
         H8sjIL6S264N6/uVzDK6f81zrhGE4CLSQONM8oR/XIXhJ80wB4w5yTLFySXYjKa5pn14
         43TLJWssEEzKAOir7mxYqUpH7aZUsDCYB15o6zyelmOFhrYxFSXdjA+MZYpkG2NPwizh
         asIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756591912; x=1757196712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKQtb2yDXXgVIM20M/9ZKDqMqVSaENj70H3OApwPWOA=;
        b=kO6oo+H9bkdpN/GLmWvQ1luf3jMwQrAjicz7DFQg7ilNHj6vgPajcgSSkNEzGAo3XR
         TewnVSEUbnpE6FfSkDqw5m9V0Y9kHHdu4lXpDOhpMCV41qX6yCqjpjBy18ypuDgNW8WO
         4V3vwRzsr8OIh1ewyaJVKklnv2q3YFpkHsYa/8epxGSEfHQL+U9CkzyeOzbRcRhQO0NZ
         u8FevlD2fA+5PsN/KX9CX5a2XEtCcRjH873yl2KAxkwUhsfTK7SoeJf/oZVYoYsTnxEM
         VQTlrrx4utAfTqCOk1zyF8kVuRspHSVBGq8ugr8lW1NqfVWZKfo8WwFVKX9EBMAy2P2i
         TBTQ==
X-Gm-Message-State: AOJu0YyTd+g2VBj27+1vMcBhfikvJJxShuR1MY7PsX/FIlDdVpDfhwUB
	B3hgojhyKsoDCoBGiUKKO/lCFweeq5/x4ANGWfmWuFubVy+jOmwyJrUvjswuGOHU
X-Gm-Gg: ASbGncsb6HxrfDTaFeo7v1HvTyAVyjGBG6NFZ/9eEKO17CdiIFLfb9aW2NWaob51n1b
	yufA7JM0vNit90IRUe1899OtwVO+mr2gX+FWgykl7yVXqk49jv8Nu4gPgd5w3JYce+Tc2vYW8Gp
	7PqtyLUWADAsG01I1NMSaINSDb6ndz7BBSr20KrN5ol3AJnCWikLpbQPkhwfFI+LsLKUK+3MsYF
	MxPDI+3D9mXA5xsC7nrS1zpgUqgfclqRZo6QcUlqzd4T6NxDmsvvjZW854rqEbuYpnNWWnr2M8s
	xlVFs091m4Gto/SjkEwU8vAbWxKna57yPkWDoT4jq4twT48QfjDysKmaYiB48nfUqbTONEBqORC
	wgdBxHUHlAo8japYkP7HQ6XgDNNwjlkLYXcy+lz/bkueGzhzXjP9fQk+YBXIw7Q==
X-Google-Smtp-Source: AGHT+IHT3jcq2YU0u97H9rorlL8soKoehokjHRPbP86Ys46uBURn+zyouGVQvApeibXNyoYgtSuz0A==
X-Received: by 2002:a05:651c:2214:b0:336:90e3:4b8f with SMTP id 38308e7fff4ca-336ca9b9567mr6946541fa.2.1756591911768;
        Sat, 30 Aug 2025 15:11:51 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v12 2/4] tools/xl: Allow compilation of 'xl resume' command on Arm
Date: Sun, 31 Aug 2025 01:10:29 +0300
Message-ID: <6e7bc11b7d1b96e48c8211ca3d2e48c702d0b675.1756586648.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1756586648.git.mykola_kvach@epam.com>
References: <cover.1756586648.git.mykola_kvach@epam.com>
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


