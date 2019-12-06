Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E81115419
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 16:21:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idFNE-0004QG-Px; Fri, 06 Dec 2019 15:18:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cnnL=Z4=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1idFND-0004QB-0a
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 15:18:27 +0000
X-Inumbo-ID: a6065a5a-183b-11ea-834b-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a6065a5a-183b-11ea-834b-12813bfff9fa;
 Fri, 06 Dec 2019 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575645505;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Ykqe/BWPKBtkHz9MPLCvAZ6bK5BHVkMVN8ciq9wFlPs=;
 b=XaspLhA3kihulqK90kltXlPn8IpOTu21E8G45Eknr1jqGDWPHxxzgwt1
 rVB9f9rQ6BdPX8QRIXPEw28gE+OCVM1PcYDxXUm85J+oMLHfln23MevHa
 Om46rqvZINyeF0GfjxT7WUv67wDN7eeTpdPsfceNMz/DDOd2mcDxMEEQ4 c=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=george.dunlap@citrix.com;
 spf=Pass smtp.mailfrom=George.Dunlap@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 george.dunlap@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="george.dunlap@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 George.Dunlap@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="George.Dunlap@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="George.Dunlap@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 8/pjMbmH4/9dn+qCjbdQ91RoZoZr7lytxDiYCFjvegUWxv4iVjXPtckQkRxl2+79nS3JTgCAdK
 zGIR1bg0lhXSa5A/XL0vY+1vLOSWBeHbcqWIVhMnDy7C6wsEst7ohgGME7AGMzCFrIUpbKK1nd
 h48y0VwejLUMuLuOQ5Mcja3aoHfk6Xa3BQADNUQaS2brsIWyi+xjrWVNMemiwuBXGzIn79eZy2
 vxSQ1SLkIghej69zX12c7C+WaTiMbsGDZhmvufxfnTQta7EC+OHvzp3R/h104I0fxBplx+C0j8
 LU0=
X-SBRS: 2.7
X-MesageID: 9866564
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9866564"
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <aa92bd0c-f35c-2bf3-d665-4977f83bb0d5@suse.com>
 <8dc4166d-45c3-0a5c-8782-78de1b74ad36@xen.org>
 <271f8148-e74a-3d3b-375d-991d7cb9e475@suse.com>
 <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
From: George Dunlap <george.dunlap@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=george.dunlap@citrix.com; prefer-encrypt=mutual; keydata=
 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
 rIFfe2Dk+lD9A9BVd2rfoHA=
Message-ID: <b29aa452-0eb3-10b3-fc4c-311e2122b5b4@citrix.com>
Date: Fri, 6 Dec 2019 15:18:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <eb8c5538-0a7b-fef5-01b6-6458b3b5d24c@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] cmdline: treat hyphens and underscores the
 same
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Konrad
 Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvNi8xOSAyOjQ2IFBNLCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgSmFuLAo+IAo+IE9u
