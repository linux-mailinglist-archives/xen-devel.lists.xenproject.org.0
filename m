Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC12D69FA92
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 18:55:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499736.771030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUtKg-0001aT-0H; Wed, 22 Feb 2023 17:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499736.771030; Wed, 22 Feb 2023 17:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUtKf-0001X1-Tm; Wed, 22 Feb 2023 17:55:09 +0000
Received: by outflank-mailman (input) for mailman id 499736;
 Wed, 22 Feb 2023 17:55:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L7in=6S=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1pUtKe-0000qN-O5
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 17:55:08 +0000
Received: from bee.yew.relay.mailchannels.net (bee.yew.relay.mailchannels.net
 [23.83.220.14]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08a50463-b2da-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 18:55:06 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 0C7123C0F14
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 17:55:03 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 9C5503C121C
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 17:55:02 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.109.196.241 (trex/6.7.1); Wed, 22 Feb 2023 17:55:02 +0000
Received: from kmjvbox (c-76-102-200-71.hsd1.ca.comcast.net [76.102.200.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4PMP1x3PjLz16n
 for <xen-devel@lists.xenproject.org>; Wed, 22 Feb 2023 09:55:00 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e004a by kmjvbox (DragonFly Mail Agent v0.12);
 Wed, 22 Feb 2023 09:54:56 -0800
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
X-Inumbo-ID: 08a50463-b2da-11ed-93b6-47a8fe42b414
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1677088502; a=rsa-sha256;
	cv=none;
	b=8Zs+e79PUTur1pKIYqSseh/3YYpctXHHUG3GycmJb7iEdHZwh3xiQDMtSw3iwF/ElWC1jO
	ommpNiCmt8bdjc7iNnX2CTPHMLCAbdi+LYaKSIxBMDe5HkXDzumqkVrAPXlcv5onCo1Fzf
	f8LDvD2nu498InMVOz/Z6qo1sTBiDkpazfoI2YHajI+mGWi78Fe5zrwzNIcUOIYdPrZTIY
	a3cBj+wZwi8xYxHjL8cvLGxwzj0g0Na20M8Ui32qu9qvz329/CZYo3j3CBaqGoTXav3gPc
	OhL+H6VrfvTq1W9uYyWLriSjXYDEmSyqpTt3h/hELvjchL4kI/KAyyk6nEY1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1677088502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=SFO62oAKLgPH71Y0Xq/5Q3j7DH6Nq6RDi9wLwjcluGc=;
	b=h8mVkyZHbUBEALiaIWjXcFZz/KPRxjmuORzreG3ZSTkVSFqX5ixXfASZAtdAy38jhyMvge
	3hQqSabRrsfriX5TbsJiSpfAPdpWqCDVvCt4oQqYxintaQL31SdENyaZ2Z/+ge9mx4Bt+X
	vJ4gDwlb8X6P/P73dYWnWkSmxESDD4bFalo5+TL3t7qEXjw7WJukQKK0YEv1T00eK5gIxd
	e+FZbjPTUJzycm94qkwU99gXBlMB4eGtFkWLcalDZDGu2nZAXstKR80EF5j/c1Xp5jV3i7
	RRicXhz2UReH2NlM7OqBO5gmIKcXWDUKLrxFzGC/ZRGW2SkvMOxgMzoz2VURZQ==
ARC-Authentication-Results: i=1;
	rspamd-9788b98bc-pxv92;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Good
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Society-Bored: 028f1e1360e580b5_1677088502885_2835282340
X-MC-Loop-Signature: 1677088502885:1762775582
X-MC-Ingress-Time: 1677088502884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1677088501;
	bh=SFO62oAKLgPH71Y0Xq/5Q3j7DH6Nq6RDi9wLwjcluGc=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=vTqKdTqV3fyyocP+64zXlj1tzc67az1mF0QlGIVA7FWxEvS4mSVL+7fk4t/2Fcwtf
	 2pU84jGzaNFXWp/Bzge0J21sWy4OU5ap/jKeZcu17zdwPCeVivDtpNouR+3TN6D9Wu
	 Du4Fbz0DE1/+XUB7IPgSTi+etkSammTUibilmSYw=
Date: Wed, 22 Feb 2023 09:54:56 -0800
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
Subject: [PATCH linux-next v2 2/2] x86/xen/time: cleanup
 xen_tsc_safe_clocksource
Message-ID: <a69ca370fecf85d312d2db633d9438ace2af6e5b.1677038165.git.kjlx@templeofstupid.com>
References: <cover.1677038165.git.kjlx@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1677038165.git.kjlx@templeofstupid.com>

Modifies xen_tsc_safe_clocksource() to use newly defined constants from
arch/x86/include/asm/xen/cpuid.h.  This replaces a numeric value with
XEN_CPUID_TSC_MODE_NEVER_EMULATE, and deletes a comment that is now self
explanatory.

There should be no change in the function's behavior.

Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>
---
 arch/x86/xen/time.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 95140609c8a8..94056013a2a4 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -20,6 +20,7 @@
 #include <asm/pvclock.h>
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
+#include <asm/xen/cpuid.h>
 
 #include <xen/events.h>
 #include <xen/features.h>
@@ -495,11 +496,7 @@ static int __init xen_tsc_safe_clocksource(void)
 	/* Leaf 4, sub-leaf 0 (0x40000x03) */
 	cpuid_count(xen_cpuid_base() + 3, 0, &eax, &ebx, &ecx, &edx);
 
-	/* tsc_mode = no_emulate (2) */
-	if (ebx != 2)
-		return 0;
-
-	return 1;
+	return ebx == XEN_CPUID_TSC_MODE_NEVER_EMULATE;
 }
 
 static void __init xen_time_init(void)
-- 
2.25.1


