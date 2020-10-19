Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105AC292A5A
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 17:26:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8748.23488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUX3Q-00087Y-Kx; Mon, 19 Oct 2020 15:26:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8748.23488; Mon, 19 Oct 2020 15:26:32 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUX3Q-000879-He; Mon, 19 Oct 2020 15:26:32 +0000
Received: by outflank-mailman (input) for mailman id 8748;
 Mon, 19 Oct 2020 15:26:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=85l8=D2=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1kUX3O-00086w-GZ
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:26:30 +0000
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ad5d1bca-7b4c-4780-9406-2c7a76caf4f5;
 Mon, 19 Oct 2020 15:26:29 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j30so14680432lfp.4
 for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 08:26:29 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=85l8=D2=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
	id 1kUX3O-00086w-GZ
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 15:26:30 +0000
X-Inumbo-ID: ad5d1bca-7b4c-4780-9406-2c7a76caf4f5
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ad5d1bca-7b4c-4780-9406-2c7a76caf4f5;
	Mon, 19 Oct 2020 15:26:29 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id j30so14680432lfp.4
        for <xen-devel@lists.xenproject.org>; Mon, 19 Oct 2020 08:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QIs+2ZoR3i3pz+qqVrJep3R4w4Yivn+en8MAoLnkTA0=;
        b=gk7Ft9DBlookh7ly0b+NVSlnGjwjtOCnh4QX5qp7SRNMTgWA0DEx08n3OTaPzoPw+g
         HO2TS3iMeO6k+yx5cFX1SpvtlbI8QFgz1TmkVGsd1Q/eN1XsFAM7nj3I+jj2IGbuPEHl
         Q90SiRzFK8dMY1xCTc7FHDjXij+zLgKc1rsXBgTEkb9VtOxHBxHhDZK2LBQ9Ex6cH2by
         EmaUGcqTA1qKF36KpKMGq5yAKbmzm8jnbB7QQU6snjCjE3tXGJWSFX4jpBMvwjmqAiYa
         oy5avgoqbt5CqZ1dNpTBKMyEzS3sijy++DH/9yNcN/3jyIDfcWEU6A8RxIAfBSEKm8o1
         uPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QIs+2ZoR3i3pz+qqVrJep3R4w4Yivn+en8MAoLnkTA0=;
        b=j+303N7Lixa6KuxgSOvJVJQacTf54rMIw5puW3sQX/8hFopMxsv8/JpE4mhwYjv2T5
         EgtwObZGSWPtMKbb7n7c0IkXU+eFwr+Oz4IgSZ/HeL7gnsX4+LetuaO979I2rSfZuci3
         5gZvUDxGNfq5hETX+YCGV7gLxv5bCBC+NZN8vDJnfDWTVf0/bpkNfokO8ooW4tc+6Sl+
         5GsBPsVZClb6INThwvNAXKnTgj/5fyRIQDC+d10lcuAMqbHNN6pJeFkUm4zh7xHF0XZ5
         05udjyYVzZd26SZlyT9F9kVgDEvB7nPDF0elkO7jVWykbaj29ftSIf7m3Kzl0peh3cAY
         +dsw==
X-Gm-Message-State: AOAM533D2HWcuxmmc3isBQdmuJ+mGlbaeUhWASyq2vP7aVg21e3CGYDt
	33C5nOmAO8zrMY48K26QuLDibw8VS+0hMlIvA2A=
X-Google-Smtp-Source: ABdhPJx4eyRaCUZG26uK8S97QMfZRuh+9xPt2obMCSmXVopsTcfufsRxM6589WGoDdlq0bwkiXbMZerHBanKIBTlaXc=
X-Received: by 2002:ac2:52b7:: with SMTP id r23mr78904lfm.30.1603121188232;
 Mon, 19 Oct 2020 08:26:28 -0700 (PDT)
MIME-Version: 1.0
References: <20201014153150.83875-1-jandryuk@gmail.com> <6d373cae-c7dc-e109-1df3-ccbbe4bdd9c8@suse.com>
 <CAKf6xpv5GNjw0pjOxEqdVj2+C6v+O5PDZG5yYkNfytDjUT_r5w@mail.gmail.com>
 <4229544b-e98d-6f3c-14aa-a884c403ba74@suse.com> <CAKf6xpt_VhJ5r4scuAkWU3aGxgwiYNtHaBDpMoFJS+q837aFiA@mail.gmail.com>
 <d8e93366-0f99-37c7-e5f4-8efaf804d2e2@suse.com> <CAKf6xpv9qHJydjQ_TyZEKZAK14T4m2GLLqEwyMTraUxqvg+1Xw@mail.gmail.com>
 <d10143d9-0082-fa09-3ef0-2d13e5ee54ef@suse.com>
In-Reply-To: <d10143d9-0082-fa09-3ef0-2d13e5ee54ef@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 19 Oct 2020 11:26:16 -0400
Message-ID: <CAKf6xpvhTLVdBEXjz4MB_cmbfMGR0pjdAxHHoHz9hTsa+ObpOg@mail.gmail.com>
Subject: Re: [PATCH] libelf: Handle PVH kernels lacking ENTRY elfnote
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2020 at 3:38 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 16.10.2020 18:28, Jason Andryuk wrote:
> > Looks like we can pass XC_DOM_PV_CONTAINER/XC_DOM_HVM_CONTAINER down
> > into elf_xen_parse().  Then we would just validate phys_entry for HVM
> > and virt_entry for PV.  Does that sound reasonable?
>
> I think so, yes. Assuming of course that you'll convert the XC_DOM_*
> into a boolean, so that the hypervisor's use of libelf/ can also be
> suitably adjusted.

Are you okay with:
-int elf_xen_parse(struct elf_binary *elf,
-                  struct elf_dom_parms *parms);
+int elf_xen_parse_pvh(struct elf_binary *elf,
+                      struct elf_dom_parms *parms);
+int elf_xen_parse_pv(struct elf_binary *elf,
+                     struct elf_dom_parms *parms);
?

I prefer avoiding boolean arguments since I find it helps readability.
The xen dom0 builders can just call their variant, but the xenguest
elfloader and hvmloader call the appropriate one based on the
container_type.

Regards,
Jason

