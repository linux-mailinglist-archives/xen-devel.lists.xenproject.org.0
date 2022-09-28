Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0ED5EE16B
	for <lists+xen-devel@lfdr.de>; Wed, 28 Sep 2022 18:13:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413413.657035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odZfl-0000TI-7Q; Wed, 28 Sep 2022 16:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413413.657035; Wed, 28 Sep 2022 16:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odZfl-0000Qk-4D; Wed, 28 Sep 2022 16:12:33 +0000
Received: by outflank-mailman (input) for mailman id 413413;
 Wed, 28 Sep 2022 16:12:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00UQ=Z7=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1odZfi-0000Qe-RB
 for xen-devel@lists.xenproject.org; Wed, 28 Sep 2022 16:12:30 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 599a3466-3f48-11ed-964a-05401a9f4f97;
 Wed, 28 Sep 2022 18:12:29 +0200 (CEST)
Received: from zn.tnic (p200300ea9733e7ee329c23fffea6a903.dip0.t-ipconnect.de
 [IPv6:2003:ea:9733:e7ee:329c:23ff:fea6:a903])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9D1671EC058B;
 Wed, 28 Sep 2022 18:12:24 +0200 (CEST)
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
X-Inumbo-ID: 599a3466-3f48-11ed-964a-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1664381544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
	bh=P39ljKLiwuQPwtDvDuKVanquI0RYkjP1D8LuyTjtJJs=;
	b=Uao1ZphADuAsv6LM0PXKjLzWHVW6MpllBeF4uvmOQ+nQNKu9+hXBTS4RGyWezPZ0smbv/h
	IGZDd1BS828tjI6dOprjqWP0i4n19k+ZHCma3t7R0BXQ/TawsINhDvqGnP0458LIrxfMZX
	X0HwXQ23W2btK4ibPwovzxoqz5hFSFQ=
Date: Wed, 28 Sep 2022 18:12:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v3 08/10] x86/mtrr: let cache_aps_delayed_init replace
 mtrr_aps_delayed_init
Message-ID: <YzRyaLRqWd6YSgeJ@zn.tnic>
References: <d3cd5c50-24e7-ffba-de2d-cf00400f6e38@suse.com>
 <YzLo9IFDYW1T8BVZ@zn.tnic>
 <314e3bd3-3405-c0c3-225c-646d88cbfb1a@suse.com>
 <YzOEYsqM0UEsiFuS@zn.tnic>
 <73d8fabd-8b93-2e65-da4b-ea509818e666@suse.com>
 <24088a15-50a1-f818-8c3e-6010925bffbf@suse.com>
 <YzQmeh50ne8dyR2P@zn.tnic>
 <f8da6988-afa3-1e85-b47d-d91fc4113803@suse.com>
 <YzQui+rOGrM6otzp@zn.tnic>
 <c67d3887-498b-6e4d-857d-1cef7835421d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c67d3887-498b-6e4d-857d-1cef7835421d@suse.com>

On Wed, Sep 28, 2022 at 03:43:56PM +0200, Juergen Gross wrote:
> Would you feel better with adding a new enum member CPUHP_AP_CACHECTRL_ONLINE?
> 
> This would avoid a possible source of failure during resume in case no slot
> for CPUHP_AP_ONLINE_DYN is found (quite improbable, but in theory possible).

Let's keep that in the bag for the time when we get to cross that bridge.

> You wouldn't want to do that there, as there are multiple places where
> pm_sleep_enable_secondary_cpus() is being called.

We want all of them, I'd say. They're all some sort of suspend AFAICT.
But yes, if we get to do it, that would need a proper audit.

> Additionally not all cases are coming in via
> pm_sleep_enable_secondary_cpus(), as there is e.g. a call of
> suspend_enable_secondary_cpus() from kernel_kexec(), which wants to
> have the same handling.

Which means, more hairy.

> arch_thaw_secondary_cpus_begin() and arch_thaw_secondary_cpus_end() are
> the functions to mark start and end of the special region where the
> delayed MTRR setup should happen.

Yap, it seems like the best solution at the moment. Want me to do a
proper patch and test it on real hw?

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