IDA1LzEyLzIwMTkgMTY6NTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNS4xMi4yMDE5IDE3
OjI3LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+PiBPbiAwNS8xMi8yMDE5IDE1OjMzLCBKYW4gQmV1
bGljaCB3cm90ZToKPj4+PiAtLS0gYS94ZW4vY29tbW9uL2tlcm5lbC5jCj4+Pj4gKysrIGIveGVu
L2NvbW1vbi9rZXJuZWwuYwo+Pj4+IEBAIC0yMyw2ICsyMyw0OSBAQCBlbnVtIHN5c3RlbV9zdGF0
ZSBzeXN0ZW1fc3RhdGUgPSBTWVNfU1RBCj4+Pj4gwqDCoCB4ZW5fY29tbWFuZGxpbmVfdCBzYXZl
ZF9jbWRsaW5lOwo+Pj4+IMKgwqAgc3RhdGljIGNvbnN0IGNoYXIgX19pbml0Y29uc3Qgb3B0X2J1
aWx0aW5fY21kbGluZVtdID0KPj4+PiBDT05GSUdfQ01ETElORTsKPj4+PiDCoMKgICtzdGF0aWMg
aW50IGNkaWZmKHVuc2lnbmVkIGNoYXIgYzEsIHVuc2lnbmVkIGNoYXIgYzIpCj4+Pgo+Pj4gVGhp
cyBpcyBub3Qgb2J2aW91cyBmcm9tIHRoZSBuYW1lIGFuZCB0aGUgaW1wbGVtZW50YXRpb24gd2hh
dCBpdCBkb2VzCj4+PiAoaXQgdG9vayBtZSBhIGZldyBtaW51dGVzIHRvIGZpZ3VyZSBpdCBvdXQp
LiBTbyBJIHRoaW5rIHlvdSB3YW50IHRvIGFkZAo+Pj4gYSBjb21tZW50Lgo+Pgo+PiBTdXJlLCBk
b25lLgo+Pgo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBpbnQgcmVzID0gYzEgLSBjMjsKPj4+PiArCj4+
Pj4gK8KgwqDCoCBpZiAoIHJlcyAmJiAoYzEgXiBjMikgPT0gKCctJyBeICdfJykgJiYKPj4+PiAr
wqDCoMKgwqDCoMKgwqDCoCAoYzEgPT0gJy0nIHx8IGMxID09ICdfJykgKQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCByZXMgPSAwOwo+Pj4+ICsKPj4+PiArwqDCoMKgIHJldHVybiByZXM7Cj4+Pj4gK30K
Pj4+PiArCj4+Pj4gKy8qCj4+Pj4gKyAqIFN0cmluZyBjb21wYXJpc29uIGZ1bmN0aW9ucyBtb3N0
bHkgbWF0Y2hpbmcgc3RyY21wKCkgLyBzdHJuY21wKCksCj4+Pj4gKyAqIGV4Y2VwdCB0aGF0IHRo
ZXkgdHJlYXQgJy0nIGFuZCAnXycgYXMgbWF0Y2hpbmcgb25lIGFub3RoZXIuCj4+Pj4gKyAqLwo+
Pj4+ICtzdGF0aWMgaW50IF9zdHJjbXAoY29uc3QgY2hhciAqczEsIGNvbnN0IGNoYXIgKnMyKQo+
Pj4KPj4+IEkgdGhvdWdodCB3ZSB3ZXJlIHRyeWluZyB0byBhdm9pZCBuZXcgZnVuY3Rpb24gbmFt
ZSB3aXRoIGxlYWRpbmcgXz8KPj4KPj4gV2UncmUgdHJ5aW5nIHRvIGF2b2lkIG5ldyBuYW1lIHNw
YWNlIHZpb2xhdGlvbnMuIFN1Y2ggYXJlCj4+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcgd2l0aCB0
d28gdW5kZXJzY29yZXMsCj4+IC0gaWRlbnRpZmllcnMgc3RhcnRpbmcgd2l0aCBhbiB1bmRlcnNj
b3JlIGFuZCBhbiB1cHBlciBjYXNlIGxldHRlciwKPj4gLSBpZGVudGlmaWVycyBvZiBub24tc3Rh
dGljIHN5bWJvbHMgc3RhcnRpbmcgd2l0aCBhbiB1bmRlcnNjb3JlLgo+IAo+IEkgYW0gbm90IHN1
cmUgdG8gdW5kZXJzdGFuZCB3aHkgbm9uLXN0YXRpYyBzeW1ib2xzIG9ubHkuIFRoaXMgd291bGQK
PiBwcmV2ZW50IHlvdSB0byB1c2UgdGhlIHRoZSBub24tc3RhdGljIHN5bWJvbCBpZiB5b3UgaGFw
cGVuIHRvIHJlLXVzZSB0aGUKPiBzYW1lIG5hbWUuCj4gCj4gQW55d2F5LCBob3cgYWJvdXQgY2Fs
bGluZyBpdCBjbWRsaW5lX3N0cm5jbXAoKT8gVGhpcyB3b3VsZCBiZSBlYXNpZXIgdG8KPiBzcG90
IG1pc3VzZSBvbiByZXZpZXcgKGkuZSB1c2luZyBzdHJuY21wKCkgcmF0aGVyIHRoYW4gX3N0cm5j
bXAoKSkuCgpGV0lXIEkgd2FzIHRoaW5raW5nIHNvbWV0aGluZyBzaW1pbGFyLgoKIC1HZW9yZ2UK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
