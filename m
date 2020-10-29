Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9654929F178
	for <lists+xen-devel@lfdr.de>; Thu, 29 Oct 2020 17:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.14333.35446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYAol-00060m-6r; Thu, 29 Oct 2020 16:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 14333.35446; Thu, 29 Oct 2020 16:30:27 +0000
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
	id 1kYAol-00060N-3Y; Thu, 29 Oct 2020 16:30:27 +0000
Received: by outflank-mailman (input) for mailman id 14333;
 Thu, 29 Oct 2020 16:30:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qEoS=EE=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
 id 1kYAok-00060I-0q
 for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:30:26 +0000
Received: from eu-smtp-delivery-151.mimecast.com (unknown [185.58.86.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8d2e50c4-db4a-48de-ae1e-01113de221e0;
 Thu, 29 Oct 2020 16:30:25 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-97-MKHylt3TN2qOdBALyCARbQ-1; Thu, 29 Oct 2020 16:30:20 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 29 Oct 2020 16:30:19 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 29 Oct 2020 16:30:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qEoS=EE=aculab.com=david.laight@srs-us1.protection.inumbo.net>)
	id 1kYAok-00060I-0q
	for xen-devel@lists.xenproject.org; Thu, 29 Oct 2020 16:30:26 +0000
X-Inumbo-ID: 8d2e50c4-db4a-48de-ae1e-01113de221e0
Received: from eu-smtp-delivery-151.mimecast.com (unknown [185.58.86.151])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 8d2e50c4-db4a-48de-ae1e-01113de221e0;
	Thu, 29 Oct 2020 16:30:25 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-97-MKHylt3TN2qOdBALyCARbQ-1; Thu, 29 Oct 2020 16:30:20 +0000
X-MC-Unique: MKHylt3TN2qOdBALyCARbQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 29 Oct 2020 16:30:19 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Thu, 29 Oct 2020 16:30:19 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, the arch/x86 maintainers <x86@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>, Stephen Hemminger
	<sthemmin@microsoft.com>, "H. Peter Anvin" <hpa@zytor.com>, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Vitaly Kuznetsov <vkuznets@redhat.com>,
	"Wanpeng Li" <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>,
	Joerg Roedel <joro@8bytes.org>, "linux-hyperv@vger.kernel.org"
	<linux-hyperv@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kvm list <kvm@vger.kernel.org>, "Platform
 Driver" <platform-driver-x86@vger.kernel.org>, xen-devel
	<xen-devel@lists.xenproject.org>, "open list:IOMMU DRIVERS"
	<iommu@lists.linux-foundation.org>
Subject: RE: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Thread-Topic: [PATCH] [v2] x86: apic: avoid -Wshadow warning in header
Thread-Index: AQHWrdqfIpyThHXm90WmqPrnIVTaQ6muxUWQ
Date: Thu, 29 Oct 2020 16:30:19 +0000
Message-ID: <2a85eaf7d2e54a278493588bae41b06a@AcuMS.aculab.com>
References: <20201028212417.3715575-1-arnd@kernel.org>
 <ea34f1d3-ed54-a2de-79d9-5cc8decc0ab3@redhat.com>
 <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
In-Reply-To: <CAK8P3a0e0YAkh_9S1ZG5FW3QozZnp1CwXUfWx9VHWkY=h+FVxw@mail.gmail.com>
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
Content-Transfer-Encoding: base64

RnJvbTogQXJuZCBCZXJnbWFubg0KPiBTZW50OiAyOSBPY3RvYmVyIDIwMjAgMDk6NTENCi4uLg0K
PiBJIHRoaW5rIGlkZWFsbHkgdGhlcmUgd291bGQgYmUgbm8gZ2xvYmFsIHZhcmlhYmxlLCB3aXRo
YWxsIGFjY2Vzc2VzDQo+IGVuY2Fwc3VsYXRlZCBpbiBmdW5jdGlvbiBjYWxscywgcG9zc2libHkg
dXNpbmcgc3RhdGljX2NhbGwoKSBvcHRpbWl6YXRpb25zDQo+IGlmIGFueSBvZiB0aGVtIGFyZSBw
ZXJmb3JtYW5jZSBjcml0aWNhbC4NCg0KVGhlcmUgaXNuJ3QgcmVhbGx5IGEgbWFzc2l2ZSBkaWZm
ZXJlbmNlIGJldHdlZW4gZ2xvYmFsIHZhcmlhYmxlcw0KYW5kIGdsb2JhbCBhY2Nlc3MgZnVuY3Rp
b25zLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K


