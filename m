Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F473D695
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 21:21:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hamFk-0001nB-Uk; Tue, 11 Jun 2019 19:16:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LgYn=UK=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hamFi-0001n6-Mk
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 19:16:14 +0000
X-Inumbo-ID: 6092ce5d-8c7d-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6092ce5d-8c7d-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 19:16:13 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: f+wqjoGi7EYbp2sxjyIgXEjUouUvf5MG/JWnwq7rCks1uTKf47QG8kOGGV8gZX1/ZvILCn/MaH
 wgMZlc0MnUO4XzOQI17vHg+BabSabN5QqTMPDQBruy/t18CjMa3GadIiR7a4zPR/9Ukx9MpclQ
 bBUlKhl6bFxbfRHzZg53a+WoC8cGglAjUUfzGMaAZmrECgSDvLNyQghAXBwcVVomKlfT09brN6
 SWdLkIomR6iJ/QKYfvXpeh4GO6q7IUwQ14pu1djLW/6G8uVQROuJWzpBER/9TuqpVbiBAGu4A5
 0u4=
X-SBRS: 2.7
X-MesageID: 1599120
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,362,1557201600"; 
   d="scan'208";a="1599120"
To: Christopher Clark <christopher.w.clark@gmail.com>, Nicholas Tsirakis
 <niko.tsirakis@gmail.com>
References: <fb83896f3b399c7ace3292f38506812bc4616f6d.1560272437.git.tsirakisn@ainfosec.com>
 <CACMJ4GYFeudWjWUOEDPYCKPF+JNJ761yQ7n+rkEY4bzWbnO69Q@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fed80081-964c-05a2-8438-4b01d250eb8c@citrix.com>
Date: Tue, 11 Jun 2019 20:16:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CACMJ4GYFeudWjWUOEDPYCKPF+JNJ761yQ7n+rkEY4bzWbnO69Q@mail.gmail.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] argo: warn sendv() caller when ring is
 full
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Nicholas Tsirakis <tsirakisn@ainfosec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTEvMDYvMjAxOSAxOTo0MywgQ2hyaXN0b3BoZXIgQ2xhcmsgd3JvdGU6Cj4gT24gVHVlLCBK
dW4gMTEsIDIwMTkgYXQgMTA6MTEgQU0gTmljaG9sYXMgVHNpcmFraXMKPiA8bmlrby50c2lyYWtp
c0BnbWFpbC5jb20+IHdyb3RlOgo+PiBJbiBpdHMgY3VycmVudCBzdGF0ZSwgaWYgdGhlIGRlc3Rp
bmF0aW9uIHJpbmcgaXMgZnVsbCwgc2VuZHYoKQo+PiB3aWxsIHJlcXVldWUgdGhlIG1lc3NhZ2Ug
YW5kIHJldHVybiB0aGUgcmMgb2YgcGVuZGluZ19yZXF1ZXVlKCksCj4+IHdoaWNoIHdpbGwgcmV0
dXJuIDAgb24gc3VjY2Vzcy4gVGhpcyBwcmV2ZW50cyB0aGUgY2FsbGVyIGZyb20KPj4gZGlzdGlu
Z3Vpc2hpbmcgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiBhIHN1Y2Nlc3NmdWwgd3JpdGUgYW5kIGEK
Pj4gbWVzc2FnZSB0aGF0IG5lZWRzIHRvIGJlIHJlc2VudCBhdCBhIGxhdGVyIHRpbWUuCj4+Cj4+
IEluc3RlYWQsIGNhcHR1cmUgdGhlIC1FQUdBSU4gdmFsdWUgcmV0dXJuZWQgZnJvbSByaW5nYnVm
X2luc2VydCgpCj4+IGFuZCAqb25seSogb3ZlcndyaXRlIGl0IGlmIHRoZSByYyBvZiBwZW5kaW5n
X3JlcXVldWUoKSBpcyBub24temVyby4KPj4gVGhpcyBhbGxvd3MgdGhlIGNhbGxlciB0byBtYWtl
IGludGVsbGlnZW50IGRlY2lzaW9ucyBvbiAtRUFHQUlOIGFuZAo+PiBzdGlsbCBiZSBhbGVydGVk
IGlmIHRoZSBwZW5kaW5nIG1lc3NhZ2UgZmFpbHMgdG8gcmVxdWV1ZS4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogTmljaG9sYXMgVHNpcmFraXMgPHRzaXJha2lzbkBhaW5mb3NlYy5jb20+Cj4gVGhhbmtz
IGZvciB0aGUgY29ycmVjdCBpZGVudGlmaWNhdGlvbiBvZiB0aGUgcHJvYmxlbSBhbmQgdGhlIHBh
dGNoLgo+Cj4gUmV2aWV3ZWQtYnk6IENocmlzdG9waGVyIENsYXJrIDxjaHJpc3RvcGhlci5jbGFy
azZAYmFlc3lzdGVtcy5jb20+CgpTbyBJIHdhcyBjb21pbmcgdG8gY29tbWl0IHRoaXMsIGJ1dCB0
ZWNobmljYWxseSBhY2NvcmRpbmcgdG8gdGhlCm1haW50YWluZXJzIGZpbGUsIEFSR08gaXMgbWFp
bnRhaW5lZCBieSA8Y2hyaXN0b3BoZXIudy5jbGFya0BnbWFpbC5jb20+CgpMb29raW5nIGF0IHRo
ZSBBUkdPIHNlcmllcyBhcyBjb21taXR0ZWQsIHRoZSBwYXRjaGVzIHdoZXJlIGFsbCBGcm9tOgpn
bWFpbCwgU29COiBiYWVzeXN0ZW1zLgoKV2hpY2ggaXMgdGhlIGNvcnJlY3QgYWxpYXMgdG8gdXNl
PwoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
