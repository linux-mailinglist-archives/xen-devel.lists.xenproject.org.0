Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A45CD321EAC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 19:00:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88330.166013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFV8-0001Cf-58; Mon, 22 Feb 2021 18:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88330.166013; Mon, 22 Feb 2021 18:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFV8-0001AL-1m; Mon, 22 Feb 2021 18:00:06 +0000
Received: by outflank-mailman (input) for mailman id 88330;
 Mon, 22 Feb 2021 18:00:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cC4D=HY=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1lEFV6-00011V-S0
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 18:00:04 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f41cb476-ea6e-482d-9015-37ffb16e0d44;
 Mon, 22 Feb 2021 18:00:04 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-x6AyWPnMMK6ocNz1yohAhA-1; Mon, 22 Feb 2021 13:00:02 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAB31192CC57;
 Mon, 22 Feb 2021 17:59:56 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90F5F60DA0;
 Mon, 22 Feb 2021 17:59:33 +0000 (UTC)
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
X-Inumbo-ID: f41cb476-ea6e-482d-9015-37ffb16e0d44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614016804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g0daaZIiL7zB1dNQnlGOdmrK5Ct4nJWAQKVeDV4S+9U=;
	b=SxAvLQEgIQg4AF43XkIExc4cZPw1W0kFjn25idJ41GmCzCFGeNIKelKJtCCKHnHXT8l8fM
	raDcsdZXnT3ihpQ+y0m5xdVmdGqpQdxpf9vv8yJHoKnd52CjRlog/vOomjy6wOoOdpqTEZ
	C7C2mLthoiCOD1Ddm9yxOwe2VJTujzY=
X-MC-Unique: x6AyWPnMMK6ocNz1yohAhA-1
Date: Mon, 22 Feb 2021 18:59:30 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Peter
 Maydell <peter.maydell@linaro.org>, Anthony Perard
 <anthony.perard@citrix.com>, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 xen-devel@lists.xenproject.org, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-arm@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>, Paolo
 Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, BALATON Zoltan
 <balaton@eik.bme.hu>, Leif Lindholm <leif@nuviainc.com>, Richard Henderson
 <richard.henderson@linaro.org>, Radoslaw Biernacki <rad@semihalf.com>,
 Alistair Francis <alistair@alistair23.me>, Paul Durrant <paul@xen.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, =?UTF-8?B?SGVydsOp?= Poussineau
 <hpoussin@reactos.org>, Greg Kurz <groug@kaod.org>, Christian Borntraeger
 <borntraeger@de.ibm.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>, Aleksandar Rikalo
 <aleksandar.rikalo@syrmia.com>, Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?=
 <f4bug@amsat.org>
Subject: Re: [PATCH v2 02/11] hw/boards: Introduce
 machine_class_valid_for_accelerator()
Message-ID: <20210222185930.4c08cb69.cohuck@redhat.com>
In-Reply-To: <6ceff55c-6da4-e773-7809-de3be2f566ab@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
	<20210219173847.2054123-3-philmd@redhat.com>
	<20210222183400.0c151d46.cohuck@redhat.com>
	<6ceff55c-6da4-e773-7809-de3be2f566ab@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

On Mon, 22 Feb 2021 18:46:15 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> On 2/22/21 6:34 PM, Cornelia Huck wrote:
> > On Fri, 19 Feb 2021 18:38:38 +0100
> > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:
> >  =20
> >> Introduce the valid_accelerators[] field to express the list
> >> of valid accelators a machine can use, and add the
> >> machine_class_valid_for_current_accelerator() and
> >> machine_class_valid_for_accelerator() methods.
> >>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> >> ---
> >>  include/hw/boards.h | 24 ++++++++++++++++++++++++
> >>  hw/core/machine.c   | 26 ++++++++++++++++++++++++++
> >>  2 files changed, 50 insertions(+)
> >>
> >> diff --git a/include/hw/boards.h b/include/hw/boards.h
> >> index 68d3d10f6b0..4d08bc12093 100644
> >> --- a/include/hw/boards.h
> >> +++ b/include/hw/boards.h
> >> @@ -36,6 +36,24 @@ void machine_set_cpu_numa_node(MachineState *machin=
e,
> >>                                 const CpuInstanceProperties *props,
> >>                                 Error **errp);
> >> =20
> >> +/**
> >> + * machine_class_valid_for_accelerator:
> >> + * @mc: the machine class
> >> + * @acc_name: accelerator name
> >> + *
> >> + * Returns %true if the accelerator is valid for the machine, %false
> >> + * otherwise. See #MachineClass.valid_accelerators. =20
> >=20
> > Naming confusion: is the machine class valid for the accelerator, or
> > the accelerator valid for the machine class? Or either? :) =20
>=20
> "the accelerator valid for the machine class".
>=20
> Is this clearer?
>=20
> "Returns %true if the current accelerator is valid for the
>  selected machine, %false otherwise.
>=20
> Or...
>=20
> "Returns %true if the selected accelerator is valid for the
>  current machine, %false otherwise.

Maybe that one, given how it ends up being called? Or "specified
machine"?
>=20
> How would look "either"?
>=20
> The machine is already selected, and the accelerator too...

Yes, so this is basically testing the (machine,accelerator) tuple,
which is what I meant with 'either'.

>=20
> >  =20
> >> + */
> >> +bool machine_class_valid_for_accelerator(MachineClass *mc, const char=
 *acc_name);
> >> +/**
> >> + * machine_class_valid_for_current_accelerator:
> >> + * @mc: the machine class
> >> + *
> >> + * Returns %true if the accelerator is valid for the current machine,
> >> + * %false otherwise. See #MachineClass.valid_accelerators. =20
> >=20
> > Same here: current accelerator vs. current machine.

So maybe

"Returns %true if the current accelerator is valid for the specified
machine class..." ?

> >  =20
> >> + */
> >> +bool machine_class_valid_for_current_accelerator(MachineClass *mc);


