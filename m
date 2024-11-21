Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96B9D4C21
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841426.1256922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5Wl-0001wc-NR; Thu, 21 Nov 2024 11:39:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841426.1256922; Thu, 21 Nov 2024 11:39:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5Wl-0001u4-K7; Thu, 21 Nov 2024 11:39:15 +0000
Received: by outflank-mailman (input) for mailman id 841426;
 Thu, 21 Nov 2024 11:39:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tE5Wk-0001ft-2j
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:39:14 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37e5181f-a7fd-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 12:39:08 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a9ed7d8d4e0so122135266b.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:39:08 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f4152dcbsm70757366b.9.2024.11.21.03.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 03:39:07 -0800 (PST)
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
X-Inumbo-ID: 37e5181f-a7fd-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmMiLCJoZWxvIjoibWFpbC1lajEteDYyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjM3ZTUxODFmLWE3ZmQtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg5MTQ4LjkyODEzOSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732189147; x=1732793947; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ahAHrUvfG7RrmD2ptXSzUVzn9gbWCOiC7B9AQQZwrYw=;
        b=X+unA3OMYs3YNN8OXlhQA4Uzf8pj2Iq1ZQFAnfzf623rZZ3Z6Wd1UA1cp9+tpAW1IJ
         UbzdC4Y2kMj3wP8x2ETpIOvjYIgxOyYG0HNPnW6Y1CzVDeeQyD/qEPWSAw6jMpON1L9I
         x3lWAoazlpGFgZbEzRiy+xTQl57PoovkNe+Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732189147; x=1732793947;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahAHrUvfG7RrmD2ptXSzUVzn9gbWCOiC7B9AQQZwrYw=;
        b=H66VGjDgE1Na96RDl0CrmZ6UoIP6w0lCkik5dA6jr7OOcPuYRZsGnXeSF3jMuJSS99
         pFPViQDhLMC2LQvCy28TiOO7utwYlXy/79d+x9jOjvpWkagjXxUABRYpd9BdZBUVUnwF
         s0Ctq64d9b/UITMHoTBkOF5TymrT09fKrFTbDBmWB4tgIAjbQqLAsU6KNDHsAjTOUcct
         PPnPtvVq2F3XTOS925T6vFqezGvp0Eqxo5h5aQKGEQ2RNY8S7gybvDeuxyEEK7kMxElZ
         +XEluYgrE/eP2HgxqnDfDiRi+DoW8aFidKxPKS07HdlXmjWa3dFRtBlKLYxQebjLbssn
         DaVw==
X-Gm-Message-State: AOJu0YxxZFPL+Usw8ktq9CI+B+kQvO4N7Xb4IMnLC9DMfbqtPpwljHMK
	DD9I4cmWMW3umXyIGm/p5PNLL7Q312urtuP6F96gHLH6oWjxo2H5T/K7Si185vg=
X-Gm-Gg: ASbGnctpFFqoqlABa55VRXNlCrMMhNmgZTN/oiyBY5ZfUlzXYB9GPnSh2vN5QY3WfW1
	dUJHIdui4aLw2LarBLp7+6DBpUCHvD7t2DPKdj59YE/ife3sFmBVQw5CIgAwae6lD8P6fcWRyff
	UolzEYwM2OLrts2inT6evyB6/xGniSqQJG81LiFWySRZ4oK/oEua6N+Sncz0XDxjcbiRQiF5QsF
	672p2E9V+71SIl2pJvP0TCxfVATbWK9DnKz7cxTRPOET9oNr5ux+aEids4=
X-Google-Smtp-Source: AGHT+IGtr2dZDlqtKYwgYn6y/rq2HzMu6mLQtIX+bt4ujFoxzlTgLfphR5gqKc29UYFkOELh0z9upg==
X-Received: by 2002:a17:907:7ba3:b0:a9e:b471:8308 with SMTP id a640c23a62f3a-aa4dd764962mr494956066b.49.1732189147281;
        Thu, 21 Nov 2024 03:39:07 -0800 (PST)
Date: Thu, 21 Nov 2024 12:39:06 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86/pv: limit GDT and LDT mappings areas to max number
 of vCPUs
