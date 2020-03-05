Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70FC17A36F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 11:52:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9o4b-0005ag-E7; Thu, 05 Mar 2020 10:49:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KIN4=4W=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1j9o4Z-0005ab-AH
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 10:49:47 +0000
X-Inumbo-ID: 06d573f0-5ecf-11ea-a55b-12813bfff9fa
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 06d573f0-5ecf-11ea-a55b-12813bfff9fa;
 Thu, 05 Mar 2020 10:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583405385;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=fiq5TS2rlNJ42Y85HoM0ccjXqRxqSGHUjMll3s1okX8=;
 b=RXYy55z5cA6dZo1zPtzrbqPZKPoCh6u2t7EbDfBJzoRnKNKqtphpPegb
 Gj2n0pfNqJacdKBsFD6hrYM0XcWh73iPZDlhbFtnqBSVUvzZDXP8Avg6R
 J2FjvLzUNQDanE7kyYS1QXs8AgQmL1cH5KuUIi0yYegfWccwdDuTIClTz 0=;
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
IronPort-SDR: iO84YcsxxS335XjMZn+9MjGhNsbK+YU+eCuQfCy4OEwl49wy+VHz976hS/9bOaohiwTjSrivnO
 x3TfegmAg/7LogMve+gRCSAg+BG0Emc27M6MVGXQAWC6bVPlhU4NnJfpNGO82JGPZW5IFLtKzx
 3jV3y7PA+z1QZuPwup0i0yZpHKHNKqkOPFAYV47AHDo8PZoQ/CZmMTQHpqMip//8P9os3BAmk+
 hIOnXJ0iVA6feNh2XdiceeL2Yf/FF9FnoC+F1X21XKfRKSZrmSIbnjsvdAGyQ+Y8Fjq8Y7vfyy
 4zo=
