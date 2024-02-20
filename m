Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D454C85BF2D
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 15:55:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683558.1063126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRVW-0004f8-E9; Tue, 20 Feb 2024 14:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683558.1063126; Tue, 20 Feb 2024 14:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRVW-0004dS-Am; Tue, 20 Feb 2024 14:54:06 +0000
Received: by outflank-mailman (input) for mailman id 683558;
 Tue, 20 Feb 2024 14:54:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5vNk=J5=cloud.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1rcRVV-0004dM-82
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 14:54:05 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e393cb32-cfff-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 15:54:03 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33d6cc6d2fcso374273f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 06:54:04 -0800 (PST)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust35.5-4.cable.virginm.net. [82.13.64.36])
 by smtp.gmail.com with ESMTPSA id
 14-20020a056000154e00b0033d10bd6612sm14050711wry.81.2024.02.20.06.54.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:54:02 -0800 (PST)
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
X-Inumbo-ID: e393cb32-cfff-11ee-8a52-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1708440843; x=1709045643; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=poJh6RFQdroxhR+KU74eDDRDn7U0Xmv5gjyyB0XXq3k=;
        b=ka0fcQUjyXFUbpVM0MfxPY2tLT+26osae8jkNJXHLbbicuq4dBSEosrpYKRxvLOAE4
         nVkrD3paJ6Lx6rhHRv9p2ftDt5r1Y0m7Uq5IrLEPXGqJ1mcAUFZZFWSH1jwI1TFY1EYw
         0n3L5z7HcxIjthZ6m665Mfo6m43kwOxTMrDoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708440843; x=1709045643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poJh6RFQdroxhR+KU74eDDRDn7U0Xmv5gjyyB0XXq3k=;
        b=Jm5tHuXAK7+O4mZ84LCByhod1nfuOwhTCiS2HpCTgNzBALwNxUiSAoYu/c3PnFjsmJ
         yI256LKeF7lPaqpUbKdcdn8ZyXXJv+GhmiZDX2fhFaXPc4YZQdoxiVR4zZUQHNMzaCmo
         iSgM7kmS3gjTX9K7f4sR5A1Xzo3N9HVfxF/btlZKrDyMQjwmrWyw+GzGKEM/+YqFtSqo
         9URFke5vfxTzF2UxdKudSV4wZryknhpPAgKUggrTfLucCllX6olHLXTXqr/rkUo/QbFI
         uHMXGotb0dB/9ePOBhWLxGuKkJZ4F4mbAlp5F15OZl4clZTc7jNBCRCgRkqsDri+f6Ha
         36cg==
X-Gm-Message-State: AOJu0Yy1HAfpw+89VBAp5VGJ1YfRuHmSapF2aD2mZfsb/kdJ7fsfgP75
	SKJkUDEfqbN9nTSF9Y2ilgs1H3n+y4UuF6Qv5miYyq++SvwpWfC0R6bv0nexMFP5GBMtV7HWqGT
	/
X-Google-Smtp-Source: AGHT+IGrKLRi6pW1r/jgiBNLV+BFOpYI2xCfLoWEsSsup3/ZaqvK9juW8XlYASDtrVpphu/WR6sUSg==
X-Received: by 2002:a5d:408e:0:b0:33d:1585:b51c with SMTP id o14-20020a5d408e000000b0033d1585b51cmr8930119wrp.46.1708440843055;
        Tue, 20 Feb 2024 06:54:03 -0800 (PST)
From: Anthony PERARD <anthony.perard@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Roger Pau Monne <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH] ap-common: Switch to Linux 6.1 by default on Arm
Date: Tue, 20 Feb 2024 14:53:52 +0000
Message-Id: <20240220145352.26264-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "linux-arm-xen" tree currently point to Linux 5.4.17 + 3 commits:
  69117aaf07f7 ("xen/privcmd: replace kcalloc() by kvcalloc() when allocating empty pages")
  bca5bc0229a6 ("xen/privcmd: fix error handling in mmap-resource processing")
  f0f0e602f7c9 ("xen/privcmd: drop "pages" parameter from xen_remap_pfn()")

This stable version is old and doesn't build on Debian Bookworm.

The 3 extra commits are present in at least Linux 5.15, so there's
currently no reason to have a separate tree when we could use a stable
tree that osstest can update regulary.

So switch to 6.1. This will change the default Linux tree for all Arm
jobs that aren't on "linux-*" osstest branches.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    I plan to also change to use Linux 6.1 on X86 a bit later.

 ap-common | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ap-common b/ap-common
index 292553ed..48a95a22 100644
--- a/ap-common
+++ b/ap-common
@@ -60,7 +60,7 @@
 : ${PUSH_TREE_LINUX:=$XENBITS:/home/xen/git/linux-pvops.git}
 : ${BASE_TREE_LINUX:=git://xenbits.xen.org/linux-pvops.git}
 : ${BASE_TAG_LINUX:=tested/linux-4.19}
-: ${BASE_TAG_LINUX_ARM:=tested/linux-arm-xen}
+: ${BASE_TAG_LINUX_ARM:=tested/linux-6.1}
 
 if [ "x${TREE_LINUX}" = x ]; then
 	: ${TREE_LINUX:=${BASE_TREE_LINUX}}
-- 
Anthony PERARD


