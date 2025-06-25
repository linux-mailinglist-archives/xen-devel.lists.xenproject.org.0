Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B45AAE8832
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 17:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025234.1400875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUS7I-0003em-IG; Wed, 25 Jun 2025 15:32:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025234.1400875; Wed, 25 Jun 2025 15:32:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUS7I-0003cF-EU; Wed, 25 Jun 2025 15:32:52 +0000
Received: by outflank-mailman (input) for mailman id 1025234;
 Wed, 25 Jun 2025 15:32:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7fe=ZI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uUS7G-0003c5-Vp
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 15:32:51 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a46a1037-51d9-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 17:32:45 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-450dd065828so15302515e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 08:32:45 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45382363167sm24059015e9.26.2025.06.25.08.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jun 2025 08:32:44 -0700 (PDT)
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
X-Inumbo-ID: a46a1037-51d9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750865565; x=1751470365; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8CUztxAY5fNunNcET+EhgY1/3CWzr9FgKMwyyZ6dFd4=;
        b=wMS/7urydesBQNu5AEZP+Fq1YpjNLmfJjrD28K53hK8m9ipLcyMA0i1XGkLcsL73cl
         +f2/3YJSND6cozmDbzM1zF52vzkVcg1l1GleWnxByqPYg4Z2hOu7yai7BbbMJa4fZ4M7
         zc9cTy2+nNuTNN4VVeRAu5qom6JNJh1EtteV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865565; x=1751470365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8CUztxAY5fNunNcET+EhgY1/3CWzr9FgKMwyyZ6dFd4=;
        b=CD/o9juXrpp3LMXk2tvuP4UOmhig3BQufaHIP5OhhmpD31N6hnLo8hIX7fT0o6aEe+
         6cM9nwWl/1vAl/0BvtdGdXPlYSM0slgMztjgwB+7X8hJJ27Pecb9CM48N2u5s2cSDCGg
         kr3XgOxVZ/VslEDiP5Z52S5R7I8rhZnuo0lmHCpLFecEg9nEnSRsPSCDaSXwxyXBF82r
         MKrkC6gXS9O9rnPvZSpnbweX8uUZSP0PTDcmpVzWeO3MkJQLl8bRLkTKyJr0f7oXxlV/
         QxQaN0zXG1L54vzC6OuYKOdSbqv4AmBdKfPyl0mLN5UhKu2uwtddkyubhOgfKgfsMv4Q
         y4Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUZogDnhbRdn2KU8n4x+C7Dw15TPyIwwGhoDzfrDO9/dNwsmXTqGpIbfv7H1kQCynTBkjVm1mYU51U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRHRH+HLs0FXBTPU2jFGLDr1ZyASNsyHlGFFtuZJ3RYdjP9DQs
	iHt38FSeo1fD+ExIpWgYYl+9kp/B7GST8FdIJafNPrSJInWtBkObidL19bLreacaA2E=
X-Gm-Gg: ASbGncvgVHg+Yz45HmLEC6tyjE+hav3XFBvyIkZuaKyayPkvVN7PppBTcWWgqWH9Yhp
	lKDQRkhzXLX4Y/K4XVietGOLmByxivYcPn5Trr1AuHhtIcojWW9VhD/uBPCyFTdOI0cp2hJI2np
	A9WqCEUwV+Td1Q+2E3i05b9ZVgk3p169PTRP1Ia3UpPvPWrwEy8px6z/Qu/pEwSozaSEuVnkzeN
	5hHnosFQPiVByUvdPVVyUSOxb0oOMHWlC8JMYfvR1kwQA/xOJA1Txo2PnBPQWT6u23c019hi4B8
	xwCGRyFsreAVIc6fS29qjQLpuBtaqZR6NDElETVA1FAJZfilZnvBnCsTQG3eoaYFtTqLZLQG7xH
	ucaH3Bki3Haob6LjCBKrbAWjJSj9+6g==
X-Google-Smtp-Source: AGHT+IEHujfIZsEM+oVocdW+wdXeDwzBjrn4Q6uj1SwlWXG14TFuwvFLiM6C6g18XILKDy1cUThPKA==
X-Received: by 2002:a05:600c:c4aa:b0:43c:fd27:a216 with SMTP id 5b1f17b1804b1-45381afd69bmr34069835e9.23.1750865565100;
        Wed, 25 Jun 2025 08:32:45 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:32:43 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/8] pdx: provide a unified set of unit functions
Message-ID: <aFwWmwJA9YMc70_l@macbook.local>
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-4-roger.pau@citrix.com>
 <1298a33e-b602-4887-86a7-cb69cdaa6311@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1298a33e-b602-4887-86a7-cb69cdaa6311@suse.com>

