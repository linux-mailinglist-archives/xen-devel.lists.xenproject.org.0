Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726BA826E9
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 16:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944194.1342736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vzk-0000Ds-Ln; Wed, 09 Apr 2025 14:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944194.1342736; Wed, 09 Apr 2025 14:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2Vzk-0000C6-JC; Wed, 09 Apr 2025 14:01:36 +0000
Received: by outflank-mailman (input) for mailman id 944194;
 Wed, 09 Apr 2025 14:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2m=W3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1u2Vzj-0008B2-KG
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 14:01:35 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 25070408-154b-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 16:01:33 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5e5deb6482cso1487015a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 09 Apr 2025 07:01:33 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-acaa1cb42b4sm101115466b.97.2025.04.09.07.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 07:01:32 -0700 (PDT)
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
X-Inumbo-ID: 25070408-154b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744207293; x=1744812093; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aYRJO79u8BHDTeHFy2y6Kmksngotc0X689NbgbvYBDE=;
        b=Kg8ZE6+sYFCqcvMFU/SjCGxiCHT2RdCbGBsKdoJD1ZS+7zdFV5xJj0AO8BCUslOgX0
         z4sDyn1tRrTs4I9sv4IZnaJs1vt5SEGvmqvfMQpXDuxtCYz71S7Rxu90M87Nm/jsDoa7
         cS7EzP93b+rxnuEspluUGnBAvUxt35PBa9qao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207293; x=1744812093;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYRJO79u8BHDTeHFy2y6Kmksngotc0X689NbgbvYBDE=;
        b=ueCxAlluEWUNcEmjTHUPcCUxgsX3ydNktqfC43JTJ5uvxi9vM/hSjvciip4S9j2t2x
         5s71kXjx+Ex/s/JXWVWfhiU3lMyEhF5IRjPqsuKxHw1OzWXsfWAwOYH+28s70Ly7bGfF
         uyV0QuDfL59RpDO3alUtAGWv9wOKNiaTcxY4rQyGYafVWFUtXCHmdoGblNwN7D9/WEQc
         I3eReRdUDxw2G31pubzCQId7abDhxbYZAmC2yPkY9scd1X+cMZobhPGfhd6XTui3AzIG
         9ZDexja8CvyN1JdgBzDZSFUnLseh5ooRGtNzE7NpRonKsB/1WWT/QSPWyoVnw/5ZDhTX
         r+hA==
X-Forwarded-Encrypted: i=1; AJvYcCWdyFB3bUTHDN7gi1xNKM9ypXFdBq/F0hU1MYk6LyXGIY5K0i0q+f4ppHi87HU+tauXRCF9FVywAtE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw/BQ9NAuv3C/+JlmA7NZIsiSSQbMkGoTcCdPMsGg5kvOg4RlvK
	5z+Nrqlm0WfSc7l9HVIUUBZQDXn4YwyWAuwCVbWeASmmxryLnMZVOhFlDeCsQ/e22OGstyYOgjR
	+
X-Gm-Gg: ASbGncvOxBmM0CjY/78zhb0ejwpQ30A1IwijutI/UkvMe2lg2eHJ4uFpdqmcr6GSjVk
	8DA01ckl28Q6hlHIglfV23+nAKiunQ8leGjbhJdKFy8lYv4ubT4TjZrzK1+xJACu+oWfxFQe7AK
	IxXCmr5YOcXAoh/RMpap9iAbJsXqwfXcGwSztmxlR0wvxHbuMeYb1+tLbOImg+CzpnZ1eF/hu83
	vTsXtJZhfPPu4ixVJVvE8JyY/NuxGTZpdetUoRNlXOz2wiLLsftoXleSGOVELIKiEwwXOVAe52h
	7bLOSAWskAQ6SeoET4qpKbZPthogWuYSmi2HrtnZr3uHJw==
X-Google-Smtp-Source: AGHT+IElmFE6uDrnrjEEF900z4nPXCO9HHM0Ud0/YLFfUVhq+gwwEKJykFmjCy9HkjKiLZwxQyRkpA==
X-Received: by 2002:a17:907:70d:b0:ac6:f5b5:36e0 with SMTP id a640c23a62f3a-ac81a811519mr628581166b.19.1744207293020;
        Wed, 09 Apr 2025 07:01:33 -0700 (PDT)
