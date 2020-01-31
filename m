Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C34214F43D
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 23:02:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixeJx-0001Pj-It; Fri, 31 Jan 2020 21:59:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HO0L=3U=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1ixeJv-0001Pe-Dl
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 21:59:23 +0000
X-Inumbo-ID: efd90bae-4474-11ea-b211-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id efd90bae-4474-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 21:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580507962;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=nMa5O2PnwY11FmNCrYR878cFn115G2wgN1q6Kh9iyig=;
 b=W7pbxjDABbJQLQzKxxhPNZziWQxsap2/By5kJoS+Az08fXo5WrFb+dua
 xXMe0wvd0cRkZlG7ZnEPMpe+mzrUDW9/GPbvIunvvW3qyF3hAdpCSKFd7
 ChAlOE08hPIc1Y+dgKeOqV1Gxa9dBqi7vOD2C259dGuMJW4sbrt2niHKK 0=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: skgFzAmWtk5EcJQjQrh985yLBsBEfADUlit9HkBWymZOvq4Gpj/kqEzQFE97kVVFpfzIsT3dvF
 eZQLBqoS+r6jZ5ni4n/mX4hxAwAJAxokIi4PuyvR7WHbUw+x0XTm+ooY5Nk2GRE9p/1W5BWaSq
 xg3ackfa3ykYHFJffJCKeQTker2Ce++mDfk8jLJ2S0VbzAaxMKYs/owPPKyb6DXRoNbU0yBAJG
 kaHaq882fR4+I9pGBDOHa1/LTACm8okSY6vleFRvFK8OI5AckE8GHgIXRiy/WvCQdoq0+Z57Vj
 HzA=
X-SBRS: 2.7
X-MesageID: 12206911
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,387,1574139600"; d="scan'208";a="12206911"
To: Dietmar Hahn <dietmar.hahn@ts.fujitsu.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2704996.bt05f1kDAn@amur.mch.fsc.net>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <3936e4e4-f424-20b9-07d2-3a16433f65ae@citrix.com>
Date: Fri, 31 Jan 2020 21:59:19 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <2704996.bt05f1kDAn@amur.mch.fsc.net>
Content-Language: en-US
Subject: Re: [Xen-devel] Kdump doesn't work when running with xen on newer
 hardware
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzAvMDEvMjAyMCAxMzowMywgRGlldG1hciBIYWhuIHdyb3RlOgo+IEhpLAo+IAo+IHdlIHVz
ZSBTTEVTMTIgd2l0aCBrZXJuZWwtZGVmYXVsdC00LjEyLjE0LTk1LjQ1LjEueDg2XzY0IGFuZCAK
PiB4ZW4tNC4xMS4zXzAyLTIuMjAuMS54ODZfNjQKPiAKPiBUaGUgZHVtcCBrZXJuZWwgZG9lc24n
dCBzdGFydCBhZnRlciAiZWNobyBjID4gL3Byb2Mvc3lzcnFfdHJpZ2dlciIuCj4gTGFzdCBtZXNz
YWdlcyBvbiBjb25zb2xlIGFyZToKPiBbICAzODUuNzE3NTMyXSBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogRmF0YWwgZXhjZXB0aW9uCj4gWyAgMzg1LjczNDU2NV0gS2VybmVsIE9mZnNldDog
ZGlzYWJsZWQKPiAoWEVOKSBIYXJkd2FyZSBEb20wIGNyYXNoZWQ6IEV4ZWN1dGluZyBrZXhlYyBp
bWFnZSBvbiBjcHU1OAo+IChYRU4pIFNob3QgZG93biBhbGwgQ1BVcwo+IAo+IEFmdGVyIGEgc2hv
cnQgdGltZSBhIHJlYm9vdCBpcyBpbml0aWF0ZWQuCj4gV2l0aG91dCB4ZW4gdGhlIGtkdW1wIHdv
cmtzLgo+IAo+IFdlIHNlZSB0aGlzIGJlaGF2aW91ciBvbmx5IG9uIG5ld2VyIGhhcmR3YXJlLCBm
b3IgZXhhbXBsZSBhIHNlcnZlciB3aXRoCj4gSW50ZWwoUikgWGVvbihSKSBHb2xkIDYyNDIgQ1BV
IEAgMi44MEdIego+IAo+IEkgYnVpbHQgdGhlIGZyZXNoIHJlbGVhc2VkIHhlbi00LjEzIG15c2Vs
ZiBhbmQgdHJpZWQgaXQgYnV0IHRoaXMgZG9lc24ndCBoZWxwLgo+IAo+IEkgdHJpZWQgeDJhcGlj
PW9mZiBvbiB0aGUgeGVuIHNpZGUgYW5kIG5veDJhcGljIG9uIHRoZSBsaW51eCBzaWRlIGJ1dCBu
byBzdWNjZXNzLgoKU3RhcnRpbmcgZnJvbSBYZW4gNC4xMiB3ZSBrZWVwIElPTU1VIGVuYWJsZWQg
ZHVyaW5nIGtleGVjIHRyYW5zaXRpb24Kd2hpY2ggcmVzb2x2ZWQgdGhlIHByb2JsZW0geW91J3Jl
IGRlc2NyaWJpbmcuIEJ1dCB5b3UgYWxzbyBuZWVkIHRvIG1ha2UKc3VyZSBJT01NVSBpcyBlbmFi
bGVkIGluIHlvdXIga2V4ZWMga2VybmVsICh3aGljaCBJIHRoaW5rIGlzIG5vdyB0aGUKZGVmYXVs
dCBmb3IgbW9zdCBkaXN0cm9zKS4gWW91IGNhbiBzdGlsbCB0cnkgdG8gd29ya2Fyb3VuZCB0aGUg
aXNzdWUKeW91J3JlIHNlZWluZyBvbiA0LjExIGJ5IHVzaW5nICJpb21tdT1kb20wLXBhc3N0aG91
Z2giIFhlbiBvcHRpb24uCgpJZ29yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
