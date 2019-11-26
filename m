Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C170F10A125
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 16:25:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZcec-00073n-7h; Tue, 26 Nov 2019 15:21:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G2sx=ZS=amazon.com=prvs=226091ee5=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iZceb-00073i-EO
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 15:21:25 +0000
X-Inumbo-ID: 681df5fa-1060-11ea-a3a3-12813bfff9fa
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 681df5fa-1060-11ea-a3a3-12813bfff9fa;
 Tue, 26 Nov 2019 15:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574781684; x=1606317684;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=C4mr9QM0vYmpSnmLcPXZ4ZLGzT2EayHd+JROtWxaQbk=;
 b=I1hVCbhjmfpeXnmv0bNVEY4Gfg7G7wY7v/jTeCCfnnSIrztTynXQpbX7
 M1RVDpnH9kRbIjQpK/9zHYB+dVcZeOC4u2l58wkQuyjCv8qWK7AzWXWQ1
 ILi2HzDMnfBiAwMeTfogWM0Rpu6Qj1BtoTNcCOZ2vyMryJ0rCzOjvVhSW s=;
IronPort-SDR: f1OJInGBY2inzocECBGrbxQgyORK00cCIIN6u5jUKYpdPCavwxugwDKy/oMDxXYsBJPR1Nws55
 ZVuohJdzmsOQ==
X-IronPort-AV: E=Sophos;i="5.69,246,1571702400"; d="scan'208";a="11363240"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 26 Nov 2019 15:21:12 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-16acd5e0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 05925A2D7F; Tue, 26 Nov 2019 15:21:10 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:21:10 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 26 Nov 2019 15:21:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 26 Nov 2019 15:21:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Ian Jackson <ian.jackson@citrix.com>, George Dunlap
 <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>
Thread-Topic: [PATCH for-4.13] docs/xl: Document pci-assignable state
Thread-Index: AQHVpGsAqCvWO7fUTEaoXMLhP52Fm6edkH/A
Date: Tue, 26 Nov 2019 15:21:09 +0000
Message-ID: <a4f6b45437a74632b8305fef08297c59@EX13D32EUC003.ant.amazon.com>
References: <20191126141026.2858622-1-george.dunlap@citrix.com>
 <24029.13124.935192.209484@mariner.uk.xensource.com>
 <afd686bc-27fa-adbf-910d-75ef8cb5ab40@citrix.com>
 <24029.16141.74013.802354@mariner.uk.xensource.com>
 <24029.16211.130373.861346@mariner.uk.xensource.com>
In-Reply-To: <24029.16211.130373.861346@mariner.uk.xensource.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-4.13] docs/xl: Document pci-assignable
 state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+IEZyb206IElhbiBKYWNrc29uIDxpYW4uamFj
a3NvbkBjaXRyaXguY29tPgo+IFNlbnQ6IDI2IE5vdmVtYmVyIDIwMTkgMTU6MDYKPiBUbzogR2Vv
cmdlIER1bmxhcCA8Z2VvcmdlLmR1bmxhcEBjaXRyaXguY29tPjsgeGVuLQo+IGRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnOyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2gKPiA8amJl
dWxpY2hAc3VzZS5jb20+OyBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgSnVl
cmdlbiBHcm9zcwo+IDxqZ3Jvc3NAc3VzZS5jb20+Cj4gU3ViamVjdDogUmU6IFtQQVRDSCBmb3It
NC4xM10gZG9jcy94bDogRG9jdW1lbnQgcGNpLWFzc2lnbmFibGUgc3RhdGUKPiAKPiBJYW4gSmFj
a3NvbiB3cml0ZXMgKCJSZTogW1BBVENIIGZvci00LjEzXSBkb2NzL3hsOiBEb2N1bWVudCBwY2kt
YXNzaWduYWJsZQo+IHN0YXRlIik6Cj4gPiBHZW9yZ2UgRHVubGFwIHdyaXRlcyAoIlJlOiBbUEFU
Q0ggZm9yLTQuMTNdIGRvY3MveGw6IERvY3VtZW50IHBjaS0KPiBhc3NpZ25hYmxlIHN0YXRlIik6
Cj4gPiA+IEkga2luZCBvZiBmZWVsIGxpa2UgdGhlIGRpc2N1c3Npb24gb2YgdGhlIHNlY3VyaXR5
IHJpc2tzIGluaGVyZW50IGluCj4gcGNpCj4gPiA+IHBhc3N0aHJvdWdoIGJlbG9uZyBpbiBhIHNl
cGFyYXRlIGRvY3VtZW50LCBidXQgcGVyaGFwcyBhIGJyaWVmIG1lbnRpb24KPiA+ID4gaGVyZSB3
b3VsZCBiZSBoZWxwZnVsLiAgUGVyaGFwcyB0aGUgZm9sbG93aW5nPwo+ID4gPgo+ID4gPiAiQXMg
YWx3YXlzLCB0aGlzIHNob3VsZCBvbmx5IGJlIGRvbmUgaWYgeW91IHRydXN0IHRoZSBndWVzdCwg
b3IgYXJlCj4gPiA+IGNvbmZpZGVudCB0aGF0IHRoZSBwYXJ0aWN1bGFyIGRldmljZSB5b3UncmUg
cmUtYXNzaWduaW5nIHRvIGRvbTAgd2lsbAo+ID4gPiBjYW5jZWwgYWxsIGluLWZsaWdodCBETUEg
b24gRkxSLiIKPiA+Cj4gPiBTR1RNLgo+ID4KPiA+IEkgbGlrZSAiYXMgYWx3YXlzIiB3aGljaCBj
bGVhcmx5IHNpZ25hbHMgdGhhdCB0aGlzIGlzIGEgbW9yZSBnZW5lcmFsCj4gPiBwcm9ibGVtIHdp
dGhvdXQgcmVxdWlyaW5nIHVzIHRvIGFjdHVhbGx5IHdyaXRlIHRoYXQgb3RoZXIKPiA+IGNvbXBy
ZWhlbnNpdmUgZG9jdW1lbnQuLi4KPiAKClRoZSB0ZXh0IHNvdW5kcyBmaW5lIGluIGdlbmVyYWwg
YnV0IHRoZSAnYXMgYWx3YXlzJyBkb2VzIHJhdGhlciBpbXBseSAnaGV5LCB3ZSBuZXZlciBzYWlk
IFBDSSBwYXNzLXRocm91Z2ggd2FzIHNhZmUsIGRpZCB3ZT8nCgogIFBhdWwKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
