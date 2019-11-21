Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F274610567F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 17:07:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXovn-0000g9-QP; Thu, 21 Nov 2019 16:03:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Zto5=ZN=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iXovm-0000g4-F6
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 16:03:42 +0000
X-Inumbo-ID: 7c0462ac-0c78-11ea-a33c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c0462ac-0c78-11ea-a33c-12813bfff9fa;
 Thu, 21 Nov 2019 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574352221;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=epHtVc2J8WtVLlf3v3I5VWoMvtv4N226n48xdpeoRaw=;
 b=ATV11crysLhBSQlkztt1wgKiAk1JH6yALZKmXRMj/gIc2gAMD/bj9V9c
 l4Z8gX2f62EOAbdZpj3nfe1zkWOU/779FT9Xyi201CCzMswMPwK8wXCnF
 Vz8ADuFSMfWpLfdKC2uVE7tGVto34WgoCozk0tDbCB/CYAdRwSURUaUPF 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=George.Dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 George.Dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: WibHqQJWtiLjcDSdAAW12PPIAaJAu3Z4JcbV6A1sEgp5JSrTZH9r854Jmc4ojR4dc4CAD3tqbW
 O8zu5rVEyq7w5vsqxTE7cGttLYgvzQ4sTY4xecs/7vkT1IU+q5RMlEE3q6ou1GbftI6Mt6L49c
 RwCA1nN/pLsprf9CqOZr3Sm98Z+F34KQUYVO7HInFMi7UWWqpmlLXq7qcSwq0hz2/WXbaU/qCd
 TzXkMo34cW1FW2+cVB9BY9gs0RuhxLdQ1dSHJoZLucsah9RDK6x640BHeK04Jb/JqjfptVWlUU
 HCw=
X-SBRS: 2.7
X-MesageID: 9021931
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,226,1571716800"; 
   d="scan'208";a="9021931"
From: George Dunlap <George.Dunlap@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] Status of 4.13
Thread-Index: AQHVoDGv/PcGeXv6EE+0ufmOFHl3O6eVKdIAgAABsICAABJFAIAAb4cAgAADwoCAAAg/AA==
Date: Thu, 21 Nov 2019 16:03:37 +0000
Message-ID: <8384E7A3-C510-447C-A803-973B8F23B23C@citrix.com>
References: <0ba2bc19-2388-5fdc-43bd-3ac39497291c@suse.com>
 <4f0df64e7c21d70d72cee4fff3f3821a@crc.id.au>
 <006fa7b3-ae93-2812-c88a-7bf8e2ac88b0@suse.com>
 <5ba3cff4-d898-b994-6b73-262146c0037e@suse.com>
 <01D97001-4B2B-4AD7-9C0A-8E2EC03BC90D@citrix.com>
 <eab9a5c6-8944-cc5c-f025-84696c91899e@suse.com>
In-Reply-To: <eab9a5c6-8944-cc5c-f025-84696c91899e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3601.0.10)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <9B7B017ABA479D4CAC6298A7BA770C79@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Status of 4.13
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
Cc: Juergen Gross <jgross@suse.com>, Steven
 Haigh <netwiz@crc.id.au>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTm92IDIxLCAyMDE5LCBhdCAzOjM0IFBNLCBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+IHdyb3RlOg0KPiANCj4gT24gMjEuMTEuMjAxOSAxNjoyMCwgR2VvcmdlIER1bmxh
