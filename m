Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837FA9412C1
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2024 15:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.767763.1178464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmVk-0000bW-1Y; Tue, 30 Jul 2024 13:03:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 767763.1178464; Tue, 30 Jul 2024 13:03:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYmVj-0000ZB-Uv; Tue, 30 Jul 2024 13:03:27 +0000
Received: by outflank-mailman (input) for mailman id 767763;
 Tue, 30 Jul 2024 13:03:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/bP=O6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sYmVj-0000Z5-9A
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2024 13:03:27 +0000
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [2607:f8b0:4864:20::f2b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b5eb896-4e74-11ef-bc01-fd08da9f4363;
 Tue, 30 Jul 2024 15:03:26 +0200 (CEST)
Received: by mail-qv1-xf2b.google.com with SMTP id
 6a1803df08f44-6bb5a4668faso20969646d6.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jul 2024 06:03:26 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa94ca6sm62808196d6.93.2024.07.30.06.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 06:03:23 -0700 (PDT)
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
X-Inumbo-ID: 1b5eb896-4e74-11ef-bc01-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1722344605; x=1722949405; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/QmYZ0eF/uEyrjSlgiXTSl5fZqKsXtWLNlfbJ6q6uUQ=;
        b=R57n/DfhDi2f2qKtJ4ngMmprmdOPuVcQDKIGVTvPSLiUBNVAXJWUdscwjNZnPF8afl
         xSvgFLQg4gH2qos0dn8MWj28qnGbXBJIh+nTZT5ctRmnJAQwbwiSiXCW8G36FDlzsJ71
         Y5x4PoqkXCkBj3r+IF6BoBXv8LawWPZRVEdqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722344605; x=1722949405;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/QmYZ0eF/uEyrjSlgiXTSl5fZqKsXtWLNlfbJ6q6uUQ=;
        b=c2WVH+iFjm7zNSeYjDOcW625ZjtESwMQecdc9ZhqBiOBC2T5IZh93u/QfbSlmQCFLa
         SDOZOzWQuiKrClqLZfJ1qgpVI/qs597qXN8Tuu3plTahZR/N9a7xBcgtQEuzFOZa8UBV
         pkWifNFmM8gaqUimgMAWg4/pl8vda+tcqw4+ipG87Mq11RuunI2Adh7Jl+NEzrgzrXS5
         d7zBxFsiHs6rtxwZu1y0FTEydUw77B6/c/8CPU7dUmrl5ukfk6qN9oyyajT4JvNy/H+t
         8HDHakZMfaPMHGQZSIf2M0Vf0K7vz9PaAJbwZSWQfpSzadtCP594Pj55GH9bPrS9PZ/G
         DaEA==
X-Forwarded-Encrypted: i=1; AJvYcCXjFdbZ2gTc5N/4XVJ3ctEyR3PArJHAXHjp9/HfRiKJcwNf3PnSzjHK12tB34es/4nVx2l/XqeZ2YxtBSdc/yL9zoeaWLgNX1LBKg0+0G4=
X-Gm-Message-State: AOJu0YzyAjaDBypjs0asY/QNrHrvAZrTeslKaI3ZhKXtLUV1sfakgJax
	8c8J1BBB50EhcDvdFfwaTU1q1MAfW0kF5RE13IWPsuEWqUiOiOQLOmhlRKQa8Ig=
X-Google-Smtp-Source: AGHT+IFN05jLHWMjDldHmjQA20iuXvaDQLRlxqqEAqyjl5p6F2Z9bR840j698EJP16FomLt4CQVXvg==
X-Received: by 2002:a05:6214:2629:b0:6b0:6400:3b6f with SMTP id 6a1803df08f44-6bb559f9ba2mr143736426d6.8.1722344604115;
        Tue, 30 Jul 2024 06:03:24 -0700 (PDT)
Date: Tue, 30 Jul 2024 15:03:20 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, alejandro.vallejo@cloud.com,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 03/22] x86/dom0: only disable SMAP for the PV dom0 build
Message-ID: <ZqjkmLZ9TLtqwQnV@macbook>
References: <20240726152206.28411-1-roger.pau@citrix.com>
 <20240726152206.28411-4-roger.pau@citrix.com>
 <b1918f51-1ac0-40f8-9174-d8161b2681dd@suse.com>
 <5aad5f48-e32e-4a59-bcef-05adec0ecbec@citrix.com>
 <ZqfA714LUFgZOYqw@macbook>
 <542807c8-425b-481f-b02f-dd657c12ef5d@citrix.com>
 <ZqjGs2NLTbatrQS9@macbook>
 <9aa68e23-8c9c-4596-b847-6b1d34e57004@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9aa68e23-8c9c-4596-b847-6b1d34e57004@citrix.com>

