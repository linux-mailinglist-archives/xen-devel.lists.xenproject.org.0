Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF92D8A3
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 11:08:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVuVL-0005VM-5a; Wed, 29 May 2019 09:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=krOM=T5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVuVK-0005V2-0x
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:04:14 +0000
X-Inumbo-ID: b95a4dbe-81f0-11e9-96a8-1b39861a9cfc
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b95a4dbe-81f0-11e9-96a8-1b39861a9cfc;
 Wed, 29 May 2019 09:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0AFA7AEFD;
 Wed, 29 May 2019 09:04:11 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Date: Wed, 29 May 2019 11:04:07 +0200
Message-Id: <20190529090407.1225-4-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190529090407.1225-1-jgross@suse.com>
References: <20190529090407.1225-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 3/3] xen/swiotlb: remember having called
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
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
IGNhc2Ugb2Ygc2FuZSBjb25kaXRpb25zIChKYW4gQmV1bGljaCkKLS0tCiBkcml2ZXJzL3hlbi9z
d2lvdGxiLXhlbi5jICB8IDYgKysrKystCiBpbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaCB8IDMg
KysrCiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMgYi9kcml2ZXJzL3hlbi9zd2lvdGxi
LXhlbi5jCmluZGV4IGFiYTUyNDdiOTE0NS4uN2UyZDlkMWI2ZjYzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCisrKyBiL2RyaXZlcnMveGVuL3N3aW90bGIteGVuLmMKQEAg
LTMyMSw2ICszMjEsNyBAQCB4ZW5fc3dpb3RsYl9hbGxvY19jb2hlcmVudChzdHJ1Y3QgZGV2aWNl
ICpod2Rldiwgc2l6ZV90IHNpemUsCiAJCQl4ZW5fZnJlZV9jb2hlcmVudF9wYWdlcyhod2Rldiwg
c2l6ZSwgcmV0LCAoZG1hX2FkZHJfdClwaHlzLCBhdHRycyk7CiAJCQlyZXR1cm4gTlVMTDsKIAkJ
fQorCQlTZXRQYWdlWGVuUmVtYXBwZWQodmlydF90b19wYWdlKHJldCkpOwogCX0KIAltZW1zZXQo
cmV0LCAwLCBzaXplKTsKIAlyZXR1cm4gcmV0OwpAQCAtMzQ1LDggKzM0NiwxMSBAQCB4ZW5fc3dp
b3RsYl9mcmVlX2NvaGVyZW50KHN0cnVjdCBkZXZpY2UgKmh3ZGV2LCBzaXplX3Qgc2l6ZSwgdm9p
ZCAqdmFkZHIsCiAJc2l6ZSA9IDFVTCA8PCAob3JkZXIgKyBYRU5fUEFHRV9TSElGVCk7CiAKIAlp
ZiAoIVdBUk5fT04oKGRldl9hZGRyICsgc2l6ZSAtIDEgPiBkbWFfbWFzaykgfHwKLQkJICAgICBy
YW5nZV9zdHJhZGRsZXNfcGFnZV9ib3VuZGFyeShwaHlzLCBzaXplKSkpCisJCSAgICAgcmFuZ2Vf
c3RyYWRkbGVzX3BhZ2VfYm91bmRhcnkocGh5cywgc2l6ZSkpICYmCisJICAgIFBhZ2VYZW5SZW1h
cHBlZCh2aXJ0X3RvX3BhZ2UodmFkZHIpKSkgewogCQl4ZW5fZGVzdHJveV9jb250aWd1b3VzX3Jl
Z2lvbihwaHlzLCBvcmRlcik7CisJCUNsZWFyUGFnZVhlblJlbWFwcGVkKHZpcnRfdG9fcGFnZSh2
YWRkcikpOworCX0KIAogCXhlbl9mcmVlX2NvaGVyZW50X3BhZ2VzKGh3ZGV2LCBzaXplLCB2YWRk
ciwgKGRtYV9hZGRyX3QpcGh5cywgYXR0cnMpOwogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9wYWdlLWZsYWdzLmggYi9pbmNsdWRlL2xpbnV4L3BhZ2UtZmxhZ3MuaAppbmRleCA5Zjg3MTJh
NGIxYTUuLjI5NjQ4MGU5OTBmMiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9wYWdlLWZsYWdz
LmgKKysrIGIvaW5jbHVkZS9saW51eC9wYWdlLWZsYWdzLmgKQEAgLTE1Miw2ICsxNTIsOCBAQCBl
bnVtIHBhZ2VmbGFncyB7CiAJUEdfc2F2ZXBpbm5lZCA9IFBHX2RpcnR5LAogCS8qIEhhcyBhIGdy
YW50IG1hcHBpbmcgb2YgYW5vdGhlciAoZm9yZWlnbikgZG9tYWluJ3MgcGFnZS4gKi8KIAlQR19m
b3JlaWduID0gUEdfb3duZXJfcHJpdl8xLAorCS8qIFJlbWFwcGVkIGJ5IHN3aW90bGIteGVuLiAq
LworCVBHX3hlbl9yZW1hcHBlZCA9IFBHX293bmVyX3ByaXZfMSwKIAogCS8qIFNMT0IgKi8KIAlQ
R19zbG9iX2ZyZWUgPSBQR19wcml2YXRlLApAQCAtMzI5LDYgKzMzMSw3IEBAIFBBR0VGTEFHKFBp
bm5lZCwgcGlubmVkLCBQRl9OT19DT01QT1VORCkKIAlURVNUU0NGTEFHKFBpbm5lZCwgcGlubmVk
LCBQRl9OT19DT01QT1VORCkKIFBBR0VGTEFHKFNhdmVQaW5uZWQsIHNhdmVwaW5uZWQsIFBGX05P
X0NPTVBPVU5EKTsKIFBBR0VGTEFHKEZvcmVpZ24sIGZvcmVpZ24sIFBGX05PX0NPTVBPVU5EKTsK
K1BBR0VGTEFHKFhlblJlbWFwcGVkLCB4ZW5fcmVtYXBwZWQsIFBGX05PX0NPTVBPVU5EKTsKIAog
UEFHRUZMQUcoUmVzZXJ2ZWQsIHJlc2VydmVkLCBQRl9OT19DT01QT1VORCkKIAlfX0NMRUFSUEFH
RUZMQUcoUmVzZXJ2ZWQsIHJlc2VydmVkLCBQRl9OT19DT01QT1VORCkKLS0gCjIuMTYuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
