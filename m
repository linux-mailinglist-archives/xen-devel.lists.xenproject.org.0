Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CECC664746B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 17:37:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457361.715245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3JtP-0004s9-FP; Thu, 08 Dec 2022 16:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457361.715245; Thu, 08 Dec 2022 16:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3JtP-0004pe-Bx; Thu, 08 Dec 2022 16:37:03 +0000
Received: by outflank-mailman (input) for mailman id 457361;
 Thu, 08 Dec 2022 16:37:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pN/8=4G=templeofstupid.com=kjlx@srs-se1.protection.inumbo.net>)
 id 1p3JtN-0004pY-TQ
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 16:37:02 +0000
Received: from poodle.tulip.relay.mailchannels.net
 (poodle.tulip.relay.mailchannels.net [23.83.218.249])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86bcb1b4-7716-11ed-91b6-6bf2151ebd3b;
 Thu, 08 Dec 2022 17:36:58 +0100 (CET)
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 97D6D3C2986
 for <xen-devel@lists.xenproject.org>; Thu,  8 Dec 2022 16:36:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (unknown [127.0.0.6])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 33DE93C2999
 for <xen-devel@lists.xenproject.org>; Thu,  8 Dec 2022 16:36:54 +0000 (UTC)
Received: from pdx1-sub0-mail-a306.dreamhost.com (pop.dreamhost.com
 [64.90.62.162]) (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
 by 100.97.74.32 (trex/6.7.1); Thu, 08 Dec 2022 16:36:54 +0000
Received: from kmjvbox (c-73-70-108-208.hsd1.ca.comcast.net [73.70.108.208])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: kjlx@templeofstupid.com)
 by pdx1-sub0-mail-a306.dreamhost.com (Postfix) with ESMTPSA id 4NSfts2D3VzjL
 for <xen-devel@lists.xenproject.org>; Thu,  8 Dec 2022 08:36:52 -0800 (PST)
Received: from johansen (uid 1000) (envelope-from kjlx@templeofstupid.com)
 id e005f by kmjvbox (DragonFly Mail Agent v0.12);
 Thu, 08 Dec 2022 08:36:50 -0800
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
X-Inumbo-ID: 86bcb1b4-7716-11ed-91b6-6bf2151ebd3b
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1670517414; a=rsa-sha256;
	cv=none;
	b=3o/ujEW/sXEhdP/j6nse8IeWOSzxDgigztDMqArsTLaVl5sg8rvURDXSJHnxeJrmOB5rK3
	viQ0XaH1coQ+c3k1iXYxO+3xHtQXWjQ6U4C2o1KTYuaiswamfIbXtKHp2sf4OtR79umXu3
	ZXPe/tj7B19250n6ZBdecBfjYh/kBNhHhSxiqGpJ+zuTfA442Ef0v+YdFaJbdIBYjs5E5V
	GPEvvhLTMUOehneM23W+dueiOjWfqRY3/zEDPNA20gOQnK6NQ3mu/bG7PmMez7sYaa8MMU
	SxHFMFVtVncW6nV3uGCmPFb2VhJBPZLoRX8pdTgS4ZwLTgzDriPsHMnNYLn6XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1670517414;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 dkim-signature; bh=bs74ZGYQ9FzRSVBX/TLanMiHEEc4YJIYzYEP749rubo=;
	b=vpeLPixtILnavoTo+WT2h2ekur2rbWeHCxi+DL8hwkfF7WVxJWwa78XE1xBdFlHNRsUDVK
	tpdB7PnQQlcjV37Ab38qK34KSUxc/bfYsuaD3aKj1BRfULPfw9X2ywPXDHvflR8mxLxb1v
	HyefjLTTgrNpR7q9DcecSfQvlyM2ki0EGJENKNEdH5ch9dsUu0hV7W+L3XaKRQtnDGcpDn
	ERaoBTCNQ8JV74Z+5L9VGCZ2VG2Xu1/uhFjiD415w4yCzCzeC7M439F/BRkYQpsFH2RZsA
	riJuOU3BxJ+jSatcEr7rG0WMrvO4Fb47HD2Kf7mgR9WkdnFBvfYoRfG8dSho8Q==
ARC-Authentication-Results: i=1;
	rspamd-85f95c7974-8lndr;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=kjlx@templeofstupid.com
