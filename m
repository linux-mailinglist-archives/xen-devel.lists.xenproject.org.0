Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E42C479
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:36:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQd-0005iZ-6H; Tue, 28 May 2019 10:33:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQC-0004p0-GB
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:32 +0000
X-Inumbo-ID: 0659eeb6-8134-11e9-995e-875d65010379
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0659eeb6-8134-11e9-995e-875d65010379;
 Tue, 28 May 2019 10:33:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7A29FB028;
 Tue, 28 May 2019 10:33:24 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:44 +0200
Message-Id: <20190528103313.1343-32-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 31/60] xen/sched: add runstate counters to
 struct sched_unit
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
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

QWRkIGNvdW50ZXJzIHRvIHN0cnVjdCBzY2hlZF91bml0IHN1bW1pbmcgdXAgcnVuc3RhdGVzIG9m
IGFzc29jaWF0ZWQKdmNwdXMuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NA
c3VzZS5jb20+Ci0tLQpSRkMgVjI6IGFkZCBjb3VudGVycyBmb3IgZWFjaCBwb3NzaWJsZSBydW5z
dGF0ZQotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUuYyAgIHwgNSArKysrKwogeGVuL2luY2x1ZGUv
eGVuL3NjaGVkLmggfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL3hlbi9jb21tb24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwpp
bmRleCA2M2M5YzBhOGZiLi5mZDBjYTFlMTM3IDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVk
dWxlLmMKKysrIGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCkBAIC0xNzQsNiArMTc0LDcgQEAgc3Rh
dGljIGlubGluZSB2b2lkIHZjcHVfcnVuc3RhdGVfY2hhbmdlKAogICAgIHN0cnVjdCB2Y3B1ICp2
LCBpbnQgbmV3X3N0YXRlLCBzX3RpbWVfdCBuZXdfZW50cnlfdGltZSkKIHsKICAgICBzX3RpbWVf
dCBkZWx0YTsKKyAgICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCA9IHYtPnNjaGVkX3VuaXQ7CiAK
ICAgICBBU1NFUlQodi0+cnVuc3RhdGUuc3RhdGUgIT0gbmV3X3N0YXRlKTsKICAgICBBU1NFUlQo
c3Bpbl9pc19sb2NrZWQoZ2V0X3NjaGVkX3Jlcyh2LT5wcm9jZXNzb3IpLT5zY2hlZHVsZV9sb2Nr
KSk7CkBAIC0xODIsNiArMTgzLDkgQEAgc3RhdGljIGlubGluZSB2b2lkIHZjcHVfcnVuc3RhdGVf
Y2hhbmdlKAogCiAgICAgdHJhY2VfcnVuc3RhdGVfY2hhbmdlKHYsIG5ld19zdGF0ZSk7CiAKKyAg
ICB1bml0LT5ydW5zdGF0ZV9jbnRbdi0+cnVuc3RhdGUuc3RhdGVdLS07CisgICAgdW5pdC0+cnVu
c3RhdGVfY250W25ld19zdGF0ZV0rKzsKKwogICAgIGRlbHRhID0gbmV3X2VudHJ5X3RpbWUgLSB2
LT5ydW5zdGF0ZS5zdGF0ZV9lbnRyeV90aW1lOwogICAgIGlmICggZGVsdGEgPiAwICkKICAgICB7
CkBAIC0zMDUsNiArMzA5LDcgQEAgc3RhdGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxv
Y191bml0KHN0cnVjdCB2Y3B1ICp2KQogICAgIHVuaXQtPnZjcHUgPSB2OwogICAgIHVuaXQtPnVu
aXRfaWQgPSB2LT52Y3B1X2lkOwogICAgIHVuaXQtPmRvbWFpbiA9IGQ7CisgICAgdW5pdC0+cnVu
c3RhdGVfY250W3YtPnJ1bnN0YXRlLnN0YXRlXSsrOwogCiAgICAgZm9yICggcHJldl91bml0ID0g
JmQtPnNjaGVkX3VuaXRfbGlzdDsgKnByZXZfdW5pdDsKICAgICAgICAgICBwcmV2X3VuaXQgPSAm
KCpwcmV2X3VuaXQpLT5uZXh0X2luX2xpc3QgKQpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAppbmRleCBiMTRkZmY2ZmM0Li42OWQz
YjMyYzdiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaAorKysgYi94ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaApAQCAtMjcyLDYgKzI3Miw4IEBAIHN0cnVjdCBzY2hlZF91bml0IHsK
ICAgICB1aW50NjRfdCAgICAgICAgICAgICAgIGxhc3RfcnVuX3RpbWU7CiAgICAgLyogTGFzdCB0
aW1lIHVuaXQgZ290IChkZS0pc2NoZWR1bGVkLiAqLwogICAgIHVpbnQ2NF90ICAgICAgICAgICAg
ICAgc3RhdGVfZW50cnlfdGltZTsKKyAgICAvKiBWY3B1IHN0YXRlIHN1bW1hcnkuICovCisgICAg
dW5zaWduZWQgaW50ICAgICAgICAgICBydW5zdGF0ZV9jbnRbNF07CiAKICAgICAvKiBDdXJyZW50
bHkgcnVubmluZyBvbiBhIENQVT8gKi8KICAgICBib29sICAgICAgICAgICAgICAgICAgIGlzX3J1
bm5pbmc7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
