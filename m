Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB21B2015B
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 10:08:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077034.1438127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNZT-0005ii-HF; Mon, 11 Aug 2025 08:07:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077034.1438127; Mon, 11 Aug 2025 08:07:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulNZT-0005fy-EM; Mon, 11 Aug 2025 08:07:55 +0000
Received: by outflank-mailman (input) for mailman id 1077034;
 Mon, 11 Aug 2025 08:07:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8H9H=2X=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ulNZS-0005fq-GX
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 08:07:54 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4770ea04-768a-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 10:07:52 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso25498955e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 01:07:52 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e587d378sm241320605e9.23.2025.08.11.01.07.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Aug 2025 01:07:51 -0700 (PDT)
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
X-Inumbo-ID: 4770ea04-768a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754899672; x=1755504472; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ+pZ7l4e9RR7L7THQFCqTDL7wK39W7F6Kd0ZbKuM2E=;
        b=l0E0NGVa5d/2odDKVX9RQhGQ86QPFlbXF7ps5MlaAN3Dsm9Nq3f2wydiXsJMQt/eqw
         aDeuyyY7nbYs+a81/JE9narJ7RfyJEEvka8O5Ln7tZEdWcdu7U8AsIFevBU8l+/5FiYe
         UmOnp24Ltn19K4wKAADw+As+4DMR9Uxj4xzfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754899672; x=1755504472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZ+pZ7l4e9RR7L7THQFCqTDL7wK39W7F6Kd0ZbKuM2E=;
        b=DJi0OlgVv86WulNUvHUeyA0vWwyoqiRM8PLWfm9u1O4T1lHg7JYDV10LpeVd9zUofM
         rRhrCajlpNBbEagarr7NxqA7xNg3Myr86AhsTDBTnGu5j4sWwBHsPy5GyNInY7uQtzhW
         /nP9Fx0wFclxAA5Mia10XoDvhclohG0opL4+WqX/A4qAKZi28l6iqG4bG7Lfrm1DoAJq
         weHKqWW9IndPpSwnf0sgSMKaZmm2okjDVI88epp+9qlBvyXmO7JwxDccvs8XM8Fqtj0C
         iMRfWz2CnxYaTAydsQH3mu0Ik0UgNRJev8bcNPM7Ulwv9KsQUKVAa74tQ0kPi7HTY4eT
         f2QQ==
X-Gm-Message-State: AOJu0YwGgAxKgkeGzEnozJqLmXvdwHLpCpxs0cEyas/F5ig1jvzDPgzY
	aXkQTARCqcH9WxN/lCFx5mE8GBrWpk0msHVIdHkBi1+uUhZP75r0XYJrejNGuW9WNn8=
X-Gm-Gg: ASbGncv26DWKdrvsaVuIkUMHKOL1ovMVzr5ppXiE9bKfQNFz99o2E+FH6qul9nQK7ny
	lT8bE7/MlCi3Xjj42U0ZZ58GAaDk4X4nIFg25soCXxAMcIpnlK6m5Qv0lY2DXsozv3I+BEWKDL4
	VJIR+hOynIKBJTzGt/+kBNl3Cp3SNNIdgZsUEiOpztPCH43PIKqiemRmbv9pWKXcUZnyaBi7I29
	/1pC2cL/6ls4YtPOK8VcDTSoc6APrT2qfpUUgbR6pBPP/VrJ3QBc+z5Km75wC4mlIP7BchsikZW
	NUYyVMBmLWV1UnQ4wsd2TXc9IEMJALE/MRGdBgTD+tuykkYmx+WxtPRekTuGFjuVyDSROXQOFLr
	lNTW0Vc5EOWxYQHFa4wXzsIusClao2KQNnUWs0TCRimFIXs/O2U2rhlOIn5oFLOHFHw==
X-Google-Smtp-Source: AGHT+IEfaHIK3LvfODUDhcotHG9abNrL3G3gl+wt7OOfF9zs5PotjL9oSKunBIBe2aB44hOJNEo2ZA==
X-Received: by 2002:a5d:5f8d:0:b0:3b8:d893:5230 with SMTP id ffacd0b85a97d-3b900b510dcmr9614621f8f.47.1754899671842;
        Mon, 11 Aug 2025 01:07:51 -0700 (PDT)
Date: Mon, 11 Aug 2025 10:07:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v4 2/8] pdx: provide a unified set of unit functions
Message-ID: <aJmk1o7sUT2UZJ8M@macbook.local>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-3-roger.pau@citrix.com>
 <5b940bdf-9bc0-49b2-af92-7251b2780c71@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b940bdf-9bc0-49b2-af92-7251b2780c71@xen.org>

On Fri, Aug 08, 2025 at 06:21:29PM +0100, Julien Grall wrote:
> Hi Roger,
> 
> On 05/08/2025 10:52, Roger Pau Monne wrote:
> > diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> > index a77b31071ed8..ba35bf1fe3bb 100644
> > --- a/xen/arch/arm/setup.c
> > +++ b/xen/arch/arm/setup.c
> > @@ -256,9 +256,11 @@ void __init init_pdx(void)
> >   {
> >       const struct membanks *mem = bootinfo_get_mem();
> >       paddr_t bank_start, bank_size, bank_end, ram_end = 0;
> > -    int bank;
> > +    unsigned int bank;
> >   #ifndef CONFIG_PDX_NONE
> > +    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> > +        pfn_pdx_add_region(mem->bank[bank].start, mem->bank[bank].size);
> >       /*
> >        * Arm does not have any restrictions on the bits to compress. Pass 0 to
> >        * let the common code further restrict the mask.
> > @@ -266,26 +268,24 @@ void __init init_pdx(void)
> >        * If the logic changes in pfn_pdx_hole_setup we might have to
> >        * update this function too.
> >        */
> > -    uint64_t mask = pdx_init_mask(0x0);
> > -
> > -    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> > -    {
> > -        bank_start = mem->bank[bank].start;
> > -        bank_size = mem->bank[bank].size;
> > -
> > -        mask |= bank_start | pdx_region_mask(bank_start, bank_size);
> > -    }
> > +    pfn_pdx_compression_setup(0);
> >       for ( bank = 0 ; bank < mem->nr_banks; bank++ )
> >       {
> > -        bank_start = mem->bank[bank].start;
> > -        bank_size = mem->bank[bank].size;
> > -
> > -        if (~mask & pdx_region_mask(bank_start, bank_size))
> > -            mask = 0;
> > +        if ( !pdx_is_region_compressible(
> > +                  mem->bank[bank].start,
> > +                  PFN_UP(mem->bank[bank].start + mem->bank[bank].size) -
> > +                  PFN_DOWN(mem->bank[bank].start)) )
> 
> This code is a bit too verbose. Can we at least introduce "bank =
> &mem->bank[bank]" to reduce a bit the verbosity?

I cannot introduce a `bank` local variable as it's already used as the
index cursor for the loop.  Would you be fine with:

    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
    {
        const struct membank *m = &mem->bank[bank];

        if ( !pdx_is_region_compressible(m->start,
                                         PFN_UP(m->start + m->size) -
                                         PFN_DOWN(m->start)) )
        {
            pfn_pdx_compression_reset();
            printk(XENLOG_WARNING
                   "PFN compression disabled, RAM region [%#" PRIpaddr ", %#"
                   PRIpaddr "] not covered\n",
                   m->start, m->start + m->size - 1);
            break;
        }
    }

> The rest of the logic looks fine. So:
> 
> Acked-by: Julien Grall <jgrall@amazon.com> # ARM

Thanks, Roger.