X-Sender-Id: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|kjlx@templeofstupid.com
X-MailChannels-Auth-Id: dreamhost
X-Oafish-Lyrical: 649e8ad758912dfb_1670517414435_1412210855
X-MC-Loop-Signature: 1670517414435:1129904494
X-MC-Ingress-Time: 1670517414435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=templeofstupid.com;
	s=dreamhost; t=1670517413;
	bh=bs74ZGYQ9FzRSVBX/TLanMiHEEc4YJIYzYEP749rubo=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=hESgpD/+OrzvH+6b1U6RKBOLOwJiqCQBT1mxoUxpUs5xzHKC70FZgmMfvPziG+V+t
	 3eBIu2KxYLoGa8i9QQd0boR7+3sD213cNgI7PAkExFAk+o++TiclVLFHv5RyUUfOsd
	 k+iXFBHCT0eW5xuSP4bTilUk6Bkr9itiOEoLNz5g=
Date: Thu, 8 Dec 2022 08:36:50 -0800
From: Krister Johansen <kjlx@templeofstupid.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Anthony Liguori <aliguori@amazon.com>,
	David Reaver <me@davidreaver.com>,
	Brendan Gregg <brendan@intel.com>
Subject: [PATCH linux-next] x86/xen/time: prefer tsc as clocksource when it
 is invariant
Message-ID: <20221208163650.GA3225@templeofstupid.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Kvm elects to use tsc instead of kvm-clock when it can detect that the
TSC is invariant.

(As of commit 7539b174aef4 ("x86: kvmguest: use TSC clocksource if
invariant TSC is exposed")).

Notable cloud vendors[1] and performance engineers[2] recommend that Xen
users preferentially select tsc over xen-clocksource due the performance
penalty incurred by the latter.  These articles are persuasive and
tailored to specific use cases.  In order to understand the tradeoffs
around this choice more fully, this author had to reference the
documented[3] complexities around the Xen configuration, as well as the
kernel's clocksource selection algorithm.  Many users may not attempt
this to correctly configure the right clock source in their guest.

The approach taken in the kvm-clock module spares users this confusion,
where possible.

Both the Intel SDM[4] and the Xen tsc documentation explain that marking
a tsc as invariant means that it should be considered stable by the OS
and is elibile to be used as a wall clock source.  The Xen documentation
further clarifies that this is only reliable on HVM and PVH because PV
cannot intercept a cpuid instruction.

In order to obtain better out-of-the-box performance, and reduce the
need for user tuning, follow kvm's approach and decrease the xen clock
rating so that tsc is preferable, if it is invariant, stable, and the
guest is a HVM or PVH domain.

[1] https://aws.amazon.com/premiumsupport/knowledge-center/manage-ec2-linux-clock-source/
[2] https://www.brendangregg.com/blog/2021-09-26/the-speed-of-time.html
[3] https://xenbits.xen.org/docs/unstable/man/xen-tscmode.7.html
[4] Intel 64 and IA-32 Architectures Sofware Developer's Manual Volume
    3b: System Programming Guide, Part 2, Section 17.17.1, Invariant TSC

Signed-off-by: Krister Johansen <kjlx@templeofstupid.com>
Code-reviewed-by: David Reaver <me@davidreaver.com>
---
 arch/x86/xen/time.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/time.c b/arch/x86/xen/time.c
index 9ef0a5cca96e..ca78581e4221 100644
--- a/arch/x86/xen/time.c
+++ b/arch/x86/xen/time.c
@@ -480,9 +480,22 @@ static void __init xen_time_init(void)
 	int cpu = smp_processor_id();
 	struct timespec64 tp;
 
-	/* As Dom0 is never moved, no penalty on using TSC there */
-	if (xen_initial_domain())
+	/*
+	 * As Dom0 is never moved, no penalty on using TSC there.
+	 *
+	 * If the guest has invariant tsc, then set xen_clocksource rating
+	 * below that of the tsc so that the system prefers tsc instead.  This
+	 * check excludes PV domains, because PV is unable to guarantee that the
+	 * guest's cpuid call has been intercepted by the hypervisor.
+	 */
+	if (xen_initial_domain()) {
 		xen_clocksource.rating = 275;
+	} else if ((xen_hvm_domain() || xen_pvh_domain()) &&
+	    boot_cpu_has(X86_FEATURE_CONSTANT_TSC) &&
+	    boot_cpu_has(X86_FEATURE_NONSTOP_TSC) &&
+	    !check_tsc_unstable()) {
+		xen_clocksource.rating = 299;
+	}
 
 	clocksource_register_hz(&xen_clocksource, NSEC_PER_SEC);
 
-- 
2.25.1


