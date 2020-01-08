Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67196134608
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 16:23:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipD9L-0003up-Ge; Wed, 08 Jan 2020 15:21:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cZrZ=25=citrix.com=sergey.dyasli@srs-us1.protection.inumbo.net>)
 id 1ipD9K-0003uC-91
 for xen-devel@lists.xen.org; Wed, 08 Jan 2020 15:21:34 +0000
X-Inumbo-ID: 83a302ca-322a-11ea-b82c-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 83a302ca-322a-11ea-b82c-12813bfff9fa;
 Wed, 08 Jan 2020 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1578496877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=ndt3rkJJC5cKj6yE6i8y9phmVsBv6Kzxvmo7fe2hCRo=;
 b=WJ+y3FXP1KVrRafPybvEDGeTZVN18+8hMTZegk/fURJucAfCK0XdgXWf
 hzzg9yXn4sQVuHEju+1g4hZvYmaMscyHOVEpjQzSLlVzoT3xTIcEsYSvf
 m4mmq6ZcwpP0ojQiTEJoVxKTIUFi88wv6NCTlvWYgpfgvV3Pr7kzTjMLL g=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=sergey.dyasli@citrix.com;
 spf=Pass smtp.mailfrom=sergey.dyasli@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 sergey.dyasli@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 sergey.dyasli@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="sergey.dyasli@citrix.com";
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
 envelope-from="sergey.dyasli@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: oiTgJTAJYiU8q6hVq1bN4YDuqH1mfR29MxyRm3RWttoThy1554uFarHZBrmWCz0Qji3LgPyiYl
 wVYgmEW3+apuNXVHZzQ2evsQ/icA7m0e5gzf3KjRtDbA8Kb81q1Zi+YTZQJT1VeEzKDY9vrqGd
 mphdiYyxzhMu6ziAdm5TqRpEyDEIa3kEtPXoYBa95UXoue/cu0RlvAuQv+7ixycHCaFCz83l7J
 1fF5yzFP14m9eiE+RKg38qcdy3uaCDjVN2GZu5kmbiO046EFaW/01HjVei+dA+4ZV77rJtKOZb
 ibA=
X-SBRS: 2.7
X-MesageID: 11061017
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.69,410,1571716800"; d="scan'208";a="11061017"
From: Sergey Dyasli <sergey.dyasli@citrix.com>
To: <xen-devel@lists.xen.org>, <kasan-dev@googlegroups.com>,
 <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
