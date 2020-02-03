Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3F7150246
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 09:10:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyWmL-0001Ll-9M; Mon, 03 Feb 2020 08:08:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l9SF=3X=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1iyWmI-0001Lb-RC
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 08:08:18 +0000
X-Inumbo-ID: 54926660-465c-11ea-b211-bc764e2007e4
Received: from mga09.intel.com (unknown [134.134.136.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54926660-465c-11ea-b211-bc764e2007e4;
 Mon, 03 Feb 2020 08:08:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 00:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,397,1574150400"; d="scan'208";a="429366792"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2020 00:08:15 -0800
Received: from fmsmsx112.amr.corp.intel.com (10.18.116.6) by
 FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 00:08:14 -0800
Received: from shsmsx101.ccr.corp.intel.com (10.239.4.153) by
 FMSMSX112.amr.corp.intel.com (10.18.116.6) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 3 Feb 2020 00:08:14 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX101.ccr.corp.intel.com ([169.254.1.222]) with mapi id 14.03.0439.000;
 Mon, 3 Feb 2020 16:08:11 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Paul Durrant <pdurrant@amazon.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v7 1/3] x86 / vmx: move teardown from domain_destroy()...
Thread-Index: AQHV1scRrFujBLkofEO79936uMDuMKgJJIDw
Date: Mon, 3 Feb 2020 08:08:12 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D75F8D0@SHSMSX104.ccr.corp.intel.com>
References: <20200129171030.1341-1-pdurrant@amazon.com>
 <20200129171030.1341-2-pdurrant@amazon.com>
In-Reply-To: <20200129171030.1341-2-pdurrant@amazon.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjE4MWUwMTUtOTdjYy00MzI5LWI1NWEtMzQ5MDlkMTU3NGE4IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZkFHcEd0Nys4Nkl1V1wvazN4dVlIRWxhaTNBUStvSFFmY1JrUmNWRjhBc3l2N1pJUlNWcFlOOFwvc3lHV0NsK1dsIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v7 1/3] x86 / vmx: move teardown from
 domain_destroy()...
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
Cc: "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IFNlbnQ6IFRodXJz
ZGF5LCBKYW51YXJ5IDMwLCAyMDIwIDE6MTAgQU0NCj4gDQo+IC4uLiB0byBkb21haW5fcmVsaW5x
dWlzaF9yZXNvdXJjZXMoKS4NCj4gDQo+IFRoZSB0ZWFyZG93biBjb2RlIGZyZWVzIHRoZSBBUElD
diBwYWdlLiBUaGlzIGRvZXMgbm90IG5lZWQgdG8gYmUgZG9uZSBsYXRlDQo+IHNvIGRvIGl0IGlu
IGRvbWFpbl9yZWxpbnF1aXNoX3Jlc291cmNlcygpIHJhdGhlciB0aGFuIGRvbWFpbl9kZXN0cm95
KCkuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpvbi5j
b20+DQoNClJldmlld2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
