Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0204E217B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 19:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNK9c-0002Xs-Mw; Wed, 23 Oct 2019 17:10:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=TICx=YQ=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1iNK9b-0002Xn-LS
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 17:10:35 +0000
X-Inumbo-ID: 067caf3f-f5b8-11e9-9488-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 067caf3f-f5b8-11e9-9488-12813bfff9fa;
 Wed, 23 Oct 2019 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1571850635;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aY7iD/LqfH2ZB4ECeLUSyagCqlADJ5VK5pbp31qzZ84=;
 b=XLR/ulK72HhJoY4LXS/Nml3bYuFqQhFXKVa3mROmbpGBkQKmo7gLbPVp
 Er+jJb0EPS1/n6fkw/fraOAY048u53+cvL1lwE1pLqVoBGYOowpKVOYqC
 +aWMhRtxoq7YBfKVx/TDf3G2hgTViqFYHMF9D6ZxfcCE/QGPUu7u3iht6 w=;
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
IronPort-SDR: GLFrNqBW108BBvu4r1iGnJRky+GBLZZfFMfeX0mI8i22tin7b/QhBPpoIj/13S5EvivOFkfdxJ
 bGtPSVBNJDcFh2dG0VzzTltwUSI1tQKKl5WC+9viXN0FtFDpuZ+wWcRUxCHVCMr1nWsNJg9R0O
 u0WhDSfo04FEdN9VZBrRvyhbIXPP0HtT23DixVo3B9612F1BMheWLH0Z4zFUoScB8ttpLo4Ogn
 V5vIkJWYHgt2RDXBj9toneBLOlDMTnWoaRmSMyVF5qtzSgsHGPbBuBgJadt9ppDoB/8B/cWQuT
 rr0=
X-SBRS: 2.7
X-MesageID: 7333651
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.68,221,1569297600"; 
   d="scan'208";a="7333651"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 23 Oct 2019 17:48:27 +0100
Message-ID: <20191023164837.2700240-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191023164837.2700240-1-anthony.perard@citrix.com>
References: <20191023164837.2700240-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC XEN PATCH 13/23] convert common/libelf/Makefile to
 kbuild makefile
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
Cc: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNlIGV4aXN0aW5nIGNvbW1hbmQgbGluZSBvZiBvYmpjb3B5IGFuZCBsZCBpbnN0ZWFkIG9mIHdy
aXRpbmcgbmV3IG9uZQphbmQgc2ltcGx5IGVkaXQgdGhlIGZsYWdzLgoKYHRhcmdldHMnIGlzIHRv
IGxldCBrbm93IGtidWlsZCB0aGF0IG90aGVyIGZpbGVzIGJlc2lkZSB0aGUgb25lCmRlY2xhcmVk
IGluIG9iai1iaW4teSB3aWxsIGJlIGJ1aWx0LgoKU2lnbmVkLW9mZi1ieTogQW50aG9ueSBQRVJB
UkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+Ci0tLQogeGVuL2NvbW1vbi9saWJlbGYvTWFr
ZWZpbGUgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vbGliZWxmL01ha2VmaWxl
IGIveGVuL2NvbW1vbi9saWJlbGYvTWFrZWZpbGUKaW5kZXggOWE0MzNmMDFmYmQ0Li4yYmU5ZWE4
MmIyNDEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vbGliZWxmL01ha2VmaWxlCisrKyBiL3hlbi9j
b21tb24vbGliZWxmL01ha2VmaWxlCkBAIC00LDkgKzQsMTQgQEAgbm9jb3YteSArPSBsaWJlbGYu
bwogU0VDVElPTlMgOj0gdGV4dCBkYXRhICQoU1BFQ0lBTF9EQVRBX1NFQ1RJT05TKQogCiBjY2Zs
YWdzLXkgKz0gLVduby1wb2ludGVyLXNpZ24KK2xkZmxhZ3MteSArPSAtcgorT0JKQ09QWUZMQUdT
ICs9ICQoZm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQu
JChzKSkKIAotbGliZWxmLm86IGxpYmVsZi10ZW1wLm8gTWFrZWZpbGUKLQkkKE9CSkNPUFkpICQo
Zm9yZWFjaCBzLCQoU0VDVElPTlMpLC0tcmVuYW1lLXNlY3Rpb24gLiQocyk9LmluaXQuJChzKSkg
JDwgJEAKK2xpYmVsZi10ZW1wLW9ianMgOj0gbGliZWxmLXRvb2xzLm8gbGliZWxmLWxvYWRlci5v
IGxpYmVsZi1kb21pbmZvLm8gI2xpYmVsZi1yZWxvY2F0ZS5vCit0YXJnZXRzICs9ICQobGliZWxm
LXRlbXAtb2JqcykgbGliZWxmLXRlbXAubwogCi1saWJlbGYtdGVtcC5vOiBsaWJlbGYtdG9vbHMu
byBsaWJlbGYtbG9hZGVyLm8gbGliZWxmLWRvbWluZm8ubyAjbGliZWxmLXJlbG9jYXRlLm8KLQkk
KExEKSAkKExERkxBR1MpIC1yIC1vICRAICReCiskKG9iaikvbGliZWxmLm86ICQob2JqKS9saWJl
bGYtdGVtcC5vIEZPUkNFCisJJChjYWxsIGlmX2NoYW5nZWQsb2JqY29weSkKKworJChvYmopL2xp
YmVsZi10ZW1wLm86ICQoYWRkcHJlZml4ICQob2JqKS8sJChsaWJlbGYtdGVtcC1vYmpzKSkgRk9S
Q0UKKwkkKGNhbGwgaWZfY2hhbmdlZCxsZCkKLS0gCkFudGhvbnkgUEVSQVJECgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
