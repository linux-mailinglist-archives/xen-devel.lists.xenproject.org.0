Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F2162354
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 10:27:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3z7D-0006Gp-Pl; Tue, 18 Feb 2020 09:24:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Fj48=4G=amazon.co.uk=prvs=310c99ada=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j3z7C-0006Gk-QZ
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 09:24:26 +0000
X-Inumbo-ID: 7462bfe6-5230-11ea-bc8e-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7462bfe6-5230-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1582017866; x=1613553866;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PvHawHkXbF5BOj8gqQzR/PnRpiKoED1Vw0tLV3GYIIU=;
 b=kxGE3Z0hxltq4yBNUCSq+ETDRWfhlD97Oc7yCTe0kZHcDhmvlW7qWfXR
 SKxAo6IMSE9ep6wMwiVUsX9cqPMrN68Fckdj6jJ4gJd7QaXwHLqEbB78f
 bgu9f0g8lYR354bMd84ZonU19MdRYz5/UfzsJNEHseRwxPcQVJJW1/UlB I=;
IronPort-SDR: ecN8F3Jhu97mfRg0Rhxq7dWyc1eWWNXR0nEhdthitJgQKvDd9ME8+3ukc1J+WnZ//sNu4cMKsW
 sJg2H46GqvMg==
X-IronPort-AV: E=Sophos;i="5.70,456,1574121600"; d="scan'208";a="27059779"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 18 Feb 2020 09:24:23 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2c-6f38efd9.us-west-2.amazon.com (Postfix) with ESMTPS
 id 3695BA122A; Tue, 18 Feb 2020 09:24:23 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 18 Feb 2020 09:24:22 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 18 Feb 2020 09:24:22 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 18 Feb 2020 09:24:21 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Ian Jackson <ian.jackson@citrix.com>
Thread-Topic: [PATCH v5 4/7] libxl: add infrastructure to track and query
 'recent' domids
Thread-Index: AQHV2Edj2Y4aRNX6R0WUrn5yoGU0TKgfws+AgAECVOA=
Date: Tue, 18 Feb 2020 09:24:21 +0000
Message-ID: <8bc8f849a5224c25a5567554c2fe8dda@EX13D32EUC003.ant.amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-5-pdurrant@amazon.com>
 <24138.53407.680649.217122@mariner.uk.xensource.com>
