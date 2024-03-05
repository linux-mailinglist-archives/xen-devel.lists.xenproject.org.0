Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C5F871987
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 10:25:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688651.1073096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR32-0001Ez-2o; Tue, 05 Mar 2024 09:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688651.1073096; Tue, 05 Mar 2024 09:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhR32-0001CS-03; Tue, 05 Mar 2024 09:25:20 +0000
Received: by outflank-mailman (input) for mailman id 688651;
 Tue, 05 Mar 2024 09:25:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sXiD=KL=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rhR31-0001CM-C5
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 09:25:19 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 471f15d5-dad2-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 10:25:17 +0100 (CET)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-68fcedcf8aaso25462046d6.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 01:25:17 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 nc6-20020a0562142dc600b0068fb9bdd7absm5514455qvb.74.2024.03.05.01.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 01:25:15 -0800 (PST)
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
X-Inumbo-ID: 471f15d5-dad2-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1709630716; x=1710235516; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A60ZVTWKctOxam6vMYDrKTVFVbMjSszILsN+KLqLg88=;
        b=B9ddwrdwQB6TdiE5J6XuM/+tfpGthxgytiCa74YmNQm+7MT0DH5KxcQF/gf7+0RKhE
         UxOqn/dVXY8+SRInN+iMpspXLSuuminvDiQbGCC4OUA+QAG2DKtuBHo40Wfo+2lQ4PAt
         opjz4GCmCifxRv1gOzubi3cV9xcF6ouQ0OGbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709630716; x=1710235516;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A60ZVTWKctOxam6vMYDrKTVFVbMjSszILsN+KLqLg88=;
        b=bG0/9e4AWu5rwvj4YpjBAnsUoE6yXDEUjWaITSiPszsgbKyq7DOtwjIfznjL5sXR3W
         bXkvZNqiEBfRqbAYHAuN+61xwXclQKbCgl84V0hRWU0dTXChO67W8kPyatz2TzMvMnLY
         1kkoSlkeZApRIqwO78y4DruuxNuq4mTQMh2R5OdYQJeSNWnh0aWzT1Qn/XLScmTdevvI
         3QILNwHZ242wVm95zFnM98IVpasGdIZZpyz4gWSTmFyv5lH8vQ29Dt3VQHusryTZVIyi
         uV/ZzgaCj+XSFhLDXHOcnB+bEj+x+JMjHQaLAdeXwuREDrHjxG6/JUDbJIxEWpJ43JiZ
         BGWQ==
X-Gm-Message-State: AOJu0Yy4WMqQKAxRaX/1AGATxaEslm6xuKW4OFnS5MwNFmBnba4NAV9g
	CO7l/EyJZJiIOLYQKwQ++a050JH6d0BYds9ID0u5KkPemoh6pNiwKUox4ncK/1w=
X-Google-Smtp-Source: AGHT+IGGPOqxF0FgMBddgmSOBpes/X9OR2/+vJNekXcYIUTTrmxCLEQ5J0glHevoF356AMkiEOyW8g==
X-Received: by 2002:a0c:edb2:0:b0:68f:ecde:f13f with SMTP id h18-20020a0cedb2000000b0068fecdef13fmr1420248qvr.22.1709630716007;
        Tue, 05 Mar 2024 01:25:16 -0800 (PST)
Date: Tue, 5 Mar 2024 10:25:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Neowutran <xen@neowutran.ovh>
Subject: Re: [PATCH] hvmloader/PCI: skip huge BARs in certain calculations
Message-ID: <Zebk-SiGk07Lj4FZ@macbook>
References: <090d572c-5196-46b2-9d6b-741b7cb66d97@suse.com>
 <ZeWcNGRsjGgUosJY@macbook>
 <06cce36e-5936-4374-9b56-1cb166c2b8b7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06cce36e-5936-4374-9b56-1cb166c2b8b7@suse.com>

On Mon, Mar 04, 2024 at 02:25:45PM +0100, Jan Beulich wrote:
> On 04.03.2024 11:02, Roger Pau Monné wrote:
> > On Mon, Mar 04, 2024 at 08:32:22AM +0100, Jan Beulich wrote:
> >> BARs of size 2Gb and up can't possibly fit below 4Gb: Both the bottom of
> >> the lower 2Gb range and the top of the higher 2Gb range have special
> >> purpose. Don't even have them influence whether to (perhaps) relocate
> >> low RAM.
> > 
> > Here you mention 2Gb BARs, yet the code below sets the maximum BAR
> > size supported below 4Gb to 1Gb.
> 
> Hmm, I'm puzzled: There are no other BAR sizes between 1Gb and 2Gb.
> Anything up to 1Gb continues to work as is, while everything 2Gb and
> up has behavior changed.

