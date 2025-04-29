Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B75AA0552
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 10:16:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971626.1359990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9g85-0006Kn-U6; Tue, 29 Apr 2025 08:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971626.1359990; Tue, 29 Apr 2025 08:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9g85-0006JL-RX; Tue, 29 Apr 2025 08:15:49 +0000
Received: by outflank-mailman (input) for mailman id 971626;
 Tue, 29 Apr 2025 08:15:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b72w=XP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u9g84-0006JF-0f
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 08:15:48 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26f2f2ab-24d2-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 10:15:46 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43cf06eabdaso50304125e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 01:15:46 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4409d2ac079sm180769485e9.18.2025.04.29.01.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 01:15:45 -0700 (PDT)
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
X-Inumbo-ID: 26f2f2ab-24d2-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745914546; x=1746519346; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mt/hBtYcqb8jtbnsfP7wWhfKvH9xH3CJMA9BbdB5H2c=;
        b=dAMtzNyMEPvEZFww8gOb3RA8tpFnHiKi1MB3/hEtqRXa/KCPs9icpjQkfP/uujs3Hr
         D8wVDkY8vE+U5IGqqlqf5TYVVWJkvHIDcC5/ClbQ2ImN1kPp20rG6sUKrHZI/2VFWNCV
         /N/CAsRyonXywdImfUCr/2cXRpTPt2rRFOBQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745914546; x=1746519346;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mt/hBtYcqb8jtbnsfP7wWhfKvH9xH3CJMA9BbdB5H2c=;
        b=MttmOlo0VHlX/mt+B9+OueO4nSvc+U85LVdLjUI89V1hrmbMp6c6wjJK7yMh5hL+AE
         ZeM1a1W/FYUlNpuqZy7kXmFhzeUmjfuxuRGopChJiaZp/NgquIASchN1oKuyGIkX+xDj
         39MbTuci4XPsT+iGgBK94dBwXQtSneUFbMBLSRGOkDFnKnuFVANEr6tQPDUXS26kGtU+
         DRjpGZ68BSUOPXv9QrnwDbSjQEpBKIHYe8pHOSS6n115Kj44xnAJ5IVX4wsnbOBPG+xj
         7K0Vl2KKGt7GkaYloLbj4kMXzzfXsYdpeaXtdrMttx0equAEuMDTIuxfNUhNJ7//pRd2
         tKAw==
X-Forwarded-Encrypted: i=1; AJvYcCW5lAisOXSdzbt6kuTVwvAIwEtl9Cs8fHkUQBC7YWYYZS57LNBhe88uELzfhfIf6nR3eeJglTnAC0M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTZy8bAQahZjGXbQaq5LzzfyRd3g8sS1cM0iwdEOds+Uu3RGdt
	xSUeWZHwU60a+dVmpEczk7yi7dugHtziplcEp8GQqZd31gmMPesV/dCi6IGqRXA=
X-Gm-Gg: ASbGncuP4QLgFdOOpHuOQWAit7qP+LEZ8/kl9Ey2O83+O9sIuNjIjZtUuJeg0G0ZmxR
	tRGGhPr5/RJIpo8T8ZGt+B7CDgq/NOW2coR+qtveXjJZw02/Yc9vkbxKc2renzDfXD7m98lAbCi
	0Z4waZFwFiERTnqVlG7xN8hJpU8MFBSNkQT6rdnhEk047I9XGtT6NeIWFk0XpJyeHwp8Q+2JM9M
	pnbRSfKdDX5b2+6XGZ2yfFEL8FSPcTySuqFAVl46JoO/DX1jecVljc9jug9KJo07xGZd0ytGSUE
	oJ9sOTvV0LcLk37yxeOneASErfFyClxvQ1R3cxuTUgDUaA==
X-Google-Smtp-Source: AGHT+IG6FmMrBiOmcA27X7h8iXp74P4QNyIxzImad7cBVXSsHNg5mAYXDn9H/vjX+ZnVhZ307LKNbg==
X-Received: by 2002:a05:600c:46cf:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-440ab871770mr108740695e9.30.1745914545836;
        Tue, 29 Apr 2025 01:15:45 -0700 (PDT)
Date: Tue, 29 Apr 2025 10:15:44 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Ariadne Conill <ariadne@ariadne.space>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	"Alexander M . Merritt" <alexander@edera.dev>
Subject: Re: [PATCH v2] x86/hyperv: use dynamically allocated page for
 hypercalls
Message-ID: <aBCKsI4qhHWq4Iiz@macbook.lan>
References: <20250425234331.65875-1-ariadne@ariadne.space>
 <aA9NMJVbyXeMOOY-@macbook.lan>
 <D9I7TPLT0EJD.3F5P95H69CT5K@amd.com>
 <97d28edb-4274-408f-a825-d09fa771e21d@citrix.com>
 <D9I904ZOCMVN.31C4DUMXROGDK@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D9I904ZOCMVN.31C4DUMXROGDK@amd.com>

