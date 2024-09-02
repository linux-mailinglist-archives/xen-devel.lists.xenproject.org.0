Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B34EB96827A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 10:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787662.1197100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2qa-0005r4-NA; Mon, 02 Sep 2024 08:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787662.1197100; Mon, 02 Sep 2024 08:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl2qa-0005od-Il; Mon, 02 Sep 2024 08:55:40 +0000
Received: by outflank-mailman (input) for mailman id 787662;
 Mon, 02 Sep 2024 08:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E/cM=QA=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sl2qY-0005oW-Uq
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 08:55:39 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ed2fca1-6909-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 10:55:36 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5c23f0a9699so1903358a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 01:55:36 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c226c6a36fsm4941489a12.16.2024.09.02.01.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 01:55:35 -0700 (PDT)
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
X-Inumbo-ID: 1ed2fca1-6909-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725267336; x=1725872136; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKBhrDrtG2r12NoxMwu7DMvaCFosVbbND3GhrYxCNX8=;
        b=aYFwaTm7LgjxcH2SHrw2M+pH2TzJh3cYjtBFndRI7XEcncboA3/eRvMhmitymzpz8C
         KgVh1o8EkDrPruErzin5M2Eswe6hxLeXy5PN0btfsLM1CIFQla0DEeJo2KEs/CfoULbU
         N2dIk7czH8KyJWh2r87cpM4EVtACjtgKgG4zQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725267336; x=1725872136;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKBhrDrtG2r12NoxMwu7DMvaCFosVbbND3GhrYxCNX8=;
        b=q+bSVzhSl3BQXHP8QufhmV7P8EQOtpF1koVlIhkrqHmwq6sBWnLj0jsFsPYoiFwL0a
         IemjKtKyXVeU7jwGA39WvIHWl8eu0jl4CRYI/a5KrcgWucvmpyyZ+9IahFVppOaIdIWd
         I9QqBWKJTauo2hET+BeRAUnehqA1VGhSpOUUK7d0yiQgmrAO/c4u4OBdeniYPAZ+zav5
         70FSS4erGKQQPnd5SCUJRfqJs1G3QF2FsFIYsO6RO7jAxuiEqHtL+eFtLKDmR6wDSPjc
         eucKB7hYmheh6qi+fsGrrUaY4wlUBYSJkpVbob9FIxIF3UsYPaygJADUJ1JKG/m0HAd8
         wjYw==
X-Gm-Message-State: AOJu0YzFNbmSTHahzoaddx44swohDsBtdj2/ImmcRkuT14VllwgRIeeq
	zGRY7wdoMYYXSOrImEJoiLfTb+nQ0AZd3xorjwEVCoRNkpdC+kt+Yvx3HVhOfuE=
X-Google-Smtp-Source: AGHT+IHUc89HYaYgKz2sAL8ApQcmwf9BvEIqAJkC+acdKkza4t/mFXRTCLtaLa38MK2GIfWOvufMlw==
X-Received: by 2002:a05:6402:1e8c:b0:5c2:4dcc:b937 with SMTP id 4fb4d7f45d1cf-5c24dccbb4amr3116009a12.24.1725267335610;
        Mon, 02 Sep 2024 01:55:35 -0700 (PDT)
Date: Mon, 2 Sep 2024 10:55:34 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Block protocol incompatibilities with 4K logical sector size
 disks
Message-ID: <ZtV9hteu_sVyvnih@macbook.local>
References: <ZtBUnzH4sIrFAo0f@macbook.local>
 <ZtB0fMRCGajdcfap@l14>
 <ZtCW9Qq9k8UQ-jJC@macbook.local>
 <ZtHus/ytlA1UnHEI@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtHus/ytlA1UnHEI@l14>