My bad, I was confused.

> >> --- a/tools/firmware/hvmloader/pci.c
> >> +++ b/tools/firmware/hvmloader/pci.c
> >> @@ -33,6 +33,13 @@ uint32_t pci_mem_start = HVM_BELOW_4G_MM
> >>  const uint32_t pci_mem_end = RESERVED_MEMBASE;
> >>  uint64_t pci_hi_mem_start = 0, pci_hi_mem_end = 0;
> >>  
> >> +/*
> >> + * BARs larger than this value are put in 64-bit space unconditionally.  That
> >> + * is, such BARs also don't play into the determination of how big the lowmem
> >> + * MMIO hole needs to be.
> >> + */
> >> +#define HUGE_BAR_THRESH GB(1)
> > 
> > I would be fine with defining this to an even lower number, like
> > 256Mb, as to avoid as much as possible memory relocation in order to
> > make the MMIO hole bigger.
> 
> As suggested in a post-commit-message remark, the main question then is
> how to justify this.

I think the justification is to avoid having to relocate memory in
order to attempt to make the hole below 4Gb larger.

> >> @@ -367,7 +376,7 @@ void pci_setup(void)
> >>              pci_mem_start = hvm_info->low_mem_pgend << PAGE_SHIFT;
> >>      }
> >>  
> >> -    if ( mmio_total > (pci_mem_end - pci_mem_start) )
> >> +    if ( mmio_total > (pci_mem_end - pci_mem_start) || bar64_relocate )
> >>      {
> >>          printf("Low MMIO hole not large enough for all devices,"
> >>                 " relocating some BARs to 64-bit\n");
> > 
> > Is the above message now accurate?  Given the current code the low
> > MMIO could be expanded up to 2Gb, yet BAR relocation will happen
> > unconditionally once a 1Gb BAR is found.
> 
> Well, "all" may not be quite accurate anymore, yet would making it e.g.
> "all applicable" really much more meaningful?
> 
> >> @@ -446,8 +455,9 @@ void pci_setup(void)
> >>           *   the code here assumes it to be.)
> >>           * Should either of those two conditions change, this code will break.
> >>           */
> >> -        using_64bar = bars[i].is_64bar && bar64_relocate
> >> -            && (mmio_total > (mem_resource.max - mem_resource.base));
> >> +        using_64bar = bars[i].is_64bar && bar64_relocate &&
> >> +            (mmio_total > (mem_resource.max - mem_resource.base) ||
> >> +             bar_sz > HUGE_BAR_THRESH);
> >>          bar_data = pci_readl(devfn, bar_reg);
> >>  
> >>          if ( (bar_data & PCI_BASE_ADDRESS_SPACE) ==
> >> @@ -467,7 +477,8 @@ void pci_setup(void)
> >>                  resource = &mem_resource;
> >>                  bar_data &= ~PCI_BASE_ADDRESS_MEM_MASK;
> >>              }
> >> -            mmio_total -= bar_sz;
> >> +            if ( bar_sz <= HUGE_BAR_THRESH )
> >> +                mmio_total -= bar_sz;
> > 
> > I'm missing the part where hvmloader notifies QEMU of the possibly
> > expanded base and size memory PCI MMIO regions, so that those are
> > reflected in the PCI root complex registers?
> 
> I don't understand this comment: I'm not changing the interaction
> with qemu at all. Whatever the new calculation it'll be communicated
> to qemu just as before.

That wasn't a complain about the patch, just me failing to see where
this is done.

> > Overall I think we could simplify the code by having a hardcoded 1Gb
> > PCI MMIO hole below 4Gb, fill it with all the 32bit BARs and
> > (re)locate all 64bit BARs above 4Gb (not that I'm requesting you to do
> > it here).
> 
> I'm afraid that would not work very well with OSes which aren't 64-bit
> BAR / PA aware (first and foremost non-PAE 32-bit ones). Iirc that's
> the reason why it wasn't done like you suggest back at the time.

There will still be a ~1Gb window < 4Gb, so quite a bit of space.

I'm unsure whether such OSes will have drivers to manage devices with
that huge BARs in the first place.

Thanks, Roger.

