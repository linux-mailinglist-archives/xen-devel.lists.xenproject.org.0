Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C16A5851D8
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 16:53:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377564.610835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRM1-0003Ad-MD; Fri, 29 Jul 2022 14:52:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377564.610835; Fri, 29 Jul 2022 14:52:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHRM1-00038C-J4; Fri, 29 Jul 2022 14:52:41 +0000
Received: by outflank-mailman (input) for mailman id 377564;
 Fri, 29 Jul 2022 14:52:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N3XD=YC=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oHRM0-0002gj-8T
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 14:52:40 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 177c6524-0f4e-11ed-924f-1f966e50362f;
 Fri, 29 Jul 2022 16:52:39 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id e15so6126878edj.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 07:52:39 -0700 (PDT)
Received: from uni.router.wind (adsl-93.176.58.224.tellas.gr. [176.58.224.93])
 by smtp.googlemail.com with ESMTPSA id
 b1-20020a05640202c100b0043cf2e0ce1csm2415545edx.48.2022.07.29.07.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 07:52:38 -0700 (PDT)
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
X-Inumbo-ID: 177c6524-0f4e-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=97bxCy1H9CWPFXdyrOUwU6geXueYNxo4AEs0ZNp/ZGQ=;
        b=lXcpLvMO7A/UbF3Wj2ZdzXB0a8eCtoOHN8AJWPTB4Q2Qspfp2hzc1fGQOCde/UtV28
         xzi6cCsC8ahZ15dfrHoiQ/48tWWmtzdYmiTgyj+6KS5tmIukBsr+BlJCFNm+N0chmh/j
         v1jx01Xzjut2UBaaGwZvK+7agZum+CXBS/cUFJzwlse6X5Hmr/IWbRmvqk5jdsrviRZ/
         KUhXd633ljEcXPiJhhWewEaZnSYJydYmRwgwEdQEif/miNmjDQW7RVpEMTpLtIognD40
         J1dO5Tt+Ac5wn8cEynjwc9i2uh03XxZvv27914y5tPzeODK9CqhuXJYt1qXKkbGIVZd/
         a1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=97bxCy1H9CWPFXdyrOUwU6geXueYNxo4AEs0ZNp/ZGQ=;
        b=lwN9RorkS7J1fLD7Gytlm8KGcMGMeno87MhR95AQ8yXql43fvoXowQaHDwkn6MsFDk
         a38lAmwJ5685EMS9KZHu+DAzRXU8xfeeJdLyC9u1CHTaAoDV8ColNQepGsBWLrLujWNW
         HGeC4WUGA+pZ4F7Skmx95V4biNAW6pXDT5PhxexkMp56z1yNWdPxo+7IU16770wLEoP4
         uuX7m5dTET94kgH+tM7hCI19b/uGM/OjN8gvOHD32yhFRWODf1y3LRssw+0sj8BVpf8V
         cIF2Qg9mO6P58sKxWzHxEqsSV2ms0jXEplPeqt8AT2oYGjCDSjlP6BUKwdn+l1NVTXP/
         hncw==
X-Gm-Message-State: AJIora9FSlAD+NxMx6GxEt0UY4xqG6hSNPs4fW1KCfIqb6fuuLNeuxNO
	odzunEMp2eBWK+u9OyNsS/q8rx5nDVbHsA==
X-Google-Smtp-Source: AGRyM1tDmzOOATUb7OLpWHss6egcQzr2fExsfi2JUOd8sSR4CucbJxDXsBQNp4v7Cu0pQSlPiP+3AA==
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id b10-20020a056402084a00b00423fe998c53mr3973622edz.195.1659106358943;
        Fri, 29 Jul 2022 07:52:38 -0700 (PDT)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/3] automation: qemu-smoke-arm64.sh: Rename the device tree to avoid confusion
Date: Fri, 29 Jul 2022 17:52:28 +0300
Message-Id: <20220729145229.1250221-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220729145229.1250221-1-burzalodowa@gmail.com>
References: <20220729145229.1250221-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the device tree from virt-gicv3 to virt-gicv2 to avoid confusion
since the version of the generic interrupt controller used for this test
is the v2 and not the v3.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---
 automation/scripts/qemu-smoke-arm64.sh | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
index f483a2ffc1..7ac82b2278 100755
--- a/automation/scripts/qemu-smoke-arm64.sh
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -36,11 +36,11 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
    -machine virtualization=true \
    -cpu cortex-a57 -machine type=virt \
    -m 1024 -display none \
-   -machine dumpdtb=binaries/virt-gicv3.dtb
+   -machine dumpdtb=binaries/virt-gicv2.dtb
 # XXX disable pl061 to avoid Linux crash
-dtc -I dtb -O dts binaries/virt-gicv3.dtb > binaries/virt-gicv3.dts
-sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv3.dts > binaries/virt-gicv3-edited.dts
-dtc -I dts -O dtb binaries/virt-gicv3-edited.dts > binaries/virt-gicv3.dtb
+dtc -I dtb -O dts binaries/virt-gicv2.dtb > binaries/virt-gicv2.dts
+sed 's/compatible = "arm,pl061.*/status = "disabled";/g' binaries/virt-gicv2.dts > binaries/virt-gicv2-edited.dts
+dtc -I dts -O dtb binaries/virt-gicv2-edited.dts > binaries/virt-gicv2.dtb
 
 
 # Busybox
@@ -73,7 +73,7 @@ cd ..
 echo 'MEMORY_START="0x40000000"
 MEMORY_END="0x80000000"
 
-DEVICE_TREE="virt-gicv3.dtb"
+DEVICE_TREE="virt-gicv2.dtb"
 XEN="xen"
 DOM0_KERNEL="Image"
 DOM0_RAMDISK="initrd"
-- 
2.34.1


