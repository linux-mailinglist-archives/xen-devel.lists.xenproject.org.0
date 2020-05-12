Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D55221CF30E
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 13:06:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYSjN-0000eZ-Fr; Tue, 12 May 2020 11:05:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XDyx=62=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYSjL-0000eT-Uc
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 11:05:48 +0000
X-Inumbo-ID: 87471a9c-9440-11ea-a28b-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 87471a9c-9440-11ea-a28b-12813bfff9fa;
 Tue, 12 May 2020 11:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589281546;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=bsvc5OkKSrVvGeEPB+neIoYMqkJLthxyQFEIp5Ci5JI=;
 b=QHKxj8Lvfqau7wMd+3kbWFHz1v33pP8ief7Md2cPvr3twVJraJEjpkn3
 7DSNxtWXe7oDaWqbI3PHXierkN4tm8/MOm8EkL3Xx0rEYgxOgS+kQx+wB
 cyOkqxzyYmoI6QG5P4Hy9H1so4g2V43+TpxCIVpg5GsBkyiWcxr17dcQd 4=;
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: VW/hK7HEe6VpHT7pchFaIkU/0wnsQ+4XhPam97BV0iT7hyxbbJVMIBMbVspOBXhvXnoBPazCL6
 IBV4myy+0iqJOlWqSy7Wc8gIW2QpOQ5mCZsa5BASETbD8O7yHI70efGNFlIr473BpHxozPy8OO
 eRdCjV4sb3a2kRI3SqAU54NZ2bOjHQ6TwG7mzNz+eS5yXMo3P+e/GIXq65+mhFlGXm3QrxFATa
 dgdVKArtgrx1PxKxRhE4nxT8sRpV2uQQ9KkDNj5KQEFJ4aUpbtGu5Q90r6mDLgJHGh8XoW80E5
 +s0=
X-SBRS: 2.7
X-MesageID: 17566535
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,383,1583211600"; d="scan'208";a="17566535"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
Thread-Topic: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from
 the menuconfig directly
Thread-Index: AQHWHvtEfLlMb5EF90y7GzIGxHVxJ6iRncgAgAYL5QCAABeggIAC9dcAgAILiACABg54AIAAAuMAgAAExoCAAAK+AIAAASKAgAAA7oCAADIoAIAA69aAgAAvjYCAAAH0AIAADHgAgAAA1YCAAACngA==
Date: Tue, 12 May 2020 11:05:41 +0000
Message-ID: <8B924F4F-197A-4951-9A14-B15164D3BB27@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
 <4017f7f0-744b-70ff-8fa4-b33c53a8b9e2@suse.com>
 <ca115637-5e84-2990-65e8-e2f04ec0ddb5@xen.org>
 <803876ce-503a-2e97-f310-0413e515970b@suse.com>
 <bbc12f81-7854-ad72-63ee-3ec94b378bf9@xen.org>
 <bf6a9ed3-fd7e-c588-9f72-8084dab1f556@suse.com>
 <24249.34804.568523.847077@mariner.uk.xensource.com>
 <88487e23-88f7-2ce8-8292-7e97ed8902c5@suse.com>
 <8dc17648-c669-eec7-2ecd-81245fa8d517@xen.org>
 <cabaa3f1-5eca-c7a5-e819-1c7487c4add1@suse.com>
 <71e63752-b6b0-9578-e79a-0bef30a7c50a@xen.org>
 <b292694a-cc82-f844-6312-f2b13f7a55ba@suse.com>
