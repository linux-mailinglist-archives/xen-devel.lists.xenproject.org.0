Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2883101D
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 16:25:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWiQ4-0006Hc-15; Fri, 31 May 2019 14:22:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=q4nb=T7=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hWiQ2-0006HX-KQ
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 14:22:06 +0000
X-Inumbo-ID: 7583f6ec-83af-11e9-b17d-1388e5386aa9
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7583f6ec-83af-11e9-b17d-1388e5386aa9;
 Fri, 31 May 2019 14:22:03 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@MIAPEX02MSOL01.citrite.net
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 23.29.105.83 as permitted
 sender) identity=mailfrom; client-ip=23.29.105.83;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:23.29.105.83 ip4:162.221.156.50 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@MIAPEX02MSOL01.citrite.net) identity=helo;
 client-ip=23.29.105.83; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@MIAPEX02MSOL01.citrite.net";
 x-conformance=sidf_compatible
IronPort-SDR: k0i/qd/aAIusveL561KiMguPMqIThjBHVsd6cfEp/mAxDqNgiHaCeC9Eyw9s4hv5S8pvslqGSR
 /3iMKDcQAbDVWZXtNWooLLPILYVZF7DXyxjU205EOn4mvLjNVahJcKuSMbci/OMeYY36Yk6jfg
 xaYslgGKodk9PwH2WLktveczDZ+7gIl1Uj9ggLRTroeb2aZky4ltuhoxRa2ShGW0kthlrrqTMx
 Su0PpISXO/ZHM/6yK2qZK6jjMUiOJphfQVzxy77ei4QjGYCWj9doMl3brCK6z4Ijj7mD6TjtFU
 a2g=
X-SBRS: 2.7
X-MesageID: 1161495
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 23.29.105.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.60,535,1549947600"; 
   d="scan'208";a="1161495"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>
Thread-Topic: [PATCH 4/5] iommu: introduce iommu_groups
Thread-Index: AQHVBaFRy03LVQmKMkuPdTuUm46mjKZsJTQAgBk+p7D//+VpAIAAIl5g
Date: Fri, 31 May 2019 14:21:57 +0000
Message-ID: <effeb9ace857427993a30f5575dc3a27@AMSPEX02CL03.citrite.net>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
 <20190508132403.1454-5-paul.durrant@citrix.com>
 <5CDC1F96020000780022F4BF@prv1-mh.provo.novell.com>
 <cb3fd070fa6748148dd4af032a7b6edc@AMSPEX02CL03.citrite.net>
 <5CF1368C02000078002340B4@prv1-mh.provo.novell.com>
In-Reply-To: <5CF1368C02000078002340B4@prv1-mh.provo.novell.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 4/5] iommu: introduce iommu_groups
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, Ian
 Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+PiA+IC0tLSBhL3hlbi9pbmNs
dWRlL3hlbi9wY2kuaAo+ID4+ID4gKysrIGIveGVuL2luY2x1ZGUveGVuL3BjaS5oCj4gPj4gPiBA
QCAtNzUsNiArNzUsOSBAQCBzdHJ1Y3QgcGNpX2RldiB7Cj4gPj4gPiAgICAgIHN0cnVjdCBsaXN0
X2hlYWQgYWxsZGV2c19saXN0Owo+ID4+ID4gICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGRvbWFpbl9s
aXN0Owo+ID4+ID4KPiA+PiA+ICsgICAgc3RydWN0IGxpc3RfaGVhZCBncnBkZXZzX2xpc3Q7Cj4g
Pj4KPiA+PiBEb2VzIHRoaXMgc2VwYXJhdGUgbGlzdCBwcm92aWRlIG11Y2ggdmFsdWU/IFRoZSBk
ZXZpY2VzIGluIGEgZ3JvdXAKPiA+PiBhcmUgZ29pbmcgdG8gbW92ZSBiZXR3ZWVuIHR3byBkb21h
aW5fbGlzdC1zIGFsbCBpbiBvbmUgZ28sIHNvCj4gPj4gb25jZSB5b3Uga25vdyB0aGUgZG9tYWlu
IG9mIG9uZSB5b3UnbGwgYmUgYWJsZSB0byBmaW5kIHRoZSByZXN0IGJ5Cj4gPj4gaXRlcmF0aW5n
IHRoYXQgZG9tYWluJ3MgbGlzdC4gSXMgdGhlIGZlYXIgdGhhdCBzdWNoIGFuIGl0ZXJhdGlvbiBt
YXkKPiA+PiBiZSB0ZW5zIG9mIHRob3VzYW5kcyBvZiBlbnRyaWVzIGxvbmcsIGFuZCBoZW5jZSBi
ZWNvbWUgYW4gaXNzdWUKPiA+PiB3aGVuIHRyYXZlcnNlZD8gSSBoYXZlIG5vIGlkZWEgaG93IG1h
bnkgUENJIGRldmljZXMgdGhlIGJpZ2dlc3QKPiA+PiBzeXN0ZW1zIHRvZGF5IHdvdWxkIGhhdmUs
IGJ1dCBpZiB0cmF2ZXJzYWwgd2FzIGFuIGlzc3VlLCB0aGVuIGl0Cj4gPj4gd291bGQgYWxyZWFk
eSBiZSB3aXRoIHRoZSBjb2RlIHdlJ3ZlIGdvdCBub3cuCj4gPgo+ID4gSSdkIHByZWZlciB0byBr
ZWVwIGl0Li4uIEl0IG1ha2VzIHRoZSByZS1pbXBsZW1lbnRhdGlvbiBvZiB0aGUgZG9tY3RsIGlu
IHRoZQo+ID4gbmV4dCBwYXRjaCBtb3JlIHN0cmFpZ2h0Zm9yd2FyZC4KPiAKPiBJIGNhbiBhY2Nl
cHQgdGhpcyBhcyB0aGUgcG9zaXRpdmUgc2lkZS4gQnV0IHRoZXJlJ3MgZXh0cmEgc3RvcmFnZQo+
IG5lZWRlZCAobm90IG11Y2gsIGJ1dCBhbnl3YXkpLCBhbmQgdGhlIG1vcmUgKGluZGVwZW5kZW50
KQo+IGxpc3RzIHdlIGhhdmUgdGhhdCBkZXZpY2VzIGNhbiBiZSBvbiwgdGhlIG1vcmUgbGlrZWx5
IGl0J2xsIGJlIHRoYXQKPiBvbmUgb2YgdGhlbSBnZXRzIHNjcmV3ZWQgdXAgYXQgc29tZSBwb2lu
dCAoZS5nLiBieSBmb3JnZXR0aW5nCj4gdG8gcmVtb3ZlIGEgZGV2aWNlIGZyb20gb25lIG9mIHRo
ZW0gcHJpb3IgdG8gZGUtYWxsb2NhdGlvbikuCgpPaywgSSdsbCBkcm9wIHRoZSBsaXN0IGFuZCBq
dXN0IG1hdGNoIG9uIHRoZSBncnAgcG9pbnRlci4KCiAgUGF1bAoKPiAKPiBKYW4KPiAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
