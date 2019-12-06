Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2126C1156CC
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2019 18:54:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1idHkC-0001nD-3N; Fri, 06 Dec 2019 17:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fkk7=Z4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1idHkA-0001n8-J2
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2019 17:50:18 +0000
X-Inumbo-ID: dcd80cbc-1850-11ea-b6f1-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dcd80cbc-1850-11ea-b6f1-bc764e2007e4;
 Fri, 06 Dec 2019 17:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1575654618;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=HlxZcBic2Mdtz0FwbE8iaAPuJd75iYRV8UxAbYG7vZ8=;
 b=cWI+WqiP9MI34P0h3qEJt7HDpgqhs+ztGfRiS2YefrIm1dO3qtDjeirl
 yc9q2hErIMqUJRra1opqgRZ5NCsuLTOwffA+0pCzW7BgDFbjhJoC3/bx1
 e43CqAQsmaZ2EPPuiYcMw6Ve3PmR2C6+Jyz6XJbXmQli4xRIu9ec0/dYu 0=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qBjD/sXvstg+RmW0zfLk63Y9C4Z28aI7jtoNN5PATQA/ZnFDl8RGhjhXb9ECwE7w1ecF7fLBTR
 VCwced4VONzqJPgElxTs4/AQxqQ5ym8A2F8CuJIG9e7Vj4jOJ3HnjlxxCeTd6C8nD/yZtPeIgp
 8usPtz1FSn2jTjlI2Fs4kLY3AFNI841iRs6IiL+gmmWrFJrQQahLepvL1nCUVbghqySprVCgW5
 nO4diaI6YqrmSKpuIXX8dpWXxO0t9nVsiAN97B9XoJV7LdyZ7F47xOEAFHEE4gjMjGFKGJ0slx
 AVM=
X-SBRS: 2.7
X-MesageID: 9322069
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,285,1571716800"; 
   d="scan'208";a="9322069"
To: Hongyan Xia <hongyxia@amazon.com>, <xen-devel@lists.xenproject.org>
References: <cover.1575646580.git.hongyxia@amazon.com>
 <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <43b7603e-bd14-d6eb-8d79-9afcd8627efd@citrix.com>
