Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909D183FA2
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 04:25:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCauQ-0007qT-10; Fri, 13 Mar 2020 03:22:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=7gA4=46=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1jCauO-0007qO-NM
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 03:22:48 +0000
X-Inumbo-ID: e8b5c2ce-64d9-11ea-a6c1-bc764e2007e4
Received: from mga01.intel.com (unknown [192.55.52.88])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8b5c2ce-64d9-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 03:22:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 20:22:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; d="scan'208";a="289909450"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Mar 2020 20:22:46 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 20:22:45 -0700
Received: from shsmsx153.ccr.corp.intel.com (10.239.6.53) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 12 Mar 2020 20:22:45 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.206]) by
 SHSMSX153.ccr.corp.intel.com ([169.254.12.96]) with mapi id 14.03.0439.000;
 Fri, 13 Mar 2020 11:22:43 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "paul@xen.org" <paul@xen.org>, 'Jan Beulich' <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
Thread-Index: AQHV9gMvA8DkILGx5UOf5iWNvNKXRqhBK2Cg///vUwCAACJ5gIAAKxiAgAAChICAAAiJAIAABewAgARkzGA=
Date: Fri, 13 Mar 2020 03:22:42 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D7CDADF@SHSMSX104.ccr.corp.intel.com>
References: <83253657-b3b4-a045-b829-f8f4c4aeae28@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D7C5CDC@SHSMSX104.ccr.corp.intel.com>
 <2999c86a-328f-927e-6b53-895d2fd788f6@suse.com>
 <000f01d5f6d7$a89fe3b0$f9dfab10$@xen.org>
 <7f34d08e-7876-5eae-d561-c20db2fd5d99@suse.com>
 <002e01d5f6ee$75e09700$61a1c500$@xen.org>
 <0c311606-5c96-9171-f106-23e1e0c13bbb@suse.com>
 <003401d5f6f5$b119b4d0$134d1e70$@xen.org>
In-Reply-To: <003401d5f6f5$b119b4d0$134d1e70$@xen.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZGJmMDQxZjQtMjJjNS00MTNiLTkxMTQtOGRkYjhjNjFmYTQ2IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoibnlyWWRFTU9uclRyN1g5eWdTa2pnTk9peDhRTzFUVUI0RHM5RFlxUTd3MWdaT2FoSUVyeXFWV1I4dVVsbnFoTCJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] IOMMU: make DMA containment of
 quarantined devices optional
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
 'Andrew Cooper' <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgPHhhZGltZ25pa0BnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5l
