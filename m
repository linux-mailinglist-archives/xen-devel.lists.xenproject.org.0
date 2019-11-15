Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A112AFE1A6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2019 16:39:07 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVdf0-0006mJ-5S; Fri, 15 Nov 2019 15:37:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bLue=ZH=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1iVdez-0006mE-CZ
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2019 15:37:21 +0000
X-Inumbo-ID: cf8e7ac6-07bd-11ea-a276-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf8e7ac6-07bd-11ea-a276-12813bfff9fa;
 Fri, 15 Nov 2019 15:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573832241;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Zb+UPtAt1kRPcRZbl7GVXOBgy2fvJ3A39cNWR5qA5o4=;
 b=QBAGLZskJ4+LtwvmNy9bCDSq1sZwxfRzBtnIPmRWnU9IW7CuT7s8neLI
 3M0mvpJzWmAoB831eahzL2XWYuwJLLAIyqTBxnMMStqMcU8+SDAvxV7j4
 PhHSfkASCTBdvsQfwDkT+K63eg2Az0/y+/OxsjkbHvjCF+A70+57EazQW E=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
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
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: mX7r1nC18lWR2t5W2DWna55thKcWEhJbSgkky7Je2YyHqRTxOJGSJmMViAyTBfTmeN7IFrNXmH
 lgkHAbSc4prSId553+Y6iZ1sLoaeHZ6wx+AGtzkAYoDnqItcif/vXAJ5GfYvR4P/mx47ONuSrx
 YGSFeUvfihJjnJX/jiwL3vhMXedMKhSq8BVb7EzxGu5536HmCWL+aUH6KrmmqJhJkYFE+sXX8T
 RUwF+GiRTvA1TK9Uz4172t2YsQnNwKp6dKcCcgpyhs9pMVFPUI2kcTXNVvo81C9OD5jvxGVMFE
 C3A=
X-SBRS: 2.7
X-MesageID: 8391951
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,308,1569297600"; 
   d="scan'208";a="8391951"
To: Jan Beulich <jbeulich@suse.com>
References: <20191115105739.20333-1-george.dunlap@citrix.com>
 <1573828317.2460.0@crc.id.au>
 <c8ee22b9-5823-a362-4ca3-e7bcec105b99@citrix.com>
 <fd43f974-5915-c2d5-a019-ec1adc8597b3@suse.com>
 <35ea5459-fbe7-a2f1-0fb5-40408fad13ab@citrix.com>
 <b8d4c82e-48ca-3f14-a804-64b00506f602@suse.com>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <eff4f7c8-0d8d-0f55-a862-7ad46e7d1682@citrix.com>
