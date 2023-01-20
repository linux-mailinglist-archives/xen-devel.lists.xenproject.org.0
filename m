Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE1C675972
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 17:03:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481993.747273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItqs-0001VW-Km; Fri, 20 Jan 2023 16:02:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481993.747273; Fri, 20 Jan 2023 16:02:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pItqs-0001Sw-Hh; Fri, 20 Jan 2023 16:02:50 +0000
Received: by outflank-mailman (input) for mailman id 481993;
 Fri, 20 Jan 2023 16:02:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=islB=5R=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1pItqq-0001S8-Vc
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 16:02:49 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e05087ad-98db-11ed-b8d1-410ff93cb8f0;
 Fri, 20 Jan 2023 17:02:45 +0100 (CET)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-632-d8gPAWXTMzq3olbTxg8uVA-1; Fri, 20 Jan 2023 11:02:43 -0500
Received: by mail-ed1-f69.google.com with SMTP id
 l17-20020a056402255100b00472d2ff0e59so4167091edb.19
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 08:02:42 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 l1-20020a1709063d2100b0086d70b9c023sm8983330ejf.63.2023.01.20.08.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 08:02:05 -0800 (PST)
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
X-Inumbo-ID: e05087ad-98db-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674230564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ltffmf7efxRjeBXWrWYsu1MTZJnXzkkEAcN40f2IiyQ=;
	b=QUNmQgrTW+se7kdGGKKlaBQfnVgJj7N5W+bXSgIfY2SNhAPyE7TOat5e+t6tSop0nJOWJ2
	mO1I5d9OqIoXGWY6hAaY6hpmz/K0P6uQEFCTRZg+soB6kRL2Hh9u/puVHkpFYgGBSVfv7s
	8KAnBVbRxbIR/ViLQbESZ5K85p0oGpI=
X-MC-Unique: d8gPAWXTMzq3olbTxg8uVA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LqK9LshMvEORLrMKTzFodPJbRAbdUgjc/AwkyEARM60=;
        b=4q3gDDekj2uBW9VGUXAqbwGkH+k7x2YrKL/O1INiMx5XMFF7lHVfdbxJue9VB/Vdlc
         WHP0iKWnH2hGLkEj7219Ds94B1VRgjrq4aZmSW01uxBy1K1f/kK38idIidI7p37eGFIM
         HRdnpFLLSTOa4GgOf2I2VevQy9C9Im/kJzKOHc8OmPFEUak+BEoSK6+YBjzjqO7clOho
         jKwOB+bHYAbw29Tb0VnHbfYMIVLiFihFwl2y4K+z/GwLYp8yU5CYbGGmS2jDg+P+u8I3
         Jrrud5feoZPc8KwzLueHv0+zoCIG3rB6NDhb1jtvVsHNpe2j4UpGFV1zipVarwgXv6Hk
         lNyg==
X-Gm-Message-State: AFqh2krSjaplxy+xu+7Y8hdZTj9T8QJOXwPZ06petcFENPoOZjADgTby
	mALAjX9PIJJwY9zaFMfge8WL8T+8EPKf4G8Bxok469tiiIcLuC3zlK1gdDW6hJLmDC7lHhZvVif
	noeiPe5LqgsTrV9FAfeUTssUCL1U=
X-Received: by 2002:a17:906:1f57:b0:872:2cc4:6886 with SMTP id d23-20020a1709061f5700b008722cc46886mr11043970ejk.30.1674230561772;
        Fri, 20 Jan 2023 08:02:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXthoGh0EHUow3P0wDivX/RlxEqI+itykWmbgiIvnMaGm/zCGmO2sh2c7h+h1DgYquwHUIEv8g==
X-Received: by 2002:a17:906:1f57:b0:872:2cc4:6886 with SMTP id d23-20020a1709061f5700b008722cc46886mr11043949ejk.30.1674230561580;
        Fri, 20 Jan 2023 08:02:41 -0800 (PST)
Date: Fri, 20 Jan 2023 17:01:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Chuck Zmudzinski <brchuckz@aol.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Anthony Perard
 <anthony.perard@citrix.com>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230120170147.4f3bbda6@imammedo.users.ipa.redhat.com>
In-Reply-To: <1c7d1fd7-d29b-1ae1-a7f4-0fea811b56c5@aol.com>
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
	<20230117113513.4e692539@imammedo.users.ipa.redhat.com>
	<1c7d1fd7-d29b-1ae1-a7f4-0fea811b56c5@aol.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 17 Jan 2023 09:50:23 -0500
Chuck Zmudzinski <brchuckz@aol.com> wrote:

