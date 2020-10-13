Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11828C773
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 05:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6080.15957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSAan-0008SL-Bu; Tue, 13 Oct 2020 03:03:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6080.15957; Tue, 13 Oct 2020 03:03:13 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSAan-0008Rw-8Q; Tue, 13 Oct 2020 03:03:13 +0000
Received: by outflank-mailman (input) for mailman id 6080;
 Tue, 13 Oct 2020 03:03:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1kSAal-0008Rr-LJ
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 03:03:11 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecf83feb-d911-4198-8e97-33711573105a;
 Tue, 13 Oct 2020 03:03:09 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pNIz=DU=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
	id 1kSAal-0008Rr-LJ
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 03:03:11 +0000
X-Inumbo-ID: ecf83feb-d911-4198-8e97-33711573105a
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ecf83feb-d911-4198-8e97-33711573105a;
	Tue, 13 Oct 2020 03:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602558189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=JAZDZCYYIh8edTlKNiVcof5V1G+O0XlJEZ1gmZeAUqA=;
  b=DwfSHbpZtnuFkju9ALqEXTCZ/It/iOL/379GERhs9yQQN8SKueeGosyt
   7hWUtHKY/Zfn2fvp3IiizgFaK2Kj47KTH0rSL4u2zuwQ8B9B2SZsLUGD1
   ergz0i2vlQDWHrvrxtOAnW8o9oCe6EE+cJN6Y605mqHEKarQC5NKJB+fa
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: sovlgH73aKH9f49hPMHdrpe59eKDLPKHvGTzNIj2pTRlaBj7Fu+GLZKyKzQKlTpQErkjn+mCeU
 WzdTOvZyR+D1nKOL+oY8adbr992Y9szjg4OGGwQDsLhtPs1vFkh8JU+d3aPFtBGkYRTGc4NqLF
 69MSp1sbhCj3BKPTrRYz9E+dhJWYPCKY7TemigzBsnVDoN7K+qw2haZ5A8SENnC1BReq6YGPqm
 6UluNySXVNaeZj/CBEumv9IZcjn0T3II33CL9I5EWwjnoepoQjCbmZiqJEP7GQo5UAyKkuydJz
 Q+A=
X-SBRS: 2.5
X-MesageID: 28920670
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,369,1596513600"; 
   d="scan'208";a="28920670"
From: Igor Druzhinin <igor.druzhinin@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<wl@xen.org>, <jun.nakajima@intel.com>, <kevin.tian@intel.com>, Chen Yu
	<yu.c.chen@intel.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Igor Druzhinin <igor.druzhinin@citrix.com>
Subject: [PATCH 2/2] x86/mwait-idle: Customize IceLake server support
Date: Tue, 13 Oct 2020 04:02:49 +0100
Message-ID: <1602558169-23140-2-git-send-email-igor.druzhinin@citrix.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
References: <1602558169-23140-1-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Chen Yu <yu.c.chen@intel.com>

On ICX platform, the C1E auto-promotion is enabled by default.
As a result, the CPU might fall into C1E more offen than previous
platforms. So disable C1E auto-promotion and expose C1E as a separate
idle state.

Beside C1 and C1E, the exit latency of C6 was measured
by a dedicated tool. However the exit latency(41us) exposed
by _CST is much smaller than the one we measured(128us). This
is probably due to the _CST uses the exit latency when woken
up from PC0+C6, rather than PC6+C6 when C6 was measured. Choose
the latter as we need the longest latency in theory.

Signed-off-by: Chen Yu <yu.c.chen@intel.com>
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
[Linux commit a472ad2bcea479ba068880125d7273fc95c14b70]
Signed-off-by: Igor Druzhinin <igor.druzhinin@citrix.com>
---
Applying this gives almost 100% boost in sysbench cpu test on Whitley SDP
---
 xen/arch/x86/cpu/mwait-idle.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index 8add13d..f0c6ff9 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -554,6 +554,28 @@ static const struct cpuidle_state skx_cstates[] = {
 	{}
 };
 
+static const struct cpuidle_state icx_cstates[] = {
+       {
+               .name = "C1-ICX",
+               .flags = MWAIT2flg(0x00),
+               .exit_latency = 1,
+               .target_residency = 1,
+       },
+       {
+               .name = "C1E-ICX",
+               .flags = MWAIT2flg(0x01),
+               .exit_latency = 4,
+               .target_residency = 4,
+       },
+       {
+               .name = "C6-ICX",
+               .flags = MWAIT2flg(0x20) | CPUIDLE_FLAG_TLB_FLUSHED,
+               .exit_latency = 128,
+               .target_residency = 384,
+       },
+       {}
+};
+
 static const struct cpuidle_state atom_cstates[] = {
 	{
 		.name = "C1E-ATM",
@@ -904,6 +926,11 @@ static const struct idle_cpu idle_cpu_skx = {
 	.disable_promotion_to_c1e = 1,
 };
 
+static const struct idle_cpu idle_cpu_icx = {
+       .state_table = icx_cstates,
+       .disable_promotion_to_c1e = 1,
+};
+
 static const struct idle_cpu idle_cpu_avn = {
 	.state_table = avn_cstates,
 	.disable_promotion_to_c1e = 1,
@@ -958,6 +985,7 @@ static const struct x86_cpu_id intel_idle_ids[] __initconstrel = {
 	ICPU(0x8e, skl),
 	ICPU(0x9e, skl),
 	ICPU(0x55, skx),
+	ICPU(0x6a, icx),
 	ICPU(0x57, knl),
 	ICPU(0x85, knl),
 	ICPU(0x5c, bxt),
-- 
2.7.4


