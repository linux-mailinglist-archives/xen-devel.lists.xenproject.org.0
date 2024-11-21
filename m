Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDF9D4BA6
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2024 12:24:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841386.1256872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5I9-0006OY-Gj; Thu, 21 Nov 2024 11:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841386.1256872; Thu, 21 Nov 2024 11:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tE5I9-0006Me-Dn; Thu, 21 Nov 2024 11:24:09 +0000
Received: by outflank-mailman (input) for mailman id 841386;
 Thu, 21 Nov 2024 11:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A3MJ=SQ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tE5I7-0006MX-PC
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2024 11:24:07 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf6d60d-a7fb-11ef-99a3-01e77a169b0f;
 Thu, 21 Nov 2024 12:24:03 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so143484966b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Nov 2024 03:24:03 -0800 (PST)
Received: from localhost ([213.195.123.63]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa4f436c412sm68859566b.179.2024.11.21.03.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 03:24:02 -0800 (PST)
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
X-Inumbo-ID: 1cf6d60d-a7fb-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzEiLCJoZWxvIjoibWFpbC1lajEteDYzMS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjFjZjZkNjBkLWE3ZmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTg4MjQzLjc5OTA4NSwic2VuZGVyIjoicm9nZXIucGF1QGNsb3VkLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1732188243; x=1732793043; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0p218K9I9zN5KU5q8757L3mNS/VyiKfWvaj2ATDf/64=;
        b=IroeISjnYYhsvsNyOwWtqbg13Fs8yqqR0ymjQCWf1LeDKmviW58W6KBack9Gx0BZ76
         QWHzjXHirpFByM8cEhox8rpM19tqdbF3uCsuP/MbsCxhz6wRn8o8JD3rjNC1pfz2MLIu
         QP+7Lzwb2GtMrBfvT0Q/cpRGmebddJUbKcYyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732188243; x=1732793043;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0p218K9I9zN5KU5q8757L3mNS/VyiKfWvaj2ATDf/64=;
        b=f165pSLg1IzZjtRh9HRTMDXr5I9+AT33nXDLMAsqaN2kWHxoZ2iGM+4Ct1LcpEMMJP
         uW8bIey3UH+tc2kw4DFuVyPN9HpJaB0rpX4FfFjJ4arb1qRVELe71Lm1W9s2qPAjWifH
         IcOKeV8orJ2rsZhCzRlVKtHLJoFCFwk01KK1AlRoSskR590fJFQAaNQCQRyY3O7UpgjI
         y/xPbQnu7BKAuC8LcjW3DH8l78mVTX7Kn5uK2fq1IUViH2cVZSHpO7LG/lvRqVRlfNk+
         r2ZUpmQaBQCSNxniSnEYI4ru6GK9/h+k7aB8KGEFtR5hq5dts6II3wc1YIukM83mOluB
         mBmw==
X-Forwarded-Encrypted: i=1; AJvYcCWBUQDZqByyTm1U+iSZZzLPH0oqUyWd9S6HsP6LHEQEvlhPwU7NcGcPnGokSdiB5PaF5kDTC+rhTu0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxrfkK8sWazDlChC02Vpkoq4OaidmpePiFL+cXDncKmmOPNFLbg
	4No8fVrWeVcoBzD57oKEZzRFsS2Uh/p4nBnlxvjUKf74Cub0B9SPZDpiBgRnVL4zvN3KBAk+kcF
	A
X-Gm-Gg: ASbGncuBJUp1PQvJCrbpy8To8qht7LO2khtj8JBHzsp2C/pY5CWLyajAh32oTzStgWv
	vYCKRaNdRuVFovSDGkm2UijJ2iIFLSbb0zlKm6BgOseb49hEXcZQ3rx/z1cpgH4IH8zKzMe6+3C
	ZOoqjo+1eqRZnDA1wwTYCXRXtU0o0ki32T+p3OleLzqp4UM5A6sJTrhgZgFN5Brbncv94JF/B4G
	jUD4/IcZRTzSX2w1qMrZ81nQfTW30lOc5rFmMSWHOEbavLnXRakX42gfjU=
X-Google-Smtp-Source: AGHT+IFdU/Zcpi+MzfLI/6ZH6jzzxttcSEIrazvaCGSNzU9fxV2LoBbcbp7AcvjEM4U+FlKi/c0Cyg==
X-Received: by 2002:a17:906:fe4a:b0:a9a:835b:fc8e with SMTP id a640c23a62f3a-aa4dd748bacmr589226866b.54.1732188243211;
        Thu, 21 Nov 2024 03:24:03 -0800 (PST)
Date: Thu, 21 Nov 2024 12:24:02 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/pvh: also print hardware domain pIRQ limit for
 PVH
Message-ID: <Zz8YUrSf-asxPGXJ@macbook>
References: <20241120113555.38146-1-roger.pau@citrix.com>
 <20241120113555.38146-3-roger.pau@citrix.com>
 <25fb7dfe-50e0-446a-9057-050fd3c2edb2@suse.com>
 <Zz8UsJ4nJXyExQ53@macbook>
 <28111c22-e4f6-4714-a112-f07109bb5940@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28111c22-e4f6-4714-a112-f07109bb5940@citrix.com>

On Thu, Nov 21, 2024 at 11:14:23AM +0000, Andrew Cooper wrote:
> On 21/11/2024 11:08 am, Roger Pau Monné wrote:
> > On Thu, Nov 21, 2024 at 11:54:49AM +0100, Jan Beulich wrote:
> >> On 20.11.2024 12:35, Roger Pau Monne wrote:
> >>> Do not return early in the PVH/HVM case, so that the number of pIRQs is also
> >>> printed.
> >> What you're printing ...
> >>
> >>> Fixes: 17f6d398f765 ('cmdline: document and enforce "extra_guest_irqs" upper bounds')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>>  xen/arch/x86/io_apic.c | 12 +++++++-----
> >>>  1 file changed, 7 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> >>> index bd5ad61c85e4..d9db2efc4f58 100644
> >>> --- a/xen/arch/x86/io_apic.c
> >>> +++ b/xen/arch/x86/io_apic.c
> >>> @@ -2754,11 +2754,13 @@ unsigned int __hwdom_init arch_hwdom_irqs(const struct domain *d)
> >>>  
> >>>      /* PVH (generally: HVM) can't use PHYSDEVOP_pirq_eoi_gmfn_v{1,2}. */
> >>>      if ( is_hvm_domain(d) )
> >>> -        return nr_irqs;
> >>> -
> >>> -    if ( !d->domain_id )
> >>> -        n = min(n, dom0_max_vcpus());
> >>> -    n = min(nr_irqs_gsi + n * NR_DYNAMIC_VECTORS, max_irqs);
> >>> +        n = nr_irqs;
> >> ... is rather the number of IRQs we picked for the system. That may happen to
> >> end up being the upper bound for PVH Dom0, yet not logging this at all was
> >> because of the limited use pIRQ-s have there. Granted at the time I was still
> >> under the impression they have no use there at all, so this isn't really an
> >> objection to the change. I would have been nice though if the description had
> >> mentioned why significance pIRQ-s actually have in PVH Dom0.
> > Sure, what about adding to the commit message:
> >
> > "While PVH dom0 doesn't have access to the hypercalls to manage pIRQs
> > itself, neither the knowledge to do so, pIRQs are still used by Xen to
> > map and bind interrupts to a PVH dom0 behind its back.  Hence the
> > pIRQ limit is still relevant for a PVH dom0."
> 
> Minor grammar point.  You want "nor" rather than "neither" in this
> context, because it's introducing the second of two negative things.

Thanks!  Could one of you adjust at commit if Jan agrees with adding
the paragraph?

Regards, Roger.

