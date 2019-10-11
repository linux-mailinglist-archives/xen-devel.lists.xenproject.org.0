Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E3D4403
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2019 17:18:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIwcp-0003rD-JJ; Fri, 11 Oct 2019 15:14:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fsnF=YE=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIwcn-0003r6-HK
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2019 15:14:37 +0000
X-Inumbo-ID: d5951d2a-ec39-11e9-8aca-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5951d2a-ec39-11e9-8aca-bc764e2007e4;
 Fri, 11 Oct 2019 15:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570806876;
 h=from:mime-version:content-transfer-encoding:message-id:
 date:to:cc:subject:in-reply-to:references;
 bh=lbpyeQZLc9a99y2n2gd0NSuwK2FeK4DO8FEmZkXwNyM=;
 b=TnXZ0r2PWE5JTD6dOawJgPYcBMyrtl/kJ9cIiOvgvhRpNc9aZf8/hJLA
 DXD4YgU6zl/v3fmotJXCLN+W7zUSxFU853lk8kgx6W0hihZqTb+q2ZhHO
 ey5MTzSwjZbk2YWwt7zHLOIdCr8RBe+gtRPU9DUmCMuOYIKgAqxMf3Ufm 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: eYqF8QU+HuLnHFmFJ+MIzVT2M7dhvlIU0BFhROnIWK2zpbjyeinx88aeBVZ+QO2jvTPOAMi5MN
 ZlmtAQ/2nypK6tIQY2G5HnzUCf9J07ZhZ0Vnbk+xLZLZ75TCl/Rlf0PYJ//xxoMJ+8tqo42mMW
 vVF/ZRGSkL4Cu0211I8P/Wq88hYeePF5vZmJaITjpxfaUQMYIiVLS1EQ3mjTkyx5m2MwcTpqI1
 Wbi60lRIzkGSojQHPhNaFv2qO8nCaSQJARtxv7uGj/JYDzGLnkgH7sg/Kvij7rtZlKe2xEOln1
 f0c=
X-SBRS: 2.7
X-MesageID: 6849785
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,284,1566878400"; 
   d="scan'208";a="6849785"
From: Ian Jackson <ian.jackson@citrix.com>
MIME-Version: 1.0
Message-ID: <23968.40023.163583.784817@mariner.uk.xensource.com>
Date: Fri, 11 Oct 2019 16:14:31 +0100
To: Oleksandr Grytsov <al1img@gmail.com>, Matthew Fioravante
 <matthew.fioravante@jhuapl.edu>, Arianna Avanzini
 <avanzini.arianna@gmail.com>, Julien Grall <julien.grall@arm.com>
In-Reply-To: <20191010135004.24226-1-al1img@gmail.com>
References: <20191010135004.24226-1-al1img@gmail.com>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)
Subject: Re: [Xen-devel] [XEN PATCH for-4.13 v1] Reset iomem's gfn to
 LIBXL_INVALID_GFN on reboot
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
 Oleksandr
 Andrushchenko <oleksandr_andrushchenko@epam.com>, "wl@xen.org" <wl@xen.org>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T2xla3NhbmRyIEdyeXRzb3Ygd3JpdGVzICgiW1BBVENIIHYxXSBSZXNldCBpb21lbSdzIGdmbiB0
