Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4F6122AF4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 13:07:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihBb0-0006OG-4a; Tue, 17 Dec 2019 12:04:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=DkcM=2H=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ihBay-0006OB-6N
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2019 12:04:56 +0000
X-Inumbo-ID: 6b6b6628-20c5-11ea-b6f1-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b6b6628-20c5-11ea-b6f1-bc764e2007e4;
 Tue, 17 Dec 2019 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576584287;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aKr5Z01YqMmptpCUVQrfpD6KQLJmJpzQcvaPBROnHJ0=;
 b=KnyKuu4VuVWRs+eJzeYr640hVCm+cKl6S9gwBC4uBz3f3epJc2efBOOs
 8BC71KAWMZbYFoga4BO/pPzZgPUhiCR2X2/me/egFesiWZzktSCconI/K
 KMR5L0Qtdh9jurdKybhRnP+EnxC4f8iJjMm2K9y6i6hMyioNm86ST4pN0 c=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
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
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: poMjiVrcssh064BUZNLqZWlil0BKZMSpHaGbKG/4SF9kwcEj+Q71P96egM1igrcl+Rj1XokKot
 M551JWKlOMH/TH+9k540d7t92Mw5+a6phxO3kyuSbQC3ZXwUQkv3yBsfo9V1piu/FGNVzEf3kI
 gOL4HZHln8zYHs9CPn8J6AZNjZkpjh+haDZaoZJmzxafTStzsHnLukKI5F91CR11f45OtnVtFU
 7Y5AkZdEphY/vUZtlYvQhMXhva4FuBemjMNPTYupp/PQSSf5QVBpPrIIiqF/p9wQuV7UBXxW5r
 SCc=
X-SBRS: 2.7
X-MesageID: 10159722
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; d="scan'208";a="10159722"
Date: Tue, 17 Dec 2019 13:04:40 +0100
From: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191217120440.GU11756@Air-de-Roger>
References: <20191213190436.24475-1-andrew.cooper3@citrix.com>
 <20191213190436.24475-4-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191213190436.24475-4-andrew.cooper3@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL03.citrite.net (10.69.22.127)
Subject: Re: [Xen-devel] [PATCH 3/6] x86/suspend: Don't save unnecessary GPRs
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
 Jan Beulich <JBeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCBEZWMgMTMsIDIwMTkgYXQgMDc6MDQ6MzNQTSArMDAwMCwgQW5kcmV3IENvb3BlciB3
cm90ZToKPiBPbmx5IHRoZSBjYWxsZWUtcHJlc2VydmVkIHJlZ2lzdGVycyBuZWVkIHNhdmluZy9y
ZXN0b3JpbmcuICBTcGlsbCB0aGVtIHRvIHRoZQo+IHN0YWNrIGxpa2UgcmVndWxhciBmdW5jdGlv
bnMgZG8uICAlcnNwIGlzIG5vdyB0aGUgb25seSBHUFIgd2hpY2ggZ2V0cyBzdGFzaGVkCj4gaW4g
LmRhdGEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRy
aXguY29tPgoKPiAtLS0KPiBDQzogSmFuIEJldWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPgo+IEND
OiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+IENDOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVA
Y2l0cml4LmNvbT4KPiAtLS0KPiAgeGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUyB8IDU5
ICsrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspLCA0NyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
eGVuL2FyY2gveDg2L2FjcGkvd2FrZXVwX3Byb3QuUyBiL3hlbi9hcmNoL3g4Ni9hY3BpL3dha2V1
cF9wcm90LlMKPiBpbmRleCAzNWZkN2E1ZTlmLi4yZjZjOGUxOGVmIDEwMDY0NAo+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9hY3BpL3dha2V1cF9wcm90LlMKPiArKysgYi94ZW4vYXJjaC94ODYvYWNwaS93
YWtldXBfcHJvdC5TCj4gQEAgLTExLDI0ICsxMSwxNCBAQAo+ICAjZGVmaW5lIFJFRih4KSAgICAg
ICAgICB4KCVyaXApCj4gIAo+ICBFTlRSWShkb19zdXNwZW5kX2xvd2xldmVsKQo+ICsgICAgICAg
IHB1c2ggICAgJXJicAo+ICsgICAgICAgIHB1c2ggICAgJXJieAo+ICsgICAgICAgIHB1c2ggICAg
JXIxMgo+ICsgICAgICAgIHB1c2ggICAgJXIxMwo+ICsgICAgICAgIHB1c2ggICAgJXIxNAo+ICsg
ICAgICAgIHB1c2ggICAgJXIxNQoKSSB3YXMgZXhwZWN0aW5nIFhlbiBoYWQgYSBtYWNybyBmb3Ig
dGhpcyAoYW5kIHRoZSByZXN0b3JlCmNvdW50ZXJwYXJ0KSwgYnV0IEkgaGF2ZW4ndCBmb3VuZCBh
bnkgKG5laXRoZXIgYW55IG90aGVyIHBsYWNlcyB3aGVyZQppdCB3b3VsZCBiZSB1c2VmdWwpLgoK
VGhhbmtzLCBSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
