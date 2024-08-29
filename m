Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0B8964A5B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 17:43:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785987.1195550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjhIS-0003l1-0p; Thu, 29 Aug 2024 15:42:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785987.1195550; Thu, 29 Aug 2024 15:42:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjhIR-0003iu-UJ; Thu, 29 Aug 2024 15:42:51 +0000
Received: by outflank-mailman (input) for mailman id 785987;
 Thu, 29 Aug 2024 15:42:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h9f7=P4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sjhIQ-0003il-DT
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 15:42:50 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5755d43d-661d-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 17:42:47 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso945868a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Aug 2024 08:42:47 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891dacb2sm91900966b.183.2024.08.29.08.42.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2024 08:42:46 -0700 (PDT)
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
X-Inumbo-ID: 5755d43d-661d-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724946167; x=1725550967; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vp0CN+UaeHV6/vmMmS1h1axhAIZtHxlFP3D4D1tJGIE=;
        b=cZFylR+Lbulf/dpS07YkkCtvaxTm37ONSJvyuW2ucreXDPKvybkkh9jGB1NF2VkvYm
         xrofw1H/du7OfVEHb4B+g2mW8LUNJswx2kZkdwDz9CLCetvekDYBkbkHo03plvjg4ocj
         zy4l83Oz45ylr2w67HBPk1W1rOOvqLvkD/zR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946167; x=1725550967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vp0CN+UaeHV6/vmMmS1h1axhAIZtHxlFP3D4D1tJGIE=;
        b=awVNYhzDFAKnLRBf7W6CdxiEzCBi0cybxm4mYdQBRhKwwLDho+8d6GxhAAijtFj0ah
         RHfy8VwF5ZLvkWie2o8GEtyK0KV1KC9Svj3M/89W2Rx5FA2kw2ocroHI9eyM4bpcPapQ
         mqEqouRr6XVlwQ/eN3OkhJRgSWifQob/l4PAHXQXLYf/Fw9HEX/8Yl/e5QhMFOa+rcn9
         kR6ezTJLR8TstIY3kwejukXG5OLTdDZahih5JreBz03oTeMAEv0ePowg6FPaHevqhnLF
         lNLd6rKa1xQ9I3tiSltq7x+TKRgWZViSUzs9EfVB/kQu+ADDFFp36u6loDOraD0rjcsZ
         0CyQ==
X-Gm-Message-State: AOJu0YyBfj4xFyFzFaRErzSgzy+PAOhKBKDXlr8AB9SK+gguUUELjgxT
	rGecazzPtpqT2wO2U0vkUFBl6zO9+vbDZ/fZhO1ZmxJin87NzPLkaAA0CgPnaog=
X-Google-Smtp-Source: AGHT+IHfDzLInsL/iga3oMevKCws/DrvNkMQoP9KqrnPBZixMErkhL9kHWDhH4kOWjSw4o0To0wsHg==
X-Received: by 2002:a05:6402:90b:b0:5be:fbe7:11ac with SMTP id 4fb4d7f45d1cf-5c21ed54d3cmr3485727a12.20.1724946166714;
        Thu, 29 Aug 2024 08:42:46 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:42:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
	Owen Smith <owen.smith@cloud.com>, Mark Syms <mark.syms@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: Block protocol incompatibilities with 4K logical sector size
 disks
Message-ID: <ZtCW9Qq9k8UQ-jJC@macbook.local>
References: <ZtBUnzH4sIrFAo0f@macbook.local>
 <ZtB0fMRCGajdcfap@l14>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtB0fMRCGajdcfap@l14>

