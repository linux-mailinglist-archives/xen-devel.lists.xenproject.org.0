Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9BB62A2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2019 14:01:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAYcS-0000lT-7M; Wed, 18 Sep 2019 11:59:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=suks=XN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iAYcQ-0000l6-8R
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2019 11:59:34 +0000
X-Inumbo-ID: c7093a10-da0b-11e9-962f-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c7093a10-da0b-11e9-962f-12813bfff9fa;
 Wed, 18 Sep 2019 11:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568807973;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=5ckkZ4uYV8hbuPsaXQnSo+so4/XhmYR5wlO6e7vYq0o=;
 b=iDF+0bhJyIBM0l1qxkEJb+JQWPtWhmgR78/ga2kvgrsZwWULC4tWIrnd
 t8AHsAiT/ug/+hvwJm4iys2bK4y74uWyA2AC/BJKBQsW/bWvLb+8yoHyj
 c9Rg4sTy9pojvL6gP6ZZWTthubv452fIAETEeu4CLL0puR1XKG0Vo/xi3 c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: PgWaJS91yjAS2kWLJ+Op/GyaHI9bYI9wfOBUDpJnyx9fcN6ByXAv0gS2KjrH+7M/qaxNchAqBx
 69w0og/UKLAKJqYJkfARiPZY5TlDSXQhUBF0k5dL32wG0vhYt0a0PftOTyhCzt+9bu1xbC31se
 CEdddp9WWVy040oOYd4FUTnV1YeXSqgT5ykrkr9B5QLb8FmX3DXgsmMi8RqXc38yW6nSnASirr
 ooeTiwvYFmBTWLEjveZFiQbg2LmzDx6ZQdFbv8V6miVYbClps9lpJ9guC7QhBEgAjB5VL104Ar
 KqI=
X-SBRS: 2.7
X-MesageID: 6031284
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,520,1559534400"; 
   d="scan'208";a="6031284"
To: Jan Beulich <jbeulich@suse.com>
References: <625c29ba-cfb8-88ee-eb15-5f2019198865@suse.com>
 <fc21565a-3cb1-4547-09a2-fc908a51e526@suse.com>
 <9318cb16-a159-df4b-3886-6636d8f3b763@citrix.com>
 <7a7f7fe6-cba6-6e1e-87e5-217aded6513f@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <61cf843f-9d02-2f1e-da93-8d89d8c03aee@citrix.com>
Date: Wed, 18 Sep 2019 12:59:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <7a7f7fe6-cba6-6e1e-87e5-217aded6513f@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 8/9] x86/CPUID: drop INVPCID dependency
 on PCID
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTgvMDkvMjAxOSAxMDoxMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTcuMDkuMjAxOSAy
MTo1OSwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMTcvMDkvMjAxOSAwNzoxNywgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBQQ0lEIHZhbGlkbHkgZGVwZW5kcyBvbiBMTSwgYXMgaXQgY2FuIGJl
IGVuYWJsZWQgaW4gTG9uZyBNb2RlIG9ubHkuCj4+PiBJTlZQQ0lELCBvdG9oLCBjYW4gYmUgdXNl
ZCBub3Qgb25seSB3aXRob3V0IFBDSUQgZW5hYmxlZCwgYnV0IGFsc28KPj4+IG91dHNpZGUgb2Yg
TG9uZyBNb2RlIGFsdG9nZXRoZXIuIEluIGJvdGggY2FzZXMgaXRzIGZ1bmN0aW9uYWxpdHkgaXMK
Pj4+IHNpbXBseSByZXN0cmljdGVkIHRvIFBDSUQgMCwgd2hpY2ggaXMgc29ydCBvZiBleHBlY3Rl
ZCBhcyBubyBvdGhlciBQQ0lECj4+PiBjYW4gYmUgYWN0aXZhdGVkIHRoZXJlLgo+Pj4KPj4+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4+IFJldmlld2Vk
LWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4+Cj4+PiAtLS0g
YS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5Cj4+PiArKysgYi94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5
Cj4+PiBAQCAtMjE4LDEwICsyMTgsNiBAQCBkZWYgY3J1bmNoX251bWJlcnMoc3RhdGUpOgo+Pj4g
ICAgICAgICAgIwo+Pj4gICAgICAgICAgIyBTU0U0XzI6IFtQT1BDTlRdCj4+PiAgCj4+PiAtICAg
ICAgICAjIFRoZSBJTlZQQ0lEIGluc3RydWN0aW9uIGRlcGVuZHMgb24gUENJRCBpbmZyYXN0cnVj
dHVyZSBiZWluZwo+Pj4gLSAgICAgICAgIyBhdmFpbGFibGUuCj4+PiAtICAgICAgICBQQ0lEOiBb
SU5WUENJRF0sCj4+IEkgdGFrZSBpdCB5b3UgaGF2ZW4ndCB0cmllZCBydW5uaW5nIGEgc2hhZG93
IGd1ZXN0IHdpdGggdGhpcyBjaGFuZ2UgaW4KPj4gcGxhY2UuCj4+Cj4+IEZvciAhRVBULCB3ZSBj
bGVhciBFTkFCTEVfSU5WUENJRCBzbyB0aGUgaW5zdHJ1Y3Rpb24gd2lsbCAjVUQgd2l0aGluIHRo
ZQo+PiBndWVzdC4KPj4KPj4gV2UgY291bGQgaW4gcHJpbmNpcGxlIGFsbG93IHRoZSB1c2Ugb2Yg
SU5WUENJRCB3aXRoIHNoYWRvdyBndWVzdHMsIGJ1dAo+PiB0aGF0IHdvdWxkIGludm9sdmUgdGVh
Y2hpbmcgWGVuIGhvdyB0byBjb3BlIHdpdGggVk1FWElUX1JFQVNPTl9JTlZQQ0lECj4+ICh3aGlj
aCBpcyBwcmVkaWNhdGVkIG9uIElOVkxQRyBleGl0aW5nKSBhbmQgd2lyZSB0aGUgZmx1c2ggYmFj
ayBpbnRvIHRoZQo+PiBzaGFkb3cgbG9naWMuCj4+Cj4+IFBlcmhhcHMgdGhlIGNvbW1lbnQgY291
bGQgYmUgYSBsaXR0bGUgY2xlYXJlciwgYnV0IGl0IGlzIG5vIGFjY2lkZW50Cj4+IHRoYXQgZGVw
ZW5kZW5jeSBpcyBpbiBwbGFjZS4KPiBJJ20gYWZyYWlkIEkgZG9uJ3QgZm9sbG93OiBCb3RoIGZl
YXR1cmVzIGFyZSBtYXJrZWQgSCBpbiB0aGUKPiBwdWJsaWMgaGVhZGVyLCBzbyBJIGRvbid0IHNl
ZSBob3cgc2hhZG93IG1vZGUgY29uc2lkZXJhdGlvbnMKPiBhcHBseSBoZXJlIGF0IGFsbC4KCk9o
LsKgIE9mIGNvdXJzZS7CoCBJJ20gbm90IGNvbmZ1c2VkIGFzIHRvIHdoeSB0aGF0IHdhcyBwcmVz
ZW50IHRvIGJlaW5nIHdpdGguCgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
