Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A13B3AB323E
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 10:51:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980999.1367390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOsm-0006qO-1L; Mon, 12 May 2025 08:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980999.1367390; Mon, 12 May 2025 08:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEOsl-0006ol-Tj; Mon, 12 May 2025 08:51:31 +0000
Received: by outflank-mailman (input) for mailman id 980999;
 Mon, 12 May 2025 08:51:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zSlO=X4=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1uEOsj-0006of-QW
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 08:51:29 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b2ed8bf-2f0e-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 10:51:28 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a0b6aa08e5so3203546f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 01:51:28 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3a1f57ddde0sm11948406f8f.14.2025.05.12.01.51.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 May 2025 01:51:27 -0700 (PDT)
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
X-Inumbo-ID: 4b2ed8bf-2f0e-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747039888; x=1747644688; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w+8VsMx1A6PALaLwxoqX9exAOB+OCjVIV9AcXHRBbsk=;
        b=MoUVrKQDx1sC+R1T18+hbvtWuwVi6aJDEwdiL89gyVNzOFJLeEc1X8EvrNSrhz/LAO
         EvSiYzvKLvlhafzXwQT8Dgth2jEGgsjdwd6pXc93/p/Qij+I3tvQr/xPahwGyWvHk1Dx
         rZBZ9iQgsOZX7A9b6+kl4My/2FO8WRY8tHy7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039888; x=1747644688;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w+8VsMx1A6PALaLwxoqX9exAOB+OCjVIV9AcXHRBbsk=;
        b=TxROqL5EqUbR+Nt1sMs8nJS/KmcPTnkugx9MUytAcoKwngm35pTZMZp6Pn7irRkrT0
         mC43+pjJuKnLXinb9DVp86r2aCeaA28Enw1bv4XEGFftB+nWCuHd26mXHQ1SvDA7vQ0u
         nVVfRnRFOnZyJrWlo3x6YzMvyVu9LAw/ADWhOEFJw3Lok6MnVz77fY4mvts09FL2rP70
         R13Wr6ctCfrEZHJ+xhFKDDt+CHc3Zl5sNPWxtCe8/gcCyt/zglwVPf5HHKAxHoI6novV
         HsVmnaq1e5rfSca41Nbto8I7DQX3SwykpNaANzmWPcRZ+0PqL4TQiENrprniQ+SzuKq+
         +sNw==
X-Forwarded-Encrypted: i=1; AJvYcCVzi0rvN5CBscSpO67kSXImjlbT9ZRKdhWLV7iQGEgueC+JJCo/wT/sBGXv3BHdESSjA7pllCzXP0o=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwogYN3+Okp3hA8TVZn4RjD8SeWDs+g13EMsxKGS0SpJ4kY9vBd
	EJEFwKwwQJn0gM54iDlk3RaXhwR/uWRW2sv/EvncYxpe/UJPMQRfdzbz3NLfpMY=
X-Gm-Gg: ASbGncvfVLfMj7y7zHyWqbvgzZdmi0tbpk9vvO2Yc6SDatI0hD9HMlLJ11LANlf1rVV
	qAw3qIYT/57IPoQl3NxbeYbHVFfaWamKXJTj+yHGmQPNn42ThnwKbiDRlpLRpRG1HevXtdl7IiW
	Loonn9oldtdu8AgwNXq+u61sCvyfLs6IQSq5DMgKRI/eNXqtex04DvnI4JHmjQTNZh9FuvJ3QSp
	3B++e4pZqey7yvZ07IGpZoDq/HvofTEzXZ9ZSSgbQUsL3DJbg6QvOl1PJJUgEskyYZxCsWrFWYq
	JYzDZBz7paSco4ntbPnY9SMV/lJhEJvn55/2+7oSr7B8ZmlO3C/iplvRoL6rbxQo+Yw=
X-Google-Smtp-Source: AGHT+IGduMx3R+abJ2DJo81rdfNiZyuT7A/Y5aChpgG8psm5aFomnhQNNJEehNSdhkau3DWplYEhHg==
X-Received: by 2002:a05:6000:2cd:b0:3a0:8020:8aed with SMTP id ffacd0b85a97d-3a1f6c9c3bbmr10213741f8f.21.1747039888051;
        Mon, 12 May 2025 01:51:28 -0700 (PDT)
Date: Mon, 12 May 2025 10:51:26 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com,
	agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
Message-ID: <aCG2jl2P1bA8dvXA@macbook.lan>
References: <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
 <aBiVkw2SXJHxpieh@mail-itl>
 <aBjLoM_ttxqftzlp@macbook.lan>
 <alpine.DEB.2.22.394.2505051100050.3879245@ubuntu-linux-20-04-desktop>
 <aBnOQyXSz-j33Wux@macbook.lan>
 <alpine.DEB.2.22.394.2505061658330.3879245@ubuntu-linux-20-04-desktop>
 <aBx1gv6BXhZ0pSYt@macbook.lan>
 <alpine.DEB.2.22.394.2505081617080.3879245@ubuntu-linux-20-04-desktop>
 <aB29o70zT_jUjdQv@macbook.lan>
 <alpine.DEB.2.22.394.2505091401330.3879245@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2505091401330.3879245@ubuntu-linux-20-04-desktop>

