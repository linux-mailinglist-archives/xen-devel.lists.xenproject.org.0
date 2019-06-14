Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEA245443
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 07:49:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbf2S-0003yo-Cm; Fri, 14 Jun 2019 05:46:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Qdkl=UN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hbf2Q-0003yX-Ms
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 05:46:10 +0000
X-Inumbo-ID: b54b0c70-8e67-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b54b0c70-8e67-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 05:46:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0084DADF1;
 Fri, 14 Jun 2019 05:46:07 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 07:46:04 +0200
Message-Id: <20190614054604.30101-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190614054604.30101-1-jgross@suse.com>
References: <20190614054604.30101-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v3 3/3] xen/swiotlb: remember having called
 xen_create_contiguous_region()
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
Cc: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SW5zdGVhZCBvZiBhbHdheXMgY2FsbGluZyB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigp
IGluIGNhc2UgdGhlCm1lbW9yeSBpcyBETUEtYWJsZSBmb3IgdGhlIHVzZWQgZGV2aWNlLCBkbyBz
byBvbmx5IGluIGNhc2UgaXQgaGFzIGJlZW4KbWFkZSBETUEtYWJsZSB2aWEgeGVuX2NyZWF0ZV9j
b250aWd1b3VzX3JlZ2lvbigpIGJlZm9yZS4KClRoaXMgd2lsbCBhdm9pZCBhIGxvdCBvZiB4ZW5f
ZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGNhbGxzIGZvcgo2NC1iaXQgY2FwYWJsZSBkZXZp
Y2VzLgoKQXMgdGhlIG1lbW9yeSBpbiBxdWVzdGlvbiBpcyBvd25lZCBieSBzd2lvdGxiLXhlbiB0
aGUgUEdfb3duZXJfcHJpdl8xCmZsYWcgb2YgdGhlIGZpcnN0IGFsbG9jYXRlZCBwYWdlIGNhbiBi
ZSB1c2VkIGZvciByZW1lbWJlcmluZy4KClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpn
cm9zc0BzdXNlLmNvbT4KLS0tClYyOiBhZGQgUEdfeGVuX3JlbWFwcGVkIGFsaWFzIGZvciBQR19v
d25lcl9wcml2XzEgKEJvcmlzIE9zdHJvdnNreSkKICAgIG9ubHkgY2xlYXIgcGFnZSBmbGFnIGlu
IGNhc2Ugb2Ygc2FuZSBjb25kaXRpb25zIChKYW4gQmV1bGljaCkKVjM6IHVzZSBUZXN0Q2xlYXJQ
YWdlWGVuUmVtYXBwZWQoKSAoSmFuIEJldWxpY2gpCi0tLQogZHJpdmVycy94ZW4vc3dpb3RsYi14
ZW4uYyAgfCA0ICsrKy0KIGluY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oIHwgNCArKysrCiAyIGZp
bGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCmlu
ZGV4IDM3ZGRjZmNmYmIyMS4uY2ViNjgxY2Y2NGJiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKQEAgLTMyMiw2ICsz
MjIsNyBAQCB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpod2Rldiwg
c2l6ZV90IHNpemUsCiAJCQl4ZW5fZnJlZV9jb2hlcmVudF9wYWdlcyhod2Rldiwgc2l6ZSwgcmV0
LCAoZG1hX2FkZHJfdClwaHlzLCBhdHRycyk7CiAJCQlyZXR1cm4gTlVMTDsKIAkJfQorCQlTZXRQ
YWdlWGVuUmVtYXBwZWQodmlydF90b19wYWdlKHJldCkpOwogCX0KIAltZW1zZXQocmV0LCAwLCBz
aXplKTsKIAlyZXR1cm4gcmV0OwpAQCAtMzQ2LDcgKzM0Nyw4IEBAIHhlbl9zd2lvdGxiX2ZyZWVf
Y29oZXJlbnQoc3RydWN0IGRldmljZSAqaHdkZXYsIHNpemVfdCBzaXplLCB2b2lkICp2YWRkciwK
IAlzaXplID0gMVVMIDw8IChvcmRlciArIFhFTl9QQUdFX1NISUZUKTsKIAogCWlmICghV0FSTl9P
TigoZGV2X2FkZHIgKyBzaXplIC0gMSA+IGRtYV9tYXNrKSB8fAotCQkgICAgIHJhbmdlX3N0cmFk
ZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMsIHNpemUpKSkKKwkJICAgICByYW5nZV9zdHJhZGRsZXNf
cGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkgJiYKKwkgICAgVGVzdENsZWFyUGFnZVhlblJlbWFw
cGVkKHZpcnRfdG9fcGFnZSh2YWRkcikpKQogCQl4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lv
bihwaHlzLCBvcmRlcik7CiAKIAl4ZW5fZnJlZV9jb2hlcmVudF9wYWdlcyhod2Rldiwgc2l6ZSwg
dmFkZHIsIChkbWFfYWRkcl90KXBoeXMsIGF0dHJzKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvcGFnZS1mbGFncy5oIGIvaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmgKaW5kZXggOWY4NzEy
YTRiMWE1Li5mYzUwM2E0N2U3ZGIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvcGFnZS1mbGFn
cy5oCisrKyBiL2luY2x1ZGUvbGludXgvcGFnZS1mbGFncy5oCkBAIC0xNTIsNiArMTUyLDggQEAg
ZW51bSBwYWdlZmxhZ3MgewogCVBHX3NhdmVwaW5uZWQgPSBQR19kaXJ0eSwKIAkvKiBIYXMgYSBn
cmFudCBtYXBwaW5nIG9mIGFub3RoZXIgKGZvcmVpZ24pIGRvbWFpbidzIHBhZ2UuICovCiAJUEdf
Zm9yZWlnbiA9IFBHX293bmVyX3ByaXZfMSwKKwkvKiBSZW1hcHBlZCBieSBzd2lvdGxiLXhlbi4g
Ki8KKwlQR194ZW5fcmVtYXBwZWQgPSBQR19vd25lcl9wcml2XzEsCiAKIAkvKiBTTE9CICovCiAJ
UEdfc2xvYl9mcmVlID0gUEdfcHJpdmF0ZSwKQEAgLTMyOSw2ICszMzEsOCBAQCBQQUdFRkxBRyhQ
aW5uZWQsIHBpbm5lZCwgUEZfTk9fQ09NUE9VTkQpCiAJVEVTVFNDRkxBRyhQaW5uZWQsIHBpbm5l
ZCwgUEZfTk9fQ09NUE9VTkQpCiBQQUdFRkxBRyhTYXZlUGlubmVkLCBzYXZlcGlubmVkLCBQRl9O
T19DT01QT1VORCk7CiBQQUdFRkxBRyhGb3JlaWduLCBmb3JlaWduLCBQRl9OT19DT01QT1VORCk7
CitQQUdFRkxBRyhYZW5SZW1hcHBlZCwgeGVuX3JlbWFwcGVkLCBQRl9OT19DT01QT1VORCkKKwlU
RVNUQ0xFQVJGTEFHKFhlblJlbWFwcGVkLCB4ZW5fcmVtYXBwZWQsIFBGX05PX0NPTVBPVU5EKQog
CiBQQUdFRkxBRyhSZXNlcnZlZCwgcmVzZXJ2ZWQsIFBGX05PX0NPTVBPVU5EKQogCV9fQ0xFQVJQ
QUdFRkxBRyhSZXNlcnZlZCwgcmVzZXJ2ZWQsIFBGX05PX0NPTVBPVU5EKQotLSAKMi4xNi40CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