c2RheSwgTWFyY2ggMTEsIDIwMjAgMTI6MDUgQU0NCj4gDQpbLi4uXQ0KPiANCj4gPg0KPiA+ID4g
SG93ZXZlciwgaXMgYSByZWFsbHkgc2F5aW5nIHRoYXQgdGhpbmdzIHdpbGwgYnJlYWsgaWYgYW55
IG9mIHRoZQ0KPiA+ID4gUFRFcyBoYXMgdGhlaXIgcHJlc2VudCBiaXQgY2xlYXI/DQo+ID4NCj4g
PiBXZWxsLCB5b3Ugc2FpZCB0aGF0IHJlYWQgZmF1bHRzIGFyZSBmYXRhbCAodG8gdGhlIGhvc3Qp
LiBSZWFkcyB3aWxsLA0KPiA+IGZvciBhbnkgYWRkcmVzcyB3aXRoIGFuIHVucG9wdWxhdGVkIFBU
RSwgcmVzdWx0IGluIGEgZmF1bHQgYW5kIGhlbmNlDQo+ID4gYnkgaW1wbGljYXRpb24gYmUgZmF0
YWwuDQo+IA0KPiBPaCBJIHNlZS4gSSB0aG91Z2h0IHRoZXJlIHdhcyBhbiBpbXBsaWNhdGlvbiB0
aGF0IHRoZSBJT01NVSBjb3VsZCBub3QgY29wZQ0KPiB3aXRoIG5vbi1wcmVzZW50IFBURXMgaW4g
c29tZSB3YXkuIEFncmVlZCB0aGF0LCB3aGVuIHRoZSBkZXZpY2UgaXMgYXNzaWduZWQNCj4gdG8g
dGhlIGd1ZXN0LCB0aGVuIGl0IGNhbiBhcnJhbmdlICh2aWEgYmFsbG9vbmluZykgZm9yIGEgbm9u
LXByZXNlbnQgZW50cnkgdG8NCj4gYmUgaGl0IGJ5IGEgcmVhZCB0cmFuc2FjdGlvbiwgcmVzdWx0
aW5nIGluIGEgbG9jay11cC4gQnV0IGRlYWxpbmcgd2l0aCBhDQo+IG1hbGljaW91cyBndWVzdCB3
YXMgbm90IHRoZSBpc3N1ZSBhdCBoYW5kLi4uIGRlYWxpbmcgd2l0aCBhIGJ1Z2d5IGRldmljZSB0
aGF0DQo+IHN0aWxsIHRyaWVkIHRvIERNQSBhZnRlciByZXNldCBhbmQgd2hpbHN0IGluIHF1YXJh
bnRpbmUgd2FzIHRoZSBwcm9ibGVtLg0KPiANCg0KTW9yZSB0aGlua2luZyBvbiB0aGlzLCBJIHdv
bmRlciB3aGV0aGVyIHRoZSBzY3JhdGNoIHBhZ2UgaXMgc3VmZmljaWVudCwgb3INCndoZXRoZXIg
d2Ugc2hvdWxkIHN1cHBvcnQgc3VjaCBkZXZpY2UgaW4gdGhlIGZpcnN0IHBsYWNlLiBMb29raW5n
IGF0DQowYzM1ZDQ0NjoNCi0tDQogICAgVGhlIHJlYXNvbiBmb3IgZG9pbmcgdGhpcyBpcyB0aGF0
IHNvbWUgaGFyZHdhcmUgbWF5IGNvbnRpbnVlIHRvIHJlLXRyeQ0KICAgIERNQSAoZGVzcGl0ZSBG
TFIpIGluIHRoZSBldmVudCBvZiBhbiBlcnJvciwgb3IgZXZlbiBCTUUgYmVpbmcgY2xlYXJlZCwg
YW5kDQogICAgd2lsbCBmYWlsIHRvIGRlYWwgd2l0aCBETUEgcmVhZCBmYXVsdHMgZ3JhY2VmdWxs
eS4gSGF2aW5nIGEgc2NyYXRjaCBwYWdlDQogICAgbWFwcGVkIHdpbGwgYWxsb3cgcGVuZGluZyBE
TUEgcmVhZHMgdG8gY29tcGxldGUgYW5kIHRodXMgc3VjaCBidWdneQ0KICAgIGhhcmR3YXJlIHdp
bGwgZXZlbnR1YWxseSBiZSBxdWllc2NlZC4NCi0tDQoNCidldmVudHVhbGx5Jy4uLiB3aGF0IGRv
ZXMgaXQgZXhhY3RseSBtZWFuPyBIb3cgd291bGQgYW4gdXNlciBrbm93IGEgDQpkZXZpY2UgaGFz
IGJlZW4gcXVpZXNjZWQgYmVmb3JlIGhlIGF0dGVtcHRzIHRvIHJlLWFzc2lnbiB0aGUgZGV2aWNl
DQp0byBvdGhlciBkb21VIG9yIGRvbTA/IGJ5IGd1ZXNzPyBOb3RlIHRoZSBleGFjdCBiZWhhdmlv
ciBvZiBzdWNoDQpkZXZpY2UsIGFmdGVyIGRpZmZlcmVudCBndWVzdCBiZWhhdmlvcnMgKGhhbmcs
IGtpbGwsIGJ1ZywgZXRjLiksIGlzIG5vdA0KZG9jdW1lbnRlZC4gV2hvIGtub3dzIHdoZXRoZXIg
YSBpbi1mbHkgRE1BIG1heSBiZSB0cmlnZ2VyZWQgd2hlbg0KdGhlIG5ldyBvd25lciBzdGFydHMg
dG8gaW5pdGlhbGl6ZSB0aGUgZGV2aWNlIGFnYWluPyBIb3cgbWFueSBzdGFsZQ0Kc3RhdGVzIGFy
ZSByZW1haW5pbmcgb24gc3VjaCBkZXZpY2Ugd2hpY2gsIGV2ZW4gbm90IHRyaWdnZXJyaW5nIGlu
LWZseQ0KRE1BcywgbWF5IGNoYW5nZSB0aGUgZGVzaXJlZCBiZWhhdmlvciBvZiB0aGUgbmV3IG93
bmVyPyBlLmcuIGl0J3MNCnBvc3NpYmxlIG9uZSBjb250cm9sIHJlZ2lzdGVyIGNvbmZpZ3VyZWQg
YnkgdGhlIG9sZCBvd25lciwgYnV0IG5vdA0KdG91Y2hlZCBieSB0aGUgbmV3IG93bmVyLiBJZiBp
dCBjYW5ub3QgYmUgcmVzZXQsIHdoYXQncyB0aGUgcG9pbnQgb2YNCnN1cHBvcnRpbmcgYXNzaWdu
bWVudCBvZiBzdWNoIGJvZ3VzIGRldmljZT8NCg0KVGhlcmVieSBJIGZlZWwgYW55IHN1cHBvcnQg
b2Ygc3VjaCBib2d1cyBkZXZpY2Ugc2hvdWxkIGJlIG1haW50YWluZWQNCm9mZnRyZWUsIGluc3Rl
YWQgb2YgaW4gdXBzdHJlYW0gWGVuLiBUaG91Z2h0cz8NCg0KVGhhbmtzDQpLZXZpbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
