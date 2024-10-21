Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A459E9A704B
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 19:00:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823852.1237928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vlQ-0003Kl-1s; Mon, 21 Oct 2024 17:00:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823852.1237928; Mon, 21 Oct 2024 17:00:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2vlP-0003He-V1; Mon, 21 Oct 2024 17:00:15 +0000
Received: by outflank-mailman (input) for mailman id 823852;
 Mon, 21 Oct 2024 17:00:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAaI=RR=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1t2vlO-0003HY-PI
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 17:00:14 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f037ca44-8fcd-11ef-a0be-8be0dac302b0;
 Mon, 21 Oct 2024 19:00:13 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c9850ae22eso5945949a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 10:00:13 -0700 (PDT)
Received: from localhost ([213.195.115.182]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72757sm2127530a12.92.2024.10.21.10.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2024 10:00:12 -0700 (PDT)
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
X-Inumbo-ID: f037ca44-8fcd-11ef-a0be-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729530013; x=1730134813; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ClLCiN38QDkvTTCPc3TF4FA56XZ7XlB9KpaadPaz9E=;
        b=qQESVnnvvYi0sRycK6+qREGXiE6PYi9PSbHNd/10uSCMXemhixmdTzbnmG2bzeZ0hH
         AxK8NkfHznHtWbnKnrIeBeHRBon/N5E6vjLYKgJWVG32mU45LUiYy41+r6T6kHyOdNux
         cNjLrs6VPfhBh6m25ya+UgLUWlqc9IdGWip6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530013; x=1730134813;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ClLCiN38QDkvTTCPc3TF4FA56XZ7XlB9KpaadPaz9E=;
        b=HYJ/eKmhbUmU5YCyp3W/ZNkDTloAShEtUYTQhskCChWsCfEbutJuowIyu+uP9SoCMe
         BD0G7XTrE8Ug+P7GcX7iZV46bbdxJNFBAtVI1/vWDww72jFzimx8fAE1zM9AAoYpxH1f
         vjipmjAlE3/Bb62j1h66Poa11GLlnFfuNuMgpyEv397BXI/gwQzOd3y9jDxUhYUlLC6k
         kREQNjk4i1yDz6mh7kLFCTSXAskkJcCbE6w5uzpQQlvOllLQtD0Iuh3QhD0jtddHkIJ4
         HUywkglkNF9kM7DIcWKjfwx7aqA41RL7gqoCCI8sDritxQTEYZ0eAbWGQT3bo11okR1k
         38HQ==
X-Gm-Message-State: AOJu0YyTVlYQzQA6sWkoFbhuBkC/fq96j7wvyWmCDe8HDrEJ+ZlvbCuo
	w+TCNAphX5rOsiCT+qtE0M95TabOoyK4fK4H/wKPI3TntpCa8EwdoF8JOAkZyzM=
X-Google-Smtp-Source: AGHT+IG8VXIc3Sb4DbuWCIvzwbgBtUUdVov7W26e/boeJAvl/FXGtDVyzAsUKi158kqjw5Ia/dMFYA==
X-Received: by 2002:a05:6402:5247:b0:5cb:6690:eabb with SMTP id 4fb4d7f45d1cf-5cb6690eb13mr5461415a12.24.1729530012679;
        Mon, 21 Oct 2024 10:00:12 -0700 (PDT)
Date: Mon, 21 Oct 2024 19:00:11 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Willi Junga <xenproject@ymy.be>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH] x86/io-apic: fix directed EOI when using AMd-Vi
 interrupt remapping
Message-ID: <ZxaImxbGOg2uxR3x@macbook.local>
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

I've been giving some thought about this further, and I don't think
the above is accurate.  While vectors 0 thru 0x0f are strictly
invalid, the EOI handle in AMD-Vi is not a vector, but an offset into
the IR table.  Hence the range of valid handles is 0 to 0xff.

So the type of apic_pin_eoi needs to account for 0 to 0xff plus one
sentinel.  We could use uint16_t or int16_t, but at that point it
might be better to just use unsigned int?

Thanks, Roger.

