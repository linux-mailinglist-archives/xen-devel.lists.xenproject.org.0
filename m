Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B31151905
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2020 11:55:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyvoL-0000Kf-TN; Tue, 04 Feb 2020 10:52:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uGhi=3Y=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1iyvoK-0000Ka-Nh
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2020 10:52:04 +0000
X-Inumbo-ID: 609f3e98-473c-11ea-b211-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 609f3e98-473c-11ea-b211-bc764e2007e4;
 Tue, 04 Feb 2020 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580813523;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=AstSI9OgbJCLZgAp45vzmljtTtZ5p9/e/vU3B/udALI=;
 b=U2ZBa9WSIa+xdfKbuRRx33WFYkMauaQdLIqNJ6zWT0TTHhJwq+mgUJbq
 h5Dep2uvOB4iu209Cm5WZNxLEHzdFKohLq6cqa8K5W0yyijjGdb0culmc
 A4ImW5mdnYsLwOyRVUa2kMU0X1sBC3bWzsemuEaePtYdyhOfUlLXsRumT A=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8bPe5MZqYW8vIhieT7DgbQzJ3bXNA//lpS75XM0H7KvOY0um3eTo1Xtm8ms7MJNXjGqxGkoDEX
 RKFGrNr7Niv5OQu3i/igo06FRlXDIrfOaPZb8+0kDKcluIjQPGuiv0QfyZyvK0VUZ4HU5mrFoY
 4fSsyM/gKvl6YyF4HP61R02ucLgT5iYdkrhB6mS9CZcXru8xL7U2iUaWxMRZzxDWrGLUVRlyRr
 9/IkOGfoxhZRDwQj+bYXTS39o+GtTZhjRszrk0eOK1z0gQmCsTAbvjflrTQp4z/tiWND43ydq6
 AfQ=
