Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B58732C454
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:35:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQ6-0004c7-Af; Tue, 28 May 2019 10:33:26 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ3-0004Z6-Oy
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:23 +0000
X-Inumbo-ID: 0406d6a0-8134-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0406d6a0-8134-11e9-8980-bc764e045a96;
 Tue, 28 May 2019 10:33:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE941AE8D;
 Tue, 28 May 2019 10:33:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:29 +0200
Message-Id: <20190528103313.1343-17-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 16/60] xen/sched: add id to struct sched_unit
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

QWRkIGFuIGlkZW50aWZpZXIgdG8gc2NoZWRfdW5pdC4gRm9yIG5vdyBpdCB3aWxsIGJlIHRoZSBz
YW1lIGFzIHRoZQpyZWxhdGVkIHZjcHVfaWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZHVsZS5jICAgfCAzICsrLQog
eGVuL2luY2x1ZGUveGVuL3NjaGVkLmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2NvbW1vbi9zY2hlZHVsZS5j
IGIveGVuL2NvbW1vbi9zY2hlZHVsZS5jCmluZGV4IDYxYzhlMTI1MmYuLmQxYzcwNjE4NmYgMTAw
NjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWR1bGUuYworKysgYi94ZW4vY29tbW9uL3NjaGVkdWxl
LmMKQEAgLTI4OSwxMiArMjg5LDEzIEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfdW5pdCAqc2NoZWRf
YWxsb2NfdW5pdChzdHJ1Y3QgdmNwdSAqdikKIAogICAgIHYtPnNjaGVkX3VuaXQgPSB1bml0Owog
ICAgIHVuaXQtPnZjcHUgPSB2OworICAgIHVuaXQtPnVuaXRfaWQgPSB2LT52Y3B1X2lkOwogICAg
IHVuaXQtPmRvbWFpbiA9IGQ7CiAKICAgICBmb3IgKCBwcmV2X3VuaXQgPSAmZC0+c2NoZWRfdW5p
dF9saXN0OyAqcHJldl91bml0OwogICAgICAgICAgIHByZXZfdW5pdCA9ICYoKnByZXZfdW5pdCkt
Pm5leHRfaW5fbGlzdCApCiAgICAgICAgIGlmICggKCpwcmV2X3VuaXQpLT5uZXh0X2luX2xpc3Qg
JiYKLSAgICAgICAgICAgICAoKnByZXZfdW5pdCktPm5leHRfaW5fbGlzdC0+dmNwdS0+dmNwdV9p
ZCA+IHYtPnZjcHVfaWQgKQorICAgICAgICAgICAgICgqcHJldl91bml0KS0+bmV4dF9pbl9saXN0
LT51bml0X2lkID4gdW5pdC0+dW5pdF9pZCApCiAgICAgICAgICAgICBicmVhazsKIAogICAgIHVu
aXQtPm5leHRfaW5fbGlzdCA9ICpwcmV2X3VuaXQ7CmRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS94
ZW4vc2NoZWQuaCBiL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCmluZGV4IDBiOTI3ZmRkNTUuLmM3
NmI4MWViZWYgMTAwNjQ0Ci0tLSBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oCisrKyBiL3hlbi9p
bmNsdWRlL3hlbi9zY2hlZC5oCkBAIC0yNjYsNiArMjY2LDcgQEAgc3RydWN0IHNjaGVkX3VuaXQg
ewogICAgIHZvaWQgICAgICAgICAgICAgICAgICAqcHJpdjsgICAgICAvKiBzY2hlZHVsZXIgcHJp
dmF0ZSBkYXRhICovCiAgICAgc3RydWN0IHNjaGVkX3VuaXQgICAgICpuZXh0X2luX2xpc3Q7CiAg
ICAgc3RydWN0IHNjaGVkX3Jlc291cmNlICpyZXM7CisgICAgaW50ICAgICAgICAgICAgICAgICAg
ICB1bml0X2lkOwogCiAgICAgLyogTGFzdCB0aW1lIHdoZW4gdW5pdCBoYXMgYmVlbiBzY2hlZHVs
ZWQgb3V0LiAqLwogICAgIHVpbnQ2NF90ICAgICAgICAgICAgICAgbGFzdF9ydW5fdGltZTsKLS0g
CjIuMTYuNAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
