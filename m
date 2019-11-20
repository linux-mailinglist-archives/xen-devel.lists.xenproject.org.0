Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38392104039
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 17:02:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXSOz-0008Ig-Oj; Wed, 20 Nov 2019 16:00:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=akpQ=ZM=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iXSOy-0008Db-5W
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 16:00:20 +0000
X-Inumbo-ID: d79f8ddc-0bae-11ea-adbe-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d79f8ddc-0bae-11ea-adbe-bc764e2007e4;
 Wed, 20 Nov 2019 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574265616;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=etLT3uqAD7Lbn9F9lZ0iH5cOKlk2wTavvuNBSei4ZlM=;
 b=CSzPVJP8B+D4qwiJIDjhfR/tLtz54j3ur3DpLldZ2KYNeUJnSfb5U0wd
 ATATzjv2lJZpPozr4/x66j+eRnwZOF6jyGqEyxhMjrF/14J9QHzbP8qVp
 HNQJe/nZGlcRb3n9qr/2Zq1hI+jbFhVpUYCkWNd7Y4DZF5+5Cg1w3JYcN M=;
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
IronPort-SDR: NCretqEaXItHtJSuCyIKYoPlBLs7GYIeeQpeWg14e6ND8WMTdFar2zcOJq7CVVRzQjdIPr5V/2
 urenPp/8yGoxiFh9v4ql5t0j/++n/v3CagcNaunPIIidbqzJR0YCOWFt1fsBPJJjVeayKOCweY
 sOpYlzKWT0ubqK2VY+3PQtPsUOa6Qt3noZyThZR8R6Qeb2Dz+GBUFKjBgZ/hrDvWgzM+YKtESp
 4RcvYdQarMjiQ2FRiZETPsWkK0XqYqpxXwm4dTgO2CuxpOfeHq66noh+9UMzz3T0QiY+VYCDmN
 OzA=
X-SBRS: 2.7
X-MesageID: 9017026
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,222,1571716800"; 
   d="scan'208";a="9017026"
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 <xen-devel@lists.xenproject.org>
References: <1573844370-29159-1-git-send-email-igor.druzhinin@citrix.com>
 <6b444b00-6ebc-31db-9832-7de8f4787e7b@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <97736761-e665-640b-6cd3-e833241321c3@citrix.com>
Date: Wed, 20 Nov 2019 16:00:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6b444b00-6ebc-31db-9832-7de8f4787e7b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3] passthrough: simplify locking
 and logging
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
Cc: pdurrant@amazon.com, Paul Durrant <paul.durrant@citrix.com>,
 jbeulich@suse.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjAvMTEvMjAxOSAxNTo0OSwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxNS4xMS4xOSAx
OTo1OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IEZyb206IFBhdWwgRHVycmFudCA8cGR1cnJh
bnRAYW1hem9uLmNvbT4KPj4KPj4gRHJvcHBpbmcgdGhlIHBjaWRldnMgbG9jayBiZXR3ZWVuIGNh
bGxpbmcgZGV2aWNlX2Fzc2lnbmVkKCkgYW5kCj4+IGFzc2lnbl9kZXZpY2UoKSBtZWFucyB0aGF0
IHRoZSBsYXR0ZXIgaGFzIHRvIGRvIHRoZSBzYW1lIGNoZWNrIGFzIHRoZQo+PiBmb3JtZXIgZm9y
IG5vIG9idmlvdXMgZ2Fpbi4gQWxzbywgc2luY2UgbG9uZyBydW5uaW5nIG9wZXJhdGlvbnMgdW5k
ZXIKPj4gcGNpZGV2cyBsb2NrIGFscmVhZHkgZHJvcCB0aGUgbG9jayBhbmQgcmV0dXJuIC1FUkVT
VEFSVCBwZXJpb2RpY2FsbHkKPj4gdGhlcmUKPj4gaXMgbGl0dGxlIHBvaW50IGluIGltbWVkaWF0
ZWx5IGZhaWxpbmcgYW4gYXNzaWdubWVudCBvcGVyYXRpb24gd2l0aAo+PiAtRVJFU1RBUlQganVz
dCBiZWNhdXNlIHRoZSBwY2lkZXZzIGxvY2sgY291bGQgbm90IGJlIGFjcXVpcmVkIChmb3IgdGhl
Cj4+IHNlY29uZCB0aW1lLCBoYXZpbmcgYWxyZWFkeSBibG9ja2VkIG9uIGFjcXVpcmluZyB0aGUg
bG9jayBpbgo+PiBkZXZpY2VfYXNzaWduZWQoKSkuCj4+Cj4+IFRoaXMgcGF0Y2ggaW5zdGVhZCBh
Y3F1aXJlcyB0aGUgbG9jayBvbmNlIGZvciBhc3NpZ25tZW50IChvciB0ZXN0IGFzc2lnbikKPj4g
b3BlcmF0aW9ucyBkaXJlY3RseSBpbiBpb21tdV9kb19wY2lfZG9tY3RsKCkgYW5kIHRodXMgY2Fu
IHJlbW92ZSB0aGUKPj4gZHVwbGljYXRlIGRvbWFpbiBvd25lcnNoaXAgY2hlY2sgaW4gYXNzaWdu
X2RldmljZSgpLiBXaGlsc3QgaW4gdGhlCj4+IG5laWdoYm91cmhvb2QsIHRoZSBwYXRjaCBhbHNv
IHJlbW92ZXMgc29tZSBkZWJ1ZyBsb2dnaW5nIGZyb20KPj4gYXNzaWduX2RldmljZSgpIGFuZCBk
ZWFzc2lnbl9kZXZpY2UoKSBhbmQgcmVwbGFjZXMgaXQgd2l0aCBwcm9wZXIgZXJyb3IKPj4gbG9n
Z2luZywgd2hpY2ggYWxsb3dzIGVycm9yIGxvZ2dpbmcgaW4gaW9tbXVfZG9fcGNpX2RvbWN0bCgp
IHRvIGJlCj4+IHJlbW92ZWQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGF1
bC5kdXJyYW50QGNpdHJpeC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgRHJ1emhpbmluIDxp
Z29yLmRydXpoaW5pbkBjaXRyaXguY29tPgo+IAo+IEFzIHRoZSByZWxlYXNlIGlzIGNvbWluZyBu
ZWFyZXIgSSBkb24ndCB3YW50IHRvIHRha2UgImNvc21ldGljIiBwYXRjaGVzCj4gZm9yIDQuMTMg
YW55bW9yZS4KPiAKClVuZGVyc3Rvb2QsIHdlIHdpbGwgY2FycnkgaXQgd2l0aCBvdXIgbG9jYWwg
cGF0Y2hlcyB0aGVuLgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
