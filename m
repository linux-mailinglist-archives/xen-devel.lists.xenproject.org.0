Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 595ED1CDEF5
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 17:28:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYALS-0006zW-D9; Mon, 11 May 2020 15:27:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2nSL=6Z=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jYALQ-0006zR-Kq
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 15:27:52 +0000
X-Inumbo-ID: f9977114-939b-11ea-a222-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9977114-939b-11ea-a222-12813bfff9fa;
 Mon, 11 May 2020 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589210871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=pd9FiApjkRrI17M6BuPt0/+3rlUpB8JSaCgjR2xygGI=;
 b=UKPNlN3+azrLDaHp8xzVmF6tmo8Gblu7NytfIxtR3Sz3Qt/l1FXsQPhV
 a8sccbwJnlhefkHh3kxUM3r5P6SBmAJMj77llcK6yeqVo5CTSJMJ3DW/T
 qUHQ1F1ymRprI6zZt3lpG/JYKyL0E+EZ0D85DMdxp+MUZfnsiaN7LNWab Q=;
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
IronPort-SDR: sFzvVleouJDg7Xy1TxcKvHMaiHbyxVydoEM6/s1ITbdNkInSW28ttEnCDjOkUY6ajxHNr4MKXo
 jMipn6myWvWCQtXey2/BHk+ae4HWeKnFi9OfEvYOg3iQXD4/3oXfbkt5lr/gtMtwgd7UAScuVo
 MLYgihGuTl+w3E6r1IfDOcCaDdFImN2W7v5vmRDOjj2598yDApxXASP1ZpdzaHtZmyuYvRiWXW
 JkkWplkmxfhjCMCndu7K+hUY1Z8zMqQwwo+XfmLi4r+Z7dz9tbTP0dMZCDw+OuwiETwtaiSO5s
 YZE=
X-SBRS: 2.7
X-MesageID: 17493328
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,380,1583211600"; d="scan'208";a="17493328"
From: George Dunlap <George.Dunlap@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from the
 menuconfig directly
Thread-Topic: [PATCH RESEND 2/2] xen: Allow EXPERT mode to be selected from
 the menuconfig directly
Thread-Index: AQHWHvtEfLlMb5EF90y7GzIGxHVxJ6iRncgAgAYL5QCAABeggIAC9dcAgAILiACABg54AIAAIM8A
Date: Mon, 11 May 2020 15:27:46 +0000
Message-ID: <2716ACC1-E38D-45F9-8C07-D99FF846330E@citrix.com>
References: <20200430142548.23751-1-julien@xen.org>
 <20200430142548.23751-3-julien@xen.org>
 <3a4ec020-f626-031e-73a6-b2eee97ab9e8@suse.com>
 <123BE55A-AACB-4FE3-94E2-1559ED73DD09@citrix.com>
 <24240.3047.877655.345428@mariner.uk.xensource.com>
 <1d8eb504-51e9-b8e7-f1af-862760f0f15d@xen.org>
 <24244.16076.627203.282982@mariner.uk.xensource.com>
 <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
