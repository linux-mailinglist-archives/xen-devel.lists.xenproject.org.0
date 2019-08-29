Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E208A1518
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 11:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3Gu6-0008Vc-L2; Thu, 29 Aug 2019 09:39:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8sxS=WZ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1i3Gu4-0008VV-Eo
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 09:39:40 +0000
X-Inumbo-ID: ebb45712-ca40-11e9-b95f-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebb45712-ca40-11e9-b95f-bc764e2007e4;
 Thu, 29 Aug 2019 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1567071579;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=s0JG4hyDFWYOhPHOaeXte3EUPL0rrCT/1G/WQo4qMh0=;
 b=Iu8E6G8fCCAfkn4Z3YQZGUk1fj1gMjv8de9dWca8s76RSWx5xtdO472q
 +YDaTuMARfVhp8FvrjkqNV+KSfVuRHgbZklGpNw8RJO/tIFVX57ovXYoW
 t3mJKgs6VHQ8ZSeMSA2aadrwGmMqUXO+YxwvEWSEMe4U4nPwnazQzzsnQ g=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ztGdyL67XlN8skthbSvQKGQxbOaZ667ILQSC3BwfCGDna4bq3WlCiRh52T4LtVzbi+lqp3ukOm
 D74DjjCOi2DneH/ihUzyuPbhB6qPq49Xukn7KsEqwFWinRQwC2ELu109IWcx1ipCYpbvDlJQdW
 mFUivil8A9roexItt1WJZw9GP8msWbV6+FPVwVnAfGX0/Y/t9XIcgy6CY2+nvAsKdCi6BFDaP8
 rdI00jYwnq3cVfwEAqvr5rcMcR3m8uWtZLoOCPbDLggkexzBNWI8bBY2veiKA3cyxdYTktYeTv
 8mk=
X-SBRS: 2.7
X-MesageID: 4867559
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,442,1559534400"; 
   d="scan'208";a="4867559"
Date: Thu, 29 Aug 2019 11:39:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190829093932.db5qfkzxs3ilwxup@Air-de-Roger>
References: <20190829084918.89608-1-roger.pau@citrix.com>
 <b17ee631-4cd8-1cd1-746b-9652be42c6d8@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b17ee631-4cd8-1cd1-746b-9652be42c6d8@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2] Partially revert "x86/mm: Clean IOMMU
 flags from p2m-pt code"
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
Cc: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 xen-devel@lists.xenproject.org, George
 Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBBdWcgMjksIDIwMTkgYXQgMTE6MzM6MTFBTSArMDIwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMjkuMDguMjAxOSAxMDo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+ID4gQEAg
LTY0MCw5ICs2NzAsMTcgQEAgcDJtX3B0X3NldF9lbnRyeShzdHJ1Y3QgcDJtX2RvbWFpbiAqcDJt
LCBnZm5fdCBnZm5fLCBtZm5fdCBtZm4sCj4gPiAgICAgICAgICAgJiYgKGdmbiArICgxVUwgPDwg
cGFnZV9vcmRlcikgLSAxID4gcDJtLT5tYXhfbWFwcGVkX3BmbikgKQo+ID4gICAgICAgICAgcDJt
LT5tYXhfbWFwcGVkX3BmbiA9IGdmbiArICgxVUwgPDwgcGFnZV9vcmRlcikgLSAxOwo+ID4gIAo+
ID4gKyAgICBpZiAoIG5lZWRfaW9tbXVfcHRfc3luYyhwMm0tPmRvbWFpbikgJiYKPiA+ICsgICAg
ICAgICAoaW9tbXVfb2xkX2ZsYWdzICE9IGlvbW11X3B0ZV9mbGFncyB8fCBvbGRfbWZuICE9IG1m
bl94KG1mbikpICkKPiA+ICsgICAgICAgICAgICByYyA9IGlvbW11X3B0ZV9mbGFncyA/Cj4gPiAr
ICAgICAgICAgICAgICAgIGlvbW11X2xlZ2FjeV9tYXAoZCwgX2RmbihnZm4pLCBtZm4sIHBhZ2Vf
b3JkZXIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW9tbXVfcHRlX2Zs
YWdzKSA6Cj4gPiArICAgICAgICAgICAgICAgIGlvbW11X2xlZ2FjeV91bm1hcChkLCBfZGZuKGdm
biksIHBhZ2Vfb3JkZXIpOwo+IAo+IEluZGVudGF0aW9uIG9mIHRoZSBpZigpIGJvZHkgaXMgb25l
IGxldmVsIHRvbyBkZWVwLiBXaXRoIHRoaXMKPiBjb3JyZWN0ZWQgKGVhc3kgZW5vdWdoIHRvIGRv
IHdoaWxlIGNvbW1pdHRpbmcpCj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkluZGVlZCwgbXkgZWRpdG9yIHNlZW1zIHRvIGhhdmUgZG9uZSB0aGUgd3Jvbmcg
dGhpbmcuIFRoYW5rcy4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
