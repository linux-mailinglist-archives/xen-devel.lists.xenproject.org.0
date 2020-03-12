Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 658B818369E
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2020 17:52:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCR20-0005SQ-05; Thu, 12 Mar 2020 16:50:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URUF=45=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1jCR1y-0005OE-JN
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2020 16:49:58 +0000
X-Inumbo-ID: 814a0f9e-6481-11ea-92cf-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 814a0f9e-6481-11ea-92cf-bc764e2007e4;
 Thu, 12 Mar 2020 16:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1584031798;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject;
 bh=NQTeYy+u2ModhUu4jOYXS5GN7GjsX0DCT1v50KixZwQ=;
 b=eLohJREobOfkZk0PCrk7v+/bIOI6EvNoLUxBFv6xVkBmLPZK75tJyxj4
 +lxLqTQO5XUhU6AskeMJ7fY0pKu9QkWbmZzJ+fjlptc1BhgVTsCunOsfW
 U4NEFRkU5wwxJrJTqMOquCdHDlEifvrMTZW9Ru831jqs2QqTdLD6OUiRl 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: NlaLgeB8K+TxfnP+DzN5X2AwCr68KOp3dPHHs84i8geNYSGF9DbYQ3rs6yorfBfa2gBHIFUHDI
 xJJFPpxVsTujDolnweKBHiG7/w3ZZgnKq3kGrmgWJoXkQrLIvgsyQfXFkY65VS7qS00oao0oMd
 bXZUjEMh/8KoGA9z42NS+2TYLT8dwGh79LIRUkkiBjbhaIBjNmyIYV1w0QPSmuXMeJZp+7hnzd
 N1okaELt1pFQHAC1kzUjHvL1WZ8px/wMK95HZnKclnB5h0XOgjEaEWVnpwc9O2Y3AQft7i6Btl
 wLI=
X-SBRS: 2.7
X-MesageID: 13862275
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,545,1574139600"; d="scan'208";a="13862275"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24170.26671.783256.460525@mariner.uk.xensource.com>
Date: Thu, 12 Mar 2020 16:49:51 +0000
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>, Roger Pau =?iso-8859-1?Q?Monn=E9?=
 <roger.pau@citrix.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "Juergen Gross" <jgross@suse.com>, Wei Liu <wei.liu@kernel.org>, Paul Durrant
 <paul@xen.org>