In-Reply-To: <09d729ad-58a7-1f4b-c779-5fd81d7009a4@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.80.23.2.2)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: text/plain; charset="utf-8"
Content-ID: <0EE21F3C4624CA4D8B688630C49563B5@citrix.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gTWF5IDExLCAyMDIwLCBhdCAyOjMwIFBNLCBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPiB3cm90ZToNCj4gDQo+IFtDQVVUSU9OIC0gRVhURVJOQUwgRU1BSUxdIERPIE5PVCBy
ZXBseSwgY2xpY2sgbGlua3MsIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBoYXZlIHZl
cmlmaWVkIHRoZSBzZW5kZXIgYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IEhp
IElhbiwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIGNsYXJpZmljYXRpb24uDQo+IA0KPiBPbiAw
Ny8wNS8yMDIwIDE4OjAxLCBJYW4gSmFja3NvbiB3cm90ZToNCj4+IEp1bGllbiBHcmFsbCB3cml0
ZXMgKCJSZTogW1BBVENIIFJFU0VORCAyLzJdIHhlbjogQWxsb3cgRVhQRVJUIG1vZGUgdG8gYmUg
c2VsZWN0ZWQgZnJvbSB0aGUgbWVudWNvbmZpZyBkaXJlY3RseSIpOg0KPj4+IE9uIDA0LzA1LzIw
MjAgMTM6MzQsIElhbiBKYWNrc29uIHdyb3RlOg0KPj4+PiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAo
IlJlOiBbUEFUQ0ggUkVTRU5EIDIvMl0geGVuOiBBbGxvdyBFWFBFUlQgbW9kZSB0byBiZSBzZWxl
Y3RlZCBmcm9tIHRoZSBtZW51Y29uZmlnIGRpcmVjdGx5Iik6DQo+Pj4+PiBPbiBBcHIgMzAsIDIw
MjAsIGF0IDM6NTAgUE0sIEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+
Pj4+Pj4gV2VsbCwgaWYgSSdtIG5vdCBtaXMtcmVtZW1iZXJpbmcgaXQgd2FzIG9uIHB1cnBvc2Ug
dG8gbWFrZSBpdCBtb3JlDQo+Pj4+Pj4gZGlmZmljdWx0IGZvciBwZW9wbGUgdG8gZGVjbGFyZSB0
aGVtc2VsdmVzICJleHBlcnRzIi4gRkFPRCBJJ20gbm90DQo+Pj4+Pj4gbWVhbmluZyB0byBpbXBs
eSBJIGRvbid0IHNlZSBhbmQgYWNjZXB0IHRoZSBmcnVzdHJhdGlvbiBhc3BlY3QgeW91DQo+Pj4+
Pj4gbWVudGlvbiBmdXJ0aGVyIHVwLiBUaGUgdHdvIG5lZWQgdG8gYmUgY2FyZWZ1bGx5IHdlaWdo
ZWQgYWdhaW5zdA0KPj4+Pj4+IG9uZSBhbm90aGVyLg0KPj4+PiANCj4+Pj4gWWVzLCBpdCB3YXMg
b24gcHVycG9zZS4gIEhvd2V2ZXIsIEkgaGFkIG15IGRvdWJ0cyBhdCB0aGUgdGltZSBhbmQNCj4+
Pj4gSSB0aGluayBleHBlcmllbmNlIGhhcyBzaG93biB0aGF0IHRoaXMgd2FzIGEgbWlzdGFrZS4N
Cj4+Pj4gDQo+Pj4+PiBJIGRvbuKAmXQgdGhpbmsgd2UgbmVlZCB0byBtYWtlIGl0IGRpZmZpY3Vs
dCBmb3IgcGVvcGxlIHRvIGRlY2xhcmUNCj4+Pj4+IHRoZW1zZWx2ZXMgZXhwZXJ0cywgcGFydGlj
dWxhcmx5IGFzIOKAnGFsbOKAnSBpdCBtZWFucyBhdCB0aGUgbW9tZW50IGlzLA0KPj4+Pj4g4oCc
Q2FuIGJ1aWxkIHNvbWV0aGluZyB3aGljaCBpcyBub3Qgc2VjdXJpdHkgc3VwcG9ydGVk4oCdLiAg
UGVvcGxlIHdobw0KPj4+Pj4gYXJlIGJ1aWxkaW5nIHRoZWlyIG93biBoeXBlcnZpc29ycyBhcmUg
YWxyZWFkeSBwcmV0dHkgd2VsbCBhZHZhbmNlZDsNCj4+Pj4+IEkgdGhpbmsgd2UgY2FuIGxldCB0
aGVtIHNob290IHRoZW1zZWx2ZXMgaW4gdGhlIGZvb3QgaWYgdGhleSB3YW50DQo+Pj4+PiB0by4N
Cj4+Pj4gDQo+Pj4+IFByZWNpc2VseS4NCj4+PiANCj4+PiBDYW4gSSBjb25zaWRlciB0aGlzIGFz
IGFuIEFja2VkLWJ5PyA6KQ0KPj4gSSBhbSBoYXBweSB3aXRoIHRoZSBwcmluY2lwbGUgb2YgdGhl
IGNoYW5nZS4gIEkgaGF2ZW4ndCByZXZpZXdlZCB0aGUNCj4+IGRldGFpbHMgb2YgdGhlIGNvbW1p
dCBtZXNzYWdlIGV0Yy4NCj4+IEkgcmV2aWV3ZWQgdGhlIHRocmVhZCBhbmQgdGhlcmUgd2VyZSB0
d28gY29uY2VybmVzIHJhaXNlZDoNCj4+ICAqIFRoZSBxdWVzdGlvbiBvZiBwcmluY2lwbGUuICBJ
IGRpc2FncmVlIHdpdGggdGhpcyBjb25jZXJuDQo+PiAgICBiZWNhdXNlIEkgYXBwcm92ZSBvZiBw
cmluY2lwbGUgb2YgdGhlIHBhdGNoLg0KPj4gICogU29tZSBkZXRhaWwgYWJvdXQgdGhlIHByZWNp
c2UganVzdGlmaWNhdG9uIGFzIHdyaXR0ZW4gaW4NCj4+ICAgIHRoZSBjb21taXQgbWVzc2FnZSwg
cmVnYXJkaW5nIGBjbGVhbicgdGFyZ2V0cy4gIEFwcGFyZW50bHkgdGhlDQo+PiAgICBhc3NlcnRp
b24gbWF5IG5vdCBiZSBjb21wbGV0ZWx5IHRydWUuICBJIGhhdmVuJ3Qgc2VlbiBhIHByb3Bvc2Vk
DQo+PiAgICBhbHRlcm5hdGl2ZSB3b3JkaW5nLg0KPiANCj4gSSBoYXZlIGNoZWNrZWQgdGhlIGxh
dGVzdCBzdGFnaW5nLCB0aGUgYGNsZWFuYCB0YXJnZXQgZG9lc24ndCB0cmFzaCAuY29uZmlnIGFu
eW1vcmUuDQo+IA0KPj4gSSBkb24ndCBmZWVsIEkgc2hvdWxkIGFjayBhIGNvbnRyb3ZlcnNpYWwg
cGF0Y2ggd2l0aCBhbiB1bnJlc29sdmVkDQo+PiB3b3JkaW5nIGlzc3VlLiAgQ2FuIHlvdSB0ZWxs
IG1lIHdoYXQgeW91ciBwcm9wb3NlZCB3b3JkaW5nIGlzID8NCj4+IFRvIGF2b2lkIGJsb2NraW5n
IHRoaXMgY2hhbmdlIEkgd291bGQgYmUgaGFwcHkgdG8gcmV2aWV3IHlvdXIgd29yZGluZw0KPj4g
YW5kIHNlZSBpZiBpdCBtZWV0cyBteSByZWFkaW5nIG9mIHRoZSBzdGF0ZWQgb2JqZWN0aW9uLg0K
PiANCj4gSGVyZSBhIHN1Z2dlc3RlZCByZXdvcmRpbmc6DQo+IA0KPiAiRVhQRVJUIG1vZGUgaXMg
Y3VycmVudGx5IHVzZWQgdG8gZ2F0ZSBhbnkgb3B0aW9ucyB0aGF0IGFyZSBpbiB0ZWNobmljYWwN
Cj4gcHJldmlldyBvciBub3Qgc2VjdXJpdHkgc3VwcG9ydGVkIEF0IHRoZSBtb21lbnQsIHRoZSBv
bmx5IHdheSB0byBzZWxlY3QNCj4gaXQgaXMgdG8gdXNlIFhFTl9DT05GSUdfRVhQRVJUPXkgb24g
dGhlIG1ha2UgY29tbWFuZCBsaW5lLg0KPiANCj4gSG93ZXZlciwgaWYgdGhlIHVzZXIgZm9yZ2V0
IHRvIGFkZCB0aGUgb3B0aW9uIHdoZW4gKHJlKWJ1aWxkaW5nIG9yIHdoZW4gdXNpbmcgbWVudWNv
bmZpZywgdGhlbiAuY29uZmlnIHdpbGwgZ2V0IHJld3JpdHRlbi4gVGhpcyBtYXkgbGVhZCB0byBh
IHJhdGhlciBmcnVzdHJhdGluZyBleHBlcmllbmNlIGFzIGl0IGlzIGRpZmZpY3VsdCB0byBkaWFn
bm9zdGljIHRoZQ0KPiBpc3N1ZS4NCj4gDQo+IEEgbG90IG9mIHRoZSBvcHRpb25zIGJlaGluZCBF
WFBFUlQgd291bGQgYmVuZWZpdCB0byBiZSBtb3JlIGFjY2Vzc2libGUgc28gdXNlciBjYW4gZXhw
ZXJpbWVudCB3aXRoIGl0IGFuZCB2b2ljZSBhbnkgY29uY2VybiBiZWZvcmUgdGhleSBhcmUgZnVs
bHkgYmUgc3VwcG9ydGVkLg0KPiANCj4gU28gcmF0aGVyIHRoYW4gbWFraW5nIHJlYWxseSBkaWZm
aWN1bHQgdG8gZXhwZXJpbWVudCBvciB0d2VhayB5b3VyIFhlbiAoZm9yIGluc3RhbmNlIGJ5IGFk
ZGluZyBhIGJ1aWx0LWluIGNvbW1hbmQgbGluZSksIHRoaXMgb3B0aW9uIGNhbiBub3cgYmUgc2Vs
ZWN0ZWQgZnJvbSB0aGUgbWVudWNvbmZpZy4NCj4gDQo+IFRoaXMgZG9lc24ndCBjaGFuZ2UgdGhl
IGZhY3QgYSBYZW4gd2l0aCBFWFBFUlQgbW9kZSBzZWxlY3RlZCB3aWxsIG5vdCBiZSBzZWN1cml0
eSBzdXBwb3J0ZWQuDQo+ICINCg0KSG93IGFib3V0IHRoaXMsIGNsYXJpZnlpbmcgdGhhdCB0b3At
bGV2ZWwgLmNvbmZpZyBpcyBhbiBvcHRpb24sIGJ1dCB0aGF0IGl04oCZcyBzdGlsbCBiZXR0ZXIg
dG8gcHV0IGl0IGluIG1lbnVjb25maWc/ICAoQWxzbyBub3RlIGEgbnVtYmVyIG9mIGdyYW1tYXIg
dHdlYWtzLikNCg0K4oCUDQoNCkVYUEVSVCBtb2RlIGlzIGN1cnJlbnRseSB1c2VkIHRvIGdhdGUg
YW55IG9wdGlvbnMgdGhhdCBhcmUgaW4gdGVjaG5pY2FsDQpwcmV2aWV3IG9yIG5vdCBzZWN1cml0
eSBzdXBwb3J0ZWQuIEF0IHRoZSBtb21lbnQsIHRoaXMgaXMgc2VsZWN0ZWQgYnkgYWRkaW5nIFhF
Tl9DT05GSUdfRVhQRVJUPXkgb24gdGhlIG1ha2UgY29tbWFuZCBsaW5lLCBvciB0byB0aGUgKGN1
cnJlbnRseSB1bmRvY3VtZW50ZWQpIHRvcC1sZXZlbCAuY29uZmlnIGZpbGUuDQoNClRoaXMgbWFr
ZXMgdGhlIG9wdGlvbiB2ZXJ5IHVuaW50dWl0aXZlIHRvIHVzZTogSWYgdGhlIHVzZXIgZm9yZ2V0
cyB0byBhZGQgdGhlIG9wdGlvbiB3aGVuIChyZSlidWlsZGluZyBvciB3aGVuIHVzaW5nIG1lbnVj
b25maWcsIHRoZW4geGVuLy5jb25maWcgd2lsbCBiZSBzaWxlbnRseSByZXdyaXR0ZW4sIGxlYWRp
bmcgdG8gYmVoYXZpb3Igd2hpY2ggaXMgdmVyeSBkaWZmaWN1bHQgdG8gZGlhZ25vc2UuICBBZGRp
bmcgWEVOX0NPTkZJR19FWFBFUlQ9eSB0byB0aGUgdG9wLWxldmVsIC5jb25maWcgaXMgbm90IG9i
dmlvdXMgYmVoYXZpb3IsIHBhcnRpY3VsYXJseSBhcyB0aGUgZmlsZSBpcyB1bmRvY3VtZW50ZWQu
DQoNCkEgbG90IG9mIHRoZSBvcHRpb25zIGJlaGluZCBFWFBFUlQgd291bGQgYmVuZWZpdCBmcm9t
IGJlaW5nIG1vcmUgYWNjZXNzaWJsZSBzbyB1c2VycyBjYW4gZXhwZXJpbWVudCB3aXRoIHRoZW0g
YW5kIHZvaWNlIGFueSBjb25jZXJucyBiZWZvcmUgdGhleSBhcmUgZnVsbHkgc3VwcG9ydGVkLg0K
DQpUbyBtYWtlIHRoaXMgb3B0aW9uIG1vcmUgZGlzY292ZXJhYmxlIGFuZCBjb25zaXN0ZW50IHRv
IHVzZSwgbWFrZSBpdCBwb3NzaWJsZSB0byBzZWxlY3QgaXQgZnJvbSB0aGUgbWVudWNvbmZpZy4N
Cg0KVGhpcyBkb2Vzbid0IGNoYW5nZSB0aGUgZmFjdCBhIFhlbiB3aXRoIEVYUEVSVCBtb2RlIHNl
bGVjdGVkIHdpbGwgbm90IGJlIHNlY3VyaXR5IHN1cHBvcnRlZC4NCg0K4oCUDQoNCiAtR2Vvcmdl

