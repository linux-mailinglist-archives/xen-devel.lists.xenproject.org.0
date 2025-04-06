Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091B8A7CD89
	for <lists+xen-devel@lfdr.de>; Sun,  6 Apr 2025 12:09:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.939121.1339358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1Mva-00036B-EJ; Sun, 06 Apr 2025 10:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 939121.1339358; Sun, 06 Apr 2025 10:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1Mva-000343-78; Sun, 06 Apr 2025 10:08:34 +0000
Received: by outflank-mailman (input) for mailman id 939121;
 Sun, 06 Apr 2025 10:08:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Phl=WY=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1u1MvY-00033e-St
 for xen-devel@lists.xenproject.org; Sun, 06 Apr 2025 10:08:33 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1756d443-12cf-11f0-9eaa-5ba50f476ded;
 Sun, 06 Apr 2025 12:08:31 +0200 (CEST)
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
X-Inumbo-ID: 1756d443-12cf-11f0-9eaa-5ba50f476ded
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743934110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQwCOy6q9LbJSv6h6iboKgyxHq/ApOr5eANcz1PszCU=;
	b=HZTI0L/3ifr8QVkdVDKgPuI906FSs7jsQXMp9Z8dqGyBz3NGgdsfamkpZMO1u5ptlkr+/9
	mPHGBMxNWmNRZ6zG977pJESL979B/9kkKcD05Kf65bnhVgCszr9L8uyVDIvZ9b/st1BAYR
	rEZhUXcB63UhO6MZsAIoZEG7Cd8jZclYPkcTHPobjoa3JBDD15k4h6TqaQbEcoMO27yrAf
	swMdEx++R9P3hTSu0BX2iwiCZgLcVlhos7Fs7QIduq143ICSwA5UUItneKm1nvLwaE/Cxv
	kwnNQ15PBEJZUQU/PZvP/xpzFuXyA6MNGG6B5VFiXEbEGvRG5IDr9kgljkz/BQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743934110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FQwCOy6q9LbJSv6h6iboKgyxHq/ApOr5eANcz1PszCU=;
	b=ouZORyKF32pmlPw1hKPc5hYgNHbzy8az9DUAOueIpumwnXA1yOx3iFZeAyElhtXDe5qEv+
	kn3D3zuGtTWVPTAQ==
To: Petr =?utf-8?Q?Van=C4=9Bk?= <arkamar@atlas.cz>,
 linux-kernel@vger.kernel.org
Cc: x86@kernel.org, xen-devel@lists.xenproject.org, Petr =?utf-8?Q?Van?=
 =?utf-8?Q?=C4=9Bk?=
 <arkamar@atlas.cz>, stable@vger.kernel.org, Juergen Gross
 <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/1] x86/cpu/topology: Don't limit CPUs to 1 for Xen PV
 guests due to disabled APIC
In-Reply-To: <20250405181650.22827-2-arkamar@atlas.cz>
References: <20250405181650.22827-1-arkamar@atlas.cz>
 <20250405181650.22827-2-arkamar@atlas.cz>
Date: Sun, 06 Apr 2025 12:08:29 +0200
Message-ID: <87ecy5wqjm.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 05 2025 at 20:16, Petr Van=C4=9Bk wrote:

> Xen PV guests in DomU have APIC disabled by design, which causes
> topology_apply_cmdline_limits_early() to limit the number of possible
> CPUs to 1, regardless of the configured number of vCPUs.

PV guests have a APIC emulation and there is no code which actually
disables the APIC by design unconditionally. There is one way though,
which disables the APIC indirectly.

xen_arch_setup() disables ACPI, which in turn causes acpi_mps_check() to
return 1, which disables the APIC. This only happens when the kernel
configuration has:

     CONFIG_X86_MPPARSE=3Dn
     CONFIG_ACPI=3Dy

If you enable MPPARSE the problem goes away, no?

> +	/* 'maxcpus=3D0' 'nosmp' 'nolapic'
> +	 *
> +	 * The apic_is_disabled check is ignored for Xen PV domains because Xen
> +	 * disables ACPI in unprivileged PV DomU guests, which would otherwise =
limit
> +	 * CPUs to 1, even if multiple vCPUs were configured.

This is the wrong place as it invalidates the effect of 'nolapic' on the
kernel command line for XEN PV.

You actually explain in the comment that XEN disables ACPI, so why are
you slapping this xen check into this code instead of doing the obvious
and prevent acpi_mps_check() to cause havoc?

Thanks,

        tglx

