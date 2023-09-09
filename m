Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 377AA7996DD
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 10:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598437.933249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetNS-0002Rd-Lk; Sat, 09 Sep 2023 08:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598437.933249; Sat, 09 Sep 2023 08:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetNS-0002Pn-I3; Sat, 09 Sep 2023 08:31:38 +0000
Received: by outflank-mailman (input) for mailman id 598437;
 Sat, 09 Sep 2023 08:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rb1o=EZ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qetNR-00025u-0k
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 08:31:37 +0000
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [2001:4860:4864:20::34])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45b04cb2-4eeb-11ee-9b0d-b553b5be7939;
 Sat, 09 Sep 2023 10:31:30 +0200 (CEST)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-1d598ba1b74so76542fac.0
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 01:31:29 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.29])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a17090ab28e00b0026f3e396882sm4091663pjr.45.2023.09.09.01.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 01:31:27 -0700 (PDT)
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
X-Inumbo-ID: 45b04cb2-4eeb-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694248288; x=1694853088; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdoIft6WhMRBddIcXSnUq6awo01WHLpnvgGSH2OnfBM=;
        b=L5NRcErwg4syklzHlbny5lpHssXgETr91GOkkhp58kmKmIiMXhWm2NyrpEV1Dr5+sY
         ynymJOYKO13AC8AF/dKS2dD9MTw8sjb2bTVwJ9I+jBTKlvf0FgPEyDVaR+MDS2a428+i
         v8MWBxAHK1n205EKloxEa1apuaguyF3PMa2gz+UbtB3r7D9P5b1cpALv6vAo/4h2BmBm
         KBLHcSwT2R5jD6uoPlq2tqFc1GloGvi2+aA5IFYSShMGGejso5bwbCiPMXVfiQeD5B4F
         lAVFiMCg06sCj13OtzrUglsHm83Mm/YUDlLKDWlB7szIEdaSjok2oax5Eh9a+tcB5+Tu
         Jkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694248288; x=1694853088;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdoIft6WhMRBddIcXSnUq6awo01WHLpnvgGSH2OnfBM=;
        b=WxWMKHg390geUYwRNTGVgpLI1T3+9w3YyhQn1fNS/Qo4m+zLQSq5uf5G4r1nEBP4gX
         aigIOYs2nWztuPV/mba8noAi/vcE0z4XMCIwqG3fDbZWYg1A4u4VH8rtJLfrGQ2Ai4SY
         f0BMEEGMxALsTbOsNUbMcxD3ohO4cyBtEfDjGLvzthjtosm+NV3tWCisYwK0ZyJ1vwZK
         +13dy/c6E3SMDKk743UM9SDyxPPxhsdQ6WDd9hkWZcNX9PUfaBAyOzOjv0RFIMRKJB5t
         Nv4ojfVfJuVjA79ZoX4p7gE7TTIaJ4+rt08ZIS7k439ofR0iqx/EfW02ki+vO37RsWt7
         hs1g==
X-Gm-Message-State: AOJu0Yz1mn3E6Nlyp5Zu/kSeH4DhTPwdKoblvRFLFf4AZGlBraEEjmiW
	S3Nw5oRaE4mKzu22NB5XLSADdQMHHI9WRb4IeCSVfh5s
X-Google-Smtp-Source: AGHT+IGYIBTIdWkDyNdoZbo9VepoQ+X2R1zeRxbQgd7PeXqscZCBTFB6lkzVyI6IRi0mXMNRSx47zQ==
X-Received: by 2002:a05:6870:b014:b0:1bb:83ae:1512 with SMTP id y20-20020a056870b01400b001bb83ae1512mr5875740oae.24.1694248288343;
        Sat, 09 Sep 2023 01:31:28 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 0/2] xen/arm: Enlarge identity map space
Date: Sat,  9 Sep 2023 16:31:17 +0800
Message-Id: <20230909083119.870663-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The latest Xen fails to boot on ADLink AVA platform.  Alexey Klimov root
caused the issue is related with the commit 1c78d76b67 ("xen/arm64: mm:
Introduce helpers to prepare/enable/disable").

This is because on ADLink AVA platform, it loads Xen hypervisor to the
address above 2TB and hence causes Xen panic:

  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel

To fix this issue, this series is to enlarge identity map space to
127 TiB and tested on Telechips Dolphin5 platform.

Changes from v1:
- Rebased on staging branch (Bertrand);
- Added Alexey Klimov tested tag for patch 01 (Alexey).
- Corrected the printing log with dynamically calculation ID map size.


Leo Yan (2):
  xen/arm: Add macro XEN_VM_MAPPING
  xen/arm: Enlarge identity map space to 127TiB

 xen/arch/arm/arm64/mm.c           | 12 ++++++++----
 xen/arch/arm/include/asm/config.h | 22 ++++++++++++----------
 xen/arch/arm/mm.c                 |  2 +-
 3 files changed, 21 insertions(+), 15 deletions(-)

-- 
2.39.2


