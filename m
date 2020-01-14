Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB3C13A3C2
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2020 10:27:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irIQ3-0005oY-Bl; Tue, 14 Jan 2020 09:23:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Af5M=3D=citrix.com=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1irIQ2-0005oT-3b
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2020 09:23:26 +0000
X-Inumbo-ID: 824a2303-36af-11ea-8353-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 824a2303-36af-11ea-8353-12813bfff9fa;
 Tue, 14 Jan 2020 09:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578993804;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=Rnifo7k/iz8uHGYoy+HI4syzwplOI1OIZmnUq+Jwbro=;
 b=eeBbIdIui71naiqTpieNDVNH3x63i2efzv6q0/3+T4+Iy7A4ngoVbhE1
 YvoS+5rGWT8+zHwvZ1qOsBoiinJd7Wl09JqFZw6fCBfAniTFiwPvyH0Ba
 kLfpiOlDFoNEVxk58Uhpz+K78HsMWSgwAmjOHavTUCEvkWlGxngONPuNx Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ross.lagerwall@citrix.com;
 spf=Pass smtp.mailfrom=ross.lagerwall@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ross.lagerwall@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 ross.lagerwall@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="ross.lagerwall@citrix.com";
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
 envelope-from="ross.lagerwall@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 2FVys1ELMU9Ul6cVTXs+in799LfpthKHV5bHNuWTRXrgH+hvuH+XYWdhLAWokJDpGNWWtfXHCV
 fseUG28XN8I1i3sfHuF9S0rVXvyvlHT9mao2v30uCVZKizbXNES9bfWQp68dkv5bY5inEhjlFa
 lfF0rmvsF8xHKvm7pI+I8Sh2XKaJR3bsUfXn76KxFcTDK+9QwKRhaBDWXtvrv9pPvc7cq0VHkU
 sCm1J3L7SAWYgDT4o1TnXjDl9+8VRDZ4fRwoLAmv1cbOzdvRwSLYoSUijqeIWwNtS53Y8AFNqa
 hXs=
X-SBRS: 2.7
X-MesageID: 11307878
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,432,1571716800"; d="scan'208";a="11307878"
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
References: <20200113221227.20857-1-julien@xen.org>
From: Ross Lagerwall <ross.lagerwall@citrix.com>
Message-ID: <6ed2e36d-d4a7-4d44-734f-fc1fe4232913@citrix.com>
Date: Tue, 14 Jan 2020 09:23:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200113221227.20857-1-julien@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] docs/misc: livepatch: Espace backslash
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
Cc: Pawel Wieczorkiewicz <wipawel@amazon.de>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMS8xMy8yMCAxMDoxMiBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IHBhbmRvYyBpcyBjdXJy
ZW50bHkgZmFpbGluZyB0byBnZW5lcmF0ZSB0aGUgcGRmIHdpdGggdGhlIGZvbGxvd2luZwo+IGVy
cm9yOgo+ICEgVW5kZWZpbmVkIGNvbnRyb2wgc2VxdWVuY2UuCj4gbC4xMDQ4ICAgbWV0YWRhdGEg
c3RyaW5nIGZvcm1hdCBpczoga2V5PXZhbHVlXDAKPiAKPiBJbiB0aGlzIGNhc2UsIHdlIHdhbnQg
dG8gcHJpbnQgXDAgc28gd2UgbmVlZCB0byBiYWNrc2xhc2gtZXNjYXBlIHRoZQo+IGZpcnN0IGNo
YXJhY3Rlci4KPiAKPiBJbnRlcmVzdGluZ2x5IHBhbmRvYyB3aWxsIG5vdCBjb21wbGFpbiB3aGVu
IGNyZWF0aW5nIGh0bWwgYW5kIHdpbGwganVzdAo+IGlnbm9yZSBcMCBjb21wbGV0ZWx5Lgo+IAo+
IEZpeGVzOiA1MDgzZTBmZjkzICgibGl2ZXBhdGNoOiBBZGQgbWV0YWRhdGEgcnVudGltZSByZXRy
aWV2YWwgbWVjaGFuaXNtIikKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPgo+IENjOiBQYXdlbCBXaWVjem9ya2lld2ljeiA8d2lwYXdlbEBhbWF6b24uZGU+Cj4g
LS0tCj4gIGRvY3MvbWlzYy9saXZlcGF0Y2gucGFuZG9jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZG9jcy9t
aXNjL2xpdmVwYXRjaC5wYW5kb2MgYi9kb2NzL21pc2MvbGl2ZXBhdGNoLnBhbmRvYwo+IGluZGV4
IDJmM2Y5NWVkMzcuLjk0NzNhZDU5OTEgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9taXNjL2xpdmVwYXRj
aC5wYW5kb2MKPiArKysgYi9kb2NzL21pc2MvbGl2ZXBhdGNoLnBhbmRvYwo+IEBAIC03MzksNyAr
NzM5LDcgQEAgVGhlIGNhbGxlciBwcm92aWRlczoKPiAgICAgQ2FsbGVyICpNVVNUKiBhbGxvY2F0
ZSBlbm91Z2ggc3BhY2UgdG8gYmUgYWJsZSB0byBzdG9yZSBhbGwgcmVjZWl2ZWQgZGF0YQo+ICAg
ICAoaS5lLiB0b3RhbCBhbGxvY2F0ZWQgc3BhY2UgKk1VU1QqIG1hdGNoIHRoZSBgbWV0YWRhdGFf
dG90YWxfc2l6ZWAgdmFsdWUKPiAgICAgcHJvdmlkZWQgYnkgdGhlIGh5cGVydmlzb3IpLiBJbmRp
dmlkdWFsIHBheWxvYWQgbWV0YWRhdGEgc3RyaW5nIGNhbiBiZSBvZgo+IC0gICBhcmJpdHJhcnkg
bGVuZ3RoLiBUaGUgbWV0YWRhdGEgc3RyaW5nIGZvcm1hdCBpczoga2V5PXZhbHVlXDAuLi5rZXk9
dmFsdWVcMC4KPiArICAgYXJiaXRyYXJ5IGxlbmd0aC4gVGhlIG1ldGFkYXRhIHN0cmluZyBmb3Jt
YXQgaXM6IGtleT12YWx1ZVxcMC4uLmtleT12YWx1ZVxcMC4KPiAgICogYG1ldGFkYXRhX2xlbmAg
LSBWaXJ0dWFsIGFkZHJlc3Mgb2Ygd2hlcmUgdG8gd3JpdGUgdGhlIGxlbmd0aCBvZiBlYWNoIG1l
dGFkYXRhCj4gICAgIHN0cmluZyBvZiB0aGUgcGF5bG9hZC4gQ2FsbGVyICpNVVNUKiBhbGxvY2F0
ZSB1cCB0byBgbnJgIG9mIHRoZW0uIEVhY2ggKk1VU1QqCj4gICAgIGJlIG9mIHNpemVvZih1aW50
MzJfdCkgKDQgYnl0ZXMpLgo+IAoKUmV2aWV3ZWQtYnk6IFJvc3MgTGFnZXJ3YWxsIDxyb3NzLmxh
Z2Vyd2FsbEBjaXRyaXguY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
