Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C61617A97
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 15:27:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOMYT-0000eY-Sd; Wed, 08 May 2019 13:24:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Ps6=TI=citrix.com=prvs=0248bffa7=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hOMYS-0000dg-5Z
 for xen-devel@lists.xenproject.org; Wed, 08 May 2019 13:24:16 +0000
X-Inumbo-ID: 914d4ca2-7194-11e9-9c8f-03198498a28f
Received: from SMTP03.CITRIX.COM (unknown [162.221.156.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 914d4ca2-7194-11e9-9c8f-03198498a28f;
 Wed, 08 May 2019 13:24:12 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,446,1549929600"; d="scan'208";a="85265426"
From: Paul Durrant <paul.durrant@citrix.com>
To: <xen-devel@lists.xenproject.org>
Date: Wed, 8 May 2019 14:24:03 +0100
Message-ID: <20190508132403.1454-6-paul.durrant@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190508132403.1454-1-paul.durrant@citrix.com>
References: <20190508132403.1454-1-paul.durrant@citrix.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH 5/5] iommu / pci: re-implement
 XEN_DOMCTL_get_device_group...
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
Cc: Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Li4uIHVzaW5nIHRoZSBuZXcgaW9tbXVfZ3JvdXAgaW5mcmFzdHJ1Y3R1cmUuCgpCZWNhdXNlICdz
aWJsaW5nJyBkZXZpY2VzIGFyZSBub3cgbWVtYmVycyBvZiB0aGUgc2FtZSBpb21tdV9ncm91cCwK
aW1wbGVtZW50IHRoZSBkb21jdGwgYnkgbG9va2luZyB1cCB0aGUgcmVsZXZhbnQgaW9tbXVfZ3Jv
dXAgYW5kIHdhbGtpbmcKdGhlIG1lbWJlcnNoaXAgbGlzdC4KClNpZ25lZC1vZmYtYnk6IFBhdWwg
RHVycmFudCA8cGF1bC5kdXJyYW50QGNpdHJpeC5jb20+Ci0tLQpDYzogSmFuIEJldWxpY2ggPGpi
ZXVsaWNoQHN1c2UuY29tPgotLS0KIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgfCA2
NSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogeGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMgICB8IDQ3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiB4
ZW4vaW5jbHVkZS94ZW4vaW9tbXUuaCAgICAgICAgIHwgIDIgKysKIDMgZmlsZXMgY2hhbmdlZCwg
NjcgaW5zZXJ0aW9ucygrKSwgNDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMK
aW5kZXggMTEzMTlmYmFhZS4uNDkxNDBjNjUyZSAxMDA2NDQKLS0tIGEveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvaW9tbXUuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCkBA
IC03MjksNiArNzI5LDcxIEBAIGludCBpb21tdV9ncm91cF9hc3NpZ24oc3RydWN0IHBjaV9kZXYg
KnBkZXYpCiAgICAgcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmlv
bW11X2dyb3VwX2xvb2t1cCh1aW50MTZfdCBzZWcsIHVpbnQ4X3QgYnVzLAorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQ4X3QgZGV2Zm4pCit7CisgICAg
dW5zaWduZWQgaW50IGlkID0gMDsKKyAgICBzdHJ1Y3QgaW9tbXVfZ3JvdXAgKmdycDsKKworICAg
IHdoaWxlICggcmFkaXhfdHJlZV9nYW5nX2xvb2t1cCgmaW9tbXVfZ3JvdXBzLCAodm9pZCAqKikm
Z3JwLCBpZCwgMSkgKQorICAgIHsKKyAgICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXY7CisKKyAg
ICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeSAoIHBkZXYsICZncnAtPmRldnNfbGlzdCwgZ3JwZGV2
c19saXN0ICkKKyAgICAgICAgICAgIGlmICggcGRldi0+c2VnID09IHNlZyAmJiBwZGV2LT5idXMg
PT0gYnVzICYmCisgICAgICAgICAgICAgICAgIHBkZXYtPmRldmZuID09IGRldmZuICkKKyAgICAg
ICAgICAgICAgICByZXR1cm4gZ3JwOworCisgICAgICAgIGlkID0gZ3JwLT5pZCArIDE7CisgICAg
fQorCisgICAgcmV0dXJuIE5VTEw7Cit9CisKK2ludCBpb21tdV9nZXRfZGV2aWNlX2dyb3VwKHN0
cnVjdCBkb21haW4gKmQsIHUxNiBzZWcsIHU4IGJ1cywgdTggZGV2Zm4sCisgICAgICAgICAgICAg
ICAgICAgICAgICAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgYnVmLCBpbnQgbWF4X3Nk
ZXZzKQoreworICAgIHN0cnVjdCBpb21tdV9ncm91cCAqZ3JwOworICAgIHN0cnVjdCBwY2lfZGV2
ICpwZGV2OworICAgIGludCBpID0gMDsKKworICAgIHBjaWRldnNfbG9jaygpOworCisgICAgZ3Jw
ID0gaW9tbXVfZ3JvdXBfbG9va3VwKHNlZywgYnVzLCBkZXZmbik7CisgICAgaWYgKCAhZ3JwICkK
KyAgICB7CisgICAgICAgIHBjaWRldnNfdW5sb2NrKCk7CisgICAgICAgIHJldHVybiAwOworICAg
IH0KKworICAgIGxpc3RfZm9yX2VhY2hfZW50cnkgKCBwZGV2LCAmZ3JwLT5kZXZzX2xpc3QsIGdy
cGRldnNfbGlzdCApCisgICAgeworICAgICAgICB1aW50MzJfdCBzYmRmOworCisgICAgICAgIGlm
ICggaSA+PSBtYXhfc2RldnMgKQorICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgaWYgKCBw
ZGV2LT5kb21haW4gIT0gZCApCisgICAgICAgICAgICBjb250aW51ZTsKKworICAgICAgICBzYmRm
ID0gUENJX1NCREYzKHBkZXYtPnNlZywgcGRldi0+YnVzLCBwZGV2LT5kZXZmbik7CisKKyAgICAg
ICAgaWYgKCB4c21fZ2V0X2RldmljZV9ncm91cChYU01fSE9PSywgc2JkZikgKQorICAgICAgICAg
ICAgY29udGludWU7CisKKyAgICAgICAgaWYgKCB1bmxpa2VseShjb3B5X3RvX2d1ZXN0X29mZnNl
dChidWYsIGksICZzYmRmLCAxKSkgKQorICAgICAgICB7CisgICAgICAgICAgICBwY2lkZXZzX3Vu
bG9jaygpOworICAgICAgICAgICAgcmV0dXJuIC0xOworICAgICAgICB9CisgICAgICAgIGkrKzsK
KyAgICB9CisKKyAgICBwY2lkZXZzX3VubG9jaygpOworCisgICAgcmV0dXJuIGk7Cit9CisKICNl
bmRpZiAvKiBDT05GSUdfSEFTX1BDSSAqLwogCiAvKgpkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMv
cGFzc3Rocm91Z2gvcGNpLmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwppbmRleCA2
MjEwNDA5NzQxLi42OGIyODgzZWQ2IDEwMDY0NAotLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3Vn
aC9wY2kuYworKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwpAQCAtMTU1NCw1MyAr
MTU1NCw2IEBAIGludCBkZWFzc2lnbl9kZXZpY2Uoc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywg
dTggYnVzLCB1OCBkZXZmbikKICAgICByZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgaW50IGlvbW11
X2dldF9kZXZpY2VfZ3JvdXAoCi0gICAgc3RydWN0IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVz
LCB1OCBkZXZmbiwKLSAgICBYRU5fR1VFU1RfSEFORExFXzY0KHVpbnQzMikgYnVmLCBpbnQgbWF4
X3NkZXZzKQotewotICAgIGNvbnN0IHN0cnVjdCBkb21haW5faW9tbXUgKmhkID0gZG9tX2lvbW11
KGQpOwotICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2OwotICAgIGludCBncm91cF9pZCwgc2Rldl9p
ZDsKLSAgICB1MzIgYmRmOwotICAgIGludCBpID0gMDsKLSAgICBjb25zdCBzdHJ1Y3QgaW9tbXVf
b3BzICpvcHMgPSBoZC0+cGxhdGZvcm1fb3BzOwotCi0gICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8
fCAhb3BzIHx8ICFvcHMtPmdldF9kZXZpY2VfZ3JvdXBfaWQgKQotICAgICAgICByZXR1cm4gMDsK
LQotICAgIGdyb3VwX2lkID0gb3BzLT5nZXRfZGV2aWNlX2dyb3VwX2lkKHNlZywgYnVzLCBkZXZm
bik7Ci0KLSAgICBwY2lkZXZzX2xvY2soKTsKLSAgICBmb3JfZWFjaF9wZGV2KCBkLCBwZGV2ICkK
LSAgICB7Ci0gICAgICAgIGlmICggKHBkZXYtPnNlZyAhPSBzZWcpIHx8Ci0gICAgICAgICAgICAg
KChwZGV2LT5idXMgPT0gYnVzKSAmJiAocGRldi0+ZGV2Zm4gPT0gZGV2Zm4pKSApCi0gICAgICAg
ICAgICBjb250aW51ZTsKLQotICAgICAgICBpZiAoIHhzbV9nZXRfZGV2aWNlX2dyb3VwKFhTTV9I
T09LLCAoc2VnIDw8IDE2KSB8IChwZGV2LT5idXMgPDwgOCkgfCBwZGV2LT5kZXZmbikgKQotICAg
ICAgICAgICAgY29udGludWU7Ci0KLSAgICAgICAgc2Rldl9pZCA9IG9wcy0+Z2V0X2RldmljZV9n
cm91cF9pZChzZWcsIHBkZXYtPmJ1cywgcGRldi0+ZGV2Zm4pOwotICAgICAgICBpZiAoIChzZGV2
X2lkID09IGdyb3VwX2lkKSAmJiAoaSA8IG1heF9zZGV2cykgKQotICAgICAgICB7Ci0gICAgICAg
ICAgICBiZGYgPSAwOwotICAgICAgICAgICAgYmRmIHw9IChwZGV2LT5idXMgJiAweGZmKSA8PCAx
NjsKLSAgICAgICAgICAgIGJkZiB8PSAocGRldi0+ZGV2Zm4gJiAweGZmKSA8PCA4OwotCi0gICAg
ICAgICAgICBpZiAoIHVubGlrZWx5KGNvcHlfdG9fZ3Vlc3Rfb2Zmc2V0KGJ1ZiwgaSwgJmJkZiwg
MSkpICkKLSAgICAgICAgICAgIHsKLSAgICAgICAgICAgICAgICBwY2lkZXZzX3VubG9jaygpOwot
ICAgICAgICAgICAgICAgIHJldHVybiAtMTsKLSAgICAgICAgICAgIH0KLSAgICAgICAgICAgIGkr
KzsKLSAgICAgICAgfQotICAgIH0KLQotICAgIHBjaWRldnNfdW5sb2NrKCk7Ci0KLSAgICByZXR1
cm4gaTsKLX0KLQogdm9pZCBpb21tdV9kZXZfaW90bGJfZmx1c2hfdGltZW91dChzdHJ1Y3QgZG9t
YWluICpkLCBzdHJ1Y3QgcGNpX2RldiAqcGRldikKIHsKICAgICBwY2lkZXZzX2xvY2soKTsKZGlm
ZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9pb21tdS5oIGIveGVuL2luY2x1ZGUveGVuL2lvbW11
LmgKaW5kZXggNmQ2YWExMjMxNC4uYzRlMTYwNGJiOCAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2lvbW11LmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2lvbW11LmgKQEAgLTMxOSw2ICszMTks
OCBAQCBleHRlcm4gc3RydWN0IHBhZ2VfbGlzdF9oZWFkIGlvbW11X3B0X2NsZWFudXBfbGlzdDsK
IAogdm9pZCBpb21tdV9ncm91cHNfaW5pdCh2b2lkKTsKIGludCBpb21tdV9ncm91cF9hc3NpZ24o
c3RydWN0IHBjaV9kZXYgKnBkZXYpOworaW50IGlvbW11X2dldF9kZXZpY2VfZ3JvdXAoc3RydWN0
IGRvbWFpbiAqZCwgdTE2IHNlZywgdTggYnVzLCB1OCBkZXZmbiwKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIFhFTl9HVUVTVF9IQU5ETEVfNjQodWludDMyKSBidWYsIGludCBtYXhfc2RldnMp
OwogCiAjZW5kaWYgLyogQ09ORklHX0hBU19QQ0kgKi8KIAotLSAKMi4xMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
