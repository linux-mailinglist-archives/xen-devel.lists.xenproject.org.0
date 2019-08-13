Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B622C8B1FF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Aug 2019 10:08:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxRlz-0003wX-Az; Tue, 13 Aug 2019 08:03:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8rFE=WJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hxRlx-0003wS-Fc
 for xen-devel@lists.xenproject.org; Tue, 13 Aug 2019 08:03:13 +0000
X-Inumbo-ID: cb4a2066-bda0-11e9-8980-bc764e045a96
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cb4a2066-bda0-11e9-8980-bc764e045a96;
 Tue, 13 Aug 2019 08:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1565683393;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=fGewhxhLZPC0YNCkShWzmIzivuwrkKv9bCoZBCNNwBw=;
 b=NKhAGO9Fbna2xQc3rX9wEKVCxEH62trV414EVKS/uKf9AJx6z3WZiwa5
 uaTmnAy1PmUogCZ64I63ePNFaAsS1chASChopLj40/KF+NT2p/HRwwSp7
 C5eg5BzePLg/QgnPXsD+nBNu6LdtAAoKmK1tH1DLMJ5FZpevzkn65Z+IX A=;
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
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: HG6qMiQLseqYuhlz48t3RkrCyZjqsJ3jvt0XcI7U9l5x0Pp7qDZAZbbRunsHlV8AzlmU8ENNgg
 S2s+cZI9Jcsrd9VC10AJYX4SD0mPycGeT812f7j1o/xpGj0N0N97QDRAlXG+RVnCVWk82o66BP
 Opq14aUac99QaysVjWrwuK1BEWz8/CKpE+89u5HHBmpI2wtIHxXBgRAsl5mAXrWaypzhzMfFXd
 eehTx6h8EImoZBLCkx/9kqNDMqnJi5KCc6ZeaU9UtNLXO1Fc7zrnwysnbccc9vgDHyeJFrLFUP
 w7I=
X-SBRS: 2.7
X-MesageID: 4234916
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,380,1559534400"; 
   d="scan'208";a="4234916"
