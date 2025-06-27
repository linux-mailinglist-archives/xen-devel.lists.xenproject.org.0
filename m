Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDF5AEB56D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jun 2025 12:52:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1027506.1402120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gR-0002rd-JU; Fri, 27 Jun 2025 10:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1027506.1402120; Fri, 27 Jun 2025 10:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uV6gR-0002mb-FH; Fri, 27 Jun 2025 10:51:51 +0000
Received: by outflank-mailman (input) for mailman id 1027506;
 Fri, 27 Jun 2025 10:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61Re=ZK=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uV6gQ-0002k5-AY
 for xen-devel@lists.xenproject.org; Fri, 27 Jun 2025 10:51:50 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b980649a-5344-11f0-b894-0df219b8e170;
 Fri, 27 Jun 2025 12:51:48 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-32adebb15c5so14914641fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 27 Jun 2025 03:51:48 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32cd2dea1c0sm5235831fa.3.2025.06.27.03.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 03:51:46 -0700 (PDT)
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
X-Inumbo-ID: b980649a-5344-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751021508; x=1751626308; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DtDYb/sxb7EM69AJmP/RVzUWb9yGC1iN05GypUjWJS0=;
        b=OsdN+uqfzF0qafwjHnmQgOq5Xf0lDZyN219zQ3t70GNuH+MShRRj0SWc66S0hAP+hs
         8ViCuy0mWoC72AW1A5T88nfREpIClO8/F1zv6j2C1/AB15AziJrdMIgpQ8VEPnVN60NC
         oaCiEImSm41x1Jag+4KE4A+h3XhaT1LuGdzSrZme89G53/FNdNFcLNeENpKM/sPyIyc5
         uReG8N6/DPC6yoI5534lkJJDElb/5e3+dax5ORK4pDIxfVLVzwXmZnd+y27/5kwAaUxb
         fSlYZkfpd3TpCigIfWalf/DeoQuR2/RA1txzrM9/B0ScFghMdrjZPjVJrqNBifO68Oau
         jYnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751021508; x=1751626308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DtDYb/sxb7EM69AJmP/RVzUWb9yGC1iN05GypUjWJS0=;
        b=BTs7glbLtrVCSF1KAY0cPlgRUVt7BQ/V1nG0G73Q+fdEepQRKN5X+WQrmgzNJfWzTA
         uvy6zzCPxBgXQS0x4WfSBVINk1CRsVREn9D00myiu6XxhcMJIbpHvvcynDLp/weryRza
         VfaiZU6UfuhHShCz6ygZ/MJNViFMWOyDVpnN864faX3Bl/7PZI58sYLC2MooV2ywbQn/
         8dUlvNY1Vt56nEa9NaIVQrBKoZuyrBtDXWaC1nMTeI7JpffPdi4Y42/LPSx4sbxd/UXB
         g0zLtF10sF/nvROpBK4me+EOaUL4wdU2GEUhvynUtMVpKe/ugyXwhgHfFvKZmMDo72c8
         KqLA==
X-Gm-Message-State: AOJu0YxYwzOubZSUO0r0yAjHzWRpmj29cFjKba4dNshP4Xc4/80tgfJD
	85Knac4HLQ97reTcUu12z5oHQqS2tIHs6ePehiF/hRc1MwQwJNOB3jbPU9nXygLl
X-Gm-Gg: ASbGncs7TdUPL1yMJfqnTwaeWZXu4FWGQX2Fy6KL48j2J1M/WYft1I3UYypalV9+Q7M
	r+Hsn/dRTASN1fZQYRVX5qSQhRNBR1jbOdWSOetmdwiWUKyPS0UHeoTeOl7KjjRAjGMK+8pAEsJ
	gPsfuNxjIIvuMSrCaGFsNKKMzfLwDqQLY+udO3rCY2lhBomnvgr3ZbGaeo87PUZZWvaVgTyJ5WY
	IalF+nnSctb2bjHWCdTDtR6yaP96ZxhYn0ruCs2vC/UImU1GKOe7V4WGXpbeVWFbEOzApllu/Ro
	gffIJ7Te5/Avcf5mxm4Q35sCb2/IJgTPvMJEQGoy89IROdcMuy1jPdYhGRjaf7Q6fB3rJzSWRz5
	h79Sa5quwpJtTuacoLuBmHXNocQ==
X-Google-Smtp-Source: AGHT+IEkSp1AGDJtWZaTbK8GvkVKo++j2/3AogtoWI8j+NM2W8N1kPeEqWvYagulylssuiDC65QlxA==
X-Received: by 2002:a05:651c:304b:b0:32a:84f6:a862 with SMTP id 38308e7fff4ca-32cdc481409mr6328681fa.3.1751021507206;
        Fri, 27 Jun 2025 03:51:47 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v5 2/4] tools/xl: allow resume command compilation for arm
Date: Fri, 27 Jun 2025 13:51:31 +0300
Message-ID: <00c495b471c09a84601156b2b74a1ba897f51755.1751020456.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1751020456.git.mykola_kvach@epam.com>
References: <cover.1751020456.git.mykola_kvach@epam.com>
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
index a8704e0268..0fda8bb616 100644
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


