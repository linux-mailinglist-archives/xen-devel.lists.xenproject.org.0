Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2416B61A4
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 12:46:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAXRZ-0003Tf-CQ; Wed, 18 Sep 2019 10:44:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YCyf=XN=amazon.de=prvs=1574f1310=wipawel@srs-us1.protection.inumbo.net>)
 id 1iAXRY-0003TJ-5I
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 10:44:16 +0000
X-Inumbo-ID: 42611abc-da01-11e9-a337-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 42611abc-da01-11e9-a337-bc764e2007e4;
 Wed, 18 Sep 2019 10:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1568803456; x=1600339456;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:mime-version: content-transfer-encoding;
 bh=DNEzI/OD12WaB8xxEGeMZazx1ViI9+w8Oxv2kO143E0=;
 b=Owpt75me7hW6U9RphIivH0QEN/IEf3MRYn9lQB4pAxFpMXGhu9DK82Wv
 Cb68EllY7l561RwUcaJTtaSn5D0UDcySrUecun/1ZzhngSvjuSj/XzleZ
 1HpALDPE+hlHXuCViV8DHVJBZXS8cfJEAZFHQbKlKUauM+XB8j3od/jo+ Y=;
X-IronPort-AV: E=Sophos;i="5.64,520,1559520000"; d="scan'208";a="421793039"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 18 Sep 2019 10:44:15 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-37fd6b3d.us-east-1.amazon.com (Postfix) with ESMTPS
 id CD0AF282A14; Wed, 18 Sep 2019 10:44:11 +0000 (UTC)
Received: from EX13D05EUB002.ant.amazon.com (10.43.166.45) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 10:44:10 +0000
Received: from EX13D05EUB004.ant.amazon.com (10.43.166.115) by
 EX13D05EUB002.ant.amazon.com (10.43.166.45) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 18 Sep 2019 10:44:10 +0000
Received: from EX13D05EUB004.ant.amazon.com ([10.43.166.115]) by
 EX13D05EUB004.ant.amazon.com ([10.43.166.115]) with mapi id 15.00.1367.000;
 Wed, 18 Sep 2019 10:44:10 +0000
From: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH] create-diff-object: more precisely identify .rodata
 sections
Thread-Index: AQHVbfOz/MMBt+ID2EWJUuzwV092UacxMOkAgAAAuYCAAAoqAIAAA2sAgAAA4oA=
Date: Wed, 18 Sep 2019 10:44:10 +0000
Message-ID: <4134F5DE-6497-4F32-9A5F-866E4D6C0735@amazon.com>
References: <20190918073538.24707-1-wipawel@amazon.de>
 <9c5a2063-35ab-5590-a079-9f361d95f7ee@suse.com>
 <2FFA152B-47AB-4C0E-9747-66B2D9EDFCAA@amazon.com>
 <e14a8a90-0afa-ebdd-ce70-be7896e9b612@arm.com>
 <23938.2492.424579.175738@mariner.uk.xensource.com>
In-Reply-To: <23938.2492.424579.175738@mariner.uk.xensource.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.48]
Content-ID: <EA6B46BD124D9C43AB186F96250701AB@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] create-diff-object: more precisely identify
 .rodata sections
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Lars Kurth <lars.kurth@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, "Pohlack,
 Martin" <mpohlack@amazon.de>, "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Cgo+IE9uIDE4LiBTZXAgMjAxOSwgYXQgMTI6NDEsIElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBj
aXRyaXguY29tPiB3cm90ZToKPiAKPiBKdWxpZW4gR3JhbGwgd3JpdGVzICgiUmU6IFtQQVRDSF0g
Y3JlYXRlLWRpZmYtb2JqZWN0OiBtb3JlIHByZWNpc2VseSBpZGVudGlmeSAucm9kYXRhIHNlY3Rp
b25zIik6Cj4+IE9uIDE4LzA5LzIwMTkgMTA6NTIsIFdpZWN6b3JraWV3aWN6LCBQYXdlbCB3cm90
ZToKPj4+ICQgc2NyaXB0cy8uL2FkZF9tYWludGFpbmVycy5wbCAtZCB+L2dpdC9saXZlcGF0Y2gt
YnVpbGQtdG9vbHMKPj4gCj4+ICctZCcgb25seSB0ZWxscyB5b3Ugd2hlcmUgdGhlIHBhdGNoZXMg
ZmlsZXMgYXJlLiBUaGUgc2NyaXB0IHdpbGwgbG9vayB1cCBmb3IgdGhlIAo+PiBNQUlOVEFJTkVS
UyBmaWxlIGluIHRoZSBjdXJyZW50IGRpcmVjdG9yeS4KPiAKPiBIbW1tLiAgSSB3b25kZXIgaWYg
d2UgY291bGQgZGV0ZWN0IHRoaXMgc2l0dWF0aW9uIHNvbWVob3cuICBUaGlzIHdpbGwKPiBiZSBh
IGNvbW1vbiB1c2VyIGVycm9yIEkgdGhpbmsuCj4gCgpJIHNob3VsZCBoYXZlIGxvb2tlZCB0d2lj
ZSBiZWZvcmUgc2VuZGluZyB0aGUgcGF0Y2ggb3V0LiBCdXQsIHdoYXQgd291bGQgYmUgdmVyeSBo
ZWxwZnVsIGZvciBtZQppcyBhZGRpdGlvbmFsIG9wdGlvbiB0byB0aGUgYWRkX21haW50YWluZXJz
LnBsIHNjcmlwdCBsaWtlOiAtbSAuL01BSU5UQUlORVJTCgo+IElhbi4KCkJlc3QgUmVnYXJkcywK
UGF3ZWwgV2llY3pvcmtpZXdpY3oKCgoKCgoKQW1hem9uIERldmVsb3BtZW50IENlbnRlciBHZXJt
YW55IEdtYkgKS3JhdXNlbnN0ci4gMzgKMTAxMTcgQmVybGluCkdlc2NoYWVmdHNmdWVocnVuZzog
Q2hyaXN0aWFuIFNjaGxhZWdlciwgUmFsZiBIZXJicmljaApFaW5nZXRyYWdlbiBhbSBBbXRzZ2Vy
aWNodCBDaGFybG90dGVuYnVyZyB1bnRlciBIUkIgMTQ5MTczIEIKU2l0ejogQmVybGluClVzdC1J
RDogREUgMjg5IDIzNyA4NzkKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
