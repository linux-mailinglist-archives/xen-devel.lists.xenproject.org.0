Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94A7996DF
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 10:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598449.933259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetQT-0003b2-32; Sat, 09 Sep 2023 08:34:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598449.933259; Sat, 09 Sep 2023 08:34:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qetQS-0003YF-WF; Sat, 09 Sep 2023 08:34:45 +0000
Received: by outflank-mailman (input) for mailman id 598449;
 Sat, 09 Sep 2023 08:34:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rb1o=EZ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qetQR-0003Y6-Le
 for xen-devel@lists.xenproject.org; Sat, 09 Sep 2023 08:34:43 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8c45409-4eeb-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 10:34:42 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-56a9c951aaaso2089061a12.3
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 01:34:42 -0700 (PDT)
Received: from leoy-yangtze.lan ([98.98.49.29])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170902ee5100b001bde65894d5sm2781080plo.109.2023.09.09.01.34.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Sep 2023 01:34:40 -0700 (PDT)
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
X-Inumbo-ID: b8c45409-4eeb-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694248481; x=1694853281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pdoIft6WhMRBddIcXSnUq6awo01WHLpnvgGSH2OnfBM=;
        b=SX4NYeDE0aEFh9zJp3yYBKVuGjUZbK2GimNfCaK65Tl6Zdcj0pwltPVqF6F4P43aK2
         Eyu3u+IQYSZescHa87vagmdEl6bNinOi0iEpADMUK4u1XvWFiM3+SKJRiKU+Gyzjv/PF
         i9hleYRWh5Me17aLbaq+Y43ESpC4TqlaF3p3a4HX2w4s5d/xhD0n5LFm0vkKZIKGC7J+
         yhU8/5FOT6cYQUxxakYUoIi0Jk/7HIxpBp5JDkf0TryPCIGsnx8R5slyUBjJG38+oAXC
         7n2lEu4ykH3/ydSKI+NnHJscFbdxazKTTZTI1i0DJjlrjqcDjS2tvFwhxQWX7Hb6P+MD
         E54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694248481; x=1694853281;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pdoIft6WhMRBddIcXSnUq6awo01WHLpnvgGSH2OnfBM=;
        b=kNC6n5Fda7dH9fbx0mdTgjygR3GoVPqpAngMN2Xil98Twh9XBv2CpPxhKoiGCDXFNP
         coeLwuh5v9b8OSNahDhyfML6MuvmL8iutshJw+RJr0eBwNq8tpQ3KczyoPnjlfccoxBA
         MnWJL1FZm7/fmcHxtYApUkO1RowePnPFv7QQ50RFOWxCQNPsC2XVGaOsk3t8OiOpUZhd
         HGqeDbcf79nS48YE5F9AQQ7J9v14x+foDdwCioTlKVO60hEShXR8hmnsbc4Aqg2RdCHj
         dktvKBiXWy6nWrUSmFAx0K8ANKYBsXX1maBF521R6GU/L9//EC5AcfiT4w741iDTg4kp
         gbvQ==
X-Gm-Message-State: AOJu0YzrhTzdQKVejPLGDt6UgcIQV63oip3Dy54JABe8LJp7ymUWZffY
	vX1f2iQHCBRQrCdpqsZSB1QXiqlUUjJdukOVn26J1Zzf
X-Google-Smtp-Source: AGHT+IHc+1cTqdgQPHxX/PtuyKpc+2c8REVmWMeEKCiodC8chytxWStvS+QLhyIWnu+DSkr7orKS8g==
X-Received: by 2002:a17:903:486:b0:1c0:c7ae:a8a2 with SMTP id jj6-20020a170903048600b001c0c7aea8a2mr3862414plb.35.1694248481327;
        Sat, 09 Sep 2023 01:34:41 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH RESEND v2 0/2] xen/arm: Enlarge identity map space
Date: Sat,  9 Sep 2023 16:34:08 +0800
Message-Id: <20230909083410.870726-1-leo.yan@linaro.org>
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


