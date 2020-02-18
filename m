Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD4D162087
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 06:44:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3vdm-0003T4-IU; Tue, 18 Feb 2020 05:41:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qq7b=4G=intel.com=kevin.tian@srs-us1.protection.inumbo.net>)
 id 1j3vdl-0003Sz-P9
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 05:41:49 +0000
X-Inumbo-ID: 5aa57ee6-5211-11ea-ade5-bc764e2007e4
Received: from mga11.intel.com (unknown [192.55.52.93])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aa57ee6-5211-11ea-ade5-bc764e2007e4;
 Tue, 18 Feb 2020 05:41:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Feb 2020 21:41:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,455,1574150400"; d="scan'208";a="239251880"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
 by orsmga006.jf.intel.com with ESMTP; 17 Feb 2020 21:41:46 -0800
Received: from fmsmsx158.amr.corp.intel.com (10.18.116.75) by
 FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:41:46 -0800
Received: from shsmsx152.ccr.corp.intel.com (10.239.6.52) by
 fmsmsx158.amr.corp.intel.com (10.18.116.75) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Mon, 17 Feb 2020 21:41:46 -0800
Received: from shsmsx104.ccr.corp.intel.com ([169.254.5.5]) by
 SHSMSX152.ccr.corp.intel.com ([169.254.6.158]) with mapi id 14.03.0439.000;
 Tue, 18 Feb 2020 13:41:42 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Juergen Gross <jgross@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] xen: do live patching only from main idle loop
Thread-Index: AQHV4L4NyWdUsxOTo0OTq5DZXainSKggepnw
Date: Tue, 18 Feb 2020 05:41:42 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D19D78ADD4@SHSMSX104.ccr.corp.intel.com>
References: <20200211093122.5644-1-jgross@suse.com>
In-Reply-To: <20200211093122.5644-1-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiODgxODQ1MzUtZjY0ZS00MTIwLThhZjYtNDEyNGNlN2ZjODZlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZ0RwaEd6Ykh2OSt3ck9qUjJ5R205dWs0ZVltQ1NVSEZRUnREYlRLQkhvR0ZMNE00UFwveHQxMnBGSVVcL3gxWW1xIn0=
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.239.127.40]
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen: do live patching only from main idle
 loop
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 "Nakajima, Jun" <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiBGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+Cj4gU2VudDogVHVlc2RheSwg
RmVicnVhcnkgMTEsIDIwMjAgNTozMSBQTQo+IAo+IE9uZSBvZiB0aGUgbWFpbiBkZXNpZ24gZ29h
bHMgb2YgY29yZSBzY2hlZHVsaW5nIGlzIHRvIGF2b2lkIGFjdGlvbnMKPiB3aGljaCBhcmUgbm90
IGRpcmVjdGx5IHJlbGF0ZWQgdG8gdGhlIGRvbWFpbiBjdXJyZW50bHkgcnVubmluZyBvbiBhCj4g
Z2l2ZW4gY3B1IG9yIGNvcmUuIExpdmUgcGF0Y2hpbmcgaXMgb25lIG9mIHRob3NlIGFjdGlvbnMg
d2hpY2ggYXJlCj4gYWxsb3dlZCB0YWtpbmcgcGxhY2Ugb24gYSBjcHUgb25seSB3aGVuIHRoZSBp
ZGxlIHNjaGVkdWxpbmcgdW5pdCBpcwo+IGFjdGl2ZSBvbiB0aGF0IGNwdS4KPiAKPiBVbmZvcnR1
bmF0ZWx5IGxpdmUgcGF0Y2hpbmcgdHJpZXMgdG8gZm9yY2UgdGhlIGNwdXMgaW50byB0aGUgaWRs
ZSBsb29wCj4ganVzdCBieSByYWlzaW5nIHRoZSBzY2hlZHVsZSBzb2Z0aXJxLCB3aGljaCB3aWxs
IG5vIGxvbmdlciBiZQo+IGd1YXJhbnRlZWQgdG8gd29yayB3aXRoIGNvcmUgc2NoZWR1bGluZyBh
Y3RpdmUuIEFkZGl0aW9uYWxseSB0aGVyZSBhcmUKPiBzdGlsbCBzb21lIHBsYWNlcyBpbiB0aGUg
aHlwZXJ2aXNvciBjYWxsaW5nIGNoZWNrX2Zvcl9saXZlcGF0Y2hfd29yaygpCj4gd2l0aG91dCBi
ZWluZyBpbiB0aGUgaWRsZSBsb29wLgo+IAo+IEl0IGlzIGVhc3kgdG8gZm9yY2UgYSBjcHUgaW50
byB0aGUgbWFpbiBpZGxlIGxvb3AgYnkgc2NoZWR1bGluZyBhCj4gdGFza2xldCBvbiBpdC4gU28g
c3dpdGNoIGxpdmUgcGF0Y2hpbmcgdG8gdXNlIHRhc2tsZXRzIGZvciBzd2l0Y2hpbmcgdG8KPiBp
ZGxlIGFuZCByYWlzaW5nIHNjaGVkdWxpbmcgZXZlbnRzLiBBZGRpdGlvbmFsbHkgdGhlIGNhbGxz
IG9mCj4gY2hlY2tfZm9yX2xpdmVwYXRjaF93b3JrKCkgb3V0c2lkZSB0aGUgbWFpbiBpZGxlIGxv
b3AgY2FuIGJlIGRyb3BwZWQuCj4gCj4gQXMgdGFza2xldHMgYXJlIG9ubHkgcnVubmluZyBvbiBp
ZGxlIHZjcHVzIGFuZCBzdG9wX21hY2hpbmVfcnVuKCkKPiBpcyBhY3RpdmF0aW5nIHRhc2tsZXRz
IG9uIGFsbCBjcHVzIGJ1dCB0aGUgb25lIGl0IGhhcyBiZWVuIGNhbGxlZCBvbgo+IHRvIHJlbmRl
enZvdXMsIGl0IGlzIG1hbmRhdG9yeSBmb3Igc3RvcF9tYWNoaW5lX3J1bigpIHRvIGJlIGNhbGxl
ZCBvbgo+IGFuIGlkbGUgdmNwdSwgdG9vLCBhcyBvdGhlcndpc2UgdGhlcmUgaXMgbm8gd2F5IGZv
ciBzY2hlZHVsaW5nIHRvCj4gYWN0aXZhdGUgdGhlIGlkbGUgdmNwdSBmb3IgdGhlIHRhc2tsZXQg
b24gdGhlIHNpYmxpbmcgb2YgdGhlIGNwdQo+IHN0b3BfbWFjaGluZV9ydW4oKSBoYXMgYmVlbiBj
YWxsZWQgb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2Uu
Y29tPgoKUmV2aWV3ZWQtYnk6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
