Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFF011D594
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2019 19:30:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifTC7-0007Gb-Iu; Thu, 12 Dec 2019 18:28:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=MOos=2C=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1ifTC5-0007Fu-Gq
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2019 18:28:09 +0000
X-Inumbo-ID: 1d833f14-1d0d-11ea-88e7-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d833f14-1d0d-11ea-88e7-bc764e2007e4;
 Thu, 12 Dec 2019 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576175275;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rmyFJ9d+smpRLDE6b4uNXfrBb6V1qK0qwOw/oUdO9Ho=;
 b=CP1IVSi1cCaNaMBibqkb87u+m0Dw3rRj/fUpJrKzivaB7L6GZrEphhKH
 +kvsCK3ZxxzGz52IX9uArn6Gfh6wulrDIvFMByLjRp7RjS0G8mVe3zoMF
 sLie2ahrMtUhpMWbBh27YDLXq+8k3YuZzf1errEV7JeOqZAeyXZxFnKZy Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=anthony.perard@citrix.com;
 spf=Pass smtp.mailfrom=anthony.perard@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 anthony.perard@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 anthony.perard@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="anthony.perard@citrix.com";
 x-sender="anthony.perard@citrix.com";
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
 envelope-from="anthony.perard@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: Pj/NMGzt7i+K1y2ttizHCwMFErXajba+aMZ1NoiP13cpZzfJl49qnnQPyoihQ34pSVyfAuyZnE
 l2ZwgMar+yDvgA0vAFMqi2oOTx/ia1h57vragaEXcwW/AzcR5eZTgpkXTiZj5rwmyWcT/o90Pv
 NzuPY0bFNSHbs8ci2ImSRDucOfh5peud38LCmRNNcfye613CWwBzARKFZ1bfLU0nS5fVhaUsGW
 9Za19zteJZT139m9l/KX1gsvVOCFCFBpFeYbdwnlkV4BvZK2psoEfGofJ51uVvl5b5ra/BCi7z
 Mw0=