On Thu, Aug 29, 2024 at 01:15:42PM +0000, Anthony PERARD wrote:
> On Thu, Aug 29, 2024 at 12:59:43PM +0200, Roger Pau Monné wrote:
> > Hello,
> >
> > To give some context, this started as a bug report against FreeBSD failing to
> > work with PV blkif attached disks with 4K logical sectors when the backend is
> > Linux kernel blkback:
> >
> > https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=280884
> >
> > Further investigation has lead me to discover that the protocol described in
> > the public blkif.h header is not implemented uniformly, and there are major
> > inconsistencies between implementations regarding the meaning of the `sectors`
> > and `sector-size` xenstore nodes, and the sector_number and {first,last}_sect
> > struct request fields.  Below is a summary of the findings on the
> > implementation I've analyzed.
> >
> > Linux blk{front,back} always assumes the `sectors` xenstore node to be in 512b
> > units, regardless of the value of the `sector-size` node.  Equally the ring
> > request sector_number and the segments {first,last}_sect fields are always
> > assumed to be in units of 512b regardless of the value of `sector-size`.  The
> > `feature-large-sector-size` node is neither exposed by blkfront, neither
> > checked by blkback before exposing a `sector-size` node different than 512b.
> >
> > FreeBSD blk{front,back} calculates (and for blkback exposes) the disk size as
> > `sectors` * `sector-size` based on the values in the xenstore nodes (as
> > described in blkif.h).  The ring sector_number is filled with the sector number
> > based on the `sector-size` value, however the {first,last}_sect fields are
> > always calculated as 512b units.   The `feature-large-sector-size` node is
> > neither exposed by blkfront, neither checked by blkback before exposing a
> > `sector-size` node different than 512b.
> >
> > QEMU qdisk blkback implementation exposes the `sectors` disk size in units of
> > `sector-size` (as FreeBSD blkback).  The ring structure fields sector_number
> > and {first,last}_sect are assumed to be in units of `sector-size`.  This
> > implementation will not expose a `sector-size` node with a value different than
> > 512 unless the frontend xenstore path has the `feature-large-sector-size` node
> > present.
> >
> > Windows blkfront calculates the disk size as `sectors` * `sector-size` from the
> > xenstore nodes exposed by blkback.   The ring structure fields sector_number
> > and {first,last}_sect are assumed to be in units of `sector-size`.  This
> > frontend implementation exposes `feature-large-sector-size`.
> >
> > When using a disk with a logical sector size different than 512b, Linux is only
> > compatible with itself, same for FreeBSD.  QEMU blkback implementation is also
> > only compatible with the Windows blkfront implementation.  The
> > `feature-large-sector-size` seems to only be implemented for the QEMU/Windows
> > combination, both Linux and FreeBSD don't implement any support for it neither
> > in the backend or the frontend.
> >
> > The following table attempts to summarize in which units the following fields
> > are defined for the analyzed implementations (please correct me if I got some
> > of this wrong):
> >
> >                         │ sectors xenbus node │ requests sector_number │ requests {first,last}_sect
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > FreeBSD blk{front,back} │     sector-size     │      sector-size       │           512
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > Linux blk{front,back}   │         512         │          512           │           512
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > QEMU blkback            │     sector-size     │      sector-size       │       sector-size
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > Windows blkfront        │     sector-size     │      sector-size       │       sector-size
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > MiniOS                  │     sector-size     │          512           │           512
> > ────────────────────────┼─────────────────────┼────────────────────────┼───────────────────────────
> > tapdisk blkback         │         512         │      sector-size       │           512
> 
> There's OVMF as well, which copied MiniOS's implementation, and looks
> like it's still the same as MiniOS for the table above:
> 
> OVMF (base on MiniOS)   │     sector-size     │          512           │           512
> 
> >
> > It's all a mess, I'm surprised we didn't get more reports about brokenness when
> > using disks with 4K logical sectors.
> >
> > Overall I think the in-kernel backends are more difficult to update (as it
> > might require a kernel rebuild), compared to QEMU or blktap.  Hence my slight
> > preference would be to adjust the public interface to match the behavior of
> > Linux blkback, and then adjust the implementation in the rest of the backends
> > and frontends.
> 
> I would add that making "sector-size" been different from 512 illegal
> makes going forward easier, has every implementation will work with a
> "sector-size" of 512, and it probably going to be the most common sector
> size for a while longer.

