Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0119B1B77A
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 17:27:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070636.1434284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJZo-0006Dp-Ai; Tue, 05 Aug 2025 15:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070636.1434284; Tue, 05 Aug 2025 15:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujJZo-0006BA-6V; Tue, 05 Aug 2025 15:27:44 +0000
Received: by outflank-mailman (input) for mailman id 1070636;
 Tue, 05 Aug 2025 15:27:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xkmx=2R=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ujJZm-0006B4-AQ
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 15:27:42 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9d50e61-7210-11f0-a321-13f23c93f187;
 Tue, 05 Aug 2025 17:27:41 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-459d62184c9so17012985e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 08:27:41 -0700 (PDT)
Received: from localhost (112.pool92-178-7.dynamic.orange.es. [92.178.7.112])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-458953cfeaesm271894195e9.16.2025.08.05.08.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Aug 2025 08:27:40 -0700 (PDT)
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
X-Inumbo-ID: b9d50e61-7210-11f0-a321-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754407661; x=1755012461; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KpQ6JVuYGsB2GRKbtOPMGOVowMsWszSsXYpd1hQT2Fk=;
        b=XVdegpZ/xoX2OtCzvNHU/QkMTjIdsNXB4WaX1nCfzFfDCFhiggAbps6LdGXv+L/qFo
         QlqlU3Xx2ifCk9eezCSHCQTriU8P+f3f2OZoi12jGIO20XdE8KLfj/9p0hHVUuoTvpOX
         Utoacl0yz1HEVu6mb+++72/eP/B6+gBDKQKTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754407661; x=1755012461;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KpQ6JVuYGsB2GRKbtOPMGOVowMsWszSsXYpd1hQT2Fk=;
        b=eon5f90kqTIY4ZUl0QWPlPh7s4wE6Wfi9K8YNqIdHKaPW28bKWqyxT+uUnWyHFZqOR
         RRxxidzhQJtqeJ3cr4eKMwZX91HAJQXaaIRQz99QYcRBJl/qK/UfU5+jHDYUaRLVd6sj
         +JxbO44ZfmDT+OuWF2KMQOUBAlMnnzp27ri3vB98ea60ziWCCTxPTQK2sc07vSKK00XK
         B/C1u0ku3I/MeTs2Pt3AITwM4iVRZFHhws9Ka9i6N3GwBRlgzQxmQyr35HF74v0Y1E5a
         mV0YMOKPeeynb7v4DM9DNQuYMNwkOxuEFkyQWeIYMZ6dR6oWC9Hyjk5A1RibsQvkfFz3
         NdZg==
X-Forwarded-Encrypted: i=1; AJvYcCXMA7+9AlbXWDpCHXg0AniwaQ8XoSdgC3iTvHccr7g0ZtNPlALJBCBCfP6CGFOO66TuKEQwiIyyS/A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJPieIP91WEqhUgSlYemsKEODz9ozk4KImusISIxQhWbOVbJJZ
	s8NWGgrKPOkybMAS0wIJNbTlfIoYjrcHB1/v4mA+l5J2sMPNlHo05OnH7EVgxH3W3mekqg9bYP+
	AltwU
X-Gm-Gg: ASbGncvm2uqXa1lXi1wOxddAkjlL9SUX7ysYD3lg9OrFdzAvlUGazBRhxhsK6WhS5XT
	Jtd3Gt1MPYsY2cUofiebySCh/cCTdQpceCycch/P7QqL1Gdt2D+83WdBA1J/+/aVbZE/WkBscS6
	/u5fV80Ty6KH1Cr2oK/HQPGwLXq7YTpx+0WtyrBAJi63XYLSlhuYlcpDtWVwQvNoyVcBt9ivK7J
	1XbGGBLxmc5+nAPw4zahaB3BTKXHDoVu+OLzfM1CDLmV4R2e0dQj16iBiywNL/dsbR47wqcCxl1
	sDYdsqf8w1boVhvliv9sL71T1ZExGWbnOI3A+E0Sa287R4VRz17QLTAfxA4iw3oNfSu7uDzr2To
	GluGjrJvqnW7I3BH461dqQXB+EY2+XVRaPtnFlDhKi6xwcfqrQQNZIPnbe841/1mie95tmcRZVg
	4x
