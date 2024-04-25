Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FF78B1F83
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 12:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711995.1112365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzwak-0007uY-Ix; Thu, 25 Apr 2024 10:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711995.1112365; Thu, 25 Apr 2024 10:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzwak-0007s8-FG; Thu, 25 Apr 2024 10:44:38 +0000
Received: by outflank-mailman (input) for mailman id 711995;
 Thu, 25 Apr 2024 10:44:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcQm=L6=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rzwaj-0007s2-QE
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 10:44:37 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ced2cdd5-02f0-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 12:44:35 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41b56838250so2823075e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 03:44:35 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a05600c0a4900b0041b43d2d745sm2018632wmq.7.2024.04.25.03.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 03:44:34 -0700 (PDT)
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
X-Inumbo-ID: ced2cdd5-02f0-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714041875; x=1714646675; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=scw86TObtbsV2uEXam7z2Vt/TDf/lSSGf+ayfp89WGY=;
        b=BRvMNzeWz08BVt+xidJCVshRergV67TumVG+57r5n0kW0p6gzhvvreqtgmb4W51hgE
         U6uX85/nlLFWbAvUTkSmi/cBQrAHhXjCPk+kjWiW2GAPOVsu0cu8YFpuR79db9UF1+N5
         bXYTuP3cst+gsYNovbJtsA1pzxHqrStMwiWfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714041875; x=1714646675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=scw86TObtbsV2uEXam7z2Vt/TDf/lSSGf+ayfp89WGY=;
        b=wGts8j3FpANpsKr8A1fOcJqB22INooSP3cZyfz3M1veIto5xnCPk8M3DuwTwYeQePy
         GSddgU3iYYogX0CafXstTjpNFIF/OnfUNw2Yett7sIRxinPPme/i3EfS3d6hp3eoAvpG
         5WQQnGvAngMi0xVBrNvPWQ8oKXM8d/+I+VsVifFJVVVoTWUU1Ujrl45X76QYnESrM2kQ
         oJ+FzxVRRJMGFumwDuzABTzKipldOT/hlsf3PrPDwueRVsPq0Hh1K4CldxTy7T2zq0mA
         3U57ALorv3FOHp07Q6w9kFDcwSon5pEEKDiT4aq8shmY9XwhP46m0zjtbWDQhYIcwnvI
         mmLQ==
X-Gm-Message-State: AOJu0YzxTYRFSHKwbkW9IwfssLOI4VDznGpjB1vxYuBF3XxRmQyT+D5B
	/FgE6o6BoUj3lhOrTHmjPkuEXwSoWOw7VB/tmlUuD6tCmJMvqC6/FGkjOYpldqqKwV0bpBHLqrx
	t
X-Google-Smtp-Source: AGHT+IENTBe9bLxr8WRnWfBfEGBlZuSBZkyRWGdy7OZG8SNpl8sYsp2j4UbjI8KmKBaWchGXhsu26Q==
X-Received: by 2002:a7b:ce8e:0:b0:41a:e5f5:99f8 with SMTP id q14-20020a7bce8e000000b0041ae5f599f8mr5479467wmj.18.1714041875047;
        Thu, 25 Apr 2024 03:44:35 -0700 (PDT)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] MAINTAINERS: Update my email address
Date: Thu, 25 Apr 2024 11:43:43 +0100
Message-Id: <20240425104343.36698-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1850c134d..6ba7d2765f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -208,7 +208,7 @@ Maintainers List (try to look for most precise areas first)
 
 9PFSD
 M:	Juergen Gross <jgross@suse.com>
-M:	Anthony PERARD <anthony.perard@citrix.com>
+M:	Anthony PERARD <anthony@xenproject.org>
 S:	Supported
 F:	tools/9pfsd/
 
@@ -381,7 +381,7 @@ F:	xen/arch/x86/machine_kexec.c
 F:	xen/arch/x86/x86_64/kexec_reloc.S
 
 LIBS
-M:	Anthony PERARD <anthony.perard@citrix.com>
+M:	Anthony PERARD <anthony@xenproject.org>
 R:	Juergen Gross <jgross@suse.com>
 S:	Supported
 F:	tools/include/libxenvchan.h
@@ -427,7 +427,7 @@ S:	Supported
 F:	tools/ocaml/
 
 OVMF UPSTREAM
-M:	Anthony PERARD <anthony.perard@citrix.com>
+M:	Anthony PERARD <anthony@xenproject.org>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/ovmf.git
 
@@ -460,7 +460,7 @@ T:	git https://xenbits.xenproject.org/git-http/qemu-xen-traditional.git
 
 QEMU UPSTREAM
 M:	Stefano Stabellini <sstabellini@kernel.org>
-M:	Anthony Perard <anthony.perard@citrix.com>
+M:	Anthony Perard <anthony@xenproject.org>
 S:	Supported
 T:	git https://xenbits.xenproject.org/git-http/qemu-xen.git
 
@@ -512,7 +512,7 @@ F:	xen/arch/arm/include/asm/tee
 F:	xen/arch/arm/tee/
 
 TOOLSTACK
-M:	Anthony PERARD <anthony.perard@citrix.com>
+M:	Anthony PERARD <anthony@xenproject.org>
 S:	Supported
 F:	autogen.sh
 F:	config/*.in
-- 
Anthony PERARD


