Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B1366C401
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 16:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478805.742206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRUd-0004lx-9R; Mon, 16 Jan 2023 15:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478805.742206; Mon, 16 Jan 2023 15:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHRUd-0004jH-64; Mon, 16 Jan 2023 15:33:51 +0000
Received: by outflank-mailman (input) for mailman id 478805;
 Mon, 16 Jan 2023 15:33:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o6RV=5N=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1pHRUb-0004jB-Eg
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 15:33:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2adebed3-95b3-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 16:33:48 +0100 (CET)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-28-M1ajViqMNuaHWJycP0l74g-1; Mon, 16 Jan 2023 10:33:45 -0500
Received: by mail-ej1-f72.google.com with SMTP id
 oz11-20020a1709077d8b00b007c0dd8018b6so19961185ejc.17
 for <xen-devel@lists.xenproject.org>; Mon, 16 Jan 2023 07:33:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 p14-20020a17090653ce00b0085ea718a81bsm6570877ejo.198.2023.01.16.07.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:33:43 -0800 (PST)
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
X-Inumbo-ID: 2adebed3-95b3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673883226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfxOU5yee2HwVQ8hW5LGqj0eQl/J5DDe98lmdDg/TjM=;
	b=Q/F5EO6mH/sqJM6ySRu3E6Pxifbc6mkbbOpqOnaAKq1l2RPbaRVicwF2nMXoCDGL4yVkcn
	4KqjwB83cCFZAGrbKHDmpBvoYZ+nU+SMY2Xn9E+J8HsQgWCW5KRCgoq9h9Nk3NVvHNMQey
	zvDw6r0ynbEk1dBu6Vx+dmbK1so0EdM=
X-MC-Unique: M1ajViqMNuaHWJycP0l74g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1g1zCi+06h/BCDFKfYU8XUNQoM01xY7v+dJwQFuiQw=;
        b=M3vOr0HoZsNH2JQkFXgXB42Wb3reK8Gc91WuyDTHjU7abFg5dG/veojVaKexAjXuku
         zLY39jkUFp6W/3tLNcJ9Spmq5BirhtuimVian5qOYLwfbPJMWQkHmNcCH2rvpf608FxN
         8m752L1n6yB1eJ/LqjvlBiWvysAKCItagSgI50lKzluaos1avVML3hWIJeyDTKNPcyS3
         bDKpjE7qTDux/ZNRJ+yf4eep3+F2tZw8JtAsVEO5p43ep/4in71mGkG4zIqAwhuyZQwh
         oDHBclPofjUPfGgCsWkMcFUtoClmFiHbqmLf0adM2LRXA28QtWUhmVbJJJhvH+S6N1A5
         ClAA==
X-Gm-Message-State: AFqh2kp6ZTQPqaZHs5419DSzzutw6tCxNGFnmPclk2SSKEYTu9udxsKS
	qBImL76/Chsy+NoReaIz9LNjPu00n7JJC7De/zRD9NgvJEyXAFwctfNbN3/Vnx7LYZzit4E5w/u
	EycwXA6TWeRGzkxUpHOmF7Lz4zXk=
X-Received: by 2002:a17:907:a585:b0:871:3919:cbea with SMTP id vs5-20020a170907a58500b008713919cbeamr2708614ejc.54.1673883224354;
        Mon, 16 Jan 2023 07:33:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsP1+tXYFUEmlpJRu6mf2xwlR+HRv7sYl+XDTQgxmYtii99ewpWT8Pm9lEk+AysfSPRbqKRIQ==
X-Received: by 2002:a17:907:a585:b0:871:3919:cbea with SMTP id vs5-20020a170907a58500b008713919cbeamr2708594ejc.54.1673883224151;
        Mon, 16 Jan 2023 07:33:44 -0800 (PST)
Date: Mon, 16 Jan 2023 16:33:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, Paul
 Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, Richard
 Henderson <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <philmd@linaro.org>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230116163342.467039a0@imammedo.users.ipa.redhat.com>
