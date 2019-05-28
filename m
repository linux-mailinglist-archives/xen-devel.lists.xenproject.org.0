Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8FA2BE9D
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 07:33:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVUhe-0004rM-DU; Tue, 28 May 2019 05:31:14 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3VDd=T4=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1hVUhc-0004rE-A1
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 05:31:12 +0000
X-Inumbo-ID: cbf481c2-8109-11e9-8980-bc764e045a96
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cbf481c2-8109-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 05:31:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 May 2019 22:31:08 -0700
X-ExtLoop1: 1
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga006.jf.intel.com with ESMTP; 27 May 2019 22:31:07 -0700
Received: from fmsmsx111.amr.corp.intel.com (10.18.116.5) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 22:31:07 -0700
Received: from shsmsx154.ccr.corp.intel.com (10.239.6.54) by
 fmsmsx111.amr.corp.intel.com (10.18.116.5) with Microsoft SMTP Server (TLS)
 id 14.3.408.0; Mon, 27 May 2019 22:31:07 -0700
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.33]) by
 SHSMSX154.ccr.corp.intel.com ([169.254.7.136]) with mapi id 14.03.0415.000;
 Tue, 28 May 2019 13:31:05 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/2] x86: init_hypercall_page() cleanup
Thread-Index: AQHVEVEltASpU7XOtUGtT86nApOiWaaACkog
Date: Tue, 28 May 2019 05:31:04 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19CA4E6B9@SHSMSX104.ccr.corp.intel.com>
References: <1558606816-17842-1-git-send-email-andrew.cooper3@citrix.com>
 <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
In-Reply-To: <1558606816-17842-2-git-send-email-andrew.cooper3@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTE1ZDZhOGUtOTBjMy00NGJmLTk5OTEtMGRkZDZmOTRhMGM3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoidzhwWXZYb013TGlCZ21PbjM1RUUyQThYUXFyVGNMTjdSeWZqQWZUQlJ4bzNQK05Kd2RRTEJKa0k4Z2pkYjRoTSJ9
dlp-product: dlpe-windows
dlp-version: 11.0.400.15
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/2] x86: init_hypercall_page() cleanup
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
Cc: Wei Liu <wei.liu2@citrix.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 Jan Beulich <JBeulich@suse.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Brian Woods <brian.woods@amd.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBBbmRyZXcgQ29vcGVyIFttYWlsdG86YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbV0N
Cj4gU2VudDogVGh1cnNkYXksIE1heSAyMywgMjAxOSA2OjIwIFBNDQo+IA0KPiBUaGUgdmFyaW91
cyBwaWVjZXMgb2YgdGhlIGh5cGVyY2FsbCBwYWdlIGluZnJhc3RydWN0dXJlIGhhdmUgZ3Jvd24N
Cj4gb3JnYW5pY2FsbHkgb3ZlciB0aW1lIGFuZCBlbmRlZCB1cCBpbiBhIGJpdCBvZiBhIG1lc3Mu
DQo+IA0KPiAgKiBSZW5hbWUgYWxsIGZ1bmN0aW9ucyB0byBiZSBvZiB0aGUgZm9ybSAqX2luaXRf
aHlwZXJjYWxsX3BhZ2UoKS4gIFRoaXMNCj4gICAgbWFrZXMgdGhlbSBzb21ld2hhdCBzaG9ydGVy
LCBhbmQgbWVhbnMgdGhleSBjYW4gYWN0dWFsbHkgYmUgZ3JlcHBlZA0KPiAgICBmb3IgaW4gb25l
IGdvLg0KPiAgKiBNb3ZlIGluaXRfaHlwZXJjYWxsX3BhZ2UoKSB0byBkb21haW4uYy4gIFRoZSA2
NC1iaXQgdHJhcHMuYyBpc24ndCBhDQo+ICAgIHRlcnJpYmx5IGFwcHJvcHJpYXRlIHBsYWNlIGZv
ciBpdCB0byBsaXZlLg0KPiAgKiBEcm9wIGFuIG9ic29sZXRlIGNvbW1lbnQgZnJvbSBodm1faW5p
dF9oeXBlcmNhbGxfcGFnZSgpIGFuZCBkcm9wIHRoZQ0KPiAgICBkb21haW4gcGFyYW1ldGVyIGZy
b20gaHZtX2Z1bmNzLmluaXRfaHlwZXJjYWxsX3BhZ2UoKSBhcyBpdCBpc24ndA0KPiAgICBuZWNl
c3NhcnkuDQo+ICAqIFJlYXJyYW5nZSB0aGUgbG9naWMgaW4gdGhlIGVhY2ggZnVuY3Rpb24gdG8g
YXZvaWQgbmVlZGluZyBleHRyYSBsb2NhbA0KPiAgICB2YXJpYWJsZXMsIGFuZCB0byB3cml0ZSB0
aGUgcGFnZSBpbiBvbmUgc2luZ2xlIHBhc3MuDQo+IA0KPiBObyBmdW5jdGlvbmFsIGNoYW5nZS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4N
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
