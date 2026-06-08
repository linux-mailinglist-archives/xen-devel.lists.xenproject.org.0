Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RCu9BzjcJmrelwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:14:00 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9345657E40
	for <lists+xen-devel@lfdr.de>; Mon, 08 Jun 2026 17:13:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bS1Y4UZ7;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from list by lists.xenproject.org with outflank-mailman.1331939.1594591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbfR-00028q-FX; Mon, 08 Jun 2026 15:13:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1331939.1594591; Mon, 08 Jun 2026 15:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wWbfR-000264-Ca; Mon, 08 Jun 2026 15:13:33 +0000
Received: by outflank-mailman (input) for mailman id 1331939;
 Mon, 08 Jun 2026 15:13:31 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <tglx@kernel.org>) id 1wWbfP-00025x-Gj
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 15:13:31 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wWbfO-00DLol-P4
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2026 17:13:30 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <tglx@kernel.org>)
 id 6a26dc13-5cb7-0a2a0a5109dd-0a2a450ae972-34
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:13:30 +0200
Received: from [172.105.4.254] (helo=tor.source.kernel.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <tglx@kernel.org>)
 id 6a26dc19-56b3-0a2a450a0019-ac6904feda18-3
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jun 2026 17:13:30 +0200
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 855CD601E2;
 Mon,  8 Jun 2026 15:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 945A51F00893;
 Mon,  8 Jun 2026 15:13:27 +0000 (UTC)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780931608;
	bh=mg7/+m75L9vy7oRrRsWTHKmIvgWh3VyWCWO0qvJldsU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=bS1Y4UZ7FizRBBWK1g26cJ9yx1nivTVjql/1FOqywg7FmLw+3X1iFcs/o3Up5u2Ww
	 9MZXZL0vXeM2u6pQUf1FrcgDh/76TkpN8rpow7BzYvSjv0OjV3RAAEsgQhDWTOkpKA
	 LIASIOcBbX45Ci3i+oEqZV/AQhcE3fTVcld5yDqMFCDQ1Y9/Bw9QsR5BFxsdepxaSk
	 dxaoDfPSogdWC4YxIxlGLhWPIYMR7aDYdtE9LggWE4S7r/z/VFKgFVAVdLPUPurQkS
	 Aq1CO+QLmIDff0SXJBlY8Aj9jJCd6SnObydvK2NHgjaAruCn/QboYP+pvkSUe312SN
	 LccP1gIIZFXnA==
From: Thomas Gleixner <tglx@kernel.org>
To: Teddy Astie <teddy.astie@vates.tech>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Olivier Lambert
 <olivier.lambert@vates.tech>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests
 during PV spinlock initialization
In-Reply-To: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
Date: Mon, 08 Jun 2026 17:13:25 +0200
Message-ID: <87ldcp3w16.ffs@fw13>
MIME-Version: 1.0
Content-Type: text/plain
X-purgate-ID: tlsNG-4011c0/1780931610-73F798B7-7A940546/0/0
X-purgate-type: clean
X-purgate-size: 1804
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.19 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:teddy.astie@vates.tech,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:olivier.lambert@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B9345657E40

On Mon, Jun 08 2026 at 12:29, Teddy Astie wrote:
> In 6.12.5+ kernels on AMD CPUs, we observe abnormally long boot times 
> where the guest is struggling on PV spinlock initialization.
>
> This occurs starting with 6.12.5, and also on more recent kernels on 
> Intel platforms, but that hasn't been fully investigated at this time 
> (but I assume it's a variant of the same issue).
>
> This occurs since a backport of 76031d9 ("clocksource: Make negative 
> motion detection more robust").
>
> Some (claude-based) analysis made appears to relate that to the lack of 
> proper max_raw_delta in the jiffies clocksource which appears to make 
> the clock fail to progress meaningfully.
>
> Here is a raw summary of the analysis
>  > We tracked it down to a single stable backport in 6.12.5: commit 
> 1a678f6829a8 ("clocksource: Make negative motion detection more robust", 
> upstream 76031d9536a0). It introduces a max_raw_delta field on struct 
> clocksource but never initializes it for the default boot timekeeper 
> (the jiffies clocksource), so clocksource_delta() clamps every delta to 
> 0 and CLOCK_MONOTONIC freezes while that clocksource is active.

Bah. jiffies clocksource is registered way _after_ timekeeping started to
use it.

The untested below should fix that.

Thanks,

        tglx
---
--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -60,15 +60,9 @@ EXPORT_SYMBOL(get_jiffies_64);
 
 EXPORT_SYMBOL(jiffies);
 
-static int __init init_jiffies_clocksource(void)
-{
-	return __clocksource_register(&clocksource_jiffies);
-}
-
-core_initcall(init_jiffies_clocksource);
-
 struct clocksource * __init __weak clocksource_default_clock(void)
 {
+	clocksource_register(&clocksource_jiffies);
 	return &clocksource_jiffies;
 }
 


