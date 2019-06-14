Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9269D45B6C
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 13:29:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbkMz-0008OY-4z; Fri, 14 Jun 2019 11:27:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Y8Mf=UN=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hbkMx-0008Nf-7z
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 11:27:43 +0000
X-Inumbo-ID: 6c23ec23-8e97-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6c23ec23-8e97-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 11:27:42 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: fagq45aXva8k42F4MriKsdKADiAC2RapOtGX80yUmImUYzfQPqYVB+bgJdt1LgMMuZ/XRcbGOU
 IUFepxld7kiKGOkGoZQqOyK4CMer7iQyCUfoOdCF21jcGGuduwjld18rE9Dp2FD/2IKH7ABVPi
 gq4eac/jXA4mYze2vvQdRV3yYKYsN8GfWzbMgVZYqnVQwoAVAmTjU6FSFKcLJ4mY0cURc4EKP+
 sB4uEShMPGBIk+f+qAh1QjhOZNZ+6xYA6IOPhdLKECycM3gQsXpSZ6mPefs1Eavcx/f/pUUQP5
 T+w=
X-SBRS: 2.7
X-MesageID: 1737598
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,373,1557201600"; 
   d="scan'208";a="1737598"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Fri, 14 Jun 2019 12:24:41 +0100
Message-ID: <20190614112444.29980-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190614112444.29980-1-anthony.perard@citrix.com>
References: <20190614112444.29980-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 12/15] libxl_usb: Fix
 libxl_device_usbctrl_getinfo
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
Cc: Anthony
 PERARD <anthony.perard@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