Date: Wed, 8 Jan 2020 15:21:00 +0000
Message-ID: <20200108152100.7630-5-sergey.dyasli@citrix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108152100.7630-1-sergey.dyasli@citrix.com>
References: <20200108152100.7630-1-sergey.dyasli@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v1 4/4] xen/netback: Fix grant copy across page
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
 Wei Liu <wei.liu@kernel.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Dmitry Vyukov <dvyukov@google.com>
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
ZXJnZXkuZHlhc2xpQGNpdHJpeC5jb20+Ci0tLQpSRkMgLS0+IHYxOgotIEFkZGVkIEJVSUxEX0JV
R19PTiB0byB0aGUgbmV0YmFjayBwYXRjaAotIHhlbnZpZl9pZHhfcmVsZWFzZSgpIG5vdyBsb2Nh
dGVkIG91dHNpZGUgdGhlIGxvb3AKCkNDOiBXZWkgTGl1IDx3ZWkubGl1QGtlcm5lbC5vcmc+CkND
OiBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KLS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0YmFj
ay9jb21tb24uaCAgfCAgMiArLQogZHJpdmVycy9uZXQveGVuLW5ldGJhY2svbmV0YmFjay5jIHwg
NTkgKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0OSBp
bnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay9jb21tb24uaCBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL2NvbW1vbi5oCmlu
ZGV4IDA1ODQ3ZWI5MWExYi4uZTU3Njg0NDE1ZWRkIDEwMDY0NAotLS0gYS9kcml2ZXJzL25ldC94
ZW4tbmV0YmFjay9jb21tb24uaAorKysgYi9kcml2ZXJzL25ldC94ZW4tbmV0YmFjay9jb21tb24u
aApAQCAtMTU1LDcgKzE1NSw3IEBAIHN0cnVjdCB4ZW52aWZfcXVldWUgeyAvKiBQZXItcXVldWUg
ZGF0YSBmb3IgeGVudmlmICovCiAJc3RydWN0IHBlbmRpbmdfdHhfaW5mbyBwZW5kaW5nX3R4X2lu
Zm9bTUFYX1BFTkRJTkdfUkVRU107CiAJZ3JhbnRfaGFuZGxlX3QgZ3JhbnRfdHhfaGFuZGxlW01B
WF9QRU5ESU5HX1JFUVNdOwogCi0Jc3RydWN0IGdudHRhYl9jb3B5IHR4X2NvcHlfb3BzW01BWF9Q
RU5ESU5HX1JFUVNdOworCXN0cnVjdCBnbnR0YWJfY29weSB0eF9jb3B5X29wc1tNQVhfUEVORElO
R19SRVFTICogMl07CiAJc3RydWN0IGdudHRhYl9tYXBfZ3JhbnRfcmVmIHR4X21hcF9vcHNbTUFY
X1BFTkRJTkdfUkVRU107CiAJc3RydWN0IGdudHRhYl91bm1hcF9ncmFudF9yZWYgdHhfdW5tYXBf
b3BzW01BWF9QRU5ESU5HX1JFUVNdOwogCS8qIHBhc3NlZCB0byBnbnR0YWJfW3VuXW1hcF9yZWZz
IHdpdGggcGFnZXMgdW5kZXIgKHVuKW1hcHBpbmcgKi8KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0
L3hlbi1uZXRiYWNrL25ldGJhY2suYyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25ldGJhY2su
YwppbmRleCAwMDIwYjJlOGMyNzkuLjMzYjhmOGQwNDNlNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
ZXQveGVuLW5ldGJhY2svbmV0YmFjay5jCisrKyBiL2RyaXZlcnMvbmV0L3hlbi1uZXRiYWNrL25l
dGJhY2suYwpAQCAtMzIwLDYgKzMyMCw3IEBAIHN0YXRpYyBpbnQgeGVudmlmX2NvdW50X3JlcXVl
c3RzKHN0cnVjdCB4ZW52aWZfcXVldWUgKnF1ZXVlLAogCiBzdHJ1Y3QgeGVudmlmX3R4X2NiIHsK
IAl1MTYgcGVuZGluZ19pZHg7CisJdTggY29waWVzOwogfTsKIAogI2RlZmluZSBYRU5WSUZfVFhf
Q0Ioc2tiKSAoKHN0cnVjdCB4ZW52aWZfdHhfY2IgKikoc2tiKS0+Y2IpCkBAIC00MzksNiArNDQw
LDcgQEAgc3RhdGljIGludCB4ZW52aWZfdHhfY2hlY2tfZ29wKHN0cnVjdCB4ZW52aWZfcXVldWUg
KnF1ZXVlLAogewogCXN0cnVjdCBnbnR0YWJfbWFwX2dyYW50X3JlZiAqZ29wX21hcCA9ICpnb3Bw
X21hcDsKIAl1MTYgcGVuZGluZ19pZHggPSBYRU5WSUZfVFhfQ0Ioc2tiKS0+cGVuZGluZ19pZHg7
CisJdTggY29waWVzID0gWEVOVklGX1RYX0NCKHNrYiktPmNvcGllczsKIAkvKiBUaGlzIGFsd2F5
cyBwb2ludHMgdG8gdGhlIHNoaW5mbyBvZiB0aGUgc2tiIGJlaW5nIGNoZWNrZWQsIHdoaWNoCiAJ
ICogY291bGQgYmUgZWl0aGVyIHRoZSBmaXJzdCBvciB0aGUgb25lIG9uIHRoZSBmcmFnX2xpc3QK
IAkgKi8KQEAgLTQ1MCwyMyArNDUyLDI2IEBAIHN0YXRpYyBpbnQgeGVudmlmX3R4X2NoZWNrX2dv
cChzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKIAlpbnQgbnJfZnJhZ3MgPSBzaGluZm8tPm5y
X2ZyYWdzOwogCWNvbnN0IGJvb2wgc2hhcmVkc2xvdCA9IG5yX2ZyYWdzICYmCiAJCQkJZnJhZ19n
ZXRfcGVuZGluZ19pZHgoJnNoaW5mby0+ZnJhZ3NbMF0pID09IHBlbmRpbmdfaWR4OwotCWludCBp
LCBlcnI7CisJaW50IGksIGVyciA9IDA7CiAKLQkvKiBDaGVjayBzdGF0dXMgb2YgaGVhZGVyLiAq
LwotCWVyciA9ICgqZ29wcF9jb3B5KS0+c3RhdHVzOwotCWlmICh1bmxpa2VseShlcnIpKSB7Ci0J
CWlmIChuZXRfcmF0ZWxpbWl0KCkpCi0JCQluZXRkZXZfZGJnKHF1ZXVlLT52aWYtPmRldiwKKwl3
aGlsZSAoY29waWVzKSB7CisJCS8qIENoZWNrIHN0YXR1cyBvZiBoZWFkZXIuICovCisJCWludCBu
ZXdlcnIgPSAoKmdvcHBfY29weSktPnN0YXR1czsKKwkJaWYgKHVubGlrZWx5KG5ld2VycikpIHsK
KwkJCWlmIChuZXRfcmF0ZWxpbWl0KCkpCisJCQkJbmV0ZGV2X2RiZyhxdWV1ZS0+dmlmLT5kZXYs
CiAJCQkJICAgIkdyYW50IGNvcHkgb2YgaGVhZGVyIGZhaWxlZCEgc3RhdHVzOiAlZCBwZW5kaW5n
X2lkeDogJXUgcmVmOiAldVxuIiwKIAkJCQkgICAoKmdvcHBfY29weSktPnN0YXR1cywKIAkJCQkg
ICBwZW5kaW5nX2lkeCwKIAkJCQkgICAoKmdvcHBfY29weSktPnNvdXJjZS51LnJlZik7Ci0JCS8q
IFRoZSBmaXJzdCBmcmFnIG1pZ2h0IHN0aWxsIGhhdmUgdGhpcyBzbG90IG1hcHBlZCAqLwotCQlp
ZiAoIXNoYXJlZHNsb3QpCi0JCQl4ZW52aWZfaWR4X3JlbGVhc2UocXVldWUsIHBlbmRpbmdfaWR4
LAotCQkJCQkgICBYRU5fTkVUSUZfUlNQX0VSUk9SKTsKKwkJCWVyciA9IG5ld2VycjsKKwkJfQor
CQkoKmdvcHBfY29weSkrKzsKKwkJY29waWVzLS07CiAJfQotCSgqZ29wcF9jb3B5KSsrOworCS8q
IFRoZSBmaXJzdCBmcmFnIG1pZ2h0IHN0aWxsIGhhdmUgdGhpcyBzbG90IG1hcHBlZCAqLworCWlm
ICh1bmxpa2VseShlcnIpICYmICFzaGFyZWRzbG90KQorCQl4ZW52aWZfaWR4X3JlbGVhc2UocXVl
dWUsIHBlbmRpbmdfaWR4LCBYRU5fTkVUSUZfUlNQX0VSUk9SKTsKIAogY2hlY2tfZnJhZ3M6CiAJ
Zm9yIChpID0gMDsgaSA8IG5yX2ZyYWdzOyBpKyssIGdvcF9tYXArKykgewpAQCAtOTEwLDYgKzkx
NSw3IEBAIHN0YXRpYyB2b2lkIHhlbnZpZl90eF9idWlsZF9nb3BzKHN0cnVjdCB4ZW52aWZfcXVl
dWUgKnF1ZXVlLAogCQkJeGVudmlmX3R4X2VycihxdWV1ZSwgJnR4cmVxLCBleHRyYV9jb3VudCwg
aWR4KTsKIAkJCWJyZWFrOwogCQl9CisJCVhFTlZJRl9UWF9DQihza2IpLT5jb3BpZXMgPSAwOwog
CiAJCXNrYl9zaGluZm8oc2tiKS0+bnJfZnJhZ3MgPSByZXQ7CiAJCWlmIChkYXRhX2xlbiA8IHR4
cmVxLnNpemUpCkBAIC05MzMsNiArOTM5LDcgQEAgc3RhdGljIHZvaWQgeGVudmlmX3R4X2J1aWxk
X2dvcHMoc3RydWN0IHhlbnZpZl9xdWV1ZSAqcXVldWUsCiAJCQkJCQkgICAiQ2FuJ3QgYWxsb2Nh
dGUgdGhlIGZyYWdfbGlzdCBza2IuXG4iKTsKIAkJCQlicmVhazsKIAkJCX0KKwkJCVhFTlZJRl9U
WF9DQihuc2tiKS0+Y29waWVzID0gMDsKIAkJfQogCiAJCWlmIChleHRyYXNbWEVOX05FVElGX0VY
VFJBX1RZUEVfR1NPIC0gMV0udHlwZSkgewpAQCAtOTkwLDYgKzk5NywzMSBAQCBzdGF0aWMgdm9p
ZCB4ZW52aWZfdHhfYnVpbGRfZ29wcyhzdHJ1Y3QgeGVudmlmX3F1ZXVlICpxdWV1ZSwKIAogCQlx
dWV1ZS0+dHhfY29weV9vcHNbKmNvcHlfb3BzXS5sZW4gPSBkYXRhX2xlbjsKIAkJcXVldWUtPnR4
X2NvcHlfb3BzWypjb3B5X29wc10uZmxhZ3MgPSBHTlRDT1BZX3NvdXJjZV9ncmVmOworCQlYRU5W
SUZfVFhfQ0Ioc2tiKS0+Y29waWVzKys7CisKKwkJaWYgKG9mZnNldF9pbl9wYWdlKHNrYi0+ZGF0
YSkgKyBkYXRhX2xlbiA+IFhFTl9QQUdFX1NJWkUpIHsKKwkJCXVuc2lnbmVkIGludCBleHRyYV9s
ZW4gPSBvZmZzZXRfaW5fcGFnZShza2ItPmRhdGEpICsKKwkJCQkJICAgICBkYXRhX2xlbiAtIFhF
Tl9QQUdFX1NJWkU7CisKKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLmxlbiAtPSBl
eHRyYV9sZW47CisJCQkoKmNvcHlfb3BzKSsrOworCisJCQlxdWV1ZS0+dHhfY29weV9vcHNbKmNv
cHlfb3BzXS5zb3VyY2UudS5yZWYgPSB0eHJlcS5ncmVmOworCQkJcXVldWUtPnR4X2NvcHlfb3Bz
Wypjb3B5X29wc10uc291cmNlLmRvbWlkID0KKwkJCQlxdWV1ZS0+dmlmLT5kb21pZDsKKwkJCXF1
ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLnNvdXJjZS5vZmZzZXQgPQorCQkJCXR4cmVxLm9m
ZnNldCArIGRhdGFfbGVuIC0gZXh0cmFfbGVuOworCisJCQlxdWV1ZS0+dHhfY29weV9vcHNbKmNv
cHlfb3BzXS5kZXN0LnUuZ21mbiA9CisJCQkJdmlydF90b19nZm4oc2tiLT5kYXRhICsgZGF0YV9s
ZW4gLSBleHRyYV9sZW4pOworCQkJcXVldWUtPnR4X2NvcHlfb3BzWypjb3B5X29wc10uZGVzdC5k
b21pZCA9IERPTUlEX1NFTEY7CisJCQlxdWV1ZS0+dHhfY29weV9vcHNbKmNvcHlfb3BzXS5kZXN0
Lm9mZnNldCA9IDA7CisKKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLmxlbiA9IGV4
dHJhX2xlbjsKKwkJCXF1ZXVlLT50eF9jb3B5X29wc1sqY29weV9vcHNdLmZsYWdzID0gR05UQ09Q
WV9zb3VyY2VfZ3JlZjsKKworCQkJWEVOVklGX1RYX0NCKHNrYiktPmNvcGllcysrOworCQl9CiAK
IAkJKCpjb3B5X29wcykrKzsKIApAQCAtMTY3NCw1ICsxNzA2LDEwIEBAIHN0YXRpYyB2b2lkIF9f
ZXhpdCBuZXRiYWNrX2Zpbmkodm9pZCkKIH0KIG1vZHVsZV9leGl0KG5ldGJhY2tfZmluaSk7CiAK
K3N0YXRpYyB2b2lkIF9faW5pdCBfX21heWJlX3VudXNlZCBidWlsZF9hc3NlcnRpb25zKHZvaWQp
Cit7CisJQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgeGVudmlmX3R4X2NiKSA+IDQ4KTsKK30K
KwogTU9EVUxFX0xJQ0VOU0UoIkR1YWwgQlNEL0dQTCIpOwogTU9EVUxFX0FMSUFTKCJ4ZW4tYmFj
a2VuZDp2aWYiKTsKLS0gCjIuMTcuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
