Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E62E6876583
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 14:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690297.1076157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riaSu-0003a2-Rx; Fri, 08 Mar 2024 13:40:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690297.1076157; Fri, 08 Mar 2024 13:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riaSu-0003Xm-P7; Fri, 08 Mar 2024 13:40:48 +0000
Received: by outflank-mailman (input) for mailman id 690297;
 Fri, 08 Mar 2024 13:40:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aPOM=KO=actia.se=john.ernberg@srs-se1.protection.inumbo.net>)
 id 1riaSt-0003Xb-2v
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 13:40:47 +0000
Received: from mail.actia.se (mail.actia.se [212.181.117.226])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7681c0c7-dd51-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 14:40:44 +0100 (CET)
Received: from S036ANL.actianordic.se (10.12.31.117) by S036ANL.actianordic.se
 (10.12.31.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 14:40:44 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%4]) with mapi id
 15.01.2507.035; Fri, 8 Mar 2024 14:40:44 +0100
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
X-Inumbo-ID: 7681c0c7-dd51-11ee-a1ee-f123f15fe8a2
From: John Ernberg <john.ernberg@actia.se>
To: Julien Grall <julien@xen.org>, Peng Fan <peng.fan@nxp.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
CC: Jonas Blixt <jonas.blixt@actia.se>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Topic: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
Thread-Index: AQHaVDuqVQ/kgxLZgUK/m8/hE0ez5bDzxxsAgAA1KwCAAVx5AIAAQjeAgAEdtQCAAyp5AIABm3uAgAZ8E4CAKNxDgIAApfwAgAKGQoA=
Date: Fri, 8 Mar 2024 13:40:44 +0000
Message-ID: <848794f3-a337-49d9-84db-a969970f071b@actia.se>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
 <08ae764c-3490-4dd1-ab70-7a855a98d16d@actia.se>
 <911ec1bb-3733-4f37-839e-673a88e408ff@actia.se>
 <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
In-Reply-To: <ab61278a-f3f1-41de-a0b2-eca6f19be103@xen.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.12.12.30]
x-esetresult: clean, is OK
x-esetid: 37303A2958D72955627366
Content-Type: text/plain; charset="utf-8"
Content-ID: <B925FF54FF737849BB81AF3944E1CCBF@actia.se>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

