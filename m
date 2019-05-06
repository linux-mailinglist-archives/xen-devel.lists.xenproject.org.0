Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0275144D4
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 09:00:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNXYg-00024q-KI; Mon, 06 May 2019 06:57:06 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=XZcu=TG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNXYd-0001yH-95
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 06:57:03 +0000
X-Inumbo-ID: 2508aaf4-6fcc-11e9-843c-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2508aaf4-6fcc-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 06:57:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DE197AF24;
 Mon,  6 May 2019 06:56:54 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon,  6 May 2019 08:56:22 +0200
Message-Id: <20190506065644.7415-24-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190506065644.7415-1-jgross@suse.com>
References: <20190506065644.7415-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH RFC V2 23/45] xen: add sched_item_pause_nosync()
 and sched_item_unpause()
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

VGhlIGNyZWRpdCBzY2hlZHVsZXIgY2FsbHMgdmNwdV9wYXVzZV9ub3N5bmMoKSBhbmQgdmNwdV91
bnBhdXNlKCkKdG9kYXkuIEFkZCBzY2hlZF9pdGVtX3BhdXNlX25vc3luYygpIGFuZCBzY2hlZF9p
dGVtX3VucGF1c2UoKSB0bwpwZXJmb3JtIHRoZSBzYW1lIG9wZXJhdGlvbnMgb24gc2NoZWR1bGVy
IGl0ZW1zIGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+Ci0tLQogeGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYyAgfCAgNiArKystLS0KIHhlbi9p
bmNsdWRlL3hlbi9zY2hlZC1pZi5oIHwgMTAgKysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
c2NoZWRfY3JlZGl0LmMgYi94ZW4vY29tbW9uL3NjaGVkX2NyZWRpdC5jCmluZGV4IGJhYmNjYjY5
ZjcuLjlkYjVjM2ZjNzEgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vc2NoZWRfY3JlZGl0LmMKKysr
IGIveGVuL2NvbW1vbi9zY2hlZF9jcmVkaXQuYwpAQCAtMTA4MCw3ICsxMDgwLDcgQEAgY3NjaGVk
X2l0ZW1fcmVtb3ZlKGNvbnN0IHN0cnVjdCBzY2hlZHVsZXIgKm9wcywgc3RydWN0IHNjaGVkX2l0
ZW0gKml0ZW0pCiAgICAgaWYgKCB0ZXN0X2FuZF9jbGVhcl9iaXQoQ1NDSEVEX0ZMQUdfSVRFTV9Q
QVJLRUQsICZzdmMtPmZsYWdzKSApCiAgICAgewogICAgICAgICBTQ0hFRF9TVEFUX0NSQU5LKGl0
ZW1fdW5wYXJrKTsKLSAgICAgICAgdmNwdV91bnBhdXNlKHN2Yy0+aXRlbS0+dmNwdSk7CisgICAg
ICAgIHNjaGVkX2l0ZW1fdW5wYXVzZShzdmMtPml0ZW0pOwogICAgIH0KIAogICAgIHNwaW5fbG9j
a19pcnEoJnBydi0+bG9jayk7CkBAIC0xNTMwLDcgKzE1MzAsNyBAQCBjc2NoZWRfYWNjdCh2b2lk
KiBkdW1teSkKICAgICAgICAgICAgICAgICAgICAgICF0ZXN0X2FuZF9zZXRfYml0KENTQ0hFRF9G
TEFHX0lURU1fUEFSS0VELCAmc3ZjLT5mbGFncykgKQogICAgICAgICAgICAgICAgIHsKICAgICAg
ICAgICAgICAgICAgICAgU0NIRURfU1RBVF9DUkFOSyhpdGVtX3BhcmspOwotICAgICAgICAgICAg
ICAgICAgICB2Y3B1X3BhdXNlX25vc3luYyhzdmMtPml0ZW0tPnZjcHUpOworICAgICAgICAgICAg
ICAgICAgICBzY2hlZF9pdGVtX3BhdXNlX25vc3luYyhzdmMtPml0ZW0pOwogICAgICAgICAgICAg
ICAgIH0KIAogICAgICAgICAgICAgICAgIC8qIExvd2VyIGJvdW5kIG9uIGNyZWRpdHMgKi8KQEAg
LTE1NTQsNyArMTU1NCw3IEBAIGNzY2hlZF9hY2N0KHZvaWQqIGR1bW15KQogICAgICAgICAgICAg
ICAgICAgICAgKiBpZiBpdCBpcyB3b2tlbiB1cCBoZXJlLgogICAgICAgICAgICAgICAgICAgICAg
Ki8KICAgICAgICAgICAgICAgICAgICAgU0NIRURfU1RBVF9DUkFOSyhpdGVtX3VucGFyayk7Ci0g
ICAgICAgICAgICAgICAgICAgIHZjcHVfdW5wYXVzZShzdmMtPml0ZW0tPnZjcHUpOworICAgICAg
ICAgICAgICAgICAgICBzY2hlZF9pdGVtX3VucGF1c2Uoc3ZjLT5pdGVtKTsKICAgICAgICAgICAg
ICAgICB9CiAKICAgICAgICAgICAgICAgICAvKiBVcHBlciBib3VuZCBvbiBjcmVkaXRzIG1lYW5z
IElURU0gc3RvcHMgZWFybmluZyAqLwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUveGVuL3NjaGVk
LWlmLmggYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAppbmRleCAyOTUxMDFmOWVmLi42NWUy
YzNiYmE4IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQtaWYuaAorKysgYi94ZW4v
aW5jbHVkZS94ZW4vc2NoZWQtaWYuaApAQCAtNDUxLDYgKzQ1MSwxNiBAQCBzdGF0aWMgaW5saW5l
IGludCBzY2hlZF9hZGp1c3RfY3B1cG9vbChjb25zdCBzdHJ1Y3Qgc2NoZWR1bGVyICpzLAogICAg
ICAgICByZXR1cm4gMDsKIH0KIAorc3RhdGljIGlubGluZSB2b2lkIHNjaGVkX2l0ZW1fcGF1c2Vf
bm9zeW5jKHN0cnVjdCBzY2hlZF9pdGVtICppdGVtKQoreworICAgIHZjcHVfcGF1c2Vfbm9zeW5j
KGl0ZW0tPnZjcHUpOworfQorCitzdGF0aWMgaW5saW5lIHZvaWQgc2NoZWRfaXRlbV91bnBhdXNl
KHN0cnVjdCBzY2hlZF9pdGVtICppdGVtKQoreworICAgIHZjcHVfdW5wYXVzZShpdGVtLT52Y3B1
KTsKK30KKwogI2RlZmluZSBSRUdJU1RFUl9TQ0hFRFVMRVIoeCkgc3RhdGljIGNvbnN0IHN0cnVj
dCBzY2hlZHVsZXIgKngjI19lbnRyeSBcCiAgIF9fdXNlZF9zZWN0aW9uKCIuZGF0YS5zY2hlZHVs
ZXJzIikgPSAmeDsKIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
