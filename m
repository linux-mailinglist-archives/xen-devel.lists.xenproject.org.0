Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9619321E6E
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 18:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88313.165984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFID-0007g4-KY; Mon, 22 Feb 2021 17:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88313.165984; Mon, 22 Feb 2021 17:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEFID-0007fe-Gb; Mon, 22 Feb 2021 17:46:45 +0000
Received: by outflank-mailman (input) for mailman id 88313;
 Mon, 22 Feb 2021 17:46:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cC4D=HY=redhat.com=cohuck@srs-us1.protection.inumbo.net>)
 id 1lEFIB-0007f2-V8
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 17:46:43 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id b3979496-2e51-40c7-899d-9e13db34dcc0;
 Mon, 22 Feb 2021 17:46:43 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-MITzUUf3Oqye6SI3VLeV4w-1; Mon, 22 Feb 2021 12:46:41 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFE62C291;
 Mon, 22 Feb 2021 17:46:37 +0000 (UTC)
Received: from gondolin (ovpn-113-115.ams2.redhat.com [10.36.113.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7CA0B5D6B1;
 Mon, 22 Feb 2021 17:46:23 +0000 (UTC)
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
X-Inumbo-ID: b3979496-2e51-40c7-899d-9e13db34dcc0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614016003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ap6wVunjnHQO5CinJJgI7vpNWx2oOiKw2tFNPevDbBQ=;
	b=hktoStxsYtrUntRoNr2igTcCuInFkkkhEbKLWbzp1SAclnmEoiZnGvDKNq6MHDLf7xC+TB
	DDrTspxmCwGlb5ecER1nUOR3Wp0GquQBq8UPSPX5dbTFdN3C3ctjuK9OIpHrSQyMx28ZY2
	KzBqZ8gnCQziAaW6MtGOFBvviyMPFyY=
X-MC-Unique: MITzUUf3Oqye6SI3VLeV4w-1
Date: Mon, 22 Feb 2021 18:46:20 +0100
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
Subject: Re: [PATCH v2 11/11] softmmu/vl: Exit gracefully when accelerator
 is not supported
Message-ID: <20210222184620.57119057.cohuck@redhat.com>
In-Reply-To: <20210219173847.2054123-12-philmd@redhat.com>
References: <20210219173847.2054123-1-philmd@redhat.com>
	<20210219173847.2054123-12-philmd@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15

On Fri, 19 Feb 2021 18:38:47 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> wrote:

> Before configuring an accelerator, check it is valid for
> the current machine. Doing so we can return a simple error
> message instead of criptic one.

s/criptic/cryptic/

>=20
> Before:
>=20
>   $ qemu-system-arm -M raspi2b -enable-kvm
>   qemu-system-arm: /build/qemu-ETIdrs/qemu-4.2/exec.c:865: cpu_address_sp=
ace_init: Assertion `asidx =3D=3D 0 || !kvm_enabled()' failed.
>   Aborted
>=20
>   $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
>   qemu-system-aarch64: kvm_init_vcpu: kvm_arch_init_vcpu failed (0): Inva=
lid argument
>=20
> After:
>=20
>   $ qemu-system-arm -M raspi2b -enable-kvm
>   qemu-system-aarch64: invalid accelerator 'kvm' for machine raspi2b
>=20
>   $ qemu-system-aarch64 -M xlnx-zcu102 -enable-kvm -smp 6
>   qemu-system-aarch64: -accel kvm: invalid accelerator 'kvm' for machine =
xlnx-zcu102
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  softmmu/vl.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f357..f2c4074310b 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2133,6 +2133,7 @@ static int do_configure_accelerator(void *opaque, Q=
emuOpts *opts, Error **errp)
>      const char *acc =3D qemu_opt_get(opts, "accel");
>      AccelClass *ac =3D accel_find(acc);
>      AccelState *accel;
> +    MachineClass *mc;
>      int ret;
>      bool qtest_with_kvm;
> =20
> @@ -2145,6 +2146,12 @@ static int do_configure_accelerator(void *opaque, =
QemuOpts *opts, Error **errp)
>          }
>          return 0;
>      }
> +    mc =3D MACHINE_GET_CLASS(current_machine);
> +    if (!qtest_chrdev && !machine_class_valid_for_accelerator(mc, ac->na=
me)) {

Shouldn't qtest be already allowed in any case in the checking function?

> +        *p_init_failed =3D true;
> +        error_report("invalid accelerator '%s' for machine %s", acc, mc-=
>name);
> +        return 0;
> +    }
>      accel =3D ACCEL(object_new_with_class(OBJECT_CLASS(ac)));
>      object_apply_compat_props(OBJECT(accel));
>      qemu_opt_foreach(opts, accelerator_set_property,