On Fri, May 09, 2025 at 02:10:03PM -0700, Stefano Stabellini wrote:
> On Fri, 9 May 2025, Roger Pau Monné wrote:
> > On Thu, May 08, 2025 at 04:25:28PM -0700, Stefano Stabellini wrote:
> > > On Thu, 8 May 2025, Roger Pau Monné wrote:
> > > > On Wed, May 07, 2025 at 04:02:11PM -0700, Stefano Stabellini wrote:
> > > > > On Tue, 6 May 2025, Roger Pau Monné wrote:
> > > > > > On Mon, May 05, 2025 at 11:11:10AM -0700, Stefano Stabellini wrote:
> > > > > > > In my opinion, we definitely need a solution like this patch for Dom0
> > > > > > > PVH to function correctly in all scenarios.
> > > > > > 
> > > > > > I'm not opposed to having such interface available for PVH hardware
> > > > > > domains.  I find it ugly, but I don't see much other way to deal with
> > > > > > those kind of "devices".  Xen mediating accesses for each one of them
> > > > > > is unlikely to be doable.
> > > > > > 
> > > > > > How do you hook this exchange interface into Linux to differentiate
> > > > > > which drivers need to use mfns when interacting with the hardware?
> > > > > 
> > > > > In the specific case we have at hands the driver is in Linux userspace
> > > > > and is specially-written for our use case. It is not generic, so we
> > > > > don't have this problem. But your question is valid.
> > > > 
> > > > Oh, so you then have some kind of ioctl interface that does the memory
> > > > exchange and bouncing inside of the kernel on behalf of the user-space
> > > > side I would think?
> > > 
> > > I am not sure... Xenia might know more than me here.
> > 
> > One further question I have regarding this approach: have you
> > considered just populating an empty p2m space with contiguous physical
> > memory instead of exchanging an existing area?  That would increase
> > dom0 memory usage, but would prevent super page shattering in the p2m.
> > You could use a dom0_mem=X,max:X+Y command line option, where Y
> > would be your extra room for swiotlb-xen bouncing usage.
> > 
> > XENMEM_increase_reservation documentation notes such hypercall already
> > returns the base MFN of the allocated page (see comment in
> > xen_memory_reservation struct declaration).
>  
> XENMEM_exchange is the way it has been implemented traditionally in
> Linux swiotlb-xen (it has been years). But your idea is good.
> 
> Another, more drastic, idea would be to attempt to map Dom0 PVH memory
> 1:1 at domain creation time like we do on ARM. If not all of it, as much
> as possible. That would resolve the problem very efficiently. We could
> communicate to Dom0 PVH the range that is 1:1 in one of the initial data
> structures, and that would be the end of it.

Yes, I wonder however whether attempting this would result in a
fair amount of page-shattering if we need to cater for pages in-use by
Xen that cannot be identity mapped.

Maybe a middle ground: on the Xen command line the admin specifies
the amount of contiguous identity mapped memory required, and Xen
attempts to allocate and identity map it on dom0 p2m?

It would be nice to signal such regions on the memory map itself.
Sadly I don't see a way to do it using the UEFI memory map format.
There's a "EFI_MEMORY_ISA_MASK" region in the attribute field, but I
don't think we can hijack this for Xen purposes.  There's also a 32bit
padding field in EFI_MEMORY_DESCRIPTOR after the type field, but using
that is possibly risky going forward?  I don't think UEFI can
repurpose that padding easily, but we might not want to bet on that.

We also have the need to signal which regions are safe to use as
foreign/grant mapping scratch space, so it would be good to use an
interface that can be expanded.  IOW: have a way to add extra Xen
specific attributes to memory regions.

Anyway, for the patch at hand: I see no reason to prevent
XENMEM_exchange usage. I think it's maybe not the best option because
of the super-page shattering consequences, but I assume you already
have a working solution based on this.

> > > > > In Linux, the issue is hidden behind drivers/xen/swiotlb-xen.c and
> > > > > xen_arch_need_swiotlb. There are a few options:
> > > > > - force swiotlb bounce for everything on the problematic SoC
> > > > > - edit xen_arch_need_swiotlb to return true for the problematic device
> > > > > - introduce a kernel command line option to specify which device
> > > > >   xen_arch_need_swiotlb should return true for
> > > > 
> > > > Isn't it a bit misleading to use the swiotlb for this purpose?  Won't
> > > > this usage of the swiotlb (to bounce from gfns to mfns) create issues
> > > > if there's any devices that have a DMA physical address limitation and
> > > > also needs to use the swiotlb while being behind the IOMMU?
> > > 
> > > When I wrote swiotlb, I meant swiotlb-xen (drivers/xen/swiotlb-xen.c).
> > > We have been using it exactly for this kind of address translations so
> > > far. It can also deal with cases where genuine bouncing needs to happen.
> > 
> > Oh, I see.  I've assumed you meant the generic Linux swiotlb.
> > 
> > So you have repurposed swiotlb-xen to be used on PVH for this purpose.
> > I think (currently?) swiotlb-xen is unconditionally disabled for
> > HVM/PVH guests?
> 
> Yes, I have repurposed swiotlb-xen for something similar this years ago
> on ARM. I was planning to do the same for PVH x86. Today, swiotlb-xen is
> used for ARM Dom0, which as you know is HVM/PVH from Linux point of view.

Sounds good, no objection from my side.

Regards, Roger.