cCB3cm90ZToNCj4+IA0KPj4gDQo+Pj4gT24gTm92IDIxLCAyMDE5LCBhdCA4OjQxIEFNLCBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+IHdyb3RlOg0KPj4+IA0KPj4+IE9uIDIxLjExLjIw
MTkgMDg6MzYsIErDvHJnZW4gR3Jvw58gd3JvdGU6DQo+Pj4+IE9uIDIxLjExLjE5IDA4OjMwLCBT
dGV2ZW4gSGFpZ2ggd3JvdGU6DQo+Pj4+PiBPbiAyMDE5LTExLTIxIDE3OjA1LCBKw7xyZ2VuIEdy
b8OfIHdyb3RlOg0KPj4+Pj4+IFdoZXJlIGRvIHdlIHN0YW5kIHdpdGggWGVuIDQuMTMgcmVnYXJk
aW5nIGJsb2NrZXJzIGFuZCByZWxhdGVkIHBhdGNoZXM/DQo+Pj4+Pj4gDQo+Pj4+Pj4gMi4gUnl6
ZW4vUm9tZSBmYWlsdXJlcyB3aXRoIFdpbmRvd3MgZ3Vlc3RzOg0KPj4+Pj4+ICAgV2hhdCBpcyB0
aGUgY3VycmVudGx5IHBsYW5uZWQgd2F5IHRvIGFkZHJlc3MgdGhlIHByb2JsZW0/IFdobyBpcw0K
Pj4+Pj4+ICAgd29ya2luZyBvbiB0aGF0Pw0KPj4+Pj4gDQo+Pj4+PiBBIHdvcmthcm91bmQgd2Fz
IGZvdW5kIGJ5IHNwZWNpZnlpbmcgY3B1aWQgdmFsdWVzIGluIHRoZSBXaW5kb3dzIFZNIA0KPj4+
Pj4gY29uZmlnIGZpbGUuDQo+Pj4+PiANCj4+Pj4+IFRoZSB3b3JrYXJvdW5kIGxpbmUgaXM6DQo+
Pj4+PiBjcHVpZCA9IFsgIjB4ODAwMDAwMDg6ZWN4PXh4eHh4eHh4eHh4eHh4eHgwMTAweHh4eHh4
eHh4eHh4IiBdDQo+Pj4+PiANCj4+Pj4+IEl0IHdhcyBzdWdnZXN0ZWQgdGhhdCB0aGlzIGJlIGRv
Y3VtZW50ZWQgLSBidXQgbm8gaW1tZWRpYXRlIGFjdGlvbiANCj4+Pj4+IHNob3VsZCBiZSB0YWtl
biAtIHdpdGggYSB2aWV3IHRvIGNvcnJlY3QgdGhpcyBwcm9wZXJseSBpbiA0LjE0Lg0KPj4+PiAN
Cj4+Pj4gSSdtIGF3YXJlIG9mIHRoZSBzdWdnZXN0aW9uLCBidXQgbm90IG9mIGFueSBkZWNpc2lv
bi4gOi0pDQo+Pj4gDQo+Pj4gSXQgd2FzIG15IHVuZGVyc3RhbmRpbmcgdGhhdCB3ZSdkIGNhcCB0
aGUgNC1iaXQgdmFsdWUgdG8gNyBmb3INCj4+PiB0aGUgdGltZSBiZWluZy4gSSB0aGluayBHZW9y
Z2Ugd2FzIHBsYW5uaW5nIHRvIHNlbmQgYSBwYXRjaC4NCj4+IA0KPj4gT24gdGhhdCBhbHNvLCBJ
4oCZbSBhd2FyZSBvZiB0aGUgc3VnZ2VzdGlvbiwgYnV0IG5vdCBvZiBhbnkgZGVjaXNpb24uDQo+
PiBJIGRvbuKAmXQgdGhpbmsgSSBnb3QgbXVjaCBmZWVkYmFjaywgcG9zaXRpdmUgb3IgbmVnYXRp
dmUsIGFib3V0IHRoZSBpZGVhLg0KPj4gDQo+PiBTdXBwb3NlIHdlIGltcGxlbWVudCB0aGUgbGlt
aXQgZm9yIDQuMTMuIElmIHNvbWVvbmUgcnVucyBMaW51eCBWTXMNCj4+IG9uIDQuMTIgYSBzeXN0
ZW0gd2l0aCBhIGhhcmR3YXJlIHZhbHVlIG9mIDcgZm9yIGFwaWNfaWRfc2l6ZSwgdGhlDQo+PiBn
dWVzdHMgd2lsbCBzZWUgOC4gIElmIHRoZXkgdGhlbiBtaWdyYXRlIHRvIDQuMTMsIHRoZSB2YWx1
ZSB3aWxsDQo+PiBtYWdpY2FsbHkgY2hhbmdlIHVuZGVyIHRoZWlyIGZlZXQgdG8gNy4gIElzIHRo
YXQgT0s/DQo+IA0KPiBMZXQncyBsb29rIGF0IHRoZSBwcmVyZXFzIGZvciBydW5uaW5nIGEgTGlu
dXggKG9yIGFjdHVhbGx5IGFueSkgVk0NCj4gb24gc3VjaCBoYXJkd2FyZTogQXQgbGVhc3Qgb24g
ZHVhbCBzb2NrZXQgc3lzdGVtcyB3aXRoIHN1Y2ggQ1BVcw0KPiBYZW4gNC4xMiB3b3VsZG4ndCBl
dmVuIGJvb3QuIEkgZG9uJ3Qga25vdyBob3cgd2lkZSBhIHJhbmdlIG9mDQo+IHNpbmdsZSBzb2Nr
ZXQgc3lzdGVtcyB3aXRoIHRoZXNlIDY0LWNvZGUgQ1BVcyB3b3VsZCBleGlzdCBvcg0KPiBhcHBl
YXIgZG93biB0aGUgcm9hZC4NCj4gDQo+IFRoZSB3b3JrYXJvdW5kIGJlZm9yZSBvdXIgZW5hYmxp
bmcgb2YgeDJBUElDIG1vZGUgZm9yIHRoZXNlIGJveGVzDQo+IHdhcyB0byBkaXNhYmxlIFNNVCwg
d2hpY2ggaGFzIHRoZSBzaWRlIGVmZmVjdCBvZiBjaGFuZ2luZyBzYWlkDQo+IHZhbHVlIHRvIDYu
DQoNCkNhbiB5b3UgZXhwYW5kIG9uIHRoaXMgYSBiaXQ/ICBBcmUgeW91IHNheWluZyB0aGF0IFhl
biA0LjEyIGNvdWxkbuKAmXQgYm9vdCBvbiBzdWNoIGEgc3lzdGVtLCBhbmQgc28gYXMgbG9uZyBh
cyB3ZSBsaW1pdCB0aGlzIGluIHRoZSBmaXJzdCBYZW4gcmVsZWFzZSB3aGljaCAqY2FuKiwgd2Ug
d29u4oCZdCBoYXZlIGEgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgcHJvYmxlbT8NCg0KQnV0IEkg
dGhvdWdodCBTdGV2ZW4gaGFkIGFscmVhZHkgZW5jb3VudGVyZWQgYW5kIGZpeGVkIHRoaXMgaXNz
dWUgb24gc3VjaCBhIHN5c3RlbSBydW5uaW5nIDQuMTIgKG9yIHNvbWV0aGluZyBlYXJsaWVyKS4N
Cg0KPiBBcyB0byB5b3VyIGFjdHVhbCBxdWVzdGlvbiAtIGFzIGZhciBhcyBMaW51eCBnb2VzLCBJ
IGRvbid0IHRoaW5rDQo+IHRoZXkgcmUtZXZhbHVhdGUgdGhpcyBDUFVJRCBsZWFmIHBvc3QgYm9v
dC4gQnV0IEkgY291bGQgYmUgd3JvbmcNCj4gd2l0aCB0aGlzLCBhbmQgb2YgY291cnNlIG90aGVy
IE9TZXMgbWlnaHQgYmVoYXZlIGRpZmZlcmVudGx5Lg0KDQpXaGF0IEnigJltIG5vdCBnZXR0aW5n
IGhlcmUgaXMgYSByZWNvbW1lbmRhdGlvbi4gOi0pICBJIGRvbuKAmXQgcmVhbGx5IGtub3cgd2hh
dCB0aGUgY2hhbmNlcyBvZiBhbGwgdGhlc2UgdGhpbmdzIGhhcHBlbmluZyBhcmUuDQoNCklmIHlv
dSB0aGluayB0aGVyZeKAmXMgYXQgbGVhc3QgYSAyNSUgY2hhbmNlIG9mIGl0IGJlaW5nIGFwcHJv
dmVkLCBJIGNhbiBzZW5kIGEgcGF0Y2ggdG8gbGltaXQgdGhlIHZhbHVlIHRvIDcsIGFuZCB3ZSBj
YW4gZGlzY3VzcyBpdCBtb3JlIHRoZXJlICh3aGVyZSB0aGUgcGF0Y2ggbmFtZSB3aWxsIG1ha2Ug
aXQgbW9yZSBjbGVhciB3aGF04oCZcyBiZWluZyBkaXNjdXNzZWQpLg0KDQogLUdlb3JnZQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
