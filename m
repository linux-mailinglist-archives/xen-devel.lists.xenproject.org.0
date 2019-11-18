Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6E11005DF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 13:48:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWgPO-0005Ah-Dt; Mon, 18 Nov 2019 12:45:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=9/xt=ZK=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iWgPM-0005Ac-Hx
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 12:45:32 +0000
X-Inumbo-ID: 4df71ef0-0a01-11ea-9631-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4df71ef0-0a01-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574081130;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=hyPBS1WK739rXYCKdH/Bb0SC0+yKYmM3/Hi8VhujRUg=;
 b=EQb9bupA49nGRTuU/iG9nh9oGlXvDS6fynJkWiedX5/U1shGf1I27Rz7
 3uc3dYZPXKAFgjjpSzyYFhPFAL+jbb/8nM8NAEIYcXKHB4dCo8aMe5le/
 T3CgrzvbscdNQ3xa/udX30zDPr20EUYNkQ+aIUQWCh/33V4i1e8f2Kmvj o=;
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
IronPort-SDR: xtE+48KcVBAYNHVKHS753GjNBRIYKFVpWC07mE1rfXVNIa3GYcZuy0GQv6LZ9gcyyidMnRr9C5
 PRCE0qAZcGLzTMIxlTagG5sSABHwLQQZsxBG+RYduylv7j7n4h2RNrqyNdKUkhzen5Gqvekxtq
 7wpl86A1ZfKLEdvqp7GqrcwCiMYrRB85Ni+rDrbYmEK3HdL9ZeurNlQL+gYz5QJ05VWnDiW8KR
 Pjrhlzn1THJrrBKmWo/kyRNOSIqF7q4z0WPP+r0R20gYhK6CcQ/ASiTTRDEW5YsvJFHvrD3Qo+
 8eY=
X-SBRS: 2.7
X-MesageID: 8871367
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,320,1569297600"; 
   d="scan'208";a="8871367"
To: Jan Beulich <jbeulich@suse.com>
References: <1573844370-29159-1-git-send-email-igor.druzhinin@citrix.com>
 <f6cdcc12-70e4-9405-b403-12c10875d7e9@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <a9a5e414-782b-d722-c19f-2163d0d064fc@citrix.com>
Date: Mon, 18 Nov 2019 12:45:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f6cdcc12-70e4-9405-b403-12c10875d7e9@suse.com>
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 pdurrant@amazon.com, PaulDurrant <paul.durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMTEvMjAxOSAxMToyMSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMTEuMjAxOSAx
OTo1OSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL3BjaS5jCj4+ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4+IEBAIC05
MzIsMzAgKzkzMiwyNiBAQCBzdGF0aWMgaW50IGRlYXNzaWduX2RldmljZShzdHJ1Y3QgZG9tYWlu
ICpkLCB1aW50MTZfdCBzZWcsIHVpbnQ4X3QgYnVzLAo+PiAgICAgICAgICAgICAgYnJlYWs7Cj4+
ICAgICAgICAgIHJldCA9IGhkLT5wbGF0Zm9ybV9vcHMtPnJlYXNzaWduX2RldmljZShkLCB0YXJn
ZXQsIGRldmZuLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGNpX3RvX2RldihwZGV2KSk7Cj4+IC0gICAgICAgIGlmICggIXJldCApCj4+IC0gICAg
ICAgICAgICBjb250aW51ZTsKPj4gLQo+PiAtICAgICAgICBwcmludGsoWEVOTE9HX0dfRVJSICIl
cGQ6IGRlYXNzaWduICUwNHg6JTAyeDolMDJ4LiV1IGZhaWxlZCAoJWQpXG4iLAo+PiAtICAgICAg
ICAgICAgICAgZCwgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pLCBy
ZXQpOwo+PiAtICAgICAgICByZXR1cm4gcmV0Owo+PiArICAgICAgICBpZiAoIHJldCApCj4+ICsg
ICAgICAgICAgICBnb3RvIG91dDsKPj4gICAgICB9Cj4+ICAKPj4gICAgICBkZXZmbiA9IHBkZXYt
PmRldmZuOwo+PiAgICAgIHJldCA9IGhkLT5wbGF0Zm9ybV9vcHMtPnJlYXNzaWduX2RldmljZShk
LCB0YXJnZXQsIGRldmZuLAo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBwY2lfdG9fZGV2KHBkZXYpKTsKPj4gICAgICBpZiAoIHJldCApCj4+IC0gICAgewo+
PiAtICAgICAgICBkcHJpbnRrKFhFTkxPR19HX0VSUiwKPj4gLSAgICAgICAgICAgICAgICAiJXBk
OiBkZWFzc2lnbiBkZXZpY2UgKCUwNHg6JTAyeDolMDJ4LiV1KSBmYWlsZWRcbiIsCj4+IC0gICAg
ICAgICAgICAgICAgZCwgc2VnLCBidXMsIFBDSV9TTE9UKGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4p
KTsKPj4gLSAgICAgICAgcmV0dXJuIHJldDsKPj4gLSAgICB9Cj4+ICsgICAgICAgIGdvdG8gb3V0
Owo+PiAgCj4+ICAgICAgaWYgKCBwZGV2LT5kb21haW4gPT0gaGFyZHdhcmVfZG9tYWluICApCj4+
ICAgICAgICAgIHBkZXYtPnF1YXJhbnRpbmUgPSBmYWxzZTsKPj4gIAo+PiAgICAgIHBkZXYtPmZh
dWx0LmNvdW50ID0gMDsKPj4gIAo+PiArb3V0Ogo+PiArICAgIGlmICggcmV0ICkKPj4gKyAgICAg
ICAgcHJpbnRrKFhFTkxPR19HX0VSUiAiJXBkOiBkZWFzc2lnbiAoJTA0eDolMDJ4OiUwMnguJXUp
IGZhaWxlZCAoJWQpXG4iLAo+PiArICAgICAgICAgICAgICAgZCwgc2VnLCBidXMsIFBDSV9TTE9U
KGRldmZuKSwgUENJX0ZVTkMoZGV2Zm4pLCByZXQpOwo+PiArCj4gCj4gU2luY2UsIGRlc3BpdGUg
bXkgc3VnZ2VzdGlvbiB0byB0aGUgY29udHJhcnksIHlvdSd2ZSBrZXB0IHRoZQo+IGludHJvZHVj
dGlvbiBvZiBnb3RvIGhlcmUsIHRoZSBsYWJlbCBzaG91bGQgaGF2ZSBnb3QgaW5kZW50ZWQKPiAo
YXMgcG9pbnRlZCBvdXQgZm9yIHYyKS4gV2l0aCB0aGlzIGFkanVzdGVkICh3aGljaCBjb3VsZCBi
ZSBkb25lCj4gd2hpbGUgY29tbWl0dGluZykKPiBBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPgoKU29ycnksIHRob3VnaHQgeW91IG1lYW50IHRoZSBvdGhlciB0aGluZy4g
QW5kcmV3IGNsYXJpZmllZCB0aGUgcmF0aW9uYWxlCmJlaGluZCB5b3VyIHJlcXVlc3QuCgpJZ29y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
