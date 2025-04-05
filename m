Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A103BA7CB79
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 20:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938998.1339344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u18LE-0004Tl-B1; Sat, 05 Apr 2025 18:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938998.1339344; Sat, 05 Apr 2025 18:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u18LE-0004RG-7X; Sat, 05 Apr 2025 18:34:04 +0000
Received: by outflank-mailman (input) for mailman id 938998;
 Sat, 05 Apr 2025 18:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SaW9=WX=atlas.cz=arkamar@srs-se1.protection.inumbo.net>)
 id 1u184w-0000Fo-To
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 18:17:14 +0000
Received: from gmmr-3.centrum.cz (gmmr-3.centrum.cz [46.255.225.205])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eac0911-124a-11f0-9ffb-bf95429c2676;
 Sat, 05 Apr 2025 20:17:07 +0200 (CEST)
Received: from gmmr-1.centrum.cz (envoy-stl.cent [10.32.56.18])
 by gmmr-3.centrum.cz (Postfix) with ESMTP id 9ED62202136A
 for <xen-devel@lists.xenproject.org>; Sat,  5 Apr 2025 20:17:06 +0200 (CEST)
Received: from gmmr-1.centrum.cz (localhost [127.0.0.1])
 by gmmr-1.centrum.cz (Postfix) with ESMTP id 9BE90138
 for <xen-devel@lists.xenproject.org>; Sat,  5 Apr 2025 20:17:06 +0200 (CEST)
Received: from antispam35.centrum.cz (antispam35.cent [10.30.208.35])
 by gmmr-1.centrum.cz (Postfix) with ESMTP id 9A761EB
 for <xen-devel@lists.xenproject.org>; Sat,  5 Apr 2025 20:17:06 +0200 (CEST)
Received: from unknown (HELO gm-smtp10.centrum.cz) ([46.255.225.77])
 by antispam35.centrum.cz with ESMTP; 05 Apr 2025 20:17:06 +0200
