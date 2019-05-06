Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5CD144BC
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 08:59:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYZ-0001uR-5U; Mon, 06 May 2019 06:56:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYX-0001tK-7o
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:56:57 +0000
X-Inumbo-ID: 2278dfa2-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2278dfa2-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:56:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6B42BAEFE;
 Mon,  6 May 2019 06:56:52 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:12 +0200
Message-Id: <20190506065644.7415-14-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 13/45] xen/sched: add domain pointer to
 struct sched_item
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

QWRkIGEgcG9pbnRlciB0byB0aGUgZG9tYWluIHRvIHN0cnVjdCBzY2hlZF9pdGVtIGluIG9yZGVy
IHRvIGF2b2lkCmhhdmluZyB0byBkZXJlZmVyZW5jZSB0aGUgdmNwdSBwb2ludGVyIG9mIHN0cnVj
dCBzY2hlZF9pdGVtIHRvIGZpbmQKdGhlIHJlbGF0ZWQgZG9tYWluLgoKU2lnbmVkLW9mZi1ieTog
SnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgotLS0KIHhlbi9jb21tb24vc2NoZWR1bGUu
YyAgIHwgMyArKy0KIHhlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIHwgMSArCiAyIGZpbGVzIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21t
b24vc2NoZWR1bGUuYyBiL3hlbi9jb21tb24vc2NoZWR1bGUuYwppbmRleCBkNTZkYzU2N2FjLi41
M2FhYzEwN2UxIDEwMDY0NAotLS0gYS94ZW4vY29tbW9uL3NjaGVkdWxlLmMKKysrIGIveGVuL2Nv
bW1vbi9zY2hlZHVsZS5jCkBAIC0yNTMsNyArMjUzLDcgQEAgc3RhdGljIHZvaWQgc2NoZWRfc3Bp
bl91bmxvY2tfZG91YmxlKHNwaW5sb2NrX3QgKmxvY2sxLCBzcGlubG9ja190ICpsb2NrMiwKIHN0
YXRpYyB2b2lkIHNjaGVkX2ZyZWVfaXRlbShzdHJ1Y3Qgc2NoZWRfaXRlbSAqaXRlbSkKIHsKICAg
ICBzdHJ1Y3Qgc2NoZWRfaXRlbSAqcHJldl9pdGVtOwotICAgIHN0cnVjdCBkb21haW4gKmQgPSBp
dGVtLT52Y3B1LT5kb21haW47CisgICAgc3RydWN0IGRvbWFpbiAqZCA9IGl0ZW0tPmRvbWFpbjsK
IAogICAgIGlmICggZC0+c2NoZWRfaXRlbV9saXN0ID09IGl0ZW0gKQogICAgICAgICBkLT5zY2hl
ZF9pdGVtX2xpc3QgPSBpdGVtLT5uZXh0X2luX2xpc3Q7CkBAIC0yODksNiArMjg5LDcgQEAgc3Rh
dGljIHN0cnVjdCBzY2hlZF9pdGVtICpzY2hlZF9hbGxvY19pdGVtKHN0cnVjdCB2Y3B1ICp2KQog
CiAgICAgdi0+c2NoZWRfaXRlbSA9IGl0ZW07CiAgICAgaXRlbS0+dmNwdSA9IHY7CisgICAgaXRl
bS0+ZG9tYWluID0gZDsKIAogICAgIGZvciAoIHByZXZfaXRlbSA9ICZkLT5zY2hlZF9pdGVtX2xp
c3Q7ICpwcmV2X2l0ZW07CiAgICAgICAgICAgcHJldl9pdGVtID0gJigqcHJldl9pdGVtKS0+bmV4
dF9pbl9saXN0ICkKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9zY2hlZC5oIGIveGVuL2lu
Y2x1ZGUveGVuL3NjaGVkLmgKaW5kZXggYjQzZjVmMzY2Mi4uODNkNzY0NjA4OCAxMDA2NDQKLS0t
IGEveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL3NjaGVkLmgK
QEAgLTI2MSw2ICsyNjEsNyBAQCBzdHJ1Y3QgdmNwdQogc3RydWN0IHNjaGVkX3Jlc291cmNlOwog
CiBzdHJ1Y3Qgc2NoZWRfaXRlbSB7CisgICAgc3RydWN0IGRvbWFpbiAgICAgICAgICpkb21haW47
CiAgICAgc3RydWN0IHZjcHUgICAgICAgICAgICp2Y3B1OwogICAgIHZvaWQgICAgICAgICAgICAg
ICAgICAqcHJpdjsgICAgICAvKiBzY2hlZHVsZXIgcHJpdmF0ZSBkYXRhICovCiAgICAgc3RydWN0
IHNjaGVkX2l0ZW0gICAgICpuZXh0X2luX2xpc3Q7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
