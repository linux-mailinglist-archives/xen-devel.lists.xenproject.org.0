Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C24A2AC4B62
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 11:20:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998154.1378933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTR-0002hE-Rm; Tue, 27 May 2025 09:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998154.1378933; Tue, 27 May 2025 09:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJqTR-0002dr-Nb; Tue, 27 May 2025 09:19:53 +0000
Received: by outflank-mailman (input) for mailman id 998154;
 Tue, 27 May 2025 09:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdBa=YL=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uJqTQ-0002b2-Gm
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 09:19:52 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be366883-3adb-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 11:19:51 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54e816aeca6so4798523e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 27 May 2025 02:19:51 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5521b9f9decsm1663715e87.157.2025.05.27.02.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 02:19:49 -0700 (PDT)
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
X-Inumbo-ID: be366883-3adb-11f0-a2fd-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748337590; x=1748942390; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xndwR7wynsamXNuzcvxrIWc5e/ezZRdE6L/HotvgLv0=;
        b=LPecsNnOwRmo7ZV+j3R904wouyQPqee2ADhGnc3onSEHdfzADGcOQWL0ddGbaP8JSj
         fAlRIsaE/OOjdR4KqVmahCqgYPbfr5sTsTR70A7IDP7hITcsqVSOAqE4ixq7NPnAOgTP
         Aths3454ZMvCiIq1q7TpspZ8rjRqP8NTGujw88F4JWG/t+TY5wNIvVezYZMsmBxCgg3Y
         UG/uhPGgpCVndiiO9+OjRVc7wXb9bPgQNusNoHBpRZLcdT2++M4jrrpeW0u7h17NkPQB
         5kUNbFLchFoCs7RX1MiEXsY/blez0965S1Y8UVbd4HJwJ/gEcLjqwZamT6lnRTur3+Tp
         VL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748337590; x=1748942390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xndwR7wynsamXNuzcvxrIWc5e/ezZRdE6L/HotvgLv0=;
        b=lKKp+WwCsd3sybYeLTXSwoFRz2Ml7xyLEnbaYWnA/cAEgCH26v695E9wCrutl6w84P
         SrYY/YEH+MHYBDCHzPgyazkYoRCesw2qWWGn/VIxjp37pamIsW8Jz5Klv3I287Em4VvP
         LI+v5NH0wAyWWqhaqfUmV/Ti0LTq4ZS8+UnBF2Ws2XfZQe2zDtAP4/DdPZ62YC2OGN3D
         f/TkXegl5u34J3xVq4tkiS3TvupEyzm+PTn/iaQAPoL7bLf8RRbXxqYKHI9YsMhc8i8C
         ehK0lKOOYtmWQyBm2RQw1tpPc8EgRYsJGnkheLVFtRQSog9hK1Z2nSeRLGWVDr1tsPpK
         fAUw==
X-Gm-Message-State: AOJu0YwZKEo3L3DT1QeVIdd19KmD4RJI0nYrFourf9HRxTllZwSKgZfM
	s3+lM8elWWuMcYcYB/aVyvNFyrQ4/6a8U/2GipudxYaEhcsvlayVxpXBMOUaDA==
X-Gm-Gg: ASbGncuZ5bgeD2Qyg5jlx5iYG4drhuFyXhyMMFIg2BH6/YEsFiDB73+K/F+kaRDqiRn
	kmcOthjJiu7kFIm1BOzNm1Qx70rJHBsY2pYTSNEI90HOGA2eRpKq9azLT04rkCP9KBm5sq9mzaj
	w/4w5FrNpbyU56o7L/n0s9y6vK9FaZTyNO1D0/103GCCs8uyAaJSVXrN3RLrU3G89W8h3fGjxo/
	e9S46nrN0WBz5C5f1D4HJJYYO3CTJ8imCShIdtyX59Lg1nsf7gn8VlAPsFNOrTh5QpIGe97typT
	wbafUCgRqpK09j9QLHUnZa+wn3ftXEbawTAO460kX5OElQJpaJ+5OUU8ncpHZF4qZvqICWb5Mrq
	+eBR6W7DetOVmvDw=
X-Google-Smtp-Source: AGHT+IEar2zBpSm2cqvH5LJ4fHxhg4H/HPUjTGCisIBKLZ1qxzlhX1cFPOwGFry+U/sjyhplSp/9aQ==
X-Received: by 2002:a05:6512:695:b0:549:8e5e:9d8e with SMTP id 2adb3069b0e04-5521c5a2ae1mr3943163e87.0.1748337590093;
        Tue, 27 May 2025 02:19:50 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v4][PART 1 1/4] tools/xl: allow resume command compilation for arm
Date: Tue, 27 May 2025 12:18:54 +0300
Message-ID: <0ec82eb500493370a2e4658c971ba225fef0ce0d.1748337249.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748337249.git.mykola_kvach@epam.com>
References: <cover.1748337249.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

The "xl resume" command was previously excluded from ARM builds because
system suspend/resume (e.g., `SYSTEM_SUSPEND`) via vPSCI was not
implemented. On x86, the command is used for ACPI S3 suspend/resume.

This change enables compilation of `xl resume` on ARM regardless of the
underlying implementation status, making the tool available for use in
testing or for future support. The libxl infrastructure and handler
functions are already present and usable.

Note: This does not imply full system suspend/resume support on ARM.
      "xl suspend" command still not work for arm platforms.

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 tools/include/libxl.h   |  1 -
 tools/xl/xl.h           |  2 +-
 tools/xl/xl_cmdtable.c  |  2 +-
 tools/xl/xl_vmcontrol.c | 12 ++++++------
 4 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/tools/include/libxl.h b/tools/include/libxl.h
index b7ad7735ca..7216095570 100644
--- a/tools/include/libxl.h
+++ b/tools/include/libxl.h
@@ -1127,7 +1127,6 @@ typedef struct libxl__ctx libxl_ctx;
  * restoring or migrating a domain. In this case the related functions
  * should be expected to return failure. That is:
  *  - libxl_domain_suspend
- *  - libxl_domain_resume
  *  - libxl_domain_remus_start
  */
 #if defined(__arm__) || defined(__aarch64__)
diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 45745f0dbb..5b0a481456 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -130,8 +130,8 @@ int main_migrate_receive(int argc, char **argv);
 int main_save(int argc, char **argv);
 int main_migrate(int argc, char **argv);
 int main_suspend(int argc, char **argv);
-int main_resume(int argc, char **argv);
 #endif
+int main_resume(int argc, char **argv);
 int main_dump_core(int argc, char **argv);
 int main_pause(int argc, char **argv);
 int main_unpause(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 06a0039718..4f662a4189 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -198,12 +198,12 @@ const struct cmd_spec cmd_table[] = {
       "Suspend a domain to RAM",
       "<Domain>",
     },
+#endif
     { "resume",
       &main_resume, 0, 1,
       "Resume a domain from RAM",
       "<Domain>",
     },
-#endif
     { "dump-core",
       &main_dump_core, 0, 1,
       "Core dump a domain",
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index c813732838..ebacde5482 100644
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
+#endif
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


