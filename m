Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81B4B6B1
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 13:06:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdYN9-0002HN-Ku; Wed, 19 Jun 2019 11:03:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XeE9=US=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hdYN7-0002Gp-W1
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 11:03:22 +0000
X-Inumbo-ID: d7b3e56c-9281-11e9-a863-bf914ca9b8e8
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7b3e56c-9281-11e9-a863-bf914ca9b8e8;
 Wed, 19 Jun 2019 11:03:18 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: m1ine1BMZyNHDKt8WR2ra+qRoQ/z82FizDvzpcM/g888PQCeqgZYz9fER0xkRr8zCJTLNY2v8+
 w+w+gwBhWUeCAKFosx6KZykDDlJS4FelEfrLWOWtDM8ddFPC+KFFdXUYaUhiKp16Ba/9V8iJv9
 jJApGjx4CU5EaoqYjPtvMJJTuBCVQRQ5Xk6unM/C8SgEVxN8JaFEvsoPnTAgcfR6AP+o6SvLZS
 AjuICfVRhRyfyAzqKy6tiQqmITVywjtzZ1LPhQlLhjz67bVGILJ7aUu0yb4HprZoE1HlDJvVGH
 oR4=
X-SBRS: 2.7
X-MesageID: 1935696
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,392,1557201600"; 
   d="scan'208";a="1935696"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 19 Jun 2019 13:02:50 +0200
Message-ID: <20190619110250.18881-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190619110250.18881-1-roger.pau@citrix.com>
References: <20190619110250.18881-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 4/4] x86: check for multiboot{1,
 2} header presence
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWZ0ZXIgYnVpbGRpbmcgdGhlIGh5cGVydmlzb3IgYmluYXJ5LiBOb3RlIHRoYXQgdGhlIGNoZWNr
IGlzIHBlcmZvcm1lZApieSBzZWFyY2hpbmcgZm9yIHRoZSBtYWdpYyBoZWFkZXIgdmFsdWUgYXQg
dGhlIHN0YXJ0IG9mIHRoZSBiaW5hcnkuCgpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KLS0tCkNjOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3Vz
ZS5jb20+CkNjOiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgpDYzog
V2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCiB4ZW4vYXJjaC94ODYvTWFrZWZpbGUgfCAzICsrKwog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4
Ni9NYWtlZmlsZSBiL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQppbmRleCA4YThkOGYwNjBmLi45YmIz
YmY2ZTZjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvTWFrZWZpbGUKKysrIGIveGVuL2FyY2gv
eDg2L01ha2VmaWxlCkBAIC0xMDIsNiArMTAyLDkgQEAgc3ltcy13YXJuLWR1cC0kKENPTkZJR19T
VVBQUkVTU19EVVBMSUNBVEVfU1lNQk9MX1dBUk5JTkdTKSA6PQogJChUQVJHRVQpOiAkKFRBUkdF
VCktc3ltcyAkKGVmaS15KSBib290L21rZWxmMzIKIAkuL2Jvb3QvbWtlbGYzMiAkKG5vdGVzX3Bo
ZHJzKSAkKFRBUkdFVCktc3ltcyAkKFRBUkdFVCkgJChYRU5fSU1HX09GRlNFVCkgXAogCSAgICAg
ICAgICAgICAgIGAkKE5NKSAkKFRBUkdFVCktc3ltcyB8IHNlZCAtbmUgJ3MvXlwoW14gXSpcKSAu
IF9fMk1fcndkYXRhX2VuZCQkLzB4XDEvcCdgCisJIyBDaGVjayBmb3IgbXVsdGlib290ezEsMn0g
aGVhZGVycworCW9kIC10IHg0IC1OIDgxOTIgJChUQVJHRVQpIHwgZ3JlcCAxYmFkYjAwMiA+IC9k
ZXYvbnVsbAorCW9kIC10IHg0IC1OIDMyNzY4ICQoVEFSR0VUKSB8IGdyZXAgZTg1MjUwZDYgPiAv
ZGV2L251bGwKIAogQUxMX09CSlMgOj0gJChCQVNFRElSKS9hcmNoL3g4Ni9ib290L2J1aWx0X2lu
Lm8gJChCQVNFRElSKS9hcmNoL3g4Ni9lZmkvYnVpbHRfaW4ubyAkKEFMTF9PQkpTKQogCi0tIAoy
LjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