To: Julien Grall <julien.grall@arm.com>, <xen-devel@lists.xenproject.org>
References: <20190812202735.23411-1-julien.grall@arm.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <d904c960-3a9b-bcfc-1631-5be88f793862@citrix.com>
Date: Tue, 13 Aug 2019 09:03:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190812202735.23411-1-julien.grall@arm.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH] xen/arm: p2m: Free the p2m entry after
 flushing the IOMMU TLBs
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
Cc: olekstysh@gmail.com, oleksandr_tyshchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIvMDgvMjAxOSAyMToyNywgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdoZW4gZnJlZWluZyBh
IHAybSBlbnRyeSwgYWxsIHRoZSBzdWItdHJlZSBiZWhpbmQgaXQgd2lsbCBhbHNvIGJlIGZyZWVk
Lgo+IFRoaXMgbWF5IGluY2x1ZGUgaW50ZXJtZWRpYXRlIHBhZ2UtdGFibGVzIG9yIGFueSBsMyBl
bnRyeSByZXF1aXJpbmcgdG8KPiBkcm9wIGEgcmVmZXJlbmNlIChlLmcgZm9yIGZvcmVpZ24gcGFn
ZXMpLiBBcyBzb29uIGFzIHBhZ2VzIGFyZSBmcmVlZCwKPiB0aGV5IG1heSBiZSByZS11c2VkIGJ5
IFhlbiBvciBhbm90aGVyIGRvbWFpbi4gVGhlcmVmb3JlIGl0IGlzIG5lY2Vzc2FyeQo+IHRvIGZs
dXNoICphbGwqIHRoZSBUTEJzIGJlZm9yZWhhbmQuCj4KPiBXaGlsZSBDUFUgVExCcyB3aWxsIGJl
IGZsdXNoZWQgYmVmb3JlIGZyZWVpbmcgdGhlIHBhZ2VzLCB0aGlzIGlzIG5vdAo+IHRoZSBjYXNl
IGZvciBJT01NVSBUTEJzLiBUaGlzIGNhbiBiZSBzb2x2ZWQgYnkgbW92aW5nIHRoZSBJT01NVSBU
TEJzCj4gZmx1c2ggZWFybGllciBpbiB0aGUgY29kZS4KPgo+IFRoaXMgd2Fzbid0IGNvbnNpZGVy
ZWQgYXMgYSBzZWN1cml0eSBpc3N1ZSBhcyBkZXZpY2UgcGFzc3Rocm91Z2ggb24gQXJtCj4gaXMg
bm90IHNlY3VyaXR5IHN1cHBvcnRlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8
anVsaWVuLmdyYWxsQGFybS5jb20+Cj4KPiAtLS0KPgo+IENjOiBvbGVrc3R5c2hAZ21haWwuY29t
Cj4gQ2M6IG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0uY29tCj4KPiAgICAgSSBkaXNjb3ZlcmVk
IGl0IHdoaWxlIGxvb2tpbmcgYXQgdGhlIGNvZGUsIHNvIEkgZG9uJ3QgaGF2ZSBhbnkKPiAgICAg
cmVwcm9kdWNlciBvZiB0aGUgaXNzdWUuIFRoZXJlIGlzIGEgc21hbGwgd2luZG93cyB3aGVyZSBw
YWdlIGNvdWxkCj4gICAgIGJlIHJlYWxsb2NhdGVkIHRvIFhlbiBvciBhbm90aGVyIGRvbWFpbiBi
dXQgc3RpbGwgcHJlc2VudCBpbiB0aGUKPiAgICAgSU9NTVUgVExCcy4KPgo+ICAgICBUaGlzIHBh
dGNoIG9ubHkgYWRkcmVzcyB0aGUgY2FzZSB3aGVyZSB0aGUgZmx1c2ggc3VjY2VlZC4gSW4gdGhl
Cj4gICAgIHVubGlrZWx5IGNhc2Ugd2hlcmUgaXQgZG9lcyBub3Qgc3VjY2VlZCwgdGhlbiB3ZSB3
aWxsIHN0aWxsIGZyZWUgdGhlCj4gICAgIHBhZ2VzLiBUaGUgSU9NTVUgaGVscGVyIHdpbGwgY3Jh
c2ggZG9tYWluLCBidXQgdGhlIGRldmljZSBtYXkgc3RpbGwKPiAgICAgbm90IGJlIHF1aWVzY2Vu
dC4gU28gdGhlcmUgYXJlIGEgcG90ZW50aWFsbHkgaXNzdWVzIGRvIERNQSBvbiB3cm9uZwo+ICAg
ICB0aGluZ3MuCj4KPiAgICAgQXQgdGhlIG1vbWVudCwgbm9uZSBvZiB0aGUgQXJtIElPTU1VcyBk
cml2ZXJzIChpbmNsdWRpbmcgdGhlIElQTU1VCj4gICAgIG9uZSB1bmRlciByZXZpZXcpIGFyZSBy
ZXR1cm4gYW4gZXJyb3IgaGVyZS4gTm90ZSB0aGF0IGZsdXNoIG1heQo+ICAgICBzdGlsbCBmYWls
IChzZWUgdGltZW91dCksIGJ1dCBpcyBpZ25vcmVkLiBUaGlzIGlzIG5vdCBncmVhdCBhcyBpdAo+
ICAgICBtZWFucyBhIGRldmljZSBtYXkgRE1BIGludG8gc29tZXRoaW5nIHRoYXQgZG9lcyBub3Qg
YmVsb25nIHRvIHRoZQo+ICAgICBkb21haW4uIFNvIHdlIHByb2JhYmx5IHdhbnQgdG8gcmV0dXJu
IGFuIGVycm9yIGhlcmUuCj4KPiAgICAgRXZlbiBpZiBhbiBlcnJvciBpcyByZXR1cm5lZCwgdGhl
cmUgYXJlIHN0aWxsIHBvdGVudGlhbCBpc3N1ZXMKPiAgICAgKHNlZSBhYm92ZSkuIFRoZSBmaXgg
aXMgbm90IGVudGlyZWx5IHRyaXZpYWwsIHdlIHdvdWxkIG5lZWQgdG8ga2VlcAo+ICAgICB0aGUg
cGFnZSBhcm91bmQgdW50aWwgdGhlIGEgZGV2aWNlIGlzIHF1aWVzY2VudCBvciB0aGUgSU9NTVUg
aXMKPiAgICAgcmVzZXQuIFRoaXMgbW9zdGx5IGxpa2VseSBtZWFucyB1bnRpbCB0aGUgZG9tYWlu
IGlzIGZ1bGx5IGRlc3Ryb3llZC4KClhlbidzIGJlaGF2aW91ciB3aXRoIElPTU1VIHRpbWVvdXRz
IGlzIGJyb2tlbiwgYW5kIGRlZmluaXRlbHkgdW5zYWZlLgoKV2UgZG8gbm90IChhbmQgaW5kZWVk
IG11c3Qgbm90KSBpbXBvc2UgYSB0aW1lb3V0IGZvciBUTEIgZmx1c2gKb3BlcmF0aW9ucyBsb2Nh
bGx5IGluIHRoZSBjb3JlLsKgIElPVExCIGZsdXNoIG9wZXJhdGlvbnMgYXJlIG5vIGRpZmZlcmVu
dC4KCklmIHRoZSBJT01NVSBzdGFydHMgbWFsZnVuY3Rpb25pbmcsIHRoYXQgaXMgZmF0YWwgdG8g
dGhlIHdob2xlIHN5c3RlbSwKbm90IGp1c3QgdGhlIGd1ZXN0IGluIHF1ZXN0aW9uLgoKVGhlIG9u
bHkgdmlhYmxlIGFwcHJvYWNoIGlzIHRvIGRyb3AgdGhlIGFydGlmaWNpYWwgdGltZW91dHMgYW5k
IHVwIHRoZQpzZXZlcml0eSBvZiBhIG1hbGZ1bmN0aW9uLgoKfkFuZHJldwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
