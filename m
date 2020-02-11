Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68377159763
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2020 18:57:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1Zkg-0004Mp-6X; Tue, 11 Feb 2020 17:55:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BEN5=37=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1j1Zke-0004Mj-Kj
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2020 17:55:12 +0000
X-Inumbo-ID: a604618c-4cf7-11ea-b60c-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a604618c-4cf7-11ea-b60c-12813bfff9fa;
 Tue, 11 Feb 2020 17:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1581443711;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=O2uY8iPPZzP7UvyCWvQgQ9iDA3UeJycRtczk00og9MA=;
 b=Mw0Ty8uFVSZonDvG1tOHZ+LmyhIitWZvhXBy/GL4KjzESeSgI2q6EGX2
 /eMLRv6SutfyBFFmB2TjV+IShutsgNTTx6y18dHdNk6rVLSQKEfACh3ri
 kgk0GXYf4zZOdUZBHONSoJJ9FPSwcRdmQRIbNbzb+ho7LUWQ9c0Fjm3qu 0=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: ShXO53jwVgV62/ZRRiy/YkL6osuGPHRg53oLIkFE6WauMCxgOGPhuTLLdrqhFKetqmIHS2myXQ
 BnwaQdh+9aiG67CoRtZy+dEW2waJkPICtnMyPm38zXuczrJl8WJ5im/gz8NRAKFWWJFYNiLkJJ
 x1+zSO1JN3+CChsUfxZt2hDlfbM24u7qH7o8RMx2CbIkdkI9V8HZ05i5p9Ebm83pjqO4yK3zMt
 3ZjO9WTTmLD/5VTZUJxzQjgX/3KJe04QhEYLpjc6dMjRW9T1KEDYAhAMkUD7LO03pMPPbzBvXJ
 O0c=
X-SBRS: 2.7
X-MesageID: 12656521
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,428,1574139600"; d="scan'208";a="12656521"
To: Ian Jackson <ian.jackson@citrix.com>
References: <20200205165056.11734-1-andrew.cooper3@citrix.com>
 <20200205165056.11734-6-andrew.cooper3@citrix.com>
 <24130.59555.850210.126017@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <dcac4b7b-c790-981f-2d9c-3277c46a9a38@citrix.com>
Date: Tue, 11 Feb 2020 17:55:08 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <24130.59555.850210.126017@mariner.uk.xensource.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 5/6] tools/libx[cl]: Don't use
 HVM_PARAM_PAE_ENABLED as a function parameter
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
Cc: Anthony
 Perard <anthony.perard@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDIvMjAyMCAxNzo0NywgSWFuIEphY2tzb24gd3JvdGU6Cj4gQW5kcmV3IENvb3BlciB3
