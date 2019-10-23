Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022C2E1BB1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 15:03:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNGFs-000678-Tl; Wed, 23 Oct 2019 13:00:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l49O=YQ=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iNGFr-00066Z-Vg
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 13:00:47 +0000
X-Inumbo-ID: 13d87a5a-f595-11e9-beca-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13d87a5a-f595-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 13:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571835624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=CkgMpeIsW3IyunynNO0/sGnSmpzrNnEvXVsPqh/9w6s=;
 b=BRg+1WuQD+aET3vSve4pO1ZGCsWEHGDGX3FtIYRVsZFCXC5AZ8WRDhZ3
 73pBaVoD3U7pMVKVcJSTekvzZhvfck3ELesTZyxhtqpFdzftGuRegDEK0
 8eId+rGFx33PARuRq9GNL+Mx6CGLKGfW9m7qKk1FbVR7eF2AdNGfnnCEM I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
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
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: +DG0QRnC7rKrEwCLr0f1HxUMsVclSBzJox+3Rqfxb6xLnm+kI7o1sAzhgIJa/JjCqnfreGtvzH
 yhIkZw/lHD6jjsa0Fmv3+e+NKpGcrc8GmZ+4cIbtqJTOojbfU6NMOXPngS78RvneO5YbfxFlzF
 3XyYxuq2SgqceIA8vFk46t0VeJlTZa3/GP8bPI0TPWTyr2Wwl3d1p22QMsFU+LrnV8hlupd9XR
 41s8AbR36CmFZayF/ORU/FQ3WszKHR1svGXy6bb+cTjFljSRJO7ojvxVa21vU8oexxxU3+uel8
 4H4=
X-SBRS: 2.7
X-MesageID: 7623496
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,220,1569297600"; 
   d="scan'208";a="7623496"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 14:00:11 +0100
Message-ID: <20191023130013.32382-10-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
References: <20191023130013.32382-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v7 09/11] libxl: Move
 domain_create_info_setdefault earlier
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
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2UgbmVlZCB0aGlzIGJlZm9yZSB3ZSBzdGFydCB0byBmaWd1cmUgb3V0IHRoZSBwYXNzdGhyb3Vn
aCBtb2RlLgoKSSBoYXZlIGNoZWNrZWQgdGhhdCBub3RoaW5nIGluIGxpYnhsX19kb21haW5fY3Jl
YXRlX2luZm9fc2V0ZGVmYXVsdApub3IgdGhlIHR3byBpbXBsZW1lbnRhdGlvbnMgb2YgLi4uX2Fy
Y2hfLi4uIGFjY2Vzc2VzIGFueXRoaW5nIGVsc2UsCm90aGVyIHRoYW4gKGkpIHRoZSBkb21haW4g
dHlwZSAod2hpY2ggdGhpcyBmdW5jdGlvbiBpcyByZXNwb25zaWJsZSBmb3IKc2V0dGluZyBhbmQg
bm90aGluZyBiZWZvcmUgaXQgbG9va3MgYXQpIChpaSkgY19pbmZvLT5zc2lkcmVmICh3aGljaCBp
cwpkZWZhdWx0ZWQgYnkgZmxhc2sgY29kZSBuZWFyIHRoZSB0b3Agb2YKbGlieGxfX2RvbWFpbl9j
b25maWdfc2V0ZGVmYXVsdCBhbmQgbm90IGFjY2Vzc2VkIGFmdGVyd2FyZHMpLgoKU28gbm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuCgpTaWduZWQtb2ZmLWJ5OiBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25A
ZXUuY2l0cml4LmNvbT4KQWNrZWQtYnk6IEFudGhvbnkgUEVSQVJEIDxhbnRob255LnBlcmFyZEBj
aXRyaXguY29tPgotLS0KdjM6IE5ldyBwYXRjaCBpbiB0aGlzIHZlcnNpb24gb2YgdGhlIHNlcmll
cy4KLS0tCiB0b29scy9saWJ4bC9saWJ4bF9jcmVhdGUuYyB8IDE0ICsrKysrKystLS0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRl
LmMKaW5kZXggMDY3MGVmOTBlZC4uNzg2OWQ1NGIzMiAxMDA2NDQKLS0tIGEvdG9vbHMvbGlieGwv
bGlieGxfY3JlYXRlLmMKKysrIGIvdG9vbHMvbGlieGwvbGlieGxfY3JlYXRlLmMKQEAgLTk3Miw2
ICs5NzIsMTMgQEAgaW50IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQobGlieGxfX2dj
ICpnYywKICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAgICAgfQogCisgICAgcmV0ID0gbGlieGxf
X2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGdjLCAmZF9jb25maWctPmNfaW5mbywKKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBoeXNpbmZvKTsK
KyAgICBpZiAocmV0KSB7CisgICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAiVW5hYmxlIHRvIHNl
dCBkb21haW4gY3JlYXRlIGluZm8gZGVmYXVsdHMiKTsKKyAgICAgICAgZ290byBlcnJvcl9vdXQ7
CisgICAgfQorCiAgICAgLyogSWYgdGFyZ2V0X21lbWtiIGlzIHNtYWxsZXIgdGhhbiBtYXhfbWVt
a2IsIHRoZSBzdWJzZXF1ZW50IGNhbGwKICAgICAgKiB0byBsaWJ4YyB3aGVuIGJ1aWxkaW5nIEhW
TSBkb21haW4gd2lsbCBlbmFibGUgUG9EIG1vZGUuCiAgICAgICovCkBAIC0xMDExLDEzICsxMDE4
LDYgQEAgaW50IGxpYnhsX19kb21haW5fY29uZmlnX3NldGRlZmF1bHQobGlieGxfX2djICpnYywK
ICAgICAgICAgZ290byBlcnJvcl9vdXQ7CiAgICAgfQogCi0gICAgcmV0ID0gbGlieGxfX2RvbWFp
bl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGdjLCAmZF9jb25maWctPmNfaW5mbywKLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnBoeXNpbmZvKTsKLSAgICBp
ZiAocmV0KSB7Ci0gICAgICAgIExPR0QoRVJST1IsIGRvbWlkLCAiVW5hYmxlIHRvIHNldCBkb21h
aW4gY3JlYXRlIGluZm8gZGVmYXVsdHMiKTsKLSAgICAgICAgZ290byBlcnJvcl9vdXQ7Ci0gICAg
fQotCiAgICAgaWYgKGRfY29uZmlnLT5iX2luZm8uc2hhZG93X21lbWtiID09IExJQlhMX01FTUtC
X0RFRkFVTFQKICAgICAgICAgJiYgb2tfdG9fZGVmYXVsdF9tZW1rYl9pbl9jcmVhdGUoZ2MpKQog
ICAgICAgICBkX2NvbmZpZy0+Yl9pbmZvLnNoYWRvd19tZW1rYiA9Ci0tIAoyLjExLjAKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
