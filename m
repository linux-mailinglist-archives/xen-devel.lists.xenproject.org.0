Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA2CBB4E
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2019 15:11:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iGNKA-0005kd-7n; Fri, 04 Oct 2019 13:08:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=obQ/=X5=citrix.com=igor.druzhinin@srs-us1.protection.inumbo.net>)
 id 1iGNK8-0005kY-GR
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2019 13:08:44 +0000
X-Inumbo-ID: 160f9d4a-e6a8-11e9-8c93-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 160f9d4a-e6a8-11e9-8c93-bc764e2007e4;
 Fri, 04 Oct 2019 13:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570194521;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=1ozu/rCn8lcCub4xPDq7YQ88BJN6VGYPMO4YmI3JHGs=;
 b=CN1UUCk/fgpoSRj7gLboF50XPpT8rxHliYwhsFHLSzvInhkEEt0qdXyg
 bqLWIwzqMfpH0rYMivNgrBDgmSsNT3bBw3vjOehDEgtUMLyyA0u9Tcb5Q
 k6CSExwPwJTLCE4WIIIsQaBnDFXtHktDPjjrucBXEohOPysSsgkKwnnkx M=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=igor.druzhinin@citrix.com;
 spf=Pass smtp.mailfrom=igor.druzhinin@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 igor.druzhinin@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 igor.druzhinin@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="igor.druzhinin@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="igor.druzhinin@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: dsSW6jMqOxvpUVJhF5OWnbhT2IO/Vp4tGh5aeqoU79X/70XleRfXtl2exjhj/q0h1Zi1m6Xzva
 DP11yvOo1evlCSFaj6tgI7tWZE/vSsYqgC2OY+1CtvI4OTqhSWgcIoZ75QkQLa75X7g5ULw7Fv
 8dNvneLmz6hzVZaw+KkN1ptLZ9DZlHVyeHQwTYGyOkCxVGDyb7FO8Q1HKFKPNlgXpNLEJ9YfJG
 CZlx67MFOXVA9pQTuR9Tj/j7XnheVzi8LrEaOKqaeE2vvzHq1SXvKdhogq1ApdklrCDDhm6+iq
 U/Y=
X-SBRS: 2.7
X-MesageID: 6473915
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,256,1566878400"; 
   d="scan'208";a="6473915"
To: Jan Beulich <jbeulich@suse.com>
References: <1570110555-24287-1-git-send-email-igor.druzhinin@citrix.com>
 <1570110555-24287-3-git-send-email-igor.druzhinin@citrix.com>
 <4d82e6f6-e362-7fc0-efa9-d024088d9f9f@suse.com>
 <7bb04327-f442-5455-fda5-3d457b06fd68@citrix.com>
 <43939023-3fd9-d124-a11a-861211f3206f@suse.com>
From: Igor Druzhinin <igor.druzhinin@citrix.com>
Message-ID: <ae96bc8f-1f9d-ac8f-0ddf-3285710581a8@citrix.com>
Date: Fri, 4 Oct 2019 14:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43939023-3fd9-d124-a11a-861211f3206f@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] efi/boot: make sure chosen mode is set
 even if firmware tell it is
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQvMTAvMjAxOSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDQuMTAuMjAxOSAx
MzozMywgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4+IE9uIDA0LzEwLzIwMTkgMTE6NDAsIEphbiBC
ZXVsaWNoIHdyb3RlOgo+Pj4gT24gMDMuMTAuMjAxOSAxNTo0OSwgSWdvciBEcnV6aGluaW4gd3Jv
dGU6Cj4+Pj4gSWYgYSBib290bG9hZGVyIGlzIHVzaW5nIG5hdGl2ZSBkcml2ZXIgaW5zdGVhZCBv
ZiBFRkkgR09QIGl0IG1pZ2h0Cj4+Pj4gcmVzZXQgZ3JhcGhpY3MgbW9kZSB0byBiZSBkaWZmZXJl
bnQgZnJvbSB3aGF0IGZpcm13YXJlIHRoaW5rcyBpdAo+Pj4+IGN1cnJlbnRseSBpcy4gU2V0IGNo
b3NlbiBtb2RlIHVuY29uZGl0aW9uYWxseSB0byBmaXggdGhpcyBwb3NzaWJsZQo+Pj4+IG1pc2Fs
aWdubWVudC4KPj4+Pgo+Pj4+IE9ic2VydmVkIHdpdGggRUZJIEdSVUIyIGNvbXBpbGVkIHdpdGgg
YWxsIHBvc3NpYmxlIHZpZGVvIGRyaXZlcnMgd2hlcmUKPj4+PiBuYXRpdmUgZHJpdmVycyB0YWtl
IHByaW9yaXR5IG92ZXIgZmlybXdhcmUuCj4+Pgo+Pj4gSSBkb24ndCB0aGluayB0aGlzIGNhc2Ug
Y2FuIGhhcHBlbiB3aXRoIGp1c3QgcGxhaW4gRUZJLiBUaGVyZWZvcmUgLi4uCj4+Pgo+Pgo+PiBD
b3VsZCB5b3UgY2xhcmlmeSB3aGF0IHlvdSBtZWFuIGJ5ICJwbGFpbiBFRkkiIGhlcmU/IERvIHlv
dSBtZWFuIGJlaW5nCj4+IGJvb3RlZCBhcyBFRkkgYmluYXJ5IHVubGlrZSB0aHJvdWdoIG11bHRp
Ym9vdCBwcm90b2NvbD8KPiAKPiBZZXMgLSBsaWtlIHdoZW4gcnVubmluZyB4ZW4uZWZpIGZyb20g
dGhlIEVGSSBzaGVsbCBjb21tYW5kIGxpbmUuCj4gCj4+IEkgdGhpbmsgaW4gYm90aAo+PiBjYXNl
cyBpdCdzIHBvc3NpYmxlIHRvIGNvbWUgdGhlcmUgdGhyb3VnaCBhIGJvb3Rsb2FkZXIuCj4gCj4g
QW55dGhpbmcgaW52b2tpbmcgYW4gRUZJIGFwcGxpY2F0aW9uIHdpdGggYSBzY3Jld2VkIHVwIEVG
SQo+IGVudmlyb25tZW50IGlzIGJvZ3VzLiBJIGNhbiBzZWUgaG93IGdydWIgd291bGQgdmlvbGF0
ZSBzdWNoCj4gYXNzdW1wdGlvbnMgdGhvdWdoLCBhbmQgaG93IG9uZSBtaWdodCBjYWxsIHRoaXMg
dmFsaWQgd2hlbgo+IGludm9raW5nIHRoZSBuZXh0IGJpbmFyeSB3aXRoIGEgcHJvdG9jb2wgb3Ro
ZXIgdGhhbiB3aGF0IHBsYWluCj4gRUZJIHByb3ZpZGVzIChyZWFkOiBNQjIgaGVyZSkuCj4gCgpJ
J2xsIGNoZWNrIGlmIGl0J3MgdGhlIGNhc2UgYW5kIHdpbGwgQ0MgRGFuaWVsIGlmIGl0J3MgYnJv
a2VuIHRoYXQgd2F5LgoKSWdvcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
