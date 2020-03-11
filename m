Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2E7181BB0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Mar 2020 15:49:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jC2d2-0003Uy-R1; Wed, 11 Mar 2020 14:46:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kY5a=44=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1jC2d1-0003Uo-Jo
 for xen-devel@lists.xenproject.org; Wed, 11 Mar 2020 14:46:35 +0000
X-Inumbo-ID: 1a5e6332-63a7-11ea-afd4-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a5e6332-63a7-11ea-afd4-12813bfff9fa;
 Wed, 11 Mar 2020 14:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1583937995;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uBuZp449rgpO4qugK5ZjRRPkGrjETSuQ5pttw7X8qLE=;
 b=XNFIEviYDvbBL6i978VWNOpv8lcLE8ImdFfoHhBJn2XcMpQftlHtZY7C
 cKiVa65bN3WOa7S3QGrelJfuh5IV8G1XBUwy8WpDYYkv+VneD3aeIReR0
 oLTok7Bcept0G/MWyMVUmWT7kw0kOlWMPqzqk/IaxW+EPDyjLohqzsn7g c=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Oo+zcYGZ64L1tNrHnhISmqIV9//56PCftidmtSwDwwGVECjt0eHfqGdyHfssSwWPdRY2K+z0Td
 1216RY2FBdiYDXXfJjjuzrtCZj9Pt1g3uvQBaaGM+Gl/6YKFviE7lB/wFDRA4/gBJtnzr4xVWB
 08SuN5zV+C+u7T/nJy+d8DNZJVYETrBGU0e8sKb6GsKhVMvaEdYY9kHpNxQe0kz0GEGA7+9M6v
 h+zG6jVxue/aw9SQDfNzjPzcFwOvzyv0YDsseovqX38SEgRTWCvIDAQJC0Qq1awT9Ot71fImQX
 awc=
X-SBRS: 2.7
X-MesageID: 13755949
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.70,541,1574139600"; d="scan'208";a="13755949"
Date: Wed, 11 Mar 2020 14:46:31 +0000
From: Anthony PERARD <anthony.perard@citrix.com>
To: Julien Grall <julien@xen.org>
Message-ID: <20200311144631.GI2152@perard.uk.xensource.com>
References: <20200309174505.594607-1-anthony.perard@citrix.com>
 <20200309174505.594607-2-anthony.perard@citrix.com>
 <4f26f2b9-b011-9533-60ce-05dd6c101827@xen.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f26f2b9-b011-9533-60ce-05dd6c101827@xen.org>
Subject: Re: [Xen-devel] [XEN PATCH v3 1/2] xen/arm: Rename all early printk
 macro
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDE6NTc6MzdQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IEhpIEFudGhvbnksCj4gCj4gT24gMDkvMDMvMjAyMCAxNzo0NSwgQW50aG9ueSBQRVJB
UkQgd3JvdGU6Cj4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUyBiL3hl
bi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKPiA+IGluZGV4IGU5ZDM1NmYwNWMyYi4uMmI1OTNjNWVm
OTlhIDEwMDY0NAo+ID4gLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+ID4gKysrIGIv
eGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUwo+ID4gQEAgLTM2LDggKzM2LDggQEAKPiA+ICAgI2Rl
ZmluZSBYRU5fRklSU1RfU0xPVCAgICAgIGZpcnN0X3RhYmxlX29mZnNldChYRU5fVklSVF9TVEFS
VCkKPiA+ICAgI2RlZmluZSBYRU5fU0VDT05EX1NMT1QgICAgIHNlY29uZF90YWJsZV9vZmZzZXQo
WEVOX1ZJUlRfU1RBUlQpCj4gPiAtI2lmIChkZWZpbmVkIChDT05GSUdfRUFSTFlfUFJJTlRLKSkg
JiYgKGRlZmluZWQgKEVBUkxZX1BSSU5US19JTkMpKQo+ID4gLSNpbmNsdWRlIEVBUkxZX1BSSU5U
S19JTkMKPiA+ICsjaWYgKGRlZmluZWQgKENPTkZJR19FQVJMWV9QUklOVEspKSAmJiAoZGVmaW5l
ZCAoQ09ORklHX0VBUkxZX1BSSU5US19JTkMpKQo+IAo+IE5JVDogSSB3b3VsZCBhbHNvIHRha2Ug
dGhlIG9wcG9ydHVuaXR5IHRvIGNsZWFuLXVwIHRoZSBsaW5lIGJ5IHJlbW92ZSB0aGUKPiBleHRy
YSAoKSBhbmQgdGhlIHNwYWNlIGJlZm9yZSAoLiBTb21ldGhpbmcgbGlrZToKPiAKPiAjaWYgZGVm
aW5lKENPTkZJR19FQVJMWV9QUklOVEspICYmIGRlZmluZWQoQ09ORklHX0VBUkxZX1BSSU5US19J
TkMpCj4gCj4gWy4uLl0KPiAKPiA+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVh
ZC5TIGIveGVuL2FyY2gvYXJtL2FybTY0L2hlYWQuUwo+ID4gaW5kZXggZTUwMTVmOTNhMmQ4Li40
ZDQ1ZWEzZGFjM2MgMTAwNjQ0Cj4gPiAtLS0gYS94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4g
PiArKysgYi94ZW4vYXJjaC9hcm0vYXJtNjQvaGVhZC5TCj4gPiBAQCAtNDUsOCArNDUsOCBAQAo+
ID4gICAjZGVmaW5lIF9fSEVBRF9GTEFHUyAgICAgICAgICAgICgoX19IRUFEX0ZMQUdfUEFHRV9T
SVpFIDw8IDEpIHwgXAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoX19I
RUFEX0ZMQUdfUEhZU19CQVNFIDw8IDMpKQo+ID4gLSNpZiAoZGVmaW5lZCAoQ09ORklHX0VBUkxZ
X1BSSU5USykpICYmIChkZWZpbmVkIChFQVJMWV9QUklOVEtfSU5DKSkKPiA+IC0jaW5jbHVkZSBF
QVJMWV9QUklOVEtfSU5DCj4gPiArI2lmIChkZWZpbmVkIChDT05GSUdfRUFSTFlfUFJJTlRLKSkg
JiYgKGRlZmluZWQgKENPTkZJR19FQVJMWV9QUklOVEtfSU5DKSkKPiAKPiBTYW1lIGhlcmUuCgpU
aG9zZSBjbGVhbi11cCBzb3VuZHMgZ29vZC4KCj4gSSBhbSBoYXBweSB0byBmaXggYm90aCBjYXNl
cyBvbiBjb21taXQ6Cj4KPiBBY2tlZC1ieTogSnVsaWVuIEdyYWxsIDxqZ3JhbGxAYW1hem9uLmNv
bT4KClRoYW5rcywKCi0tIApBbnRob255IFBFUkFSRAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