Date: Fri, 6 Dec 2019 17:50:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <86a6fb68f76ab287f5c2d99d1e7954e8b2d1ab05.1575646580.git.hongyxia@amazon.com>
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
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
Cc: jgrall@amazon.com, Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYvMTIvMjAxOSAxNTo1MywgSG9uZ3lhbiBYaWEgd3JvdGU6Cj4gbWFwX3BhZ2VzX3RvX3hl
biBhbmQgbW9kaWZ5X3hlbl9tYXBwaW5ncyBhcmUgcGVyZm9ybWluZyBhbG1vc3QgZXhhY3RseQo+
IHRoZSBzYW1lIG9wZXJhdGlvbnMgd2hlbiBzaGF0dGVyaW5nIGFuIGwzIFBURSwgdGhlIG9ubHkg
ZGlmZmVyZW5jZQo+IGJlaW5nIHdoZXRoZXIgd2Ugd2FudCB0byBmbHVzaC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IEhvbmd5YW4gWGlhIDxob25neXhpYUBhbWF6b24uY29tPgoKSnVzdCBmb3IgcmV2aWV3
aW5nIHB1cnBvc2VzLCBob3cgZG9lcyB0aGlzIHJlbGF0ZSB0byB5b3VyIG90aGVyIHBvc3RlZApz
ZXJpZXMuwqAgSXMgaXQgaW5kZXBlbmRlbnQsIGEgcHJlcmVxdWlzaXRlLCBvciBkb2VzIGl0IGRl
cGVuZCBvbiB0aGF0CnNlcmllcz8KCj4gLS0tCj4gIHhlbi9hcmNoL3g4Ni9tbS5jIHwgODUgKysr
KysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQ1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9tbS5jIGIveGVuL2FyY2gveDg2L21tLmMKPiBpbmRleCA3ZDRkZDgwYTg1
Li40MmFhYWExMDgzIDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS5jCj4gKysrIGIveGVu
L2FyY2gveDg2L21tLmMKPiBAQCAtNTE1MSw2ICs1MTUxLDQzIEBAIGwxX3BnZW50cnlfdCAqdmly
dF90b194ZW5fbDFlKHVuc2lnbmVkIGxvbmcgdikKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZsdXNoX2FyZWFfbG9jYWwoKGNvbnN0IHZvaWQgKil2LCBmKSA6IFwKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGZsdXNoX2FyZWFfYWxsKChjb25zdCB2b2lkICopdiwgZikpCj4gIAo+ICsv
KiBTaGF0dGVyIGFuIGwzIGVudHJ5IGFuZCBwb3B1bGF0ZSBsMi4gSWYgdmlydCBpcyBwYXNzZWQg
aW4sIGFsc28gZG8gZmx1c2guICovCj4gK3N0YXRpYyB2b2lkIHNoYXR0ZXJfbDNlKGwzX3BnZW50
cnlfdCAqcGwzZSwgbDJfcGdlbnRyeV90ICpsMnQsCj4gKyAgICAgICAgdW5zaWduZWQgbG9uZyB2
aXJ0LCBib29sIGxvY2tpbmcpCj4gK3sKPiArICAgIHVuc2lnbmVkIGludCBpOwo+ICsgICAgbDNf
cGdlbnRyeV90IG9sM2UgPSAqcGwzZTsKPiArCj4gKyAgICBmb3IgKCBpID0gMDsgaSA8IEwyX1BB
R0VUQUJMRV9FTlRSSUVTOyBpKysgKQo+ICsgICAgICAgIGwyZV93cml0ZShsMnQgKyBpLAo+ICsg
ICAgICAgICAgICAgICAgICBsMmVfZnJvbV9wZm4obDNlX2dldF9wZm4ob2wzZSkgKwo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKGkgPDwgUEFHRVRBQkxFX09SREVSKSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGwzZV9nZXRfZmxhZ3Mob2wzZSkpKTsKClRoZSBQ
VEUgbWFjcm9zIGFyZSBlc3BlY2lhbGx5IHBvb3IgZm9yIGdlbmVyYXRlZCBhc20sIGFuZCBpbiBj
YXNlcyBsaWtlCnRoaXMsIEknZCBsaWtlIHRvIGltcHJvdmUgdGhpbmdzLgoKSW4gcGFydGljdWxh
ciwgSSBiZWxpZXZlIHRoZSBmb2xsb3dpbmcgY29kZSBoYXMgaWRlbnRpY2FsIGJlaGF2aW91cjoK
CmwyX3BnZW50cnlfdCBubDJlID0gbDJlX2Zyb21faW50cHRlKGwzZV9nZXRfaW50cHRlKG9sM2Up
KTsKCmZvciAoIGkgPSAwOyBpIDwgTDJfUEFHRVRBQkxFX0VOVFJJRVM7IGkrKywgbmwyZS5sMiAr
PSBQQUdFVEFCTEVfT1JERVIgKQrCoMKgwqAgbDJlX3dyaXRlKGwydCArIGksIG5sMmUpOwoKKGFs
dGhvdWdoIHNvbWVvbmUgcGxlYXNlIGRvdWJsZSBjaGVjayBteSBsb2dpYykgYW5kIHJhdGhlciBi
ZXR0ZXIgYXNtCmdlbmVyYXRpb24uwqAgKEkgYWxzbyBleHBlY3QgdGhlcmUgdG8gYmUgc29tZSBk
aXNjdXNzaW9uIG9uIHdoZXRoZXIgdXNpbmcKbjJsZS5sMiBkaXJlY3RseSBpcyBzb21ldGhpbmcg
d2UnZCB3YW50IHRvIHN0YXJ0IGRvaW5nLikKCj4gKwo+ICsgICAgaWYgKCBsb2NraW5nICkKPiAr
ICAgICAgICBzcGluX2xvY2soJm1hcF9wZ2Rpcl9sb2NrKTsKPiArICAgIGlmICggKGwzZV9nZXRf
ZmxhZ3Mob2wzZSkgJiBfUEFHRV9QUkVTRU5UKSAmJgo+ICsgICAgICAgICAobDNlX2dldF9mbGFn
cyhvbDNlKSAmIF9QQUdFX1BTRSkgKQoKVGhlcmUgaXMgYSBzdWJ0bGUgZGlmZmVyZW5jZSBiZXR3
ZWVuIHRoZSBvcmlnaW5hbCBjb2RlLCBhbmQgdGhlCnJlZmFjdG9yZWQgY29kZSwgYW5kIGl0IGRl
cGVuZHMgb24gdGhlIG1lbW9yeSBiYXJyaWVyIGZyb20gc3Bpbl9sb2NrKCkuCgpQcmV2aW91c2x5
LCBpdCB3YXMgcmUtcmVhZCBmcm9tIG1lbW9yeSBhZnRlciB0aGUgbG9jaywgd2hlcmVhcyBub3cg
aXQgaXMKbGlrZWx5IHRoZSBzdGFsZSB2ZXJzaW9uIGZyb20gYmVmb3JlIG1hcF9wZ2RpciB3YXMg
bG9ja2VkLgoKRWl0aGVyIHlvdSBjYW4gZ28gYmFjayB0byB0aGUgb2xkIHZlcnNpb24gYW5kIHVz
ZSAqcGwzZSwgb3IKYWx0ZXJuYXRpdmVseSB1c2U6CgrCoMKgwqAgaWYgKCBsb2NraW5nICkKwqDC
oMKgwqDCoMKgwqAgc3Bpbl9sb2NrKCZtYXBfcGdkaXJfbG9jayk7CsKgwqDCoCBvbDNlID0gQUND
RVNTX09OQ0UoKnBsM2UpOwrCoMKgwqAgaWYgKCAuLi4KCnRvIG1ha2UgaXQgY2xlYXIgdGhhdCBh
IHJlcmVhZCBmcm9tIG1lbW9yeSBpcyByZXF1aXJlZC4KCj4gKyAgICB7Cj4gKyAgICAgICAgbDNl
X3dyaXRlX2F0b21pYyhwbDNlLCBsM2VfZnJvbV9tZm4odmlydF90b19tZm4obDJ0KSwKClRoaXMg
d291bGQgcHJvYmFibHkgZ2VuZXJhdGUgYmV0dGVyIGFzbSBieSB1c2luZyB0aGUgbWFkZHIgdmFy
aWFudHMgc28Kd2UgZG9uJ3QgaGF2ZSBhIGRvdWJsZSBzaGlmdC4KCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgX19QQUdFX0hZUEVSVklTT1IpKTsKPiArICAg
ICAgICBsMnQgPSBOVUxMOwo+ICsgICAgfQo+ICsgICAgaWYgKCBsb2NraW5nICkKPiArICAgICAg
ICBzcGluX3VubG9jaygmbWFwX3BnZGlyX2xvY2spOwo+ICsgICAgaWYgKCB2aXJ0ICkKPiArICAg
IHsKPiArICAgICAgICB1bnNpZ25lZCBpbnQgZmx1c2hfZmxhZ3MgPQo+ICsgICAgICAgICAgICBG
TFVTSF9UTEIgfCBGTFVTSF9PUkRFUigyICogUEFHRVRBQkxFX09SREVSKTsKPiArCj4gKyAgICAg
ICAgaWYgKCAobDNlX2dldF9mbGFncyhvbDNlKSAmIF9QQUdFX0dMT0JBTCkgKQo+ICsgICAgICAg
ICAgICAgICAgZmx1c2hfZmxhZ3MgfD0gRkxVU0hfVExCX0dMT0JBTDsKPiArICAgICAgICBmbHVz
aF9hcmVhKHZpcnQsIGZsdXNoX2ZsYWdzKTsKPiArICAgIH0KPiArICAgIGlmICggbDJ0ICkKPiAr
ICAgICAgICBmcmVlX3hlbl9wYWdldGFibGUobDJ0KTsKClRoaXMgc3VyZWx5IG5lZWRzIHRvIE5V
TEwgb3V0IGwydCwganVzdCBzbyB0aGUgY2FsbGVyIGRvZXNuJ3QgZ2V0IGFueQpjbGV2ZXIgaWRl
YXMgYW5kIGVuZHMgdXAgd2l0aCBhIHVzZS1hZnRlci1mcmVlPwoKfkFuZHJldwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