Message-ID: <Zz8b2u5KJBlFr1qa@macbook>
References: <20241121111218.50984-1-roger.pau@citrix.com>
 <03053e3b-c101-4cc2-9f59-604e84f92ea0@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <03053e3b-c101-4cc2-9f59-604e84f92ea0@citrix.com>

On Thu, Nov 21, 2024 at 11:26:19AM +0000, Andrew Cooper wrote:
> On 21/11/2024 11:12 am, Roger Pau Monne wrote:
> > The allocation of the paging structures in the per-domain area for mapping the
> > guest GDT and LDT can be limited to the maximum number of vCPUs the guest can
> > have.  The maximum number of vCPUs is available at domain creation since commit
> > 4737fa52ce86.
> >
> > Limiting to the actual number of vCPUs avoids wasting memory for paging
> > structures that will never be used.  Current logic unconditionally uses 513
> > pages, one page for the L3, plus 512 L1 pages.  For guests with equal or less
> > than 16 vCPUs only 2 pages are used (each guest vCPU GDT/LDT can only consume
> > 32 L1 slots).
> >
> > No functional change intended, all possible domain vCPUs should have the GDT
> > and LDT paging structures allocated and setup at domain creation, just like
> > before the change.
> >
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Ooh, that's a optimisation I'd not considered when doing the work.
> 
> But, is it really only the the LDT/GDT area which can benefit from
> this?  The XLAT area seems like another good candidate.

I don't see XLAT being pre-allocated like the GDT/LDT area is, it's
only populated on a per-vCPU basis in setup_compat_arg_xlat() which is
already bounded to the number of initialized vCPUs.

> > ---
> >  xen/arch/x86/pv/domain.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/pv/domain.c b/xen/arch/x86/pv/domain.c
> > index d5a8564c1cbe..e861e3ce71d9 100644
> > --- a/xen/arch/x86/pv/domain.c
> > +++ b/xen/arch/x86/pv/domain.c
> > @@ -346,7 +346,7 @@ void pv_domain_destroy(struct domain *d)
> >      pv_l1tf_domain_destroy(d);
> >  
> >      destroy_perdomain_mapping(d, GDT_LDT_VIRT_START,
> > -                              GDT_LDT_MBYTES << (20 - PAGE_SHIFT));
> > +                              d->max_vcpus << GDT_LDT_VCPU_SHIFT);
> 
> Probably not for this patch, but, should we really be passing in a size
> here?
> 
> Don't we just want to tear down everything in the relevant slot?

Hm, I've considered leaving that alone and keep passing GDT_LDT_MBYTES
to destroy the whole slot.  The performance advantage of not iterating
over the known empty slots is negligible IMO.  No strong opinion, I
can leave as-is if it's considered better.

> >  
> >      XFREE(d->arch.pv.cpuidmasks);
> >  
> > @@ -377,7 +377,7 @@ int pv_domain_initialise(struct domain *d)
> >          goto fail;
> >  
> >      rc = create_perdomain_mapping(d, GDT_LDT_VIRT_START,
> > -                                  GDT_LDT_MBYTES << (20 - PAGE_SHIFT),
> > +                                  d->max_vcpus << GDT_LDT_VCPU_SHIFT,
> >                                    NULL, NULL);
> 
> I'd suggest putting a note here saying that the maximum bound for PV
> vCPUs is governed by GDT_LDT_MBYTES.

Yeah, MAX_VIRT_CPUS is already calculated based on GDT_LDT_MBYTES.

> Or alternatively, we could have create_perdomain_mapping() fail if it
> tries to allocate more than one slot's worth of mappings?   It feels
> like an acceptable safety net.

I would rather use something like:

if ( (d->max_vcpus << GDT_LDT_VCPU_SHIFT) >
     (PERDOMAIN_SLOT_MBYTES << (20 - PAGE_SHIFT)) )
    ASSERT_UNREACHABLE();
    return -EINVAL;
}

As it should be impossible to call pv_domain_initialise() with a
number of vCPUs past what fits in the GDT/LDT slot.
arch_sanitise_domain_config() should have filtered such attempt before
it gets into pv_domain_initialise().

Thanks, Roger.