X-SBRS: 2.7
X-MesageID: 12278139
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,401,1574139600"; d="scan'208";a="12278139"
Date: Tue, 4 Feb 2020 11:51:56 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200204105156.GH4679@Air-de-Roger>
References: <20200204093411.15887-1-julien@xen.org>
 <20200204093411.15887-3-julien@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204093411.15887-3-julien@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 2/2] xen/x86: hap: Clean-up and harden
 hap_enable()
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
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDk6MzQ6MTFBTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVW5saWtl
IHNoYWRvd19lbmFibGUoKSwgaGFwX2VuYWJsZSgpIGNhbiBvbmx5IGJlIGNhbGxlZCBvbmNlIGR1
cmluZwo+IGRvbWFpbiBjcmVhdGlvbiBhbmQgd2l0aCB0aGUgbW9kZSBlcXVhbCB0byBtb2RlIGVx
dWFsIHRvCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gZXF1YWxzIHRvCj4g
UEdfZXh0ZXJuYWwgfCBQR190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMuCj4gCj4gSWYgaXQgd2Vy
ZSBjYWxsZWQgdHdpY2UsIHRoZW4gd2UgbWlnaHQgaGF2ZSBzb21ldGhpbmcgaW50ZXJlc3RpbmcK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gYSBwcm9ibGVt
Cj4gcHJvYmxlbSBhcyB0aGUgcDJtIHRhYmxlcyB3b3VsZCBiZSByZS1hbGxvY2F0ZWQgKGFuZCB0
aGVyZWZvcmUgYWxsIHRoZQo+IG1hcHBpbmdzIHdvdWxkIGJlIGxvc3QpLgo+IAo+IEFkZCBjb2Rl
IHRvIHNhbml0eSBjaGVjayB0aGUgbW9kZSBhbmQgdGhhdCB0aGUgZnVuY3Rpb24gaXMgb25seSBj
YWxsZWQKPiBvbmNlLiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byBhbiBpZiBjaGVja2luZyB0aGF0
IFBHX3RyYW5zbGF0ZSBpcyBzZXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXiBh
ZGQgYW4gaWYKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGpncmFsbEBhbWF6b24u
Y29tPgo+IAo+IC0tLQo+IAo+IEl0IGlzIG5vdCBlbnRpcmVseSBjbGVhciB3aGVuIFBHX3RyYW5z
bGF0ZSB3YXMgZW5mb3JjZWQuCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMgfCAx
OCArKysrKysrKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFw
LmMgYi94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCj4gaW5kZXggMzEzNjJhMzFiNi4uYjczNGUy
ZTZkMyAxMDA2NDQKPiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vaGFwL2hhcC5jCj4gKysrIGIveGVu
L2FyY2gveDg2L21tL2hhcC9oYXAuYwo+IEBAIC00NDUsNiArNDQ1LDEzIEBAIGludCBoYXBfZW5h
YmxlKHN0cnVjdCBkb21haW4gKmQsIHUzMiBtb2RlKQo+ICAgICAgdW5zaWduZWQgaW50IGk7Cj4g
ICAgICBpbnQgcnYgPSAwOwo+ICAKPiArICAgIGlmICggbW9kZSAhPSAoUEdfZXh0ZXJuYWwgfCBQ
R190cmFuc2xhdGUgfCBQR19yZWZjb3VudHMpICkKPiArICAgICAgICByZXR1cm4gLUVJTlZBTDsK
PiArCj4gKyAgICAvKiBUaGUgZnVuY3Rpb24gY2FuIG9ubHkgYmUgY2FsbGVkIG9uY2UgKi8KPiAr
ICAgIGlmICggZC0+YXJjaC5wYWdpbmcubW9kZSAhPSAwICkKPiArICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKCklmIHlvdSB3YW50IHRvIHJldHVybiBFSU5WQUwgZm9yIGJvdGggdGhleSBjYW4gYmUg
bWVyZ2VkIGludG8gYSBzaW5nbGUKaWYuIEFsc28gbm90ZSB0aGF0IHRoaXMgd291bGQgdXN1YWxs
eSBiZSB3cml0dGVuIGFzCmlmICggZC0+YXJjaC5wYWdpbmcubW9kZSApIHRvIGtlZXAgaXQgc2hv
cnRlci4KCkFsYmVpdCBJIHRoaW5rIHlvdSBtaWdodCB3YW50IHRvIHJldHVybiBFRVhJU1QgaW5z
dGVhZCBvZiBFSU5WQUwgaWYKbW9kZSBpcyBhbHJlYWR5IHNldC4KCj4gKwo+ICAgICAgZG9tYWlu
X3BhdXNlKGQpOwo+ICAKPiAgICAgIG9sZF9wYWdlcyA9IGQtPmFyY2gucGFnaW5nLmhhcC50b3Rh
bF9wYWdlczsKPiBAQCAtNDY1LDEzICs0NzIsMTAgQEAgaW50IGhhcF9lbmFibGUoc3RydWN0IGRv
bWFpbiAqZCwgdTMyIG1vZGUpCj4gICAgICBkLT5hcmNoLnBhZ2luZy5hbGxvY19wYWdlID0gaGFw
X2FsbG9jX3AybV9wYWdlOwo+ICAgICAgZC0+YXJjaC5wYWdpbmcuZnJlZV9wYWdlID0gaGFwX2Zy
ZWVfcDJtX3BhZ2U7Cj4gIAo+IC0gICAgLyogYWxsb2NhdGUgUDJtIHRhYmxlICovCj4gLSAgICBp
ZiAoIG1vZGUgJiBQR190cmFuc2xhdGUgKQo+IC0gICAgewo+IC0gICAgICAgIHJ2ID0gcDJtX2Fs
bG9jX3RhYmxlKHAybV9nZXRfaG9zdHAybShkKSk7Cj4gLSAgICAgICAgaWYgKCBydiAhPSAwICkK
PiAtICAgICAgICAgICAgZ290byBvdXQ7Cj4gLSAgICB9Cj4gKyAgICAvKiBhbGxvY2F0ZSBQMk0g
dGFibGUgKi8KPiArICAgIHJ2ID0gcDJtX2FsbG9jX3RhYmxlKHAybV9nZXRfaG9zdHAybShkKSk7
Cj4gKyAgICBpZiAoIHJ2ICE9IDAgKQoKSSB3b3VsZCBhbHNvIGF2b2lkIGNvbXBhcmluZyBhZ2Fp
bnN0IDAgaGVyZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
