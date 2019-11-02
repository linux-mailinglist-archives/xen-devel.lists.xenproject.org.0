Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87199ECDB1
	for <lists+xen-devel@lfdr.de>; Sat,  2 Nov 2019 08:53:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iQo8t-00061X-UJ; Sat, 02 Nov 2019 07:48:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7JDD=Y2=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iQo8t-00061R-EI
 for xen-devel@lists.xenproject.org; Sat, 02 Nov 2019 07:48:15 +0000
X-Inumbo-ID: 1d53cdac-fd45-11e9-9571-12813bfff9fa
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d53cdac-fd45-11e9-9571-12813bfff9fa;
 Sat, 02 Nov 2019 07:48:10 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Nov 2019 00:48:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,258,1569308400"; d="scan'208";a="226260404"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
 by fmsmga004.fm.intel.com with ESMTP; 02 Nov 2019 00:48:08 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Sat, 2 Nov 2019 00:48:08 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sat, 2 Nov 2019 00:48:07 -0700
Received: from shsmsx102.ccr.corp.intel.com (10.239.4.154) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Sat, 2 Nov 2019 00:48:07 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.127]) by
 shsmsx102.ccr.corp.intel.com ([169.254.2.108]) with mapi id 14.03.0439.000;
 Sat, 2 Nov 2019 15:48:06 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Joe Jin
 <joe.jin@oracle.com>
Thread-Topic: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
Thread-Index: AQHVfqCENihm8ppmBU2310r9hCcUQqdx7EAAgACHRgCAAIn4AIAADI+AgAAKwoCAAOqsgIAAcsKAgAAIkwCAAylPMA==
Date: Sat, 2 Nov 2019 07:48:06 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D5E24A7@SHSMSX104.ccr.corp.intel.com>
References: <20191009125252.3112-1-roger.pau@citrix.com>
 <c42e0852-2eb5-63e8-f542-b4f5d4a1e0a8@oracle.com>
 <20191030082428.GW17494@Air-de-Roger>
 <7cd007b2-8980-bac3-cd5c-812dcf2c1c61@oracle.com>
 <20191030172313.GX17494@Air-de-Roger>
 <35c7a91d-1c46-e99e-5f9c-60d9e17721bf@oracle.com>
 <83625673-5e84-20ba-b7bf-e3e527eecbc0@suse.com>
 <b61f1b50-c050-2482-527e-f7740058b5f9@oracle.com>
 <20191031152304.GY17494@Air-de-Roger>
