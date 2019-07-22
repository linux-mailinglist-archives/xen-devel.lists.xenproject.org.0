Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B2370BC2
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 23:42:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpg36-0003bm-AZ; Mon, 22 Jul 2019 21:40:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SK1b=VT=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hpg2v-0003FY-KM
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 21:40:37 +0000
X-Inumbo-ID: 56e18d9c-acc9-11e9-a3cc-5319c96131f2
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 56e18d9c-acc9-11e9-a3cc-5319c96131f2;
 Mon, 22 Jul 2019 21:40:35 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D1291597;
 Mon, 22 Jul 2019 14:40:35 -0700 (PDT)
Received: from e108454-lin.cambridge.arm.com (e108454-lin.cambridge.arm.com
 [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB1EA3F71F;
 Mon, 22 Jul 2019 14:40:34 -0700 (PDT)
From: Julien Grall <julien.grall@arm.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 22 Jul 2019 22:39:56 +0100
Message-Id: <20190722213958.5761-34-julien.grall@arm.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190722213958.5761-1-julien.grall@arm.com>
References: <20190722213958.5761-1-julien.grall@arm.com>
Subject: [Xen-devel] [PATCH v2 33/35] xen/arm32: head: Rework and document
 launch()
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
Cc: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Qm9vdCBDUFUgYW5kIHNlY29uZGFyeSBDUFVzIHdpbGwgdXNlIGRpZmZlcmVudCBlbnRyeSBwb2lu
dCB0byBDIGNvZGUuIEF0CnRoZSBtb21lbnQsIHRoZSBkZWNpc2lvbiBvbiB3aGljaCBlbnRyeSB0
byB1c2UgaXMgdGFrZW4gd2l0aGluIGxhdW5jaCgpLgoKSW4gb3JkZXIgdG8gYXZvaWQgdXNpbmcg
Y29uZGl0aW9uYWwgaW5zdHJ1Y3Rpb24gYW5kIG1ha2UgdGhlIGNhbGwKY2xlYXJlciwgbGF1bmNo
KCkgaXMgcmV3b3JrZWQgdG8gdGFrZSBpbiBwYXJhbWV0ZXJzIHRoZSBlbnRyeSBwb2ludCBhbmQg
aXRzCmFyZ3VtZW50cy4KCkxhc3RseSwgZG9jdW1lbnQgdGhlIGJlaGF2aW9yIGFuZCB0aGUgbWFp
biByZWdpc3RlcnMgdXNhZ2Ugd2l0aGluIHRoZQpmdW5jdGlvbi4KClNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgotLS0KICAgIENoYW5nZXMgaW4gdjI6
CiAgICAgICAgLSBQYXRjaCBhZGRlZAotLS0KIHhlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMgfCAz
NCArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMjQg
aW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJt
L2FybTMyL2hlYWQuUyBiL3hlbi9hcmNoL2FybS9hcm0zMi9oZWFkLlMKaW5kZXggZTBmOGMyZTBj
Yi4uNmQ1NWEyMTE5YSAxMDA2NDQKLS0tIGEveGVuL2FyY2gvYXJtL2FybTMyL2hlYWQuUworKysg
Yi94ZW4vYXJjaC9hcm0vYXJtMzIvaGVhZC5TCkBAIC0xNzAsNiArMTcwLDExIEBAIHByaW1hcnlf
c3dpdGNoZWQ6CiAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhl
IFVBUlQuICovCiAgICAgICAgIG1vdl93IHIxMSwgRUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MK
ICNlbmRpZgorICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCisgICAgICAgIC8qIFNldHVw
IHRoZSBhcmd1bWVudHMgZm9yIHN0YXJ0X3hlbiBhbmQganVtcCB0byBDIHdvcmxkICovCisgICAg
ICAgIG1vdiAgIHIwLCByMTAgICAgICAgICAgICAgICAgLyogcjAgOj0gUGh5c2ljYWwgb2Zmc2V0
ICovCisgICAgICAgIG1vdiAgIHIxLCByOCAgICAgICAgICAgICAgICAgLyogcjEgOj0gcGFkZHIo
RkRUKSAqLworICAgICAgICBsZHIgICByMiwgPXN0YXJ0X3hlbgogICAgICAgICBiICAgICBsYXVu
Y2gKIEVORFBST0Moc3RhcnQpCiAKQEAgLTIzNCw2ICsyMzksOSBAQCBzZWNvbmRhcnlfc3dpdGNo
ZWQ6CiAgICAgICAgIC8qIFVzZSBhIHZpcnR1YWwgYWRkcmVzcyB0byBhY2Nlc3MgdGhlIFVBUlQu
ICovCiAgICAgICAgIG1vdl93IHIxMSwgRUFSTFlfVUFSVF9WSVJUVUFMX0FERFJFU1MKICNlbmRp
ZgorICAgICAgICBQUklOVCgiLSBSZWFkeSAtXHJcbiIpCisgICAgICAgIC8qIEp1bXAgdG8gQyB3
b3JsZCAqLworICAgICAgICBsZHIgICByMiwgPXN0YXJ0X3NlY29uZGFyeQogICAgICAgICBiICAg
ICBsYXVuY2gKIEVORFBST0MoaW5pdF9zZWNvbmRhcnkpCiAKQEAgLTU3OCwxOSArNTg2LDI1IEBA
IHNldHVwX2ZpeG1hcDoKICAgICAgICAgbW92ICAgcGMsIGxyCiBFTkRQUk9DKHNldHVwX2ZpeG1h
cCkKIAorLyoKKyAqIFNldHVwIHRoZSBpbml0aWFsIHN0YWNrIGFuZCBqdW1wIHRvIHRoZSBDIHdv
cmxkCisgKgorICogSW5wdXRzOgorICogICByMCA6IEFyZ3VtZW50IDAgb2YgdGhlIEMgZnVuY3Rp
b24gdG8gY2FsbAorICogICByMSA6IEFyZ3VtZW50IDEgb2YgdGhlIEMgZnVuY3Rpb24gdG8gY2Fs
bAorICogICByMiA6IEMgZW50cnkgcG9pbnQKKyAqCisgKiBDbG9iYmVycyByMworICovCiBsYXVu
Y2g6Ci0gICAgICAgIFBSSU5UKCItIFJlYWR5IC1cclxuIikKLQotICAgICAgICBsZHIgICByMCwg
PWluaXRfZGF0YQotICAgICAgICBhZGQgICByMCwgI0lOSVRJTkZPX3N0YWNrICAgIC8qIEZpbmQg
dGhlIGJvb3QtdGltZSBzdGFjayAqLwotICAgICAgICBsZHIgICBzcCwgW3IwXQorICAgICAgICBs
ZHIgICByMywgPWluaXRfZGF0YQorICAgICAgICBhZGQgICByMywgI0lOSVRJTkZPX3N0YWNrICAg
IC8qIEZpbmQgdGhlIGJvb3QtdGltZSBzdGFjayAqLworICAgICAgICBsZHIgICBzcCwgW3IzXQog
ICAgICAgICBhZGQgICBzcCwgI1NUQUNLX1NJWkUgICAgICAgIC8qICh3aGljaCBncm93cyBkb3du
IGZyb20gdGhlIHRvcCkuICovCiAgICAgICAgIHN1YiAgIHNwLCAjQ1BVSU5GT19zaXplb2YgICAg
LyogTWFrZSByb29tIGZvciBDUFUgc2F2ZSByZWNvcmQgKi8KLSAgICAgICAgdGVxICAgcjEyLCAj
MAotICAgICAgICBtb3ZlcSByMCwgcjEwICAgICAgICAgICAgICAgIC8qIE1hcnNoYWwgYXJnczog
LSBwaHlzX29mZnNldCAqLwotICAgICAgICBtb3ZlcSByMSwgcjggICAgICAgICAgICAgICAgIC8q
ICAgICAgICAgICAgICAgLSBEVEIgYWRkcmVzcyAqLwotICAgICAgICBiZXEgICBzdGFydF94ZW4g
ICAgICAgICAgICAgIC8qIGFuZCBkaXNhcHBlYXIgaW50byB0aGUgbGFuZCBvZiBDICovCi0gICAg
ICAgIGIgICAgIHN0YXJ0X3NlY29uZGFyeSAgICAgICAgLyogKHRvIHRoZSBhcHByb3ByaWF0ZSBl
bnRyeSBwb2ludCkgKi8KKworICAgICAgICAvKiBKdW1wIHRvIEMgd29ybGQgKi8KKyAgICAgICBi
eCAgICByMgogRU5EUFJPQyhsYXVuY2gpCiAKIC8qIEZhaWwtc3RvcCAqLwotLSAKMi4xMS4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
