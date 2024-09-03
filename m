Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337D96971A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 10:32:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788820.1198286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOwo-0006VE-Ps; Tue, 03 Sep 2024 08:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788820.1198286; Tue, 03 Sep 2024 08:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOwo-0006Sz-Lv; Tue, 03 Sep 2024 08:31:34 +0000
Received: by outflank-mailman (input) for mailman id 788820;
 Tue, 03 Sep 2024 08:31:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oAku=QB=ti.com=vaishnav.a@srs-se1.protection.inumbo.net>)
 id 1slOwn-0006Sh-1X
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 08:31:33 +0000
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea419fb1-69ce-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 10:31:30 +0200 (CEST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4838VCSw012770;
 Tue, 3 Sep 2024 03:31:12 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4838VCrZ036671;
 Tue, 3 Sep 2024 03:31:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Sep 2024 03:31:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Sep 2024 03:31:11 -0500
Received: from uda0490681.. ([10.24.69.142])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4838V7kU085647;
 Tue, 3 Sep 2024 03:31:08 -0500
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
X-Inumbo-ID: ea419fb1-69ce-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1725352272;
	bh=hqeyzmvGdqaZH7UmCcauPjdhGh8RVSEQWcfiZFqvHec=;
	h=From:To:CC:Subject:Date;
	b=wyYEej1xCaI5MpeQQNwiZAQEoZWuo15tmtN2nVNydgU630xNy+rCOAkAA2ZmZNIVW
	 HNkdYXUjshXE35Sai4jafegILJLCGQMeCrKXbeEfA6GT7zliLRqUJYDjefBIRoaxNF
	 2w6WZjAR9RFu5k9fkcJ00aTFm/DgFw8qOizfS110=
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <tglx@linutronix.de>, <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <xen-devel@lists.xenproject.org>,
        <u-kumar1@ti.com>, <vaishnav.a@ti.com>
Subject: [RFC PATCH 0/1] Add interrupts property to interrupt aggregators/routers
Date: Tue, 3 Sep 2024 14:01:06 +0530
Message-ID: <20240903083107.3562816-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

The interrupt aggregator in TI K3 devices currently uses a
custom vendor property "ti,interrupt-ranges" [1] to specify the interrupt
source to parent mapping. As per interrupt controller bindings [2],
it is mandatory for Nodes that describe devices which generate
interrupts to contain an "interrupts" property, an "interrupts-extended"
property, or both.

Without this, standard DT parsing code cannot identify the mapping, 
for example while booting these platforms with Xen hypervisor, we see
that the interrupts are not injected to the guest Linux since the mapping
is missing, and Xen expects standard properties to specify the mapping[3],
while adding the interrupts fixes the issue, for some platforms the list of
interrupts can be so large with more than 192 entries[4], moreover in some
systems (like TI K3 platforms), system designers can change the mappings
according to system needs and a long list of repeating entries is error prone
and difficult to maintain.

Are there any existing solution to solve this problem of maintaining long list
of identical interrupt properties (mostly continuous) other than adding individual
entries one by one?

It looks like such general solutions will help multiple platforms, TI platforms
use ti,interrupt-ranges[1], Socionext platforms make use of socionext,interrupt-ranges[5]
and multiple other platforms which maintain long list of interrupts in DT[6] can benefit
from such general implementation. If there are no existing solution is it okay to add new
support for a general property, my proposal is for sometihing similar to interrupt-template
and interrupt-ranges as described in [7].

1- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi#n111
2- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
3- https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/common/device-tree/device-tree.c#l1135
4- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi#n1346
5- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi#n228
6- https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/nvidia/tegra234.dtsi#n126
7- https://android.googlesource.com/kernel/common/+/android-trusty-4.4/Documentation/devicetree/bindings/trusty/trusty-irq.txt#10

Thanks and Regards,
Vaishnav

Vaishnav Achath (1):
  arm64: dts: ti: k3-am62p-main: Add interrupts property for DMSS INTA

 arch/arm64/boot/dts/ti/k3-am62p-main.dtsi | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

-- 
2.34.1


