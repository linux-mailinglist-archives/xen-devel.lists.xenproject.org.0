Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCF7122E2E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2019 15:10:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihDWe-0000bB-1P; Tue, 17 Dec 2019 14:08:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6FKB=2H=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ihDWd-0000b6-3b
 for xen-devel@lists.xen.org; Tue, 17 Dec 2019 14:08:35 +0000
X-Inumbo-ID: b5c60e92-20d6-11ea-8ed4-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b5c60e92-20d6-11ea-8ed4-12813bfff9fa;
 Tue, 17 Dec 2019 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1576591714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=b7PHopwiI8FTRQ2z00n5oKK2oEvlSkqsLikVXS8JZHg=;
 b=dZDRiVzdLtEO4zSUM5pqh1N5hCAt8UFLw/ckrRuA5HMyH6rOe3g/pN4V
 0+/VlyRavPAgKuc8TApMmP9m4FoDqtH6idcu88yx3TgIliQfITpFx5sBU
 dsFg93hCvK2GBOaANszlSEgXFKovK8jJEz19LgJH8k+1jfTLMSmcCynoM 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: c65bE5BcO9T8b9RJhnirPK271/3uK8BZrOgCVjCsLdfABV/XxAMsPzl2UkjdtDcZ/Gg6QeSIkH
 ySnzwPhtaZYva01O+x4zrVmCY/qs5XpOLaQ78Qlg4y8rtiDpHMriZIBFBQ0SfRntFUUpCvvUD0
 PduTQgXJZNLk6WxApDPLJKDEkWdHqvvxvSL6XEbKovKaE2nYXDZSxAAk5IjBb3IXGRGzbz46wJ
 VzBt50j8MfHcrTQk63No93tIdkXQY2ji13iPuOtnB4uH+NeAoDHKk/kb0/AgSZAMGf2+8cDon4
 VS4=
X-SBRS: 2.7
X-MesageID: 9817028
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,325,1571716800"; 
   d="scan'208";a="9817028"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 17 Dec 2019 14:08:04 +0000
Message-ID: <20191217140804.27364-4-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191217140804.27364-1-sergey.dyasli@citrix.com>
References: <20191217140804.27364-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH 3/3] xen/netback: Fix grant copy across page
 boundary with KASAN
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
Cc: Juergen Gross <jgross@suse.com>, Sergey Dyasli <sergey.dyasli@citrix.com>,
 Stefano
 Stabellini <sstabellini@kernel.org>, George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpXaGVuIEtB
