Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBDA9BCFAC
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2024 15:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830363.1245337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kp7-0003bg-3G; Tue, 05 Nov 2024 14:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830363.1245337; Tue, 05 Nov 2024 14:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8Kp7-0003Zz-0e; Tue, 05 Nov 2024 14:46:25 +0000
Received: by outflank-mailman (input) for mailman id 830363;
 Tue, 05 Nov 2024 14:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNbL=SA=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1t8Kp5-0003Zt-2N
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2024 14:46:23 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b685c723-9b84-11ef-99a3-01e77a169b0f;
 Tue, 05 Nov 2024 15:46:17 +0100 (CET)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a9abe139088so820179466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Nov 2024 06:46:17 -0800 (PST)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb16a30f3sm141969166b.15.2024.11.05.06.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 06:46:16 -0800 (PST)
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
X-Inumbo-ID: b685c723-9b84-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzMiLCJoZWxvIjoibWFpbC1lajEteDYzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImI2ODVjNzIzLTliODQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwODE3OTc3LjM3ODc2LCJzZW5kZXIiOiJtYXR0aGV3LmJhcm5lc0BjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730817976; x=1731422776; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kgLgSCDalEsScbvom6IK4y6C5e8B2Upn5vSaAtwdf4M=;
        b=dpqsE6t7lK6WRvPVWqU4AIv/bXdAUqw1r/g93Rn8M8JY5wv5kM8tdn0sM0jEBf0qDq
         5Dwf0xc56Glf+bBp2Pl5AGeG1VtvARnfmj3CRXWZnQOWALpBNvNszVTQdFXge29Wp+LG
         i475ZgKs+ssyzq9DQgcSjekm8xZ2QHXmCSL9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817976; x=1731422776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgLgSCDalEsScbvom6IK4y6C5e8B2Upn5vSaAtwdf4M=;
        b=YUQE8YU9BVf3fBPegsmaIRgZmKsdqoVUNeB9EuWvO1B5Nj7+lJ6bESdbEQKVPSiJfy
         WpcXdds6wsztcObU0WjJR92roJcuKeHgY055rg89QM63hl8WNjvGcS4uPCtuXXK6whg0
         4IPT15LPKokabeRv8Pf3yoQUkibJ0ksun5Ftam4OJcPYukOWg44nVnIqWAOgebrTkclS
         vtrMl9zhcZbgQoxWu3o1cYRkD0n6bSSrFVnYswMDCi5zItvd8815AlrbHNqlUmSCIoh2
         5aaxKGRQ0sz7KISzFdLp2xvagDpFlagq4AqiLOwOgFD1ZNV5MP8r2//DFZQoczjfA0T2
         HLrw==
X-Gm-Message-State: AOJu0Yy7efuSEz0uinj33bd/AYD53eoZMyjpONgd6NmrSDEU9Y3DHKq0
	FTYrkPnspWZ14UCTzLIUYNA8Op5xTl2cjUz61z0Ad5YZ5jrSdLoHwVjOXFwNLewbsQ+q+zxD5/5
	g
X-Google-Smtp-Source: AGHT+IHA0u+vgGzeNV7FMnUCpgHOLXz1O2eytiYSNNUujyLMHik6ZeAuS52ievpio1miqMB2TNlQdg==
X-Received: by 2002:a17:906:6a1d:b0:a9a:18ee:5106 with SMTP id a640c23a62f3a-a9de61e95a5mr3463014366b.65.1730817976541;
        Tue, 05 Nov 2024 06:46:16 -0800 (PST)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH] CHANGELOG: Add note about xAPIC destination mode change
Date: Tue,  5 Nov 2024 14:33:31 +0000
Message-Id: <aa0ea8c5cf8ebe74f2b28dc41cb13cd8bdcdf38f.1730816930.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 CHANGELOG.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 674944cbe4fb..dd1d68847187 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -21,6 +21,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Removed the `ucode=allow-same` command line option.
    - Removed x2APIC Cluster Mode for external interrupts.  x2APIC Physical and
      Mixed Modes are still available.
+   - Switched the xAPIC flat driver to use physical destination mode for external
+     interrupts instead of logical destination mode.
 
 ## [4.19.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.19.0) - 2024-07-29
 
-- 
2.46.0