X-SBRS: 2.7
X-MesageID: 13795980
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,517,1574139600"; d="scan'208";a="13795980"
Date: Thu, 5 Mar 2020 11:49:35 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20200305104935.GU24458@Air-de-Roger.citrite.net>
References: <20200305100331.16790-1-jgross@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305100331.16790-1-jgross@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL01.citrite.net (10.69.22.125)
Subject: Re: [Xen-devel] [PATCH] xen/blkfront: fix ring info addressing
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
Cc: Jens Axboe <axboe@kernel.dk>, Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gVGh1LCBNYXIgMDUsIDIwMjAgYXQgMTE6MDM6MzFBTSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3
cm90ZToKPiBDb21taXQgMDI2NWQ2ZThkZGI4OTAgKCJ4ZW4vYmxrZnJvbnQ6IGxpbWl0IGFsbG9j
YXRlZCBtZW1vcnkgc2l6ZSB0bwo+IGFjdHVhbCB1c2UgY2FzZSIpIG1hZGUgc3RydWN0IGJsa2Zy
b250X3JpbmdfaW5mbyBzaXplIGR5bmFtaWMuIFRoaXMgaXMKPiBmaW5lIHdoZW4gcnVubmluZyB3
aXRoIG9ubHkgb25lIHF1ZXVlLCBidXQgd2l0aCBtdWx0aXBsZSBxdWV1ZXMgdGhlCj4gYWRkcmVz
c2luZyBvZiB0aGUgc2luZ2xlIHF1ZXVlcyBoYXMgdG8gYmUgYWRhcHRlZCBhcyB0aGUgc3RydWN0
cyBhcmUKPiBhbGxvY2F0ZWQgaW4gYW4gYXJyYXkuCgpUaGFua3MsIGFuZCBzb3JyeSBmb3Igbm90
IGNhdGNoaW5nIHRoaXMgZHVyaW5nIHJldmlldy4KCj4gCj4gRml4ZXM6IDAyNjVkNmU4ZGRiODkw
ICgieGVuL2Jsa2Zyb250OiBsaW1pdCBhbGxvY2F0ZWQgbWVtb3J5IHNpemUgdG8gYWN0dWFsIHVz
ZSBjYXNlIikKPiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+
Cj4gLS0tCj4gIGRyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMgfCA4MiArKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNDUgaW5z
ZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxv
Y2sveGVuLWJsa2Zyb250LmMgYi9kcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jCj4gaW5kZXgg
ZTJhZDZiYmEyMjgxLi5hOGQ0YTM4MzhlNWQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ibG9jay94
ZW4tYmxrZnJvbnQuYwo+ICsrKyBiL2RyaXZlcnMvYmxvY2sveGVuLWJsa2Zyb250LmMKPiBAQCAt
MjEzLDYgKzIxMyw3IEBAIHN0cnVjdCBibGtmcm9udF9pbmZvCj4gIAlzdHJ1Y3QgYmxrX21xX3Rh
Z19zZXQgdGFnX3NldDsKPiAgCXN0cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvOwo+ICAJ
dW5zaWduZWQgaW50IG5yX3JpbmdzOwo+ICsJdW5zaWduZWQgaW50IHJpbmZvX3NpemU7Cj4gIAkv
KiBTYXZlIHVuY29tcGxldGUgcmVxcyBhbmQgYmlvcyBmb3IgbWlncmF0aW9uLiAqLwo+ICAJc3Ry
dWN0IGxpc3RfaGVhZCByZXF1ZXN0czsKPiAgCXN0cnVjdCBiaW9fbGlzdCBiaW9fbGlzdDsKPiBA
QCAtMjU5LDYgKzI2MCwyMSBAQCBzdGF0aWMgaW50IGJsa2Zyb250X3NldHVwX2luZGlyZWN0KHN0
cnVjdCBibGtmcm9udF9yaW5nX2luZm8gKnJpbmZvKTsKPiAgc3RhdGljIHZvaWQgYmxrZnJvbnRf
Z2F0aGVyX2JhY2tlbmRfZmVhdHVyZXMoc3RydWN0IGJsa2Zyb250X2luZm8gKmluZm8pOwo+ICBz
dGF0aWMgaW50IG5lZ290aWF0ZV9tcShzdHJ1Y3QgYmxrZnJvbnRfaW5mbyAqaW5mbyk7Cj4gIAo+
ICsjZGVmaW5lIHJpbmZvX3B0cihyaW5mbywgb2ZmKSBcCj4gKwkoc3RydWN0IGJsa2Zyb250X3Jp
bmdfaW5mbyAqKSgodW5zaWduZWQgbG9uZykocmluZm8pICsgKG9mZikpCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXiB2b2lkICogd291bGQgc2VlbSBtb3JlIG5hdHVyYWwg
SU1PLgoKQWxzbyBpZiB5b3UgdXNlIHZvaWQgKiB5b3UgZG9uJ3QgbmVlZCB0aGUgZXh0cmEgKHN0
cnVjdApibGtmcm9udF9yaW5nX2luZm8gKikgY2FzdCBJIHRoaW5rPwoKSSBob3dldmVyIHRoaW5r
IHRoaXMgbWFjcm8gaXMga2luZCBvZiB3ZWlyZCwgc2luY2UgaXQncyBqdXN0IGRvaW5nIGFuCmFk
ZGl0aW9uLiBJIHdvdWxkIHJhdGhlciBoYXZlIHRoYXQgY2FsY3VsYXRpb24gaW4gZ2V0X3JpbmZv
IGFuZCBjb2RlCmZvcl9lYWNoX3JpbmZvIG9uIHRvcCBvZiB0aGF0LgoKSSBhZ3JlZSB0aGlzIG1p
Z2h0IGJlIGEgcXVlc3Rpb24gb2YgdGFzdGUsIHNvIEknbSBub3QgZ29pbmcgdG8gaW5zaXN0CmJ1
dCB0aGF0IHdvdWxkIHJlZHVjZSB0aGUgbnVtYmVyIG9mIGhlbHBlcnMgZnJvbSAzIHRvIDIuCgo+
ICsKPiArI2RlZmluZSBmb3JfZWFjaF9yaW5mbyhpbmZvLCByaW5mbywgaWR4KQkJCQlcCj4gKwlm
b3IgKHJpbmZvID0gaW5mby0+cmluZm8sIGlkeCA9IDA7CQkJCVwKPiArCSAgICAgaWR4IDwgaW5m
by0+bnJfcmluZ3M7CQkJCQlcCj4gKwkgICAgIGlkeCsrLCByaW5mbyA9IHJpbmZvX3B0cihyaW5m
bywgaW5mby0+cmluZm9fc2l6ZSkpCgpJIHRoaW5rIHRoZSBhYm92ZSBpcyBtaXNzaW5nIHByb3Bl
ciBwYXJlbnRoZXNlcyBhcm91bmQgbWFjcm8KcGFyYW1ldGVycy4KCj4gKwo+ICtzdGF0aWMgc3Ry
dWN0IGJsa2Zyb250X3JpbmdfaW5mbyAqZ2V0X3JpbmZvKHN0cnVjdCBibGtmcm9udF9pbmZvICpp
bmZvLAo+ICsJCQkJCSAgICB1bnNpZ25lZCBpbnQgaSkKCmlubGluZSBhdHRyaWJ1dGUgbWlnaHQg
YmUgYXBwcm9wcmlhdGUgaGVyZS4KClRoYW5rcywgUm9nZXIuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