My main concern is the amount of backends out there that already
expose a "sector-size" different than 512.  I fear any changes here
will take time to propagate to in-kernel backends, and hence my
approach was to avoid modifying Linux blkback, because (as seen in the
FreeBSD bug report) there are already instances of 4K logical sector
disks being used by users.  Modifying the frontends is likely easier,
as that's under the owner of the VM control.

> > There was an attempt in 2019 to introduce a new frontend feature flag to signal
> > whether the frontend supported `sector-size` xenstore nodes different than 512 [0].
> > However that was only ever implemented for QEMU blkback and Windows blkfront,
> > all the other backends will expose `sector-size` different than 512 without
> > checking if `feature-large-sector-size` is exposed by the frontend.  I'm afraid
> > it's now too late to retrofit that feature into existing backends, seeing as
> > they already expose `sector-size` nodes greater than 512 without checking if
> > `feature-large-sector-size` is reported by the frontend.
> 
> Much before that, "physical-sector-size" was introduced (2013):
>     https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=a67e2dac9f8339681b30b0f89274a64e691ea139
> 
> Linux seems to implement it, but QEMU or OVMF don't have it.

Yeah, I was aware of this, normal disks already have a physical sector
size (optimal sector size) and a logical sector size (minimal size
supported by the drive).  Some implement a smaller logical than
physical sector size by doing read-modify-write.

> > My proposal would be to adjust the public interface with:
> >
> >  * Disk size is calculated as: `sectors` * 512 (`sectors` being the contents of
> >    such xenstore backend node).
> >
> >  * All the sector related fields in blkif ring requests use a 512b base sector
> >    size, regardless of the value in the `sector-size` xenstore node.
> >
> >  * The `sector-size` contains the disk logical sector size.  The frontend must
> >    ensure that all request segments addresses are aligned and it's length is
> >    a multiple of such size.  Otherwise the backend will refuse to process the
> >    request.
> 
> You still want to try to have a "sector-size" different from 512? To me
> this just add confusion to the confusion. There would be no way fro
> backend or frontend to know if setting something other than 512 is going
> to work.

But that's already the case, most (all?) backends except QEMU will set
"sector-size" to the underlying block storage logical sector size
without any way to tell if the frontend supports sector-sizes != 512.
So the issue is not inherently with the setting of the "sector-size"
node to a value different than 512, but rather how different
implementations have diverged regarding which is the base unit of
other fields.

> Also, it is probably easier to update backend than frontend, so
> it is just likely that something is going to lag behind and broke.

Hm, I'm not convinced, sometimes the owner of a VM has no control over
the version of the backends if it's not the admin of the host.  OTOH
the owner of a VM could always update the kernel in order to
workaround such blkfront/blkback incompatibility issues.  Hence my
preference was for solutions that didn't involve changing Linux
blkback, as I believe that's the most commonly used backend.

> Why not make use of the node "physical-sector-size" that have existed
> for 10 years, even if unused or unadvertised, and if an IO request isn't
> aligned on it, it is just going to be slow (as backend would have to
> read,update,write instead of just write sectors).

I don't really fancy implementing read-modify-write on the backends,
as it's going to add more complexity to blkback implementations,
specially the in-kernel ones I would assume.

All frontends I've looked into support "sector-size" != 512, but
there's a lack of uniformity on whether other units used in the
protocol are based on the blkback exposed "sector-size", or hardcoded
to 512.

So your suggestion would be to hardcode "sector-size" to 512 and use
the "physical-sector-size" node value to set the block device logical
sector size the frontends?

If we go that route I would suggest that backends are free to refuse
requests that aren't a multiple of "physical-sector-size".

Thanks, Roger.

