Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26870A4A383
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 21:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899109.1307556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6eb-00067d-BD; Fri, 28 Feb 2025 20:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899109.1307556; Fri, 28 Feb 2025 20:08:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1to6eb-000659-7C; Fri, 28 Feb 2025 20:08:13 +0000
Received: by outflank-mailman (input) for mailman id 899109;
 Fri, 28 Feb 2025 20:08:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2kAP=VT=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1to6ea-0005qk-3a
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 20:08:12 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc006e25-f60f-11ef-9aaf-95dc52dad729;
 Fri, 28 Feb 2025 21:08:11 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-abbac134a19so381835666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 12:08:11 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf1d1a84b7sm267586566b.19.2025.02.28.12.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 12:08:09 -0800 (PST)
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
X-Inumbo-ID: bc006e25-f60f-11ef-9aaf-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740773290; x=1741378090; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGAYl7zaIMaBJNX7YEEaF7qnKxa2zbpYkHEkF/b+eiw=;
        b=Lrcc+giclEI7rl5rg1nedDKHLHZ87yI1jIV5K99HDVNPt58HejDSS7Wuqk7hVEHvAd
         7ugidUm92ZNt9YZFbTCDrQRFLzaexfE+TM1a9eOZvvCyk0gLGDnt4jA7mTee8qWLfdOU
         34kqaSJexBp3Ddq48ms6m6bb6lZB1zZZMa5M9C7bylahauOGnJ6tnrupRlX9exKn1ebm
         GcMC5S984CF/bHm1sg1xMKFLhUz+HDzRVakoVfstYEAvTmua7S2BHWF0LLJ14dpPp7W1
         +v+jLAav2BBGDyeJEV1zxu3t01AsIFSKf6/hOql4PV8i99wu8F/OMau4rpYwbz7yIg37
         zjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740773290; x=1741378090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGAYl7zaIMaBJNX7YEEaF7qnKxa2zbpYkHEkF/b+eiw=;
        b=jJz1DGr0fSnOD0cSuJDrlx6umgp/fZDvCtLq7efZshf0tGhwMJjNFNTYSSlwP6B7g+
         IPL/meEzPH6e+Vr2CTyArhaLwiLy6rXKOf5oEkAhvYa6VxYoa5GsYQhSW/d2JnisjAqG
         P32kBGRIA01w6eU0GCHFozMFwt9BZUWunqTz0gz49Pb1P4CvWR3sLWOY2lObOe9fenDB
         Xo5SnPkf+cWGaICLJ8s0ZO/DEhhhZnZxtWuTraTRVjiKezTzVSJwppHRQidEDg8FGEpr
         6uFSk24IojoLzDqnbGPmpRgR7fwuIdXFqXrGEV/pvTwbOkqsmViok84qfEbllZyk4plP
         RyiA==
X-Gm-Message-State: AOJu0YxkevXLzOC36jsT5gMfUMyRHU/p8V4CBDz3zUiXjhEtkQ0dRjer
	vuG90qbR72zdz3lzEc6ABsL3EWQ6WNLNH8XjTYoTfkvx1PLcWaLQE8+8qw==
X-Gm-Gg: ASbGncskhui74OhYUJEC5zckJcnMtzBDQrSjIijZawXQ/44mSyram5LDJegVgDp+sVQ
	ehNKsdBZ0ZTsyXm5I45J7hoKM1mIX9THtoB5hz9Rh2s7GYHM0ZjVDc9d5WPHDyL3hXCeWXDM+Tj
	Ff3Ehzt1CRcbOkmUq9LVlcYpim5xHqKJQ+8C+qFV9tPYr0GGUtZhhJSRvLM7ZDto86Abe1MR3HK
	THrVZnR0s/HEhMVx9n/NVLNDG8tBL3hQsm7Ra2f5yuNT3ezI4V4nj6R3yOXjBuc/jtgS2O1Iibz
	5X3HvXTK5byM9v6bxSLBmqTJGU4=
X-Google-Smtp-Source: AGHT+IFnvqJKLojI4QW4VdrMfM5Jpzd/tSddUE87bx07B7KPWthOB7M7wuJ0brueGjQcwbFHn0i6NQ==
X-Received: by 2002:a17:907:98b:b0:ab7:e47c:b54a with SMTP id a640c23a62f3a-abf268228a5mr553141466b.37.1740773290104;
        Fri, 28 Feb 2025 12:08:10 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 1/6] xen/README: add compiler and binutils versions for RISCV-64
Date: Fri, 28 Feb 2025 21:07:39 +0100
Message-ID: <eb86d40b2e3091c829d08a83d43a383f7cc82d1f.1740764258.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1740764258.git.oleksii.kurochko@gmail.com>
References: <cover.1740764258.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Considering that the Zbb extension is supported since GCC version 12 [1]
and that older GCC versions do not support Z extensions in -march (I haven't
faced this issue for GCC >=11.2), leading to compilation failures,
the baseline version for GCC is set to 12.2 and for GNU binutils to 2.39.

The GCC version is set to 12.2 instead of 12.1 because Xen's GitLab CI uses
Debian 12, which includes GCC 12.2 and GNU binutils 2.39.

[1] https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=149e217033f01410a9783c5cb2d020cf8334ae4c

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - Rewrite commit message to explain more clearly why
   GCC 12 is choosen as baseline version.
---
Changes in V7:
 - new patch
---
 README | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/README b/README
index 72f6b0fcde..9d9c6fc324 100644
--- a/README
+++ b/README
@@ -48,6 +48,9 @@ provided by your OS distributor:
       - For ARM 64-bit:
         - GCC 5.1 or later
         - GNU Binutils 2.24 or later
+      - For RISC-V 64-bit:
+        - GCC 12.2 or later
+        - GNU Binutils 2.39 or later
     * POSIX compatible awk
     * Development install of zlib (e.g., zlib-dev)
     * Development install of Python 2.7 or later (e.g., python-dev)
-- 
2.48.1