On Tue, Jun 24, 2025 at 03:32:23PM +0200, Jan Beulich wrote:
> On 20.06.2025 13:11, Roger Pau Monne wrote:
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -255,6 +255,10 @@ void __init init_pdx(void)
> >  {
> >      const struct membanks *mem = bootinfo_get_mem();
> >      paddr_t bank_start, bank_size, bank_end;
> > +    unsigned int bank;
> > +
> > +    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> > +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
> >  
> >      /*
> >       * Arm does not have any restrictions on the bits to compress. Pass 0 to
> > @@ -263,28 +267,24 @@ void __init init_pdx(void)
> >       * If the logic changes in pfn_pdx_hole_setup we might have to
> >       * update this function too.
> >       */
> > -    uint64_t mask = pdx_init_mask(0x0);
> > -    int bank;
> > +    pfn_pdx_compression_setup(0);
> >  
> >      for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> >      {
> > -        bank_start = mem->bank[bank].start;
> > -        bank_size = mem->bank[bank].size;
> > -
> > -        mask |= bank_start | pdx_region_mask(bank_start, bank_size);
> > -    }
> > -
> > -    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> > -    {
> > -        bank_start = mem->bank[bank].start;
> > -        bank_size = mem->bank[bank].size;
> > -
> > -        if (~mask & pdx_region_mask(bank_start, bank_size))
> > -            mask = 0;
> > +        if ( !pdx_is_region_compressible(mem->bank[bank].start,
> > +                 PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
> > +                 PFN_DOWN(mem->bank[bank].start)) )
> 
> Nit: This, according to my understanding, is an "impossible" style. It wants
> to either be
> 
>         if ( !pdx_is_region_compressible(
>                   mem->bank[bank].start,
>                   PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
>                   PFN_DOWN(mem->bank[bank].start)) )
> 
> or ...

I will switch to the example above, thanks.

> > +        {
> > +            pfn_pdx_compression_reset();
> > +            printk(XENLOG_WARNING
> > +                   "PFN compression disabled, RAM region [%#" PRIpaddr ", %#"
> > +                   PRIpaddr "] not covered\n",
> > +                   mem->bank[bank].start,
> > +                   mem->bank[bank].start + mem->bank[bank].size - 1);
> 
> ... like this. But it's not written down anywhere, so I guess I shouldn't
> insist.
> 
> And then - isn't the use of PFN_UP() and PFN_DOWN() the wrong way round?
> Partial pages aren't usable anyway, so the smaller range is what matters
> for every individual bank. However, for two contiguous banks (no idea
> whether Arm would fold such into a single one, like we do with same-type
> E820 regions on x86) this gets more complicated then.

I think it's safer to always attempt to cover the wider range, even if
the first and last pages are not fully covered, and shouldn't be used
as RAM.  Like you said it will get more complicated if ranges are
contiguous but the start and end are not page aligned.

> > @@ -299,19 +295,29 @@ void __init srat_parse_regions(paddr_t addr)
> >  
> >  	/* Set "PXM" as early as feasible. */
> >  	numa_fw_nid_name = "PXM";
> > -	srat_region_mask = pdx_init_mask(addr);
> >  	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
> >  			      srat_parse_region, 0);
> >  
> > -	for (mask = srat_region_mask, i = 0; mask && i < e820.nr_map; i++) {
> > +	pfn_pdx_compression_setup(addr);
> > +
> > +	/* Ensure all RAM ranges in the e820 are covered. */
> > +	for (i = 0; i < e820.nr_map; i++) {
> >  		if (e820.map[i].type != E820_RAM)
> >  			continue;
> >  
> > -		if (~mask & pdx_region_mask(e820.map[i].addr, e820.map[i].size))
> > -			mask = 0;
> > +		if (!pdx_is_region_compressible(e820.map[i].addr,
> > +		    PFN_UP(e820.map[i].addr + e820.map[i].size) -
> > +		    PFN_DOWN(e820.map[i].addr)))
> 
> Indentation is off here in any event, i.e. irrespective of my earlier
> remark.

Hm, yes, I've made a mess with indentation here.

> 
> > --- a/xen/common/pdx.c
> > +++ b/xen/common/pdx.c
> > @@ -19,6 +19,7 @@
> >  #include <xen/mm.h>
> >  #include <xen/bitops.h>
> >  #include <xen/nospec.h>
> > +#include <xen/pfn.h>
> >  #include <xen/sections.h>
> >  
> >  /**
> > @@ -55,6 +56,44 @@ void set_pdx_range(unsigned long smfn, unsigned long emfn)
> >          __set_bit(idx, pdx_group_valid);
> >  }
> >  
> > +#ifndef CONFIG_PDX_NONE
> > +
> > +#ifdef CONFIG_X86
> > +# include <asm/e820.h>
> > +# define MAX_PFN_RANGES E820MAX
> > +#elif defined(CONFIG_HAS_DEVICE_TREE)
> > +# include <xen/bootfdt.h>
> > +# define MAX_PFN_RANGES NR_MEM_BANKS
> > +#endif
> > +
> > +#ifndef MAX_PFN_RANGES
> > +# error "Missing architecture maximum number of RAM ranges"
> > +#endif
> > +
> > +/* Generic PFN compression helpers. */
> > +static struct pfn_range {
> > +    unsigned long base, size;
> > +} ranges[MAX_PFN_RANGES] __initdata;
> > +static unsigned int __initdata nr_ranges;
> > +
> > +void __init pfn_pdx_add_region(paddr_t base, paddr_t size)
> > +{
> > +    if ( !size )
> > +        return;
> > +
> > +    if ( nr_ranges >= ARRAY_SIZE(ranges) )
> > +    {
> > +        ASSERT((nr_ranges + 1) > nr_ranges);
> 
> This looks overly pessimistic to me. (I won't outright insist on its removal,
> though.)

TBH I've added this later, I don't have a strong opinion either.  I
don't think we usually check for overflows, so I understand this might
look odd.

> > +        nr_ranges++;
> 
> This requires pretty careful use of the variable as an upper bound of loops.
> It's fine in pfn_pdx_compression_setup(), but it feels a little risky.

It does require careful handling in pfn_pdx_compression_setup(), but
also has the benefit of providing the possibly new required upper
bound for PDX to be usable in the error message.

Thanks, Roger.

