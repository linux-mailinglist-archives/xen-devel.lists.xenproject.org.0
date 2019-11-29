Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D4910D934
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2019 18:56:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iakSf-0007j1-Q4; Fri, 29 Nov 2019 17:53:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lFH5=ZV=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iakSd-0007iv-Uw
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2019 17:53:43 +0000
X-Inumbo-ID: 2e9e40a0-12d1-11ea-a55d-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e9e40a0-12d1-11ea-a55d-bc764e2007e4;
 Fri, 29 Nov 2019 17:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575050023;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=veA/rVQr2bAhBKppcOeURf85uiEmBeuHutu1uc+RB80=;
 b=IG9mgaabkY6ghRNeAUq/PbVpdc7it1dgCXVoqX3dIRwhLCIT+QtOYgBg
 V8ULiqSCbqFMOGvk04obwj7Nci6tvQg432731rBAnvrUClfR0js9h2fd0
 5gwEQWJlToHZtY7oX3nscrIwZc/h6Viv/m8JcYMLYYgqMjqHLwuqbY9T1 E=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: iWWO07u7rIq4RFbI4J1iQ5NMlWyannILB/HSQEwEQ5+bnEULr6MhDMdolzcSK2UgvCC5+eswZr
 jnUyvWaVbHaa9TYHtI7K9ki6or7XfhT+TFEkCnY02z22jcY8Vpfdj1A8peiliXDLwJ+ZIok7oC
 HbmTM+Gqt/Q53Tug5k23nfd/6JtuU6K9X2m0y6U/VFJkcKlgCV/Iun+qwqNP15N5hRkPbUvFh0
 0G6knZE1oxklV0mnhcJkJMNx5VcjLbN5wgXVKWjeeggkq1niaVkgMJhUlZ3SP4m5H3U0joL3Pv
 xPI=
X-SBRS: 2.7
X-MesageID: 9407141
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,258,1571716800"; 
   d="scan'208";a="9407141"
From: George Dunlap <George.Dunlap@citrix.com>
To: Wei Liu <wl@xen.org>
Thread-Topic: [PATCH-for-4.13 v7] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVptnuOnfN6XKqCE+bxaRAqrpDDKeiWIOAgAACS4CAAAKWgA==
Date: Fri, 29 Nov 2019 17:53:39 +0000
Message-ID: <45641766-DF1F-460A-8612-6D99D39683C3@citrix.com>
References: <20191129172445.32664-1-pdurrant@amazon.com>
 <20191129173611.skfu63d4kqcysnoi@debian>
 <20191129174423.hbzdjtcondvnbts2@debian>
In-Reply-To: <20191129174423.hbzdjtcondvnbts2@debian>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <40F622F5C707044E83D4F853F2DFE978@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH-for-4.13 v7] Rationalize max_grant_frames
 and max_maptrack_frames handling
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 George Dunlap <George.Dunlap@citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Jan
 Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTm92IDI5LCAyMDE5LCBhdCA1OjQ0IFBNLCBXZWkgTGl1IDx3bEB4ZW4ub3JnPiB3