X-SBRS: 2.7
X-MesageID: 10021233
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,306,1571716800"; d="scan'208";a="10021233"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Thu, 12 Dec 2019 18:27:40 +0000
Message-ID: <20191212182740.2190199-9-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191212182740.2190199-1-anthony.perard@citrix.com>
References: <20191212182740.2190199-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [XEN PATCH 8/8] xen: Move GCC_HAS_VISIBILITY_ATTRIBUTE
 to Kconfig and common
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNoZWNrIGZvciAkKENDKSAtZnZpc2liaWxpdHk9aGlkZGVuIGlzIGRvbmUgYnkgYm90aCBh
cm0gYW5kIHg4NiwKc28gdGhlIHBhdGNoIGFsc28gbW92ZSB0aGUgY2hlY2sgdG8gdGhlIGNvbW1v
biBhcmVhLgoKVGhlIGNoZWNrIGRvZXNuJ3QgY2hlY2sgaWYgJChDQykgaXMgZ2NjLCBhbmQgY2xh
bmcgY2FuIGFjY2VwdCB0aGF0Cm9wdGlvbiBhcyB3ZWxsLCBzbyBzL0dDQy9DQy8gaXMgZG9uZSB0
byB0aGUgZGVmaW5lIG5hbWUuCgpTaWduZWQtb2ZmLWJ5OiBBbnRob255IFBFUkFSRCA8YW50aG9u
eS5wZXJhcmRAY2l0cml4LmNvbT4KLS0tCiB4ZW4vS2NvbmZpZyAgICAgICAgICAgICAgICB8IDQg
KysrKwogeGVuL2FyY2gvYXJtL1J1bGVzLm1rICAgICAgfCA0IC0tLS0KIHhlbi9hcmNoL3g4Ni9S
dWxlcy5tayAgICAgIHwgNSAtLS0tLQogeGVuL2luY2x1ZGUveGVuL2NvbXBpbGVyLmggfCAyICst
CiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL0tjb25maWcgYi94ZW4vS2NvbmZpZwppbmRleCA5ZjY1MTJkNjViMDguLmZj
NDlmNGMzMGEyOSAxMDA2NDQKLS0tIGEveGVuL0tjb25maWcKKysrIGIveGVuL0tjb25maWcKQEAg
LTI0LDYgKzI0LDEwIEBAIGNvbmZpZyBDTEFOR19WRVJTSU9OCiAJaW50CiAJZGVmYXVsdCAkKHNo
ZWxsLCQoQkFTRURJUikvc2NyaXB0cy9jbGFuZy12ZXJzaW9uLnNoICQoQ0MpKQogCisjIC1mdmlz
aWJpbGl0eT1oaWRkZW4gcmVkdWNlcyAtZnBpYyBjb3N0LCBpZiBpdCdzIGF2YWlsYWJsZQorY29u
ZmlnIENDX0hBU19WSVNJQklMSVRZX0FUVFJJQlVURQorCWRlZl9ib29sICQoY2Mtb3B0aW9uLC1m
dmlzaWJpbGl0eT1oaWRkZW4pCisKIHNvdXJjZSAiYXJjaC8kKFNSQ0FSQ0gpL0tjb25maWciCiAK
IGNvbmZpZyBERUZDT05GSUdfTElTVApkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL1J1bGVzLm1r
IGIveGVuL2FyY2gvYXJtL1J1bGVzLm1rCmluZGV4IDNkOWEwZWQzNTdiYy4uMDIyYTNhNmY4MmJh
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vUnVsZXMubWsKKysrIGIveGVuL2FyY2gvYXJtL1J1
bGVzLm1rCkBAIC0xOCwxMCArMTgsNiBAQCBDRkxBR1MtJChDT05GSUdfQVJNXzMyKSArPSAtbWNw
dT1jb3J0ZXgtYTE1CiBDRkxBR1MtJChDT05GSUdfQVJNXzY0KSArPSAtbWNwdT1nZW5lcmljCiBD
RkxBR1MtJChDT05GSUdfQVJNXzY0KSArPSAtbWdlbmVyYWwtcmVncy1vbmx5ICMgTm8gZnAgcmVn
aXN0ZXJzIGV0YwogCi1pZm5lcSAoJChjYWxsIGNjLW9wdGlvbiwkKENDKSwtZnZpc2liaWxpdHk9
aGlkZGVuLG4pLG4pCi1DRkxBR1MgKz0gLURHQ0NfSEFTX1ZJU0lCSUxJVFlfQVRUUklCVVRFCi1l
bmRpZgotCiBFQVJMWV9QUklOVEsgOj0gbgogCiBpZmVxICgkKENPTkZJR19ERUJVRykseSkKZGlm
ZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9SdWxlcy5tayBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawpp
bmRleCBiOThlMTRlMjhjNWEuLmU2OWI4ZTY5N2NjMCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L1J1bGVzLm1rCisrKyBiL3hlbi9hcmNoL3g4Ni9SdWxlcy5tawpAQCAtNjUsMTEgKzY1LDYgQEAg
Q0ZMQUdTICs9IC1tbm8tcmVkLXpvbmUgLWZwaWMgLWZuby1hc3luY2hyb25vdXMtdW53aW5kLXRh
YmxlcwogIyBTU0Ugc2V0dXAgZm9yIHZhcmlhZGljIGZ1bmN0aW9uIGNhbGxzLgogQ0ZMQUdTICs9
IC1tbm8tc3NlICQoY2FsbCBjYy1vcHRpb24sJChDQyksLW1za2lwLXJheC1zZXR1cCkKIAotIyAt
ZnZpc2liaWxpdHk9aGlkZGVuIHJlZHVjZXMgLWZwaWMgY29zdCwgaWYgaXQncyBhdmFpbGFibGUK
LWlmbmVxICgkKGNhbGwgY2Mtb3B0aW9uLCQoQ0MpLC1mdmlzaWJpbGl0eT1oaWRkZW4sbiksbikK
LUNGTEFHUyArPSAtREdDQ19IQVNfVklTSUJJTElUWV9BVFRSSUJVVEUKLWVuZGlmCi0KICMgQ29t
cGlsZSB3aXRoIHRodW5rLWV4dGVybiwgaW5kaXJlY3QtYnJhbmNoLXJlZ2lzdGVyIGlmIGF2YWlh
YmxlLgogaWZlcSAoJChDT05GSUdfSU5ESVJFQ1RfVEhVTkspLHkpCiBDRkxBR1MgKz0gLW1pbmRp
cmVjdC1icmFuY2g9dGh1bmstZXh0ZXJuIC1taW5kaXJlY3QtYnJhbmNoLXJlZ2lzdGVyCmRpZmYg
LS1naXQgYS94ZW4vaW5jbHVkZS94ZW4vY29tcGlsZXIuaCBiL3hlbi9pbmNsdWRlL3hlbi9jb21w
aWxlci5oCmluZGV4IGZmNmMwZjVjZGQxOC4uOGM4NDYyNjFkMjQxIDEwMDY0NAotLS0gYS94ZW4v
aW5jbHVkZS94ZW4vY29tcGlsZXIuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vY29tcGlsZXIuaApA
QCAtNzgsNyArNzgsNyBAQAogI2RlZmluZSBfX211c3RfYmVfYXJyYXkoYSkgXAogICBCVUlMRF9C
VUdfT05fWkVSTyhfX2J1aWx0aW5fdHlwZXNfY29tcGF0aWJsZV9wKHR5cGVvZihhKSwgdHlwZW9m
KCZhWzBdKSkpCiAKLSNpZmRlZiBHQ0NfSEFTX1ZJU0lCSUxJVFlfQVRUUklCVVRFCisjaWZkZWYg
Q09ORklHX0NDX0hBU19WSVNJQklMSVRZX0FUVFJJQlVURQogLyogUmVzdWx0cyBpbiBtb3JlIGVm
ZmljaWVudCBQSUMgY29kZSAobm8gaW5kaXJlY3Rpb25zIHRocm91Z2ggR09UIG9yIFBMVCkuICov
CiAjcHJhZ21hIEdDQyB2aXNpYmlsaXR5IHB1c2goaGlkZGVuKQogI2VuZGlmCi0tIApBbnRob255
IFBFUkFSRAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
