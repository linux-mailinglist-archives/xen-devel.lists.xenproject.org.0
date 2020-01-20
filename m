Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0599142E2D
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 15:55:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itYOT-0006L7-SQ; Mon, 20 Jan 2020 14:51:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UWIx=3J=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1itYOS-0006L2-N0
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 14:51:08 +0000
X-Inumbo-ID: 457fbd59-3b94-11ea-b98a-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 457fbd59-3b94-11ea-b98a-12813bfff9fa;
 Mon, 20 Jan 2020 14:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579531862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=cL4h+G11c6KdryQJpLCU8i7tCWCu2Kd1IsJjhEX220E=;
 b=QFieSPJgSjIg7HfQ9d++brVWxV306c07a2d+jJiNAU9mvH5UwwWN2feG
 iJ67a5GousCFFAAEBC76j8eQ3DC352UQoRBTz6o/AQ+nwQ85ZACenuGxp
 9in4kSGNYvh+Dep6Pe6KR8ndXIHNhGovkkYvqe+ScRDOPMTKCajrXBEC+ 4=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 4lA1jmuyxJP54IkVUTsBhR9QBFpThYvRoUhGXGAuVuB86ARQRh/f78X2p2o2HnyEbFE3j84agc
 GS2WQMAUb2znfFY7Y6qQAsrbTFr96X/cSSaS5pVWD/lrfngXmiAUUf77Fne6fTVUAB4WFTk0Me
 jVGYcOBZYYFkK+cPO2LD6qfarQBaODhb6/m5OTFP/fFIrqmKblo4qdnCObCRRjL0F1Q3tBMUIV
 FKM4IQola55DA8h1gIzpQYzB593cS4uo9A7YiCkj4vkwQ56xN42X+5JkNtyFb4b5dSIbAYSbUg
 zB8=
X-SBRS: 2.7
X-MesageID: 11176634
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,342,1574139600"; d="scan'208";a="11176634"
Date: Mon, 20 Jan 2020 14:50:46 +0000
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200120145046.GA11756@Air-de-Roger>
References: <20200120143142.19820-1-julien@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120143142.19820-1-julien@xen.org>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/x86: domain: Free all the pages
 associated to struct domain
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBKYW4gMjAsIDIwMjAgYXQgMDI6MzE6NDJQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEZyb206IEp1bGllbiBHcmFsbCA8amdyYWxsQGFtYXpvbi5jb20+Cj4gCj4gVGhlIHN0
cnVjdHVyZSBkb21haW4gbWF5IGJlIGJpZ2dlciB0aGFuIGEgcGFnZSBzaXplIHdoZW4gbG9jayBw
cm9maWxpbmcKPiBpcyBlbmFibGVkLiBIb3dldmVyLCB0aGUgZnVuY3Rpb24gZnJlZV9kb21oZWFw
X3N0cnVjdCB3aWxsIG9ubHkgZnJlZSB0aGUKPiBmaXJzdCBwYWdlLgo+IAo+IFRoaXMgaXMgbm90
IGEgc2VjdXJpdHkgaXNzdWUgYmVjYXVzZSBzdHJ1Y3QgZG9tYWluIGNhbiBvbmx5IGJlIGJpZ2dl
cgo+IHRoYW4gYSBwYWdlIHNpemUgZm9yIGxvY2sgcHJvZmlsaW5nLiBUaGUgZmVhdHVyZSBjYW4g
b25seSBiZSBzZWxlY3RlZAo+IGluIERFQlVHIGFuZCBFWFBFUlQgbW9kZS4KPiAKPiBGaXhlczog
ODkxNmZjZjQ1NzcgKCJ4ODYvZG9tYWluOiBjb21waWxlIHdpdGggbG9ja19wcm9maWxlPXkgZW5h
YmxlZCIpCj4gUmVwb3J0ZWQtYnk6IERhdmlkIFdvb2Rob3VzZSA8ZHdtd0BhbWF6b24uY28udWs+
Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNvbT4KClJldmll
d2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcywg
Um9nZXIuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
