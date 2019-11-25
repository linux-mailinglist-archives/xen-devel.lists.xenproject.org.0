Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0611108958
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 08:43:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZ8xA-0006Vp-8O; Mon, 25 Nov 2019 07:38:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z5e+=ZR=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iZ8x8-0006Vk-Rh
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 07:38:34 +0000
X-Inumbo-ID: 948bad37-0f56-11ea-a38a-12813bfff9fa
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 948bad37-0f56-11ea-a38a-12813bfff9fa;
 Mon, 25 Nov 2019 07:38:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Nov 2019 23:38:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,240,1571727600"; d="scan'208";a="358765575"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by orsmga004.jf.intel.com with ESMTP; 24 Nov 2019 23:38:31 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 24 Nov 2019 23:38:30 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sun, 24 Nov 2019 23:38:30 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.2]) with mapi id 14.03.0439.000;
 Mon, 25 Nov 2019 15:38:27 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "Nakajima, Jun"
 <jun.nakajima@intel.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
Thread-Index: AQHVnflKD1qUgNMMbk6j/0dv57gT6KeQTeUAgAAdH4CAAAPcAIAABdAAgAAb2YCABEjiAIAGsJvg
Date: Mon, 25 Nov 2019 07:38:27 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D60E962@SHSMSX104.ccr.corp.intel.com>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <7a971294-7cfa-f801-15cf-afcf6e5a85cf@suse.com>
 <20191118134611.GK72134@Air-de-Roger>
 <0b9c8956-8179-c272-f7b5-f8d4f7ba21ca@suse.com>
 <20191118142048.GM72134@Air-de-Roger>
 <1b25228c-c0b4-57c7-de4a-5aac752b04c0@suse.com>
 <20191121092622.GS72134@Air-de-Roger>
