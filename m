Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B499E1435F8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 04:37:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itkJ3-00040l-Jt; Tue, 21 Jan 2020 03:34:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=i4GT=3K=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1itkJ1-00040g-Gn
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 03:34:19 +0000
X-Inumbo-ID: e725befe-3bfe-11ea-ba1f-12813bfff9fa
Received: from mga06.intel.com (unknown [134.134.136.31])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e725befe-3bfe-11ea-ba1f-12813bfff9fa;
 Tue, 21 Jan 2020 03:34:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 19:34:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,344,1574150400"; d="scan'208";a="250124987"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 20 Jan 2020 19:34:16 -0800
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 19:34:16 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx121.amr.corp.intel.com (10.18.125.36) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 20 Jan 2020 19:34:16 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.197]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.28]) with mapi id 14.03.0439.000;
 Tue, 21 Jan 2020 11:34:14 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Thread-Topic: [PATCH 1/2] nvmx: fix handling of interrupts
Thread-Index: AQHVxg/fbkeODa2AbkWncPoKamSpJafxcYCggAFyWwCAAZn1sA==
Date: Tue, 21 Jan 2020 03:34:13 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D73E81C@SHSMSX104.ccr.corp.intel.com>
References: <20200108103857.77236-1-roger.pau@citrix.com>
 <20200108103857.77236-2-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D739C38@SHSMSX104.ccr.corp.intel.com>
 <20200120101906.GW11756@Air-de-Roger>
In-Reply-To: <20200120101906.GW11756@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOGVhNmE4YjYtMDcyYS00NTliLTk5YTItOTg3MWVlZjUzNTgxIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiWHJNd3Y3bnY4VFUrXC9ock50TExtb04za1pVN1g5N2tFMFpHYWZhaks3d1Z3S1IyK0piajZvQ1QrZmxWT3BUeDgifQ==
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] nvmx: fix handling of interrupts
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>, "Nakajima,
 Jun" <jun.nakajima@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiBTZW50OiBN