Date: Fri, 15 Nov 2019 15:37:16 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b8d4c82e-48ca-3f14-a804-64b00506f602@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH RFC] x86: Add hack to disable "Fake HT" mode
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
Cc: Steven Haigh <netwiz@crc.id.au>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Andreas Kinzler <hfp@posteo.de>, IanJackson <ian.jackson@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMTUvMTkgMzozNCBQTSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTUuMTEuMjAxOSAx
NjozMCwgR2VvcmdlIER1bmxhcCB3cm90ZToKPj4gT24gMTEvMTUvMTkgMzoyNyBQTSwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiBPbiAxNS4xMS4yMDE5IDE2OjA1LCBHZW9yZ2UgRHVubGFwIHdyb3Rl
Ogo+Pj4+IEZUUiwgcGxlYXNlIGF2b2lkIHRvcC1wb3N0aW5nLiA6LSkKPj4+Pgo+Pj4+IE9uIDEx
LzE1LzE5IDI6MzEgUE0sIFN0ZXZlbiBIYWlnaCB3cm90ZToKPj4+Pj4gSnVzdCByZWdhcmRpbmcg
dGhlIHVzZSBvZiBhIHN5c3RlbSBlbnZpcm9ubWVudCB2YXJpYWJsZSB0byB0dXJuIHRoaXMKPj4+
Pj4gZmVhdHVyZSAvIGJ1Z2ZpeCAvIGhhY2sgb24gYW5kIG9mZiAtIHRoaXMgd291bGQgcHJvYmFi
bHkgYnJlYWsgc3RhcnRpbmcKPj4+Pj4gdGhlIFZNIHZpYSB0aGUgeGVuZG9tYWlucyBzY3JpcHQu
Cj4+Pj4+Cj4+Pj4+IElmIHRoZSBWTSBkZWZpbml0aW9uIGlzIGluIC9ldGMveGVuL2F1dG8vLCB0
aGVuIHRoZXJlIHdvdWxkIGJlIG5vdGhpbmcKPj4+Pj4gdG8gc2V0IHRoZSBlbnZpcm9ubWVudCB2
YXJpYWJsZSBiZWZvcmUgdGhlIFZNIGlzIGxhdW5jaGVkIC0gaGVuY2UgaXQKPj4+Pj4gd291bGQg
bm90IGJlIGFwcGxpZWQgYW5kIGEgZ3Vlc3QgY3Jhc2ggd291bGQgb2NjdXIuLi4KPj4+Pj4KPj4+
Pj4gRGVwZW5kaW5nIG9uIHRoZSBWTSdzIHNldHRpbmdzLCB0aGlzIHdvdWxkIGVpdGhlciBjb250
aW51ZSB0byBzdGFydCAmCj4+Pj4+IGNyYXNoIC0gb3IganVzdCBzdG9wIGFnYWluIHVudGlsIGl0
IGNvdWxkIGJlIHN0YXJ0ZWQgd2l0aCB0aGUgRU5WIHZhcmlhYmxlLgo+Pj4+Cj4+Pj4gUmlnaHQu
ICBTbyBhIGNvdXBsZSBvZiBvcHRpb25zOgo+Pj4+Cj4+Pj4gMS4gVXNlcnMgb2YgeGVuZG9tYWlu
cyBjb3VsZCBzZXQgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIGluIHRoZWlyCj4+Pj4geGVuZG9t
YWlucyBzY3JpcHQKPj4+Pgo+Pj4+IDIuIFdlIGNvdWxkIGFkZCBhIHhsLmNmZyBvcHRpb24uICBV
bmtub3duIHhsLmNmZyBlbnRyaWVzIGFyZSBpZ25vcmVkCj4+Pj4gKGZvciBiZXR0ZXIgb3IgZm9y
IHdvcnNlKTsgaW4gdGhlIGZ1dHVyZSwgd2hlbiB0aGUgImZha2UgaHQiIHRoaW5nIGlzCj4+Pj4g
cmVwbGFjZWQsIHdlIGNhbiBlaXRoZXIgY29udGludWUgaWdub3JpbmcgaXQsIG9yIGdpdmUgYSB1
c2VmdWwgZXJyb3IKPj4+PiBtZXNzYWdlIHNheWluZyBob3cgaXQgc2hvdWxkIGJlIGNoYW5nZWQu
Cj4+Pj4KPj4+PiAyYS4gIFdlIGNvdWxkIGhhdmUgdGhlIGNvbmZpZyBvcHRpb24gKnJlcGxhY2Uq
IHRoZSBlbnZpcm9ubWVudCB2YXJpYWJsZTsKPj4+PiBpbiB3aGljaCBjYXNlIHdlJ2QgbGVhdmUg
bGlidmlydCB1c2VycyBoaWdoIGFuZCBkcnkKPj4+Pgo+Pj4+IDJiLiBXZSBjb3VsZCBoYXZlIHRo
ZSBjb25maWcgb3B0aW9uIGNhdXNlIHhsIHRvICpzZXQqIHRoZSBlbnZpcm9ubWVudAo+Pj4+IHZh
cmlhYmxlLCB3aGljaCBzaG91bGQgY29udGludWUgdG8gYWxsb3cgb3RoZXIgdG9vbHN0YWNrcyAo
ZXZlbiB0aG9zZQo+Pj4+IG5vdCB1c2luZyBsaWJ4bCkgdG8gcG90ZW50aWFsbHkgd29yayBhcm91
bmQgdGhlIGlzc3VlLgo+Pj4KPj4+IEFuZCBob3cgd291bGQgYW55IG9mIHRoZXNlIGFsbG93IHRv
IGRlYWwgd2l0aCBoZXRlcm9nZW5lb3VzIHNldHMgb2YKPj4+IGd1ZXN0cz8KPj4KPj4gQXJlIHlv
dSBwZXJoYXBzIGNvbmZ1c2luZyAneGwuY2ZnJyAod2hpY2ggaXMgdGhlIHBlci1kb21haW4KPj4g
Y29uZmlndXJhdGlvbiBmaWxlKSB3aXRoICd4bC5jb25mJyAod2hpY2ggaXMgdGhlIHN5c3RlbS13
aWRlCj4+IGNvbmZpZ3VyYXRpb24gZmlsZSk/Cj4gCj4gT2gsIGluZGVlZCBJIHdhcy4gSSdtIG5v
dCB1c2VkIHRvIGFueSBzdWZmaXhlcyBvbiBkb21haW4gY29uZmlnCj4gZmlsZXMuIEknbSBzb3Jy
eS4KCkZZSSBJJ20gdXNpbmcgdGhlIG5hbWVzIG9mIHRoZSByZXNwZWN0aXZlIG1hbiBwYWdlczog
YG1hbiB4bC5jZmdgIGdpdmVzCnlvdSB0aGUgbWFuIHBhZ2UgZm9yIHRoZSBwZXItZG9tYWluIGNv
bmZpZywgYG1hbiB4bC5jb25mYCBnaXZlcyB5b3UgdGhlCmdsb2JhbCBjb25maWcuCgpJdCdzIGZh
ciBmcm9tIG9idmlvdXMsIGJ1dCBhdCBsZWFzdCBpdCdzIHNvbWV0aGluZy4gOi0pCgogLUdlb3Jn
ZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
