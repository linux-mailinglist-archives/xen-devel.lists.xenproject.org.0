Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDB266DBC4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 12:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479325.743108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjlR-0002HG-IV; Tue, 17 Jan 2023 11:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479325.743108; Tue, 17 Jan 2023 11:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjlR-0002Ef-FZ; Tue, 17 Jan 2023 11:04:25 +0000
Received: by outflank-mailman (input) for mailman id 479325;
 Tue, 17 Jan 2023 11:04:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CTo4=5O=redhat.com=imammedo@srs-se1.protection.inumbo.net>)
 id 1pHjlP-0002EZ-QU
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 11:04:23 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1eb5448-9656-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 12:04:22 +0100 (CET)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-659-i3LsrDrjN92pgFpsAdF7aw-1; Tue, 17 Jan 2023 06:04:19 -0500
Received: by mail-ej1-f72.google.com with SMTP id
 hp2-20020a1709073e0200b0084d47e3fe82so17493830ejc.8
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jan 2023 03:04:19 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 kz11-20020a17090777cb00b007aece68483csm13080334ejc.193.2023.01.17.03.04.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 03:04:17 -0800 (PST)
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
X-Inumbo-ID: b1eb5448-9656-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673953461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eyVjNXxDkmKeLwTrHfr3getUGen09SQggMhsus/FQIc=;
	b=eKB3UkXrIH4+GO/oTPAkLe3M+hQjPE/i9cuqvBRYsWBZ358ajThSfNUfdAD8ODG2PydlTL
	cnAciQD8HU3TJt3BSNcX+5WouFxBUNqg8Db2BuVjyL/bbdukxwtJoyanUvI7pzW958c7KZ
	IFTYpGgd8WODN5AV66tDE4PRCZkQMu8=
X-MC-Unique: i3LsrDrjN92pgFpsAdF7aw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eyVjNXxDkmKeLwTrHfr3getUGen09SQggMhsus/FQIc=;
        b=F76yklHpjQd4Wuk56acfYEMyL4ts9ozm185J/O2Jjfvf2TQjiV/UVoBn2oHkV8bkFg
         y9Kwlp/APGU7e6e7IYY7hqsnexR8Nbmn2eBV4qfYq+5ZC8IQgeZELca6vOtHivz8vaYg
         6etU4N1v+MQoR15N+0TFjNHlmJDlD+SHhV9rU19aKIRCbNMYmNpDu3c4Gv4KmeJGeHcP
         ts+E1QPF8y+zJ0wipxV5xztLiFYg1cQloUMnTINWNsvCUHozPP3H91GhA5alozAxxYMP
         tQiHDXQynfXg8KK5S/J48JuRNJs8wQcjJgqtZX90c44SMF4juUI7MOi5Eus1WV5n+OXP
         ttGQ==
X-Gm-Message-State: AFqh2kpXiUJMtbhIygQSISjYEbDh0m6me5cO67lOmYiU5D7ZxSSoNSU9
	WExkUQPGIuYKYisVAGfqkO96mL52Go9ZH7peXp/46iCh93b3eUlAVEOPUr9GVkDRsR+F3WTL7GZ
	ABf2HkxEax0rMMaaz0VenmtlkIfw=
X-Received: by 2002:a17:907:ca85:b0:7c1:1e5a:ed10 with SMTP id ul5-20020a170907ca8500b007c11e5aed10mr2469136ejc.8.1673953458709;
        Tue, 17 Jan 2023 03:04:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMOCZZraUw4zh7iQC3j12bFprGagl0VcCEBpc0ktoOk5ixu3QwIXdb8aSqNQkqCcaYDyEk9A==
X-Received: by 2002:a17:907:ca85:b0:7c1:1e5a:ed10 with SMTP id ul5-20020a170907ca8500b007c11e5aed10mr2469119ejc.8.1673953458471;
        Tue, 17 Jan 2023 03:04:18 -0800 (PST)
Date: Tue, 17 Jan 2023 12:04:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow
 <shentey@gmail.com>, qemu-devel@nongnu.org, Stefano Stabellini
 <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org, Philippe
 =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Anthony Perard
 <anthony.perard@citrix.com>, Thomas Huth <thuth@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v8] xen/pt: reserve PCI slot 2 for Intel igd-passthru
Message-ID: <20230117120416.0aa041d6@imammedo.users.ipa.redhat.com>
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

Looking at igd-assign.txt, it recommends to add IGD using '-device' CLI
option, and actually drop at least graphics defaults explicitly.
So it is expected to work fine even when IGD is constructed with
'-device'.

Could you provide full CLI current xen starts QEMU with and then
a CLI you used (with explicit -device for IGD) that leads
to reduced performance?

CCing vfio folks who might have an idea what could be wrong based
on vfio experience.