b25kYXksIEphbnVhcnkgMjAsIDIwMjAgNjoxOSBQTQo+IAo+IE9uIFN1biwgSmFuIDE5LCAyMDIw
IGF0IDA0OjE1OjA0QU0gKzAwMDAsIFRpYW4sIEtldmluIHdyb3RlOgo+ID4gPiBGcm9tOiBSb2dl
ciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+ID4gPiBTZW50OiBXZWRuZXNkYXks
IEphbnVhcnkgOCwgMjAyMCA2OjM5IFBNCj4gPiA+Cj4gPiA+IFdoZW4gZG9pbmcgYSB2aXJ0dWFs
IHZtZXhpdCAoaWU6IGEgdm1leGl0IGhhbmRsZWQgYnkgdGhlIEwxIFZNTSkKPiA+ID4gaW50ZXJy
dXB0cyBzaG91bGRuJ3QgYmUgaW5qZWN0ZWQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJydXB0IGRl
bGl2ZXJ5Cj4gPiA+IG1lY2hhbmlzbSwgYW5kIGluc3RlYWQgc2hvdWxkIGJlIHNpZ25hbGVkIGlu
IHRoZSB2bWNzIHVzaW5nIHRoZSBleGl0Cj4gPiA+IHJlYXNvbiBhbmQgdGhlIGludGVycnVwdGlv
bi1pbmZvcm1hdGlvbiBmaWVsZCBpZiB0aGUgIkFja25vd2xlZGdlCj4gPiA+IGludGVycnVwdCBv
biBleGl0IiB2bWV4aXQgY29udHJvbCBpcyBzZXQuCj4gPiA+Cj4gPiA+IFJlbW92ZSB0aGUgbnZt
eF91cGRhdGVfYXBpY3YgaGVscGVyOiBpdCdzIGJvZ3VzIHRvIGF0dGVtcHQgdG8gaW5qZWN0Cj4g
PiA+IGludGVycnVwdHMgb24gdmlydHVhbCB2bWV4aXQgdXNpbmcgdGhlIHZpcnR1YWwgaW50ZXJy
dXB0IGRlbGl2ZXJ5Cj4gPiA+IGFzc2lzdGFuY2UsIGFuZCBpdCdzIGFsc28gYm9ndXMgdG8gYWNr
IGludGVycnVwdHMgd2l0aG91dCBjaGVja2luZyBpZgo+ID4gPiB0aGUgdm1leGl0ICJBY2tub3ds
ZWRnZSBpbnRlcnJ1cHQgb24gZXhpdCIgdm1leGl0IGNvbnRyb2wgaXMgc2V0Lgo+ID4gPiBudm14
X2ludHJfaW50ZXJjZXB0IGFscmVhZHkgaGFuZGxlcyBpbnRlcnJ1cHRzIGNvcnJlY3RseSBvbiB2
aXJ0dWFsCj4gPiA+IHZtZXhpdC4KPiA+ID4KPiA+ID4gTm90ZSB0aGF0IHRoaXMgZml4ZXMgdGhl
IHVzYWdlIG9mIHgyQVBJQyBieSB0aGUgTDEgVk1NLCBhdCBsZWFzdCB3aGVuCj4gPiA+IHRoZSBM
MSBWTU0gaXMgWGVuLgo+ID4KPiA+IHdoaWxlIHRoaXMgZml4IG1ha2VzIHNlbnNlIHRvIG1lLCBj
YW4geW91IGFsc28gdGVzdCBvdGhlciBMMSBWTU1zLAo+ID4gc28gd2UgZG9uJ3Qgb3Zlcmxvb2sg
c29tZSBvdGhlciBpbnRlbnRpb25zIGNvdmVyZWQgb3IgaGlkZGVuIGJ5Cj4gPiByZW1vdmVkIGxv
Z2ljPwo+IAo+IEkgY291bGQgdGVzdCBvdGhlciBoeXBlcnZpc29ycywgYnV0IGRvIHdlIHJlYWxs
eSBleHBlY3QgYW55dGhpbmcKPiB0aGF0J3Mgbm90IFhlbiBvbiBYZW4gdG8gd29yaz8KPiAKPiBJ
J20gYXNraW5nIGJlY2F1c2UgdGhhdCdzIHRoZSBvbmx5IGNvbWJpbmF0aW9uIHRoYXQncyBhY3R1
YWxseSB0ZXN0ZWQKPiBieSBvc3N0ZXN0Lgo+IAo+IFRoYW5rcywgUm9nZXIuCgpJZiBvdGhlcnMg
YXJlIE9LIHdpdGggeW91ciBhc3N1bXB0aW9uLCB0aGVuIGl0J3MgZmluZS4gSSBkaWRuJ3QgdGln
aHRseSAKZm9sbG93IHRoZSBuZXN0ZWQgdmlydHVhbGl6YXRpb24gcmVxdWlyZW1lbnRzIGluIFhl
bi4KCk9uIHRoZSBvdGhlciBoYW5kLCBJIHRoaW5rIHRoaXMgcGF0Y2ggbmVlZHMgYSByZXZpc2lv
bi4gSXQgaXMgbm90IGJvZ3VzCnRvIHVzZSB2aXJ0dWFsIGludGVycnVwdCBkZWxpdmVyeSBvbiB2
aXJ0dWFsIFZNZXhpdCwgaWYgIkFjayBpbnRlcnJ1cHQKb24gZXhpdCIgaXMgb2ZmLiBJbiBzdWNo
IGNhc2UsIHRoZSBkZWxpdmVyeSBkb2Vzbid0IGhhcHBlbiB1bnRpbCBMMSAKaHlwZXJ2aXNvciBl
bmFibGVzIGludGVycnVwdCB0byBjbGVhciBpbnRlcnJ1cHQgd2luZG93LiBUaGVuIGl0IGRvZXMK
c2F2ZSBvbmUgZXhpdC4gVGhlIG9ubHkgYm9ndXMgcG9pbnQgaXMgdGhhdCBudm14X3VkcGF0ZV9h
cGljdiBkb2Vzbid0CmNoZWNrICJBY2sgaW50ZXJydXB0IG9uIGV4aXQiLiBTbyBJIHByZWZlciB0
byBhZGQgc3VjaCBjaGVjayB0aGVyZSAKaW5zdGVhZCBvZiBjb21wbGV0ZWx5IHJlbW92aW5nIHRo
aXMgb3B0aW1pemF0aW9uLgoKVGhhbmtzCktldmluCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBs
aXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4v
bGlzdGluZm8veGVuLWRldmVs