YHVzYmN0cmwnIGlzIG1vZGlmaWVkIGluIHRoaXMgZnVuY3Rpb24gd2hpY2ggZG9lc24ndCBzZWVt
cyB0byBiZQppbnRlbmRlZCwgYW5kIHVzYmN0cmxpbmZvLmJhY2tlbmRfaWQgd2FzIG5ldmVyIG1v
ZGlmaWVkLgoKVGFrZSB0aGlzIG9wcG9ydHVuaXR5IHRvIGNvbnNpZnkgdGhlIGFyZ3VtZW50IGB1
c2JjdHJsJyBpbiBsaWJ4bCBBUEkKdG8gYXZvaWQgc2ltaWxhciBtaXN0YWtlLgoKU2lnbmVkLW9m
Zi1ieTogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogdG9v
bHMvbGlieGwvbGlieGwuaCAgICAgfCAyICstCiB0b29scy9saWJ4bC9saWJ4bF91c2IuYyB8IDYg
KysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS90b29scy9saWJ4bC9saWJ4bC5oIGIvdG9vbHMvbGlieGwvbGlieGwuaApp
bmRleCA5YmFjZmI5N2YwLi43NTBlZjFiN2QwIDEwMDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4
bC5oCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsLmgKQEAgLTE5NTAsNyArMTk1MCw3IEBAIHZvaWQg
bGlieGxfZGV2aWNlX3VzYmN0cmxfbGlzdF9mcmVlKGxpYnhsX2RldmljZV91c2JjdHJsICpsaXN0
LCBpbnQgbnIpOwogCiAKIGludCBsaWJ4bF9kZXZpY2VfdXNiY3RybF9nZXRpbmZvKGxpYnhsX2N0
eCAqY3R4LCB1aW50MzJfdCBkb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGxpYnhsX2RldmljZV91c2JjdHJsICp1c2JjdHJsLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29uc3QgbGlieGxfZGV2aWNlX3VzYmN0cmwgKnVzYmN0cmwsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBsaWJ4bF91c2JjdHJsaW5mbyAqdXNiY3RybGluZm8pOwog
CiAvKiBVU0IgRGV2aWNlcyAqLwpkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGxfdXNiLmMg
Yi90b29scy9saWJ4bC9saWJ4bF91c2IuYwppbmRleCA2OTQ4NzBhM2MzLi45ODUxZmU4NDY4IDEw
MDY0NAotLS0gYS90b29scy9saWJ4bC9saWJ4bF91c2IuYworKysgYi90b29scy9saWJ4bC9saWJ4
bF91c2IuYwpAQCAtNjQxLDcgKzY0MSw3IEBAIGxpYnhsX2RldmljZV91c2JjdHJsX2xpc3QobGli
eGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLCBpbnQgKm51bSkKIH0KIAogaW50IGxpYnhsX2Rl
dmljZV91c2JjdHJsX2dldGluZm8obGlieGxfY3R4ICpjdHgsIHVpbnQzMl90IGRvbWlkLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZGV2aWNlX3VzYmN0cmwgKnVzYmN0
cmwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBsaWJ4bF9kZXZpY2Vf
dXNiY3RybCAqdXNiY3RybCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhs
X3VzYmN0cmxpbmZvICp1c2JjdHJsaW5mbykKIHsKICAgICBHQ19JTklUKGN0eCk7CkBAIC02Nzgs
NyArNjc4LDcgQEAgaW50IGxpYnhsX2RldmljZV91c2JjdHJsX2dldGluZm8obGlieGxfY3R4ICpj
dHgsIHVpbnQzMl90IGRvbWlkLAogICAgICAgICBiZV9wYXRoID0gUkVBRF9TVUJQQVRIKGxpYnhs
X3BhdGgsICJiYWNrZW5kIik7CiAgICAgICAgIHVzYmN0cmxpbmZvLT5iYWNrZW5kID0gbGlieGxf
X3N0cmR1cChOT0dDLCBiZV9wYXRoKTsKICAgICAgICAgcmMgPSBsaWJ4bF9fYmFja2VuZHBhdGhf
cGFyc2VfZG9taWQoZ2MsIGJlX3BhdGgsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZ1c2JjdHJsLT5iYWNrZW5kX2RvbWlkKTsKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgJnVzYmN0cmxpbmZvLT5iYWNrZW5kX2lkKTsKICAg
ICAgICAgaWYgKHJjKSBnb3RvIG91dDsKICAgICAgICAgdXNiY3RybGluZm8tPnN0YXRlID0gUkVB
RF9TVUJQQVRIX0lOVChmZV9wYXRoLCAic3RhdGUiKTsKICAgICAgICAgdXNiY3RybGluZm8tPmV2
dGNoID0gUkVBRF9TVUJQQVRIX0lOVChmZV9wYXRoLCAiZXZlbnQtY2hhbm5lbCIpOwpAQCAtNjkx
LDcgKzY5MSw3IEBAIGludCBsaWJ4bF9kZXZpY2VfdXNiY3RybF9nZXRpbmZvKGxpYnhsX2N0eCAq
Y3R4LCB1aW50MzJfdCBkb21pZCwKICAgICB9IGVsc2UgewogICAgICAgICB1c2JjdHJsaW5mby0+
cG9ydHMgPSBSRUFEX1NVQlBBVEhfSU5UKGxpYnhsX3BhdGgsICJudW0tcG9ydHMiKTsKICAgICAg
ICAgdXNiY3RybGluZm8tPnZlcnNpb24gPSBSRUFEX1NVQlBBVEhfSU5UKGxpYnhsX3BhdGgsICJ1
c2ItdmVyIik7Ci0gICAgICAgIHJjID0gbGlieGxfX2dldF9kb21pZChnYywgJnVzYmN0cmwtPmJh
Y2tlbmRfZG9taWQpOworICAgICAgICByYyA9IGxpYnhsX19nZXRfZG9taWQoZ2MsICZ1c2JjdHJs
aW5mby0+YmFja2VuZF9pZCk7CiAgICAgICAgIGlmIChyYykgZ290byBvdXQ7CiAgICAgfQogCi0t
IApBbnRob255IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
