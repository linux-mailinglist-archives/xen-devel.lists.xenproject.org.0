Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D71610A8A1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 03:09:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZmjl-00054q-Sz; Wed, 27 Nov 2019 02:07:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8oLi=ZT=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iZmjk-00053q-LH
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 02:07:24 +0000
X-Inumbo-ID: a512dea8-10ba-11ea-a3a9-12813bfff9fa
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a512dea8-10ba-11ea-a3a9-12813bfff9fa;
 Wed, 27 Nov 2019 02:07:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 18:07:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,247,1571727600"; d="scan'208";a="233946718"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by fmsmga004.fm.intel.com with ESMTP; 26 Nov 2019 18:07:20 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 26 Nov 2019 18:07:20 -0800
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 26 Nov 2019 18:07:19 -0800
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 26 Nov 2019 18:07:18 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.108]) with mapi id 14.03.0439.000;
 Wed, 27 Nov 2019 10:07:16 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Jan Beulich
 <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH for-4.13] x86/vmx: always sync PIR to IRR
 before vmentry
Thread-Index: AQHVnflKD1qUgNMMbk6j/0dv57gT6KeQVNMAgAAa5gCAAASxAIAAChQAgA3T/cA=
Date: Wed, 27 Nov 2019 02:07:16 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D611FB5@SHSMSX104.ccr.corp.intel.com>
References: <20191118101600.94645-1-roger.pau@citrix.com>
 <14ccf9a0-ecb4-6e09-6461-99f989353f34@suse.com>
 <20191118140302.GL72134@Air-de-Roger>
 <3e543cfd-d81a-1a4b-0268-7b121ae23c23@suse.com>
 <20191118145554.GN72134@Air-de-Roger>
In-Reply-To: <20191118145554.GN72134@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDI5MzRiODQtMzg0OS00OTIyLTkyNjEtMjk5OWQzNGMzOTY1IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiN3RBaHVRWG9GMG1RdXNVXC95bEgrMTlKOTdLUlU1dXdONnhodEZhT3JGMm1QSW1wQmhVMEFrWHpENHhTVFhBd3YifQ==
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
 Wei Liu <wl@xen.org>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTZW50OiBN
