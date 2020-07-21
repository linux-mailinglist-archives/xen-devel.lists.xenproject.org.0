Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E532F2274B2
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 03:40:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxhG1-0008GU-In; Tue, 21 Jul 2020 01:39:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GVZ9=BA=kernel.org=robh@srs-us1.protection.inumbo.net>)
 id 1jxhG0-0008GP-9J
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 01:39:48 +0000
X-Inumbo-ID: 0f2c746e-caf3-11ea-84e1-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f2c746e-caf3-11ea-84e1-bc764e2007e4;
 Tue, 21 Jul 2020 01:39:47 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F3A5207DD
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 01:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595295586;
 bh=wkMDppvxheK7knOtfEWWPRMhnK8PPAk2YBD2HCxlKhE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UXFcC2U0nNAVpRFgRbwiPtHR7SJFnfEFkA0x9iHbezH7z/fRgb8G1++uj4z3/xppd
 ndGBAHpMe0ejLmoXngqwCPFk934z6h+1hvaIh263uoeP4nmH5zK5hJq5MZ7cHE/AlH
 MdMHU9zELyY5pqXmoGgtelAg3UQH+XyaNVnWKmiE=
Received: by mail-ot1-f52.google.com with SMTP id 72so13863760otc.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jul 2020 18:39:46 -0700 (PDT)
X-Gm-Message-State: AOAM533XAwMLbFsKnSYxsUMvMQfjw7FP+d0JdgY+wQ6lzMEKUIjykIK4
 NvtyLsYAc4KWMa85zo6lRGBqSboNzfvQ+qRizg==
X-Google-Smtp-Source: ABdhPJwO/WazbcSglxyFjKKKgr7bq/843UxR0OTgXJZQvEIli96lZjKbtPdj37XycEj9xB+L8MaIuxKQnZ2M3XK2RKc=
X-Received: by 2002:a9d:46c:: with SMTP id 99mr3123658otc.192.1595295585833;
 Mon, 20 Jul 2020 18:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <20200717111644.GS7191@Air-de-Roger>
 <3B8A1B9D-A101-4937-AC42-4F62BE7E677C@arm.com>
 <20200717143120.GT7191@Air-de-Roger>
 <8AF78FF1-C389-44D8-896B-B95C1A0560E2@arm.com>
 <alpine.DEB.2.21.2007201520370.32544@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2007201520370.32544@sstabellini-ThinkPad-T480s>
From: Rob Herring <robh@kernel.org>
Date: Mon, 20 Jul 2020 19:39:34 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKiaSNsKxqenVtgfk-_5=im73CHfEM3YqiVTFvRBbKsJA@mail.gmail.com>
Message-ID: <CAL_JsqKiaSNsKxqenVtgfk-_5=im73CHfEM3YqiVTFvRBbKsJA@mail.gmail.com>
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jul 20, 2020 at 5:24 PM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> + Rob Herring
>
> On Fri, 17 Jul 2020, Bertrand Marquis wrote:
> > >> Regarding the DT entry, this is not coming from us and this is already
> > >> defined this way in existing DTBs, we just reuse the existing entry.
> > >
> > > Is it possible to standardize the property and drop the linux prefix?
> >
> > Honestly i do not know. This was there in the DT examples we checked so
> > we planned to use that. But it might be possible to standardize this.
>
> We could certainly start a discussion about it. It looks like
> linux,pci-domain is used beyond purely the Linux kernel. I think that it
> is worth getting Rob's advice on this.
>
>
> Rob, for context we are trying to get Linux and Xen to agree on a
> numbering scheme to identify PCI host bridges correctly. We already have
> an existing hypercall from the old x86 days that passes a segment number
> to Xen as a parameter, see drivers/xen/pci.c:xen_add_device.
> (xen_add_device assumes that a Linux domain and a PCI segment are the
> same thing which I understand is not the case.)
>
>
> There is an existing device tree property called "linux,pci-domain"
> which would solve the problem (ignoring the difference in the definition
> of domain and segment) but it is clearly marked as a Linux-specific
> property. Is there anything more "standard" that we can use?
>
> I can find PCI domains being mentioned a few times in the Device Tree
> PCI specification but can't find any associated IDs, and I couldn't find
> segments at all.
>
> What's your take on this? In general, what's your suggestion on getting
> Xen and Linux (and other OSes which could be used as dom0 one day like
> Zephyr) to agree on a simple numbering scheme to identify PCI host
> bridges?
>
> Should we just use "linux,pci-domain" as-is because it is already the de
> facto standard? It looks like the property appears in both QEMU and
> UBoot already.

Sounds good to me. We could drop the 'linux' part, but based on other
places that has happened it just means we end up supporting both
strings forever.

Rob