In-Reply-To: <24138.53407.680649.217122@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.171]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 4/7] libxl: add infrastructure to track
 and query 'recent' domids
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDE3IEZlYnJ1YXJ5IDIwMjAgMTc6NDMKPiBUbzogRHVy
cmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPgo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IFdlaSBMaXUgPHdsQHhlbi5vcmc+OyBBbnRob255IFBlcmFyZAo+IDxh
bnRob255LnBlcmFyZEBjaXRyaXguY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgNC83XSBs
aWJ4bDogYWRkIGluZnJhc3RydWN0dXJlIHRvIHRyYWNrIGFuZCBxdWVyeQo+ICdyZWNlbnQnIGRv
bWlkcwo+IAo+IFBhdWwgRHVycmFudCB3cml0ZXMgKCJbUEFUQ0ggdjUgNC83XSBsaWJ4bDogYWRk
IGluZnJhc3RydWN0dXJlIHRvIHRyYWNrCj4gYW5kIHF1ZXJ5ICdyZWNlbnQnIGRvbWlkcyIpOgo+
ID4gQSBkb21pZCBpcyBjb25zaWRlcmVkIHJlY2VudCBpZiB0aGUgZG9tYWluIGl0IHJlcHJlc2Vu
dHMgd2FzIGRlc3Ryb3llZAo+ID4gbGVzcyB0aGFuIGEgc3BlY2lmaWVkIG51bWJlciBvZiBzZWNv
bmRzIGFnby4gRm9yIGRlYnVnZ2luZyBhbmQvb3IKPiB0ZXN0aW5nCj4gPiBwdXJwb3NlcyB0aGUg
bnVtYmVyIGNhbiBiZSBzZXQgdXNpbmcgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlCj4gPiBMSUJY
TF9ET01JRF9SRVVTRV9USU1FT1VULiBJZiB0aGUgdmFyaWFibGUgZG9lcyBub3QgZXhpc3QgdGhl
biBhIGRlZmF1bHQKPiA+IHZhbHVlIG9mIDYwcyBpcyB1c2VkLgo+ID4KPiA+IFdoZW5ldmVyIGEg
ZG9tYWluIGlzIGRlc3Ryb3llZCwgYSB0aW1lLXN0YW1wZWQgcmVjb3JkIHdpbGwgYmUgd3JpdHRl
bgo+IGludG8KPiA+IGEgaGlzdG9yeSBmaWxlICgvdmFyL3J1bi94ZW4vZG9taWQtaGlzdG9yeSku
IFRvIGF2b2lkIHRoZSBoaXN0b3J5IGZpbGUKPiA+IGdyb3dpbmcgdG9vIGxhcmdlLCBhbnkgcmVj
b3JkcyB3aXRoIHRpbWUtc3RhbXBzIHRoYXQgaW5kaWNhdGUgdGhhdCB0aGUKPiA+IGFnZSBvZiBh
IGRvbWlkIGhhcyBleGNlZWRlZCB0aGUgcmUtdXNlIHRpbWVvdXQgd2lsbCBhbHNvIGJlIHB1cmdl
ZC4KPiA+Cj4gPiBBIG5ldyB1dGlsaXR5IGZ1bmN0aW9uLCBsaWJ4bF9faXNfcmVjZW50X2RvbWlk
KCksIGhhcyBiZWVuIGFkZGVkLiBUaGlzCj4gPiBmdW5jdGlvbiByZWFkcyB0aGUgc2FtZSBoaXN0
b3J5IGZpbGUgY2hlY2tpbmcgd2hldGhlciBhIHNwZWNpZmllZCBkb21pZAo+ID4gaGFzIGEgcmVj
b3JkIHRoYXQgZG9lcyBub3QgZXhjZWVkIHRoZSByZS11c2UgdGltZW91dC4gU2luY2UgdGhpcyB1
dGlsaXR5Cj4gPiBmdW5jdGlvbiBkb2VzIG5vdCB3cml0ZSB0byB0aGUgZmlsZSwgbm8gcmVjb3Jk
cyBhcmUgYWN0dWFsbHkgcHVyZ2VkIGJ5Cj4gaXQuCj4gCj4gVGhhbmtzIGZvciB0aGlzLiAgU29y
cnkgZm9yIHRoZSBkZWxheSBpbiByZXZpZXdpbmcgaXQuCj4gCj4gSSdtIGFmcmFpZCBJIHN0aWxs
IGhhdmUgc29tZSBjb21tZW50cyBhYm91dCBlcnJvciBoYW5kbGluZyBldGMuCj4gCj4gPiAraW50
IGxpYnhsX2NsZWFyX2RvbWlkX2hpc3RvcnkobGlieGxfY3R4ICpjdHgpOwo+IAo+IEkgdGhpbmsg
dGhpcyBuZWVkcyBhIGNsZWFyIGRvYyBjb21tZW50IHNheWluZyBpdCBpcyBmb3IgdXNlIGluIGhv
c3QKPiBpbml0aWFsaXNhdGlvbiBvbmx5LiAgSWYgaXQgaXMgcnVuIHdpdGggYW55IGRvbWFpbnMg
cnVubmluZywgb3IKPiBjb25jdXJyZW50IGxpYnhsIHByb2Nlc3NlcywgdGhpbmdzIG1heSBtYWxm
dW5jdGlvbi4KCk9rLiBOb3Qgc3VyZSBwcmVjaXNlbHkgd2hhdCB5b3UgbWVhbiBieSAnZG9jIGNv
bW1lbnQnLi4uIERvIG1lYW4gYSBjb21tZW50IGluIHRoZSBoZWFkZXIganVzdCBhYm92ZSB0aGlz
IGRlY2xhcmF0aW9uIG9yIGVsc2V3aGVyZT8KCj4gCj4gPiArc3RhdGljIGJvb2wgbGlieGxfX3Jl
YWRfcmVjZW50KEZJTEUgKmYsIHVuc2lnbmVkIGxvbmcgKnNlYywKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICpkb21pZCkKPiA+ICt7Cj4gPiArICAgIGlu
dCBuOwo+ID4gKwo+ID4gKyAgICBhc3NlcnQoZik7Cj4gPiArCj4gPiArICAgIG4gPSBmc2NhbmYo
ZiwgIiVsdSAldSIsIHNlYywgZG9taWQpOwo+ID4gKyAgICBpZiAobiA9PSBFT0YpCj4gPiArICAg
ICAgICByZXR1cm4gZmFsc2U7Cj4gCj4gTWlzc2luZyBlcnJvciBoYW5kbGluZyBpbiBjYXNlIG9m
IHJlYWQgZXJyb3IuCgonbWFuIGZzY2FuZicgdGVsbHMgbWU6CgoiVGhlICB2YWx1ZSBFT0YgaXMg
cmV0dXJuZWQgaWYgdGhlIGVuZCBvZiBpbnB1dCBpcyByZWFjaGVkIGJlZm9yZSBlaXRoZXIgdGhl
IGZpcnN0IHN1Y+KAkAogY2Vzc2Z1bCBjb252ZXJzaW9uIG9yIGEgbWF0Y2hpbmcgZmFpbHVyZSBv
Y2N1cnMuICBFT0YgaXMgYWxzbyByZXR1cm5lZCBpZiBhIHJlYWQgZXJyb3IKIG9jY3VycywgIGlu
ICB3aGljaCBjYXNlIHRoZSBlcnJvciBpbmRpY2F0b3IgZm9yIHRoZSBzdHJlYW0gKHNlZSBmZXJy
b3IoMykpIGlzIHNldCwgYW5kCiBlcnJubyBpcyBzZXQgdG8gaW5kaWNhdGUgdGhlIGVycm9yLiIK
ClNvIEVPRiBpcyBzZXQgaW4gYWxsIGVycm9yIGNhc2VzLiBXaGF0IGFtIEkgbWlzc2luZz8KCj4g
Cj4gPiArICAgIGVsc2UgaWYgKG4gIT0gMikgLyogbWFsZm9ybWVkIGVudHJ5ICovCj4gPiArICAg
ICAgICAqZG9taWQgPSBJTlZBTElEX0RPTUlEOwo+IAo+IEJvdGggY2FsbCBzaXRlcyBmb3IgdGhp
cyBmdW5jdGlvbiBoYXZlIG9wZW4tY29kZWQgY2hlY2tzIGZvciB0aGlzCj4gcmV0dXJuIGNhc2Us
IHdoZXJlIHRoZXkganVzdCBnbyByb3VuZCBhZ2Fpbi4gIEkgdGhpbmsKPiBsaWJ4bF9fcmVhZF9y
ZWNlbnQgc2hvdWxkIGhhbmRsZSB0aGlzIGl0c2VsZiwgZmFjdG9yaW5nIHRoZSBjb21tb24KPiBj
b2RlIGludG8gdGhpcyBmdW5jdGlvbiBhbmQgYXZvaWRpbmcgdGhhdCBzcGVjaWFsIGNhc2UuCgpP
ay4gSSB0aG91Z2h0IGl0IHdhcyBtb3JlIGludHVpdGl2ZSB0byBoYXZlIHRoZSBmdW5jdGlvbiBv
bmx5IGV2ZXIgcmVhZCBhIHNpbmdsZSBlbnRyeSBmcm9tIHRoZSBmaWxlLCBidXQgSSBjYW4gZWFz
aWx5IGFkZCB0aGUgcmV0cnkgbG9vcCBpZiB5b3UgcHJlZmVyLgoKPiAKPiA+ICsgICAgcmV0dXJu
IHRydWU7Cj4gCj4gSSB0aGluayB0aGlzIGZ1bmN0aW9uIHNob3VsZCByZXR1cm4gYW4gcmMuICBJ
dCBjb3VsZCBzaWduYWwgRU9GIGJ5Cj4gc2V0dGluZyAqZG9taWQgdG8gSU5WQUxJRF9ET01JRCBt
YXliZSwgYW5kIGVycm9ycyBieSByZXR1cm5pbmcKPiBFUlJPUl9GQUlMLgoKT2suIEkgdGhvdWdo
dCBpdCB3YXMgc2xpZ2h0bHkgcG9pbnRsZXNzIHRvIGRvIHRoYXQuCgo+IAo+ID4gK3N0YXRpYyBi
b29sIGxpYnhsX193cml0ZV9yZWNlbnQoRklMRSAqZiwgdW5zaWduZWQgbG9uZyBzZWMsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgZG9taWQpCj4gPiAr
ewo+ID4gKyAgICBhc3NlcnQoZik7Cj4gCj4gVGhpcyBpcyByYXRoZXIgcG9pbnRsZXNzLiAgUGxl
YXNlIGRyb3AgaXQuCj4gCgpJZiB5b3UgdGhpbmsgc28sIG9rLgoKPiA+ICsgICAgYXNzZXJ0KGxp
YnhsX2RvbWlkX3ZhbGlkX2d1ZXN0KGRvbWlkKSk7Cj4gCj4gSSBkb3VidCB0aGlzIGlzIHJlYWxs
eSBuZWVkZWQgYnV0IEkgZG9uJ3QgbWluZCBpdCBpZiB5b3UgbXVzdC4KPiAKPiA+ICsgICAgcmV0
dXJuIGZwcmludGYoZiwgIiVsdSAldVxuIiwgc2VjLCBkb21pZCkgPiAwOwo+IAo+IFdyb25nIGVy
cm9yIGhhbmRsaW5nLiAgVGhpcyBmdW5jdGlvbiBzaG91bGQgcmV0dXJuIHJjLiAgZnByaW50Zgo+
IGRvZXNuJ3QgcmV0dXJuIGEgYm9vbGVhbi4KCkFuZCBub3IgZG9lcyB0aGlzIGNvZGUgZXhwZWN0
IGl0IHRvIChzaW5jZSBpdCB0ZXN0cyBmb3IgJz4gMCcpLgoKPiAgU29tZXRoaW5nIHNob3VsZCBs
b2cgZXJybm8gKHdpdGggTE9HRQo+IHByb2JhYmx5KSBpZiBmcHJpbnRmIGZhaWxzLgoKSSBjYW4g
c2VlIHlvdSBkaXNsaWtlIGJvb2xlYW4gZnVuY3Rpb25zOyBJJ2xsIHJldHVybiBhbiBlcnJvciBh
cyB5b3UgZGVzaXJlLgoKPiAKPiA+ICtzdGF0aWMgaW50IGxpYnhsX19tYXJrX2RvbWlkX3JlY2Vu
dChsaWJ4bF9fZ2MgKmdjLCB1aW50MzJfdCBkb21pZCkKPiA+ICt7Cj4gPiArICAgIGxvbmcgdGlt
ZW91dCA9IGxpYnhsX19nZXRfZG9taWRfcmV1c2VfdGltZW91dCgpOwo+ID4gKyAgICBsaWJ4bF9f
ZmxvY2sgKmxvY2s7Cj4gCj4gUGxlYXNlIGluaXRpYWxpc2UgbG9jayA9IE5VTEwgc28gdGhhdCBp
dCBpcyBlYXN5IHRvIHNlZSB0aGF0IHRoZSBvdXQKPiBibG9jayBpcyBjb3JyZWN0Lgo+IAo+IChT
ZWUgdG9vbHMvbGlieGwvQ09ESU5HX1NUWUxFIHdoZXJlIHRoaXMgaXMgZGlzY3Vzc2VkLikKPiAK
Ck9rLiBYZW4gc3R5bGUgZ2VuZXJhbGx5IGF2b2lkcyBpbml0aWFsaXplcnMgd2hlcmUgbm90IHN0
cmljdGx5IG5lY2Vzc2FyeS4KCj4gPiArICAgIGNoYXIgKm9sZCwgKm5ldzsKPiA+ICsgICAgRklM
RSAqb2YgPSBOVUxMLCAqbmYgPSBOVUxMOwo+ID4gKyAgICBzdHJ1Y3QgdGltZXNwZWMgdHM7Cj4g
PiArICAgIGludCByYyA9IEVSUk9SX0ZBSUw7Cj4gCj4gUGxlYXNlIGRvIG5vdCBzZXQgcmMgdG8g
RVJST1JfRkFJTCBsaWtlIHRoaXMuICBMZWF2ZSBpdCB1bmRlZmluZWQuCj4gU2V0IGl0IG9uIGVh
Y2ggZXhpdCBwYXRoLiAgKElmIHlvdSBhcmUgY2FsbGluZyBhIGZ1bmN0aW9uIHRoYXQgcmV0dXJu
cwo+IGFuIHJjLCB5b3UgY2FuIHB1dCBpdCBpbiByYywgYW5kIHRoZW4gdGVzdCByYyBhbmQgZ290
byBvdXQgd2l0aG91dAo+IGFzc2lnbm1lbnQuKQo+IAo+IChBZ2Fpbiwgc2VlIHRvb2xzL2xpYnhs
L0NPRElOR19TVFlMRSB3aGVyZSB0aGlzIGlzIGRpc2N1c3NlZC4pCj4gCgpPay4KCj4gPiArICAg
IGxvY2sgPSBsaWJ4bF9fbG9ja19kb21pZF9oaXN0b3J5KGdjKTsKPiA+ICsgICAgaWYgKCFsb2Nr
KSB7Cj4gPiArICAgICAgICBMT0dFRChFUlJPUiwgZG9taWQsICJmYWlsZWQgdG8gYWNxdWlyZSBs
b2NrIik7Cj4gPiArICAgICAgICBnb3RvIG91dDsKPiA+ICsgICAgfQo+ID4gKwo+ID4gKyAgICBv
bGQgPSBsaWJ4bF9fZG9taWRfaGlzdG9yeV9wYXRoKGdjLCBOVUxMKTsKPiA+ICsgICAgb2YgPSBm
b3BlbihvbGQsICJyIik7Cj4gPiArICAgIGlmICghb2YgJiYgZXJybm8gIT0gRU5PRU5UKQo+ID4g
KyAgICAgICAgTE9HRUQoV0FSTiwgZG9taWQsICJmYWlsZWQgdG8gb3BlbiAnJXMnIiwgb2xkKTsK
PiAKPiBUaGlzIGZvcGVuIGNvZGUgYW5kIGl0cyBlcnJvciBoYW5kbGluZyBpcyBzdGlsbCBkdXBs
aWNhdGVkIGJldHdlZW4KPiBsaWJ4bF9fbWFya19kb21pZF9yZWNlbnQgYW5kIGxpYnhsX19pc19k
b21pZF9yZWNlbnQuIAoKVGhhdCdzIG5vdCBxdWl0ZSB0cnVlLiBUaGUgZXJyb3Igc2VtYW50aWNz
IGFyZSBkaWZmZXJlbnQ7IHRoZSBmb3JtZXIgZG9lcyBub3QgdG9sZXJhdGUgYSBmYWlsdXJlIHRv
IG9wZW4gdGhlIGZpbGUsIHRoZSBsYXR0ZXIgZG9lcy4KCj4gSSBtZWFudCBmb3IgeW91Cj4gdG8g
ZmFjdG9yIGl0IG91dC4gIExpa2V3aXNlIHRoZSBvdGhlciBkdXBsaWNhdGVkIGNvZGUgaW4gdGhl
c2UgdHdvCj4gZnVuY3Rpb25zLiAgSSB3YW50IHRoZXJlIHRvIGJlIG5vdGhpbmcgZHVwbGljYXRl
ZCB0aGF0IGNhbiBiZSB3cml0dGVuCj4gb25jZS4KCkknbSBub3Qgc3VyZSBob3cgeW91IHdhbnQg
bWUgdG8gY29tYmluZSB0aGVtLCBnaXZlbiB0aGUgZGlmZmVyaW5nIHNlbWFudGljcy4KCj4gCj4g
QWxzbyBmYWlsdXJlIHRvIG9wZW4gdGhlIGZpbGUgc2hvdWxkIGJlIGFuIGVycm9yLCByZXN1bHRp
bmcgZmFpbHVyZSBvZgo+IHRoaXMgZnVuY3Rpb24gYW5kIHRoZSB3aG9sZSBzdXJyb3VuZGluZyBv
cGVyYXRpb24sIG5vdCBzaW1wbHkgcHJvZHVjZQo+IGEgd2FybmluZyBpbiBzb21lIGxvZ2ZpbGUg
d2hlcmUgaXQgd2lsbCBiZSBpZ25vcmVkLgoKQnV0IHRoYXQgd2lsbCBjYXVzZSBhIGZhaWx1cmUg
d2hlbiB0cnlpbmcgdG8gY3JlYXRlIHRoZSBmaXJzdCBkb21haW4gYWZ0ZXIgYm9vdCwgc2luY2Ug
dGhlIGZpbGUgd29uJ3QgZXhpc3QuCgo+IAo+ID4gKyAgICAgICAgd2hpbGUgKGxpYnhsX19yZWFk
X3JlY2VudChvZiwgJnNlYywgJnZhbCkpIHsKPiA+ICsgICAgICAgICAgICBpZiAoIWxpYnhsX2Rv
bWlkX3ZhbGlkX2d1ZXN0KHZhbCkpCj4gPiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOyAvKiBJ
Z25vcmUgaW52YWxpZCBlbnRyaWVzICovCj4gPiArCj4gPiArICAgICAgICAgICAgaWYgKHRzLnR2
X3NlYyAtIHNlYyA+IHRpbWVvdXQpCj4gPiArICAgICAgICAgICAgICAgIGNvbnRpbnVlOyAvKiBJ
Z25vcmUgZXhwaXJlZCBlbnRyaWVzICovCj4gPiArCj4gPiArICAgICAgICAgICAgaWYgKCFsaWJ4
bF9fd3JpdGVfcmVjZW50KG5mLCBzZWMsIHZhbCkpIHsKPiA+ICsgICAgICAgICAgICAgICAgTE9H
RUQoRVJST1IsIGRvbWlkLCAiZmFpbGVkIHRvIHdyaXRlIHRvICclcyciLCBuZXcpOwo+ID4gKyAg
ICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsgICAgICAgICAgICB9Cj4gPiArICAgICAgICB9
Cj4gPiArICAgICAgICBpZiAoZmVycm9yKG9mKSkgewo+ID4gKyAgICAgICAgICAgIExPR0VEKEVS
Uk9SLCBkb21pZCwgImZhaWxlZCB0byByZWFkIGZyb20gJyVzJyIsIG9sZCk7Cj4gPiArICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gPiArICAgICAgICB9Cj4gCj4gT2gsIHdhaXQsIGhlcmUgaXMgb25l
IG9mIHRoZSBtaXNzaW5nIHBpZWNlcyBvZiBlcnJvciBoYW5kbGluZyA/Cj4gUGxlYXNlIHB1dCBp
dCB3aGVyZSBpdCBiZWxvbmdzLCBuZXh0IHRvIHRoZSBjb3JyZXNwb25kaW5nIGNhbGwuCj4gCj4g
PiArICAgIGlmIChvZiAmJiBmY2xvc2Uob2YpID09IEVPRikgewo+ID4gKyAgICAgICAgTE9HRUQo
RVJST1IsIGRvbWlkLCAiZmFpbGVkIHRvIGNsb3NlICclcyciLCBvbGQpOwo+IAo+IEkgZG9uJ3Qg
c2VlIGhvdyBvZiB3b3VsZCBiZSBOVUxMIGhlcmUuCj4gCgpJdCB3aWxsIGJlIE5VTEwgaWYgdGhl
IGZpbGUgZGlkIG5vdCBleGlzdCwgd2hpY2ggd2lsbCBiZSB0aGUgY2FzZSB1bnRpbCB0aGUgZmly
c3QgZG9tYWluIGRlc3RydWN0aW9uIG9jY3Vycy4KCiAgUGF1bAoKPiBUaGFua3MsCj4gSWFuLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
