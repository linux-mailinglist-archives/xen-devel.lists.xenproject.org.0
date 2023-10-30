Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450A57DBC73
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 16:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625184.974203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTy0-0002tR-Ly; Mon, 30 Oct 2023 15:14:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625184.974203; Mon, 30 Oct 2023 15:14:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxTy0-0002qv-J7; Mon, 30 Oct 2023 15:14:12 +0000
Received: by outflank-mailman (input) for mailman id 625184;
 Mon, 30 Oct 2023 15:14:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3VkP=GM=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qxTxz-0002qn-GP
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 15:14:11 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f968ec09-7736-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 16:14:09 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9c2a0725825so738722366b.2
 for <xen-devel@lists.xenproject.org>; Mon, 30 Oct 2023 08:14:09 -0700 (PDT)
Received: from localhost ([213.195.118.109]) by smtp.gmail.com with ESMTPSA id
 fi25-20020a170906da1900b009cc1227f443sm6181962ejb.104.2023.10.30.08.14.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 08:14:08 -0700 (PDT)
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
X-Inumbo-ID: f968ec09-7736-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1698678849; x=1699283649; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yOpZxaIol7tk52sBTGzczNigV8eMbx2hEnqlTVEwtS4=;
        b=BsUZMPipi1DYHgt11J0SWW7dmhTCcKUS6i85dmzXPLU4LHc+fce2IZoJye9QETQrIT
         t5e4rrW+7GNd9vbSxogobKWWTJGWdNNEXyEfUe/tRX/fr45QB3kzWLDfSHjNdlKpJVCi
         dg6Qg279TztgmjxTtWPtycwSUIAYkDVLH67qo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698678849; x=1699283649;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yOpZxaIol7tk52sBTGzczNigV8eMbx2hEnqlTVEwtS4=;
        b=F7GqcDc7fLk/HTquAAhH7AYpDjAQtPMGpDLW0KgYP0oD/aaDMK/LeYZOOM1IVU5AF3
         VtBSGZRAk5KglzYcJZbup6flsV5DSoAuzs10PNko+PaaH1+1/2gritgfPCMiF/bq2nC8
         eUnp9OpImlCGNVg7A7BqF0j5xN9eMo5cTY6pzRXFanFEeXQ05ywweiPGtl2jxfB+/NIa
         80sS46mAEySlWH0YLsjAc9XwQIYwzCD9sARJDp5Pu7A4oAudfpLhmvX/BeHyoiMoiPJM
         nIbi9sdD1sl15VV/s76MfV+7nB8DrjWeRzJmZ5DxHWh+51hx9bgAm8wm3qXm8JZO6zur
         b5Qw==
X-Gm-Message-State: AOJu0YyzUzWMML3C4/oQuNMchgYe8wO4yupNTK5Q64gj7pfVRDJSOpeh
	UibBft8oVjPGGfqRKqqHq73c9g==
X-Google-Smtp-Source: AGHT+IGvPbyNwuTu6JWNktvhvcOPzHBnePvo4bbYIh76v7xVo1rUpXSSodkISy7Sso6J7effRNd4IA==
X-Received: by 2002:a17:906:daca:b0:9ae:3d17:d5d0 with SMTP id xi10-20020a170906daca00b009ae3d17d5d0mr8809273ejb.31.1698678848695;
        Mon, 30 Oct 2023 08:14:08 -0700 (PDT)
Date: Mon, 30 Oct 2023 16:14:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 4/7] x86: detect PIC aliasing on ports other than
 0x[2A][01]
Message-ID: <ZT_IP_-X4oLhmcFT@macbook>
References: <95129c04-f37c-9e26-e65d-786a1db2f003@suse.com>
 <27dd8f40-1ea6-1e7e-49c2-31936a17e9d7@suse.com>
 <ZToksEP1Fg8MscdK@macbook>
 <86eb1c0d-ac95-247b-16c3-9c4871398082@suse.com>
 <ZTponIYDYDWRZhzi@macbook>
 <75026813-03fe-3a46-2274-b93e98f62f89@suse.com>
 <ZTqDjNSBmXeblsud@macbook>
 <d3da9300-781f-9abb-158b-0c82d36228f5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3da9300-781f-9abb-158b-0c82d36228f5@suse.com>

