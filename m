Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA194FB225
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 15:07:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUtGm-0004tI-CM; Wed, 13 Nov 2019 14:05:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZSCI=ZF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iUtGk-0004t9-AM
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 14:05:14 +0000
X-Inumbo-ID: 9bc4964f-061e-11ea-a230-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9bc4964f-061e-11ea-a230-12813bfff9fa;
 Wed, 13 Nov 2019 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1573653913;
 h=subject:to:references:from:message-id:date:mime-version:
 in-reply-to:content-transfer-encoding;
 bh=fHhJ8TB1Vb+OlAgcO9Q6HL6RQAQlkAtHyraiBQcVqgg=;
 b=S7Bo/DQSRJejgPu+4QcSnIQHAvfrHqYcP6dZoORNb7uszNK7JtBF119z
 sVoXCGzDGqnKYKDjQIFEGToFI+pm31ZR/79whZOK9lpaETN9FDNyY/oCU
 1u+JSqiBEnLFq7wg+bBKcyQg2gGTVPEwBsACJYDQTePl7oVe5RvABLu9S Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: LOnVv8y8KHy+7GKMT5jlUYp+m+Hl6tQQtWTF8vEG1T4IAk1aDlTptmQbdClQGMvmaREWDhvhyW
 D+OIvITaBpgLNHc8ftYGZ6b1DkeTuxHW/PSQD5dgpoAqVKFnGLkld8F0DQookYtMx+4PK6SP1d
 WuoyCZJmFhT/1reSw4GDjbiQLUUuUCHIrt5DKc7wNoB7NvdUsACCrM6ahb2JcbeS7N8gQi+scn
 hBeiljVpkN7mxpfjGBYNqYmtozSM8CmWqYsKj6Sj6hr7Nhxwf03Y5Yz8oMm9mEqlLltYD8atRQ
 SBY=
X-SBRS: 2.7
X-MesageID: 8373469
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,300,1569297600"; 
   d="scan'208";a="8373469"
To: Paul Durrant <pdurrant@amazon.com>, <xen-devel@lists.xenproject.org>
References: <20191113134729.1121-1-pdurrant@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <ef11eba3-4643-fa7f-2598-6a9a04c2ec77@citrix.com>
Date: Wed, 13 Nov 2019 14:05:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113134729.1121-1-pdurrant@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] domain_create: honour global grant/maptrack
 frame limits...
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMvMTEvMjAxOSAxMzo0NywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IC4uLndoZW4gdGhlaXIg
dmFsdWVzIGFyZSBsYXJnZXIgdGhhbiB0aGUgcGVyLWRvbWFpbiBjb25maWd1cmVkIGxpbWl0cy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4KPiAt
LS0KPiBBZnRlciBtaW5pbmcgdGhyb3VnaCBjb21taXRzIGl0IGlzIHN0aWxsIHVuY2xlYXIgdG8g
bWUgZXhhY3RseSB3aGVuIFhlbgo+IHN0b3BwZWQgaG9ub3VyaW5nIHRoZSBnbG9iYWwgdmFsdWVz
LCBidXQgSSByZWFsbHkgdGhpbmsgdGhpcyBjb21taXQgc2hvdWxkCj4gYmUgYmFjay1wb3J0ZWQg
dG8gc3RhYmxlIHRyZWVzIGFzIGl0IHdhcyBhIGJlaGF2aW91cmFsIGNoYW5nZSB0aGF0IGNhbgo+
IGNhdXNlIGRvbVVzIHRvIGZhaWwgaW4gbm9uLW9idmlvdXMgd2F5cy4KCi0xLsKgIE92ZXJyaWRp
bmcgdG9vbHN0YWNrIHNldHRpbmdzIGxpa2UgdGhpcyBpcyB0aGUgc2FtZSBraW5kIG9mICJiYWQi
CmFzIHNpbGVudGx5IGNvbnZlcnRpbmcgSEFQID0+IFNoYWRvdy4KCkluIHBhcnRpY3VsYXIsIHRo
aXMgYnJlYWtzIG9uZSBvZiBwb2ludHMgb2YgdGhlIG9yaWdpbmFsIHBlci1kb21haW4gd29yawp0
byBkZWxpYmVyYXRlbHkgYWxsb3cgc3R1YiB4ZW5zdG9yZWQgdG8gYmUgY29uZmlndXJlZCB3aXRo
IHRpbnkKZ3JhbnQvbWFwdHJhY2sgdGFibGVzLgoKWW91IGFsc28gYnJlYWsgdGhlIHNldHRpbmcg
b2YgdGhlc2UgcGFyYW1ldGVycyBpbiB4bC5jb25mLgoKSSdtIG5vdCBkZWZlbmRpbmcgaG93IHRo
ZSBpbnRlcmZhY2UgY2hhbmdlZCBzdWJ0bHkvdW5leHBlY3RlZDsgdGhhdCB3YXMKYmFkIGFuZCB3
ZSBzaG91bGQgaGF2ZSBkb25lIGJldHRlciwgYnV0IHRoaXMgY2hhbmdlIGlzIGp1c3QgYXMgYmFk
IGluCnRoZSBvcHBvc2l0ZSBkaXJlY3Rpb24uCgpUaGUgd2F5IHRvIGZpeCB0aGlzIGlzIHRvIHBs
dW1iIHRoZSBYZW4gZGVmYXVsdCBwYXJhbWV0ZXJzIHRob3VnaCBzbwp0aGF0LCBpbiB0aGUgYWJz
ZW5jZSBvZiBhbnkgZXhwbGljaXQgY29uZmlndXJhdGlvbiAodm0uY2ZnIG9yIHhsLmNvbmYpLAps
aWJ4bCBjYW4gdGhlbiB1c2UgInhlbiBjbWRsaW5lIiBhcyBhIHNvdXJjZSBvZiBjb25maWd1cmF0
aW9uLCBiZWZvcmUKZmFsbGluZyBiYWNrIHRvIGhhcmRjb2RlZCBudW1iZXJzLgoKfkFuZHJldwoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
