Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 225B118B08F
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 10:55:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jErqk-0007oK-Fu; Thu, 19 Mar 2020 09:52:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kuhB=5E=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jErqi-0007oF-DW
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:52:24 +0000
X-Inumbo-ID: 548a8d80-69c7-11ea-bbdb-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 548a8d80-69c7-11ea-bbdb-12813bfff9fa;
 Thu, 19 Mar 2020 09:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584611543;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=aI5dDpLSagdtB6YeAw/+QmW028JiIq204csdR0v2nSw=;
 b=X0ZfeVYZzi8Hv5jziVW9A4+LmlDIGd9xLi5ZNXXLsFKUfgd8Hoj4XH38
 3cNhxLD5ry6RjTbaRFSPXXFwK2SsC7M/qUT9ygQJGa4jvP7gsSUInj4cA
 t53eP8q2FGyZalmLyipXAxrhRQRrrO9EXnUNTpJeXUhbs2Xlyw+ulb5q4 I=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: FSiai3tkdyVf/fE0C0TM3eT3ltmZUBc6IyVljSTOV2R4xTik/U+Ekr32OrXI8gfVoK/d49osu4
 5CHDf7LjL7kM2qbE+RBejccCSWvm9qkO1mFiIxC5gXHgz++tiQyOOAUD7U8ZMH//K3Ztqx4grW
 gnC0mtFZOYs5DL81JwQANC2aIi95/iQNW9AQjVDJyYd9IIdWlSysMLS0nNsP35Ytmbd+onsFFK
 yrUITVXDz5QSxH2IQsvL4UY0M79x+6hxoS3S33ZFzdoY/GvVVs3jztc3qb/3Tl68CYFBmhlmnX
 gIg=
X-SBRS: 2.7
X-MesageID: 14241848
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,571,1574139600"; d="scan'208";a="14241848"
To: Jan Beulich <jbeulich@suse.com>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
 <02b265af-0b0d-0d8f-ed53-4e27c1d12beb@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cefd1fb0-d6cf-0798-169f-56b49356d2ac@citrix.com>
Date: Thu, 19 Mar 2020 09:52:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <02b265af-0b0d-0d8f-ed53-4e27c1d12beb@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/x86: Move microcode into its own
 directory
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkvMDMvMjAyMCAwOToyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMDMuMjAyMCAy
MjowNSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gU3BsaXQgdGhlIGV4aXN0aW5nIGFzbS9taWNy
b2NvZGUuaCBpbiBoYWxmLCBrZWVwaW5nIHRoZSBwZXItY3B1IGNwdV9zaWcKPj4gYXZhaWxhYmxl
IHRvIGV4dGVybmFsIHVzZXJzLCBhbmQgbW92aW5nIGV2ZXJ5dGhpbmcgZWxzZSBpbnRvIHByaXZh
dGUuaAo+Pgo+PiBUYWtlIHRoZSBvcHBvcnR1bml0eSB0byB0cmltIGFuZCBjbGVhbiB1cCB0aGUg
aW5jbHVkZSBsaXN0cyBmb3IgYWxsIDMgc291cmNlCj4+IGZpbGVzLCBhbGwgb2Ygd2hpY2ggaW5j
bHVkZSByYXRoZXIgbW9yZSB0aGFuIG5lY2Vzc2FyeS4KPj4KPj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+Cj4gQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBh
bGJlaXQgcHJlZmVyYWJseSB3aXRoIC4uLgo+Cj4+IC0tLQo+PiAgeGVuL2FyY2gveDg2L01ha2Vm
aWxlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLS0KPj4gIHhlbi9hcmNoL3g4
Ni9taWNyb2NvZGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDMgKysKPj4gIHhlbi9h
cmNoL3g4Ni97bWljcm9jb2RlX2FtZC5jID0+IG1pY3JvY29kZS9hbWQuY30gIHwgMTIgKysrKy0t
LS0KPj4gIHhlbi9hcmNoL3g4Ni97bWljcm9jb2RlLmMgPT4gbWljcm9jb2RlL2NvcmUuY30gICAg
IHwgMTUgKysrLS0tLS0tLQo+PiAgLi4uL3g4Ni97bWljcm9jb2RlX2ludGVsLmMgPT4gbWljcm9j
b2RlL2ludGVsLmN9ICAgfCAgOSArKy0tLS0KPj4gIC4uLi9taWNyb2NvZGUuaCA9PiBhcmNoL3g4
Ni9taWNyb2NvZGUvcHJpdmF0ZS5ofSAgIHwgMTkgKysrKy0tLS0tLS0tLQo+IC4uLiB0aGVzZSBn
b2luZyBpbnRvIHhlbi9hcmNoL3g4Ni9jcHUvbWljcm9jb2RlLy4gVGhvdWdodHM/CgpUQkgsIEkn
dmUgYWx3YXlzIGZvdW5kIHRoZSBjcHUvIGRpcmVjdG9yeSByZWR1bmRhbnQuwqAgRXZlcnl0aGlu
ZyBpbgphcmNoL3g4NiBpcyBwYXJ0IG9mIHRoZSBDUFUsIGFuZCB0aGVzZSBkYXlzLCBldmVuIGRy
aXZlcnMvcGFzc3Rocm91Z2ggaXMKcGFydCBvZiB0aGUgQ1BVLgoKSSdtIGhhcHB5IHRvIHB1dCBp
dCB3aGVyZXZlciBtYWtlcyBzZW5zZSwgc28gbG9uZyBhcyB0aGVyZSBpcyBhIGNsZWFyCnVuZGVy
c3RhbmRpbmcgb2Ygd2h5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
