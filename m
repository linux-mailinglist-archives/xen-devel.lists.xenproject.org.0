Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F8A90A7A2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 09:46:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741877.1148550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ74X-0000Za-Jd; Mon, 17 Jun 2024 07:46:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741877.1148550; Mon, 17 Jun 2024 07:46:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ74X-0000X7-Gx; Mon, 17 Jun 2024 07:46:37 +0000
Received: by outflank-mailman (input) for mailman id 741877;
 Mon, 17 Jun 2024 07:46:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5eX2=NT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sJ74V-0000X0-Ox
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 07:46:35 +0000
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [2607:f8b0:4864:20::b32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7d2cedb-2c7d-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 09:46:34 +0200 (CEST)
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-dfde5ae0aaeso4206402276.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 00:46:34 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b2d21f0b56sm14986726d6.46.2024.06.17.00.46.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 00:46:32 -0700 (PDT)
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
X-Inumbo-ID: b7d2cedb-2c7d-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718610393; x=1719215193; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hxR5Q/aAsURbng3JCie17ZZs34XkIhMPgViBzaUo2nE=;
        b=LxKcqopwKUEHV+x43yeBMjtamGHIJk4n56VX9RJFcOyS9TjIJjJ8Rln8IxG+1TR0Cg
         //V93ckH1dCWhGFaxjcwCvYrHO9ynDjTZAvG1r+wAyqx5zJoSu9b1T8oqW79OiF7ljdd
         PZE4YP5GG5IPvYEz6TGbDWIUXVFevKnDWb9SE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718610393; x=1719215193;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hxR5Q/aAsURbng3JCie17ZZs34XkIhMPgViBzaUo2nE=;
        b=dksqoZZBK4KYYZdmfyZdpJ+YLka7437iFAd/7asi16iUG7IQ5IXL/NqYOIVuqATnEI
         0CVv8Zs8zm/7EutK5wfKc9y0ssil6bQbAp/rSitxcEfjOLxhC/OwnrLkaJYEN6ikLYJI
         yHiW3Rml2BQgJ0hqi3T3yWX3JLHaK+jjX3SgskSnfJJ5x3rwObkJbzsUKun9kZufnzKP
         GS/Yi13Doifx7TqGSTshlFtNVezlOQFjjbEqN0f0XCEE1Apzoo1HAYOQjr8TjRJr7Emu
         FSmW7aBroWyyrkOeaWLogyLB2TJ+zlmUlWJ169IFZqIj1poP4dyGko7HuFzeQsZU2tDN
         Hg9w==
X-Forwarded-Encrypted: i=1; AJvYcCV77AiQ2u/DYVLgJUaPOW0vaIDIiDdA58rnxrPt/M3KerSO/A0G4bwCpczu5gDhWbteDauIlRiquGUoM+KU2ZbrEGbfzmuBc+5h+MJN1s0=
X-Gm-Message-State: AOJu0Yww5rBQT28XV3Q5LSNGc35Q+DFCTPjfl63STirjkrMIuHKNRYIA
	c3voajaS1VyadT07yXR/F/81dNYll5lFaV0grEZlywNrA+5zpbId3VDAXQ/RiKk=
X-Google-Smtp-Source: AGHT+IH67by9M8/qsH8Fh5/VKPd8wzAE03X+Kkx644weipILcFFSTwYhcvoMoypbKMPBP7V1s3Bx5g==
X-Received: by 2002:a25:ab87:0:b0:dfb:42d:bb32 with SMTP id 3f1490d57ef6-dff153ca962mr8554670276.30.1718610393259;
        Mon, 17 Jun 2024 00:46:33 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:46:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ray Huang <ray.huang@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Design session notes: GPU acceleration in Xen
Message-ID: <Zm_p1QvoZcjQ4gBa@macbook>
References: <Zms9tjtg06kKtI_8@itl-email>
 <440d6444-3b02-4756-a4fa-02aae3b24b14@suse.com>
 <ZmvvlF0gpqFB7UC9@macbook>
 <af1f966b-b28f-4a14-b932-3f1523adeff0@suse.com>
 <ZmwByZnn5vKcVLKI@macbook>
 <Zm-FidjSK3mOieSC@itl-email>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zm-FidjSK3mOieSC@itl-email>

On Sun, Jun 16, 2024 at 08:38:19PM -0400, Demi Marie Obenour wrote:
> On Fri, Jun 14, 2024 at 10:39:37AM +0200, Roger Pau Monné wrote:
> > On Fri, Jun 14, 2024 at 10:12:40AM +0200, Jan Beulich wrote:
> > > On 14.06.2024 09:21, Roger Pau Monné wrote:
> > > > On Fri, Jun 14, 2024 at 08:38:51AM +0200, Jan Beulich wrote:
> > > >> On 13.06.2024 20:43, Demi Marie Obenour wrote:
> > > >>> GPU acceleration requires that pageable host memory be able to be mapped
> > > >>> into a guest.
> > > >>
> > > >> I'm sure it was explained in the session, which sadly I couldn't attend.
> > > >> I've been asking Ray and Xenia the same before, but I'm afraid it still
> > > >> hasn't become clear to me why this is a _requirement_. After all that's
> > > >> against what we're doing elsewhere (i.e. so far it has always been
> > > >> guest memory that's mapped in the host). I can appreciate that it might
> > > >> be more difficult to implement, but avoiding to violate this fundamental
> > > >> (kind of) rule might be worth the price (and would avoid other
> > > >> complexities, of which there may be lurking more than what you enumerate
> > > >> below).
> > > > 
> > > > My limited understanding (please someone correct me if wrong) is that
> > > > the GPU buffer (or context I think it's also called?) is always
> > > > allocated from dom0 (the owner of the GPU).  The underling memory
> > > > addresses of such buffer needs to be mapped into the guest.  The
> > > > buffer backing memory might be GPU MMIO from the device BAR(s) or
> > > > system RAM, and such buffer can be paged by the dom0 kernel at any
> > > > time (iow: changing the backing memory from MMIO to RAM or vice
> > > > versa).  Also, the buffer must be contiguous in physical address
> > > > space.
> > > 
> > > This last one in particular would of course be a severe restriction.
> > > Yet: There's an IOMMU involved, isn't there?
> > 
> > Yup, IIRC that's why Ray said it was much more easier for them to
> > support VirtIO GPUs from a PVH dom0 rather than classic PV one.
> > 
> > It might be easier to implement from a classic PV dom0 if there's
> > pv-iommu support, so that dom0 can create it's own contiguous memory
> > buffers from the device PoV.
> 
> What makes PVH an improvement here?  I thought PV dom0 uses an identity
> mapping for the IOMMU, while a PVH dom0 uses an IOMMU that mirrors the
> dom0 second-stage page tables.

Indeed, hence finding a physically contiguous buffer on classic PV is
way more complicated, because the IOMMU identity maps mfns, and the PV
address space can be completely scattered.

OTOH, on PVH the IOMMU page tables are the same as the second stage
translation, and hence the physical address is way more compact (as it
would be on native).

> In both cases, the device physical
> addresses are identical to dom0’s physical addresses.

Yes, but a PV dom0 physical address space can be very scattered.

IIRC there's an hypercall to request physically contiguous memory for
PV, but you don't want to be using that every time you allocate a
buffer (not sure it would support the sizes needed by the GPU
anyway).

> PV is terrible for many reasons, so I’m okay with focusing on PVH dom0,
> but I’d like to know why there is a difference.
> 
> > > > I'm not sure it's possible to ensure that when using system RAM such
> > > > memory comes from the guest rather than the host, as it would likely
> > > > require some very intrusive hooks into the kernel logic, and
> > > > negotiation with the guest to allocate the requested amount of
> > > > memory and hand it over to dom0.  If the maximum size of the buffer is
> > > > known in advance maybe dom0 can negotiate with the guest to allocate
> > > > such a region and grant it access to dom0 at driver attachment time.
> > > 
> > > Besides the thought of transiently converting RAM to kind-of-MMIO, this
> > 
> > As a note here, changing the type to MMIO would likely involve
> > modifying the EPT/NPT tables to propagate the new type.  On a PVH dom0
> > this would likely involve shattering superpages in order to set the
> > correct memory types.
> > 
> > Depending on how often and how random those system RAM changes are
> > necessary this could also create contention on the p2m lock.
> > 
> > > makes me think of another possible option: Could Dom0 transfer ownership
> > > of the RAM that wants mapping in the guest (remotely resembling
> > > grant-transfer)? Would require the guest to have ballooned down enough
> > > first, of course. (In both cases it would certainly need working out how
> > > the conversion / transfer back could be made work safely and reasonably
> > > cleanly.)
> > 
> > Maybe.  The fact the guest needs to balloon down that amount of memory
> > seems weird to me, as from the guest PoV that mapped memory is
> > MMIO-like and not system RAM.
> 
> I don’t like it either.  Furthermore, this would require changes to the
> virtio-GPU driver in the guest, which I’d prefer to avoid.

IMO it would be helpful if you (or someone) could write the full
specification of how VirtIO GPU is supposed to work right now (with
the KVM model I assume?) as it would be a good starting point to
provide suggestions about how to make it work (or adapt it) on Xen.

I don't think the high level layers on top of VirtIO GPU are relevant,
but it's important to understand the protocol between the VirtIO GPU
front and back ends.

So far I only had scattered conversation about what's needed, but not
a formal write-up of how this is supposed to work.

Thanks, Roger.

