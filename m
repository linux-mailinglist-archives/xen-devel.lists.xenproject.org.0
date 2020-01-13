Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6841390D3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 13:10:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqyWJ-0007Bf-OD; Mon, 13 Jan 2020 12:08:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=A39C=3C=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iqyWI-0007BL-3J
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 12:08:34 +0000
X-Inumbo-ID: 6b12ffe0-35fd-11ea-8254-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b12ffe0-35fd-11ea-8254-12813bfff9fa;
 Mon, 13 Jan 2020 12:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578917313;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=TJ7pEo6yiDs2DKouvNFuHduq1r9LBzpv2JhDTLXqj7w=;
 b=XjZhnApOtQqlfYoW6Br+Q+1F7d5PHxQdl6ECpM2+SknPdBef5+AzL+Z/
 sbTv2evbKZAoWGT4j+TyePuwllkvxeSR7ufWPujPX+hKg8SOnG/H/t++2
 g2pOB6IjfDPOqdwCRM4HalQ3DCNc/agS8jguNYoQMcVdFO0GJa4MOXeJn g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
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
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: zDyf+E+2fZ46hA6hL4Y9c+nr3uQhPJUaObmQMn5B1qk564neALGTekaxRarX6f4m63uWqxkU+/
 diHn8pViM5tcVheP9Pw2+NF3kGJjn8VW2Fr99TTa8rSTLAJfaRyB9oBYNqCMBdHgz9HQCmP8qe
 wosaqOpK9/SP1/ZvREYM192rMxFSpp/0x3Cy8PicVk9G06jqKj7i9c6qSeCqlc+n7RQtJn43ah
 EdoylF7k64tS5MYmJWVbzGwYzR2SsTmE7rhRea0soZPuxcNTHMzc8GUXADIK+9h3BHNExGsgEI
 RTY=
X-SBRS: 2.7
X-MesageID: 11258912
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,428,1571716800"; d="scan'208";a="11258912"
To: Jan Beulich <jbeulich@suse.com>
References: <20200106155423.9508-1-andrew.cooper3@citrix.com>
 <20200106155423.9508-5-andrew.cooper3@citrix.com>
 <3601fa20-ba6a-78d6-62a2-a204ee49021e@suse.com>
 <e52491a3-da1e-5c86-8038-f008d181c3a8@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <0758c44f-1b8e-88f1-e81e-61d3a8d7a39f@citrix.com>
Date: Mon, 13 Jan 2020 12:08:28 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e52491a3-da1e-5c86-8038-f008d181c3a8@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH 4/6] x86/boot: Clean up l?_bootmap[]
 construction
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

T24gMDcvMDEvMjAyMCAxNjozMCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDcuMDEuMjAyMCAx
NzoxNiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDA2LjAxLjIwMjAgMTY6NTQsIEFuZHJldyBD
b29wZXIgd3JvdGU6Cj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvZWZpL2VmaS1ib290LmgKPj4+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaAo+Pj4gQEAgLTU4NCwyMSArNTg0LDI0IEBA
IHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9tZW1vcnlfc2V0dXAodm9pZCkKPj4+ICAgICAg
aWYgKCAhZWZpX2VuYWJsZWQoRUZJX0xPQURFUikgKQo+Pj4gICAgICAgICAgcmV0dXJuOwo+Pj4g
IAo+Pj4gLSAgICAvKiBJbml0aWFsaXNlIEwyIGlkZW50aXR5LW1hcCBhbmQgYm9vdC1tYXAgcGFn
ZSB0YWJsZSBlbnRyaWVzICgxNk1CKS4gKi8KPj4+ICsgICAgLyoKPj4+ICsgICAgICogTWFwIFhl
biBpbnRvIHRoZSBkaXJlY3RtYXAgKE5YLCBuZWVkZWQgZm9yIGVhcmx5LWJvb3QgcGFnZXRhYmxl
Cj4+PiArICAgICAqIGhhbmRsaW5nL3dhbGtpbmcpLCBhbmQgaWRlbnRpdHkgbWFwIFhlbiBpbnRv
IGJvb3RtYXAgKFgsIG5lZWRlZCBmb3IgdGhlCj4+PiArICAgICAqIHRyYW5zaXRpb24gZnJvbSB0
aGUgRUZJIHBhZ2V0YWJsZXMgdG8gWGVuKSwgdXNpbmcgMk0gc3VwZXJwYWdlcy4KPj4+ICsgICAg
ICovCj4+IEhvdyBkb2VzIE5YIHZzIFggbWF0dGVyIGZvciB0aGUgY29kZSBiZWxvdyBoZXJlPyBQ
QUdFX0hZUEVSVklTT1IgYW5kCj4+IF9fUEFHRV9IWVBFUlZJU09SLCBhcyB1c2VkIGJlbG93LCBk
aWZmZXIgYnkganVzdCBfUEFHRV9HTE9CQUwuIERpZAo+PiB5b3UgbWVhbiB0byBtYWtlIGZ1cnRo
ZXIgY2hhbmdlcz8KCk5vcGUuwqAgVGhlIGNvbW1lbnRzIHdlcmUgYWN0dWFsbHkgY29ycmVjdCAo
YW5kIHRoZSBjb2RlLCByZW1haW5lZCBjb3JyZWN0KS4KClBBR0VfSFlQRVJWSVNPUiBhbmQgX19Q
QUdFX0hZUEVSVklTT1IgcmVhbGx5IGRvIGRpZmZlciBieSBOWCBhcyB3ZWxsLApvdXRzaWRlIG9m
IGFzbSBjb2RlLsKgIEknbSBnb2luZyB0byBmaXggdGhpcyBiZWNhdXNlIGl0cyB0b28gY29tcGxp
Y2F0ZWQKdG8gcmVhc29uIGFib3V0LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
