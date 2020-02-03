Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7606D15023F
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 09:09:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyWla-0001Gy-UW; Mon, 03 Feb 2020 08:07:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9SF=3X=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyWlZ-0001Gp-Gw
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 08:07:33 +0000
X-Inumbo-ID: 3940f9bc-465c-11ea-8e36-12813bfff9fa
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3940f9bc-465c-11ea-8e36-12813bfff9fa;
 Mon, 03 Feb 2020 08:07:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 00:07:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,397,1574150400"; d="scan'208";a="378015991"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
 by orsmga004.jf.intel.com with ESMTP; 03 Feb 2020 00:07:29 -0800
Received: from fmsmsx120.amr.corp.intel.com (10.18.124.208) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 00:07:28 -0800
Received: from shsmsx105.ccr.corp.intel.com (10.239.4.158) by
 fmsmsx120.amr.corp.intel.com (10.18.124.208) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 00:07:28 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX105.ccr.corp.intel.com ([169.254.11.138]) with mapi id 14.03.0439.000;
 Mon, 3 Feb 2020 16:07:26 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/2] nvmx: always trap accesses to x2APIC MSRs
Thread-Index: AQHV1rLOPz0l/1+/BEes6krsK+F3HqgJJB1Q
Date: Mon, 3 Feb 2020 08:07:25 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D75F8B5@SHSMSX104.ccr.corp.intel.com>
References: <20200129144514.96686-1-roger.pau@citrix.com>
 <20200129144514.96686-3-roger.pau@citrix.com>
In-Reply-To: <20200129144514.96686-3-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNWE5MDMwOGQtODk2NS00MDA0LTkwZjgtOTUyNWY3MDc2ZmU0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoic0lqQUFtNFg5WU5UQ3EzcUZiMmlYdm9IandFZElsZGc2ekhkeTc4TmpWUnVDdlJSUXVUTVVaQ00yTGhaK3BqKyJ9
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/2] nvmx: always trap accesses to x2APIC
 MSRs
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Nakajima,
 Jun" <jun.nakajima@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiBX
ZWRuZXNkYXksIEphbnVhcnkgMjksIDIwMjAgMTA6NDUgUE0NCj4gDQo+IE5lc3RlZCBWTVggZG9l
c24ndCBleHBvc2Ugc3VwcG9ydCBmb3INCj4gU0VDT05EQVJZX0VYRUNfVklSVFVBTElaRV9YMkFQ
SUNfTU9ERSwNCj4gU0VDT05EQVJZX0VYRUNfVklSVFVBTF9JTlRSX0RFTElWRVJZIG9yDQo+IFNF
Q09OREFSWV9FWEVDX0FQSUNfUkVHSVNURVJfVklSVCwgYW5kIGhlbmNlIHRoZSB4MkFQSUMgTVNS
cyBzaG91bGQNCj4gYWx3YXlzIGJlIHRyYXBwZWQgaW4gdGhlIG5lc3RlZCBndWVzdCBNU1IgYml0
bWFwLCBvciBlbHNlIGEgbmVzdGVkDQo+IGd1ZXN0IGNvdWxkIGFjY2VzcyB0aGUgaGFyZHdhcmUg
eDJBUElDIE1TUnMgZ2l2ZW4gY2VydGFpbiBjb25kaXRpb25zLg0KPiANCj4gQWNjZXNzaW5nIHRo
ZSBoYXJkd2FyZSBNU1JzIGNvdWxkIGJlIGFjaGlldmVkIGJ5IGZvcmNpbmcgdGhlIEwwIFhlbiB0
bw0KPiB1c2UgU0VDT05EQVJZX0VYRUNfVklSVFVBTElaRV9YMkFQSUNfTU9ERSBhbmQNCj4gU0VD
T05EQVJZX0VYRUNfVklSVFVBTF9JTlRSX0RFTElWRVJZIG9yDQo+IFNFQ09OREFSWV9FWEVDX0FQ
SUNfUkVHSVNURVJfVklSVCAoaWYgc3VwcG9ydGVkKSwgYW5kIHRoZW4gY3JlYXRpbmcgYQ0KPiBM
MiBndWVzdCB3aXRoIGEgTVNSIGJpdG1hcCB0aGF0IGRvZXNuJ3QgdHJhcCBhY2Nlc3NlcyB0byB0
aGUgeDJBUElDDQo+IE1TUiByYW5nZS4gVGhlbiBPUidpbmcgYm90aCBMMCBhbmQgTDEgTVNSIGJp
dG1hcHMgd291bGQgcmVzdWx0IGluIGENCj4gYml0bWFwIHRoYXQgZG9lc24ndCB0cmFwIGNlcnRh
aW4geDJBUElDIE1TUnMgYW5kIGEgVk1DUyB0aGF0IGRvZXNuJ3QNCj4gaGF2ZSBTRUNPTkRBUllf
RVhFQ19WSVJUVUFMSVpFX1gyQVBJQ19NT0RFIGFuZA0KPiBTRUNPTkRBUllfRVhFQ19WSVJUVUFM
X0lOVFJfREVMSVZFUlkgb3INCj4gU0VDT05EQVJZX0VYRUNfQVBJQ19SRUdJU1RFUl9WSVJUIHNl
dCBlaXRoZXIuDQo+IA0KPiBGaXggdGhpcyBieSBtYWtpbmcgc3VyZSB4MkFQSUMgTVNScyBhcmUg
YWx3YXlzIHRyYXBwZWQgaW4gdGhlIG5lc3RlZA0KPiBNU1IgYml0bWFwLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQoNClJldmll
d2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
