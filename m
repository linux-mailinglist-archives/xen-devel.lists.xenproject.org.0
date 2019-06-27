Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A2D57F67
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2019 11:36:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hgQmt-0000k9-Dr; Thu, 27 Jun 2019 09:33:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0PCY=U2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hgQms-0000k2-1v
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2019 09:33:50 +0000
X-Inumbo-ID: aa50da86-98be-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id aa50da86-98be-11e9-8980-bc764e045a96;
 Thu, 27 Jun 2019 09:33:48 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: YZOual/pYzxgWqz6QoUae+MRtkjx7N0pSU+hveaMHxG3udSgyNRKe2yjFXTaPZGQ9aMpJDdW2Y
 ZjrHAR87Te3QEj3V7VnF7pL11c2KabFfUXZmP3KijPOEz8DNoVj0F+ujmKamK5b56p+y3tF2CQ
 LvVTT2YC4PSTlVBSz0CniesPgZh7jrUmsFfLZX24JwD6KM8VrtQu/dhrL03yZqnEkxQ+8Y7dPz
 onEWxGUf/0j+om88gDzx6azsLPpiAAPz/5lEb70Lg2iHhbxJu47Zf3SirWWu8WeysVuICtbr2H
 HVE=
X-SBRS: 2.7
X-MesageID: 2289985
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,423,1557201600"; 
   d="scan'208";a="2289985"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 27 Jun 2019 11:33:35 +0200
Message-ID: <20190627093335.56355-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
In-Reply-To: <20190627093335.56355-1-roger.pau@citrix.com>
References: <20190627093335.56355-1-roger.pau@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 3/3] x86: check for multiboot{1,
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
V2VpIExpdSA8d2xAeGVuLm9yZz4KLS0tCkNoYW5nZXMgc2luY2UgdjI6CiAtIFVzZSBhIHZhcmlh
YmxlIHRvIHN0b3JlIHRoZSBpbnRlcm1lZGlhdGUgZmlsZSBuYW1lLgogLSBSZW1vdmUgdGhlIGlu
dGVybWVkaWF0ZSBmaWxlIGluIHRoZSBjbGVhbiB0YXJnZXQuCiAtIEFkZCBpbnRlcm1lZGlhdGUg
ZmlsZSB0byBnaXRpZ25vcmUuCgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBVc2UgYW4gaW50ZXJtZWRp
YXRlIGZpbGUgdG8gcGVyZm9ybSB0aGUgaGVhZGVyIGNoZWNrcy4KLS0tCiAuZ2l0aWdub3JlICAg
ICAgICAgICAgfCAxICsKIHhlbi9hcmNoL3g4Ni9NYWtlZmlsZSB8IDkgKysrKysrKy0tCiAyIGZp
bGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS8uZ2l0aWdub3JlIGIvLmdpdGlnbm9yZQppbmRleCBhNzdjYmZmMDJjLi41NmJjYjY0ODM3IDEw
MDY0NAotLS0gYS8uZ2l0aWdub3JlCisrKyBiLy5naXRpZ25vcmUKQEAgLTI3OCw2ICsyNzgsNyBA
QCB0b29scy94ZW50cmFjZS94ZW50cmFjZQogeGVuLy5iYW5uZXIKIHhlbi8uY29uZmlnCiB4ZW4v
LmNvbmZpZy5vbGQKK3hlbi8ueGVuCiB4ZW4vU3lzdGVtLm1hcAogeGVuL2FyY2gveDg2L2FzbS1t
YWNyb3MuaQogeGVuL2FyY2gveDg2L2Jvb3QvbWtlbGYzMgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gv
eDg2L01ha2VmaWxlIGIveGVuL2FyY2gveDg2L01ha2VmaWxlCmluZGV4IDhhOGQ4ZjA2MGYuLjk0
ZTZjOWFlZTMgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9NYWtlZmlsZQorKysgYi94ZW4vYXJj
aC94ODYvTWFrZWZpbGUKQEAgLTk5LDkgKzk5LDE0IEBAIGVuZGlmCiBzeW1zLXdhcm4tZHVwLXkg
Oj0gLS13YXJuLWR1cAogc3ltcy13YXJuLWR1cC0kKENPTkZJR19TVVBQUkVTU19EVVBMSUNBVEVf
U1lNQk9MX1dBUk5JTkdTKSA6PQogCiskKFRBUkdFVCk6IFRNUCA9ICQoQEQpLy4kKEBGKQogJChU
QVJHRVQpOiAkKFRBUkdFVCktc3ltcyAkKGVmaS15KSBib290L21rZWxmMzIKLQkuL2Jvb3QvbWtl
bGYzMiAkKG5vdGVzX3BoZHJzKSAkKFRBUkdFVCktc3ltcyAkKFRBUkdFVCkgJChYRU5fSU1HX09G
RlNFVCkgXAorCS4vYm9vdC9ta2VsZjMyICQobm90ZXNfcGhkcnMpICQoVEFSR0VUKS1zeW1zICQo
VE1QKSAkKFhFTl9JTUdfT0ZGU0VUKSBcCiAJICAgICAgICAgICAgICAgYCQoTk0pICQoVEFSR0VU
KS1zeW1zIHwgc2VkIC1uZSAncy9eXChbXiBdKlwpIC4gX18yTV9yd2RhdGFfZW5kJCQvMHhcMS9w
J2AKKwkjIENoZWNrIGZvciBtdWx0aWJvb3R7MSwyfSBoZWFkZXJzCisJb2QgLXQgeDQgLU4gODE5
MiAkKFRNUCkgfCBncmVwIDFiYWRiMDAyID4gL2Rldi9udWxsCisJb2QgLXQgeDQgLU4gMzI3Njgg
JChUTVApIHwgZ3JlcCBlODUyNTBkNiA+IC9kZXYvbnVsbAorCW12ICQoVE1QKSAkKFRBUkdFVCkK
IAogQUxMX09CSlMgOj0gJChCQVNFRElSKS9hcmNoL3g4Ni9ib290L2J1aWx0X2luLm8gJChCQVNF
RElSKS9hcmNoL3g4Ni9lZmkvYnVpbHRfaW4ubyAkKEFMTF9PQkpTKQogCkBAIC0yNDksNyArMjU0
LDcgQEAgZWZpL21rcmVsb2M6IGVmaS9ta3JlbG9jLmMKIGNsZWFuOjoKIAlybSAtZiBhc20tb2Zm
c2V0cy5zICoubGRzIGJvb3QvKi5vIGJvb3QvKn4gYm9vdC9jb3JlIGJvb3QvbWtlbGYzMgogCXJt
IC1mIGFzbS1tYWNyb3MuaSAkKEJBU0VESVIpL2luY2x1ZGUvYXNtLXg4Ni9hc20tbWFjcm9zLioK
LQlybSAtZiAkKEJBU0VESVIpLy54ZW4tc3ltcy5bMC05XSogYm9vdC8uKi5kCisJcm0gLWYgJChC
QVNFRElSKS8ueGVuLXN5bXMuWzAtOV0qIGJvb3QvLiouZCAkKEJBU0VESVIpLy54ZW4KIAlybSAt
ZiAkKEJBU0VESVIpLy54ZW4uZWZpLlswLTldKiBlZmkvKi5lZmkgZWZpL21rcmVsb2MKIAlybSAt
ZiBib290L2NtZGxpbmUuUyBib290L3JlbG9jLlMgYm9vdC8qLmxuayBib290LyouYmluCiAJcm0g
LWYgbm90ZS5vCi0tIAoyLjIwLjEgKEFwcGxlIEdpdC0xMTcpCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