On Fri, Aug 30, 2024 at 04:09:25PM +0000, Anthony PERARD wrote:
> On Thu, Aug 29, 2024 at 05:42:45PM +0200, Roger Pau Monné wrote:
> > On Thu, Aug 29, 2024 at 01:15:42PM +0000, Anthony PERARD wrote:
> > > On Thu, Aug 29, 2024 at 12:59:43PM +0200, Roger Pau Monné wrote:
> > > > The following table attempts to summarize in which units the following fields
> > > > are defined for the analyzed implementations (please correct me if I got some
> > > > of this wrong):
> > > >
> > > >                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
> > > > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > > > FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
> > > > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > > > Linux blk{front,back}   │         512         │          512           │           512
> > > > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > > > QEMU blkback            │     sector-size     │      sector-size       │       sector-size
> > > > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > > > Windows blkfront        │     sector-size     │      sector-size       │       sector-size
> > > > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > > > MiniOS                  │     sector-size     │          512           │           512
> > > > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > > > tapdisk blkback         │         512         │      sector-size       │           512
> 
> Tapdisk situation seems more like:
> 
>      tapdisk blkback         │      ??????????     │      ???????????       │         ?????
> 
> I've looks at the implementation at xapi-project/blktat[1] and the way
> sector_number or {first,last}_sect seems to be used varied on which
> backend is used (block-vhd, block-nbd, block-aio).
> 
> [1] https://github.com/xapi-project/blktap
> 
> block-vhd seems mostly sectors of 512 but recalculated with "s->spb"
> (sector per block?) but still, sector seems to be only 512.
> 
> block-nbd seems to set "sector-size" to always 512, but uses
> "sector-size" for sector_number and {first,last}_sect.
> 
> The weirdest one is block-aio, where on read it multiply sector_number
> and {first,last}_sect by 512, but on write, those are multiplied by
> "sector-size". With "sector-size" set by ioctl(BLKSSZGET)
> 
> At least, is seems "sectors" is a multiple of 512 on all those, like in
> the table, but I've only look at those 3 "drivers".

You looked more than myself, I've just looked at the block-aio write
path I think, and I was happy enough to see it was yet different from
the other implementations.

I think it's clear enough that every implementation has slight
differences, and I don't plan to fix all of them.

