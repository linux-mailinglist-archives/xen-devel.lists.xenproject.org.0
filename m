Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78140A82A86
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 17:35:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944303.1342807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2XRI-0005L7-J9; Wed, 09 Apr 2025 15:34:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944303.1342807; Wed, 09 Apr 2025 15:34:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2XRI-0005JV-Eg; Wed, 09 Apr 2025 15:34:08 +0000
Received: by outflank-mailman (input) for mailman id 944303;
 Wed, 09 Apr 2025 15:34:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2m=W3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2XRG-0005JP-Td
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 15:34:06 +0000
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [2607:f8b0:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0f4a8084-1558-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 17:34:01 +0200 (CEST)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-736ab1c43c4so6754492b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 08:34:01 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73bb1d6b213sm1477854b3a.81.2025.04.09.08.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 08:33:59 -0700 (PDT)
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
X-Inumbo-ID: 0f4a8084-1558-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744212840; x=1744817640; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w/W5F+qYt8PXbLAtoEpok03W4FU6RWVBrJ3vedp3TnE=;
        b=wCy/rZxwS3HiKgY45d+WKlOY1NdyuU7Ng/no5CpyAr5guiFpe33DRbXLAmJ9FZ/wMZ
         b4bHEMjrlSaSyJO0/r2wA9BnnofpLrwvAMGi8JW+truzP6wMINVoN0xbyu8/TzOAWCOD
         CS0lwAT2olUWiBVOZmN4zCG/a5BTa7RkYHk3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744212840; x=1744817640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w/W5F+qYt8PXbLAtoEpok03W4FU6RWVBrJ3vedp3TnE=;
        b=rN5MQP0LrtVdLit6WSnEeXR4D/sIAh0GYbq2uG8yq50DcwQ3mT5HUeKEuvqVxqsyuQ
         N7omLPKvKIEQD6qEgWiOi2t+nfQTablZ+uxvd0EqC1oUbAcso6v5FDg2R+zExGq2AQMA
         Njy9Z2X2eOqKurfJS3Yo9mElvdKJXOU6ZtldveNSW2Dq4sMl0zxM+CrYvJKxVXb9hIwQ
         d2nHJSPz+W1xED1GGEWO1JxH9DE1qq8mpT41XMNvf12/kzwhsTgmnRXa8BclxFzygWHM
         amKgkU8FvG4Uu4B4gbLi2wvPVGr6UwmjZMhKotnmdLDAhXFND/GywZxZHwGxgWkMk8yq
         mFHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWARW2K4pJv1Vv25rHTD23H6XSsUTEsMrNHbvp9VWCRIz5XVUJfX2ODE/r9OY1oz4XdDsBB4Inj5R8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHht9z03+iM5U1TEjjt+zuPJys/GxHVDDnVDWbZ/9LXSMUOALw
	lolU6r1Wp9mcU7UHzwsHTGBv2R2xtPjWl+v82peNOKcZRaQcgiCkx9fPg5syN1U=
X-Gm-Gg: ASbGncuHHuJBuoeqj5ELCpro20GsC1BOHWYAVo7ZXPtXY9MqGeVvAIAyfr3BwUPuKXQ
	Sq85mTsMBR9IbOHRNU2Y5smu/tIqmwdf0i9GPotZKAe6RETzWRb1oVOjq7Z4SAjitpp4fn8EfhG
	vpPX98U87KI0xEJJuI//J2+qU3dz50QvEjRxDsQ+DHpqKIZZmYeXgbuzeErWDZ6SZYLCDNuWLkp
	+g4N8Hv4FmwdFUB2C1qJR0h5zw+9KrzCbwAq02nA7BX4501RwVvtemN3kfQ6jTDu5e5kd9RQ5AP
	koWMvdra5NSQtj8IRadWe0z1b+R26srrpfg+kg6EA8Zr0g==
X-Google-Smtp-Source: AGHT+IFA3j+02TX+d+gpiwEmkg5gbhJ3HVHY9+LymeFqmgaU98z+MWKDoXpJGL54adO/mFdehScKAA==
X-Received: by 2002:a05:6a00:2186:b0:736:53f2:87bc with SMTP id d2e1a72fcca58-73bafc16c54mr3523882b3a.13.1744212839913;
        Wed, 09 Apr 2025 08:33:59 -0700 (PDT)
Date: Wed, 9 Apr 2025 17:33:54 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_aTYmiOLEfKTend@macbook.lan>
References: <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
 <Z_Y4xFzaltr_XKO4@macbook.lan>
 <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
 <Z_ZOWAttoFNoFYCV@macbook.lan>
 <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>
 <Z_Z3PYYSBH3QWioF@macbook.lan>
 <8709e7af-5827-4c96-9f6b-1f548045040d@suse.com>
 <Z_Z9unJ-wS2dXxUV@macbook.lan>
 <b1e8e761-ddf9-4e4f-b5bb-624b2e7d012c@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b1e8e761-ddf9-4e4f-b5bb-624b2e7d012c@suse.com>

On Wed, Apr 09, 2025 at 04:08:47PM +0200, Jan Beulich wrote:
> On 09.04.2025 16:01, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 03:50:13PM +0200, Jan Beulich wrote:
> >> On 09.04.2025 15:33, Roger Pau Monné wrote:
> >>> On Wed, Apr 09, 2025 at 02:59:45PM +0200, Jan Beulich wrote:
> >>>> On 09.04.2025 12:39, Roger Pau Monné wrote:
> >>>>> On Wed, Apr 09, 2025 at 12:00:16PM +0200, Jan Beulich wrote:
> >>>>>> On 09.04.2025 11:07, Roger Pau Monné wrote:
> >>>>>>> On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
> >>>>>>>> On 08.04.2025 11:31, Roger Pau Monne wrote:
> >>>>>>>>> When running on AMD hardware in HVM mode the guest linear address (GLA)
> >>>>>>>>> will not be provided to hvm_emulate_one_mmio(), and instead is
> >>>>>>>>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> >>>>>>>>> always report an error, as the fault GLA generated by the emulation of the
> >>>>>>>>> access won't be ~0.
> >>>>>>>>
> >>>>>>>> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
> >>>>>>>> generally whenever .gla_valid isn't set).
> >>>>>>>
> >>>>>>> Oh, yes, good catch.  I didn't notice that one.  We should move all
> >>>>>>> those checks to use a paddr rather than a gla.
> >>>>>>
> >>>>>> Really that function could just be passed the offset into the page.
> >>>>>>
> >>>>>>>>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> >>>>>>>>> when the guest is PV.
> >>>>>>>>
> >>>>>>>> This narrows checking too much, imo. For VT-x we could continue to do so,
> >>>>>>>> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
> >>>>>>>> the gla_valid flag visible there.
> >>>>>>>
> >>>>>>> I don't think we should rely on the gla at all in
> >>>>>>> mmio_ro_emulated_write(), and instead just use the physical address.
> >>>>>>
> >>>>>> But you can't validate a physical address against a CR2 value. And I view
> >>>>>> this validation as meaningful, to guard (best effort, but still) against
> >>>>>> e.g. insn re-writing under our feet.
> >>>>>
> >>>>> But we have the mfn in mmio_ro_ctxt, and could possibly use that to
> >>>>> validate?  I could expand the context to include the offset also, so
> >>>>> that we could fully validate it.
> >>>>
> >>>> How would you use the MFN to validate against the VA in CR2?
> >>>
> >>> I would use hvmemul_virtual_to_linear()
> >>
> >> If you mean to use the CR2 as input, you wouldn't need this. I said VA in
> >> my earlier reply, yes, but strictly speaking that's a linear address.
> > 
> > I was thinking about using the segment and offset parameters of the
> > mmio_ro_emulated_write() call.
> > 
> >>> and hvm_translate_get_page()
> >>> to get the underlying mfn of the linear address.  But maybe there's a
> >>> part of this that I'm missing, I've certainly haven't tried to
> >>> implement any of it.
> >>
> >> Hmm, I see. I didn't think of doing it this way round. There's certainly
> >> at least one caveat with this approach: Multiple linear addresses can all
> >> map to the same GFN and hence MFN. Checking against the original linear
> >> address (when available) doesn't have such an issue.
> > 
> > I see... Yet for AMD that address is not uniformly available as part
> > of the vmexit information?
> 
> Even stronger, I thought: It's uniformly not available.

Oh yes, that's what I meant to say but got the words the other way
around.

> >  As I understand the checks done in
> > mmio_ro_emulated_write() are to ensure correctness, but carrying the
> > access even when the %cr2 check fail wouldn't cause issues to Xen
> > itself?
> 
> Well, "wouldn't" is too strong for my taste, "shouldn't" would fit. The
> checking is there to avoid guests playing games. Whether that prevents
> merely in-guest just-bugs or actual XSAs we can't know until we find a
> case where the game playing might make us do something wrong. I expect
> it's unlikely for Xen itself to be affected. But an in-guest privilege
> escalation would already be bad enough.

I see.  That was kind of my understanding of the checks.  At least on
HVM it feels a bit weird to handle r/o regions this way.  It would IMO
be more natural to use an hvm_io_handler, but that's maybe because I'm
more familiar with those.

And in that regard, hvm_io_handler don't seem to do any of the extra
checking that mmio_ro_emulated_write() does with the %cr2, but maybe
that's done by some higher layer?  AFAICT that would ultimately get
called by hvmemul_read(), and there are no checks there at all.

> So why don't we do the linear address check as we do today (provided a
> linear address is available), and only use the alternative approach when
> no linear address is available?

I can try to do that, albeit as said above, at least for HVM guests
that checking of %cr2 seems to be quite inconsistent, as
hvmemul_{read,write}() won't do any of it.

Thanks, Roger.