On Mon, Apr 28, 2025 at 12:50:55PM +0100, Alejandro Vallejo wrote:
> On Mon Apr 28, 2025 at 12:07 PM BST, Andrew Cooper wrote:
> > On 28/04/2025 11:55 am, Alejandro Vallejo wrote:
> >> On Mon Apr 28, 2025 at 10:41 AM BST, Roger Pau Monné wrote:
> >>> On Fri, Apr 25, 2025 at 04:43:31PM -0700, Ariadne Conill wrote:
> >>>> Previously Xen placed the hypercall page at the highest possible MFN,
> >>>> but this caused problems on systems where there is more than 36 bits
> >>>> of physical address space.
> >>>>
> >>>> In general, it also seems unreliable to assume that the highest possible
> >>>> MFN is not already reserved for some other purpose.
> >>>>
> >>>> Changes from v1:
> >>>> - Continue to use fixmap infrastructure
> >>>> - Use panic in Hyper-V setup() function instead of returning -ENOMEM
> >>>>   on hypercall page allocation failure
> >>>>
> >>>> Fixes: 620fc734f854 ("x86/hyperv: setup hypercall page")
> >>>> Cc: Alejandro Vallejo <agarciav@amd.com>
> >>>> Cc: Alexander M. Merritt <alexander@edera.dev>
> >>>> Signed-off-by: Ariadne Conill <ariadne@ariadne.space>
> >>>> ---
> >>>>  xen/arch/x86/guest/hyperv/hyperv.c      | 17 +++++++----------
> >>>>  xen/arch/x86/include/asm/guest/hyperv.h |  3 ---
> >>>>  2 files changed, 7 insertions(+), 13 deletions(-)
> >>>>
> >>>> diff --git a/xen/arch/x86/guest/hyperv/hyperv.c b/xen/arch/x86/guest/hyperv/hyperv.c
> >>>> index 6989af38f1..0305374a06 100644
> >>>> --- a/xen/arch/x86/guest/hyperv/hyperv.c
> >>>> +++ b/xen/arch/x86/guest/hyperv/hyperv.c
> >>>> @@ -98,7 +98,13 @@ static void __init setup_hypercall_page(void)
> >>>>      rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
> >>>>      if ( !hypercall_msr.enable )
> >>>>      {
> >>>> -        mfn = HV_HCALL_MFN;
> >>>> +        void *hcall_page = alloc_xenheap_page();
> >>>> +        if ( !hcall_page )
> >>>> +            panic("Hyper-V: Failed to allocate hypercall trampoline page");
> >>>> +
> >>>> +        printk("Hyper-V: Allocated hypercall page @ %p.\n", hcall_page);
> >>> This likely wants to be a dprintk, and possibly also print the
> >>> physical address of the used page?  And no period at the end of the
> >>> sentence IMO.
> >>>
> >>> I think Xen might have used the last page in the physical address
> >>> range to prevent HyperV from possibly shattering a superpage in the
> >>> second stage translation page-tables if normal RAM was used?
> >>>
> >>> However I don't know whether HyperV will shatter super-pages if a
> >>> sub-page of it is used to contain the hypercall page (I don't think it
> >>> should?)
> >> I think it's quite unlikely.
> >
> > It will shatter superpages.
> >
> > The overlay is not part of guest memory, and will hide whatever is
> > behind it while it is mapped, which will force a 4k PTE in EPT/NPT.
> 
> That's an implementation detail. They can very well copy the trampoline
> to guest memory when there is such (and save the previous contents
> elsewhere) and restore them when disabling the trampoline. It's a
> trivial optimisation that would prevent shattering while being fully
> compliant with the TLFS.

It's an implementation detail relevant from a guest perspective, as it
impacts guest performance.  IOW: we care about the specific (current)
implementation, as it's meaningful to how the guest-side should be
implemented.

> The actual physical location of the trampoline is fully undefined. It
> is defined to be an overlay; but that's a specification, not an
> implementation.
> 
> >
> > Thinking about it, a better position would be adjacent to the APIC MMIO
> > window, so at 0xfee01000.  The APIC MMIO window is forced to be a 4k
> > mapping too, and the rest of the 2M window is normally empty.
> >
> 
> Sounds like an assumption waiting to be broken. Just like the last page
> of guest-physical was.

As a compromise - could we try to allocate from < 4GB first, and
resort to high memory if that doesn't work?  That would at least limit
shattering (if done) to the low 4GB, which is quite likely fragmented
already:

hcall_page = alloc_xenheap_pages(0, MEMF_bits(32));
if ( !hcall_page )
    hcall_page = alloc_xenheap_page();
if ( !hcall_page )
    panic(...);

That will need a comment to describe what's going on.

Thanks, Roger.

