Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D23BD9A6B6F
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 16:04:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823554.1237561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2t0d-0000De-H1; Mon, 21 Oct 2024 14:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823554.1237561; Mon, 21 Oct 2024 14:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2t0d-0000BF-Di; Mon, 21 Oct 2024 14:03:47 +0000
Received: by outflank-mailman (input) for mailman id 823554;
 Mon, 21 Oct 2024 14:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2t0c-0000B8-2w
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 14:03:46 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 48b25903-8fb5-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 16:03:44 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c903f5bd0eso381952a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 07:03:44 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d65adsm208150266b.27.2024.10.21.07.03.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 07:03:43 -0700 (PDT)
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
X-Inumbo-ID: 48b25903-8fb5-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729519424; x=1730124224; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=grfRuzxwxhhW3svckMI1JoDsdzWpAhGvOOfgPJhIm/s=;
        b=Szodz+5soQlP1c1aTAuX1FWXvXSXH4Bc4ksyAseSJ9ENRDMVv0hjvJVLkIklO1DOru
         MnR+e23BoylNk2rOr2gg65w4zDpoaPxq27ZhS++og4PnS8x+bBmO/ROxJyLQSW7YQa/H
         n0DbyEVay3lnYYI8c3fNrmORu6rV4dOIcLAqo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729519424; x=1730124224;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grfRuzxwxhhW3svckMI1JoDsdzWpAhGvOOfgPJhIm/s=;
        b=ZDdzsbp4eHOpjYKDWHi64yT8/kIVk86tlKpGWVlhElh3GSrZ+jUPJ35KCUIOfGCNtZ
         HQKxhAed9PjzoonUcqR1N8COcWCIhifms1yCuFmD9YAiRToMLdcfInOQprkMQXWjiAeD
         Ujvr+2RtYCH6b5LteOiM7sanC535LHqrZikMfb46YwQZiVTiMIB0Bt7rHp1EZ9QZH0Wx
         YuXo0BwsITOYWQ8L5kLvzXEU6tIwtblz/5bG+vL753C3qCIVagzFD2VCHHmJ/TrCNpvI
         w5PllIkVcVUc/nl2k0SSnbew20z29vOkcJ5R4cyGmbq/ca0MUwgrDdeDSoIeh1UyYcsU
         l+bw==
X-Gm-Message-State: AOJu0Yyr+5odaq7XzfYw7+qMNogNq7QykmEaujhLkbPPHkI626YPeOxh
	pamp4d12++x1qWuBBHglD9ZmrbKGnp+taMwa2EawJGMU6gn3o+7ObAwHUdGOtvGpRBNkPFRx+EG
	j
X-Google-Smtp-Source: AGHT+IE3uQKRoEXWRTUwNIomZMUTsyW8qAMWPFMwB8t9rlmE/dY+wNh2v1dxSfesjowzvJwe4GkZ4w==
X-Received: by 2002:a17:907:3f23:b0:a9a:558:3929 with SMTP id a640c23a62f3a-a9a69c9881dmr1243053266b.48.1729519423554;
        Mon, 21 Oct 2024 07:03:43 -0700 (PDT)
Date: Mon, 21 Oct 2024 16:03:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZxZfPpOz0v0xxlUu@macbook.local>
References: <20241018080813.45759-1-roger.pau@citrix.com>
 <9270ef0c-9dfa-4fbf-8060-3c507c0c6684@citrix.com>
 <0f3a9c97-3903-414c-b076-5012e6bc9350@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f3a9c97-3903-414c-b076-5012e6bc9350@citrix.com>

