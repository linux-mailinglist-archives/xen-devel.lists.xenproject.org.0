Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1DD10A8A0
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 03:09:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZmiO-0004zd-Gq; Wed, 27 Nov 2019 02:06:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8oLi=ZT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iZmiN-0004zY-QP
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 02:05:59 +0000
X-Inumbo-ID: 72848b26-10ba-11ea-a55d-bc764e2007e4
Received: from mga05.intel.com (unknown [192.55.52.43])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72848b26-10ba-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 02:05:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 18:05:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,247,1571727600"; d="scan'208";a="359353721"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
 by orsmga004.jf.intel.com with ESMTP; 26 Nov 2019 18:05:54 -0800
Received: from shsmsx106.ccr.corp.intel.com (10.239.4.159) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 26 Nov 2019 18:05:53 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 SHSMSX106.ccr.corp.intel.com ([169.254.10.248]) with mapi id 14.03.0439.000;
 Wed, 27 Nov 2019 10:05:51 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, "Nakajima, Jun"
 <jun.nakajima@intel.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
Thread-Index: AQHVnflKD1qUgNMMbk6j/0dv57gT6KeQTeUAgAAdH4CAAAPcAIAABdAAgAAb2YCABEjiAIAJd7aw
Date: Wed, 27 Nov 2019 02:05:50 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D611F9F@SHSMSX104.ccr.corp.intel.com>
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
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTZmZDY2N2EtZjc2Ny00ZGJkLTlkMWItOWY1OGNjZTA5ZTIwIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiaUZqdHJibHlWVVpoZ0VXeVg2bmZ5TXZxZHhFXC9weml4QVhkbEI3ODRNU3BvM0NRWFNkUnhMQ2d6RXY0b3d2Wk0ifQ==
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

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTZW50OiBU
aHVyc2RheSwgTm92ZW1iZXIgMjEsIDIwMTkgNToyNiBQTQo+IAo+IE9uIE1vbiwgTm92IDE4LCAy
MDE5IGF0IDA1OjAwOjI5UE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gT24gMTguMTEu
MjAxOSAxNToyMCwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiA+IE9uIE1vbiwgTm92IDE4
LCAyMDE5IGF0IDAzOjAwOjAwUE0gKzAxMDAsIEphbiBCZXVsaWNoIHdyb3RlOgo+ID4gPj4gT24g
MTguMTEuMjAxOSAxNDo0NiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiA+Pj4gT24gTW9u
LCBOb3YgMTgsIDIwMTkgYXQgMDE6MDE6NThQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4g
PiA+Pj4+IE9uIDE4LjExLjIwMTkgMTE6MTYsIFJvZ2VyIFBhdSBNb25uZSB3cm90ZToKPiA+ID4+
Pj4+IFdoZW4gdXNpbmcgcG9zdGVkIGludGVycnVwdHMgb24gSW50ZWwgaGFyZHdhcmUgaXQncyBw
b3NzaWJsZSB0aGF0IHRoZQo+ID4gPj4+Pj4gdkNQVSByZXN1bWVzIGV4ZWN1dGlvbiB3aXRoIGEg
c3RhbGUgbG9jYWwgQVBJQyBJUlIgcmVnaXN0ZXIgYmVjYXVzZQo+ID4gPj4+Pj4gZGVwZW5kaW5n
IG9uIHRoZSBpbnRlcnJ1cHRzIHRvIGJlIGluamVjdGVkIHZsYXBpY19oYXNfcGVuZGluZ19pcnEK
PiA+ID4+Pj4+IG1pZ2h0IG5vdCBiZSBjYWxsZWQsIGFuZCB0aHVzIFBJUiB3b24ndCBiZSBzeW5j
ZWQgaW50byBJUlIuCj4gPiA+Pj4+Pgo+ID4gPj4+Pj4gRml4IHRoaXMgYnkgbWFraW5nIHN1cmUg
UElSIGlzIGFsd2F5cyBzeW5jZWQgdG8gSVJSIGluIHZteF9pbnRyX2Fzc2lzdAo+ID4gPj4+Pj4g
cmVnYXJkbGVzcyBvZiB3aGF0IGludGVycnVwdHMgYXJlIHBlbmRpbmcuCj4gPiA+Pj4+Cj4gPiA+
Pj4+IEZvciB0aGlzIHBhcnQsIGRpZCB5b3UgY29uc2lkZXIgcHVsbGluZyBhaGVhZCB0byB0aGUg
YmVnaW5uaW5nCj4gPiA+Pj4+IG9mIGh2bV92Y3B1X2hhc19wZW5kaW5nX2lycSgpIGl0cyBjYWxs
IHRvIHZsYXBpY19oYXNfcGVuZGluZ19pcnEoKT8KPiA+ID4+Pgo+ID4gPj4+IEkgYXNzdW1lZCB0
aGUgb3JkZXIgaW4gaHZtX3ZjcHVfaGFzX3BlbmRpbmdfaXJxIGlzIHRoZXJlIGZvciBhCj4gcmVh
c29uLgo+ID4gPj4+IEkgY291bGQgaW5kZWVkIG1vdmUgdmxhcGljX2hhc19wZW5kaW5nX2lycSB0
byB0aGUgdG9wLCBidXQgdGhlbiBlaXRoZXIKPiA+ID4+PiB0aGUgcmVzdWx0IGlzIGRpc2NhcmRl
ZCBpZiBmb3IgZXhhbXBsZSBhIE5NSSBpcyBwZW5kaW5nIGluamVjdGlvbgo+ID4gPj4+IChpbiB3
aGljaCBjYXNlIHRoZXJlJ3Mgbm8gbmVlZCB0byBnbyB0aHJvdWdoIGFsbCB0aGUgbG9naWMgaW4K
PiA+ID4+PiB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKSwgb3Igd2UgaW52ZXJ0IHRoZSBwcmlvcml0
eSBvZiBldmVudAo+ID4gPj4+IGluamVjdGlvbi4KPiA+ID4+Cj4gPiA+PiBDaGFuZ2luZyB0aGUg
b3JkZXIgb2YgZXZlbnRzIGluamVjdGVkIGlzIG5vdCBhbiBvcHRpb24gYWZhaWN0LiBUaGUKPiA+
ID4+IHBvaW50bGVzcyBwcm9jZXNzaW5nIGRvbmUgaXMgYSB2YWxpZCBjb25jZXJuLCB5ZXQgdGhl
IHN1Z2dlc3Rpb24KPiA+ID4+IHdhcyBzcGVjaWZpY2FsbHkgdG8gaGF2ZSAocGFydCBvZikgdGhp
cyBwcm9jZXNzaW5nIHRvIG9jY3VyIGVhcmx5Lgo+ID4gPj4gVGhlIGRpc2NhcmRpbmcgb2YgdGhl
IHJlc3VsdCwgaW4gdHVybiwgaXMgbm90IGEgcHJvYmxlbSBhZmFpY3QsIGFzCj4gPiA+PiBhIHN1
YnNlcXVlbnQgY2FsbCB3aWxsIHJldHVybiB0aGUgc2FtZSByZXN1bHQgKHVubGVzcyBhIGhpZ2hl
cgo+ID4gPj4gcHJpb3JpdHkgaW50ZXJydXB0IGhhcyBzdXJmYWNlZCBpbiB0aGUgbWVhbnRpbWUp
Lgo+ID4gPgo+ID4gPiBZZXMsIHRoYXQncyBmaW5lLiBTbyB5b3Ugd291bGQgcHJlZmVyIHRvIG1v
dmUgdGhlIGNhbGwgdG8KPiA+ID4gdmxhcGljX2hhc19wZW5kaW5nX2lycSBiZWZvcmUgYW55IGV4
aXQgcGF0aCBpbgo+ID4gPiBodm1fdmNwdV9oYXNfcGVuZGluZ19pcnE/Cj4gPgo+ID4gIlByZWZl
ciIgaXNuJ3QgcmVhbGx5IHRoZSB3YXkgSSB3b3VsZCBwdXQgaXQuIEknZCBsaWtlIHRoaXMgdG8g
YmUKPiA+IGNvbnNpZGVyZWQgYXMgYW4gYWx0ZXJuYXRpdmUgYmVjYXVzZSwgYXMgc2FpZCwgSSB0
aGluayB0aGUgY3VycmVudAo+ID4gcGxhY2VtZW50IGxvb2sgbW9yZSBsaWtlIGEgcGxhc3RlciB0
aGFuIGEgY3VyZS4gSSdtIGFsc28gb3BlbiBmb3IKPiA+IG90aGVyIHN1Z2dlc3Rpb25zLiBCdXQg
Zmlyc3Qgb2YgYWxsIEknZCBsaWtlIHRvIHNlZSB3aGF0IHRoZSBWTVgKPiA+IG1haW50YWluZXJz
IHRoaW5rLgo+IAo+IEtldmluL0p1biwgY2FuIHdlIHBsZWFzZSBnZXQgeW91ciBvcGluaW9uIG9u
IHRoZSBhYm92ZSBpdGVtPwo+IAoKcHV0dGluZyB0aGUgc3luYyB3aXRoaW4gaHZtX3ZjcHVfaGFz
X3BlbmRpbmdfaXJxIHNvdW5kcyBiZXR0ZXIsCmltcGx5aW5nIHRoYXQgYWxsIGludGVybWVkaWF0
ZSBzdGF0ZXMgbXVzdCBiZSBzeW5jZWQgYmFjayB0byAKYXJjaGl0ZWN0dXJhbCBzdGF0ZXMgYW55
dGltZSB3aGVuIHNvZnR3YXJlIHdhbnRzIHRvIGNoZWNrIHZpcnR1YWwKaW50ZXJydXB0LgoKVGhh
bmtzCktldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
