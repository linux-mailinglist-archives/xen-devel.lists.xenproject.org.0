Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF080A810
	for <lists+xen-devel@lfdr.de>; Fri,  8 Dec 2023 17:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650719.1016503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJG-0003AB-JZ; Fri, 08 Dec 2023 16:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650719.1016503; Fri, 08 Dec 2023 16:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBdJG-00036k-Fl; Fri, 08 Dec 2023 16:02:38 +0000
Received: by outflank-mailman (input) for mailman id 650719;
 Fri, 08 Dec 2023 16:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jsQu=HT=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rBdJE-0002KL-Q1
 for xen-devel@lists.xenproject.org; Fri, 08 Dec 2023 16:02:36 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3442881a-95e3-11ee-98e8-6d05b1d4d9a1;
 Fri, 08 Dec 2023 17:02:36 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-40c2a444311so21202975e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 08 Dec 2023 08:02:36 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 s3-20020a5d69c3000000b00333320cf08bsm2300535wrw.102.2023.12.08.08.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 08:02:34 -0800 (PST)
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
X-Inumbo-ID: 3442881a-95e3-11ee-98e8-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702051355; x=1702656155; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSsVO6gcxnExdYHK0SsUQHNQOnlSg2S/CO5a381FM3A=;
        b=R+AoFSFRuq7slvwbae3niNQh2cKT285JRQ1iC2gemo0Z5SsEJXbQ2W8M/L9UpxWMVo
         pxFOhpa2Uv+51HyvcsuYvHbECPgrH5X50N0HQKFE6X3mjtiW0pSuyg3IZf5IutM3+tBY
         S9pRnl/YXQcy0NpM7RLJ7xbuWWxo7xkyvBSKI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702051355; x=1702656155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSsVO6gcxnExdYHK0SsUQHNQOnlSg2S/CO5a381FM3A=;
        b=sEDAcyALt/9zS9z2/xcR2SqAbZhXPog6GvHlt3WnUTO8m05fDCX9ULi5XHTbVaOY3g
         +9b9m/72ZdfRnDn4zfLg+nWMKplOC3/gC/B8Sdnu1apMRwAhztkRRvgcXMu745ZUMo4F
         Og+E2lhmAKqT+D+CAV4u519/mh8zIz7HTc0ZfZp9cRNY7iM5S+2mFprt8zn0PuX6+x45
         xGtfGtcByOzU8Rh5D/6fl0A5hNJ1/INRFgV6MHfgaNAWLd99Z34JwHeDGCyTvCBIflts
         NMelO+o+CFKQq4v1fyq2uASSQRm0TDp9ohYKw54w2vKRvDchKTrhimRIxQxOe4mVdatB
         LtYA==
X-Gm-Message-State: AOJu0Yx1WNEponJ76QGiR7z2tky9q2VfDr06vPbUfQq4Sk+AHwdFJMpb
	zfiFO8Vh1a2awSxmYMwbafmURON69vZyE1QDYBg=
X-Google-Smtp-Source: AGHT+IHLx86dhJ8ZTjptI1zz7HBOK2kUyJA7NCPvp3MoIQWN5+bUntmMsRNRNoSiTKPZV8uooukTjQ==
X-Received: by 2002:a05:600c:1f1a:b0:40b:5f03:b447 with SMTP id bd26-20020a05600c1f1a00b0040b5f03b447mr45827wmb.361.1702051355214;
        Fri, 08 Dec 2023 08:02:35 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH 3/3] ts-kernel-build: Remove use of $XEN_TARGET_ARCH
Date: Fri,  8 Dec 2023 16:02:26 +0000
Message-Id: <20231208160226.14739-4-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231208160226.14739-1-anthony.perard@citrix.com>
References: <20231208160226.14739-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

osstest doesn't set $XEN_TARGET_ARCH, and this is a Xen build
variable, not a Linux build one. So, this code have been running with
an empty $XEN_TARGET_ARCH for a while which mean none of those
`setopt` has run in a while.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-kernel-build | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/ts-kernel-build b/ts-kernel-build
index 719b33aa..05da9a7f 100755
--- a/ts-kernel-build
+++ b/ts-kernel-build
@@ -607,19 +607,6 @@ setopt CONFIG_AHCI_XGENE y
 setopt CONFIG_POWER_RESET_XGENE y
 setopt CONFIG_RTC_DRV_XGENE y
 
-case ${XEN_TARGET_ARCH} in
-    x86_32) setopt CONFIG_64BIT n ;;
-    x86_64)
-	setopt CONFIG_64BIT y
-	setopt CONFIG_IA32_EMULATION y
-	setopt CONFIG_IA32_AOUT n
-	setopt CONFIG_CRYPTO_AES_X86_64 n
-	setopt CONFIG_CRYPTO_SALSA20_X86_64 n
-	setopt CONFIG_CRYPTO_TWOFISH_X86_64 n
-	;;
-    *) ;;
-esac
-
 # Disable components that don't build
 setopt CONFIG_TEGRA_HOST1X n
 
-- 
Anthony PERARD


