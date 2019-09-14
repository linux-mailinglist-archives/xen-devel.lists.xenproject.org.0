Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DEEB2AB1
	for <lists+xen-devel@lfdr.de>; Sat, 14 Sep 2019 10:57:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i93ou-0000kb-4J; Sat, 14 Sep 2019 08:54:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=rDpt=XJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1i93or-0000gv-Ml
 for xen-devel@lists.xenproject.org; Sat, 14 Sep 2019 08:54:13 +0000
X-Inumbo-ID: 10284566-d6cd-11e9-95c1-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 10284566-d6cd-11e9-95c1-12813bfff9fa;
 Sat, 14 Sep 2019 08:53:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 78582B66F;
 Sat, 14 Sep 2019 08:53:02 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Sat, 14 Sep 2019 10:52:29 +0200
Message-Id: <20190914085251.18816-26-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190914085251.18816-1-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 25/47] xen/sched: add runstate counters to
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
IGFzc29jaWF0ZWQKdmNwdXMuIFRoaXMgYWxsb3dzIGRvaW5nIHF1aWNrIGNoZWNrcyB3aGV0aGVy
IGEgdW5pdCBoYXMgYW55IHZjcHUKcnVubmluZyBvciB3aGV0aGVyIG9ubHkgYSBzaW5nbGUgdmNw
dSBvZiBhIHVuaXQgaXMgcnVubmluZy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KLS0tClJGQyBWMjogYWRkIGNvdW50ZXJzIGZvciBlYWNoIHBvc3NpYmxl
IHJ1bnN0YXRlCi0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgfCA4ICsrKysrKystCiB4ZW4v
aW5jbHVkZS94ZW4vc2NoZWQuaCB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIv
eGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDdiMzc0NjFkYjkuLjBiZDlmMGQyNzggMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMK
QEAgLTIzOSw2ICsyMzksNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmNwdV9ydW5zdGF0ZV9jaGFu
Z2UoCiAgICAgc3RydWN0IHZjcHUgKnYsIGludCBuZXdfc3RhdGUsIHNfdGltZV90IG5ld19lbnRy
eV90aW1lKQogewogICAgIHNfdGltZV90IGRlbHRhOworICAgIHN0cnVjdCBzY2hlZF91bml0ICp1
bml0ID0gdi0+c2NoZWRfdW5pdDsKIAogICAgIEFTU0VSVCh2LT5ydW5zdGF0ZS5zdGF0ZSAhPSBu
ZXdfc3RhdGUpOwogICAgIEFTU0VSVChzcGluX2lzX2xvY2tlZChnZXRfc2NoZWRfcmVzKHYtPnBy
b2Nlc3NvciktPnNjaGVkdWxlX2xvY2spKTsKQEAgLTI0Nyw2ICsyNDgsOSBAQCBzdGF0aWMgaW5s
aW5lIHZvaWQgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UoCiAKICAgICB0cmFjZV9ydW5zdGF0ZV9jaGFu
Z2UodiwgbmV3X3N0YXRlKTsKIAorICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5z
dGF0ZV0tLTsKKyAgICB1bml0LT5ydW5zdGF0ZV9jbnRbbmV3X3N0YXRlXSsrOworCiAgICAgZGVs
dGEgPSBuZXdfZW50cnlfdGltZSAtIHYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWU7CiAgICAg
aWYgKCBkZWx0YSA+IDAgKQogICAgIHsKQEAgLTM2OCw3ICszNzIsNyBAQCBzdGF0aWMgc3RydWN0
IHNjaGVkX3VuaXQgKnNjaGVkX2FsbG9jX3VuaXQoc3RydWN0IHZjcHUgKnYpCiAgICAgdW5pdC0+
dmNwdV9saXN0ID0gdjsKICAgICB1bml0LT51bml0X2lkID0gdi0+dmNwdV9pZDsKICAgICB1bml0
LT5kb21haW4gPSBkOwotICAgIHYtPnNjaGVkX3VuaXQgPSB1bml0OworICAgIHVuaXQtPnJ1bnN0
YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0rKzsKIAogICAgIGZvciAoIHByZXZfdW5pdCA9ICZk
LT5zY2hlZF91bml0X2xpc3Q7ICpwcmV2X3VuaXQ7CiAgICAgICAgICAgcHJldl91bml0ID0gJigq
cHJldl91bml0KS0+bmV4dF9pbl9saXN0ICkKQEAgLTM4NCw2ICszODgsOCBAQCBzdGF0aWMgc3Ry
dWN0IHNjaGVkX3VuaXQgKnNjaGVkX2FsbG9jX3VuaXQoc3RydWN0IHZjcHUgKnYpCiAgICAgICAg
ICAhemFsbG9jX2NwdW1hc2tfdmFyKCZ1bml0LT5jcHVfc29mdF9hZmZpbml0eSkgKQogICAgICAg
ICBnb3RvIGZhaWw7CiAKKyAgICB2LT5zY2hlZF91bml0ID0gdW5pdDsKKwogICAgIHJldHVybiB1
bml0OwogCiAgZmFpbDoKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVu
L2luY2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggNTZlZDg2M2IwOC4uMzYyNTdhMDZmZSAxMDA2NDQK
LS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVk
LmgKQEAgLTI3Nyw2ICsyNzcsOCBAQCBzdHJ1Y3Qgc2NoZWRfdW5pdCB7CiAKICAgICAvKiBMYXN0
IHRpbWUgdW5pdCBnb3QgKGRlLSlzY2hlZHVsZWQuICovCiAgICAgdWludDY0X3QgICAgICAgICAg
ICAgICBzdGF0ZV9lbnRyeV90aW1lOworICAgIC8qIFZjcHUgc3RhdGUgc3VtbWFyeS4gKi8KKyAg
ICB1bnNpZ25lZCBpbnQgICAgICAgICAgIHJ1bnN0YXRlX2NudFs0XTsKIAogICAgIC8qIEJpdG1h
c2sgb2YgQ1BVcyBvbiB3aGljaCB0aGlzIFZDUFUgbWF5IHJ1bi4gKi8KICAgICBjcHVtYXNrX3Zh
cl90ICAgICAgICAgIGNwdV9oYXJkX2FmZmluaXR5OwotLSAKMi4xNi40CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlz
dApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
