Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D636B120581
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 13:24:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igpMV-0002sw-Qj; Mon, 16 Dec 2019 12:20:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SuIK=2G=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1igpMT-0002sr-UF
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 12:20:29 +0000
X-Inumbo-ID: 6d6742c0-1ffe-11ea-a1e1-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6d6742c0-1ffe-11ea-a1e1-bc764e2007e4;
 Mon, 16 Dec 2019 12:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576498820;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=qPV1RXm73Ip66L8VTqosRA+jJ9xLBTNrl2JmafAfvJY=;
 b=ZrCitweGlfEPqAWBBK21+JcIIOcOWcI2jSbywsjZUVw3CRcTLpx9pS7R
 Wckj800uTSAWw5QrO8hGrT5H284WkC2ZTj+e3eR58Ke2kYXF6PbW76kF4
 vx9O4ICRFZEaJaoLq9m47Re+FCJD1pK3V5ziJfNqLg6zX1ROjzmFF1YDe Q=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +91Vyd18HIMqAl+XmN1jEAQA+R8tZyWxAUlle35OL7DKkXe4tcov4Rq4PzuBF6t+nKyEELN/39
 waZhHNWtQMxtb5ssSgEScQD1Qntgr8hEfGkUaPnIY05Cb9kaR9jlgDE2MJ2OymyBfh+nRGhnD1
 lGDDyioNeMd3OBAIs63Q8tGIrGEMq0mhfVdF+LONWE3tGx5BvjVjei+x8kEwkf73CF/cBaG+MW
 yPZ4AHQ5QCEqNMj4WnO1ruQmB0CNLLUb/SLb7ZqMYDyPl5gEh9/XR89cP1raZEQHPkwUAvMvLr
 pWw=
X-SBRS: 2.7
X-MesageID: 10291820
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,321,1571716800"; d="scan'208";a="10291820"
To: Jan Beulich <jbeulich@suse.com>
References: <13e82227-1de3-fd48-bd0f-99f07fca21db@suse.com>
 <799bdacb-6090-7ebe-64ef-b8803f099810@citrix.com>
 <59a8a5cf-2033-69e1-d103-b0c3d21c725c@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <fdbce86f-7b04-2bc2-035a-869aa31d3cfe@citrix.com>
Date: Mon, 16 Dec 2019 12:20:18 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <59a8a5cf-2033-69e1-d103-b0c3d21c725c@suse.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH v2 0/3] x86: Protected Processor Inventory
 Number (PPIN) support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTYvMTIvMjAxOSAxMTozMywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTMuMTIuMjAxOSAy
MDo1MCwgQW5kcmV3IENvb3BlciB3cm90ZToKPj4gT24gMDgvMTEvMjAxOSAxNToyMiwgSmFuIEJl
dWxpY2ggd3JvdGU6Cj4+PiAxOiBpbmNsdWRlIHRoZSBQUElOIGluIE1DRSByZWNvcmRzIHdoZW4g
YXZhaWxhYmxlCj4+PiAyOiBleHBsaWNpdGx5IGRpc2FsbG93IGd1ZXN0IGFjY2VzcyB0byBQUElO
Cj4+PiAzOiBwcm92aWRlIERvbTAgYWNjZXNzIHRvIFBQSU4gdmlhIFhFTlBGX3Jlc291cmNlX29w
Cj4+Pgo+Pj4gSSBoYXZlIHlldCB0byBnZXQgYXJvdW5kIHRvIHBvc3QgdGhlIExpbnV4IHNpZGUg
Y29uc3VtZXIKPj4+IHBhdGNoIG9mIHRoZSBpbnRlcmZhY2UgYWRkaXRpb24gaW4gcGF0Y2ggMS4K
Pj4gV2hhdCBhYm91dCBwcmludGluZyB0aGUgUFBJTiBpbmZvcm1hdGlvbiB3aGVuIFhlbiB3cml0
ZXMgTUNFIGRldGFpbHMgdG8KPj4gdGhlIGNvbnNvbGU/Cj4gRG8geW91IG1lYW4gaW4geDg2X21j
aW5mb19kdW1wKCksIG9yIG1jX3BhbmljKCksIG9yIHlldCBzb21ld2hlcmUKPiBlbHNlPwoKU29t
ZXRoaW5nIHdoaWNoIGVuZHMgdXAgb24gdGhlIGNvbnNvbGUuCgo+IEluIGFueSBldmVudCBpZiB3
ZSBkaWQgc28gSSdkIHdhbnQgdG8gYXJyYW5nZSBmb3IgZWFjaCBQUElOCj4gdG8gZ2V0IGxvZ2dl
ZCBhdCBtb3N0IG9uY2UsIHRvIHJlZHVjZSB1bm5lY2Vzc2FyeSByZWR1bmRhbmN5LgoKR2V0dGlu
ZyBpdCBwcmludGVkLCBldmVuIHJlZHVuZGFudGx5IGlzIG1vcmUgaGVscGZ1bCB0aGFuIG5vdCBo
YXZpbmcgaXQKcHJpbnRlZC4KCj4gT2YgY291cnNlIHRoZXJlJ3MgYSBjb21tZW50IGFoZWFkIG9m
IHg4Nl9tY2luZm9fZHVtcCgpIG1lbnRpb25pbmcKPiB0aGF0IHRoZSBvdXRwdXQgaXMgdG8gYmUg
cGFyc2VhYmxlIGJ5IG1jZWxvZywgc28gSSdtIG5vdCBzdXJlIGlmCj4gd2UgY2FuIHJlYXNvbmFi
bHkgY2hhbmdlIHdoYXQgd2UgcHJvZHVjZS4gT3RvaCBJJ20gYWxzbyBub3Qgc3VyZQo+IHRoZSBj
b21tZW50IGhhc24ndCBiZWNvbWUgc3RhbGUgd2l0aCBpdHMgKHByZXN1bWVkKSBwb3J0aW5nIGZy
b20KPiBMaW51eCBhbnl3YXkuCgpUaGF0IGNvbW1lbnQgaXMgbG9uZyBvYnNvbGV0ZS7CoCBXaGF0
IFhlbiBwcmludHMgbmVlZHMgc3Vic3RhbnRpYWwKcmVhcnJhbmdpbmcgZm9yIG1jZWxvZyB0byBw
YXJzZSBpdCB0aGVzZSBkYXlzLgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
