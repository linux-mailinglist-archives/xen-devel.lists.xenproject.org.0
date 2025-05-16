Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F128AB9D1B
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 15:20:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987137.1372592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuyI-0005Yo-Td; Fri, 16 May 2025 13:19:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987137.1372592; Fri, 16 May 2025 13:19:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFuyI-0005Wk-Px; Fri, 16 May 2025 13:19:30 +0000
Received: by outflank-mailman (input) for mailman id 987137;
 Fri, 16 May 2025 13:19:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iEeH=YA=kernel.org=mingo@srs-se1.protection.inumbo.net>)
 id 1uFuyI-0005We-03
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 13:19:30 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64783a4a-3258-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 15:19:28 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C9C15A4E7B5;
 Fri, 16 May 2025 13:19:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A561C4CEE4;
 Fri, 16 May 2025 13:19:23 +0000 (UTC)
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
X-Inumbo-ID: 64783a4a-3258-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747401566;
	bh=oaUy859dTcPr4O32A6D5WWt1R4OnjuyJMMmb5wlJIm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDb+IMC//aX/x5nhjvb58hALgb2f9WnP8dQdFi/IebqgY5NZyymEASPMa46QOmkWZ
	 UwZIAvwWdTMFwlWSD1mbNEG3NbjSq/QjvKT13dtrEo1aUk2O8tRxHucWSK5dk6kThQ
	 bipJC1UdM2t4QT3UqsmsOb3VzB/qCF3/JW9p5hVp3y4kRdiSUIZikQrfMyi1Xhvf4J
	 d20/f+L6D11ww1wFQ0jhbLfou8JcteHWU5X5taApXcwEULk8fY38p2DN7OE5RJUhmU
	 suyOC+HV2K0rQH8RccDoV8gFbBjEj6AK8VkT4BudkAqXTIsT8s3XdSfw+bo563odYv
	 SVS86C9BWl1ow==
Date: Fri, 16 May 2025 15:19:20 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Xin Li <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-acpi@vger.kernel.org, tglx@linutronix.de, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	peterz@infradead.org, jgross@suse.com, boris.ostrovsky@oracle.com,
	rafael@kernel.org, lenb@kernel.org
Subject: Re: [PATCH v1 2/3] x86/xen/msr: Fix uninitialized symbol 'err'
Message-ID: <aCc7WG9eniyTCgHl@gmail.com>
References: <20250512084552.1586883-1-xin@zytor.com>
 <20250512084552.1586883-3-xin@zytor.com>
 <aCYIblffvBGUuxWf@gmail.com>
 <30affad5-4f26-4e22-9d64-b8ece1199773@zytor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30affad5-4f26-4e22-9d64-b8ece1199773@zytor.com>


* Xin Li <xin@zytor.com> wrote:

> On 5/15/2025 8:29 AM, Ingo Molnar wrote:
> > 
> > * Xin Li (Intel) <xin@zytor.com> wrote:
> > 
> > > xen_read_msr_safe() currently passes an uninitialized argument err to
> > > xen_do_read_msr().  But as xen_do_read_msr() may not set the argument,
> > > xen_read_msr_safe() could return err with an unpredictable value.
> > > 
> > > To ensure correctness, initialize err to 0 (representing success)
> > > in xen_read_msr_safe().
> > > 
> > > Because xen_read_msr_safe() is essentially a wrapper of xen_do_read_msr(),
> > > the latter should be responsible for initializing the value of *err to 0.
> > > Thus initialize *err to 0 in xen_do_read_msr().
> > > 
> > > Fixes: 502ad6e5a619 ("x86/msr: Change the function type of native_read_msr_safe()")
> > > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > Closes: https://lore.kernel.org/xen-devel/aBxNI_Q0-MhtBSZG@stanley.mountain/
> > > Signed-off-by: Xin Li (Intel) <xin@zytor.com>
> > > ---
> > >   arch/x86/xen/enlighten_pv.c | 5 ++++-
> > >   1 file changed, 4 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
> > > index 3be38350f044..01f1d441347e 100644
> > > --- a/arch/x86/xen/enlighten_pv.c
> > > +++ b/arch/x86/xen/enlighten_pv.c
> > > @@ -1091,6 +1091,9 @@ static u64 xen_do_read_msr(u32 msr, int *err)
> > >   {
> > >   	u64 val = 0;	/* Avoid uninitialized value for safe variant. */
> > > +	if (err)
> > > +		*err = 0;
> > > +
> > >   	if (pmu_msr_chk_emulated(msr, &val, true))
> > >   		return val;
> > > @@ -1162,7 +1165,7 @@ static void xen_do_write_msr(u32 msr, u64 val, int *err)
> > >   static int xen_read_msr_safe(u32 msr, u64 *val)
> > >   {
> > > -	int err;
> > > +	int err = 0;
> > >   	*val = xen_do_read_msr(msr, &err);
> > >   	return err;
> > 
> > So why not initialize 'err' with 0 in both callers, xen_read_msr_safe()
> > and xen_read_msr(), and avoid all the initialization trouble in
> > xen_do_read_msr()?
> 
> Yeah, I should make the change in xen_read_msr() too.
> 
> However xen_do_read_msr() should be implemented in a defensive way to
> set *err properly as it's part of its return value.  Actually it was so,
> but one of my previous cleanup patch removed it because err is no longer
> passed to pmu_msr_chk_emulated().

Maybe. It's up to Juergen though.

Thanks,

	Ingo