In-Reply-To: <88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
References: <a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz.ref@aol.com>
	<a09d2427397621eaecee4c46b33507a99cc5f161.1673334040.git.brchuckz@aol.com>
	<20230110030331-mutt-send-email-mst@kernel.org>
	<a6994521-68d5-a05b-7be2-a8c605733467@aol.com>
	<D785501E-F95D-4A22-AFD0-85133F8CE56D@gmail.com>
	<9f63e7a6-e434-64b4-f082-7f5a0ab8d5bf@aol.com>
	<7208A064-2A25-4DBB-BF19-6797E96AB00C@gmail.com>
	<20230112180314-mutt-send-email-mst@kernel.org>
	<128d8ee2-8ee9-0a76-10de-af4c1b364179@aol.com>
	<20230113103310.3da703ab@imammedo.users.ipa.redhat.com>
	<88af50cb-4ebd-7995-70cf-f23ac33c5e45@aol.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 13 Jan 2023 16:31:26 -0500
Chuck Zmudzinski <brchuckz@aol.com> wrote:

> On 1/13/23 4:33=E2=80=AFAM, Igor Mammedov wrote:
> > On Thu, 12 Jan 2023 23:14:26 -0500
> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> >  =20
> >> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote: =20
> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:   =
=20
> >> >> I think the change Michael suggests is very minimalistic: Move the =
if
> >> >> condition around xen_igd_reserve_slot() into the function itself an=
d
> >> >> always call it there unconditionally -- basically turning three lin=
es
> >> >> into one. Since xen_igd_reserve_slot() seems very problem specific,
> >> >> Michael further suggests to rename it to something more general. Al=
l
> >> >> in all no big changes required.   =20
> >> >=20
> >> > yes, exactly.
> >> >    =20
> >>=20
> >> OK, got it. I can do that along with the other suggestions. =20
> >=20
> > have you considered instead of reservation, putting a slot check in dev=
ice model
> > and if it's intel igd being passed through, fail at realize time  if it=
 can't take
> > required slot (with a error directing user to fix command line)? =20
>=20
> Yes, but the core pci code currently already fails at realize time
> with a useful error message if the user tries to use slot 2 for the
> igd, because of the xen platform device which has slot 2. The user
> can fix this without patching qemu, but having the user fix it on
> the command line is not the best way to solve the problem, primarily
> because the user would need to hotplug the xen platform device via a
> command line option instead of having the xen platform device added by
> pc_xen_hvm_init functions almost immediately after creating the pci
> bus, and that delay in adding the xen platform device degrades
> startup performance of the guest.
>=20
> > That could be less complicated than dealing with slot reservations at t=
he cost of
> > being less convenient. =20
>=20
> And also a cost of reduced startup performance

Could you clarify how it affects performance (and how much).
(as I see, setup done at board_init time is roughly the same
as with '-device foo' CLI options, modulo time needed to parse
options which should be negligible. and both ways are done before
guest runs)

> However, the performance hit can be prevented by assigning slot
> 3 instead of slot 2 for the xen platform device if igd passthrough
> is configured on the command line instead of doing slot reservation,
> but there would still be less convenience and, for libxl users, an
> inability to easily configure the command line so that the igd can
> still have slot 2 without a hacky and error-prone patch to libxl to
> deal with this problem.
libvirt manages to get it right on management side without quirks on
QEMU side.

> I did post a patch on xen-devel to fix this using libxl, but so far
> it has not yet been reviewed and I mentioned in that patch that the
> approach of patching qemu so qemu reserves slot 2 for the igd is less
> prone to coding errors and is easier to maintain than the patch that
> would be required to implement the fix in libxl.

the patch is not trivial, and adds maintenance on QEMU.
Though I don't object to it as long as it's constrained to xen only
code and doesn't spill into generic PCI.
All I wanted is just point out there are other approach to problem
(i.e. do force user to user to provide correct configuration instead
of adding quirks whenever it's possible).


