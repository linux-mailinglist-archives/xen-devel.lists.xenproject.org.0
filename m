Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0879E109D3A
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 12:46:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZZGH-0008Uz-4I; Tue, 26 Nov 2019 11:44:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/P3v=ZS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1iZZGF-0008Uu-K6
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 11:44:03 +0000
X-Inumbo-ID: 0a9b4bb3-1042-11ea-a39e-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a9b4bb3-1042-11ea-a39e-12813bfff9fa;
 Tue, 26 Nov 2019 11:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1574768642;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=dIenyL5bHP4OR+MtcX77mIrC1uAU+QrJ+YA1cpQJ+bs=;
 b=gtJsjkRF7PXMecxBAH8jugfmNeoBwtO+IN/rbQHFElPkx+CrOwhjqg2h
 rWvMQAcVHAP5ET8XfALWF0MqOn827S/G3bQht0Btz433MG9L6fLP4x1O5
 t3pSUjRLI6Wcd8pIYHxE7nCzbZEucBwsLdryt97MTG5S4oYVIK7PqlTgE c=;
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
IronPort-SDR: 3MSeY4rU3RZHAqR8WfW/y9qcXiOT/GZg/5cAD656+8K0JEfrsgSulOUQ9bQPHKuvzRcrcAz7yg
 VJO+A0k5FUiCUfbTb5HPbJDJtjmogb7rX3NFTHlbsHYtJvrWopllv8tioqHuBaG7nyanp3tsqq
 LmouLDUvHkrl7/zpYAhtZ/9fWJ5coeoeqKYn19ZuVKw+kPV/jWUmqwHywL035m83eTJ3i4Yz2y
 sBFCXLCxLXdwAb9Zwh27UiJJa6YAUAvNtpzQurUjjt4hJj8/ENf7hsbgFVwL8iWUcJ/Ea9JuD8
 TOM=
X-SBRS: 2.7
X-MesageID: 9389316
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,245,1571716800"; 
   d="scan'208";a="9389316"
To: Paul Durrant <pdurrant@gmail.com>, Paul Durrant <pdurrant@amazon.com>
References: <20191113135330.1209-1-pdurrant@amazon.com>
 <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Openpgp: preference=signencrypt
Autocrypt: addr=andrew.cooper3@citrix.com; prefer-encrypt=mutual; keydata=
 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
 6+ahAA==
Message-ID: <b77770bf-ebd0-200e-4331-23a5990720b4@citrix.com>
Date: Tue, 26 Nov 2019 11:43:57 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CACCGGhAQBdr3_B1htAS0aVFdADBk5gwnSr17vn4LN5Sh7FoTuA@mail.gmail.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan
 Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYvMTEvMjAxOSAxMTozMCwgUGF1bCBEdXJyYW50IHdyb3RlOgo+IE9uIFdlZCwgMTMgTm92
IDIwMTkgYXQgMTM6NTUsIFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4gd3JvdGU6
Cj4+IC4uLndoZW4gdGhlaXIgdmFsdWVzIGFyZSBsYXJnZXIgdGhhbiB0aGUgcGVyLWRvbWFpbiBj
b25maWd1cmVkIGxpbWl0cy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVy
cmFudEBhbWF6b24uY29tPgo+PiAtLS0KPj4gQ2M6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29w
ZXIzQGNpdHJpeC5jb20+Cj4+IENjOiBHZW9yZ2UgRHVubGFwIDxHZW9yZ2UuRHVubGFwQGV1LmNp
dHJpeC5jb20+Cj4+IENjOiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4K
Pj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gQ2M6IEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+Cj4+IENjOiBLb25yYWQgUnplc3p1dGVrIFdpbGsgPGtvbnJhZC53
aWxrQG9yYWNsZS5jb20+Cj4+IENjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtl
cm5lbC5vcmc+Cj4+IENjOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPgo+Pgo+PiBBZnRlciBtaW5pbmcg
dGhyb3VnaCBjb21taXRzIGl0IGlzIHN0aWxsIHVuY2xlYXIgdG8gbWUgZXhhY3RseSB3aGVuIFhl
bgo+PiBzdG9wcGVkIGhvbm91cmluZyB0aGUgZ2xvYmFsIHZhbHVlcywgYnV0IEkgcmVhbGx5IHRo
aW5rIHRoaXMgY29tbWl0IHNob3VsZAo+PiBiZSBiYWNrLXBvcnRlZCB0byBzdGFibGUgdHJlZXMg
YXMgaXQgd2FzIGEgYmVoYXZpb3VyYWwgY2hhbmdlIHRoYXQgY2FuCj4+IGNhdXNlIGRvbVVzIHRv
IGZhaWwgaW4gbm9uLW9idmlvdXMgd2F5cy4KPiBBbnkgb3RoZXIgb3BpbmlvbnMgb24gdGhpcz8g
QUZBSUNUIHF1ZXN0aW9ucyBpcyBzdGlsbCBvcGVuOgo+Cj4gLSBEbyB3ZSBjb25zaWRlciBub3Qg
aG9ub3VyaW5nIHRoZSBjb21tYW5kIGxpbmUgdmFsdWVzIHRvIGJlIGEKPiByZWdyZXNzaW9uIChz
aW5jZSBkb21VcyB0aGF0IHdvdWxkIGhhdmUgd29ya2VkIGJlZm9yZSB3aWxsIG5vIGxvbmdlcgo+
IHdvcmsgYWZ0ZXIgYSBiYXNpYyB1cGdyYWRlIG9mIFhlbik/CgpJIHRoaW5rIEkndmUgYmVlbiB2
ZXJ5IGNsZWFyIG9uIG15IG9waW5pb24gb2YgdGhpcyBwYXRjaCwgYW5kIHdoYXQgSQp3b3VsZCBj
b25zaWRlciBhbiBhY2NlcHRhYmxlIHdheSBmb3J3YXJkLgoKVGhpcyBwYXRjaCBicmVha3MgdGhp
bmdzIGluIGV4YWN0bHkgdGhlIChvcHBvc2l0ZSkgd2F5IHlvdSBhcmUKY29tcGxhaW5pbmcgYWJv
dXQgaGF2aW5nIGhhcHBlbmVkIHdoZW4gdGhlIFhlbiBjb21tYW5kIGxpbmUgb3B0aW9ucyB3ZXJl
CnJlcGxhY2VkIHdpdGggeGwuY29uZiBvcHRpb25zIGZvciBkb21VLgoKWWVzIC0gaXQgd2Fzbid0
IGdyZWF0IHRvIGhhdmUgZG9uZSB0aGluZ3MgbGlrZSB0aGlzLsKgIE5vIC0gaXRzIG5vdAphY2Nl
cHRhYmxlIHRvIGRvIHRoZSBzYW1lIGFnYWluIGFuZCBicmVhayBwZW9wbGUgbm93IHJlbHlpbmcg
b24gdGhlIHBlcgpkb21haW4gc2V0dGluZ3MgdG8gdGFrZSBlZmZlY3QuCgp+QW5kcmV3CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