X-Google-Smtp-Source: AGHT+IFyOv2Xc+fp5Zcq7Qrz3t1lTUDHVhOZr2Rpw/TGq+7T7Eht6R6qm8rCdqbdSc/wZswRgGTEpg==
X-Received: by 2002:a05:600c:4ed0:b0:459:e466:1bec with SMTP id 5b1f17b1804b1-459e4661e0bmr17456935e9.2.1754407660595;
        Tue, 05 Aug 2025 08:27:40 -0700 (PDT)
Date: Tue, 5 Aug 2025 17:27:39 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 8/8] x86/mm: adjust loop in arch_init_memory() to
 iterate over the PDX space
Message-ID: <aJIi6wrNZck1DSU_@macbook.local>
References: <20250805095257.74975-1-roger.pau@citrix.com>
 <20250805095257.74975-9-roger.pau@citrix.com>
 <31691bf7-94bf-4f73-b04c-a32f86bb0e37@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <31691bf7-94bf-4f73-b04c-a32f86bb0e37@suse.com>

On Tue, Aug 05, 2025 at 02:38:38PM +0200, Jan Beulich wrote:
> On 05.08.2025 11:52, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -275,7 +275,7 @@ static void __init assign_io_page(struct page_info *page)
> >  
> >  void __init arch_init_memory(void)
> >  {
> > -    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
> > +    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn, pdx;
> >  
> >      /*
> >       * Basic guest-accessible flags:
> > @@ -328,9 +328,20 @@ void __init arch_init_memory(void)
> >              destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
> >                                   (unsigned long)mfn_to_virt(ioend_pfn));
> >  
> > -        /* Mark as I/O up to next RAM region. */
> > -        for ( ; pfn < rstart_pfn; pfn++ )
> > +        /*
> > +         * Mark as I/O up to next RAM region.  Iterate over the PDX space to
> > +         * skip holes which would always fail the mfn_valid() check.
> > +         *
> > +         * pfn_to_pdx() requires a valid (iow: RAM) PFN to convert to PDX,
> > +         * hence provide pfn - 1, which is the tailing PFN from the last RAM
> > +         * range, or pdx 0 if the input pfn is 0.
> > +         */
> > +        for ( pdx = pfn ? pfn_to_pdx(pfn - 1) + 1 : 0;
> > +              pdx < pfn_to_pdx(rstart_pfn);
> > +              pdx++ )
> >          {
> > +            pfn = pdx_to_pfn(pdx);
> > +
> >              if ( !mfn_valid(_mfn(pfn)) )
> >                  continue;
> >  
> 
> As much as I would have liked to ack this, I fear there's another caveat here:
> At the top of the loop we check not only for RAM, but also for UNUSABLE. The
> latter, like RAM, shouldn't be marked I/O, but we also can't use PFN <-> PDX
> transformations on any such page.

Right you are.  I'm not sure however why we do this - won't we want
the mappings of UNUSABLE regions also be removed from the Xen
page-tables? (but not marked as IO)

I could do something like:

        /* Mark as I/O up to next RAM or UNUSABLE region. */
        if ( (!pfn || pdx_is_region_compressible(pfn_to_paddr(pfn - 1), 1)) &&
             pdx_is_region_compressible(pfn_to_paddr(rstart_pfn), 1) )
        {
            /*
             * Iterate over the PDX space to skip holes which would always fail
             * the mfn_valid() check.
             *
             * pfn_to_pdx() requires a valid (iow: RAM) PFN to convert to PDX,
             * hence provide pfn - 1, which is the tailing PFN from the last
             * RAM range, or pdx 0 if the input pfn is 0.
             */
            for ( pdx = pfn ? pfn_to_pdx(pfn - 1) + 1 : 0;
                  pdx < pfn_to_pdx(rstart_pfn);
                  pdx++ )
            {
                pfn = pdx_to_pfn(pdx);

                if ( !mfn_valid(_mfn(pfn)) )
                    continue;

                assign_io_page(mfn_to_page(_mfn(pfn)));
            }
        }
        else
        {
            /* Slow path, iterate over the PFN space. */
            for ( ; pfn < rstart_pfn; pfn++ )
            {
                if ( !mfn_valid(_mfn(pfn)) )
                    continue;

                assign_io_page(mfn_to_page(_mfn(pfn)));
            }
        }

But I find it a bit ugly - I might send v5 without this final patch
while I see if I can find a better alternative.

Thanks, Roger.