b25kYXksIE5vdmVtYmVyIDE4LCAyMDE5IDEwOjU2IFBNCj4gCj4gT24gTW9uLCBOb3YgMTgsIDIw
MTkgYXQgMDM6MTk6NTBQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiBPbiAxOC4xMS4y
MDE5IDE1OjAzLCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+ID4gT24gTW9uLCBOb3YgMTgs
IDIwMTkgYXQgMDE6MjY6NDZQTSArMDEwMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+PiBPbiAx
OC4xMS4yMDE5IDExOjE2LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiA+Pj4gQEAgLTE5NTQs
NDggKzE5NTIsMjggQEAgc3RhdGljIHZvaWQKPiBfX3ZteF9kZWxpdmVyX3Bvc3RlZF9pbnRlcnJ1
cHQoc3RydWN0IHZjcHUgKnYpCj4gPiA+Pj4gICAgICAgKiAyLiBUaGUgdGFyZ2V0IHZDUFUgaXMg
dGhlIGN1cnJlbnQgdkNQVSBhbmQgd2UncmUgaW4gbm9uLWludGVycnVwdAo+ID4gPj4+ICAgICAg
ICogY29udGV4dC4KPiA+ID4+PiAgICAgICAqLwo+ID4gPj4+IC0gICAgaWYgKCBydW5uaW5nICYm
IChpbl9pcnEoKSB8fCAodiAhPSBjdXJyZW50KSkgKQo+ID4gPj4+IC0gICAgewo+ID4gPj4+ICsg
ICAgaWYgKCB2Y3B1X3J1bm5hYmxlKHYpICYmIHYgIT0gY3VycmVudCApCj4gPiA+Pgo+ID4gPj4g
SSdtIGFmcmFpZCB5b3UgbmVlZCB0byBiZSBtb3JlIGNhcmVmdWwgd2l0aCB0aGUgcnVubmluZyB2
cyBydW5uYWJsZQo+ID4gPj4gZGlzdGluY3Rpb24gaGVyZS4gVGhlIGNvbW1lbnQgYWJvdmUgaGVy
ZSBiZWNvbWVzIHN0YWxlIHdpdGggdGhlCj4gPiA+PiBjaGFuZ2UgKGFsc28gd3J0IHRoZSByZW1v
dmFsIG9mIGluX2lycSgpLCB3aGljaCBJJ20gYXQgbGVhc3QgdW5lYXN5Cj4gPiA+PiBhYm91dCks
IGFuZCB0aGUgbmV3IGNvbW1lbnRhcnkgYmVsb3cgYWxzbyBsYXJnZWx5IHNheXMvYXNzdW1lcwo+
ID4gPj4gInJ1bm5pbmciLCBub3QgInJ1bm5hYmxlIi4KPiA+ID4KPiA+ID4gSSd2ZSBtaXNzZWQg
dG8gZml4IHRoYXQgY29tbWVudCwgd2lsbCB0YWtlIGNhcmUgaW4gdGhlIG5leHQgdmVyc2lvbi4K
PiA+ID4gTm90ZSBhbHNvIHRoYXQgdGhlIGNvbW1lbnQgaXMgcXVpdGUgcG9pbnRsZXNzLCBpdCBv
bmx5IHN0YXRlcyB3aGF0IHRoZQo+ID4gPiBjb2RlIGJlbG93IGlzIHN1cHBvc2VkIHRvIGRvLCBi
dXQgZG9lc24ndCBnaXZlIGFueSByZWFzb25pbmcgYXMgdG8gd2h5Cj4gPiA+IGluX2lycSBpcyBy
ZWxldmFudCBoZXJlLgo+ID4KPiA+IEl0J3MgbWFpbiAidmFsdWUiIGlzIHRvIHJlZmVyIHRvIHZj
cHVfa2ljaygpLCB3aGljaCBoYXMgLi4uCj4gPgo+ID4gPiBUQkggSSdtIG5vdCBzdXJlIG9mIHRo
ZSBwb2ludCBvZiB0aGUgaW5faXJxIGNoZWNrLCBJIGRvbid0IHRoaW5rIGl0J3MKPiA+ID4gcmVs
ZXZhbnQgZm9yIHRoZSBjb2RlIGhlcmUuCj4gPgo+ID4gLi4uIGEgc2ltaWxhciBpbl9pcnEoKSBj
aGVjay4gU2FkbHkgdGhhdCBvbmUsIHdoaWxlIGhhdmluZyBhIGJpZ2dlcgo+ID4gY29tbWVudCwg
YWxzbyBkb2Vzbid0IGV4cGxhaW4gd2hhdCBpdCdzIG5lZWRlZCBmb3IuIEl0IGxvb2tzIGxpa2Ug
SQo+ID4gc2hvdWxkIHJlY2FsbCB0aGUgcmVhc29uLCBidXQgSSdtIHNvcnJ5IC0gSSBkb24ndCBy
aWdodCBub3cuCj4gCj4gQnkgcmVhZGluZyB0aGUgbWVzc2FnZSBvZiB0aGUgY29tbWl0IHRoYXQg
aW50cm9kdWNlZCB0aGUgaW5faXJxIGNoZWNrCj4gaW4gdmNwdV9raWNrOgo+IAo+ICJUaGUgZHJh
d2JhY2sgaXMgdGhhdCB7dm14LHN2bX1faW50cl9hc3Npc3QoKSBub3cgcmFjZXMgbmV3IGV2ZW50
Cj4gbm90aWZpY2F0aW9ucyBkZWxpdmVyZWQgYnkgSVJRIG9yIElQSS4gV2UgY2xvc2UgZG93biB0
aGlzIHJhY2UgYnkKPiBoYXZpbmcgdmNwdV9raWNrKCkgc2VuZCBhIGR1bW15IHNvZnRpcnEgLS0g
dGhpcyBnZXRzIHBpY2tlZCB1cCBpbgo+IElSUS1zYWdlIGNvbnRleHQgYW5kIHdpbGwgY2F1c2Ug
cmV0cnkgb2YgKl9pbnRyX2Fzc2lzdCgpLiBXZSBhdm9pZAo+IGRlbGl2ZXJpbmcgdGhlIHNvZnRp
cnEgd2hlcmUgcG9zc2libGUgYnkgYXZvaWRpbmcgaXQgd2hlbiB3ZSBhcmUKPiBydW5uaW5nIGlu
IHRoZSBub24tSVJRIGNvbnRleHQgb2YgdGhlIFZDUFUgdG8gYmUga2lja2VkLiIKPiAKPiBBRkFJ
Q1QgaW4gdGhlIHZjcHVfa2ljayBjYXNlIHRoaXMgaXMgZG9uZSBiZWNhdXNlIHRoZSBzb2Z0aXJx
IHNob3VsZAo+IG9ubHkgYmUgcmFpc2VkIHdoZW4gaW4gSVJRIGNvbnRleHQgaW4gb3JkZXIgdG8g
dHJpZ2dlciB0aGUgY29kZSBpbgo+IHZteF9kb192bWVudHJ5IHRvIHJldHJ5IHRoZSBjYWxsIHRv
IHZteF9pbnRyX2Fzc2lzdCAodGhpcyBpcyByZWxldmFudAo+IGlmIHZjcHVfa2ljayBpcyBpc3N1
ZWQgZnJvbSBhbiBpcnEgaGFuZGxlciBleGVjdXRlZCBhZnRlcgo+IHZteF9pbnRyX2Fzc2lzdCBh
bmQgYmVmb3JlIHRoZSBkaXNhYmxpbmcgaW50ZXJydXB0cyBpbgo+IHZteF9kb192bWVudHJ5Lgo+
IAo+IEkgdGhpbmsgd2UgbmVlZCBzb21ldGhpbmcgYWxvbmcgdGhlIGxpbmVzIG9mOgo+IAo+IGlm
ICggdi0+aXNfcnVubmluZyAmJiB2ICE9IGN1cnJlbnQgKQo+ICAgICBzZW5kX0lQSV9tYXNrKGNw
dW1hc2tfb2Yodi0+cHJvY2Vzc29yKSwgcG9zdGVkX2ludHJfdmVjdG9yKTsKPiBlbHNlIGlmICgg
diA9PSBjdXJyZW50ICYmIGluX2lycSgpICYmICFzb2Z0aXJxX3BlbmRpbmcoc21wX3Byb2Nlc3Nv
cl9pZCgpKSApCj4gICAgIHJhaXNlX3NvZnRpcnEoVkNQVV9LSUNLX1NPRlRJUlEpOwoKVGhlbiB3
aGF0J3MgdGhlIGRpZmZlcmVuY2UgZnJvbSBvcmlnaW5hbCBsb2dpYz8KCj4gCj4gU28gdGhhdCB2
bXhfaW50cl9hc3Npc3QgaXMgYWxzbyByZXRyaWVkIGlmIGEgdmVjdG9yIGlzIHNpZ25hbGVkIGlu
IFBJUgo+IG9uIHRoZSB2Q1BVIGN1cnJlbnRseSBydW5uaW5nIGJldHdlZW4gdGhlIGNhbGwgdG8g
dm14X2ludHJfYXNzaXN0IGFuZAo+IHRoZSBkaXNhYmxpbmcgb2YgaW50ZXJydXB0cyBpbiB2bXhf
ZG9fdm1lbnRyeS4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
