Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD2869D207
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 18:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498292.769154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9mt-0006Db-Ju; Mon, 20 Feb 2023 17:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498292.769154; Mon, 20 Feb 2023 17:17:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU9mt-0006B1-Gi; Mon, 20 Feb 2023 17:17:15 +0000
Received: by outflank-mailman (input) for mailman id 498292;
 Mon, 20 Feb 2023 17:17:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kEKe=6Q=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pU9ms-00064N-7y
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 17:17:14 +0000
Received: from gold.apple.relay.mailchannels.net
 (gold.apple.relay.mailchannels.net [23.83.208.72])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68b9cdcc-b142-11ed-93b5-47a8fe42b414;
 Mon, 20 Feb 2023 18:17:11 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id ABE0688175E
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 17:17:09 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 4CDFB88184A
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 17:17:09 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.120.227.140 (trex/6.7.1); Mon, 20 Feb 2023 17:17:09 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4PL8H76xmYz14y
 for <xen-devel@lists.xenproject.org>; Mon, 20 Feb 2023 09:17:07 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e0067 by kmjvbox (DragonFly Mail Agent v0.12);
 Mon, 20 Feb 2023 09:17:04 -0800
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
X-Inumbo-ID: 68b9cdcc-b142-11ed-93b5-47a8fe42b414
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1676913429; a=rsa-sha256;
	cv=none;
	b=kvnksgyh6M8oen6dXHa6hqwrt0jYmY79LMBMaoI1zA39VHsu55q9+GDTX/8PpDQO41/syg
	tq3Mwm4LnvT/ruGjzdDBmZKeIO3Pr9biW2Z2VyL+c0fVlyTwS4cLuIfernBesdjMZ1VfnY
	UJGK/4Irz+IBqL+0UOQCt3Q9Lc8YEJ9itq4Xh6+aqQy/opSK8ghgoVwVcSlb7+Z8OmYhzo
	gViuhA0KA8mAbQzGS3Skg1GbvAQBhoxcn6XbWKhZWpwVkj5giAFsGcG877wrsZW/AfaBEl
	KzZwIkpGwgf/M+ZR1uXpEt5ePH4y4Avi1BEyakqBy1NjIS2qH5QgvuuxF6/chg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1676913429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=1W/yHp+digs/9tQmrEdxtc9OFifUEYrTHbBFllZM5ek=;
	b=J5WP74FErdjwIGmhBynl9T4C1+WS224WE7CKPt25NBtgS3CtoPpUongJ/S06U09ud2vnHB
	IYSxUzn7j1TTn7ZhNxo03brQHY4HL9z77GM7LLfAOBiZT2uC0hzojc0FUoH0jtUCRLKx/B
	bf4puFtu1qm7pJxFDEkUo0eLMGtPYTT24MEXm779X4kT9S7bnQu/iEKcglWNR0cOJJTi+E
	ujCOgCQaHDGdQyoDhdETkCDu+fnbybw2pGakwmZh34eO97bIAnv/m5NzZCkTW1NePgTi+b
	ZpA2/Hvk1X6MtXlQ0IP7Kpp6bNZQJL7dHqndt1mx4Fj5C52dBqT/HFVAoDe66w==
ARC-Authentication-Results: i=1;
	rspamd-5db48964c-wmdpd;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Good
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Skirt-Well-Made: 2c2945951908affb_1676913429530_3151703476
X-MC-Loop-Signature: 1676913429530:3091638531
X-MC-Ingress-Time: 1676913429530
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1676913428;
	bh=1W/yHp+digs/9tQmrEdxtc9OFifUEYrTHbBFllZM5ek=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=UUG+txwSbZjwjKPTHOyD8W9Nra+sAjzKNx1Z6Zjyj2c3VHCmyut7CT3coeCJ0wFee
	 Wxoq7Kx4mLjOFB5TJiSakB0a5Dwa8JHYwJLGt5lY2dAgcucToTPtRj2A7vMLrsfGup
	 4IrCnF1Oay8LPGaD551QoJYhFev96Qv8lxefMIik=
Date: Mon, 20 Feb 2023 09:17:04 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: [PATCH linux-next 2/2] x86/xen/time: cleanup xen_tsc_safe_clocksource
Message-ID: <f6bab47230b00cecb67f2c5d94716c8236609967.1676610413.git.kjlx@templeofstupid.com>
References: <cover.1676610413.git.kjlx@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1676610413.git.kjlx@templeofstupid.com>

Modifies xen_tsc_safe_clocksource() to use newly defined constants from
arch/x86/include/asm/xen/cpuid.h.  This replaces a numeric value with
XEN_CPUID_TSC_MODE_NEVER_EMULATE, and deletes a comment that is now self
explanatory.

There should be no change in the function's behavior.

Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>
---
 arch/x86/xen/time.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 95140609c8a8..cf6dd9f9fa6a 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -20,6 +20,7 @@
 #include <asm/pvclock.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
+#include <asm/xen/cpuid.h>
 
 #include <xen/events.h>
 #include <xen/features.h>
@@ -495,8 +496,7 @@ static int __init xen_tsc_safe_clocksource(void)
 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
 
-	/* tsc_mode = no_emulate (2) */
-	if (ebx != 2)
+	if (ebx != XEN_CPUID_TSC_MODE_NEVER_EMULATE)
 		return 0;
 
 	return 1;
-- 
2.25.1


