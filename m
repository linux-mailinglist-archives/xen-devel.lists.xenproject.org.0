Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 216F0114EE7
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 11:17:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idAdW-0002nk-DW; Fri, 06 Dec 2019 10:14:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fkk7=Z4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idAdU-0002nG-DX
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 10:14:56 +0000
X-Inumbo-ID: 3f859c3e-1811-11ea-8250-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f859c3e-1811-11ea-8250-12813bfff9fa;
 Fri, 06 Dec 2019 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575627295;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=kmzwpsBSViCg0woKfb+IuAAKzaIAoHh9chhwTYq7Isc=;
 b=WUuAzEEwE2wM551ky7bdiDXc9owLBj34zWwZeN7+mYLrQHX74IiQCQxD
 D4a0+Q1kH39gDPrP2/ke9n+GKkpvVWyw/d8ikaoYlxeTmIWo9XNSY0QPJ
 JY75zWgyeEIgeOVhGIs6joyKPts9QRXnA2Z9UeIyl0mtA51DaI+rgOdQW 4=;
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
IronPort-SDR: wdgZOxqC6g0ek7jq/P0rWptIXY2vfdev9yu+e9uEmSOaTLlmFwiPRF4eNn2MJqkS3Uk1cZu617
 StwQaLmUzCowmDZFubUyKm4lpyjKFRYwZWrLzhWnwvgFFYQdg5eAG+0RDSmTI6mwYlMnLStsC5
 /rAHFdE/4DpLttRW/44aMzsW7NQ/JpTM9LpfaR0z+J9sZped14cvnxiRmylOtZ/X9JxVDFq9nN
 WXcnARjLPt6NaVc3SHaxd9HS1m9IoOqd8zYdctoxuYIegJ6JkkOONiSNYpgMpESsyJUEX9Eqtz
 NCQ=
X-SBRS: 2.7
X-MesageID: 9711713
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,284,1571716800"; 
   d="scan'208";a="9711713"
To: Jan Beulich <jbeulich@suse.com>
References: <20191205223008.8623-1-andrew.cooper3@citrix.com>
 <36c45366-35e2-68a9-fbc7-01fd935bf720@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <62e68657-dd09-85ea-662b-0f54688ed93a@citrix.com>
Date: Fri, 6 Dec 2019 10:14:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <36c45366-35e2-68a9-fbc7-01fd935bf720@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 0/6] xen: Support continuations from tasklets
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMTIvMjAxOSAwOTo1OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMDUuMTIuMjAxOSAy
MzozMCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gRnJvbSB0ZXN0aW5nIHRoaXMgc2VyaWVzLCBJ
IGhhdmUgcmUtY29uZmlybWVkIHRoZSBwcmV2aW91cyByZXBvcnRlZAo+PiBvYnNlcnZhdGlvbiB0
aGF0Ogo+Pgo+PiAgICMgd2hpbGUgOjsgZG8geGVuLWhwdG9vbCBzbXQtZW5hYmxlOyB4ZW4taHB0
b29sIHNtdC1kaXNhYmxlOyBkb25lCj4+Cj4+IGluIGRvbTAgZXZlbnR1YWxseSBjYXVzZXMgdGhl
IHNlcmlhbCBjb25zb2xlIHRvIGNlYXNlIHdvcmtpbmcgKHdlZGdlIG1pZHdheQo+PiB0aHJvdWdo
IHByaW50aW5nIGEgbGluZSkuCj4+Cj4+IFRoZXJlIGFyZSBzcG9yYWRpYyAiQnJva2UgYWZmaW5p
dHkgZm9yIElSUTI2LCBuZXc6IGZmZmYiIG1lc3NhZ2VzLCBidXQgdGhlCj4+IHNlcmlhbCBhbHdh
eXMgc2VlbXMgdG8gYnJlYWsgc2hvcnRseSBhZnRlciB0aGUgZmlyc3QgIkJyb2tlIGFmZmluaXR5
IGZvcgo+PiBJUlEzMCwgbmV3OiBmZmZmIi4gIEJvdGggSVJRcyBhcmUgbm9uLWRlc2NyaXB0IFBD
SS1NU0kvLVggaW50ZXJydXB0cyBib3VuZCB0bwo+PiBkb20wLgo+IEFuZCBuZWl0aGVyIElSUTMw
IG5vdCBJUlEyNiBhcmUgdGhlIHNlcmlhbCBvbmVzPyBBbmQgc2VyaWFsIGRvZXMKPiB1c2UgYW4g
SVJRIChpLmUuIGlzbid0IHJ1bm5pbmcgaW4gcG9sbGluZyBtb2RlKT8gSSdsbCBzZWUgaWYgSQo+
IGNhbiByZXBybyAoYW5kIHRoZW4gbWF5YmUgYmUgYWJsZSB0byBkZWJ1ZykuCgpTZXJpYWwgdXNl
cyBJUlEwIGFuZCBuZXZlciBoYXMgYWZmaW5pdHkgY2hhbmdlcyBhcyBpdCBpcyBhbHdheXMgYm91
bmQgdG8KQ1BVMC4KCkdpdmVuIG91ciByZWNlbnQgZnVuIHdpdGggdGhlIFBFT0kgc3RhY2ssIHRo
YXQgd2FzIGdvaW5nIHRvIGJlIG15IG5leHQKcG9ydCBvZiBjYWxsLsKgIEhvd2V2ZXIgZXZlcnl0
aGluZyBlbHNlIGluIHRoZSBzeXN0ZW0gbG9va3MgdG8gYmUgd29ya2luZwpmaW5lLCBpbmNsdWRp
bmcgdGhlIGRpc2tzIGFuZCBuZXR3b3JrLCBzdWdnZXN0aW5nIHRoYXQgd2UgYXJlbid0IGxvc2lu
ZwpvdGhlciBpbnRlcnJ1cHRzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
