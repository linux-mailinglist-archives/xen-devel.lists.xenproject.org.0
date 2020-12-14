Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2284D2D9FD9
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 20:05:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52623.91906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kot9p-0008A9-QS; Mon, 14 Dec 2020 19:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52623.91906; Mon, 14 Dec 2020 19:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kot9p-00089n-NF; Mon, 14 Dec 2020 19:05:17 +0000
Received: by outflank-mailman (input) for mailman id 52623;
 Mon, 14 Dec 2020 19:05:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSiX=FS=amazon.com=prvs=61050d9d8=havanur@srs-us1.protection.inumbo.net>)
 id 1kot9o-00089a-B7
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 19:05:16 +0000
Received: from smtp-fw-9103.amazon.com (unknown [207.171.188.200])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 531771dc-ed0b-4804-9dec-e1b215fc8a0d;
 Mon, 14 Dec 2020 19:05:15 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-c7c08562.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP;
 14 Dec 2020 19:05:07 +0000
Received: from EX13D05EUC004.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1e-c7c08562.us-east-1.amazon.com (Postfix) with ESMTPS
 id 71B74240CB5; Mon, 14 Dec 2020 19:05:06 +0000 (UTC)
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D05EUC004.ant.amazon.com (10.43.164.38) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 14 Dec 2020 19:05:05 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Mon, 14 Dec 2020 19:05:05 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 531771dc-ed0b-4804-9dec-e1b215fc8a0d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1607972715; x=1639508715;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=5MmXiqh799VlqIO+guYJDr322v3Amqz5ACpbnNbbumc=;
  b=s7afBT8nyVGraVf51+CjQxMo0k1/a3NMSYshHuHmxHM/qc7fRG/u15Jd
   PkCEWT1vVZ2lZn1F1NqRcYwPjlRrq75UU2b+U8BReqJq49turSuKe5LJ9
   U92qraFJ//DNmVrkKu0oEA6tbM/tmrMWoulAD9WbP6zcBCaNvWvTkDDTU
   0=;
X-IronPort-AV: E=Sophos;i="5.78,420,1599523200"; 
   d="scan'208";a="902983114"
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the domain
Thread-Topic: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the domain
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>, "julien@xen.org"
	<julien@xen.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
CC: "Wieczorkiewicz, Pawel" <wipawel@amazon.de>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"paul@xen.org" <paul@xen.org>
Thread-Index: AQHWz7MJSRGqvamGtEii6iRZ4MXyYqn2TWsAgAAJiICAABlGgIAAVTOAgAAzPQA=
Date: Mon, 14 Dec 2020 19:05:05 +0000
Message-ID: <eef19ecad32ac9379b6535ec2a4b444e78b29058.camel@amazon.com>
References: <cover.1607686878.git.havanur@amazon.com>
	 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
	 <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
	 <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
	 <bf70db2d-cf03-11cb-887e-aa38094b3d5f@xen.org>
	 <607cba7c-15b6-0197-6000-cc823038d320@citrix.com>