Received: from localhost.localdomain (nat-86.starnet.cz [178.255.168.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by gm-smtp10.centrum.cz (Postfix) with ESMTPSA id 310E3809119F;
 Sat,  5 Apr 2025 20:17:06 +0200 (CEST)
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
X-Inumbo-ID: 2eac0911-124a-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1743877026; bh=yXYouCERO6MiAmq3afNjHMwOXCEudhdkAGgF935HzVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7j3ccAWICyhF2V6BIxEhxdLHkMFmmKEDwEdUP17RP7ZKZyrC314v9WFf5a4BgxVj
	 1hIqsadQTDCegMvkDqU1Azibz3NeqfDotLujTAkg1+sLIWfvwB9gfHSsMkaVg57KNu
	 mB4pU1uRDBw/tWDS0XhEtPRX0mphO4x0B+6JzfxY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=atlas.cz; s=mail;
	t=1743877026; bh=yXYouCERO6MiAmq3afNjHMwOXCEudhdkAGgF935HzVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7j3ccAWICyhF2V6BIxEhxdLHkMFmmKEDwEdUP17RP7ZKZyrC314v9WFf5a4BgxVj
	 1hIqsadQTDCegMvkDqU1Azibz3NeqfDotLujTAkg1+sLIWfvwB9gfHSsMkaVg57KNu
	 mB4pU1uRDBw/tWDS0XhEtPRX0mphO4x0B+6JzfxY=
X-CSE-ConnectionGUID: LpEm3r6RQEeORUl2pCsA1Q==
X-CSE-MsgGUID: V+tuc1VnQXy8xc/kD1A2Hg==
X-ThreatScanner-Verdict: Negative
X-IPAS-Result: =?us-ascii?q?A2FFAACUcvFn/03h/y5aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQFACYFKgzSBcYRVkXKLeYYzjVoODwEBAQEBAQEBAQkuF?=
 =?us-ascii?q?gQBAYR9CgKLKic4EwECBAEBAQEDAgMBAQEBAQEBAQENAQEGAQEBAQEBBgYBA?=
 =?us-ascii?q?oEdhTVTgluECAIBAwEiDwFGEBgNAiYCAicvGYMCgjABAzGtdYEyGgJl3HACS?=
 =?us-ascii?q?QVVZIEpgRouAYhPAYR8cIR3QoINgRWCeW+EG3WDDoJpBINIhA+CEB14hSQEE?=
 =?us-ascii?q?ldrhW+CRoogSIEFHANZLAFVEw0KCwcFgWwDNQwLLhUyRTgdgXyDeIU6ghGCB?=
 =?us-ascii?q?IkZhFotT4NzHUADCxgNSBEsNxQbBj0BbgeWaoQXAVgBNExbCsgOhCWETZUEh?=
 =?us-ascii?q?3caM5dSHgOSZJh+pEuEaIF+gX8zIjCDIlIZjjwWFst+djwCBwEKAQEDCYI7j?=
 =?us-ascii?q?S4zgUsBAQ?=
IronPort-PHdr: A9a23:S/RxYBzQ3qIVxP3XCzJ4zVBlVkEcU1XcAAcZ59Idhq5Udez7ptK+Z
 xaZva0m1Q6UBd6TwskHotSVmpioYXYH75eFvSJKW713fDhBpOMo2icNO4q7M3D9N+PgdCcgH
 c5PBxdP9nC/NlVJSo6lPwWB6nK94iQPFRrhKAF7Ovr6GpLIj8Swyuu+54Dfbx9HiTezf79+N
 gm6oRneusULhYZvKro9xxXUqXZUZupawn9lKl2Ukxvg/Mm74YRt8z5Xu/Iv9s5AVbv1cqElR
 rFGDzooLn446tTzuRfMVQWA6WIQX3sZnBRVGwTK4w30UZn3sivhq+pywzKaMtHsTbA1Qjut8
 aFmQwL1hSgdNj459GbXitFsjK9evRmsqQBzz5LSbYqIMvd1Y6HTcs4ARWdZXshfSTJMDJ6yY
 YUMCOQOP+hYoIbhqFUBtha+GQqhCfnzxjJSmnP736s32PkhHwHc2wwgGsoDvm7Ko9XpLqcZT
 O+6w7POzTDdbPNdxDDw55LSchAiu/6MWKh/cdDKxEY1CwPFik+fqZf/MzyJ1+UAqm6W5PdvW
 uyzkWAosR1xoiSxycc2jInEnp8ZxkzL+Ct53Yo4Id22RVNnbNCkH5VduCKXOop5T84tQ29lu
 zg3xLIFtJO5ciUHyZQqyhHCZ/GEcYWF4w/vWeWXLDxlh3xlYKqyihmz/ES61OHxVsm53ExUo
 iZbktTArHIA2h7L5sSaSPZw/V2t1SiP2g3T8O1IPEE5mKnBJ5Miw7M9kIcYv17ZES/sgkr2i
 bebdkAj+ue19evqeq7mppqAN49sjQH+L7gultS/AesmNggOWHCW+eu51LH65k35RalKjuUrn
 qXFqpzVOdoUpqilAw9Pz4Yj7gyzACun0dgAnHkHKkxKeA6fgoXmOlzCOu70APe/jli2jjtn2
 fDLMqfjD5jPNnTDla3ufbd5605S0gozytVf6opOBbEbI/L8QErxu8bCDhIiKQO03+LnB89m1
 o8ERW2OA7eVMLnOvl+Q+uIvP+6MaZcPtzbnKPgq/fvugmUjmVIGZ6apwZ8XZ2qjHvh8P0qYY
 GLggs0dHmcSogo+UOvqhUWNUDNQZnu/RKE86S8hCIKgE4jDQpqhgLub3Ce0BpFWfHxJCkiQE
 Xf0cIWJQ+sMaC2WIs5uiTEEUbmhS4k81RGyrg/6zLxnLuvb+yECqJ3sysB55/fPmhEq6Tx0E
 8Od3nmCTm5qmGMEXiI5075hoUNjzleOyqx4g/1DFdxP/PNFSAg7OoDaz+xiEdDyXQDBccmVR
 1a6WNmmBisxTt0pz98Uf0l9A8mijgzE3yeyB78VlrqLBIE7867F3Hj+Odx9y3DY26kllFQmX
 MRPOnO8hqJl9AjcGZTJk0OHmKaub6gc2zTN9GibwWqUoE5YSBJwUbnCXX0HfUvWsc726VjGT
 7CwErknLARBxtCYKqdQad3mk09GRPH9N9TaeW6xnH2wBRmQyrOKd4XlY38d0znFCEgYjwAT+
 m6LOAkmCii8oGLeDTluGEr3bU3j/+Zwtm+1Q1MywVLCU0o007uz5w5QhvGGTf4X9qwLtT1nq
 DhuGlu5mdXMBImuvQ1kKZ1Rfcl13l5BdmGR4wVnPZWlJrpKj0Iaeh8xtFG4hEY/MZlJjcV/9
 CBi9wF1M6/NiDt8
IronPort-Data: A9a23:AGCduqqg9G+79LRaHD6DMrB1sDVeBmItZBIvgKrLsJaIsI4StFCzt
 garIBmAaanZZGWhedoiPNyx/UNQuJeEyIIySAQ4+C03HysTo+PIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7wdOWn9D8kiPzgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvU0
 T/Ji5OZYQLNNwJcaDpOtvrf8E435pwehRtB1rAATaEW1LPhvyZNZH4vDfnZB2f1RIBSAtm7S
 47rpJml/nnU9gsaEdislLD2aCUiGtY+6iDT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWaqYEl51Y/KWyIzxZDEDe812FfUuFLYquhFTu+TLp6HNWyOEL/mDkCjalGDXkwp6KTgmy
 BAWFNwCRjSbquft2uyBc8Rhof4eKJPzF5g240g1mFk1Dd5+KXzCa6rPoMRdwC9p3oZFEPDCf
 dccLzF9BPjCS0ERfA1KVdRkxrru2SaXnz5w8Tp5oYI++WvayQVr+LHxNNPOPNeYLSlQth/B/
 juZoTWpWHn2MvShiiaY+SuSgNb/jHPrU8UROOSRrN5l1Qj7Kms7TUd+uUGAifCjiUe7Ush3I
 lAQ8zFoprpa3Fz7EPH+Uge+rXrCuQQTM/JMHOkqwAWMzLfI+QGfB3hCQjMpQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9KW4EeD9BTgYf5dTniJ88gwiJTdt5FqOxyNrvFlnY2
 CyDpiwzr6scgNRN1Kih+13DxTW2qfD0ohUduluRBD/4qFkjOcj6OORE9GTm0BqJF67BJnHpg
 ZTOs5H2ADwmZX1VqBGwfQ==
IronPort-HdrOrdr: A9a23:8IBfqa2G0WoSlVYuorbpqwqjBL8kLtp133Aq2lEZdPWaSKClfq
 eV7ZMmPH7P+VIssR4b9+xoVJPrfZqYz+8X3WBzB8bGYOCFggqVxehZhOOI/9SjIVydygc378
 hdmsZFZeEYdWIbsfrH
X-Talos-CUID: 9a23:iuJwBW04JW5cSWvYzDqqX7xfPtgIdybHkk3pDkKfM1ttEqW+UnbJwfYx
X-Talos-MUID: 9a23:4BZRfQVd+lILu7jq/AGvmCxpbflu2pS/WFAG1pYq4uDeFSMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.15,191,1739833200"; 
   d="scan'208";a="110176982"
From: =?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>
To: linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	xen-devel@lists.xenproject.org,
	=?UTF-8?q?Petr=20Van=C4=9Bk?= <arkamar@atlas.cz>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] x86/cpu/topology: Don't limit CPUs to 1 for Xen PV guests due to disabled APIC
Date: Sat,  5 Apr 2025 20:16:50 +0200
Message-ID: <20250405181650.22827-2-arkamar@atlas.cz>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250405181650.22827-1-arkamar@atlas.cz>
References: <20250405181650.22827-1-arkamar@atlas.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen PV guests in DomU have APIC disabled by design, which causes
topology_apply_cmdline_limits_early() to limit the number of possible
CPUs to 1, regardless of the configured number of vCPUs.

This is a regression introduced in version 6.9 in commit 7c0edad3643f
("x86/cpu/topology: Rework possible CPU management") which added an
early check that limits CPUs if apic_is_disabled, without accounting for
the fact that Xen PV guests always disable APIC even when SMP is
supported.

This patch fixes the issue by skipping the apic_is_disabled check for
Xen PV guests, allowing them to boot with the full set of configured vCPUs.

Fixes: 7c0edad3643f ("x86/cpu/topology: Rework possible CPU management")
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: x86@kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Petr Vaněk <arkamar@atlas.cz>
---
 arch/x86/kernel/cpu/topology.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/topology.c b/arch/x86/kernel/cpu/topology.c
index 01456236a6dd..10aa7f471ec9 100644
--- a/arch/x86/kernel/cpu/topology.c
+++ b/arch/x86/kernel/cpu/topology.c
@@ -428,8 +428,13 @@ void __init topology_apply_cmdline_limits_early(void)
 {
 	unsigned int possible = nr_cpu_ids;
 
-	/* 'maxcpus=0' 'nosmp' 'nolapic' */
-	if (!setup_max_cpus || apic_is_disabled)
+	/* 'maxcpus=0' 'nosmp' 'nolapic'
+	 *
+	 * The apic_is_disabled check is ignored for Xen PV domains because Xen
+	 * disables ACPI in unprivileged PV DomU guests, which would otherwise limit
+	 * CPUs to 1, even if multiple vCPUs were configured.
+	 */
+	if (!setup_max_cpus || (!xen_pv_domain() && apic_is_disabled))
 		possible = 1;
 
 	/* 'possible_cpus=N' */
-- 
2.48.1


