Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72B7716B8
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 13:08:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpsao-0002uB-Lr; Tue, 23 Jul 2019 11:04:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=079Z=VU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hpsan-0002u6-Oq
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 11:04:25 +0000
X-Inumbo-ID: 9e734c84-ad39-11e9-8ee1-db8857b539f7
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e734c84-ad39-11e9-8ee1-db8857b539f7;
 Tue, 23 Jul 2019 11:04:20 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qgY6pLR65qmM0scqpFtzhlleUqYeVsIg2PovaCi3OPVPJ6QTfnp3hF03toeymsdh2rTAoCSb3p
 jB4YH+DDokL85WdKY/bjpK55dn+XpvRLBPgtOjIKG6LTcCVv1VIIAxHik1pMXcZwDpbBUXs88e
 016efK/qsmzLCkipkhYG13hnp6gWovyxRc+5DO693AKbretvLi1u0KJNtozy9CbpstBYvKij6C
 gdApo5Tyo/SvOSL8n8TKdrzTRzgA08RFlQazu6QttOtfXcsFpq8835owohjqOYYq7mfhVl8O73
 tJI=
X-SBRS: 2.7
X-MesageID: 3323284
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,298,1559534400"; 
   d="scan'208";a="3323284"
Date: Tue, 23 Jul 2019 13:04:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190723110406.76tju5odg7bvsvr7@Air-de-Roger>
References: <20190719140724.69596-1-roger.pau@citrix.com>
 <20190719140724.69596-4-roger.pau@citrix.com>
 <526d01d2-f7c5-b3a9-9947-db4d4e44347d@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <526d01d2-f7c5-b3a9-9947-db4d4e44347d@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v4 3/6] pci: switch pci_conf_read32 to use
 pci_sbdf_t
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Brian
 Woods <brian.woods@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMTA6MTU6MzVBTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTkuMDcuMjAxOSAxNjowNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gVGhp
cyByZWR1Y2VzIHRoZSBudW1iZXIgb2YgcGFyYW1ldGVycyBvZiB0aGUgZnVuY3Rpb24gdG8gdHdv
LCBhbmQKPiA+IHNpbXBsaWZpZXMgc29tZSBvZiB0aGUgY2FsbGluZyBzaXRlcy4KPiA+IAo+ID4g
V2hpbGUgdGhlcmUgY29udmVydCB7SUdEL0lPSH1fREVWIHRvIGJlIGEgcGNpX3NiZGZfdCBpdHNl
bGYgaW5zdGVhZCBvZgo+ID4gYSBkZXZpY2UgbnVtYmVyLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5
OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IEFja2VkLWJ5OiBC
cmlhbiBXb29kcyA8YnJpYW4ud29vZHNAYW1kLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBLZXZpbiBU
aWFuIDxrZXZpbi50aWFuQGludGVsLmNvbT4KPiAKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgo+IHdpdGggb25lIGZ1cnRoZXIgcmVtYXJrIChlYXNpbHkgYWRkcmVz
c2VkIHdoaWxlIGNvbW1pdHRpbmcpOgo+IAo+ID4gQEAgLTEyOCw5ICsxMjgsOSBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgbWFwX2lnZF9yZWcodm9pZCkKPiA+ICAgICAgIGlmICggaWdkX3JlZ192YSAp
Cj4gPiAgICAgICAgICAgcmV0dXJuOwo+ID4gICAKPiA+IC0gICAgaWdkX21taW8gICA9IHBjaV9j
b25mX3JlYWQzMigwLCAwLCBJR0RfREVWLCAwLCBQQ0lfQkFTRV9BRERSRVNTXzEpOwo+ID4gKyAg
ICBpZ2RfbW1pbyAgID0gcGNpX2NvbmZfcmVhZDMyKElHRF9ERVYsIFBDSV9CQVNFX0FERFJFU1Nf
MSk7Cj4gPiAgICAgICBpZ2RfbW1pbyA8PD0gMzI7Cj4gPiAtICAgIGlnZF9tbWlvICArPSBwY2lf
Y29uZl9yZWFkMzIoMCwgMCwgSUdEX0RFViwgMCwgUENJX0JBU0VfQUREUkVTU18wKTsKPiA+ICsg
ICAgaWdkX21taW8gICs9IHBjaV9jb25mX3JlYWQzMihJR0RfREVWLCAgUENJX0JBU0VfQUREUkVT
U18wKTsKPiAKPiBUaGVyZSBsb29rcyB0byBiZSBhIHN0cmF5IGJsYW5rIGluIGhlcmUuCgpHb29k
IGNhdGNoLCBwbGVhc2UgYWRqdXN0IG9uIGNvbW1pdCBpZiB5b3UgZG9uJ3QgbWluZC4KClRoYW5r
cywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
