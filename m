Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3894A10E9C8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2019 12:50:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ibkAM-0004WE-RT; Mon, 02 Dec 2019 11:46:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=84di=ZY=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ibkAM-0004W9-Ae
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2019 11:46:58 +0000
X-Inumbo-ID: 7191e3f6-14f9-11ea-b155-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7191e3f6-14f9-11ea-b155-bc764e2007e4;
 Mon, 02 Dec 2019 11:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575287218;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=J1U5dk1pH5LfqbYCBvhHrnz7QfkLtOzaFR2ZFnu3VuQ=;
 b=G/Vs1cETd1RZMUNL9HH9+6uQOK5qJEJ9/d+SFtB8g7pWx7aS2c4A5gzE
 c70EreqMQVdIoYUD58Dp03vP9/4OvZHop9LxIH1Q6jvke3HDecJAR9Xqc
 fmjNqgyKVyLR/QiE5Sf8SbielDJoTaGzvs9VGwuwjGWIj1nCFdOMdkB6x c=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: QuGZWQCkWAPsjXdvJgvXVLgDyAE7G6jQS/YYRktXwaPSEF/mqiuKXzCjuvEcIUqL6eJxb5mhEk
 zrYNInqraKp6nQ83F9NOncF04BG4qKPi9X3GPgu6wqABe7QtgVoMDE956gL03XQfiCp0uDiUWI
 5sdR1sisYirYS5SZMwrLz3a3G0AScbGVdZaNRtIY6hknsVAltvkJ9odAW5jRz5eHhg6b7PpF3x
 TJf8dTCViw/HtKX8DiCGXwOSuojqjZeoyr0f2CCDYXgdP1+rfq0KzjeC/huMFx2cgwLK8JDORr
 ZCU=
X-SBRS: 2.7
X-MesageID: 9042723
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,268,1571716800"; 
   d="scan'208";a="9042723"
Date: Mon, 2 Dec 2019 12:46:47 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191202114647.GD980@Air-de-Roger>
References: <20191202112946.25461-1-roger.pau@citrix.com>
 <99fd0df5-14ee-b21c-ab03-32d427121e17@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99fd0df5-14ee-b21c-ab03-32d427121e17@citrix.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH for-4.13] x86: re-order clang no integrated
 assembler tests
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gTW9uLCBEZWMgMDIsIDIwMTkgYXQgMTE6MzE6NTVBTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbiAwMi8xMi8yMDE5IDExOjI5LCBSb2dlciBQYXUgTW9ubmUgd3JvdGU6Cj4gPiBU
aGUgdGVzdHMgdG8gY2hlY2sgd2hldGhlciB0aGUgaW50ZWdyYXRlZCBhc3NlbWJsZXIgaXMgY2Fw
YWJsZSBvZgo+ID4gYnVpbGRpbmcgWGVuIHNob3VsZCBiZSBwZXJmb3JtZWQgYmVmb3JlIHRlc3Rp
bmcgYW55IGFzc2VtYmxlcgo+ID4gZmVhdHVyZXMsIG9yIGVsc2UgdGhlIGZlYXR1cmUgc3BlY2lm
aWMgdGVzdHMgd291bGQgYmUgc3RhbGUgaWYgdGhlCj4gPiBpbnRlZ3JhdGVkIGFzc2VtYmxlciBp
cyBkaXNhYmxlZCBhZnRlcndhcmRzLgo+ID4KPiA+IEZpeGVzOiBlZjI4NmY2Nzc4N2EgKCd4ODY6
IG1vdmUgYW5kIGZpeCBjbGFuZyAuc2tpcCBjaGVjaycpCj4gPiBSZXBvcnRlZC1ieTogQW5kcmV3
IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiA+IFJlcG9ydGVkLWJ5OiBEb3Vn
IEdvbGRzdGVpbiA8Y2FyZG9lQGNhcmRvZS5jb20+Cj4gPiBzaWduZWQtb2ZmLWJ5OiBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPiA+IC0tLQo+ID4gQ2M6IEp1ZXJnZW4g
R3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KPiAKPiBXaHkgNC4xMz/CoCBUaGV5IGFyZSBvbmx5IGlu
IDQuMTQgQUZBSUNUCgpPaCBzb3JyeSwgSSBzb21laG93IGFzc3VtZWQgdGhvc2UgZW5kZWQgdXAg
aW4gNC4xMy4KCj4gQXMgZm9yIHRoZSBjaGFuZ2UsIGxvb2tzIHBsYXVzaWJsZS7CoCBJJ2xsIHRo
cm93IGl0IHRocm91Z2ggQ0kuCgpJJ3ZlIGdvdCBvbmUgYWxyZWFkeSwgd2hpY2ggbG9va3MgZ29v
ZCAoc3RpbGwgaW4gcHJvZ3Jlc3MsIGJ1dCBzb21lCmNsYW5nIHRlc3RzIHBhc3NlZCk6CgpodHRw
czovL2dpdGxhYi5jb20veGVuLXByb2plY3QvcGVvcGxlL3JveWdlci94ZW4vcGlwZWxpbmVzLzk5
OTMyNjA4CgpUaGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