Subject: [Xen-devel] Stopping much Linux testing in Xen Project CI
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGludXggc3RhYmxlIGJyYW5jaGVzLCBhbmQgTGludXggdXBzdHJlYW0gdGlwLCBhcmUgYmFkbHkg
YnJva2VuIGFuZApoYXZlIGJlZW4gZm9yIG1vbnRocy4gIEFwcGFyZW50bHkgbm8tb25lIGlzIGFi
bGUgdG8gKG9yIGhhcyB0aW1lIHRvKQp0byBpbnZlc3RpZ2F0ZSBhbmQgZml4LgoKICBsaW51eC00
LjQgICAgICAgICAgMjE4IGRheXMgICAgICAgICB0byBiZSBzdXNwZW5kZWQKICBsaW51eC00Ljkg
ICAgICAgICAgMTM0IGRheXMgICAgICAgICB0byBiZSBzdXNwZW5kZWQKICBsaW51eC00LjE0ICAg
ICAgICAgMTM0IGRheXMgICAgICAgICB0byBiZSBzdXNwZW5kZWQKICBsaW51eC00LjE5ICAgICAg
ICAgMTM0IGRheXMgICAgICAgICB0byBiZSBzdXNwZW5kZWQKICBsaW51eC01LjQgICAgICAgICAg
IDU1IGRheXMKICBsaW51eC1hcm0teGVuICAgICB1cCB0byBkYXRlCiAgbGludXgtbGludXMgICAg
ICAgIDM3MiBkYXlzICAgICAgICAgdG8gYmUgc3VzcGVuZGVkCgpUaGVzZSBhcmUgdGltZXMgc2lu
Y2UgdGhlIGxhc3QgcHVzaCAtIGllLCBob3cgbG9uZyBpdCBoYXMgYmVlbiBicm9rZW4uCkV2aWRl
bnRseSBuby1vbmUgaXMgcGF5aW5nIGFueSBhdHRlbnRpb24gdG8gdGhpcy5bMV0gIEkgbG9va2Vk
IGF0IHRoZQpyZXBvcnRzIG15c2VsZiBhbmQ6CgpOZXN0ZWQgSFZNIGlzIGJyb2tlbiBvbiBJbnRl
bCBpbiBhbGwgb2YgdGhlIDQueCBicmFuY2hlcy4KQWRkaXRpb25hbGx5OgoKTGludXggNC40IGhh
cyBzb21lIGludGVybWl0dGVudCBndWVzdCBzdGFydCBmYWlsdXJlIGZvciAzMi1iaXQgUFYuCgpM
aW51eCA0LjE0IGRvZXMgbm90IGJvb3Qgb24gMzItYml0IEFSTS4gIFRoZXJlIGFyZSBhbHNvIHNv
bWUgNjQtYml0Cng4NiBtaWdyYXRpb24gZmFpbHVyZXMuCgpUaGUgbW9zdCByZWNlbnQgcmVwb3J0
cyAobGFzdCB3ZWVrIG9yIHR3bykgYXJlIGFmZmxpY3RlZCBieSB1bmRlcmx5aW5nCkNJIHByb2Js
ZW1zIC0gd2hhdCBsb29rIGxpa2Ugc3RpY2t5IFBEVSByZWxheXMsIG9yIHdoYXQgbWF5IGJlCnBy
b2JsZW1zIGluIHRoZSBEZWJpYW4gbWlycm9yIG5ldHdvcmsgKEkgaGF2ZSBkZWZpbml0ZWx5IHNl
ZW4gcHJvYmxlbXMKdGhlcmUpLCBzbyB0aGUgcmVwb3J0cyBhcmUgcmF0aGVyIG5vaXN5LiAgU29y
cnkgYWJvdXQgdGhhdC4gIEkgYW0KdHJ5aW5nIHRvIGltcHJvdmUgdGhpcyBzaXR1YXRpb24gYnV0
IGl0IGlzIHF1aXRlIGRpZmZpY3VsdCBbMl0uICBCdXQKb3ZlcmFsbCBpdCBpcyBjbGVhciB0aGF0
IHRoZSB1bmRlcmx5aW5nIGNvZGUgaXMgYnJva2VuLgoKVGhlIHJlcGVhdGVkIGFsbW9zdC1jZXJ0
YWlubHktZG9vbWVkIHJldGVzdGVzIGFyZSB1c2luZyB0b28gbXVjaCBvZgpvc3N0ZXN0J3MgY2Fw
YWNpdHkuICBJIGFtIGdvaW5nIHRvIHN0b3AgdGVzdGluZyBhbGwgb2YgdGhlc2UgNC54CmJyYW5j
aGVzLCBhbmQgb2YgbGludXgtbGludXMsIHVudGlsIHNvbWVvbmUgdGVsbHMgbWUgdGhleSB0aGlu
ayB0aGUKZml4KGVzKSBhcmUgaW4gdGhlIHJlbGV2YW50IGJyYW5jaChlcykuCgpUaGlzIG1lYW5z
IHRoYXQgd2Ugd2lsbCAqbm8gbG9uZ2VyIGhhdmUgYW55IHZpc2liaWxpdHkgb2YgYnJlYWthZ2Ug
aW4KbXVjaCBvZiB1cHN0cmVhbSBMaW51eCouICBJIHRoaW5rIHRoaXMgaXMgImZpbmUiIGJlY2F1
c2UgcmlnaHQgbm93Cm5vLW9uZSBhcHBlYXJzIHRvIGJlIGRvaW5nIGFueXRoaW5nIHdpdGggdGhl
IGluZm9ybWF0aW9uLgoKSSBkaWRuJ3QgbG9vayBhdCBtYXN0ZXIgb3IgYXQgNS40LgoKVGhhbmtz
IGZvciB5b3VyIGF0dGVudGlvbi4KCklhbi4KClsxXSBvc3N0ZXN0IGRvZXMgbm90IGhhdmUgYSB0
cmlhZ2UgdGVhbSBtb25pdG9yaW5nIHRoZSByZXBvcnRzLiAgVGhlcmUKaXMganVzdCBhYm91dCBo
YWxmIG9mIG1lIHRvIHJ1biB0aGUgd2hvbGUgc3lzdGVtLiAgV2UgYXJlIHJlbHlpbmcgb24KbWFp
bnRhaW5lcnMgb2YgWGVuLXJlbGF0ZWQgY29kZSBub3RpY2luZyB3aGVuIHRoaW5ncyBicmVhayBh
bmQKcHJvYWN0aXZlbHkgdHJ5aW5nIHRvIGludmVzdGlnYXRlIGFuZCBmaXggdGhlbS4KClsyXSBB
bW9uZ3N0IG90aGVyIHRoaW5ncywgc29tZW9uZSBoYXMgbWFuYWdlZCB0byBwYXRlbnQsIGluIHRo
ZSBVU0EsCnRoZSBvYnZpb3VzWzNdIHNvbHV0aW9uIHRvIFBEVSByZWxheXMgc3RpY2tpbmcuICBQ
RFVzIHdoaWNoIGRvIHplcm8KY3Jvc3Npbmcgc3dpdGNoaW5nIGFyZSBhdmFpbGFibGUgaW4gRXVy
b3BlIGJ1dCBhcmUgaGVucycgdGVldGggaW4gdGhlClVTLiAgVGhlIHBhdGVudGhvbGRlciBkb2Vz
bid0IGFjdHVhbGx5IG1ha2UgYW5kIHNlbGwgdGhlIHRoaW5ncyBvZgpjb3Vyc2Ugc28gd2UgY2Fu
J3QgZXZlbiBzb2x2ZSB0aGUgcHJvYmxlbSBieSBwYXlpbmcgdGhlbSBhIGJhZC1sYXcKdGF4LgoK
WzNdIE9idmlvdXMgYW55b25lIHdpdGggYSByZWFzYW9uYmxlIGVsZWN0cmljYWwgZW5naW5lZXJp
bmcgYmFja2dyb3VuZApsaWtlLCBmb3IgZXhhbXBsZSwgbWUuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
