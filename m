Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD47A6AD6E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jul 2019 19:10:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnQuL-0005nE-Pj; Tue, 16 Jul 2019 17:06:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=v+lg=VN=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1hnQuK-0005n2-Jb
 for xen-devel@lists.xenproject.org; Tue, 16 Jul 2019 17:06:28 +0000
X-Inumbo-ID: 0bea4cb3-a7ec-11e9-8980-bc764e045a96
Received: from mx01.bbu.dsd.mx.bitdefender.com (unknown [91.199.104.161])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0bea4cb3-a7ec-11e9-8980-bc764e045a96;
 Tue, 16 Jul 2019 17:06:27 +0000 (UTC)
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 CC961305FFA0; Tue, 16 Jul 2019 20:06:25 +0300 (EEST)
Received: from bitdefender.com (unknown [195.189.155.70])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id BDFDA305B7B4;
 Tue, 16 Jul 2019 20:06:25 +0300 (EEST)
From: Petre Pircalabu <ppircalabu@bitdefender.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 16 Jul 2019 20:06:17 +0300
Message-Id: <c7e5c600bbe00646d35eb3fa65b1894f7146e0df.1563293545.git.ppircalabu@bitdefender.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563293545.git.ppircalabu@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
In-Reply-To: <cover.1563293545.git.ppircalabu@bitdefender.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
Subject: [Xen-devel] [PATCH v2 03/10] vm_event: Add 'struct domain'
 backpointer to vm_event_domain.
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
Cc: Petre Pircalabu <ppircalabu@bitdefender.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Alexandru Isaila <aisaila@bitdefender.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U2lnbmVkLW9mZi1ieTogUGV0cmUgUGlyY2FsYWJ1IDxwcGlyY2FsYWJ1QGJpdGRlZmVuZGVyLmNv
bT4KLS0tCiB4ZW4vY29tbW9uL3ZtX2V2ZW50LmMgICB8IDIgKysKIHhlbi9pbmNsdWRlL3hlbi9z
Y2hlZC5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS94ZW4vY29tbW9uL3ZtX2V2ZW50LmMgYi94ZW4vY29tbW9uL3ZtX2V2ZW50LmMKaW5kZXgg
NTE1YTkxNy4uNzg3YzYxYyAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi92bV9ldmVudC5jCisrKyBi
L3hlbi9jb21tb24vdm1fZXZlbnQuYwpAQCAtNzEsNiArNzEsOCBAQCBzdGF0aWMgaW50IHZtX2V2
ZW50X2VuYWJsZSgKICAgICBpZiAoIHJjIDwgMCApCiAgICAgICAgIGdvdG8gZXJyOwogCisgICAg
dmVkLT5kID0gZDsKKwogICAgIHJjID0gcHJlcGFyZV9yaW5nX2Zvcl9oZWxwZXIoZCwgcmluZ19n
Zm4sICZ2ZWQtPnJpbmdfcGdfc3RydWN0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJnZlZC0+cmluZ19wYWdlKTsKICAgICBpZiAoIHJjIDwgMCApCmRpZmYgLS1naXQgYS94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDk3YTNh
YjUuLmUzMDkzZDMgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hl
bi9pbmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0yNzksNiArMjc5LDggQEAgc3RydWN0IHZjcHUKIC8q
IFZNIGV2ZW50ICovCiBzdHJ1Y3Qgdm1fZXZlbnRfZG9tYWluCiB7CisgICAgLyogRG9tYWluIHJl
ZmVyZW5jZSAqLworICAgIHN0cnVjdCBkb21haW4gKmQ7CiAgICAgc3BpbmxvY2tfdCBsb2NrOwog
ICAgIC8qIFRoZSByaW5nIGhhcyA2NCBlbnRyaWVzICovCiAgICAgdW5zaWduZWQgY2hhciBmb3Jl
aWduX3Byb2R1Y2VyczsKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
