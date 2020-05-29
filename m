Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FE21E7B00
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 12:54:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeceT-0002W1-Cs; Fri, 29 May 2020 10:54:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K2ub=7L=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jeceR-0002Vs-Vb
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 10:54:12 +0000
X-Inumbo-ID: ba074f12-a19a-11ea-9947-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba074f12-a19a-11ea-9947-bc764e2007e4;
 Fri, 29 May 2020 10:54:11 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: bERa16mt1R/JAJK61o8LRYzmUQRyjQzranHHWzNaJlOJMp9ZIsMBYTU/7KaMmJzeIfnde12jcf
 4ImnVP5ZCe67aRE53TNWmnfyS8VJa+fcID1t5RxpPGLKJmpR13Qj2Drng3u8AtxzqiKgeHCky2
 CquWTTHYTQN5yD1nuVzffvl0oSu/y4+4QvYy4PZfJhiLqkenqDO1f8xcW88Add764MopP4LhVK
 eO0atxlMx8L8sXTmzfyH7eK7AEC1jvgZDYFame2nGbZ2YAZdyG5e7Wq2vnxs1o0eq9iMrh/T+c
 s/U=
X-SBRS: 2.7
X-MesageID: 19041289
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,448,1583211600"; d="scan'208";a="19041289"
From: George Dunlap <George.Dunlap@citrix.com>
To: Ian Jackson <Ian.Jackson@citrix.com>
Subject: Re: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n
Thread-Topic: [PATCH] xsm: also panic upon "flask=enforcing" when XSM_FLASK=n
Thread-Index: AQHWNZxiYb+bsyhbWESXJxTbHwGxDKi+tSMAgAAI34CAAAQxgA==
Date: Fri, 29 May 2020 10:54:07 +0000
Message-ID: <B6E74C43-224F-4A8A-B073-46DDCB38BCA3@citrix.com>
References: <8a4c4486-cf27-66a0-5ff9-5329277deccf@suse.com>
 <c90b70f7-e52e-405c-adb4-1303d7d1c009@citrix.com>
 <24272.58955.340315.479568@mariner.uk.xensource.com>
