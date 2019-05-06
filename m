Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8952144CB
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:00:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYn-0002Jo-Le; Mon, 06 May 2019 06:57:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYh-00026W-3w
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:07 +0000
X-Inumbo-ID: 26267acc-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 26267acc-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7FC76AF31;
 Mon,  6 May 2019 06:56:56 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:28 +0200
Message-Id: <20190506065644.7415-30-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 29/45] xen/sched: add runstate counters
 to struct sched_item
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
Cc: Juergen Gross <jgross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGNvdW50ZXJzIHRvIHN0cnVjdCBzY2hlZF9pdGVtIHN1bW1pbmcgdXAgcnVuc3RhdGVzIG9m
IGFzc29jaWF0ZWQKdmNwdXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+Ci0tLQpSRkMgVjI6IGFkZCBjb3VudGVycyBmb3IgZWFjaCBwb3NzaWJsZSBydW5z
dGF0ZQotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgIHwgNiArKysrKysKIHhlbi9pbmNsdWRl
L3hlbi9zY2hlZC5oIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMK
aW5kZXggYmMwNTU0ZjJkYS4uNjc4NzFiNjYxOCAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9zY2hl
ZHVsZS5jCisrKyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpAQCAtMTc0LDYgKzE3NCw3IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCB2Y3B1X3J1bnN0YXRlX2NoYW5nZSgKICAgICBzdHJ1Y3QgdmNwdSAq
diwgaW50IG5ld19zdGF0ZSwgc190aW1lX3QgbmV3X2VudHJ5X3RpbWUpCiB7CiAgICAgc190aW1l
X3QgZGVsdGE7CisgICAgc3RydWN0IHNjaGVkX2l0ZW0gKml0ZW0gPSB2LT5zY2hlZF9pdGVtOwog
CiAgICAgQVNTRVJUKHYtPnJ1bnN0YXRlLnN0YXRlICE9IG5ld19zdGF0ZSk7CiAgICAgQVNTRVJU
KHNwaW5faXNfbG9ja2VkKHBlcl9jcHUoc2NoZWRfcmVzLCB2LT5wcm9jZXNzb3IpLT5zY2hlZHVs
ZV9sb2NrKSk7CkBAIC0xODIsNiArMTgzLDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHZjcHVfcnVu
c3RhdGVfY2hhbmdlKAogCiAgICAgdHJhY2VfcnVuc3RhdGVfY2hhbmdlKHYsIG5ld19zdGF0ZSk7
CiAKKyAgICBpdGVtLT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3RhdGVdLS07CisgICAgaXRl
bS0+cnVuc3RhdGVfY250W25ld19zdGF0ZV0rKzsKKwogICAgIGRlbHRhID0gbmV3X2VudHJ5X3Rp
bWUgLSB2LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lOwogICAgIGlmICggZGVsdGEgPiAwICkK
ICAgICB7CkBAIC0zNTksNiArMzYzLDggQEAgaW50IHNjaGVkX2luaXRfdmNwdShzdHJ1Y3QgdmNw
dSAqdikKICAgICBpZiAoIChpdGVtID0gc2NoZWRfYWxsb2NfaXRlbSh2KSkgPT0gTlVMTCApCiAg
ICAgICAgIHJldHVybiAxOwogCisgICAgaXRlbS0+cnVuc3RhdGVfY250W3YtPnJ1bnN0YXRlLnN0
YXRlXSsrOworCiAgICAgaWYgKCBpc19pZGxlX2RvbWFpbihkKSApCiAgICAgICAgIHByb2Nlc3Nv
ciA9IHYtPnZjcHVfaWQ7CiAgICAgZWxzZQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3Nj
aGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCA4MDUyZjk4NzgwLi41NzE2MzFm
MjE3IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5jbHVk
ZS94ZW4vc2NoZWQuaApAQCAtMjcyLDYgKzI3Miw4IEBAIHN0cnVjdCBzY2hlZF9pdGVtIHsKICAg
ICB1aW50NjRfdCAgICAgICAgICAgICAgIGxhc3RfcnVuX3RpbWU7CiAgICAgLyogTGFzdCB0aW1l
IGl0ZW0gZ290IChkZS0pc2NoZWR1bGVkLiAqLwogICAgIHVpbnQ2NF90ICAgICAgICAgICAgICAg
c3RhdGVfZW50cnlfdGltZTsKKyAgICAvKiBWY3B1IHN0YXRlIHN1bW1hcnkuICovCisgICAgdW5z
aWduZWQgaW50ICAgICAgICAgICBydW5zdGF0ZV9jbnRbNF07CiAKICAgICAvKiBDdXJyZW50bHkg
cnVubmluZyBvbiBhIENQVT8gKi8KICAgICBib29sICAgICAgICAgICAgICAgICAgIGlzX3J1bm5p
bmc7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