On Mon, Oct 30, 2023 at 01:24:52PM +0100, Jan Beulich wrote:
> On 26.10.2023 17:19, Roger Pau Monné wrote:
> > On Thu, Oct 26, 2023 at 05:07:18PM +0200, Jan Beulich wrote:
> >> On 26.10.2023 15:24, Roger Pau Monné wrote:
> >>> On Thu, Oct 26, 2023 at 11:03:42AM +0200, Jan Beulich wrote:
> >>>> On 26.10.2023 10:34, Roger Pau Monné wrote:
> >>>>> On Thu, May 11, 2023 at 02:06:46PM +0200, Jan Beulich wrote:
> >>>>>> ... in order to also deny Dom0 access through the alias ports. Without
> >>>>>> this it is only giving the impression of denying access to both PICs.
> >>>>>> Unlike for CMOS/RTC, do detection very early, to avoid disturbing normal
> >>>>>> operation later on.
> >>>>>>
> >>>>>> Like for CMOS/RTC a fundamental assumption of the probing is that reads
> >>>>>> from the probed alias port won't have side effects in case it does not
> >>>>>> alias the respective PIC's one.
> >>>>>
> >>>>> I'm slightly concerned about this probing.
> >>>>>
> >>>>> Also I'm unsure we can fully isolate the hardware domain like this.
> >>>>> Preventing access to the non-aliased ports is IMO helpful for domains
> >>>>> to realize the PIT is not available, but in any case such accesses
> >>>>> shouldn't happen in the first place, as dom0 must be modified to run
> >>>>> in such mode.
> >>>>
> >>>> That's true for PV Dom0, but not necessarily for PVH. Plus by denying
> >>>> access to the aliases we also guard against bugs in Dom0, if some
> >>>> component thinks there's something else at those ports (as they
> >>>> indeed were used for other purposes by various vendors).
> >>>
> >>> I think it would be safe to add a command line option to disable the
> >>> probing, as we would at least like to avoid it in pvshim mode.  Maybe
> >>> ut would be interesting to make it a Kconfig option so that exclusive
> >>> pvshim Kconfig can avoid all this?
> >>>
> >>> Otherwise it will just make booting the pvshim slower.
> >>
> >> I've taken note to introduce such an option (not sure yet whether just
> >> cmdline or also Kconfig). Still
> >> - Shouldn't we already be bypassing related init logic in shim mode?
> > 
> > Not sure what we bypass in pvshim mode, would be good to double
> > check.
> > 
> >> - A Kconfig option interfacing with PV_SHIM_EXCLUSIVE will collide with
> >>   my patch inverting that option's sense (and renaming it), so it would
> >>   be nice to have that sorted/accepted first (see
> >>   https://lists.xen.org/archives/html/xen-devel/2023-03/msg00040.html).
> > 
> > It being Andrew the one that made the request, I would like to get his
> > opinion on it.  UNCONSTRAINED does seem a bit weird.
> 
> I agree that the name is odd; I couldn't think of any better one (and
> this already is the result of 3 or 4 rounds of renaming). I'll be more
> than happy to consider other naming suggestions. The main issue with the
> present option is, just to re-state it here, that we have grown negative
> dependencies on it, which is a problem.
> 
> However, meanwhile I've realized that we don't really want to tie anything
> here to PV_SHIM_EXCLUSIVE, at least not directly. What we care about is
> whether we _actually_ run in shim mode, i.e. also when a full-fledged
> hypervisor is in use. My plan is now to have said new command line option,
> which - if not specified on the command line - I'd default to !pv_shim.

So that tests for aliases are run unless in pv shim mode.

> > Maybe the issue is that PV_SHIM_EXCLUSIVE shouldn't have been a
> > Kconfig option in the first place, and instead a specific Kconfig
> > config file?
> > 
> > Maybe it's not possible to achieve the same using just a Kconfig
> > config file.
> 
> I'm afraid I don't understand what you mean by "Kconfig config file". It
> can't really be just another .../Kconfig file somewhere in the tree, as
> it doesn't really matter where an option like this would be defined.

No, I was thinking of splitting what PV_SHIM_EXCLUSIVE actually
implies, for example by adding CONFIG_DOMCTL_HYPERCALLL or
CONFIG_PLATFORM_HYPERCALL and re-work the pvshim_defconfig config file
based on those, so that we don't end up with negative relations.

Note sure all usages of PV_SHIM_EXCLUSIVE can be split in such a way,
maybe we would need some compromise.

Thanks, Roger.

