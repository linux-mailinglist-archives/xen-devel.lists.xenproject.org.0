Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B64D0CAC
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 12:20:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI920-0000Z1-Ih; Wed, 09 Oct 2019 10:17:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x347=YC=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iI91y-0000Yu-UC
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 10:17:18 +0000
X-Inumbo-ID: f8d23bdc-ea7d-11e9-8c93-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8d23bdc-ea7d-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 10:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570616238;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=TVqw3444V9c4iXzLAyEPLXIlaCX01YmCDXm0jIQ49MY=;
 b=MUNKoCcG701hUNjLR2w423a11wIuhUJhwBUYz4rU5NnIsI3Kg5gCQx2r
 98zlhiXbG3X5u+anJn5NUf3eHVBKi6v//H4IrGGhrh3H9iolBU4xJg+BB
 LrJ4OVUe5G0d04OTVg3i+dRkrZgsH12pboso46oUV1bqxeP6G9hWDvYt1 g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: aoA3edHXkJjIRYp2ccRe+mDJuTZoP12crbkJf2Eewsqf7vZk/pGVpoeiS1zRKbJjZMVThNfMIq
 Wf9it03asiWllf1p2Y8cYibemNQyQYcrWWsHEQ8ldgDjwltW86AQGe1YNcjVBMq3Y0tqAHdTh8
 U37GUOwut9GljGrsPj1X7HfYUM2VhJrag6dwKJvmLd+CrsHrxQOiotlLH8jExIb1yEXJFbcMEz
 +ViR/FmUQFjIuE7t5aD6PIinTYfvoPnr2MvOLUmbCyMBZrLrNu6LnprIvF7iQxlstk2Ud+ZH3t
 pKA=
X-SBRS: 2.7
X-MesageID: 6958155
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,273,1566878400"; 
   d="scan'208";a="6958155"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23965.45995.59606.336704@mariner.uk.xensource.com>
Date: Wed, 9 Oct 2019 11:17:15 +0100
To: Lars Kurth <lars.kurth.xen@gmail.com>
In-Reply-To: <BD5E7846-857B-43B7-83F2-DD1AD8797217@xenproject.org>
References: <alpine.LFD.2.21.1908150030150.2807@austen3.home>
 <alpine.LFD.2.21.1908150055060.2807@austen3.home>
 <18fb961102e8da16d1ad9576742bccf2@crc.id.au>
 <alpine.LFD.2.21.1908151959060.2715@austen3.home>
 <114550b6cd3e7936e055a63ebbb2c7a6@crc.id.au>
 <0b7f33b8fd6fbbae86451b5bbdb1f6ac@crc.id.au>	<1566956155.3344.0@crc.id.au>
 <23929.6485.711561.46507@mariner.uk.xensource.com>
 <alpine.LFD.2.21.1910062127110.2837@austen3.home>
 <23963.3341.764085.220401@mariner.uk.xensource.com>
 <BD5E7846-857B-43B7-83F2-DD1AD8797217@xenproject.org>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH] read grubenv and set default from
 saved_entry or next_entry [and 1 more messages]
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Steven Haigh <netwiz@crc.id.au>,
 xen-devel <xen-devel@lists.xenproject.org>, "YOUNG,
 MICHAEL A." <m.a.young@durham.ac.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGFycyBLdXJ0aCB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSByZWFkIGdydWJlbnYg
YW5kIHNldCBkZWZhdWx0IGZyb20gc2F2ZWRfZW50cnkgb3IgbmV4dF9lbnRyeSBbYW5kIDEgbW9y
ZSBtZXNzYWdlc10iKToKPiBJIGFtIGFzc3VtaW5nIHRoZXJlIGlzIG5vIGNoYW5jZSB0aGF0IHRo
aXMgd2lsbCBtYWtlIDQuMTMgd2l0aCB0aGUgZnJlZXplIGhhdmluZyBwYXNzZWQuCgpBc3N1bWlu
ZyB3ZSBjYW4gZ2V0IGdvb2QgcXVhbGl0eSBwYXRjaGVzLCBJIHdvdWxkIHByb2JhYmx5IHN1cHBv
cnQgYQpmcmVlemUgZXhjZXB0aW9uLiAgRmFpbGluZyB0aGF0LCB0aGlzIHdvdWxkIGJlIGEgc3Ry
b25nIGNhbmRpZGF0ZSBmb3IKYSBiYWNrcG9ydC4KCj4gQnV0IGluIGFueSBjYXNlLCBJIHdhc24n
dCBzdXJlIHdoZXRoZXIgTWljaGFlbCBzdHJpY3RseSB3aWxsIG5lZWQgaXQKPiBhcyB0aGUgY2hh
bmdlIGNhbiBwcmVzdW1hYmx5IGJlIGNhcnJpZWQgaW4gYSBmZWRvcmEgcGF0Y2ggcSBmb3IgWGVu
Cj4gcGFja2FnZXMgdW50aWwgaXQgZW5kcyB1cCB1cHN0cmVhbQoKVGhhdCdzIG5vdCByZWFsbHkg
ZW5vdWdoLCBiZWNhdXNlIHB5Z3J1YiBydW5zIGluIHRoZSBob3N0IGJ1dAppbnRlcnByZXRzIHRo
ZSBndWVzdCBmaWxlc3lzdGVtLiAgU2luY2Ugd2Ugd2FudCB0byBiZSBhYmxlIHRvIGJvb3QKRmVk
b3JhIGd1ZXN0cyBvbiBub24tRmVkb3JhIGhvc3RzLCB0aGF0IG1lYW5zIHRoYXQgZXZlcnkgaG9z
dCBtdXN0CmhhdmUgdGhpcyBmaXguCgpUaGlzIGlzIGFuIGluaGVyZW50IGNvbnNlcXVlbmNlIG9m
IHB5Z3J1YidzIGRlc2lnbiBhcHByb2FjaCwgYW5kIG1lYW5zCnRoYXQgSSBhZ2dyZXNzaXZlbHkg
YmFja3BvcnQgcHlncnViIGNoYW5nZXMgdG8gb2xkZXIgcmVsZWFzZXMsIHNvIHRoYXQKb2xkZXIg
aG9zdHMgY2FuIGJvb3QgbmV3ZXIgZ3Vlc3RzLgoKQnV0IGluIHRoZSBtZWFudGltZSBwdXR0aW5n
IHRoaXMgcGF0Y2ggaW4gdGhlIEZlZG9yYSBob3N0IHBhY2thZ2VzIGlzCm5vdCBhIHRlcnJpYmxl
IGlkZWEuICAoVGhlcmUgaXMgYSBiaXQgb2YgYSByaXNrIHRoYXQgaWYgd2UgZGVwbG95IGluCkZl
ZG9yYSBvbmUgYWxnb3JpdGgsIGFuZCB0aGVuIHVwc3RyZWFtIGEgZGlmZmVyZW50IGFsZ29yaXRo
bSwgd2UgbWF5CmVuZCB1cCBzdHVjayB3aXRoIGRpdmVyZ2VuY2UsIGJ1dCBJIGRvdWJ0IHRoaXMg
d2lsbCBiZSBhIGJpZyBwcm9ibGVtCmhlcmUuKQoKdGhhbmtzLApJYW4uCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
