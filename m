Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBAB1CD66E
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:22:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY5ZM-0004Li-8W; Mon, 11 May 2020 10:21:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AmMB=6Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jY5ZK-0004Ld-Kr
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:21:54 +0000
X-Inumbo-ID: 3bae6d30-9371-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3bae6d30-9371-11ea-b9cf-bc764e2007e4;
 Mon, 11 May 2020 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589192514;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c4qVm48SiE+9k82it/FvAxSBf0G4nzK3DjxTozoPa7Y=;
 b=ftww0LVqOinIxyw8+tPfkf8QpMg3X80ne0Z0SJ7ZQtqtjZy0lWV++5xw
 RUK+6WnNC0s2YC+9Q7DmL548+xoyapfOKwWZZJoc+gDWjANpnchOvEPV7
 MyoScFKppun+NdaxXQCzYraI8WbMiCXckHCweWJG/JYgQSKsXp/8fWpSz 0=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: s3GUxM4AJt54wrwnnts09AYyXrm/w/IKEDf+Dtun/2y+h9eYhqDz29aWd1iyr1Tz55kF7xQoAR
 IJTZ/x81FD1aNKOxObvDlHutOQ+/QgJyTvlhrDdzRXO2mpkgDRt+6AOxRWOz+wen2Z/jq2ovWf
 mlSVTfCwyvjG6QmUTjpKrxZ8G36wU3p+UTQIe/zyVsBOjGkCz/Km2duT0Fc81us+p75qeTB/xx
 BpY0bcxzWHdDP12ks56kBufq4woQYwTtAWdBoANKAkNZRA44Wyy9gW+2fWkE+LBTy9GUTCEYfB
 YaQ=
X-SBRS: 2.7
X-MesageID: 17192982
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,379,1583211600"; d="scan'208";a="17192982"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/mwait: remove unneeded local variables
Date: Mon, 11 May 2020 12:21:28 +0200
Message-ID: <20200511102128.36840-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Remove the eax and cstate local variables, the same can be directly
fetched from acpi_processor_cx without any transformations.

No functional change.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mwait-idle.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/cpu/mwait-idle.c b/xen/arch/x86/cpu/mwait-idle.c
index bb017c488f..6d10ac32b8 100644
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -721,7 +721,7 @@ static void mwait_idle(void)
 	unsigned int cpu = smp_processor_id();
 	struct acpi_processor_power *power = processor_powers[cpu];
 	struct acpi_processor_cx *cx = NULL;
-	unsigned int eax, next_state, cstate;
+	unsigned int next_state;
 	u64 before, after;
 	u32 exp = 0, pred = 0, irq_traced[4] = { 0 };
 
@@ -773,9 +773,6 @@ static void mwait_idle(void)
 	if (cx->type >= 3 && errata_c6_eoi_workaround())
 		cx = power->safe_state;
 
-	eax = cx->address;
-	cstate = ((eax >> MWAIT_SUBSTATE_SIZE) & MWAIT_CSTATE_MASK) + 1;
-
 #if 0 /* XXX Can we/do we need to do something similar on Xen? */
 	/*
 	 * leave_mm() to avoid costly and often unnecessary wakeups
@@ -785,7 +782,7 @@ static void mwait_idle(void)
 		leave_mm(cpu);
 #endif
 
-	if (!(lapic_timer_reliable_states & (1 << cstate)))
+	if (!(lapic_timer_reliable_states & (1 << cx->type)))
 		lapic_timer_off();
 
 	before = alternative_call(cpuidle_get_tick);
@@ -794,7 +791,7 @@ static void mwait_idle(void)
 	update_last_cx_stat(power, cx, before);
 
 	if (cpu_is_haltable(cpu))
-		mwait_idle_with_hints(eax, MWAIT_ECX_INTERRUPT_BREAK);
+		mwait_idle_with_hints(cx->address, MWAIT_ECX_INTERRUPT_BREAK);
 
 	after = alternative_call(cpuidle_get_tick);
 
@@ -807,7 +804,7 @@ static void mwait_idle(void)
 	update_idle_stats(power, cx, before, after);
 	local_irq_enable();
 
-	if (!(lapic_timer_reliable_states & (1 << cstate)))
+	if (!(lapic_timer_reliable_states & (1 << cx->type)))
 		lapic_timer_on();
 
 	rcu_idle_exit(cpu);
-- 
2.26.2