Date: Wed, 9 Apr 2025 16:01:30 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek Marczykowski <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_Z9unJ-wS2dXxUV@macbook.lan>
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
 <Z_Y4xFzaltr_XKO4@macbook.lan>
 <ef0b6eea-a7e5-406d-a8ba-062b3c6e17e1@suse.com>
 <Z_ZOWAttoFNoFYCV@macbook.lan>
 <2df78a5d-2f9f-4866-81cc-03ae09c76d50@suse.com>
 <Z_Z3PYYSBH3QWioF@macbook.lan>
 <8709e7af-5827-4c96-9f6b-1f548045040d@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8709e7af-5827-4c96-9f6b-1f548045040d@suse.com>

On Wed, Apr 09, 2025 at 03:50:13PM +0200, Jan Beulich wrote:
> On 09.04.2025 15:33, Roger Pau Monné wrote:
> > On Wed, Apr 09, 2025 at 02:59:45PM +0200, Jan Beulich wrote:
> >> On 09.04.2025 12:39, Roger Pau Monné wrote:
> >>> On Wed, Apr 09, 2025 at 12:00:16PM +0200, Jan Beulich wrote:
> >>>> On 09.04.2025 11:07, Roger Pau Monné wrote:
> >>>>> On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
> >>>>>> On 08.04.2025 11:31, Roger Pau Monne wrote:
> >>>>>>> When running on AMD hardware in HVM mode the guest linear address (GLA)
> >>>>>>> will not be provided to hvm_emulate_one_mmio(), and instead is
> >>>>>>> unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() will
> >>>>>>> always report an error, as the fault GLA generated by the emulation of the
> >>>>>>> access won't be ~0.
> >>>>>>
> >>>>>> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
> >>>>>> generally whenever .gla_valid isn't set).
> >>>>>
> >>>>> Oh, yes, good catch.  I didn't notice that one.  We should move all
> >>>>> those checks to use a paddr rather than a gla.
> >>>>
> >>>> Really that function could just be passed the offset into the page.
> >>>>
> >>>>>>> Fix this by only checking for the fault GLA in mmio_ro_emulated_write()
> >>>>>>> when the guest is PV.
> >>>>>>
> >>>>>> This narrows checking too much, imo. For VT-x we could continue to do so,
> >>>>>> provided we pass e.g. npfec down into hvm_emulate_one_mmio(), i.e. make
> >>>>>> the gla_valid flag visible there.
> >>>>>
> >>>>> I don't think we should rely on the gla at all in
> >>>>> mmio_ro_emulated_write(), and instead just use the physical address.
> >>>>
> >>>> But you can't validate a physical address against a CR2 value. And I view
> >>>> this validation as meaningful, to guard (best effort, but still) against
> >>>> e.g. insn re-writing under our feet.
> >>>
> >>> But we have the mfn in mmio_ro_ctxt, and could possibly use that to
> >>> validate?  I could expand the context to include the offset also, so
> >>> that we could fully validate it.
> >>
> >> How would you use the MFN to validate against the VA in CR2?
> > 
> > I would use hvmemul_virtual_to_linear()
> 
> If you mean to use the CR2 as input, you wouldn't need this. I said VA in
> my earlier reply, yes, but strictly speaking that's a linear address.

I was thinking about using the segment and offset parameters of the
mmio_ro_emulated_write() call.

> > and hvm_translate_get_page()
> > to get the underlying mfn of the linear address.  But maybe there's a
> > part of this that I'm missing, I've certainly haven't tried to
> > implement any of it.
> 
> Hmm, I see. I didn't think of doing it this way round. There's certainly
> at least one caveat with this approach: Multiple linear addresses can all
> map to the same GFN and hence MFN. Checking against the original linear
> address (when available) doesn't have such an issue.

I see... Yet for AMD that address is not uniformly available as part
of the vmexit information?  As I understand the checks done in
mmio_ro_emulated_write() are to ensure correctness, but carrying the
access even when the %cr2 check fail wouldn't cause issues to Xen
itself?

Thanks, Roger.

