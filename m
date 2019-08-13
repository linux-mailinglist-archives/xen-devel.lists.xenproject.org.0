Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C478B2DD
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 10:49:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxSS1-00081v-PJ; Tue, 13 Aug 2019 08:46:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+Yyd=WJ=citrix.com=lars.kurth@srs-us1.protection.inumbo.net>)
 id 1hxSS0-00081p-EU
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 08:46:40 +0000
X-Inumbo-ID: dd6676dc-bda6-11e9-ab43-db53b87f8928
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd6676dc-bda6-11e9-ab43-db53b87f8928;
 Tue, 13 Aug 2019 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565685999;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+AZgXeh12KMS1WQy1H+oR4W/QsoxGkpyvfukv7xOil8=;
 b=AhbV/Otk8/HOEdc5gL9BmwwYzEQtM9vNFkVjKX6uiqC2K5CXHeWhBxxS
 tw4Bi1yZphyEwWvsvNlX5r/KBtVXRM+wDMF5K8ZVFRR9PphV9NAvE7+uF
 OfjdkpE0U0A39to5+a1OXbYt23V750kGsquz+fHOWRkwyrgODGVG4EDK/ s=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=lars.kurth@citrix.com;
 spf=Pass smtp.mailfrom=lars.kurth@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 lars.kurth@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 lars.kurth@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="lars.kurth@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="lars.kurth@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: pn8sAARNrFp58NWkqTYLvLfBafHK2eNhCnflcEuwo+h1BHUhrAQABZkRfXZFWv197X4Pd4DA1F
 RtfP+x7zpZLATcYKlAudq/rjtt2No5w/qZnbBc6FmNrCwTWGPpN7rOHdQ3hpBWhW4IQk8ykfsx
 3eUs/4dPPmlKQWj+c103Yh/ptyWW5mLDQWJ0LmVwRuraCUoV6I527aAnC+aCvVXUM3BxKZGBNI
 bUCfLih3ng69LacjqmFMfmtURPFNPnmvgdLYmHflwOzRpffllWKzeMEtmpg1lk+CxajWqrURCv
 AXs=
X-SBRS: 2.7
X-MesageID: 4396137
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,380,1559534400"; 
   d="scan'208";a="4396137"
From: Lars Kurth <lars.kurth@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>, Sarah Newman <srn@prgmr.com>
Thread-Topic: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
Thread-Index: AQHVTVgpMFZui26UBkaQeSoYheUqpKbwpyQAgAAnN4CAAAX5AIAAAnmAgAaoXICAAAIrgIAAyJSAgABgNYCAABGogA==
Date: Tue, 13 Aug 2019 08:46:35 +0000
Message-ID: <0B276C27-7682-4D8C-9B40-DB246826B11C@citrix.com>
References: <20190807194143.1351-1-andrew.cooper3@citrix.com>
 <ad94d279-e53c-b1ae-c333-096944b217dd@suse.com>
 <2e3a40d8-14ec-9f84-6a43-d7389bdbebf8@citrix.com>
 <eba4a457-5be0-ee55-28b5-f25973c743fa@suse.com>
 <40816d88-b7e2-7d9f-2d7a-bede37a80e99@arm.com>
 <92e29dd6-0de2-09a4-86e9-e9f76341fe6f@citrix.com>
 <b436f483-1f80-c91b-8c17-a1cfbf98b6f1@citrix.com>
 <760ba819-a3ab-c5dc-054c-3064c6b07a1b@prgmr.com>
 <E4C0136D-9D42-4174-942E-EB6365CB11A1@citrix.com>