On Mon, Oct 21, 2024 at 12:38:13PM +0100, Andrew Cooper wrote:
> On 21/10/2024 12:10 pm, Andrew Cooper wrote:
> > On 18/10/2024 9:08 am, Roger Pau Monne wrote:
> >> When using AMD-VI interrupt remapping the vector field in the IO-APIC RTE is
> >> repurposed to contain part of the offset into the remapping table.  Previous to
> >> 2ca9fbd739b8 Xen had logic so that the offset into the interrupt remapping
> >> table would match the vector.  Such logic was mandatory for end of interrupt to
> >> work, since the vector field (even when not containing a vector) is used by the
> >> IO-APIC to find for which pin the EOI must be performed.
> >>
> >> Introduce a table to store the EOI handlers when using interrupt remapping, so
> >> that the IO-APIC driver can translate pins into EOI handlers without having to
> >> read the IO-APIC RTE entry.  Note that to simplify the logic such table is used
> >> unconditionally when interrupt remapping is enabled, even if strictly it would
> >> only be required for AMD-Vi.
> >>
> >> Reported-by: Willi Junga <xenproject@ymy.be>
> >> Suggested-by: David Woodhouse <dwmw@amazon.co.uk>
> >> Fixes: 2ca9fbd739b8 ('AMD IOMMU: allocate IRTE entries instead of using a static mapping')
> >> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > Yet more fallout from the multi-MSI work.  That really has been a giant
> > source of bugs.
> >
> >> ---
> >>  xen/arch/x86/io_apic.c | 47 ++++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 47 insertions(+)
> >>
> >> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
> >> index e40d2f7dbd75..8856eb29d275 100644
> >> --- a/xen/arch/x86/io_apic.c
> >> +++ b/xen/arch/x86/io_apic.c
> >> @@ -71,6 +71,22 @@ static int apic_pin_2_gsi_irq(int apic, int pin);
> >>  
> >>  static vmask_t *__read_mostly vector_map[MAX_IO_APICS];
> >>  
> >> +/*
> >> + * Store the EOI handle when using interrupt remapping.
> >> + *
> >> + * If using AMD-Vi interrupt remapping the IO-APIC redirection entry remapped
> >> + * format repurposes the vector field to store the offset into the Interrupt
> >> + * Remap table.  This causes directed EOI to longer work, as the CPU vector no
> >> + * longer matches the contents of the RTE vector field.  Add a translation
> >> + * table so that directed EOI uses the value in the RTE vector field when
> >> + * interrupt remapping is enabled.
> >> + *
> >> + * Note Intel VT-d Xen code still stores the CPU vector in the RTE vector field
> >> + * when using the remapped format, but use the translation table uniformly in
> >> + * order to avoid extra logic to differentiate between VT-d and AMD-Vi.
> >> + */
> >> +static unsigned int **apic_pin_eoi;
> > I think we can get away with this being uint8_t rather than unsigned
> > int, especially as we're allocating memory when not strictly necessary.
> >
> > The only sentinel value we use is IRQ_VECTOR_UNASSIGNED which is -1.
> >
> > Vector 0xff is strictly SPIV and not allocated for anything else, so can
> > be reused as a suitable sentinel here.
> 
> Actually, vectors 0 thru 0x0f are also strictly invalid, and could be
> used as sentinels.  That's probably better than trying to play integer
> promotion games between IRQ_VECTOR_UNASSIGNED and uint8_t.

Hm, do you mean to change IRQ_VECTOR_UNASSIGNED to be 0 instead of -1?
Those vectors are equally invalid to be used for external interrupts,
and hence should never be in an irq_desc.

Otherwise just using 0 for the EOI table sentinel will make the code a
bit more ugly IMO:

if ( apic_pin_eoi )
    vector = apic_pin_eoi[apic][pin] ?: IRQ_VECTOR_UNASSIGNED;

/* If vector is unknown, read it from the IO-APIC */
if ( vector == IRQ_VECTOR_UNASSIGNED )
{
    vector = __ioapic_read_entry(apic, pin, true).vector;
    if ( apic_pin_eoi )
        /* Update cached value so further EOI don't need to fetch it. */
        apic_pin_eoi[apic][pin] = vector;
}

Thanks, Roger.

