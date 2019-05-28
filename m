Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0742C453
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2019 12:35:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVZQ9-0004io-NK; Tue, 28 May 2019 10:33:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=31/0=T4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVZQ5-0004bz-N2
 for xen-devel@lists.xenproject.org; Tue, 28 May 2019 10:33:25 +0000
X-Inumbo-ID: 03ff6e8e-8134-11e9-9e47-9f4e629b93b1
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 03ff6e8e-8134-11e9-9e47-9f4e629b93b1;
 Tue, 28 May 2019 10:33:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 85970B035;
 Tue, 28 May 2019 10:33:20 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 28 May 2019 12:32:28 +0200
Message-Id: <20190528103313.1343-16-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190528103313.1343-1-jgross@suse.com>
References: <20190528103313.1343-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH 15/60] xen/sched: add domain pointer to struct
 sched_unit
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

QWRkIGEgcG9pbnRlciB0byB0aGUgZG9tYWluIHRvIHN0cnVjdCBzY2hlZF91bml0IGluIG9yZGVy
IHRvIGF2b2lkCmhhdmluZyB0byBkZXJlZmVyZW5jZSB0aGUgdmNwdSBwb2ludGVyIG9mIHN0cnVj
dCBzY2hlZF91bml0IHRvIGZpbmQKdGhlIHJlbGF0ZWQgZG9tYWluLgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUu
YyAgIHwgMyArKy0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCA3OGQ5MTA4OTU2Li42
MWM4ZTEyNTJmIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2Nv
bW1vbi9zY2hlZHVsZS5jCkBAIC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIHZvaWQgc2NoZWRfc3Bp
bl91bmxvY2tfZG91YmxlKHNwaW5sb2NrX3QgKmxvY2sxLCBzcGlubG9ja190ICpsb2NrMiwKIHN0
YXRpYyB2b2lkIHNjaGVkX2ZyZWVfdW5pdChzdHJ1Y3Qgc2NoZWRfdW5pdCAqdW5pdCkKIHsKICAg
ICBzdHJ1Y3Qgc2NoZWRfdW5pdCAqcHJldl91bml0OwotICAgIHN0cnVjdCBkb21haW4gKmQgPSB1
bml0LT52Y3B1LT5kb21haW47CisgICAgc3RydWN0IGRvbWFpbiAqZCA9IHVuaXQtPmRvbWFpbjsK
IAogICAgIGlmICggZC0+c2NoZWRfdW5pdF9saXN0ID09IHVuaXQgKQogICAgICAgICBkLT5zY2hl
ZF91bml0X2xpc3QgPSB1bml0LT5uZXh0X2luX2xpc3Q7CkBAIC0yODksNiArMjg5LDcgQEAgc3Rh
dGljIHN0cnVjdCBzY2hlZF91bml0ICpzY2hlZF9hbGxvY191bml0KHN0cnVjdCB2Y3B1ICp2KQog
CiAgICAgdi0+c2NoZWRfdW5pdCA9IHVuaXQ7CiAgICAgdW5pdC0+dmNwdSA9IHY7CisgICAgdW5p
dC0+ZG9tYWluID0gZDsKIAogICAgIGZvciAoIHByZXZfdW5pdCA9ICZkLT5zY2hlZF91bml0X2xp
c3Q7ICpwcmV2X3VuaXQ7CiAgICAgICAgICAgcHJldl91bml0ID0gJigqcHJldl91bml0KS0+bmV4
dF9pbl9saXN0ICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggMTNjOTlhOTE5NC4uMGI5MjdmZGQ1NSAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgK
QEAgLTI2MSw2ICsyNjEsNyBAQCBzdHJ1Y3QgdmNwdQogc3RydWN0IHNjaGVkX3Jlc291cmNlOwog
CiBzdHJ1Y3Qgc2NoZWRfdW5pdCB7CisgICAgc3RydWN0IGRvbWFpbiAgICAgICAgICpkb21haW47
CiAgICAgc3RydWN0IHZjcHUgICAgICAgICAgICp2Y3B1OwogICAgIHZvaWQgICAgICAgICAgICAg
ICAgICAqcHJpdjsgICAgICAvKiBzY2hlZHVsZXIgcHJpdmF0ZSBkYXRhICovCiAgICAgc3RydWN0
IHNjaGVkX3VuaXQgICAgICpuZXh0X2luX2xpc3Q7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