In-Reply-To: <607cba7c-15b6-0197-6000-cc823038d320@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.16]
Content-Type: text/plain; charset="utf-8"
Content-ID: <E9D2D7CF32CAFC408ACAFB4DD175F725@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDE2OjAxICswMDAwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0K
PiBDQVVUSU9OOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdh
bml6YXRpb24uIERvDQo+IG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3UgY2FuIGNvbmZpcm0gdGhlIHNlbmRlcg0KPiBhbmQga25vdyB0aGUgY29udGVudCBpcyBz
YWZlLg0KPiANCj4gDQo+IA0KPiBPbiAxNC8xMi8yMDIwIDEwOjU2LCBKdWxpZW4gR3JhbGwgd3Jv
dGU6DQo+ID4gSGkgSGFyc2hhLA0KPiA+IA0KPiA+IE9uIDE0LzEyLzIwMjAgMDk6MjYsIFNoYW1z
dW5kYXJhIEhhdmFudXIsIEhhcnNoYSB3cm90ZToNCj4gPiA+IE9uIE1vbiwgMjAyMC0xMi0xNCBh
dCAwOTo1MiArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+ID4gPiA+IENBVVRJT046IFRoaXMg
ZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlDQo+ID4gPiA+IG9yZ2FuaXphdGlv
bi4gRG8NCj4gPiA+ID4gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBjYW4gY29uZmlybSB0aGUNCj4gPiA+ID4gc2VuZGVyDQo+ID4gPiA+IGFuZCBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUuDQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+
IE9uIDExLjEyLjIwMjAgMTI6NDQsIEhhcnNoYSBTaGFtc3VuZGFyYSBIYXZhbnVyIHdyb3RlOg0K
PiA+ID4gPiA+IEEgSFZNIGRvbWFpbiBmbHVzaGVzIGNhY2hlIG9uIGFsbCB0aGUgY3B1cyB1c2lu
Zw0KPiA+ID4gPiA+IGBmbHVzaF9hbGxgIG1hY3JvIHdoaWNoIHVzZXMgY3B1X29ubGluZV9tYXAs
IGR1cmluZw0KPiA+ID4gPiA+IGkpIGNyZWF0aW9uIG9mIGEgbmV3IGRvbWFpbg0KPiA+ID4gPiA+
IGlpKSB3aGVuIGRldmljZS1tb2RlbCBvcCBpcyBwZXJmb3JtZWQNCj4gPiA+ID4gPiBpaWkpIHdo
ZW4gZG9tYWluIGlzIGRlc3RydWN0ZWQuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyB0cmln
Z2VycyBJUEkgb24gYWxsIHRoZSBjcHVzLCB0aHVzIGFmZmVjdGluZyBvdGhlcg0KPiA+ID4gPiA+
IGRvbWFpbnMgdGhhdCBhcmUgcGlubmVkIHRvIGRpZmZlcmVudCBwY3B1cy4gVGhpcyBwYXRjaA0K
PiA+ID4gPiA+IHJlc3RyaWN0cyBjYWNoZSBmbHVzaCB0byB0aGUgc2V0IG9mIGNwdXMgYWZmaW5p
dGl6ZWQgdG8NCj4gPiA+ID4gPiB0aGUgY3VycmVudCBkb21haW4gdXNpbmcgYGRvbWFpbi0+ZGly
dHlfY3B1bWFza2AuDQo+ID4gPiA+IA0KPiA+ID4gPiBCdXQgdGhlbiB5b3UgbmVlZCB0byBlZmZl
Y3QgY2FjaGUgZmx1c2hpbmcgd2hlbiBhIENQVSBnZXRzDQo+ID4gPiA+IHRha2VuIG91dCBvZiBk
b21haW4tPmRpcnR5X2NwdW1hc2suIEkgZG9uJ3QgdGhpbmsgeW91L3dlIHdhbnQNCj4gPiA+ID4g
dG8gZG8gdGhhdC4NCj4gPiA+ID4gDQo+ID4gPiANCj4gPiA+IElmIHdlIGRvIG5vdCByZXN0cmlj
dCwgaXQgY291bGQgbGVhZCB0byBEb1MgYXR0YWNrLCB3aGVyZSBhDQo+ID4gPiBtYWxpY2lvdXMN
Cj4gPiA+IGd1ZXN0IGNvdWxkIGtlZXAgd3JpdGluZyB0byBNVFJSIHJlZ2lzdGVycyBvciBkbyBh
IGNhY2hlIGZsdXNoDQo+ID4gPiB0aHJvdWdoDQo+ID4gPiBETSBPcCBhbmQga2VlcCBzZW5kaW5n
IElQSXMgdG8gb3RoZXIgbmVpZ2hib3JpbmcgZ3Vlc3RzLg0KPiA+IA0KPiA+IEkgc2F3IEphbiBh
bHJlYWR5IGFuc3dlcmVkIGFib3V0IHRoZSBhbGxlZ2VkIERvUywgc28gSSB3aWxsIGp1c3QNCj4g
PiBmb2N1cw0KPiA+IG9uIHRoZSByZXNvbHV0aW9uLg0KPiA+IA0KPiA+IEkgYWdyZWUgdGhhdCBp
biB0aGUgaWRlYWwgc2l0dWF0aW9uIHdlIHdhbnQgdG8gbGltaXQgdGhlIGltcGFjdCBvbg0KPiA+
IHRoZQ0KPiA+IG90aGVyIHZDUFVzLiBIb3dldmVyLCB3ZSBhbHNvIG5lZWQgdG8gbWFrZSBzdXJl
IHRoZSBjdXJlIGlzIG5vdA0KPiA+IHdvcnNlDQo+ID4gdGhhbiB0aGUgc3ltcHRvbXMuDQo+IA0K
PiBBbmQgc3BlY2lmaWNhbGx5LCBvbmx5IGEgY2hhbmdlIHdoaWNoIGlzIGNvcnJlY3QuICBUaGlz
IHBhdGNoIHZlcnkNCj4gZGVmaW5pdGVseSBpc24ndC4NCj4gDQo+IExpbmVzIGNhbiBnZXQgY2Fj
aGVkIG9uIG90aGVyIGNwdXMgZnJvbSwgZS5nLiBxZW11IG1hcHBpbmdzIGFuZCBQVg0KPiBiYWNr
ZW5kcy4NCj4gDQo+ID4gDQo+ID4gVGhlIGNhY2hlIGZsdXNoIGNhbm5vdCBiZSByZXN0cmljdGVk
IGluIGFsbCB0aGUgcGlubmluZyBzaXR1YXRpb24NCj4gPiBiZWNhdXNlIHBpbm5pbmcgZG9lc24n
dCBpbXBseSB0aGUgcENQVSB3aWxsIGJlIGRlZGljYXRlZCB0byBhIGdpdmVuDQo+ID4gdkNQVSBv
ciBldmVuIHRoZSB2Q1BVIHdpbGwgc3RpY2sgb24gcENQVSAod2UgbWF5IGFsbG93IGZsb2F0aW5n
IG9uDQo+ID4gYQ0KPiA+IE5VTUEgc29ja2V0KS4gQWx0aG91Z2ggeW91ciBzZXR1cCBtYXkgb2Zm
ZXIgdGhpcyBndWFyYW50ZWUuDQo+ID4gDQo+ID4gTXkga25vd2xlZGdlIGluIHRoaXMgYXJlYSBp
cyBxdWl0ZSBsaW1pdGVkLiBCdXQgYmVsb3cgYSBmZXcNCj4gPiBxdWVzdGlvbg0KPiA+IHRoYXQg
aG9wZWZ1bGx5IHdpbGwgaGVscCB0byBtYWtlIGEgZGVjaXNpb24uDQo+ID4gDQo+ID4gVGhlIGZp
cnN0IHF1ZXN0aW9uIHRvIGFuc3dlciBpczogY2FuIHRoZSBmbHVzaCBjYW4gYmUgcmVzdHJpY3Rl
ZCBpbg0KPiA+IGENCj4gPiBzZXR1cCB3aGVyZSBlYWNoIHZDUFVzIGFyZSBydW5uaW5nIG9uIGEg
ZGVjaWNhdGVkIHBDUFUgKGkuZQ0KPiA+IHBhcnRpb25uZWQNCj4gPiBzeXN0ZW0pPw0KPiANCj4g
Tm90IHJlYWxseS4gIExpbmVzIGNhbiBiZWNvbWUgY2FjaGVkIGV2ZW4gZnJvbSBzcGVjdWxhdGlv
biBpbiB0aGUNCj4gZGlyZWN0bWFwLg0KPiANCj4gSWYgeW91IG5lZWQgdG8gZmx1c2ggdGhlIGNh
Y2hlcyAoYW5kIGRvbid0IGhhdmUgYSB2aXJ0dWFsIG1hcHBpbmcgdG8NCj4gaXNzdWUgY2xmbHVz
aC9jbGZsdXNob3B0L2Nsd2Igb3ZlciksIGl0IG11c3QgYmUgb24gYWxsIENQVXMuDQoNCklmIGxp
bmVzIGFyZSBjYWNoZWQgZHVlIHRvIGFnZ3Jlc3NpdmUgc3BlY3VsYXRpb24gZnJvbSBhIGRpZmZl
cmVudA0KZ3Vlc3QsIHdvdWxkbid0IHRoZXkgYmUgaW52YWxpZGF0ZWQgYXQgdGhlIHNwZWN1bGF0
aW9uIGJvdW5kYXJ5LCBzaW5jZQ0KaXQncyBhIHdyb25nIHNwZWN1bGF0aW9uPyBXb3VsZCBpdCBz
dGlsbCByZXF1aXJlIHRvIGJlIGZsdXNoZWQNCmV4cGxpY2l0bHk/DQoNCi1IYXJzaGENCg0KPiAN
Cj4gPiBJZiB0aGUgYW5zd2VyIGlzIHllcywgdGhlbiB3ZSBzaG91bGQgZmlndXJlIG91dCB3aGV0
aGVyIHVzaW5nDQo+ID4gZG9tYWluLT5kaXJ0eV9jcHVtYXNrIHdvdWxkIGFsd2F5cyBiZSBjb3Jy
ZWN0PyBGb3IgaW5zdGFuY2UsIGEgdkNQVQ0KPiA+IG1heSBub3QgaGF2ZSB5ZXQgcnVuLCBzbyBj
YW4gd2UgY29uc2lkZXIgdGhlIGFzc29jaWF0ZWQgcENQVSBjYWNoZQ0KPiA+IHdvdWxkIGJlIGNv
bnNpc3RlbnQ/DQo+ID4gDQo+ID4gQW5vdGhlciBsaW5lIG9mIHF1ZXN0aW9uIGlzIHdoYXQgY2Fu
IHdlIGRvIG9uIHN5c3RlbSBzdXBwb3J0aW5nDQo+ID4gc2VsZi1zbm9vcGluZz8gSU9XLCB3b3Vs
ZCBpdCBiZSBwb3NzaWJsZSB0byByZXN0cmljdCB0aGUgZmx1c2ggZm9yDQo+ID4gYWxsDQo+ID4g
dGhlIHNldHVwPw0KPiANCj4gUmlnaHQgLSB0aGlzIGlzIHRoZSBhdmVudWUgd2hpY2ggb3VnaHQg
dG8gYmUgaW52ZXN0aWdhdGVkLiAgKFdvcmtpbmcpDQo+IHNlbGYtbm9vcCBvdWdodCB0byByZW1v
dmUgdGhlIG5lZWQgZm9yIHNvbWUgb2YgdGhlc2UgY2FjaGUgZmx1c2hlcy4NCj4gT3RoZXJzIGxv
b2sgbGlrZSB0aGV5J3JlIG5vdCBjb3JyZWN0IHRvIGJlZ2luIHdpdGguICBPdGhlcnMsIHN1Y2gg
YXMNCj4gdGhlDQo+IHdiaW52ZCBpbnRlcmNlcHRzIGFic29sdXRlbHkgbXVzdCBzdGF5IGFzIHRo
ZXkgYXJlLg0KPiANCj4gfkFuZHJldw0K