cml0ZXMgKCJbUEFUQ0ggNS82XSB0b29scy9saWJ4W2NsXTogRG9uJ3QgdXNlIEhWTV9QQVJBTV9Q
QUVfRU5BQkxFRCBhcyBhIGZ1bmN0aW9uIHBhcmFtZXRlciIpOgo+PiBUaGUgc29sZSB1c2Ugb2Yg
SFZNX1BBUkFNX1BBRV9FTkFCTEVEIGlzIGFzIGEgbm9uLXN0YW5kYXJkIGNhbGxpbmcgY29udmVu
dGlvbgo+PiBmb3IgeGNfY3B1aWRfYXBwbHlfcG9saWN5KCkuICBQYXNzIFBBRSBhcyBhIHJlZ3Vs
YXIgcGFyYW1ldGVyIGluc3RlYWQuCj4+Cj4+IExlYXZlIGEgcmF0aGVyIGJldHRlciBleHBsYWlu
YXRpb24gb2Ygd2h5IG9ubHkgSFZNIGd1ZXN0cyBoYXZlIGEgY2hvaWNlIGluIFBBRQo+PiBzZXR0
aW5nLgo+IEkgYW0gaW5jbGluZWQgYmVsaWV2ZSB5b3UgdGhhdCB0aGlzIGlzIHJpZ2h0IChzaW5j
ZSB5b3UgYXJlIGV2aWRlbnRseQo+IGZhbWlsaWFyIHdpdGggdGhpcyB3aG9sZSBhcmVhIGFuZCBJ
J20gbm90KSwgYnV0IHRoZSBleHBsYW5hdGlvbnMgbGVhdmUKPiBtZSBjb25mdXNlZC4KPgo+PiAg
aW50IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9t
aWQsCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IHVpbnQzMl90ICpmZWF0dXJl
c2V0LCB1bnNpZ25lZCBpbnQgbnJfZmVhdHVyZXMpCj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnN0IHVpbnQzMl90ICpmZWF0dXJlc2V0LCB1bnNpZ25lZCBpbnQgbnJfZmVhdHVyZXMs
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcGFlKQo+PiAgewo+PiAgICAgIGlu
dCByYzsKPj4gICAgICB4Y19kb21pbmZvX3QgZGk7Cj4+IEBAIC01NzksOCArNTgwLDYgQEAgaW50
IHhjX2NwdWlkX2FwcGx5X3BvbGljeSh4Y19pbnRlcmZhY2UgKnhjaCwgdWludDMyX3QgZG9taWQs
Cj4+ICAgICAgfQo+PiAgICAgIGVsc2UKPj4gICAgICB7Cj4+IC0gICAgICAgIHVpbnQ2NF90IHZh
bDsKPj4gLQo+PiAgICAgICAgICAvKgo+PiAgICAgICAgICAgKiBUb3BvbG9neSBmb3IgSFZNIGd1
ZXN0cyBpcyBlbnRpcmVseSBjb250cm9sbGVkIGJ5IFhlbi4gIEZvciBub3csIHdlCj4+ICAgICAg
ICAgICAqIGhhcmRjb2RlIEFQSUNfSUQgPSB2Y3B1X2lkICogMiB0byBnaXZlIHRoZSBpbGx1c2lv
biBvZiBubyBTTVQuCj4+IEBAIC02MzUsMTQgKzYzNCwxMCBAQCBpbnQgeGNfY3B1aWRfYXBwbHlf
cG9saWN5KHhjX2ludGVyZmFjZSAqeGNoLCB1aW50MzJfdCBkb21pZCwKPj4gICAgICAgICAgfQo+
PiAgCj4+ICAgICAgICAgIC8qCj4+IC0gICAgICAgICAqIEhWTV9QQVJBTV9QQUVfRU5BQkxFRCBp
cyBhIHBhcmFtZXRlciB0byB0aGlzIGZ1bmN0aW9uLCBzdGFzaGVkIGluCj4+IC0gICAgICAgICAq
IFhlbi4gIE5vdGhpbmcgZWxzZSBoYXMgZXZlciB0YWtlbiBub3RpY2Ugb2YgdGhlIHZhbHVlLgo+
PiArICAgICAgICAgKiBQQUUgdXNlZCB0byBiZSBhIHBhcmFtZXRlciBwYXNzZWQgdG8gdGhpcyBm
dW5jdGlvbiBieQo+PiArICAgICAgICAgKiBIVk1fUEFSQU1fUEFFX0VOQUJMRUQuICBJdCBpcyBu
b3cgcGFzc2VkIG5vcm1hbGx5Lgo+IEluIHBhcnRpY3VsYXIsIEkgZG9uJ3QgdW5kZXJzdGFuZCB3
aGF0IHRoZXNlIGNvbW1lbnRzIG1lYW4gYnkKPiAiSFZNX1BBUkFNX1BBRV9FTkFCTEVEIGlzIGEg
cGFyYW1ldGVyIHRvIHRoaXMgZnVuY3Rpb24iIGFuZCAiUEFFIHVzZWQKPiB0byBiZSBhIHBhcmFt
ZXRlciBwYXNzZWQgdG8gdGhpcyBmdW5jdGlvbiBieSBIVk1fUEFSQU1fUEFFX0VOQUJMRUQiLgo+
Cj4gTWF5YmUgdGhpcyBpcyBzb21lIGxvb3NlIHVzZSBvZiB0aGUgdGVybSAicGFyYW1ldGVyIiA/
Cj4KPiBJZiB5b3UgY291bGQgZXhwbGFpbiBtb3JlIGNsZWFybHkgKGlkZWFsbHksIGV4cGxhaW4g
dGhlIG1lYW5pbmcgb2YgdGhlCj4gb2xkIGNvbW1lbnQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBh
bmQgbWFrZSB0aGUgbmV3IGNvbW1lbnQKPiB1bmFtYmlndW91cykgdGhlbiB0aGF0IHdvdWxkIGJl
IGdyZWF0LgoKSFZNX1BBUkFNX1BBRV9FTkFCTEVEIGVuY2Fwc3VsYXRlcyBhIGJvb2xlYW4gbWVh
bmluZyAic2hvdWxkIEkgYWR2ZXJ0aXNlCnRoZSBQQUUgZmVhdHVyZSB0byB0aGUgZ3Vlc3Q/Ii4K
Ckl0IGhhcyBvbmx5IGV2ZXIgYmVlbiB1c2VkIGluIGEgd2F5IHdoaWNoIHNob3VsZCBoYXZlIGJl
ZW4gImJvb2wgcGFlIgpwYXNzZWQgaW50byB4Y19jcHVpZF9hcHBseV9wb2xpY3koKS7CoCBUaGlz
IHBhdGNoIHRyaWVzIHRvIGRvIGp1c3QgdGhhdC4KCgpJIHRoaW5rIHRoZXJlIG1pZ2h0IGJlIGNv
bmZ1c2lvbiBhcyB0byB3aGljaCBjb21tZW50IHRoZSBjb21taXQgbWVzc2FnZQpyZWZlcnJlZCB0
by4KCkluIHhjX2NwdWlkX2FwcGx5X3BvbGljeSgpLCBJIHdhbnQgYSBjb21tZW50IGV4cGxhaW5p
bmcgd2h5IHdlIGhhdmUgdGhpcwp3ZWlyZCBwYWUgcGFyYW1ldGVyLsKgIEl0IHdpbGwgZGlzYXBw
ZWFyIGZyb20gdGhlIG5ldyB3YXkgb2YgZG9pbmcgQ1BVSUQKYXQgYm9vdCwgYnV0IHdpbGwgaGF2
ZSB0byByZW1haW4gZm9yIHRoZSBwcmUtNC4xNCBjb21wYXRpYmlsaXR5LgoKVGhlIGNvbW1lbnQg
SSB3YXMgcmVmZXJyaW5nIHRvIGluIHRoZSBjb21taXQgbWVzc2FnZSB3YXMgYWN0dWFsbHkgdGhl
CmxpYnhsIGNvbW1lbnQsIGV4cGxhaW5pbmcgd2h5IFBWIGFuZCBQVkggZ3Vlc3RzIGRvbid0IGdl
dCBhIGNob2ljZSB0bwpoaWRlIHRoZSBQQUUgZmVhdHVyZS4KCn5BbmRyZXcKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