On Tue, Jul 30, 2024 at 12:06:45PM +0100, Andrew Cooper wrote:
> On 30/07/2024 11:55 am, Roger Pau Monné wrote:
> > On Mon, Jul 29, 2024 at 06:51:31PM +0100, Andrew Cooper wrote:
> >> On 29/07/2024 5:18 pm, Roger Pau Monné wrote:
> >>> On Mon, Jul 29, 2024 at 04:52:22PM +0100, Andrew Cooper wrote:
> >>>> On 29/07/2024 12:53 pm, Jan Beulich wrote:
> >>>>> On 26.07.2024 17:21, Roger Pau Monne wrote:
> >>>>>> The PVH dom0 builder doesn't switch page tables and has no need to run with
> >>>>>> SMAP disabled.
> >>>>>>
> >>>>>> Put the SMAP disabling close to the code region where it's necessary, as it
> >>>>>> then becomes obvious why switch_cr3_cr4() is required instead of
> >>>>>> write_ptbase().
> >>>>>>
> >>>>>> Note removing SMAP from cr4_pv32_mask is not required, as we never jump into
> >>>>>> guest context, and hence updating the value of cr4_pv32_mask is not relevant.
> >>>>> I'm okay-ish with that being dropped, but iirc the goal was to keep the
> >>>>> variable in sync with CPU state.
> >>>> Removing SMAP from cr4_pv32_mask is necessary.
> >>>>
> >>>> Otherwise IST vectors will reactive SMAP behind the back of the dombuilder.
> >>>>
> >>>> This will probably only manifest in practice in a CONFIG_PV32=y build,
> >>> Sorry, I'm possibly missing some context here.  When running the dom0
> >>> builder we switch to the guest page-tables, but not to the guest vCPU,
> >>> (iow: current == idle) and hence the context is always the Xen
> >>> context.
> >> Correct.
> >>
> >>> Why would the return path of the IST use cr4_pv32_mask when the
> >>> context in which the IST happened was the Xen one, and the current
> >>> vCPU is the idle one (a 64bit PV guest from Xen's PoV).
> >>>
> >>> My understanding is that cr4_pv32_mask should only be used when the
> >>> current context is running a 32bit PV vCPU.
> >> This logic is evil to follow, because you need to look at both
> >> cr4_pv32_mask and XEN_CR4_PV32_BITS to see both halves of it.
> >>
> >> Notice how cr4_pv32_restore() only ever OR's cr4_pv32_mask into %cr4?
> >>
> >> CR4_PV32_RESTORE is called from every entry path which *might* have come
> >> from a 32bit PV guest, and it always results in Xen having SMEP/SMAP
> >> active (as applicable).  This includes NMI.
> >>
> >> The change is only undone in compat_restore_all_guest(), where
> >> XEN_CR4_PV32_BITS is cleared from %cr4 iff returning to Ring1/2.  This
> >> is logic cunningly disguised in the use of the Parity flag.
> >>
> >>
> >> Because the NMI handler does reactive SMEP/SMAP (based on the value in
> >> cr4_pv32_mask), and returning to Xen does not pass through
> >> compat_restore_all_guest(), taking an NMI in the middle of of the
> >> dombuilder will reactive SMAP behind your back.
> > After further conversations with Andrew we believe the current
> > disabling of X86_CR4_SMAP in %cr4 during dom0 build is not safe.
> >
> > Regardless of whether cr4_pv32_mask is properly adjusted return to Xen
> > context from interrupt would be done with SMAP enabled if
> > X86_FEATURE_XEN_SMAP is set.
> 
> Sorry - that's not what I intended to convey.
> 
> The logic prior to this patch is safe.  SMAP is cleared from
> cr4_pv32_mask before clearing CR4.SMAP, and reinstated in the opposite
> order.  Therefore, an NMI hitting the region won't reactivate SMAP
> because it's not (instantaniously) set in cr4_pv32_mask.

My bad, I was getting confused with the `clac` instructions in the
event entry points.

I think with my proposed change we would also hit the BUG in
cr4_pv32_restore on debug builds if Xen got an interrupt in the middle
of the SMAP disabled dom0 build region if SMEP is enabled, as
cr4_pv32_mask would differ from the current %cr4 value (not all bits
intended would be actually set).

> Arguably it wants some barrier()'s for clarity, and an explanation of
> why this works.
> 
> The problem your patch has is that by not clearing SMAP from
> cr4_pv32_mask, it becomes unsafe iff an NMI/#MC/#DB hits the region.

Won't such issue also affect common_interrupt, and hence not be
limited to NMI/#MC/#DB only?

Regards, Roger.

