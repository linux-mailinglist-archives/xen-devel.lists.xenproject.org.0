Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B7969719
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:32:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788821.1198291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOwo-0006YO-VM; Tue, 03 Sep 2024 08:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788821.1198291; Tue, 03 Sep 2024 08:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOwo-0006Vc-S7; Tue, 03 Sep 2024 08:31:34 +0000
Received: by outflank-mailman (input) for mailman id 788821;
 Tue, 03 Sep 2024 08:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oAku=QB=ti.com=vaishnav.a@srs-se1.protection.inumbo.net>)
 id 1slOwn-0006Sh-N9
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:31:33 +0000
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ead6f782-69ce-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 10:31:30 +0200 (CEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4838VFVq012845;
 Tue, 3 Sep 2024 03:31:15 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4838VFgC017237
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 3 Sep 2024 03:31:15 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 03:31:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 03:31:15 -0500
Received: from uda0490681.. ([10.24.69.142])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4838V7kV085647;
 Tue, 3 Sep 2024 03:31:12 -0500
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
X-Inumbo-ID: ead6f782-69ce-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725352275;
	bh=r/ew5NOkndZuuSGNjvFeQtkZxHPlPPdvrvcAeP2sPk0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iyxhHipF1DQ0ReaLJvbtU/7qwSw1BGXTTuacfNUnJrpm8Si0ASDZJfq/51w450eSx
	 wbeyOfcEo531rhHlj4Q33fr0avviu8QKc3jIg3pcgtgZH0XgAKuxhuUdQs5o7eReEc
	 u01Mo1iOYwinUPkEQ5WV/Rfaixeh5k3slOc42YH0=
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <tglx@linutronix.de>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
        <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [RFC DONOTMERGE PATCH 1/1] arm64: dts: ti: k3-am62p-main: Add interrupts property for DMSS INTA
Date: Tue, 3 Sep 2024 14:01:07 +0530
Message-ID: <20240903083107.3562816-2-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240903083107.3562816-1-vaishnav.a@ti.com>
References: <20240903083107.3562816-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The interrupt aggregator in DMSS for TI K3 devices currently uses a
custom vendor property "ti,interrupt-ranges" to specify the interrupt
source to parent mapping. As per interrupt controller bindings [1],
it is mandatory for Nodes that describe devices which generate
interrupts to contain an "interrupts" property, an "interrupts-extended"
property, or both. Add interrupts property to the Interrupt aggregator
node so that the mapping is specified in a standard manner.

1 - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---

DONOTMERGE - while adding the interrupts property helps to conform to the
bindings, it is difficult to maintain the long list and this is not the only
platform affected, if this is the direction to fix it, I will fix for all K3
platforms together, more details on RFC in cover letter.

 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
index 420c77c8e9e5..0c7912d177fe 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi
@@ -40,6 +40,41 @@ &oc_sram {
 
 &inta_main_dmss {
 	ti,interrupt-ranges = <5 69 35>;
+	interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
 };
 
 &main_pmx0 {
-- 
2.34.1


