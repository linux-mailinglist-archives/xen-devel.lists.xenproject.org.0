Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB044DE3FF
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 23:28:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292268.496443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVL5R-0001NF-8b; Fri, 18 Mar 2022 22:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292268.496443; Fri, 18 Mar 2022 22:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVL5R-0001Kv-5f; Fri, 18 Mar 2022 22:28:45 +0000
Received: by outflank-mailman (input) for mailman id 292268;
 Fri, 18 Mar 2022 22:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QOyl=T5=aculab.com=david.laight@srs-se1.protection.inumbo.net>)
 id 1nVL5Q-0001Kb-03
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 22:28:44 +0000
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c302d978-a70a-11ec-8fbc-03012f2f19d4;
 Fri, 18 Mar 2022 23:28:41 +0100 (CET)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-308-tJXXIe7QOkm1qFX-LQUFdA-1; Fri, 18 Mar 2022 22:28:38 +0000
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Fri, 18 Mar 2022 22:28:38 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Fri, 18 Mar 2022 22:28:37 +0000
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
X-Inumbo-ID: c302d978-a70a-11ec-8fbc-03012f2f19d4
X-MC-Unique: tJXXIe7QOkm1qFX-LQUFdA-1
From: David Laight <David.Laight@ACULAB.COM>
To: 'Juergen Gross' <jgross@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "platform-driver-x86@vger.kernel.org"
	<platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Dell.Client.Kernel@dell.com"
	<Dell.Client.Kernel@dell.com>
CC: Stuart Hayes <stuart.w.hayes@gmail.com>, Hans de Goede
	<hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] platform/x86/dell: add buffer allocation/free functions
 for SMI calls
Thread-Topic: [PATCH] platform/x86/dell: add buffer allocation/free functions
 for SMI calls
Thread-Index: AQHYOto/hyLOp/NEJ0S+JLWvPC30KazFQPKggAAbeICAAFvP8A==
Date: Fri, 18 Mar 2022 22:28:37 +0000
Message-ID: <f04348c83155404c8ae4c8e5c3abedf2@AcuMS.aculab.com>
References: <20220318150950.16843-1-jgross@suse.com>
 <accf95548a8c4374b17c159b9b2d0098@AcuMS.aculab.com>
 <2a4573e0-4a8d-52c1-d29b-66b13bfe376f@suse.com>
In-Reply-To: <2a4573e0-4a8d-52c1-d29b-66b13bfe376f@suse.com>
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

RnJvbTogSnVlcmdlbiBHcm9zcw0KPiBTZW50OiAxOCBNYXJjaCAyMDIyIDE2OjU2DQo+IA0KPiBP
biAxOC4wMy4yMiAxNjoyMiwgRGF2aWQgTGFpZ2h0IHdyb3RlOg0KPiA+IEZyb206IEp1ZXJnZW4g
R3Jvc3MNCj4gPj4gU2VudDogMTggTWFyY2ggMjAyMiAxNToxMA0KPiA+Pg0KPiA+PiBUaGUgZGNk
YmFzIGRyaXZlciBpcyB1c2VkIHRvIGNhbGwgU01JIGhhbmRsZXJzIGZvciBib3RoLCBkY2RiYXMg
YW5kDQo+ID4+IGRlbGwtc21iaW9zLXNtbS4gQm90aCBkcml2ZXJzIGFsbG9jYXRlIGEgYnVmZmVy
IGZvciBjb21tdW5pY2F0aW5nDQo+ID4+IHdpdGggdGhlIFNNSSBoYW5kbGVyLiBUaGUgcGh5c2lj
YWwgYnVmZmVyIGFkZHJlc3MgaXMgdGhlbiBwYXNzZWQgdG8NCj4gPj4gdGhlIGNhbGxlZCBTTUkg
aGFuZGxlciB2aWEgJWVieC4NCj4gPj4NCj4gPj4gVW5mb3J0dW5hdGVseSB0aGlzIGRvZXNuJ3Qg
d29yayB3aGVuIHJ1bm5pbmcgaW4gWGVuIGRvbTAsIGFzIHRoZQ0KPiA+PiBwaHlzaWNhbCBhZGRy
ZXNzIG9idGFpbmVkIHZpYSB2aXJ0X3RvX3BoeXMoKSBpcyBvbmx5IGEgZ3Vlc3QgcGh5c2ljYWwN
Cj4gPj4gYWRkcmVzcywgYW5kIG5vdCBhIG1hY2hpbmUgcGh5c2ljYWwgYWRkcmVzcyBhcyBuZWVk
ZWQgYnkgU01JLg0KPiA+DQo+ID4gVGhlIHBoeXNpY2FsIGFkZHJlc3MgZnJvbSB2aXJ0X3RvX3Bo
eSgpIGlzIGFsd2F5cyB3cm9uZy4NCj4gPiBUaGF0IGlzIHRoZSBwaHlzaWNhbCBhZGRyZXNzIHRo
ZSBjcHUgaGFzIGZvciB0aGUgbWVtb3J5Lg0KPiA+IFdoYXQgeW91IHdhbnQgaXMgdGhlIGFkZHJl
c3MgdGhlIGRtYSBtYXN0ZXIgaW50ZXJmYWNlIG5lZWRzIHRvIHVzZS4NCj4gPiBUaGF0IGNhbiBi
ZSBkaWZmZXJlbnQgZm9yIGEgcGh5c2ljYWwgc3lzdGVtIC0gbm8gbmVlZCBmb3IgdmlydHVhbGlz
YXRpb24uDQo+ID4NCj4gPiBPbiB4ODYgdGhleSBkbyB1c3VhbGx5IG1hdGNoLCBidXQgYW55dGhp
bmcgd2l0aCBhIGZ1bGwgaW9tbXUNCj4gPiB3aWxsIG5lZWQgY29tcGxldGVseSBkaWZmZXJlbnQg
YWRkcmVzc2VzLg0KPiANCj4gWWVzLCB0aGFua3MgZm9yIHJlbWluZGluZyBtZSBvZiB0aGF0Lg0K
PiANCj4gVGhlIFNNSSBoYW5kbGVyIGlzIHJ1bm5pbmcgb24gdGhlIGNwdSwgcmlnaHQ/IFNvIHVz
aW5nIHRoZSBETUENCj4gYWRkcmVzcyBpcyB3cm9uZyBpbiBjYXNlIG9mIGFuIElPTU1VLiBJIHJl
YWxseSBuZWVkIHRoZSBtYWNoaW5lDQo+IHBoeXNpY2FsIGFkZHJlc3MuDQoNClRoYXQgb3VnaHQg
dG8gYmUgaGFuZGxlZCBieSB0aGUgJ2RldicgcGFyYW1ldGVyIHRvIGRtYV9hbGxvY19jb2hlcmVu
dCgpLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5
IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRp
b24gTm86IDEzOTczODYgKFdhbGVzKQ0K