byBMSUJYTF9JTlZBTElEX0dGTiBvbiByZWJvb3QiKToKPiBEdXJpbmcgZG9tYWluIHJlYm9vdCBp
dHMgY29uZmlndXJhdGlvbiBpcyBwYXJ0aWFsbHkgcmV1c2VkCj4gdG8gcmUtY3JlYXRlIGEgbmV3
IGRvbWFpbiwgYnV0IGlvbWVtJ3MgR0ZOIGZpZWxkIGZvciB0aGUKPiBpb21lbSBpcyBvbmx5IHJl
c3RvcmVkIGZvciB0aG9zZSBtZW1vcnkgcmFuZ2VzLCB3aGljaCBhcmUKPiBjb25maWd1cmVkIGlu
IGZvcm0gb2YgW0lPTUVNX1NUQVJULE5VTV9QQUdFU1tAR0ZOXSwgYnV0IG5vdCBmb3IKPiB0aG9z
ZSBpbiBmb3JtIG9mIFtJT01FTV9TVEFSVCxOVU1fUEFHRVNdLCBlLmcuIHdpdGhvdXQgR0ZOLgo+
IEZvciB0aGUgbGF0dGVyIEdGTiBpcyByZXNldCB0byAwLCBidXQgd2hpbGUgbWFwcGluZyByYW5n
ZXMKPiB0byBhIGRvbWFpbiBkdXJpbmcgcmVib290IHRoZXJlIGlzIGEgY2hlY2sgdGhhdCBHRk4g
dHJlYXRlZAo+IGFzIHZhbGlkIGlmIGl0IGlzIG5vdCBlcXVhbCB0byBMSUJYTF9JTlZBTElEX0dG
TiwgdGh1cyBtYWtpbmcKPiBYZW4gdG8gbWFwIElPTUVNX1NUQVJUIHRvIGFkZHJlc3MgMCBpbiB0
aGUgZ3Vlc3QncyBhZGRyZXNzIHNwYWNlLgo+IAo+IFdvcmthcm91bmQgaXQgYnkgcmVzc2V0aW5n
IEdGTiB0byBMSUJYTF9JTlZBTElEX0dGTiwgc28geGwKPiBjYW4gc2V0IHByb3BlciB2YWx1ZXMg
Zm9yIG1hcHBpbmcgb24gcmVib290LgoKVGhhbmtzIGZvciB0aGlzIHBhdGNoLgoKSSBjb25mZXNz
IHRoYXQgSSBhbSBub3Qgc3VyZSB3aGF0IGlzIGdvaW5nIG9uIGhlcmUuICBXaGVyZSBpcyB0aGlz
CnRyb3VibGVzb21lIDAgY29taW5nIGZyb20gPyAgSSBzZWUgdGhhdCB0aGUgZGVmYXVsdCB2YWx1
ZSBmb3IgZ2ZuIGluCnRoZSBzdHJ1Y3QgaXMgMCBhbmQgbG9va2luZyBmb3IgYXNzaWdubWVudHMg
YmVmb3JlIHRoaXMgcGF0Y2gsIGdmbiBpcwpkZWZhdWx0ZWQgZnJvbSBiX2luZm8tPmlvbWVtW2ld
LnN0YXJ0LCB3aGljaCBpcyBwcmVzdW1hYmx5IG5vbi0wLgoKSSBzdXNwZWN0IHRoYXQgeW91ciBw
YXRjaCBtYXkgYmUgZml4aW5nIHRoaXMgdGhlIHdyb25nIHdheS4gIEkgaGF2ZQphZGRyZXNzZWQg
dGhpcyBtYWlsIHRvIHZhcmlvdXMgcGVvcGxlIHdobyBoYXZlIHRvdWNoZWQgdGhpcyBhcmVhIG9m
CmNvZGUgYW5kIGhvcGUgdGhleSB3aWxsIGJlIGFibGUgdG8gY2xhcmlmeS4KCkJUVywgcGxlYXNl
IGRvIHBpbmcgdGhpcyAoYW5kIHlvdXIgb3RoZXIgcGF0Y2hlcykgYnkgZW1haWwsIGlmIHRoZQpj
b252ZXJzYXRpb24gc2VlbXMgdG8gc3RhbGwuCgpUaGFua3MsCklhbi4KCj4gU2lnbmVkLW9mZi1i
eTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0u
Y29tPgo+IC0tLQo+ICB0b29scy9saWJ4bC9saWJ4bF9kb21haW4uYyB8IDkgKysrKysrKysrCj4g
IDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvdG9vbHMv
bGlieGwvbGlieGxfZG9tYWluLmMgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwo+IGluZGV4
IDlkMGViNWFlZDEuLjBhZTE2YTViMTIgMTAwNjQ0Cj4gLS0tIGEvdG9vbHMvbGlieGwvbGlieGxf
ZG9tYWluLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bF9kb21haW4uYwo+IEBAIC0yMTIwLDYg
KzIxMjAsMTUgQEAgc3RhdGljIHZvaWQgcmV0cmlldmVfZG9tYWluX2NvbmZpZ3VyYXRpb25fZW5k
KGxpYnhsX19lZ2MgKmVnYywKPiAgICAgICAgICB9Cj4gICAgICB9Cj4gIAo+ICsgICAgLyogcmVz
ZXQgSU9NRU0ncyBHRk4gdG8gaW5pdGlhbCB2YWx1ZSAqLwo+ICsgICAgewo+ICsgICAgICAgIGlu
dCBpOwo+ICsKPiArICAgICAgICBmb3IgKGkgPSAwOyBpIDwgZF9jb25maWctPmJfaW5mby5udW1f
aW9tZW07IGkrKykKPiArICAgICAgICAgICAgaWYgKGRfY29uZmlnLT5iX2luZm8uaW9tZW1baV0u
Z2ZuID09IDApCj4gKyAgICAgICAgICAgICAgICBkX2NvbmZpZy0+Yl9pbmZvLmlvbWVtW2ldLmdm
biA9IExJQlhMX0lOVkFMSURfR0ZOOwo+ICsgICAgfQo+ICsKPiAgICAgIC8qIERldmljZXM6IGRp
c2ssIG5pYywgdnRwbSwgcGNpZGV2IGV0Yy4gKi8KPiAgCj4gICAgICAvKiBUaGUgTUVSR0UgbWFj
cm8gaW1wbGVtZW50cyBmb2xsb3dpbmcgbG9naWM6Cj4gLS0gCj4gMi4xNy4xCj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
