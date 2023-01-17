Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC9166DB44
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 11:36:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479307.743075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjJM-0006Dx-SU; Tue, 17 Jan 2023 10:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479307.743075; Tue, 17 Jan 2023 10:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjJM-0006BC-Ou; Tue, 17 Jan 2023 10:35:24 +0000
Received: by outflank-mailman (input) for mailman id 479307;
 Tue, 17 Jan 2023 10:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTo4=5O=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1pHjJK-0006Ao-Ol
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 10:35:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a31d5359-9652-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 11:35:19 +0100 (CET)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-443-WPoUgjlNOhquP8LWC2ED8g-1; Tue, 17 Jan 2023 05:35:17 -0500
Received: by mail-ej1-f72.google.com with SMTP id
 oz11-20020a1709077d8b00b007c0dd8018b6so21486435ejc.17
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 02:35:16 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 l17-20020a1709063d3100b008727576e4ecsm832656ejf.117.2023.01.17.02.35.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 02:35:14 -0800 (PST)
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
X-Inumbo-ID: a31d5359-9652-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673951718;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=udi9DLzP25IY3XXIlKaLN3gdYOdTRra71KHKKd1UMlU=;
	b=EGN1XJGwvmeQNS8tZsXZ+/qCrHsS78NCykubWA1XEuxBi1R0qQu3Zs3RAC3qla5jedgT+3
	hmmAIEjeHlY+OlTK7mdhs2I8UFkagq3dxokGg+nCoN9QriOfElJeR/VLSQjwZHcIM0T1Li
	xSgsINrwJDT2uR0RBM9E5DC9BIomroE=
X-MC-Unique: WPoUgjlNOhquP8LWC2ED8g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udi9DLzP25IY3XXIlKaLN3gdYOdTRra71KHKKd1UMlU=;
        b=SatvTrKDZ6Yb1B2nIbkCvUXG2oAy/cHWQ4l34OvyzIUkKMCuFK4rYebFltZnnSuFt4
         o6iL7UpAKaGAmISBFwxugvUxpN9VdGj7pNNc95gmJ92ANEUwZGCteaMJufY1P0RFJu7n
         wWXyMdEnIxpJgWP4CkdrtVYnoblOgbCPNGiLjKw9jZjBKBFScPGJhsLzQUx9I3T2skXe
         UT4IfyGnPsD/hNqFGBqwpqYz1e0KZDv56YA8e3hF9gvp5yjsg3DaEUCpcg8Fm/E7me3i
         P23wDdOKtTm0NwY1S6Kkwk592KafcIXdB+ekDofEAvFOGKPv84sVI8o/enFmIxda6ERs
         eWYA==
X-Gm-Message-State: AFqh2kruUQ9PlJhtvwDWs20CRBMLxWTZrJ3B9KvXigZCPmqlQfDVNCTz
	7ct76j+rp+8MiEkbvAJ8Rnue4ZrAb49N7pLkUIf/j2vt81n96xrUZQ0wetKRp/pZnn6QXYqfHVN
	ZuYBCdlg30dezYs2Y1+s/dA0e0lk=
X-Received: by 2002:a17:906:bc58:b0:872:2cc4:6886 with SMTP id s24-20020a170906bc5800b008722cc46886mr3447809ejv.30.1673951715964;
        Tue, 17 Jan 2023 02:35:15 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtBbS6fyQA6axbQvi8yH1zGng9Ffc7Pe8EGqx5jeMqhrON4vczRjhquhrtG0NT3Cn2LeO5SWQ==
X-Received: by 2002:a17:906:bc58:b0:872:2cc4:6886 with SMTP id s24-20020a170906bc5800b008722cc46886mr3447796ejv.30.1673951715728;
        Tue, 17 Jan 2023 02:35:15 -0800 (PST)
Date: Tue, 17 Jan 2023 11:35:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Anthony Perard
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230117113513.4e692539@imammedo.users.ipa.redhat.com>
In-Reply-To: <fce262ea-e0d5-d670-787c-62d91b040739@netscape.net>
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
	<20230116163342.467039a0@imammedo.users.ipa.redhat.com>
	<fce262ea-e0d5-d670-787c-62d91b040739@netscape.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 16 Jan 2023 13:00:53 -0500
Chuck Zmudzinski <brchuckz@netscape.net> wrote:

> On 1/16/23 10:33, Igor Mammedov wrote:
> > On Fri, 13 Jan 2023 16:31:26 -0500
> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> >  =20
> >> On 1/13/23 4:33=E2=80=AFAM, Igor Mammedov wrote: =20
> >> > On Thu, 12 Jan 2023 23:14:26 -0500
> >> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> >> >    =20
> >> >> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote:   =20
> >> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wrote:=
     =20
> >> >> >> I think the change Michael suggests is very minimalistic: Move t=
he if
> >> >> >> condition around xen_igd_reserve_slot() into the function itself=
 and
> >> >> >> always call it there unconditionally -- basically turning three =
lines
> >> >> >> into one. Since xen_igd_reserve_slot() seems very problem specif=
ic,
> >> >> >> Michael further suggests to rename it to something more general.=
 All
> >> >> >> in all no big changes required.     =20
> >> >> >=20
> >> >> > yes, exactly.
> >> >> >      =20
> >> >>=20
> >> >> OK, got it. I can do that along with the other suggestions.   =20
> >> >=20
> >> > have you considered instead of reservation, putting a slot check in =
device model
> >> > and if it's intel igd being passed through, fail at realize time  if=
 it can't take
> >> > required slot (with a error directing user to fix command line)?   =
=20
> >>=20
> >> Yes, but the core pci code currently already fails at realize time
> >> with a useful error message if the user tries to use slot 2 for the
> >> igd, because of the xen platform device which has slot 2. The user
> >> can fix this without patching qemu, but having the user fix it on
> >> the command line is not the best way to solve the problem, primarily
> >> because the user would need to hotplug the xen platform device via a
> >> command line option instead of having the xen platform device added by
> >> pc_xen_hvm_init functions almost immediately after creating the pci
> >> bus, and that delay in adding the xen platform device degrades
> >> startup performance of the guest.
> >>  =20
> >> > That could be less complicated than dealing with slot reservations a=
t the cost of
> >> > being less convenient.   =20
> >>=20
> >> And also a cost of reduced startup performance =20
> >=20
> > Could you clarify how it affects performance (and how much).
> > (as I see, setup done at board_init time is roughly the same
> > as with '-device foo' CLI options, modulo time needed to parse
> > options which should be negligible. and both ways are done before
> > guest runs) =20
>=20
> I preface my answer by saying there is a v9, but you don't
> need to look at that. I will answer all your questions here.
>=20
> I am going by what I observe on the main HDMI display with the
> different approaches. With the approach of not patching Qemu
> to fix this, which requires adding the Xen platform device a
> little later, the length of time it takes to fully load the
> guest is increased. I also noticed with Linux guests that use
> the grub bootoader, the grub vga driver cannot display the
> grub boot menu at the native resolution of the display, which
> in the tested case is 1920x1080, when the Xen platform device
> is added via a command line option instead of by the
> pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
> to Qemu, the grub menu is displayed at the full, 1920x1080
> native resolution of the display. Once the guest fully loads,
> there is no noticeable difference in performance. It is mainly
> a degradation in startup performance, not performance once
> the guest OS is fully loaded.
above hints on presence of bug[s] in igd-passthru implementation,
and this patch effectively hides problem instead of trying to figure
out what's wrong and fixing it.