In-Reply-To: <20191031152304.GY17494@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNDhhM2QwM2MtODc1Yi00YjhhLTkwMGQtM2UzNDU1M2M2Y2Y0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoib1RZTlBudGx3MGMwXC9cL3F2Tm54bkRVQko2K1hyMURHek04UElCM0VcL1A1VmFMYjkwRFwvYUVlUmVOb04zSVwvM2ZZIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] x86/passthrough: fix migration of MSI
 when using posted interrupts
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4g
U2VudDogVGh1cnNkYXksIE9jdG9iZXIgMzEsIDIwMTkgMTE6MjMgUE0KPiAKPiBPbiBUaHUsIE9j
dCAzMSwgMjAxOSBhdCAwNzo1MjoyM0FNIC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+ID4gT24gMTAv
MzEvMTkgMTowMSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gPiA+IE9uIDMwLjEwLjIwMTkgMTk6
MDEsIEpvZSBKaW4gd3JvdGU6Cj4gPiA+PiBPbiAxMC8zMC8xOSAxMDoyMyBBTSwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToKPiA+ID4+PiBPbiBXZWQsIE9jdCAzMCwgMjAxOSBhdCAwOTozODoxNkFN
IC0wNzAwLCBKb2UgSmluIHdyb3RlOgo+ID4gPj4+PiBPbiAxMC8zMC8xOSAxOjI0IEFNLCBSb2dl
ciBQYXUgTW9ubsOpIHdyb3RlOgo+ID4gPj4+Pj4gQ2FuIHlvdSB0cnkgdG8gYWRkIHRoZSBmb2xs
b3dpbmcgZGVidWcgcGF0Y2ggb24gdG9wIG9mIHRoZSBleGlzdGluZwo+ID4gPj4+Pj4gb25lIGFu
ZCByZXBvcnQgdGhlIG91dHB1dCB0aGF0IHlvdSBnZXQgb24gdGhlIFhlbiBjb25zb2xlPwo+ID4g
Pj4+Pgo+ID4gPj4+PiBBcHBsaWVkIGRlYnVnIHBhdGNoIGFuZCBydW4gdGhlIHRlc3QgYWdhaW4s
IG5vdCBvZiBhbnkgbG9nIHByaW50ZWQsCj4gPiA+Pj4+IGF0dGFjaGVkIFhlbiBsb2cgb24gc2Vy
aWFsIGNvbnNvbGUsIHNlZW1zIHBpX3VwZGF0ZV9pcnRlKCkgbm90IGJlZW4KPiA+ID4+Pj4gY2Fs
bGVkIGZvciBpb21tdV9pbnRwb3N0IHdhcyBmYWxzZS4KPiA+ID4+Pgo+ID4gPj4+IEkgaGF2ZSB0
byBhZG1pdCBJJ20gbG9zdCBhdCB0aGlzIHBvaW50LiBEb2VzIGl0IG1lYW4gdGhlIG9yaWdpbmFs
Cj4gPiA+Pj4gaXNzdWUgaGFkIG5vdGhpbmcgdG8gZG8gd2l0aCBwb3N0ZWQgaW50ZXJydXB0cz8K
PiA+ID4+Cj4gPiA+PiBMb29rcyB3aGVuIGluamVjdCBpcnEgYnkgdmxhcGljX3NldF9pcnEoKSwg
aXQgY2hlY2tlZCBieQo+ID4gPj4gaHZtX2Z1bmNzLmRlbGl2ZXJfcG9zdGVkX2ludHIgcmF0aGVy
IHRoYW4gaW9tbXVfaW50cG9zdDoKPiA+ID4+Cj4gPiA+PiAgMTc2ICAgICBpZiAoIGh2bV9mdW5j
cy5kZWxpdmVyX3Bvc3RlZF9pbnRyICkKPiA+ID4+ICAxNzcgICAgICAgICBodm1fZnVuY3MuZGVs
aXZlcl9wb3N0ZWRfaW50cih0YXJnZXQsIHZlYyk7Cj4gPiA+Pgo+ID4gPj4gQW5kIGRlbGl2ZXJf
cG9zdGVkX2ludHIoKSB3b3VsZCBiZSB0aGVyZSwgd2hlbiB2bXggZW5hYmxlZDoKPiA+ID4+Cj4g
PiA+PiAoWEVOKSBIVk06IFZNWCBlbmFibGVkCj4gPiA+PiAoWEVOKSBIVk06IEhhcmR3YXJlIEFz
c2lzdGVkIFBhZ2luZyAoSEFQKSBkZXRlY3RlZAo+ID4gPj4gKFhFTikgSFZNOiBIQVAgcGFnZSBz
aXplczogNGtCLCAyTUIsIDFHQgo+ID4gPgo+ID4gPiBJIGNhbid0IHNlZSB0aGUgY29ubmVjdGlv
bi4gc3RhcnRfdm14KCkgaGFzCj4gPiA+Cj4gPiA+ICAgICBpZiAoIGNwdV9oYXNfdm14X3Bvc3Rl
ZF9pbnRyX3Byb2Nlc3NpbmcgKQo+ID4gPiAgICAgewo+ID4gPiAgICAgICAgIGFsbG9jX2RpcmVj
dF9hcGljX3ZlY3RvcigmcG9zdGVkX2ludHJfdmVjdG9yLAo+IHBpX25vdGlmaWNhdGlvbl9pbnRl
cnJ1cHQpOwo+ID4gPiAgICAgICAgIGlmICggaW9tbXVfaW50cG9zdCApCj4gPiA+ICAgICAgICAg
ICAgIGFsbG9jX2RpcmVjdF9hcGljX3ZlY3RvcigmcGlfd2FrZXVwX3ZlY3RvciwKPiBwaV93YWtl
dXBfaW50ZXJydXB0KTsKPiA+ID4KPiA+ID4gICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUuZGVs
aXZlcl9wb3N0ZWRfaW50ciA9IHZteF9kZWxpdmVyX3Bvc3RlZF9pbnRyOwo+ID4gPiAgICAgICAg
IHZteF9mdW5jdGlvbl90YWJsZS5zeW5jX3Bpcl90b19pcnIgICAgID0gdm14X3N5bmNfcGlyX3Rv
X2lycjsKPiA+ID4gICAgICAgICB2bXhfZnVuY3Rpb25fdGFibGUudGVzdF9waXIgICAgICAgICAg
ICA9IHZteF90ZXN0X3BpcjsKPiA+ID4gICAgIH0KPiA+ID4KPiA+ID4gaS5lLiB0aGUgaG9vayBp
cyBwcmVzZW50IG9ubHkgd2hlbiBwb3N0ZWQgaW50ZXJydXB0cyBhcmUKPiA+ID4gYXZhaWxhYmxl
IGluIGdlbmVyYWwuIEkuZS4gYWxzbyB3aXRoIGp1c3QgQ1BVLXNpZGUgcG9zdGVkCj4gPiA+IGlu
dGVycnVwdHMsIHllcywgd2hpY2ggZ2V0cyBjb25maXJtZWQgYnkgeW91ciAiYXBpY3Y9MCIKPiA+
ID4gdGVzdC4gWWV0IHdpdGgganVzdCBDUFUtc2lkZSBwb3N0ZWQgaW50ZXJydXB0cyBJJ20KPiA+
ID4gc3RydWdnbGluZyBhZ2FpbiB0byB1bmRlcnN0YW5kIHlvdXIgb3JpZ2luYWwgcHJvYmxlbQo+
ID4gPiBkZXNjcmlwdGlvbiwgYW5kIHRoZSBuZWVkIHRvIGZpZGRsZSB3aXRoIElPTU1VIHNpZGUg
Y29kZS4KPiA+Cj4gPiBZZXMsIG9uIG15IHRlc3QgZW52LCBjcHVfaGFzX3ZteF9wb3N0ZWRfaW50
cl9wcm9jZXNzaW5nID09IHRydWUgJiYKPiBpb21tdV9pbnRwb3N0ID09IGZhbHNlLAo+ID4gd2l0
aCB0aGlzLCBwb3N0ZWQgaW50ZXJydXB0cyBiZWVuIGVuYWJsZWQuCj4gCj4gSSdtIHN0aWxsIHF1
aXRlIGxvc3QuIE15IHJlYWRpbmcgb2YgdGhlIEludGVsIFZULWQgc3BlYyBpcyB0aGF0IHRoZQo+
IHBvc3RlZCBpbnRlcnJ1cHQgZGVzY3JpcHRvciAod2hpY2ggY29udGFpbnMgdGhlIFBJUlIpIGlz
IHVzZWQgaW4KPiBjb25qdW5jdGlvbiB3aXRoIGEgcG9zdGVkIGludGVycnVwdCByZW1hcHBpbmcg
ZW50cnkgaW4gdGhlIGlvbW11LCBzbwo+IHRoYXQgaW50ZXJydXB0cyBnZXQgcmVjb3JkZWQgaW4g
dGhlIFBJUlIgYW5kIGxhdGVyIHN5bmNlZCBieSB0aGUKPiBoeXBlcnZpc29yIGludG8gdGhlIHZs
YXBpYyBJUlIgd2hlbiByZXN1bWluZyB0aGUgdmlydHVhbCBDUFUuCgp0aGVyZSBhcmUgdHdvIHBh
cnRzLiBJbnRlbCBmaXJzdCBpbXBsZW1lbnRzIENQVSBwb3N0ZWQgaW50ZXJydXB0LAp3aGljaCBh
bGxvd3Mgb25lIENQVSB0byBwb3N0IElQSSBpbnRvIG5vbi1yb290IGNvbnRleHQgaW4gYW5vdGhl
cgpDUFUgdGhyb3VnaCBwb3N0ZWQgaW50ZXJydXB0IGRlc2NyaXB0b3IuIExhdGVyIFZULWQgcG9z
dGVkIAppbnRlcnJ1cHQgY29tZXMsIHdoaWNoIHVzZSBpbnRlcnJ1cHQgcmVtYXBwaW5nIGVudHJ5
IGFuZCB0aGUKc2FtZSBwb3N0ZWQgaW50ZXJydXB0IGRlc2NyaXB0b3IgKHVzaW5nIG1vcmUgZmll
bGRzKSB0byBjb252ZXJ0CmEgZGV2aWNlIGludGVycnVwdCBpbnRvIGEgcG9zdGVkIGludGVycnVw
dC4gVGhlIHBvc3RpbmcgcHJvY2VzcyBpcwpzYW1lIG9uIHRoZSBkZXN0IENQVSwgcmVnYXJkbGVz
cyBvZiB3aGV0aGVyIGl0J3MgZnJvbSBhbm90aGVyIENQVQpvciBhIGRldmljZS4gCgo+IAo+IEhv
dyBpcyB0aGUgUElSUiBmaWxsZWQgaWYgdGhlcmUncyBubyBpbnRlcnJ1cHQgcmVtYXBwaW5nIGVu
dHJ5Cj4gcG9pbnRpbmcgdG8gaXQ/Cj4gCj4gSSBoYXZlIHRvIGFkbWl0IEknbSBub3Qgc3VwZXIt
ZmFtaWxpYXIgd2l0aCB0aGUgaW1wbGVtZW50YXRpb24gaW4gWGVuLAo+IHNvIGl0J3MgbGlrZWx5
IEknbSBtaXNzaW5nIHNvbWV0aGluZy4KPiAKPiBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