> 
> > > There's OVMF as well, which copied MiniOS's implementation, and looks
> > > like it's still the same as MiniOS for the table above:
> > >
> > > OVMF (base on MiniOS)   │     sector-size     │          512           │           512
> > >
> > > >
> > > > It's all a mess, I'm surprised we didn't get more reports about brokenness when
> > > > using disks with 4K logical sectors.
> > > >
> > > > Overall I think the in-kernel backends are more difficult to update (as it
> > > > might require a kernel rebuild), compared to QEMU or blktap.  Hence my slight
> > > > preference would be to adjust the public interface to match the behavior of
> > > > Linux blkback, and then adjust the implementation in the rest of the backends
> > > > and frontends.
> > >
> > > I would add that making "sector-size" been different from 512 illegal
> > > makes going forward easier, has every implementation will work with a
> > > "sector-size" of 512, and it probably going to be the most common sector
> > > size for a while longer.
> >
> > My main concern is the amount of backends out there that already
> > expose a "sector-size" different than 512.  I fear any changes here
> > will take time to propagate to in-kernel backends, and hence my
> > approach was to avoid modifying Linux blkback, because (as seen in the
> > FreeBSD bug report) there are already instances of 4K logical sector
> > disks being used by users.  Modifying the frontends is likely easier,
> > as that's under the owner of the VM control.
> >
> > > > There was an attempt in 2019 to introduce a new frontend feature flag to signal
> > > > whether the frontend supported `sector-size` xenstore nodes different than 512 [0].
> > > > However that was only ever implemented for QEMU blkback and Windows blkfront,
> > > > all the other backends will expose `sector-size` different than 512 without
> > > > checking if `feature-large-sector-size` is exposed by the frontend.  I'm afraid
> > > > it's now too late to retrofit that feature into existing backends, seeing as
> > > > they already expose `sector-size` nodes greater than 512 without checking if
> > > > `feature-large-sector-size` is reported by the frontend.
> > >
> > > Much before that, "physical-sector-size" was introduced (2013):
> > >     https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=a67e2dac9f8339681b30b0f89274a64e691ea139
> > >
> > > Linux seems to implement it, but QEMU or OVMF don't have it.
> >
> > Yeah, I was aware of this, normal disks already have a physical sector
> > size (optimal sector size) and a logical sector size (minimal size
> > supported by the drive).  Some implement a smaller logical than
> > physical sector size by doing read-modify-write.
> >
> > > > My proposal would be to adjust the public interface with:
> > > >
> > > >  * Disk size is calculated as: `sectors` * 512 (`sectors` being the contents of
> > > >    such xenstore backend node).
> > > >
> > > >  * All the sector related fields in blkif ring requests use a 512b base sector
> > > >    size, regardless of the value in the `sector-size` xenstore node.
> > > >
> > > >  * The `sector-size` contains the disk logical sector size.  The frontend must
> > > >    ensure that all request segments addresses are aligned and it's length is
> > > >    a multiple of such size.  Otherwise the backend will refuse to process the
> > > >    request.
> > >
> > > You still want to try to have a "sector-size" different from 512? To me
> > > this just add confusion to the confusion. There would be no way fro
> > > backend or frontend to know if setting something other than 512 is going
> > > to work.
> >
> > But that's already the case, most (all?) backends except QEMU will set
> > "sector-size" to the underlying block storage logical sector size
> 
> QEMU, only if feature-large-sector-size is set, indeed, otherwise it
> just return an error if it have to set "sector-size" to a value
> different from 512.
> 
> Otherwise, yes for Linux, FreeBSD, and maybe yes for blktap. For blktap
> it seems to depend of the storage, more or less:
>     - block-vhd: always "sector-size" = 512
>     - block-nbd: always "sector-size" = 512
>     - block-aio: physical storage sector size
> 
> > without any way to tell if the frontend supports sector-sizes != 512.
> > So the issue is not inherently with the setting of the "sector-size"
> > node to a value different than 512, but rather how different
> > implementations have diverged regarding which is the base unit of
> > other fields.
> >
> > > Also, it is probably easier to update backend than frontend, so
> > > it is just likely that something is going to lag behind and broke.
> >
> > Hm, I'm not convinced, sometimes the owner of a VM has no control over
> > the version of the backends if it's not the admin of the host.  OTOH
> > the owner of a VM could always update the kernel in order to
> > workaround such blkfront/blkback incompatibility issues.  Hence my
> > preference was for solutions that didn't involve changing Linux
> > blkback, as I believe that's the most commonly used backend.
> 
> Going the Linux way might be the least bad option indeed. sectors in
> requests has been described as a 512-bytes for a long while. It's only
> "sectors" that have been described as "sector-size"-bytes size.
> 
> > > Why not make use of the node "physical-sector-size" that have existed
> > > for 10 years, even if unused or unadvertised, and if an IO request isn't
> > > aligned on it, it is just going to be slow (as backend would have to
> > > read,update,write instead of just write sectors).
> >
> > I don't really fancy implementing read-modify-write on the backends,
> > as it's going to add more complexity to blkback implementations,
> > specially the in-kernel ones I would assume.
> >
> > All frontends I've looked into support "sector-size" != 512, but
> > there's a lack of uniformity on whether other units used in the
> > protocol are based on the blkback exposed "sector-size", or hardcoded
> > to 512.
> >
> > So your suggestion would be to hardcode "sector-size" to 512 and use
> > the "physical-sector-size" node value to set the block device logical
> > sector size the frontends?
> >
> > If we go that route I would suggest that backends are free to refuse
> > requests that aren't a multiple of "physical-sector-size".
> 
> After looking in more detail in the different implementations, and linux
> one, I don't think changing "physical-sector-size" meaning is going to
> be helpful.
> 
> What to do about "feature-large-sector-size"? Should backend refuse to
> connect to the front end if that flag is set and "sector-size" want to
> be different than 512? This would just be Windows frontend I guess.
> (Just as an helper for updated backend)

I think it's likely too late to mandate exposing
"feature-large-sector-size" in the frontends, as for example Linux
blkfront will handle "sector-size" != 512, yet it doesn't expose
"feature-large-sector-size".  If we retroactively push this change to
the backends we might break setups that were working fine
previously.

> 
> So yes, after more research, having sector in the protocol been a
> 512-byte size seems the least bad option. "sector_number" and
> "{first,last}_sect" have been described as is for a long while. Only
> "sectors" for the size has been described as a "sector-size" quantity.

Thanks for your input.  I would also like to hear from the blktap and
Windows PV drivers maintainers, as the change that I'm proposing here
will require changes to their implementations.

Thanks, Roger.

