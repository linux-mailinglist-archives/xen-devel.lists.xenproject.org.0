Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACF219F16A
	for <lists+xen-devel@lfdr.de>; Mon,  6 Apr 2020 10:17:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jLMwL-00029G-Ts; Mon, 06 Apr 2020 08:17:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Lhp/=5W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jLMwJ-00029B-Kj
 for xen-devel@lists.xenproject.org; Mon, 06 Apr 2020 08:17:03 +0000
X-Inumbo-ID: fc9594e6-77de-11ea-bfd5-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fc9594e6-77de-11ea-bfd5-12813bfff9fa;
 Mon, 06 Apr 2020 08:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1586161019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5pHG+Clk9GGLPdJQKpggaAZW3Q+Tf++1CLgU5tkdt9E=;
 b=RermtGnwyOAi5rVAEX2GPNEye5kYI75Cg+zpEUXtT3ASN3QmcFO8l+qr
 zSAAhwbhiOLvEe8ZLaLFFf8VUQJmPNPfQMVqCIAK9tP0N8T3gsFkOQEeH
 +wrz0+ZEgdNYkNyhZ0zWgRDvrmCjFALo0WE1utpr5dr4G94mVY9NgNZcF k=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: S0ZaVdOmSpMen520XGvGllSvFqBFrCHUWeyOMkZJOp0Wa+mh5B/uTdmmP9M7N0yxjapSvje53W
 bH6CDhha7KvQStjC6XMcXRyybAiRtxp3bU5IAUwL9bAi3zG+Jv5MmFG192HGaRBcYcXgAihZsx
 LFn5PoUN4DwdmSrYXjMVm5cqiRgETdieL9Fq6w/C1sellsT4n/CdcH31q+2fh1qJhZfzjmrrf5
 /guyyUFVowbksTRIN5M/rP7mKqVrkxD0fD3HTn7C43xVU20UjLXp+3ZBs0X/URuavRtTMlNEVM
 dNM=
X-SBRS: 2.7
X-MesageID: 15541691
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.72,350,1580792400"; d="scan'208";a="15541691"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH OSSTEST] linux: enable x2APIC kernel support
Date: Mon, 6 Apr 2020 10:16:36 +0200
Message-ID: <20200406081636.78027-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: ian.jackson@eu.citrix.com, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Without it Linux is not able to parse the x2APIC ACPI MADT entries
crafted by Xen when booted in PVH mode, following log is from one of
the dom0pvh jobs:

ACPI: x2apic entry ignored
ACPI: x2apic entry ignored
ACPI: x2apic entry ignored
ACPI: x2apic entry ignored
IOAPIC[0]: apic_id 0, version 17, address 0xfec00000, GSI 0-23
IOAPIC[1]: apic_id 1, version 17, address 0xfec20000, GSI 24-55
ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
Using ACPI (MADT) for SMP configuration information
smpboot: Boot CPU (id 0) not listed by BIOS
smpboot: Allowing 1 CPUs, 0 hotplug CPUs

Note that PVH mode only creates x2APIC entries for simplicity, and
because x2APIC mode is always provided to PVH guests. Not adding
x2APIC support forces Linux to boot in UP mode, since x2APIC entries
contain the information of additional processors available on the
system.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 ts-kernel-build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/ts-kernel-build b/ts-kernel-build
index 89cdafcb..6c8f1d6a 100755
--- a/ts-kernel-build
+++ b/ts-kernel-build
@@ -622,6 +622,9 @@ esac
 # Disable components that don't build
 setopt CONFIG_TEGRA_HOST1X n
 
+# Enable x2APIC support for PVH mode
+setopt CONFIG_X86_X2APIC y
+
 exit 0
 END
 }
-- 
2.26.0


