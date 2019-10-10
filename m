Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5130D2D63
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2019 17:14:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iIa6H-0006LD-BP; Thu, 10 Oct 2019 15:11:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ubId=YD=citrix.com=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1iIa6F-0006KK-Ly
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2019 15:11:31 +0000
X-Inumbo-ID: 35992cae-eb70-11e9-beca-bc764e2007e4
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35992cae-eb70-11e9-beca-bc764e2007e4;
 Thu, 10 Oct 2019 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1570720278;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=4pmc+Vzc4BqgFMXcQFGEsrNp+jeNh9MFQb6ybcVQJgY=;
 b=EDX99AwL74JddAQ2MX+Rgn8RRTXOcIuCDWdgo9YxOnOC8Kvor/zmfQ2T
 gK+c7P/EN/JBRN3t/h55cw4SPf/858gL6COPMYu2c5j08jPcj1JuIk2/2
 U3MQw/zmoRXrZnLyOt/rU5PHHO306vfSVE/zUc0udjhjmFgq1NqnZ8MbR U=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=ian.jackson@eu.citrix.com;
 spf=Pass smtp.mailfrom=Ian.Jackson@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 ian.jackson@eu.citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="ian.jackson@eu.citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Ian.Jackson@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="Ian.Jackson@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Ian.Jackson@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: peBPOyXejesTAnO8GqfKgcV5xa6US1Jl1Yb4Fg8KDUZaVwO7CfBBHXv2Tq/NwiaVvtTZxozI0w
 33m4ehR5ik0l35BLCAJ01fJPJjp3obd+1VGusQBNRjfwj5ktw/mEqhRbm3ij0tPZV0+Sf/DXLv
 cP9mFnneQMLNW97dPBQsHfcgHQ2kIAtWdmt4mGsGtyGIrbH4tYuHhJSQsazNDWzwguro6MGoaL
 2rS/5SjqhTrpHZXXsc+lKPaNVGKgrBaZU84iICthOT0/mPujY59qpSiFeuCe+qv85yhx6N0cVx
 Uxg=
X-SBRS: 2.7
X-MesageID: 7110097
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.67,280,1566878400"; 
   d="scan'208";a="7110097"
From: Ian Jackson <ian.jackson@eu.citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 10 Oct 2019 16:11:09 +0100
Message-ID: <20191010151111.22125-8-ian.jackson@eu.citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
References: <20191010151111.22125-1-ian.jackson@eu.citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH for-4.13 v2 7/9] libxl: create: setdefault:
 Make libxl_physinfo info[1]
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
Cc: Wei Liu <wl@xen.org>, Andrew Cooper <Andrew.Cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Paul Durrant <pdurrant@gmail.com>,
 Jan Beulich <jbeulich@suse.com>, Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Tm8gZnVuY3Rpb25hbCBjaGFuZ2UuICBUaGlzIHdpbGwgbGV0IHVzIG1ha2UgaXQgaW50byBhIHBv
