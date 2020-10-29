Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D74929EF22
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 16:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14271.35377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kY9Uh-0005hS-Kl; Thu, 29 Oct 2020 15:05:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14271.35377; Thu, 29 Oct 2020 15:05:39 +0000
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
	id 1kY9Uh-0005h3-HZ; Thu, 29 Oct 2020 15:05:39 +0000
Received: by outflank-mailman (input) for mailman id 14271;
 Thu, 29 Oct 2020 15:05:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qEoS=EE=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1kY9Uf-0005gy-QU
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:05:37 +0000
Received: from eu-smtp-delivery-151.mimecast.com (unknown [207.82.80.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2b0dfeee-94b7-4c43-8e36-105c0466feeb;
 Thu, 29 Oct 2020 15:05:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-56-P6lCnI4YNLSev_eoOtq5HQ-1; Thu, 29 Oct 2020 15:05:32 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 29 Oct 2020 15:05:31 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 29 Oct 2020 15:05:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qEoS=EE=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
	id 1kY9Uf-0005gy-QU
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 15:05:37 +0000
X-Inumbo-ID: 2b0dfeee-94b7-4c43-8e36-105c0466feeb
Received: from eu-smtp-delivery-151.mimecast.com (unknown [207.82.80.151])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id 2b0dfeee-94b7-4c43-8e36-105c0466feeb;
	Thu, 29 Oct 2020 15:05:36 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-56-P6lCnI4YNLSev_eoOtq5HQ-1; Thu, 29 Oct 2020 15:05:32 +0000
X-MC-Unique: P6lCnI4YNLSev_eoOtq5HQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 29 Oct 2020 15:05:31 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 29 Oct 2020 15:05:31 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"x86@kernel.org" <x86@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
	<sthemmin@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Paolo Bonzini <pbonzini@redhat.com>, "Vitaly
 Kuznetsov" <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, "Jim
 Mattson" <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: RE: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Thread-Topic: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Thread-Index: AQHWrZenJpzBwTRfbE+Uihb7XQWTqKmurjkg
Date: Thu, 29 Oct 2020 15:05:31 +0000
Message-ID: <38b11ed3fec64ebd82d6a92834a4bebe@AcuMS.aculab.com>
References: <20201028212417.3715575-1-arnd@kernel.org>
In-Reply-To: <20201028212417.3715575-1-arnd@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Arnd Bergmann
> Sent: 28 October 2020 21:21
>=20
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> There are hundreds of warnings in a W=3D2 build about a local
> variable shadowing the global 'apic' definition:
>=20
> arch/x86/kvm/lapic.h:149:65: warning: declaration of 'apic' shadows a glo=
bal declaration [-Wshadow]
>=20
> Avoid this by renaming the global 'apic' variable to the more descriptive
> 'x86_system_apic'. It was originally called 'genapic', but both that
> and the current 'apic' seem to be a little overly generic for a global
> variable.
>=20
> Fixes: c48f14966cc4 ("KVM: inline kvm_apic_present() and kvm_lapic_enable=
d()")
> Fixes: c8d46cf06dc2 ("x86: rename 'genapic' to 'apic'")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: rename the global instead of the local variable in the header
...
> diff --git a/arch/x86/hyperv/hv_apic.c b/arch/x86/hyperv/hv_apic.c
> index 284e73661a18..33e2dc78ca11 100644
> --- a/arch/x86/hyperv/hv_apic.c
> +++ b/arch/x86/hyperv/hv_apic.c
> @@ -259,14 +259,14 @@ void __init hv_apic_init(void)
>  =09=09/*
>  =09=09 * Set the IPI entry points.
>  =09=09 */
> -=09=09orig_apic =3D *apic;
> -
> -=09=09apic->send_IPI =3D hv_send_ipi;
> -=09=09apic->send_IPI_mask =3D hv_send_ipi_mask;
> -=09=09apic->send_IPI_mask_allbutself =3D hv_send_ipi_mask_allbutself;
> -=09=09apic->send_IPI_allbutself =3D hv_send_ipi_allbutself;
> -=09=09apic->send_IPI_all =3D hv_send_ipi_all;
> -=09=09apic->send_IPI_self =3D hv_send_ipi_self;
> +=09=09orig_apic =3D *x86_system_apic;
> +
> +=09=09x86_system_apic->send_IPI =3D hv_send_ipi;
> +=09=09x86_system_apic->send_IPI_mask =3D hv_send_ipi_mask;
> +=09=09x86_system_apic->send_IPI_mask_allbutself =3D hv_send_ipi_mask_all=
butself;
> +=09=09x86_system_apic->send_IPI_allbutself =3D hv_send_ipi_allbutself;
> +=09=09x86_system_apic->send_IPI_all =3D hv_send_ipi_all;
> +=09=09x86_system_apic->send_IPI_self =3D hv_send_ipi_self;
>  =09}
>=20
>  =09if (ms_hyperv.hints & HV_X64_APIC_ACCESS_RECOMMENDED) {
> @@ -285,10 +285,10 @@ void __init hv_apic_init(void)
>  =09=09 */
>  =09=09apic_set_eoi_write(hv_apic_eoi_write);
>  =09=09if (!x2apic_enabled()) {
> -=09=09=09apic->read      =3D hv_apic_read;
> -=09=09=09apic->write     =3D hv_apic_write;
> -=09=09=09apic->icr_write =3D hv_apic_icr_write;
> -=09=09=09apic->icr_read  =3D hv_apic_icr_read;
> +=09=09=09x86_system_apic->read      =3D hv_apic_read;
> +=09=09=09x86_system_apic->write     =3D hv_apic_write;
> +=09=09=09x86_system_apic->icr_write =3D hv_apic_icr_write;
> +=09=09=09x86_system_apic->icr_read  =3D hv_apic_icr_read;
>  =09=09}

For those two just add:
=09struct apic *apic =3D x86_system_apic;
before all the assignments.
Less churn and much better code.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)