In-Reply-To: <20191121092622.GS72134@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZDhlMGU1M2QtNTZlMi00MzRlLTgzM2MtNGRkNTkwYTFiZTc3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiK3diTmxTM1JYNnV3cnkweERJVlNyaHBDYytjNDN2T01ZNzN0VVRpV21PUm5sbG5cL0VtTXpVOFZneU9HbjIwOG8ifQ==
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Joe Jin <joe.jin@oracle.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4g
U2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDIxLCAyMDE5IDU6MjYgUE0KPiAKPiBPbiBNb24sIE5v
diAxOCwgMjAxOSBhdCAwNTowMDoyOVBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+IE9u
IDE4LjExLjIwMTkgMTU6MjAsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPiBPbiBNb24s
IE5vdiAxOCwgMjAxOSBhdCAwMzowMDowMFBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPiA+
ID4+IE9uIDE4LjExLjIwMTkgMTQ6NDYsIFJvZ2VyIFBhdSBNb25uw6kgIHdyb3RlOgo+ID4gPj4+
IE9uIE1vbiwgTm92IDE4LCAyMDE5IGF0IDAxOjAxOjU4UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdy
b3RlOgo+ID4gPj4+PiBPbiAxOC4xMS4yMDE5IDExOjE2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6
Cj4gPiA+Pj4+PiBXaGVuIHVzaW5nIHBvc3RlZCBpbnRlcnJ1cHRzIG9uIEludGVsIGhhcmR3YXJl
IGl0J3MgcG9zc2libGUgdGhhdAo+IHRoZQo+ID4gPj4+Pj4gdkNQVSByZXN1bWVzIGV4ZWN1dGlv
biB3aXRoIGEgc3RhbGUgbG9jYWwgQVBJQyBJUlIgcmVnaXN0ZXIKPiBiZWNhdXNlCj4gPiA+Pj4+
PiBkZXBlbmRpbmcgb24gdGhlIGludGVycnVwdHMgdG8gYmUgaW5qZWN0ZWQgdmxhcGljX2hhc19w
ZW5kaW5nX2lycQo+ID4gPj4+Pj4gbWlnaHQgbm90IGJlIGNhbGxlZCwgYW5kIHRodXMgUElSIHdv
bid0IGJlIHN5bmNlZCBpbnRvIElSUi4KPiA+ID4+Pj4+Cj4gPiA+Pj4+PiBGaXggdGhpcyBieSBt
YWtpbmcgc3VyZSBQSVIgaXMgYWx3YXlzIHN5bmNlZCB0byBJUlIgaW4KPiB2bXhfaW50cl9hc3Np
c3QKPiA+ID4+Pj4+IHJlZ2FyZGxlc3Mgb2Ygd2hhdCBpbnRlcnJ1cHRzIGFyZSBwZW5kaW5nLgo+
ID4gPj4+Pgo+ID4gPj4+PiBGb3IgdGhpcyBwYXJ0LCBkaWQgeW91IGNvbnNpZGVyIHB1bGxpbmcg
YWhlYWQgdG8gdGhlIGJlZ2lubmluZwo+ID4gPj4+PiBvZiBodm1fdmNwdV9oYXNfcGVuZGluZ19p
cnEoKSBpdHMgY2FsbCB0byB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKCk/Cj4gPiA+Pj4KPiA+ID4+
PiBJIGFzc3VtZWQgdGhlIG9yZGVyIGluIGh2bV92Y3B1X2hhc19wZW5kaW5nX2lycSBpcyB0aGVy
ZSBmb3IgYQo+IHJlYXNvbi4KPiA+ID4+PiBJIGNvdWxkIGluZGVlZCBtb3ZlIHZsYXBpY19oYXNf
cGVuZGluZ19pcnEgdG8gdGhlIHRvcCwgYnV0IHRoZW4KPiBlaXRoZXIKPiA+ID4+PiB0aGUgcmVz
dWx0IGlzIGRpc2NhcmRlZCBpZiBmb3IgZXhhbXBsZSBhIE5NSSBpcyBwZW5kaW5nIGluamVjdGlv
bgo+ID4gPj4+IChpbiB3aGljaCBjYXNlIHRoZXJlJ3Mgbm8gbmVlZCB0byBnbyB0aHJvdWdoIGFs
bCB0aGUgbG9naWMgaW4KPiA+ID4+PiB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKSwgb3Igd2UgaW52
ZXJ0IHRoZSBwcmlvcml0eSBvZiBldmVudAo+ID4gPj4+IGluamVjdGlvbi4KPiA+ID4+Cj4gPiA+
PiBDaGFuZ2luZyB0aGUgb3JkZXIgb2YgZXZlbnRzIGluamVjdGVkIGlzIG5vdCBhbiBvcHRpb24g
YWZhaWN0LiBUaGUKPiA+ID4+IHBvaW50bGVzcyBwcm9jZXNzaW5nIGRvbmUgaXMgYSB2YWxpZCBj
b25jZXJuLCB5ZXQgdGhlIHN1Z2dlc3Rpb24KPiA+ID4+IHdhcyBzcGVjaWZpY2FsbHkgdG8gaGF2
ZSAocGFydCBvZikgdGhpcyBwcm9jZXNzaW5nIHRvIG9jY3VyIGVhcmx5Lgo+ID4gPj4gVGhlIGRp
c2NhcmRpbmcgb2YgdGhlIHJlc3VsdCwgaW4gdHVybiwgaXMgbm90IGEgcHJvYmxlbSBhZmFpY3Qs
IGFzCj4gPiA+PiBhIHN1YnNlcXVlbnQgY2FsbCB3aWxsIHJldHVybiB0aGUgc2FtZSByZXN1bHQg
KHVubGVzcyBhIGhpZ2hlcgo+ID4gPj4gcHJpb3JpdHkgaW50ZXJydXB0IGhhcyBzdXJmYWNlZCBp
biB0aGUgbWVhbnRpbWUpLgo+ID4gPgo+ID4gPiBZZXMsIHRoYXQncyBmaW5lLiBTbyB5b3Ugd291
bGQgcHJlZmVyIHRvIG1vdmUgdGhlIGNhbGwgdG8KPiA+ID4gdmxhcGljX2hhc19wZW5kaW5nX2ly
cSBiZWZvcmUgYW55IGV4aXQgcGF0aCBpbgo+ID4gPiBodm1fdmNwdV9oYXNfcGVuZGluZ19pcnE/
Cj4gPgo+ID4gIlByZWZlciIgaXNuJ3QgcmVhbGx5IHRoZSB3YXkgSSB3b3VsZCBwdXQgaXQuIEkn
ZCBsaWtlIHRoaXMgdG8gYmUKPiA+IGNvbnNpZGVyZWQgYXMgYW4gYWx0ZXJuYXRpdmUgYmVjYXVz
ZSwgYXMgc2FpZCwgSSB0aGluayB0aGUgY3VycmVudAo+ID4gcGxhY2VtZW50IGxvb2sgbW9yZSBs
aWtlIGEgcGxhc3RlciB0aGFuIGEgY3VyZS4gSSdtIGFsc28gb3BlbiBmb3IKPiA+IG90aGVyIHN1
Z2dlc3Rpb25zLiBCdXQgZmlyc3Qgb2YgYWxsIEknZCBsaWtlIHRvIHNlZSB3aGF0IHRoZSBWTVgK
PiA+IG1haW50YWluZXJzIHRoaW5rLgo+IAo+IEtldmluL0p1biwgY2FuIHdlIHBsZWFzZSBnZXQg
eW91ciBvcGluaW9uIG9uIHRoZSBhYm92ZSBpdGVtPwoKR2l2ZSBtZSBzb21lIHRpbWUgdG8gY2F0
Y2ggdXAuLi4KClRoYW5rcwpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
