Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDF5BFFA1
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 09:04:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDkGG-0003tu-97; Fri, 27 Sep 2019 07:01:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Rbpq=XW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iDkGE-0003r5-8u
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 07:01:50 +0000
X-Inumbo-ID: 91f76ebb-e0f4-11e9-966c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 91f76ebb-e0f4-11e9-966c-12813bfff9fa;
 Fri, 27 Sep 2019 07:01:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F01A8B179;
 Fri, 27 Sep 2019 07:01:01 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 09:00:29 +0200
Message-Id: <20190927070050.12405-26-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190927070050.12405-1-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v4 25/46] xen/sched: add runstate counters to
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
IHJ1bnN0YXRlCi0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgfCA1ICsrKysrCiB4ZW4vaW5j
bHVkZS94ZW4vc2NoZWQuaCB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5jIGIveGVuL2NvbW1vbi9zY2hlZHVs
ZS5jCmluZGV4IGRjNjhjYjkxMmUuLjc3MmRlOGRlOTYgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24v
c2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxlLmMKQEAgLTI0Niw2ICsyNDYsNyBA
QCBzdGF0aWMgaW5saW5lIHZvaWQgdmNwdV9ydW5zdGF0ZV9jaGFuZ2UoCiAgICAgc3RydWN0IHZj
cHUgKnYsIGludCBuZXdfc3RhdGUsIHNfdGltZV90IG5ld19lbnRyeV90aW1lKQogewogICAgIHNf
dGltZV90IGRlbHRhOworICAgIHN0cnVjdCBzY2hlZF91bml0ICp1bml0ID0gdi0+c2NoZWRfdW5p
dDsKIAogICAgIEFTU0VSVCh2LT5ydW5zdGF0ZS5zdGF0ZSAhPSBuZXdfc3RhdGUpOwogICAgIEFT
U0VSVChzcGluX2lzX2xvY2tlZChnZXRfc2NoZWRfcmVzKHYtPnByb2Nlc3NvciktPnNjaGVkdWxl
X2xvY2spKTsKQEAgLTI1NCw2ICsyNTUsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdmNwdV9ydW5z
dGF0ZV9jaGFuZ2UoCiAKICAgICB0cmFjZV9ydW5zdGF0ZV9jaGFuZ2UodiwgbmV3X3N0YXRlKTsK
IAorICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0tLTsKKyAgICB1bml0
LT5ydW5zdGF0ZV9jbnRbbmV3X3N0YXRlXSsrOworCiAgICAgZGVsdGEgPSBuZXdfZW50cnlfdGlt
ZSAtIHYtPnJ1bnN0YXRlLnN0YXRlX2VudHJ5X3RpbWU7CiAgICAgaWYgKCBkZWx0YSA+IDAgKQog
ICAgIHsKQEAgLTM3OCw2ICszODIsNyBAQCBzdGF0aWMgc3RydWN0IHNjaGVkX3VuaXQgKnNjaGVk
X2FsbG9jX3VuaXQoc3RydWN0IHZjcHUgKnYpCiAgICAgdW5pdC0+dmNwdV9saXN0ID0gdjsKICAg
ICB1bml0LT51bml0X2lkID0gdi0+dmNwdV9pZDsKICAgICB1bml0LT5kb21haW4gPSBkOworICAg
IHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0rKzsKIAogICAgIGZvciAoIHBy
ZXZfdW5pdCA9ICZkLT5zY2hlZF91bml0X2xpc3Q7ICpwcmV2X3VuaXQ7CiAgICAgICAgICAgcHJl
dl91bml0ID0gJigqcHJldl91bml0KS0+bmV4dF9pbl9saXN0ICkKZGlmZiAtLWdpdCBhL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggNmRlOWRk
YWFhOS4uOTIyNzIyNTZlYSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysr
IGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKQEAgLTI3Nyw2ICsyNzcsOCBAQCBzdHJ1Y3Qgc2No
ZWRfdW5pdCB7CiAKICAgICAvKiBMYXN0IHRpbWUgdW5pdCBnb3QgKGRlLSlzY2hlZHVsZWQuICov
CiAgICAgdWludDY0X3QgICAgICAgICAgICAgICBzdGF0ZV9lbnRyeV90aW1lOworICAgIC8qIFZj
cHUgc3RhdGUgc3VtbWFyeS4gKi8KKyAgICB1bnNpZ25lZCBpbnQgICAgICAgICAgIHJ1bnN0YXRl
X2NudFs0XTsKIAogICAgIC8qIEJpdG1hc2sgb2YgQ1BVcyBvbiB3aGljaCB0aGlzIFZDUFUgbWF5
IHJ1bi4gKi8KICAgICBjcHVtYXNrX3Zhcl90ICAgICAgICAgIGNwdV9oYXJkX2FmZmluaXR5Owot
LSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