In-Reply-To: <E4C0136D-9D42-4174-942E-EB6365CB11A1@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/10.10.c.190715
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-ID: <8655C10914A9F3449B7CB9979E89EB72@citrix.com>
MIME-Version: 1.0
Subject: Re: [Xen-devel] Terminology for "guest" - Was: [PATCH] docs/sphinx:
 Introduction
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <JBeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCu+7v09uIDEzLzA4LzIwMTksIDA5OjQzLCAiR2VvcmdlIER1bmxhcCIgPEdlb3JnZS5EdW5s
YXBAY2l0cml4LmNvbT4gd3JvdGU6DQoNCiAgICANCiAgICANCiAgICA+IE9uIEF1ZyAxMywgMjAx
OSwgYXQgMzo1OSBBTSwgU2FyYWggTmV3bWFuIDxzcm5AcHJnbXIuY29tPiB3cm90ZToNCiAgICA+
IA0KICAgID4gT24gOC8xMi8xOSA4OjAxIEFNLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KICAgID4+
IE9uIDEyLzA4LzIwMTkgMTU6NTMsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQogICAgPj4+IE9uIDgv
OC8xOSAxMDoxMyBBTSwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KICAgID4+Pj4gSGkgSmFuLA0KICAg
ID4+Pj4gDQogICAgPj4+PiBPbiAwOC8wOC8yMDE5IDEwOjA0LCBKYW4gQmV1bGljaCB3cm90ZToN
CiAgICA+Pj4+PiBPbiAwOC4wOC4yMDE5IDEwOjQzLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KICAg
ID4+Pj4+PiBPbiAwOC8wOC8yMDE5IDA3OjIyLCBKYW4gQmV1bGljaCB3cm90ZToNCiAgICA+Pj4+
Pj4+IE9uIDA3LjA4LjIwMTkgMjE6NDEsIEFuZHJldyBDb29wZXIgd3JvdGU6DQogICAgPj4+Pj4+
Pj4gLS0tIC9kZXYvbnVsbA0KICAgID4+Pj4+Pj4+ICsrKyBiL2RvY3MvZ2xvc3NhcnkucnN0DQog
ICAgPj4+Pj4+Pj4gQEAgLTAsMCArMSwzNyBAQA0KICAgID4+Pj4+Pj4+ICtHbG9zc2FyeQ0KICAg
ID4+Pj4+Pj4+ICs9PT09PT09PQ0KICAgID4+Pj4+Pj4+ICsNCiAgICA+Pj4+Pj4+PiArLi4gVGVy
bXMgc2hvdWxkIGFwcGVhciBpbiBhbHBoYWJldGljYWwgb3JkZXINCiAgICA+Pj4+Pj4+PiArDQog
ICAgPj4+Pj4+Pj4gKy4uIGdsb3NzYXJ5OjoNCiAgICA+Pj4+Pj4+PiArDQogICAgPj4+Pj4+Pj4g
KyAgIGNvbnRyb2wgZG9tYWluDQogICAgPj4+Pj4+Pj4gKyAgICAgQSA6dGVybTpgZG9tYWluYCwg
Y29tbW9ubHkgZG9tMCwgd2l0aCB0aGUgcGVybWlzc2lvbiBhbmQNCiAgICA+Pj4+Pj4+PiByZXNw
b25zaWJpbGl0eQ0KICAgID4+Pj4+Pj4+ICsgICAgIHRvIGNyZWF0ZSBhbmQgbWFuYWdlIG90aGVy
IGRvbWFpbnMgb24gdGhlIHN5c3RlbS4NCiAgICA+Pj4+Pj4+PiArDQogICAgPj4+Pj4+Pj4gKyAg
IGRvbWFpbg0KICAgID4+Pj4+Pj4+ICsgICAgIEEgZG9tYWluIGlzIFhlbidzIHVuaXQgb2YgcmVz
b3VyY2Ugb3duZXJzaGlwLCBhbmQgZ2VuZXJhbGx5IGhhcw0KICAgID4+Pj4+Pj4+IGF0IHRoZQ0K
ICAgID4+Pj4+Pj4+ICsgICAgIG1pbmltdW0gc29tZSBSQU0gYW5kIHZpcnR1YWwgQ1BVcy4NCiAg
ICA+Pj4+Pj4+PiArDQogICAgPj4+Pj4+Pj4gKyAgICAgVGhlIHRlcm1zIDp0ZXJtOmBkb21haW5g
IGFuZCA6dGVybTpgZ3Vlc3RgIGFyZSBjb21tb25seSB1c2VkDQogICAgPj4+Pj4+Pj4gKyAgICAg
aW50ZXJjaGFuZ2VhYmx5LCBidXQgdGhleSBtZWFuIHN1YnRseSBkaWZmZXJlbnQgdGhpbmdzLg0K
ICAgID4+Pj4+Pj4+ICsNCiAgICA+Pj4+Pj4+PiArICAgICBBIGd1ZXN0IGlzIGEgc2luZ2xlIHZp
cnR1YWwgbWFjaGluZS4NCiAgICA+Pj4+Pj4+PiArDQogICAgPj4+Pj4+Pj4gKyAgICAgQ29uc2lk
ZXIgdGhlIGNhc2Ugb2YgbGl2ZSBtaWdyYXRpb24gd2hlcmUsIGZvciBhIHBlcmlvZCBvZg0KICAg
ID4+Pj4+Pj4+IHRpbWUsIG9uZQ0KICAgID4+Pj4+Pj4+ICsgICAgIGd1ZXN0IHdpbGwgYmUgY29t
cHJpc2VkIG9mIHR3byBkb21haW5zLCB3aGlsZSBpdCBpcyBpbiB0cmFuc2l0Lg0KICAgID4+Pj4+
Pj4+ICsNCiAgICA+Pj4+Pj4+PiArICAgZG9taWQNCiAgICA+Pj4+Pj4+PiArICAgICBUaGUgbnVt
ZXJpYyBpZGVudGlmaWVyIG9mIGEgcnVubmluZyA6dGVybTpgZG9tYWluYC4gIEl0IGlzDQogICAg
Pj4+Pj4+Pj4gdW5pcXVlIHRvIGENCiAgICA+Pj4+Pj4+PiArICAgICBzaW5nbGUgaW5zdGFuY2Ug
b2YgWGVuLCB1c2VkIGFzIHRoZSBpZGVudGlmaWVyIGluIHZhcmlvdXMgQVBJcywNCiAgICA+Pj4+
Pj4+PiBhbmQgaXMNCiAgICA+Pj4+Pj4+PiArICAgICB0eXBpY2FsbHkgYWxsb2NhdGVkIHNlcXVl
bnRpYWxseSBmcm9tIDAuDQogICAgPj4+Pj4+Pj4gKw0KICAgID4+Pj4+Pj4+ICsgICBndWVzdA0K
ICAgID4+Pj4+Pj4+ICsgICAgIFNlZSA6dGVybTpgZG9tYWluYA0KICAgID4+Pj4+Pj4gSSB0aGlu
ayB5b3Ugd2FudCB0byBtZW50aW9uIHRoZSB1c3VhbCBkaXN0aW5jdGlvbiBoZXJlOiBEb20wIGlz
LA0KICAgID4+Pj4+Pj4gd2hpbGUgYSBkb21haW4sIGNvbW1vbmx5IG5vdCBjb25zaWRlcmVkIGEg
Z3Vlc3QuDQogICAgPj4+Pj4+IFRvIGJlIGhvbmVzdCwgSSBoYWQgdG90YWxseSBmb3Jnb3R0ZW4g
YWJvdXQgdGhhdC4gIEkgZ3Vlc3Mgbm93IGlzIHRoZQ0KICAgID4+Pj4+PiBwcm9wZXIgdGltZSB0
byByZWhhc2ggaXQgaW4gcHVibGljLg0KICAgID4+Pj4+PiANCiAgICA+Pj4+Pj4gSSBkb24ndCB0
aGluayB0aGUgd2F5IGl0IGN1cnJlbnRseSBnZXRzIHVzZWQgaGFzIGEgY2xlYXIgb3IgY29oZXJl
bnQgc2V0DQogICAgPj4+Pj4+IG9mIHJ1bGVzLCBiZWNhdXNlIEkgY2FuJ3QgdGhpbmsgb2YgYW55
IHRvIGRlc2NyaWJlIGhvdyBpdCBkb2VzIGdldCB1c2VkLg0KICAgID4+Pj4+PiANCiAgICA+Pj4+
Pj4gRWl0aGVyIHRoZXJlIGFyZSBhIGNsZWFyIGFuZCBjb2hlcmVudCAoYW5kIHNpbXBsZSEpIHNl
dCBvZiBydWxlcyBmb3INCiAgICA+Pj4+Pj4gd2hhdCB3ZSBtZWFuIGJ5ICJndWVzdCIsIGF0IHdo
aWNoIHBvaW50IHRoZXkgY2FuIGxpdmUgaGVyZSBpbiB0aGUNCiAgICA+Pj4+Pj4gZ2xvc3Nhcnks
IG9yIHRoZSBmdXp6eSB3YXkgaXQgaXMgY3VycmVudCB1c2VkIHNob3VsZCBjZWFzZS4NCiAgICA+
Pj4+PiBXaGF0J3MgZnV6enkgYWJvdXQgRG9tMCBub3QgYmVpbmcgYSBndWVzdCAoZHVlIHRvIGJl
aW5nIGEgcGFydCBvZiB0aGUNCiAgICA+Pj4+PiBob3N0IGluc3RlYWQpPw0KICAgID4+Pj4gRG9t
MCBpcyBub3QgcGFydCBvZiB0aGUgaG9zdCBpZiB5b3UgYXJlIHVzaW5nIGFuIGhhcmR3YXJlIGRv
bWFpbi4gSQ0KICAgID4+Pj4gYWN0dWFsbHkgdGhvdWdodCB3ZSByZW5hbWVkIGV2ZXJ5dGhpbmcg
aW4gWGVuIGZyb20gRG9tMCB0byBod2RvbSB0bw0KICAgID4+Pj4gYXZvaWQgdGhlIGNvbmZ1c2lv
bi4NCiAgICA+Pj4+IA0KICAgID4+Pj4gSSBhbHNvIHdvdWxkIHJhdGhlciBhdm9pZCB0byB0cmVh
dCAiZG9tMCIgYXMgbm90IGEgZ3Vlc3QuIEluIG5vcm1hbA0KICAgID4+Pj4gc2V0dXAgdGhpcyBp
cyBhIG1vcmUgcHJpdmlsZWdlIGd1ZXN0LCBpbiBvdGhlciBzZXR1cCB0aGlzIG1heSBqdXN0IGJl
IGENCiAgICA+Pj4+IG5vcm1hbCBndWVzdCAodGhpbmsgYWJvdXQgcGFydGl0aW9uaW5nKS4NCiAg
ICA+Pj4gQSBsaXRlcmFsIGd1ZXN0IGlzIHNvbWVvbmUgd2hvIGRvZXNuJ3QgbGl2ZSBpbiB0aGUg
YnVpbGRpbmcgKG9yIHdvcmsgaW4NCiAgICA+Pj4gdGhlIGJ1bGlkaW5nLCBpZiB5b3UncmUgaW4g
YSBob3RlbCkuICBUaGUgZmFjdCB0aGF0IHRoZSBzdGFmZiBjbGVhbmluZw0KICAgID4+PiByb29t
cyBhcmUgcmVzdHJpY3RlZCBpbiB0aGVpciBwcml2aWxlZ2VzIGRvZXNuJ3QgbWFrZSB0aGVtIGd1
ZXN0cyBvZiB0aGUNCiAgICA+Pj4gaG90ZWwuDQogICAgPj4+IA0KICAgID4+PiBUaGUgdG9vbHN0
YWNrIGRvbWFpbiwgdGhlIGhhcmR3YXJlIGRvbWFpbiwgdGhlIGRyaXZlciBkb21haW4sIHRoZQ0K
ICAgID4+PiB4ZW5zdG9yZSBkb21haW4sIGFuZCBzbyBvbiBhcmUgYWxsIHBhcnQgb2YgdGhlIGhv
c3Qgc3lzdGVtLCBkZXNpZ25lZCB0bw0KICAgID4+PiBhbGxvdyB5b3UgdG8gdXNlIFhlbiB0byBk
byB0aGUgdGhpbmcgeW91IGFjdHVhbGx5IHdhbnQgdG8gZG86IFJ1biBndWVzdHMuDQogICAgPj4+
IA0KICAgID4+PiBBbmQgaXQncyBpbXBvcnRhbnQgdGhhdCB3ZSBoYXZlIGEgd29yZCB0aGF0IGRp
c3Rpbmd1aXNoZXMgImRvbWFpbnMgdGhhdA0KICAgID4+PiB3ZSBvbmx5IGNhcmUgYWJvdXQgYmVj
YXVzZSB0aGV5IG1ha2UgaXQgcG9zc2libGUgdG8gcnVuIG90aGVyIGRvbWFpbnMiLA0KICAgID4+
PiBhbmQgImRvbWFpbnMgdGhhdCB3ZSBhY3R1YWxseSB3YW50IHRvIHJ1biIuICAiZ3Vlc3QgLyBo
b3N0IiBpcyBhIG5hdHVyYWwNCiAgICA+Pj4gdGVybWlub2xvZ3kgZm9yIHRoZXNlLg0KICAgID4+
PiANCiAgICA+Pj4gV2UgYWxyZWFkeSBoYXZlIHRoZSB3b3JkICJkb21haW4iLCB3aGljaCBpbmNs
dWRlcyBkb20wLCBkcml2ZXIgZG9tYWlucywNCiAgICA+Pj4gdG9vbHN0YWNrIGRvbWFpbnMsIGhh
cmR3YXJlIGRvbWFpbnMsIGFzIHdlbGwgYXMgZ3Vlc3QgZG9tYWlucy4gIFdlIGRvbid0DQogICAg
Pj4+IG5lZWQgImd1ZXN0IiB0byBiZSBhIHN5bm9ueW0gZm9yICJkb21haW4iLg0KICAgID4+IFNv
Li4uDQogICAgPj4gUGxlYXNlIGNhbiBzb21lb25lIHByb3Bvc2Ugd29yZGluZyBzaW1wbGUsIGNs
ZWFyIHdvcmRpbmcgZm9yIHdoYXQNCiAgICA+PiAiZ3Vlc3QiIG1lYW5zLg0KICAgID4gDQogICAg
PiBBIHBvdGVudGlhbGx5IHVudHJ1c3RlZCBkb21haW4uDQogICAgDQogICAgQnV0IHdvdWxkbuKA
mXQgdGhhdCBpbmNsdWRlIGJvdGggZHJpdmVyIGRvbWFpbnMgYW5kIHN0dWJkb21haW5zPw0KICAg
IA0KSSB0aGluayB0aGUgZGVmaW5pdGlvbiB5b3UgcHJvdmlkZWQgbG9va3MgZ29vZCBhbmQgaXMg
YWxzbyBhbG9uZyB0aGUgbGluZXMgd2hpY2ggaG93IG1vc3QgcGVvcGxlIHVzZSBpdA0KTGFycyAg
ICANCiAgICANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