In-Reply-To: <24272.58955.340315.479568@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <568ADFE2154D1E4C9B515CB577DF4044@citrix.com>
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
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel de Graaf <dgdegra@tycho.nsa.gov>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+IE9uIE1heSAyOSwgMjAyMCwgYXQgMTE6MzkgQU0sIElhbiBKYWNrc29uIDxpYW4uamFja3Nv
bkBjaXRyaXguY29tPiB3cm90ZToNCj4gDQo+IEFuZHJldyBDb29wZXIgd3JpdGVzICgiUmU6IFtQ
QVRDSF0geHNtOiBhbHNvIHBhbmljIHVwb24gImZsYXNrPWVuZm9yY2luZyIgd2hlbiBYU01fRkxB
U0s9biIpOg0KPj4gT24gMjkvMDUvMjAyMCAxMDozNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4g
V2hpbGUgdGhlIGJlaGF2aW9yIHRvIGlnbm9yZSB0aGlzIG9wdGlvbiB3aXRob3V0IEZMQVNLIHN1
cHBvcnQgd2FzDQo+Pj4gcHJvcGVybHkgZG9jdW1lbnRlZCwgaXQgaXMgc3RpbGwgc29tZXdoYXQg
c3VycHJpc2luZyB0byBzb21lb25lIHVzaW5nDQo+Pj4gdGhpcyBvcHRpb24gYW5kIHRoZW4gc3Rp
bGwgX25vdF8gZ2V0dGluZyB0aGUgYXNzdW1lZCBzZWN1cml0eS4gQWRkIGENCj4+PiAybmQgaGFu
ZGxlciBmb3IgdGhlIGNvbW1hbmQgbGluZSBvcHRpb24gZm9yIHRoZSBYU01fRkxBU0s9biBjYXNl
LCBhbmQNCj4+PiBpbnZva2UgcGFuaWMoKSB3aGVuIHRoZSBvcHRpb24gaXMgc3BlY2lmaWVkIChh
bmQgbm90IHN1YnNlcXVlbnRseQ0KPj4+IG92ZXJyaWRkZW4gYnkgImZsYXNrPWRpc2FibGVkIiku
DQo+Pj4gDQo+Pj4gU3VnZ2VzdGVkLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AY2l0cml4
LmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
DQo+PiANCj4+IEknbSB2ZXJ5IHRlbXB0ZWQgdG8gbmFjayB0aGlzIG91dHJpZ2h0LCBsZXN0IEkg
cmVtaW5kIGJvdGggb2YgeW91IG9mIHRoZQ0KPj4gdG90YWwgZGlzYXN0ZXIgdGhhdCB3YXMgWFNB
LTksIGFuZCB0aGUgc3Vic2VxdWVudCByZXRyYWN0aW9uIG9mIHRoZSBjb2RlDQo+PiB3aGljaCBk
aWQgZXhhY3RseSB0aGlzLg0KPiANCj4gWW91IGFyZSByaWdodCB0byByZW1pbmQgbWUgb2YsIHdl
bGwsIHdoYXRldmVyIGl0IGlzIHlvdSBhcmUgdHJ5aW5nIHRvDQo+IHJlbWluZCBtZSBvZiwgc2lu
Y2UgSSdtIGFmcmFpZCBJIGRvbid0IGtub3cgd2hhdCB5b3UgbWVhbiAuLi4gIERvIHlvdQ0KPiBy
ZWFsbHkgbWVhbiBYU0EtOSA/ICBJIHdlbnQgYXQgbG9va2VkIGl0IHVwIGFuZCB0aGUgY29ubmVj
dGlvbiBlbHVkZXMNCj4gbWUuDQoNCmh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvaGcveGVuLXVuc3Rh
YmxlLmhnL3Jldi9iYzJmM2E4NDhmOWENCg0KV2hpY2ggYXBwYXJlbnRseSB3b3VsZCBjYXVzZSBY
ZW4gdG8gKHB1cnBvc2VseSkgcGFuaWMgd2hlbiBib290ZWQgb24gc3lzdGVtcyB3aXRoIHRoZSBz
cGVjaWZpZWQgQU1EIGVycmF0dW0uDQoNCj4+IElmIHlvdSB3YW50IHRvIGRvIHNvbWV0aGluZyBs
aWtlIHRoaXMsIHByb2hpYml0IGNyZWF0aW5nIGd1ZXN0cyBzbyB0aGUNCj4+IGFkbWluaXN0cmF0
b3IgY2FuIHN0aWxsIGxvZyBpbiBhbmQgdW5icmVhaywgaW5zdGVhZCBvZiBoYXZpbmcgaXQNCj4+
IGVudGVyaW5nIGEgcmVib290IGxvb3Agd2l0aCBubyBvdXRwdXQuICBUaGUgY29uc29sZSBpc24n
dCBlc3RhYmxpc2hlZA0KPj4gdGhpcyBlYXJseSwgc28gbm9uZSBvZiB0aGlzIHRleHQgbWFrZXMg
aXQgb3V0IG9udG8gVkdBL3NlcmlhbC4NCj4gDQo+IENlcnRhaW5seSBhIHNpbGVudCByZWJvb3Qg
bG9vcCB3b3VsZCBiZSB2ZXJ5IHVuaGVscGZ1bC4gIEkgdGhpbmsgaWYNCj4gWGVuIHdlcmUgdG8g
YWN0dWFsbHkgcHJpbnQgc29tZXRoaW5nIHRvIHRoZSBzZXJpYWwgY29uc29sZSB0aGF0IHdvdWxk
DQo+IGJlIHRvbGVyYWJsZSAoc2luY2UgdGhlIGFkbWluaXN0cmF0b3IgY2FuIHRoZW4gYWRqdXN0
IHRoZSBib290IGNvbW1hbmQNCj4gbGluZSksIGJ1dCB5b3VyIHN1Z2dlc3Rpb24gdG8gcHJvaGli
aXQgZ3Vlc3QgY3JlYXRpb24gd291bGQgYmUgZmluZQ0KPiB0b28uDQoNCkl0IHNlZW1zIGxpa2Ug
aGF2aW5nIHRoZSBpbmZyYXN0cnVjdHVyZSB0byBwdXQgWGVuIGludG8gYSDigJx1bnNhZmUgbW9k
ZeKAnSwgd2hlcmUgd2UgcmVmdXNlZCB0byBjcmVhdGUgZ3Vlc3RzIChvciBzb21lIG90aGVyIHNp
bWlsYXIgcmVzcG9uc2UpLCB3b3VsZCBiZSBhIGdvb2QgaW52ZXN0bWVudCB0byBoYW5kbGUgdGhp
cyBzb3J0IG9mIGlzc3VlIGluIHRoZSBmdXR1cmUuDQoNCiAtR2Vvcmdl

