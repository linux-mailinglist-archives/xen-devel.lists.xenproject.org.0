Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CF2D441B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:26:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIwlT-0004qr-Kj; Fri, 11 Oct 2019 15:23:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIwlR-0004pq-9s
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:23:33 +0000
X-Inumbo-ID: 159f6b04-ec3b-11e9-bbab-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 159f6b04-ec3b-11e9-bbab-bc764e2007e4;
 Fri, 11 Oct 2019 15:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570807413;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=fjyde5Vt2M8qvdq0EFjDcBhch0RqWIvNJWf6YCIgbXc=;
 b=Nn10aQbBzSEU3X1+zHSYMgU3ckIWQStriS+ZEGpv2yImSbH5Z6XvE5Bs
 wYzYougNdj42KSk6FG7652jVtqIcYSjynhGJq8GnDmA4x1LGADuZFjsvW
 5K01ktLb2ZcxCsMTA1sgjs93KbqqvJ10zEyElpArXmya/CdgKd76CnO2p o=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: np0CzwPgoQ00NEMCjW5RJgzUM+yKQZ4+xYJlFI4m23zZzRgnuN/lWAc92CYYb6yNTX8RCUjVNl
 C8A8zF+ksxF60bdgRfFvNXv/6zO5cZEZ5E1ia3vdWU4I6fj2jdIFWVJvXd5hCXmDj7dDIIESIy
 JP+RKp3e3nNaMBMs+j9P0lrOAh0uKfpijDKMYiu1m/OfNEms56MtKnu9bglDt0j0gUPcIpUREw
 02XFjQoivcg6Ia5eVV4PA+qkSLsnZ26cGxKEzX1wUTF58AMmZ28gsfk5SNktMoSSW30P/luwCa
 O6g=
X-SBRS: 2.7
X-MesageID: 6774849
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6774849"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.40555.917945.129929@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 16:23:23 +0100
To: Oleksandr Grytsov <al1img@gmail.com>, "wl@xen.org" <wl@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191010141231.25363-1-al1img@gmail.com>
References: <20191010141231.25363-1-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH v1] libxl: Add DTB compatible list to
 config file
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
 Iurii Konovalenko <iurii.konovalenko@globallogic.com>,
 Oleksandr Grytsov <oleksandr_grytsov@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxXSBsaWJ4bDogQWRkIERUQiBjb21w
YXRpYmxlIGxpc3QgdG8gY29uZmlnIGZpbGUiKToKPiBGcm9tOiBPbGVrc2FuZHIgR3J5dHNvdiA8
b2xla3NhbmRyX2dyeXRzb3ZAZXBhbS5jb20+Cj4gCj4gU29tZSBwbGF0Zm9ybXMgbmVlZCBtb3Jl
IGNvbXBhdGlibGUgcHJvcGVydHkgdmFsdWVzIGluIGRldmljZQo+IHRyZWUgcm9vdCBub2RlIGlu
IGFkZGl0aW9uIHRvICJ4ZW4seGVudm0tJWQuJWQiIGFuZCAieGVuLHhlbnZtIgo+IHZhbHVlcyB0
aGF0IGFyZSBnaXZlbiBieSBYZW4gYnkgZGVmYXVsdC4KPiBTcGVjaWZ5IGluIGRvbWFpbiBjb25m
aWd1cmF0aW9uIGZpbGUgd2hpY2ggdmFsdWVzIHNob3VsZCBiZSBhZGRlZAo+IGJ5IHByb3ZpZGlu
ZyAiZHRiX2NvbXBhdGlibGUiIGxpc3Qgb2Ygc3RyaW5ncyBzZXBhcmF0ZWQgYnkgY29tYXMuCgpI
aSwgdGhhbmtzLgoKSSBkb24ndCBoYXZlIGFuIG9waW5pb24gYWJvdXQgdGhlIHByaW5jaXBsZSBv
ZiB0aGlzIGFuZCB3b3VsZCBsaWtlIHRvCmhlYXIgZnJvbSBBUk0gZm9sa3MgYWJvdXQgdGhhdC4K
CkFsc28sIFN0ZWZhbm8sIEp1bGllbjogc2hvdWxkIHdlIGJlIGFza2luZyBmb3IgYSBmcmVlemUg
ZXhjZXB0aW9uIGZvcgp0aGlzIGZvciA0LjEzID8KCgpBcyBmb3IgdGhlIGRldGFpbCBvZiB0aGUg
Y29kZToKClRoZSBtZXRob2QgeW91IHVzZSBmb3IgYnVpbGRpbmcgY29tcGF0c1tdIGlzIHJlYWxs
eSByYXRoZXIgYWQtaG9jLgpXaHkgbm90IHVzZSBhIGZsZXhhcnJheSA/CgooQWxzbyB5b3UgZG8g
bm90IG5lZWQgdG8gY2hlY2sgdGhlIGVycm9yIHJldHVybiBmcm9tIGxpYnhsX196YWxsb2MuCkZy
b20gbGlieGwuaDoKICogTWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZXMgYXJlIG5vdCBoYW5kbGVk
IGdyYWNlZnVsbHkuICBJZiBtYWxsb2MKICogKG9yIHJlYWxsb2MpIGZhaWxzLCBsaWJ4bCB3aWxs
IGNhdXNlIHRoZSBlbnRpcmUgcHJvY2VzcyB0byBwcmludAogKiBhIG1lc3NhZ2UgdG8gc3RkZXJy
IGFuZCBleGl0IHdpdGggc3RhdHVzIDI1NS4KQnV0IHJlYWxseSAoaSkgeW91IHNob3VsZCBiZSB1
c2luZyBHQ05FV19BUlJBWSBhbnl3YXkgYW5kIChpaSkgdGhpcwppcyBhbGwgaXJyZWxldmFudCBp
ZiB5b3Ugc3dpdGNoIHRvIGEgZmxleGFycmF5IGluc3RlYWQuKQoKVGhhbmtzLApJYW4uCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
