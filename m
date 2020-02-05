Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A1152815
	for <lists+xen-devel@lfdr.de>; Wed,  5 Feb 2020 10:17:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izGkL-0005ys-OZ; Wed, 05 Feb 2020 09:13:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HwEA=3Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1izGkK-0005yn-Gm
 for xen-devel@lists.xenproject.org; Wed, 05 Feb 2020 09:13:20 +0000
X-Inumbo-ID: bf9799b6-47f7-11ea-b211-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bf9799b6-47f7-11ea-b211-bc764e2007e4;
 Wed, 05 Feb 2020 09:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1580893999;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Y76JII03reNcP8huztUTE06LizZpe+oFYgURGIXkPjA=;
 b=KiaWJxWbtQiTX8BHaQUgujkWLgi6GmlOyI7OhKHfhmdBvhXUSXpiBU2w
 sjhi3RvBk+MTtTffaVewOh32NmNmQSPloglYltkHjg5odfYbzI6YIkC8f
 YOEd6pEEpM/D157vwctA7GxcONWBeFjZEn7jqD3KgzfTqybpQNQJMKtW0 k=;
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
IronPort-SDR: M6x0Q/7o2bpZG0HLBTUiM1Qnp0Nxn+GvP/6MFl0a1um9JRA6PEjpF4NVyhQE5qWSb8S9rXrlFX
 csAwVacpm4s7CFeY1vC4YiuheGRnv8PKUQ5UiaG7RVELw2zZ+zzvsr6kLpzFweEHI3s0U2JJ5P
 3Ut/h73AdXEpbX4DCBK7lkT19tnCH03tNVQgaMI8UZ3kBkebf2DgL9mVMAR5w48jHcEwmR9hwR
 V9W2pkaTrSy/bToQgZZs4sHoKJPXXWWfxRnURUZsTBMXIAPL0V8ZaJOcInHseYhyvTb+RRl+du
 1MU=
X-SBRS: 2.7
X-MesageID: 11975186
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,405,1574139600"; d="scan'208";a="11975186"
Date: Wed, 5 Feb 2020 10:13:11 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <20200205091311.GP4679@Air-de-Roger>
References: <1580852977-23866-1-git-send-email-igor.druzhinin@citrix.com>
 <1580852977-23866-2-git-send-email-igor.druzhinin@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1580852977-23866-2-git-send-email-igor.druzhinin@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 1/2] x86/shim: suspend and resume
 platform time correctly
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
Cc: xen-devel@lists.xenproject.org, wl@xen.org, jbeulich@suse.com,
 andrew.cooper3@citrix.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVHVlLCBGZWIgMDQsIDIwMjAgYXQgMDk6NDk6MzZQTSArMDAwMCwgSWdvciBEcnV6aGluaW4g
d3JvdGU6Cj4gU2ltaWxhcmx5IHRvIFMzLCBwbGF0Zm9ybSB0aW1lIG5lZWRzIHRvIGJlIHNhdmVk
IG9uIGd1ZXN0IHN1c3BlbmQKPiBhbmQgcmVzdG9yZWQgb24gcmVzdW1lIHJlc3BlY3RpdmVseS4g
VGhpcyBzaG91bGQgYWNjb3VudCBmb3IgZXhwZWN0ZWQKPiBqdW1wcyBpbiBQViBjbG9jayBjb3Vu
dGVyIHZhbHVlIGFmdGVyIHJlc3VtZS4gdGltZV9zdXNwZW5kL3Jlc3VtZSgpCj4gYXJlIHNhZmUg
dG8gdXNlIGluIFBWSCBzZXR0aW5nIGFzIGlzIHNpbmNlIGFueSBleGlzdGluZyBvcGVyYXRpb25z
Cj4gd2l0aCBQSVQvSFBFVCB0aGF0IHRoZXkgZG8gd291bGQgc2ltcGx5IGJlIGlnbm9yZWQgaWYg
UElUL0hQRVQgaXMKPiBub3QgcHJlc2VudC4KPiAKPiBBZGRpdGlvbmFsbHksIGFkZCByZXN1bWUg
Y2FsbGJhY2sgZm9yIFhlbiBQViBjbG9ja3NvdXJjZSB0byBhdm9pZAo+IGl0cyBicmVha2FnZSBv
biBtaWdyYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1
emhpbmluQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpUaGFua3MuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