In-Reply-To: <b292694a-cc82-f844-6312-f2b13f7a55ba@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <D36C0768583CD94E91D0B30222CCB518@citrix.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDEyLCAyMDIwLCBhdCAxMjowMyBQTSwgSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPiB3cm90ZToNCj4gDQo+IFtDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERPIE5P
VCByZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBoYXZl
IHZlcmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+
IE9uIDEyLjA1LjIwMjAgMTM6MDAsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4+IEhpIEphbiwNCj4+
IA0KPj4gT24gMTIvMDUvMjAyMCAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4gT24gMTIu
MDUuMjAyMCAxMjowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBPbiAxMi8wNS8yMDIwIDA4
OjE4LCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDExLjA1LjIwMjAgMTk6MTQsIElhbiBK
YWNrc29uIHdyb3RlOg0KPj4+Pj4+IEphbiBCZXVsaWNoIHdyaXRlcyAoIlJlOiBbUEFUQ0ggUkVT
RU5EIDIvMl0geGVuOiBBbGxvdyBFWFBFUlQgbW9kZSB0byBiZSBzZWxlY3RlZCBmcm9tIHRoZSBt
ZW51Y29uZmlnIGRpcmVjdGx5Iik6DQo+Pj4+Pj4+IEknbSB0cnlpbmcgdG8gbWFrZSB0aGUgcG9p
bnQgdGhhdCB5b3VyIHBhdGNoLCB0byBtZSwgbG9va3MgdG8gYmUNCj4+Pj4+Pj4gdHJ5aW5nIHRv
IG92ZXJjb21lIGEgcHJvYmxlbSBmb3Igd2hpY2ggd2UgaGF2ZSBoYWQgYSBzb2x1dGlvbiBhbGwN
Cj4+Pj4+Pj4gdGhlIHRpbWUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gVGhhbmtzIGZvciB0aGlzIGNsZWFy
IHN0YXRlbWVudCBvZiB5b3VyIG9iamVjdGlvbi4gIEknbSBhZnJhaWQgSSBkb24ndA0KPj4+Pj4+
IGFncmVlLiAgRXZlbiB0aG91Z2ggLmNvbmZpZyBleGlzdHMgKGFuZCBpcyBldmVuIHVzZWQgYnkg
b3NzdGVzdCwgc28gSQ0KPj4+Pj4+IGtub3cgYWJvdXQgaXQpIEkgZG9uJ3QgdGhpbmsgaXQgaXMg
YXMgZ29vZCBhcyBoYXZpbmcgaXQgaW4NCj4+Pj4+PiBtZW51Y29uZmlnLg0KPj4+Pj4gDQo+Pj4+
PiBCdXQgeW91IHJlYWxpemUgdGhhdCBteSBvYmplY3Rpb24gaXMgKHdhcykgbW9yZSB0b3dhcmRz
IHRoZSByZWFzb25pbmcNCj4+Pj4+IGJlaGluZCB0aGUgY2hhbmdlLCB0aGFuIHRvd2FyZHMgdGhl
IGNoYW5nZSBpdHNlbGYuIElmLCBhcyBhIGNvbW11bml0eSwNCj4+Pj4+IHdlIGRlY2lkZSB0byB1
bmRvIHdoYXQgd2UgbWlnaHQgbm93IGNhbGwgYSBtaXN0YWtlLCBhbmQgaWYgd2UncmUgcmVhZHkN
Cj4+Pj4+IHRvIGRlYWwgd2l0aCB0aGUgY29uc2VxdWVuY2VzLCBzbyBiZSBpdC4NCj4+Pj4gDQo+
Pj4+IFdvdWxkIHlvdSBtaW5kIHRvIGV4cGxhaW4gdGhlIGZhbGwgb3V0IHlvdSBleHBlY3QgZnJv
bSB0aGlzIHBhdGNoPyBBcmUNCj4+Pj4geW91IHdvcnJ5IG1vcmUgcGVvcGxlIG1heSBjb250YWN0
IHNlY3VyaXR5QHhlbi5vcmcgZm9yIG5vbi1zZWN1cml0eSBpc3N1ZT8NCj4+PiANCj4+PiBUaGF0
J3Mgb25lIHBvc3NpYmxlIHRoaW5nIHRoYXQgbWlnaHQgaGFwcGVuLiBCdXQgZXZlbiBtb3JlIGdl
bmVyYWxseQ0KPj4+IHRoZSBsaWtlbGlob29kIHdpbGwgaW5jcmVhc2UgdGhhdCBwZW9wbGUgcmVw
b3J0IGlzc3VlcyB3aXRob3V0IHBheWluZw0KPj4+IGF0dGVudGlvbiB0aGF0IHRoZXkgZGVwZW5k
IG9uIHRoZWlyIGNob2ljZSBvZiBjb25maWd1cmF0aW9uLg0KPj4gSSBhZ3JlZSB0aGF0IHlvdSBh
cmUgZ29pbmcgdG8gZ2V0IG1vcmUgcmVwb3J0IGJlY2F1c2UgdGhlcmUgYXJlIG1vcmUgDQo+PiB1
c2VycyB0byB0cnkgbmV3IHRoaW5ncy4gU28gaW5ldml0ZW50bHksIHlvdSB3aWxsIGdldCBtb3Jl
IGluY29tcGxldGUgDQo+PiByZXBvcnQuIFRoaXMgaXMgYWx3YXlzIHRoZSBkb3duc2lkZSBvZiBh
bGxvd2luZyBtb3JlIGZsZXhpYmlsaXR5Lg0KPj4gDQo+PiBCdXQgd2UgYWxzbyBuZWVkIHRvIGxv
b2sgYXQgdGhlIHVwc2lkZS4gSSBjYW4gc2VlIDIgYWR2YW50YWdlczoNCj4+ICAgICAxKSBJdCB3
aWxsIGJlIGVhc2llciB0byB0cnkgdXBjb21pbmcgZmVhdHVyZXMgKGUuZyBBcmdvKS4gVGhlIG1v
cmUgDQo+PiB0ZXN0aW5nIGFuZCBpbnB1dCwgdGhlIG1vcmUgY2hhbmNlIGEgZmVhdHVyZSB3aWxs
IGJlIGEgc3VjY2Vzcy4NCj4+ICAgICAyKSBJdCB3aWxsIGJlIGVhc2llciB0byB0YWlsb3IgWGVu
IChzdWNoIGFzIGJ1aWx0LWluIGNvbW1hbmQgbGluZSkuDQo+PiANCj4+IEluIGJvdGggY2FzZXMs
IHlvdSBtYWtlIFhlbiBtb3JlIGNvbXBlbGxpbmcgYmVjYXVzZSB5b3UgYWxsb3cgdG8gDQo+PiBl
eHBlcmltZW50IGFuZCBtYWtlIGl0IG1vcmUgZmxleGlibGUuIElITU8sIHRoaXMgaXMgb25lIG9m
IHRoZSBiZXN0IHdheSANCj4+IHRvIGF0dHJhY3QgdXNlcnMgYW5kIHBvc3NpYmxlIG5ldyBjb250
cmlidXRvcnMvcmV2aWV3ZXJzIHRvIFhlbiBjb21tdW5pdHkuDQo+IA0KPiBJJ20gZnVsbHkgYXdh
cmUgb2YgdGhlIHVwc2lkZXMuDQo+IA0KPj4+IFdlJ2xsDQo+Pj4gaGF2ZSB0byBib3RoIHRha2Ug
dGhpcyBpbnRvIGNvbnNpZGVyYXRpb24gYW5kIGFzayBiYWNrIGZvciB0aGUNCj4+PiBzcGVjaWZp
YyAuY29uZmlnIHRoZXkndmUgdXNlZC4NCj4+IENvcnJlY3QgbWUgaWYgSSBhbSB3cm9uZywgYnV0
IHRoaXMgaXMgbm90IHZlcnkgc3BlY2lmaWMgdG8gRVhQRVJUIG1vZGUuIA0KPj4gWW91IGNhbiBh
bHJlYWR5IHNlbGVjdCBkaWZmZXJlbnQgb3B0aW9ucyB0aGF0IHdpbGwgYWZmZWN0IHRoZSBiZWhh
dmlvciANCj4+IG9mIHRoZSBoeXBlcnZpc29yLiBGb3IgaW5zdGFuY2UsIG9uIHg4NiwgeW91IGNh
biBkaXNhYmxlIFBWIGd1ZXN0IA0KPj4gc3VwcG9ydC4gSG93IGRvIHlvdSBmaWd1cmUgdGhhdCBv
dXQgdG9kYXkgd2l0aG91dCBhc2tpbmcgdGhlIC5jb25maWc/DQo+IA0KPiBJIGRpZG4ndCBzYXkg
dGhpcyBpcyBhIG5ldyBwcm9ibGVtOyBJIGluZGljYXRlZCB0aGlzIGlzIGdvaW5nIHRvDQo+IGJl
Y29tZSBtb3JlIGxpa2VseSB0byBiZSBvbmUuDQoNCkkgZmVlbCBsaWtlIHRoZXJl4oCZcyBhIG1p
c3VuZGVyc3RhbmRpbmcgaGVyZSDigJQgSmFuLCBhcmUgeW91IHNpbXBseSBleHBsYWluaW5nIHlv
dXJzZWxmIGFuZC9vciBtYWtpbmcgc3VyZSB0aGF0IHdlIGFsbCB1bmRlcnN0YW5kIHRoZSBpbXBs
aWNhdGlvbnMgb2Ygb3VyIGNob2ljZT8gIE9yIGFyZSB5b3UgYXJndWluZyBhZ2FpbnN0IGFjY2Vw
dGFuY2UgaW4gYW4gaW1wbGljaXRseSBOYWNrLWluZyBtYW5uZXI/DQoNCkkgdW5kZXJzdG9vZCBK
YW4gdG8gYmUgZG9pbmcgdGhlIGZvcm1lcjsgYW5kIHRoYXQgYXMgc3VjaCB3aXRoIElhbuKAmXMg
YWNrLCB0aGlzIHBhdGNoICh3aXRoIHRoZSBtb2RpZmllZCBjb21taXQgbWVzc2FnZSkgY2FuIGdv
IGluLg0KDQogLUdlb3JnZQ0K