SGkgSnVsaWVuLA0KDQpPbiAzLzcvMjQgMDA6MDcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkg
Sm9obiwNCj4gDQo+ICA+IFBpbmcgb24gdGhlIHdhdGNoZG9nIGRpc2N1c3Npb24gYml0cy4NCj4g
DQo+IFNvcnJ5IGZvciB0aGUgbGF0ZSByZXBseS4NCj4gDQo+IE9uIDA2LzAzLzIwMjQgMTM6MTMs
IEpvaG4gRXJuYmVyZyB3cm90ZToNCj4+IE9uIDIvOS8yNCAxNDoxNCwgSm9obiBFcm5iZXJnIHdy
b3RlOg0KPj4+DQo+Pj4+IMKgwqDCoCAqIElNWF9TSVBfVElNRVJfKjrCoCBUaGlzIHNlZW1zIHRv
IGJlIHJlbGF0ZWQgdG8gdGhlIHdhdGNoZG9nLg0KPj4+PiBTaG91bGRuJ3QgZG9tMCByZWx5IG9u
IHRoZSB3YXRjaGRvZyBwcm92aWRlZCBieSBYZW4gaW5zdGVhZD8gU28gdGhvc2UNCj4+Pj4gY2Fs
bCB3aWxsIGJlIHVzZWQgYnkgWGVuLg0KPj4+DQo+Pj4gVGhhdCBpcyBpbmRlZWQgYSB3YXRjaGRv
ZyBTSVAsIGFuZCBhbHNvIGZvciBzZXR0aW5nIHRoZSBTb0MgaW50ZXJuYWwgUlRDDQo+Pj4gaWYg
aXQgaXMgYmVpbmcgdXNlZC4NCj4+Pg0KPj4+IEkgbG9va2VkIGFyb3VuZCBpZiB0aGVyZSB3YXMg
cHJldmlvdXMgZGlzY3Vzc2lvbiBhbmQgb25seSByZWFsbHkgDQo+Pj4gZm91bmQgWzNdLg0KPj4+
IElzIHRoZSB4ZW4veGVuL2luY2x1ZGUvd2F0Y2hkb2cuaCBoZWFkZXIgbWVhbnQgdG8gYmUgZm9y
IHRoaXMga2luZCBvZg0KPj4+IHdhdGNoZG9nIHN1cHBvcnQgb3IgaXMgdGhhdCBtb3JlIGZvciB0
aGUgVk0gd2F0Y2hkb2c/IExvb2tpbmcgYXQgdGhlIHg4Ng0KPj4+IEFDUEkgTk1JIHdhdGNoZG9n
IGl0IHNlZW1zIGxpa2UgdGhlIGZvcm1lciwgYnV0IEkgaGF2ZSBuZXZlciB3b3JrZWQgd2l0aA0K
Pj4+IHg4NiBub3IgQUNQSS4NCj4gDQo+IGluY2x1ZGUvd2F0Y2hkb2cuaCBjb250YWlucyBoZWxw
ZXIgdG8gY29uZmlndXJlIHRoZSB3YXRjaGRvZyBmb3IgWGVuLiBXZSANCj4gYWxzbyBoYXZlIHBl
ci1WTSB3YXRjaGRvZyBhbmQgdGhpcyBpcyBjb25maWd1cmVkIGJ5IHRoZSBoeXBlcmNhbGwgDQo+
IFNDSEVET1Bfd2F0Y2hkb2cuDQo+IA0KPj4+DQo+Pj4gQ3VycmVudGx5IGZvcndhcmRpbmcgaXQg
dG8gRG9tMCBoYXMgbm90IGNhdXNlZCBhbnkgd2F0Y2hkb2cgcmVzZXRzIHdpdGgNCj4+PiBvdXIg
d2F0Y2hkb2cgdGltZW91dCBzZXR0aW5ncywgb3VyIHNwZWNpZmljIERvbTAgc2V0dXAgYW5kIFZN
IGNvdW50Lg0KPiANCj4gSUlVQywgdGhlIFNNQyBBUEkgZm9yIHRoZSB3YXRjaGRvZyB3b3VsZCBi
ZSBzaW1pbGFyIHRvIHRoZSBBQ1BJIE5NSSANCj4gd2F0Y2hkb2cuIFNvIEkgdGhpbmsgaXQgd291
bGQgbWFrZSBtb3JlIHNlbnNlIGlmIHRoaXMgaXMgbm90IGV4cG9zZWQgdG8gDQo+IGRvbTAgKGV2
ZW4gaWYgWGVuIGlzIGRvaW5nIG5vdGhpbmcgd2l0aCBpdCkuDQo+IA0KPiBDYW4geW91IHRyeSB0
byBoaWRlIHRoZSBTTUNzIGFuZCBjaGVjayBpZiBkb20wIHN0aWxsIGJlaGF2ZSBwcm9wZXJseT8N
Cj4gDQo+IENoZWVycywNCj4gDQoNClRoaXMgU01DIG1hbmFnZXMgYSBoYXJkd2FyZSB3YXRjaGRv
ZywgaWYgaXQncyBub3QgcGluZ2VkIHdpdGhpbiBhIA0Kc3BlY2lmaWMgaW50ZXJ2YWwgdGhlIGVu
dGlyZSBib2FyZCByZXNldHMuDQoNCklmIEkgYmxvY2sgdGhlIFNNQ3MgdGhlIHdhdGNoZG9nIGRy
aXZlciBpbiBEb20wIHdpbGwgZmFpbCB0byBwaW5nIHRoZSANCndhdGNoZG9nLCB0cmlnZ2VyaW5n
IGEgYm9hcmQgcmVzZXQgYmVjYXVzZSB0aGUgc3lzdGVtIGxvb2tzIHRvIGhhdmUgDQpiZWNvbWUg
dW5yZXNwb25zaXZlLiBUaGUgcmVhc29uIHRoaXMgcGF0Y2ggc2V0IHN0YXJ0ZWQgaXMgYmVjYXVz
ZSB3ZSANCmNvdWxkbid0IHBpbmcgdGhlIHdhdGNoZG9nIHdoZW4gcnVubmluZyB3aXRoIFhlbi4N
Cg0KSW4gb3VyIHNwZWNpZmljIHN5c3RlbSB0aGUgYm9vdGxvYWRlciBlbmFibGVzIHRoZSB3YXRj
aGRvZyBhcyBlYXJseSBhcyANCnBvc3NpYmxlIHNvIHRoYXQgd2UgY2FuIGdldCB3YXRjaGRvZyBw
cm90ZWN0aW9uIGZvciBhcyBtdWNoIG9mIHRoZSBib290IA0KYXMgd2UgcG9zc2libHkgY2FuLg0K
DQpTbywgaWYgd2UgYXJlIHRvIGJsb2NrIHRoZSBTTUMgZnJvbSBEb20wLCB0aGVuIFhlbiBuZWVk
cyB0byB0YWtlIG92ZXIgDQp0aGUgcGluZ2luZy4gSXQgY291bGQgYmUgaW1wbGVtZW50ZWQgc2lt
aWxhcmx5IHRvIHRoZSBOTUkgd2F0Y2hkb2csIA0KZXhjZXB0IHRoYXQgdGhlIHN5c3RlbSB3aWxs
IHJlc2V0IGlmIHRoZSBwaW5nIGlzIG1pc3NlZCByYXRoZXIgdGhhbiANCmJhY2t0cmFjZS4NCkl0
IHdvdWxkIGFsc28gbWVhbiB0aGF0IFhlbiB3aWxsIGdldCBhIHdob2xlIHdhdGNoZG9nIGRyaXZl
ci1jYXRlZ29yeSANCmR1ZSB0byB0aGUgd2F0Y2hkb2cgYmVpbmcgdmVuZG9yIGFuZCBzb21ldGlt
ZXMgZXZlbiBTb0Mgc3BlY2lmaWMgd2hlbiBpdCANCmNvbWVzIHRvIEFybS4NCg0KTXkgdW5kZXJz
dGFuZGluZyBvZiB0aGUgZG9tYWluIHdhdGNoZG9nIGNvZGUgaXMgdGhhdCB0b2RheSB0aGUgZG9t
YWluIA0KbmVlZHMgdG8gY2FsbCBTQ0hFRE9QX3dhdGNoZG9nIGF0IGxlYXN0IG9uY2UgdG8gc3Rh
cnQgdGhlIHdhdGNoZG9nIA0KdGltZXIuIFNpbmNlIHdhdGNoZG9nIHByb3RlY3Rpb24gdGhyb3Vn
aCB0aGUgd2hvbGUgYm9vdCBwcm9jZXNzIGlzIA0KZGVzaXJhYmxlIHdlJ2QgbmVlZCBzb21lIGNv
cmUgY2hhbmdlcywgc3VjaCBhcyBhbiBvcHRpb24gdG8gc3RhcnQgdGhlIA0KZG9tYWluIHdhdGNo
ZG9nIG9uIGluaXQuDQoNCkl0J3MgcXVpdGUgYSBiaWcgY2hhbmdlIHRvIG1ha2UsIHdoaWxlIEkg
YW0gbm90IGFnYWluc3QgZG9pbmcgaXQgaWYgaXQgDQptYWtlcyBzZW5zZSwgSSBub3cgd29uZGVy
IGlmIFhlbiBzaG91bGQgbWFuYWdlIGhhcmR3YXJlIHdhdGNoZG9ncy4NCkxvb2tpbmcgYXQgdGhl
IGRvbWFpbiB3YXRjaGRvZyBjb2RlIGl0IGxvb2tzIGxpa2UgaWYgYSBkb21haW4gZG9lcyBub3Qg
DQpnZXQgZW5vdWdoIGV4ZWN1dGlvbiB0aW1lLCB0aGUgd2F0Y2hkb2cgd2lsbCBub3QgYmUgcGlu
Z2VkIGVub3VnaCBhbmQgDQp0aGUgZ3Vlc3Qgd2lsbCBiZSByZXNldC4gU28gZWl0aGVyIHdhdGNo
ZG9nIGFwcHJvYWNoIHJlcXVpcmVzIERvbTAgdG8gDQpnZXQgZXhlY3V0aW9uIHRpbWUuIERvbTAg
YWxzbyBuZWVkcyB0byBzZXJ2aWNlIGFsbCB0aGUgUFYgYmFja2VuZHMgaXQncyANCnJlc3BvbnNp
YmxlIGZvci4gSSdtIG5vdCBzdXJlIGl0J3MgdmFsdWFibGUgdG8gYWRkIGFub3RoZXIgbGF5ZXIg
b2YgDQp3YXRjaGRvZyBmb3IgdGhpcyBzY2VuYXJpbyBhcyB0aGUgZW5kIHJlc3VsdCAoY2hlY2tp
bmcgdGhhdCB0aGUgZW50aXJlIA0Kc3lzdGVtIHdvcmtzKSBpcyBhY2hpZXZlZCB3aXRob3V0IGl0
IGFzIHdlbGwuDQoNClNvLCBiZWZvcmUgSSB0cnkgdG8gZmluZCB0aGUgdGltZSB0byBtYWtlIGEg
cHJvcG9zYWwgZm9yIG1vdmluZyB0aGUgDQpoYXJkd2FyZSB3YXRjaGRvZyBiaXQgdG8gWGVuLCBk
byB3ZSByZWFsbHkgd2FudCBpdD8NCg0KVGhhbmtzISAvLyBKb2huIEVybmJlcmc=

