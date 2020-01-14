Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAE13B003
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 17:51:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irPMq-0005gz-QR; Tue, 14 Jan 2020 16:48:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqHR=3D=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1irPMo-0005gu-Sa
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 16:48:34 +0000
X-Inumbo-ID: b22e5b4a-36ed-11ea-8401-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b22e5b4a-36ed-11ea-8401-12813bfff9fa;
 Tue, 14 Jan 2020 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1579020512;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=HvIAOMcJ1529TBz146NGvpLbx7a624IrAeECT3i2eII=;
 b=dC7FsUT4CFUKhkAToV/Y4QNgMoq6387z7I/v6ISTiD9npa2937QRArwp
 Pq3BGWUrk/9y8TRxuQI2+joVzUhkVEdgdkKgLzYFD179EEdwS9rb62aq+
 /67xkXczaBXsGXDTTJ3DETlaOAdVyQbJ9GQ44rwHiP6W1AUqUhZ3D48Vj I=;
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
IronPort-SDR: j06LJzbD0qngWktmfxgTwqAJZRtxf0fS9lHAabpypPuGDXq+JnDtbSOXwphmKITQYaQI86XjlX
 kwm3GBOBbXVZEsTyF3H1weO/7z51AiPZwvImgYNIg2xJI6w9kOmAvtoyJEnQGUsv+DRG39NfWF
 hO+tppZW4C8nm/Duh7cSvOb6Q2mEXdoL0sVosQ61ZNmC1y7+6vygBvfUUS/X9boQiSrXuFdJif
 jzXg8bn2C0EHLWGt+L8amuMa6wGkL5UAwP4urghI/DDynaHWeabO5wqabKfXrPanx2uskk2Kxr
 dys=
X-SBRS: 2.7
X-MesageID: 10913640
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,433,1574139600"; d="scan'208";a="10913640"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <24093.61657.676890.721999@mariner.uk.xensource.com>
Date: Tue, 14 Jan 2020 16:48:25 +0000
To: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20191224151932.6304-2-andrew.cooper3@citrix.com>
References: <20191224151932.6304-1-andrew.cooper3@citrix.com>
 <20191224151932.6304-2-andrew.cooper3@citrix.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [PATCH 01/12] libxc/save: Shrink code volume where
 possible
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QW5kcmV3IENvb3BlciB3cml0ZXMgKCJbUEFUQ0ggMDEvMTJdIGxpYnhjL3NhdmU6IFNocmluayBj
b2RlIHZvbHVtZSB3aGVyZSBwb3NzaWJsZSIpOgo+IEEgcHJvcGVydHkgb2YgaG93IHRoZSBlcnJv
ciBoYW5kbGluZyAoMCBvbiBzdWNjZXNzLCBub256ZXJvIG90aGVyd2lzZSkKPiBhbGxvd3MgdGhl
c2UgY2FsbHMgdG8gYmUgY2hhaW5lZCB0b2dldGhlciB3aXRoIHRoZSB0ZXJuYXJ5IG9wZXJhdGlv
ci4KCkknbSBxdWl0ZSBzdXJwcmlzZWQgdG8gZmluZCBhIHN1Z2dlc3Rpb24gbGlrZSB0aGlzIGNv
bWluZyBmcm9tIHlvdSBpbgpwYXJ0aWN1bGFyLiAgSSB0aGluayBpZiB3ZSBhcmUgZ29pbmcgdG8g
YWRvcHQgdGhpcyB0aGluZyBpbiBnZW5lcmFsLAppdCBvdWdodCB0byBiZSBpbiBhIENPRElOR19T
VFlMRSBzb21ld2hlcmUuCgpJJ20gZGlzdGluY3RseSB1bnN1cmUgYWJvdXQgdGhlIG1lcml0cyBv
ZiB0aGUgcGF0dGVybi4gIEl0IGRvZXMgbWFrZQp0aGUgY29kZSBtdWNoIHNob3J0ZXIgYW5kIGxl
c3MgcmVwZXRpdGl2ZS4gIE9UT0ggPzogaXMgYQpub3QtdmVyeS1mcmVxdWVudGx5IHVzZWQgR05V
IGV4dGVuc2lvbiBhbmQgbXkgcmVwcmVzZW50YXRpdmUgc2FtcGxlIG9mCnByb2dyYW1tZXJzIGhh
ZCB0byB0aGluayBhYm91dCB3aGF0IHRoaXMgaWRpb20gbWVhbnQgYW5kIGl0IHdhc24ndAp1bml2
ZXJzYWxseSBsaWtlZC4gIE9uIHRoZSB0aGlyZCBoYW5kLCBpZiB0aGlzIGlkaW9tIGJlY29tZXMg
ZG9taW5hbnQKeW91IG9ubHkgaGF2ZSB0byB0aGluayBhYm91dCBpdCBvbmNlLgoKTWF5YmUgaXQg
d291bGQgYmUgYmV0dGVyIHRvIGhhdmUKICAgICNkZWZpbmUgTVVTVChjYWxsKSAoeyByYyA9IChj
YWxsKTsgaWYgKHJjKSBnb3RvIGVycm9yOyB9KQphbmQgd3JpdGUKICAgIE1VU1QoIHdyaXRlX29u
ZV92Y3B1X2Jhc2ljKGN0eCwgaSkgKTsKCk9yIGp1c3QgdG8gcGVybWl0CiAgIHJjID0gd3JpdGVf
b25lX3ZjcHVfYmFzaWMoY3R4LCBpKTsgICAgaWYgKHJjKSBnb3RvIGVycm9yOwooaWUgb24gYSBz
aW5nbGUgbGluZSkuCgpJYW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
