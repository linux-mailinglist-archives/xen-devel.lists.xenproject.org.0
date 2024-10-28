Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65289B2F27
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 12:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826409.1240647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OEf-0002ke-Cv; Mon, 28 Oct 2024 11:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826409.1240647; Mon, 28 Oct 2024 11:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5OEf-0002iH-AO; Mon, 28 Oct 2024 11:48:37 +0000
Received: by outflank-mailman (input) for mailman id 826409;
 Mon, 28 Oct 2024 11:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owpo=RY=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t5OEe-0002iB-AO
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 11:48:36 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f8530cc-9522-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 12:48:34 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4314c4cb752so42495085e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 04:48:34 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193595470sm105903895e9.15.2024.10.28.04.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 04:48:33 -0700 (PDT)
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
X-Inumbo-ID: 8f8530cc-9522-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730116113; x=1730720913; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AqhKPSM5xXuNkzAtrPGMWoAWoIrp+3rMwKupZfOosL4=;
        b=WQ2bGXTvRON86uizdnfE+gfvnmhwlCGsnBEg21F78JUMJnoNwpJg9piptteA07ZUcF
         3Ry2lASR+afjV80xFd4UltNm+pC5AeA/k35H0Ics4UD4wvsSf4gpbyQxg2D1AgN/1tHX
         vuO6nK1ygQfnwUEd9yK2sYtrTwjAjPVEOauTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730116113; x=1730720913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AqhKPSM5xXuNkzAtrPGMWoAWoIrp+3rMwKupZfOosL4=;
        b=T7MeJsSfH9fzBcBU549/BTburMbnE9P4z3jSwUmL9envY5/xb/syLwlsZaHrejnX0R
         flpGnCfjGAn8NHUkaHCLFVNStBoyFbj7E3X4tSdhQmh6mFC2Y6IICmcEuQmLzRyPRHl9
         gBgm4NZPQh63iEHv2F5AVUnUQt0AwU+iiR8PVuL2DVl9vXrSvmkaGWd9gb5v87PjU01x
         l4iaBtfvlONNSpFDxv1Q9+u/4VMpq16xOey6ftpwajqb+Sj3jDvZpk12o7AC4zT9NhoL
         PcJNQxnkSK3TifIfOafC5uL9Lt9DvF8Ja3IHkRGGO+OESLzJaBNcZ9TO9Vajdot+YKA0
         uPWg==
X-Gm-Message-State: AOJu0YyCdoXwy6n0cVC0eavUVqu14vUl0mLb9L9vRTqp/IMy1E76vNZB
	eJoTC6SMBtpvfLGPOkBRceFcFTyYjT2IPIgGMyDyHQ1yLZswqTA1e6pPJgP8soU8wbmuSA7IyXz
	T
X-Google-Smtp-Source: AGHT+IGjjq6kuwJwR17w7R3+QqZiR7ijGZIKUJiMjb+pTIi7caBpfjQK/pMvijDmePU5y/fuN7ve6w==
X-Received: by 2002:a05:600c:3ca3:b0:42c:b74c:d8c3 with SMTP id 5b1f17b1804b1-4319ad3032dmr68672515e9.32.1730116113450;
        Mon, 28 Oct 2024 04:48:33 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools/libxl: remove usage of VLA arrays
Date: Mon, 28 Oct 2024 12:48:31 +0100
Message-ID: <20241028114831.27487-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Clang 19 complains with the following error when building libxl:

libxl_utils.c:48:15: error: variable length array folded to constant array as an extension [-Werror,-Wgnu-folding-constant]
   48 |     char path[strlen("/local/domain") + 12];
      |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Replace the usage of strlen() with ARRAY_SIZE(), which allows the literal
string length to be known at build time.  Note ARRAY_SIZE() accounts for the
NUL terminator while strlen() didn't, hence subtract 1 from the total size
calculation.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 tools/libs/light/libxl_utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_utils.c b/tools/libs/light/libxl_utils.c
index 10398a6c8611..b3f5e751cc3f 100644
--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -45,7 +45,7 @@ unsigned long libxl_get_required_shadow_memory(unsigned long maxmem_kb, unsigned
 char *libxl_domid_to_name(libxl_ctx *ctx, uint32_t domid)
 {
     unsigned int len;
-    char path[strlen("/local/domain") + 12];
+    char path[ARRAY_SIZE("/local/domain") + 11];
     char *s;
 
     snprintf(path, sizeof(path), "/local/domain/%d/name", domid);
@@ -141,7 +141,7 @@ int libxl_cpupool_qualifier_to_cpupoolid(libxl_ctx *ctx, const char *p,
 char *libxl_cpupoolid_to_name(libxl_ctx *ctx, uint32_t poolid)
 {
     unsigned int len;
-    char path[strlen("/local/pool") + 12];
+    char path[ARRAY_SIZE("/local/pool") + 11];
     char *s;
 
     snprintf(path, sizeof(path), "/local/pool/%d/name", poolid);
-- 
2.46.0