cm90ZToNCj4gDQo+IE9uIEZyaSwgTm92IDI5LCAyMDE5IGF0IDA1OjM2OjExUE0gKzAwMDAsIFdl
aSBMaXUgd3JvdGU6DQo+PiBPbiBGcmksIE5vdiAyOSwgMjAxOSBhdCAwNToyNDo0NVBNICswMDAw
LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+Pj4gRnJvbTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPg0KPj4+IA0KPj4+IFhlbiB1c2VkIHRvIGhhdmUgc2luZ2xlLCBzeXN0
ZW0td2lkZSBsaW1pdHMgZm9yIHRoZSBudW1iZXIgb2YgZ3JhbnQNCj4+PiBmcmFtZXMgYW5kIG1h
cHRyYWNrIGZyYW1lcyBhIGd1ZXN0IHdhcyBhbGxvd2VkIHRvIGNyZWF0ZS4gSW5jcmVhc2luZw0K
Pj4+IG9yIGRlY3JlYXNpbmcgdGhpcyBzaW5nbGUgbGltaXQgb24gdGhlIFhlbiBjb21tYW5kLWxp
bmUgd291bGQgY2hhbmdlDQo+Pj4gdGhlIGxpbWl0IGZvciBhbGwgZ3Vlc3RzIG9uIHRoZSBzeXN0
ZW0uDQo+Pj4gDQo+Pj4gTGF0ZXIsIHBlci1kb21haW4gbGltaXRzIGZvciB0aGVzZSB2YWx1ZXMg
d2FzIGNyZWF0ZWQuIFRoZSBzeXN0ZW0td2lkZQ0KPj4+IGxpbWl0cyBiZWNhbWUgc3RyaWN0IGxp
bWl0czogZG9tYWlucyBjb3VsZCBub3QgYmUgY3JlYXRlZCB3aXRoIGhpZ2hlcg0KPj4+IGxpbWl0
cywgYnV0IGNvdWxkIGJlIGNyZWF0ZWQgd2l0aCBsb3dlciBsaW1pdHMuIEhvd2V2ZXIsIHRoYXQg
Y2hhbmdlDQo+Pj4gYWxzbyBpbnRyb2R1Y2VkIGEgcmFuZ2Ugb2YgZGlmZmVyZW50ICJkZWZhdWx0
IiB2YWx1ZXMgaW50byB2YXJpb3VzDQo+Pj4gcGxhY2VzIGluIHRoZSB0b29sc3RhY2s6DQo+Pj4g
DQo+Pj4gLSBUaGUgcHl0aG9uIGxpYnhjIGJpbmRpbmdzIGhhcmQtY29kZWQgdGhlc2UgdmFsdWVz
IHRvIDMyIGFuZCAxMDI0LA0KPj4+ICByZXNwZWN0aXZlbHkNCj4+PiAtIFRoZSBsaWJ4bCBkZWZh
dWx0IHZhbHVlcyBhcmUgMzIgYW5kIDEwMjQgcmVzcGVjdGl2ZWx5Lg0KPj4+IC0geGwgd2lsbCB1
c2UgdGhlIGxpYnhsIGRlZmF1bHQgZm9yIG1hcHRyYWNrLCBidXQgZG9lcyBpdHMgb3duIGRlZmF1
bHQNCj4+PiAgY2FsY3VsYXRpb24gZm9yIGdyYW50IGZyYW1lczogZWl0aGVyIDMyIG9yIDY0LCBi
YXNlZCBvbiB0aGUgbWF4DQo+Pj4gIHBvc3NpYmxlIG1mbi4NCj4+PiANCj4+PiBUaGVzZSBkZWZh
dWx0cyBpbnRlcmFjdCBwb29ybHkgd2l0aCB0aGUgaHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgbGlt
aXQ6DQo+Pj4gDQo+Pj4gLSBUaGUgaHlwZXJ2aXNvciBjb21tYW5kLWxpbmUgbGltaXQgY2Fubm90
IGJlIHVzZWQgdG8gcmFpc2UgdGhlIGxpbWl0DQo+Pj4gIGZvciBhbGwgZ3Vlc3RzIGFueW1vcmUs
IGFzIHRoZSBkZWZhdWx0IGluIHRoZSB0b29sc3RhY2sgd2lsbA0KPj4+ICBlZmZlY3RpdmVseSBv
dmVycmlkZSB0aGlzLg0KPj4+IC0gSWYgeW91IHVzZSB0aGUgaHlwZXJ2aXNvciBjb21tYW5kLWxp
bmUgbGltaXQgdG8gKnJlZHVjZSogdGhlIGxpbWl0LA0KPj4+ICB0aGVuIHRoZSAiZGVmYXVsdCIg
dmFsdWVzIGdlbmVyYXRlZCBieSB0aGUgdG9vbHN0YWNrIGFyZSB0b28gaGlnaCwNCj4+PiAgYW5k
IGFsbCBndWVzdCBjcmVhdGlvbnMgd2lsbCBmYWlsLg0KPj4+IA0KPj4+IEluIG90aGVyIHdvcmRz
LCB0aGUgdG9vbHN0YWNrIGRlZmF1bHRzIHJlcXVpcmUgYW55IGNoYW5nZSB0byBiZQ0KPj4+IGVm
ZmVjdGVkIGJ5IGhhdmluZyB0aGUgYWRtaW4gZXhwbGljaXRseSBzcGVjaWZ5IGEgbmV3IHZhbHVl
IGluIGV2ZXJ5DQo+Pj4gZ3Vlc3QuDQo+Pj4gDQo+Pj4gSW4gb3JkZXIgdG8gYWRkcmVzcyB0aGlz
LCBoYXZlIGdyYW50X3RhYmxlX2luaXQgdHJlYXQgbmVnYXRpdmUgdmFsdWVzDQo+Pj4gZm9yIG1h
eF9ncmFudF9mcmFtZXMgYW5kIG1heF9tYXB0cmFja19mcmFtZXMgYXMgaW5zdHJ1Y3Rpb25zIHRv
IHVzZSB0aGUNCj4+PiBzeXN0ZW0td2lkZSBkZWZhdWx0LCBhbmQgaGF2ZSBhbGwgdGhlIGFib3Zl
IHRvb2xzdGFja3MgZGVmYXVsdCB0byBwYXNzaW5nDQo+Pj4gLTEgdW5sZXNzIGEgZGlmZmVyZW50
IHZhbHVlIGlzIGV4cGxpY2l0bHkgY29uZmlndXJlZC4NCj4+PiANCj4+PiBUaGlzIHJlc3RvcmVz
IHRoZSBvbGQgYmVoYXZpb3IgaW4gdGhhdCBjaGFuZ2luZyB0aGUgaHlwZXJ2aXNvciBjb21tYW5k
LWxpbmUNCj4+PiBvcHRpb24gY2FuIGNoYW5nZSB0aGUgYmVoYXZpb3IgZm9yIGFsbCBndWVzdHMs
IHdoaWxlIHJldGFpbmluZyB0aGUgYWJpbGl0eQ0KPj4+IHRvIHNldCBwZXItZ3Vlc3QgdmFsdWVz
LiAgSXQgYWxzbyByZW1vdmVzIHRoZSBidWcgdGhhdCByZWR1Y2luZyB0aGUNCj4+PiBzeXN0ZW0t
d2lkZSBtYXggd2lsbCBjYXVzZSBhbGwgZG9tYWlucyB3aXRob3V0IGV4cGxpY2l0IGxpbWl0cyB0
byBmYWlsLg0KPj4+IA0KPj4+IE5PVEU6IC0gVGhlIE9jYW1sIGJpbmRpbmdzIHJlcXVpcmUgdGhl
IGNhbGxlciB0byBhbHdheXMgc3BlY2lmeSBhIHZhbHVlLA0KPj4+ICAgICAgICBhbmQgdGhlIGNv
ZGUgdG8gc3RhcnQgYSB4ZW5zdG9yZWQgc3R1YmRvbWFpbiBoYXJkLWNvZGVzIHRoZXNlIHRvIDQN
Cj4+PiAJYW5kIDEyOCByZXNwZWN0aXZlbHk7IHRoaXMgYmVoYXZvdXIgd2lsbCBub3QgYmUgbW9k
aWZpZWQuDQo+Pj4gDQo+Pj4gU2lnbmVkLW9mZi1ieTogR2VvcmdlIER1bmxhcCA8Z2VvcmdlLmR1
bmxhcEBjaXRyaXguY29tPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tz
b25AZXUuY2l0cml4LmNvbT4NCg0KRG9lcyB0aGlzIHdpbiBzb21lIGtpbmQgb2YgYXdhcmQgZm9y
IOKAnG1vc3QgY29sbGFib3JhdGl2ZSBwYXRjaOKAnT8NCg0KIC1HZW9yZ2UNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