> On 1/17/2023 5:35 AM, Igor Mammedov wrote:
> > On Mon, 16 Jan 2023 13:00:53 -0500
> > Chuck Zmudzinski <brchuckz@netscape.net> wrote:
> > =20
> > > On 1/16/23 10:33, Igor Mammedov wrote: =20
> > > > On Fri, 13 Jan 2023 16:31:26 -0500
> > > > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >    =20
> > > >> On 1/13/23 4:33=E2=80=AFAM, Igor Mammedov wrote:   =20
> > > >> > On Thu, 12 Jan 2023 23:14:26 -0500
> > > >> > Chuck Zmudzinski <brchuckz@aol.com> wrote:
> > > >> >      =20
> > > >> >> On 1/12/23 6:03=E2=80=AFPM, Michael S. Tsirkin wrote:     =20
> > > >> >> > On Thu, Jan 12, 2023 at 10:55:25PM +0000, Bernhard Beschow wr=
ote:       =20
> > > >> >> >> I think the change Michael suggests is very minimalistic: Mo=
ve the if
> > > >> >> >> condition around xen_igd_reserve_slot() into the function it=
self and
> > > >> >> >> always call it there unconditionally -- basically turning th=
ree lines
> > > >> >> >> into one. Since xen_igd_reserve_slot() seems very problem sp=
ecific,
> > > >> >> >> Michael further suggests to rename it to something more gene=
ral. All
> > > >> >> >> in all no big changes required.       =20
> > > >> >> >=20
> > > >> >> > yes, exactly.
> > > >> >> >        =20
> > > >> >>=20
> > > >> >> OK, got it. I can do that along with the other suggestions.    =
 =20
> > > >> >=20
> > > >> > have you considered instead of reservation, putting a slot check=
 in device model
> > > >> > and if it's intel igd being passed through, fail at realize time=
  if it can't take
> > > >> > required slot (with a error directing user to fix command line)?=
     =20
> > > >>=20
> > > >> Yes, but the core pci code currently already fails at realize time
> > > >> with a useful error message if the user tries to use slot 2 for th=
e
> > > >> igd, because of the xen platform device which has slot 2. The user
> > > >> can fix this without patching qemu, but having the user fix it on
> > > >> the command line is not the best way to solve the problem, primari=
ly
> > > >> because the user would need to hotplug the xen platform device via=
 a
> > > >> command line option instead of having the xen platform device adde=
d by
> > > >> pc_xen_hvm_init functions almost immediately after creating the pc=
i
> > > >> bus, and that delay in adding the xen platform device degrades
> > > >> startup performance of the guest.
> > > >>    =20
> > > >> > That could be less complicated than dealing with slot reservatio=
ns at the cost of
> > > >> > being less convenient.     =20
> > > >>=20
> > > >> And also a cost of reduced startup performance   =20
> > > >=20
> > > > Could you clarify how it affects performance (and how much).
> > > > (as I see, setup done at board_init time is roughly the same
> > > > as with '-device foo' CLI options, modulo time needed to parse
> > > > options which should be negligible. and both ways are done before
> > > > guest runs)   =20
> > >=20
> > > I preface my answer by saying there is a v9, but you don't
> > > need to look at that. I will answer all your questions here.
> > >=20
> > > I am going by what I observe on the main HDMI display with the
> > > different approaches. With the approach of not patching Qemu
> > > to fix this, which requires adding the Xen platform device a
> > > little later, the length of time it takes to fully load the
> > > guest is increased. I also noticed with Linux guests that use
> > > the grub bootoader, the grub vga driver cannot display the
> > > grub boot menu at the native resolution of the display, which
> > > in the tested case is 1920x1080, when the Xen platform device
> > > is added via a command line option instead of by the
> > > pc_xen_hvm_init_pci fucntion in pc_piix.c, but with this patch
> > > to Qemu, the grub menu is displayed at the full, 1920x1080
> > > native resolution of the display. Once the guest fully loads,
> > > there is no noticeable difference in performance. It is mainly
> > > a degradation in startup performance, not performance once
> > > the guest OS is fully loaded. =20
> > above hints on presence of bug[s] in igd-passthru implementation,
> > and this patch effectively hides problem instead of trying to figure
> > out what's wrong and fixing it.
> > =20
>=20
> I agree that the with the current Qemu there is a bug in the igd-passthru
> implementation. My proposed patch fixes it. So why not support the
> proposed patch with a Reviewed-by tag?
I see the patch as workaround (it might be a reasonable one) and
it's upto xen maintainers to give Reviewed-by/accept it.

Though I'd add to commit message something about performance issues
you are experiencing when trying to passthrough IGD manually
as one of justifications for workaround (it might push Xen folks
to investigate the issue and it won't be lost/forgotten on mail-list).