U0FOIChvciBTTFVCX0RFQlVHKSBpcyB0dXJuZWQgb24sIHRoZSBub3JtYWwgZXhwZWN0YXRpb24g
dGhhdAphbGxvY2F0aW9ucyBhcmUgYWxpZ25lZCB0byB0aGUgbmV4dCBwb3dlciBvZiAyIG9mIHRo
ZSBzaXplIGRvZXMgbm90CmhvbGQuIFRoZXJlZm9yZSwgaGFuZGxlIGdyYW50IGNvcGllcyB0aGF0
IGNyb3NzIHBhZ2UgYm91bmRhcmllcy4KClNpZ25lZC1vZmYtYnk6IFJvc3MgTGFnZXJ3YWxsIDxy
b3NzLmxhZ2Vyd2FsbEBjaXRyaXguY29tPgpTaWduZWQtb2ZmLWJ5OiBTZXJnZXkgRHlhc2xpIDxz
ZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29t
bW9uLmggIHwgIDIgKy0KIGRyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2suYyB8IDU1ICsr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQveGVuLW5l
dGJhY2svY29tbW9uLmggYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24uaAppbmRleCAw
NTg0N2ViOTFhMWIuLmU1NzY4NDQxNWVkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5l
dGJhY2svY29tbW9uLmgKKysrIGIvZHJpdmVycy9uZXQveGVuLW5ldGJhY2svY29tbW9uLmgKQEAg
LTE1NSw3ICsxNTUsNyBAQCBzdHJ1Y3QgeGVudmlmX3F1ZXVlIHsgLyogUGVyLXF1ZXVlIGRhdGEg
Zm9yIHhlbnZpZiAqLwogCXN0cnVjdCBwZW5kaW5nX3R4X2luZm8gcGVuZGluZ190eF9pbmZvW01B
WF9QRU5ESU5HX1JFUVNdOwogCWdyYW50X2hhbmRsZV90IGdyYW50X3R4X2hhbmRsZVtNQVhfUEVO
RElOR19SRVFTXTsKIAotCXN0cnVjdCBnbnR0YWJfY29weSB0eF9jb3B5X29wc1tNQVhfUEVORElO
R19SRVFTXTsKKwlzdHJ1Y3QgZ250dGFiX2NvcHkgdHhfY29weV9vcHNbTUFYX1BFTkRJTkdfUkVR
UyAqIDJdOwogCXN0cnVjdCBnbnR0YWJfbWFwX2dyYW50X3JlZiB0eF9tYXBfb3BzW01BWF9QRU5E
SU5HX1JFUVNdOwogCXN0cnVjdCBnbnR0YWJfdW5tYXBfZ3JhbnRfcmVmIHR4X3VubWFwX29wc1tN
QVhfUEVORElOR19SRVFTXTsKIAkvKiBwYXNzZWQgdG8gZ250dGFiX1t1bl1tYXBfcmVmcyB3aXRo
IHBhZ2VzIHVuZGVyICh1biltYXBwaW5nICovCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94ZW4t
bmV0YmFjay9uZXRiYWNrLmMgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNrLmMKaW5k
ZXggMDAyMGIyZThjMjc5Li4xNTQxYjZlMGNjNjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L3hl
bi1uZXRiYWNrL25ldGJhY2suYworKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9uZXRiYWNr
LmMKQEAgLTMyMCw2ICszMjAsNyBAQCBzdGF0aWMgaW50IHhlbnZpZl9jb3VudF9yZXF1ZXN0cyhz
dHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKIAogc3RydWN0IHhlbnZpZl90eF9jYiB7CiAJdTE2
IHBlbmRpbmdfaWR4OworCXU4IGNvcGllczsKIH07CiAKICNkZWZpbmUgWEVOVklGX1RYX0NCKHNr
YikgKChzdHJ1Y3QgeGVudmlmX3R4X2NiICopKHNrYiktPmNiKQpAQCAtNDM5LDYgKzQ0MCw3IEBA
IHN0YXRpYyBpbnQgeGVudmlmX3R4X2NoZWNrX2dvcChzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1
ZSwKIHsKIAlzdHJ1Y3QgZ250dGFiX21hcF9ncmFudF9yZWYgKmdvcF9tYXAgPSAqZ29wcF9tYXA7
CiAJdTE2IHBlbmRpbmdfaWR4ID0gWEVOVklGX1RYX0NCKHNrYiktPnBlbmRpbmdfaWR4OworCXU4
IGNvcGllcyA9IFhFTlZJRl9UWF9DQihza2IpLT5jb3BpZXM7CiAJLyogVGhpcyBhbHdheXMgcG9p
bnRzIHRvIHRoZSBzaGluZm8gb2YgdGhlIHNrYiBiZWluZyBjaGVja2VkLCB3aGljaAogCSAqIGNv
dWxkIGJlIGVpdGhlciB0aGUgZmlyc3Qgb3IgdGhlIG9uZSBvbiB0aGUgZnJhZ19saXN0CiAJICov
CkBAIC00NTAsMjMgKzQ1MiwyNyBAQCBzdGF0aWMgaW50IHhlbnZpZl90eF9jaGVja19nb3Aoc3Ry
dWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUsCiAJaW50IG5yX2ZyYWdzID0gc2hpbmZvLT5ucl9mcmFn
czsKIAljb25zdCBib29sIHNoYXJlZHNsb3QgPSBucl9mcmFncyAmJgogCQkJCWZyYWdfZ2V0X3Bl
bmRpbmdfaWR4KCZzaGluZm8tPmZyYWdzWzBdKSA9PSBwZW5kaW5nX2lkeDsKLQlpbnQgaSwgZXJy
OworCWludCBpLCBlcnIgPSAwOwogCi0JLyogQ2hlY2sgc3RhdHVzIG9mIGhlYWRlci4gKi8KLQll
cnIgPSAoKmdvcHBfY29weSktPnN0YXR1czsKLQlpZiAodW5saWtlbHkoZXJyKSkgewotCQlpZiAo
bmV0X3JhdGVsaW1pdCgpKQotCQkJbmV0ZGV2X2RiZyhxdWV1ZS0+dmlmLT5kZXYsCisJd2hpbGUg
KGNvcGllcykgeworCQkvKiBDaGVjayBzdGF0dXMgb2YgaGVhZGVyLiAqLworCQlpbnQgbmV3ZXJy
ID0gKCpnb3BwX2NvcHkpLT5zdGF0dXM7CisJCWlmICh1bmxpa2VseShuZXdlcnIpKSB7CisJCQlp
ZiAobmV0X3JhdGVsaW1pdCgpKQorCQkJCW5ldGRldl9kYmcocXVldWUtPnZpZi0+ZGV2LAogCQkJ
CSAgICJHcmFudCBjb3B5IG9mIGhlYWRlciBmYWlsZWQhIHN0YXR1czogJWQgcGVuZGluZ19pZHg6
ICV1IHJlZjogJXVcbiIsCiAJCQkJICAgKCpnb3BwX2NvcHkpLT5zdGF0dXMsCiAJCQkJICAgcGVu
ZGluZ19pZHgsCiAJCQkJICAgKCpnb3BwX2NvcHkpLT5zb3VyY2UudS5yZWYpOwotCQkvKiBUaGUg
Zmlyc3QgZnJhZyBtaWdodCBzdGlsbCBoYXZlIHRoaXMgc2xvdCBtYXBwZWQgKi8KLQkJaWYgKCFz
aGFyZWRzbG90KQotCQkJeGVudmlmX2lkeF9yZWxlYXNlKHF1ZXVlLCBwZW5kaW5nX2lkeCwKLQkJ
CQkJICAgWEVOX05FVElGX1JTUF9FUlJPUik7CisJCQkvKiBUaGUgZmlyc3QgZnJhZyBtaWdodCBz
dGlsbCBoYXZlIHRoaXMgc2xvdCBtYXBwZWQgKi8KKwkJCWlmICghc2hhcmVkc2xvdCAmJiAhZXJy
KQorCQkJCXhlbnZpZl9pZHhfcmVsZWFzZShxdWV1ZSwgcGVuZGluZ19pZHgsCisJCQkJCQkgICBY
RU5fTkVUSUZfUlNQX0VSUk9SKTsKKwkJCWVyciA9IG5ld2VycjsKKwkJfQorCQkoKmdvcHBfY29w
eSkrKzsKKwkJY29waWVzLS07CiAJfQotCSgqZ29wcF9jb3B5KSsrOwogCiBjaGVja19mcmFnczoK
IAlmb3IgKGkgPSAwOyBpIDwgbnJfZnJhZ3M7IGkrKywgZ29wX21hcCsrKSB7CkBAIC05MTAsNiAr
OTE2LDcgQEAgc3RhdGljIHZvaWQgeGVudmlmX3R4X2J1aWxkX2dvcHMoc3RydWN0IHhlbnZpZl9x
dWV1ZSAqcXVldWUsCiAJCQl4ZW52aWZfdHhfZXJyKHF1ZXVlLCAmdHhyZXEsIGV4dHJhX2NvdW50
LCBpZHgpOwogCQkJYnJlYWs7CiAJCX0KKwkJWEVOVklGX1RYX0NCKHNrYiktPmNvcGllcyA9IDA7
CiAKIAkJc2tiX3NoaW5mbyhza2IpLT5ucl9mcmFncyA9IHJldDsKIAkJaWYgKGRhdGFfbGVuIDwg
dHhyZXEuc2l6ZSkKQEAgLTkzMyw2ICs5NDAsNyBAQCBzdGF0aWMgdm9pZCB4ZW52aWZfdHhfYnVp
bGRfZ29wcyhzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKIAkJCQkJCSAgICJDYW4ndCBhbGxv
Y2F0ZSB0aGUgZnJhZ19saXN0IHNrYi5cbiIpOwogCQkJCWJyZWFrOwogCQkJfQorCQkJWEVOVklG
X1RYX0NCKG5za2IpLT5jb3BpZXMgPSAwOwogCQl9CiAKIAkJaWYgKGV4dHJhc1tYRU5fTkVUSUZf
RVhUUkFfVFlQRV9HU08gLSAxXS50eXBlKSB7CkBAIC05OTAsNiArOTk4LDMxIEBAIHN0YXRpYyB2
b2lkIHhlbnZpZl90eF9idWlsZF9nb3BzKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAogCiAJ
CXF1ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLmxlbiA9IGRhdGFfbGVuOwogCQlxdWV1ZS0+
dHhfY29weV9vcHNbKmNvcHlfb3BzXS5mbGFncyA9IEdOVENPUFlfc291cmNlX2dyZWY7CisJCVhF
TlZJRl9UWF9DQihza2IpLT5jb3BpZXMrKzsKKworCQlpZiAob2Zmc2V0X2luX3BhZ2Uoc2tiLT5k
YXRhKSArIGRhdGFfbGVuID4gWEVOX1BBR0VfU0laRSkgeworCQkJdW5zaWduZWQgaW50IGV4dHJh
X2xlbiA9IG9mZnNldF9pbl9wYWdlKHNrYi0+ZGF0YSkgKworCQkJCQkgICAgIGRhdGFfbGVuIC0g
WEVOX1BBR0VfU0laRTsKKworCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10ubGVuIC09
IGV4dHJhX2xlbjsKKwkJCSgqY29weV9vcHMpKys7CisKKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sq
Y29weV9vcHNdLnNvdXJjZS51LnJlZiA9IHR4cmVxLmdyZWY7CisJCQlxdWV1ZS0+dHhfY29weV9v
cHNbKmNvcHlfb3BzXS5zb3VyY2UuZG9taWQgPQorCQkJCXF1ZXVlLT52aWYtPmRvbWlkOworCQkJ
cXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10uc291cmNlLm9mZnNldCA9CisJCQkJdHhyZXEu
b2Zmc2V0ICsgZGF0YV9sZW4gLSBleHRyYV9sZW47CisKKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sq
Y29weV9vcHNdLmRlc3QudS5nbWZuID0KKwkJCQl2aXJ0X3RvX2dmbihza2ItPmRhdGEgKyBkYXRh
X2xlbiAtIGV4dHJhX2xlbik7CisJCQlxdWV1ZS0+dHhfY29weV9vcHNbKmNvcHlfb3BzXS5kZXN0
LmRvbWlkID0gRE9NSURfU0VMRjsKKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLmRl
c3Qub2Zmc2V0ID0gMDsKKworCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10ubGVuID0g
ZXh0cmFfbGVuOworCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10uZmxhZ3MgPSBHTlRD
T1BZX3NvdXJjZV9ncmVmOworCisJCQlYRU5WSUZfVFhfQ0Ioc2tiKS0+Y29waWVzKys7CisJCX0K
IAogCQkoKmNvcHlfb3BzKSsrOwogCi0tIAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