aW50ZXIgd2l0aG91dAp0ZXh0dWFsIGNoYW5nZSBvdGhlciB0aGFuIHRvIHRoZSBkZWZpbml0aW9u
LgoKV2hpbGUgd2UgYXJlIGhlcmUsIGZpeCBzb21lIHN0eWxlIGVycm9ycyAobWlzc2luZyB7IH0p
LgoKU2lnbmVkLW9mZi1ieTogSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+
Ci0tLQp2MjogTmV3IHBhdGNoIGluIHRoaXMgdmVyc2lvbiBvZiB0aGUgc2VyaWVzLgotLS0KIHRv
b2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jIHwgMTYgKysrKysrKystLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29s
cy9saWJ4bC9saWJ4bF9jcmVhdGUuYyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCmluZGV4
IGIzOTQzMTJkOTguLjljNTZhOTE0Y2EgMTAwNjQ0Ci0tLSBhL3Rvb2xzL2xpYnhsL2xpYnhsX2Ny
ZWF0ZS5jCisrKyBiL3Rvb2xzL2xpYnhsL2xpYnhsX2NyZWF0ZS5jCkBAIC0zMCwxMCArMzAsMTAg
QEAKIGludCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQobGlieGxfX2djICpn
YywKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGlieGxfZG9tYWlu
X2NyZWF0ZV9pbmZvICpjX2luZm8pCiB7Ci0gICAgbGlieGxfcGh5c2luZm8gaW5mbzsKKyAgICBs
aWJ4bF9waHlzaW5mbyBpbmZvWzFdOwogICAgIGludCByYzsKIAotICAgIHJjID0gbGlieGxfZ2V0
X3BoeXNpbmZvKENUWCwgJmluZm8pOworICAgIHJjID0gbGlieGxfZ2V0X3BoeXNpbmZvKENUWCwg
aW5mbyk7CiAgICAgaWYgKHJjKQogICAgICAgICByZXR1cm4gcmM7CiAKQEAgLTQ1LDExICs0NSwx
MSBAQCBpbnQgbGlieGxfX2RvbWFpbl9jcmVhdGVfaW5mb19zZXRkZWZhdWx0KGxpYnhsX19nYyAq
Z2MsCiAgICAgbGlieGxfX2FyY2hfZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1bHQoZ2MsIGNf
aW5mbyk7CiAKICAgICBpZiAoY19pbmZvLT50eXBlICE9IExJQlhMX0RPTUFJTl9UWVBFX1BWKSB7
Ci0gICAgICAgIGlmIChpbmZvLmNhcF9oYXApCisgICAgICAgIGlmIChpbmZvLT5jYXBfaGFwKSB7
CiAgICAgICAgICAgICBsaWJ4bF9kZWZib29sX3NldGRlZmF1bHQoJmNfaW5mby0+aGFwLCB0cnVl
KTsKLSAgICAgICAgZWxzZSBpZiAoaW5mby5jYXBfc2hhZG93KQorICAgICAgICB9IGVsc2UgaWYg
KGluZm8tPmNhcF9zaGFkb3cpIHsKICAgICAgICAgICAgIGxpYnhsX2RlZmJvb2xfc2V0ZGVmYXVs
dCgmY19pbmZvLT5oYXAsIGZhbHNlKTsKLSAgICAgICAgZWxzZSB7CisgICAgICAgIH0gZWxzZSB7
CiAgICAgICAgICAgICBMT0coRVJST1IsICJuZWl0aGVyIGhhcCBub3Igc2hhZG93IHBhZ2luZyBh
dmFpbGFibGUiKTsKICAgICAgICAgICAgIHJldHVybiBFUlJPUl9JTlZBTDsKICAgICAgICAgfQpA
QCAtNjMsMTIgKzYzLDEyIEBAIGludCBsaWJ4bF9fZG9tYWluX2NyZWF0ZV9pbmZvX3NldGRlZmF1
bHQobGlieGxfX2djICpnYywKICAgICBpZiAoIWNfaW5mby0+c3NpZHJlZikKICAgICAgICAgY19p
bmZvLT5zc2lkcmVmID0gU0VDSU5JVFNJRF9ET01VOwogCi0gICAgaWYgKGluZm8uY2FwX2h2bV9k
aXJlY3RpbyAmJgorICAgIGlmIChpbmZvLT5jYXBfaHZtX2RpcmVjdGlvICYmCiAgICAgICAgIChj
X2luZm8tPnBhc3N0aHJvdWdoID09IExJQlhMX1BBU1NUSFJPVUdIX1VOS05PV04pKSB7CiAgICAg
ICAgIGNfaW5mby0+cGFzc3Rocm91Z2ggPSAoKGNfaW5mby0+dHlwZSA9PSBMSUJYTF9ET01BSU5f
VFlQRV9QVikgfHwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhaW5mby5jYXBfaW9t
bXVfaGFwX3B0X3NoYXJlKSA/CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIWluZm8t
PmNhcF9pb21tdV9oYXBfcHRfc2hhcmUpID8KICAgICAgICAgICAgIExJQlhMX1BBU1NUSFJPVUdI
X1NZTkNfUFQgOiBMSUJYTF9QQVNTVEhST1VHSF9TSEFSRV9QVDsKLSAgICB9IGVsc2UgaWYgKCFp
bmZvLmNhcF9odm1fZGlyZWN0aW8pIHsKKyAgICB9IGVsc2UgaWYgKCFpbmZvLT5jYXBfaHZtX2Rp
cmVjdGlvKSB7CiAgICAgICAgIGNfaW5mby0+cGFzc3Rocm91Z2ggPSBMSUJYTF9QQVNTVEhST1VH
SF9ESVNBQkxFRDsKICAgICB9CiAKLS0gCjIuMTEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
