Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 075492D875
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 11:07:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVuVL-0005VS-FG; Wed, 29 May 2019 09:04:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=krOM=T5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hVuVK-0005V3-1F
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 09:04:14 +0000
X-Inumbo-ID: b92adda4-81f0-11e9-bf40-5f5954cf2a33
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b92adda4-81f0-11e9-bf40-5f5954cf2a33;
 Wed, 29 May 2019 09:04:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8C518AD5E;
 Wed, 29 May 2019 09:04:10 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org
Date: Wed, 29 May 2019 11:04:05 +0200
Message-Id: <20190529090407.1225-2-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20190529090407.1225-1-jgross@suse.com>
References: <20190529090407.1225-1-jgross@suse.com>
Subject: [Xen-devel] [PATCH v2 1/3] xen/swiotlb: fix condition for calling
 xen_destroy_contiguous_region()
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, stable@vger.kernel.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIGNvbmRpdGlvbiBpbiB4ZW5fc3dpb3RsYl9mcmVlX2NvaGVyZW50KCkgZm9yIGRlY2lkaW5n
IHdoZXRoZXIgdG8KY2FsbCB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzIHdyb25n
OiBpbiBjYXNlIHRoZSByZWdpb24gdG8KYmUgZnJlZWQgaXMgbm90IGNvbnRpZ3VvdXMgY2FsbGlu
ZyB4ZW5fZGVzdHJveV9jb250aWd1b3VzX3JlZ2lvbigpIGlzCnRoZSB3cm9uZyB0aGluZyB0byBk
bzogaXQgd291bGQgcmVzdWx0IGluIGluY29uc2lzdGVudCBtYXBwaW5ncyBvZgptdWx0aXBsZSBQ
Rk5zIHRvIHRoZSBzYW1lIE1GTi4gVGhpcyB3aWxsIGxlYWQgdG8gdmFyaW91cyBzdHJhbmdlCmNy
YXNoZXMgb3IgZGF0YSBjb3JydXB0aW9uLgoKSW5zdGVhZCBvZiBjYWxsaW5nIHhlbl9kZXN0cm95
X2NvbnRpZ3VvdXNfcmVnaW9uKCkgaW4gdGhhdCBjYXNlIGEKd2FybmluZyBzaG91bGQgYmUgaXNz
dWVkIGFzIHRoYXQgc2l0dWF0aW9uIHNob3VsZCBuZXZlciBvY2N1ci4KCkNjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KUmV2aWV3ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5j
b20+Ci0tLQpWMjogYWx3YXlzIGlzc3VlIGEgd2FybmluZyBpbiBjYXNlIHhlbl9kZXN0cm95X2Nv
bnRpZ3VvdXNfcmVnaW9uKCkKICAgIGlzbid0IGNhbGxlZCAoSmFuIEJldWxpY2gpCi0tLQogZHJp
dmVycy94ZW4vc3dpb3RsYi14ZW4uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3hlbi9zd2lvdGxi
LXhlbi5jIGIvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYwppbmRleCA1ZGNiMDZmZTk2NjcuLjFj
YWFkY2ExMjRiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vc3dpb3RsYi14ZW4uYworKysgYi9k
cml2ZXJzL3hlbi9zd2lvdGxiLXhlbi5jCkBAIC0zNjAsOCArMzYwLDggQEAgeGVuX3N3aW90bGJf
ZnJlZV9jb2hlcmVudChzdHJ1Y3QgZGV2aWNlICpod2Rldiwgc2l6ZV90IHNpemUsIHZvaWQgKnZh
ZGRyLAogCS8qIENvbnZlcnQgdGhlIHNpemUgdG8gYWN0dWFsbHkgYWxsb2NhdGVkLiAqLwogCXNp
emUgPSAxVUwgPDwgKG9yZGVyICsgWEVOX1BBR0VfU0hJRlQpOwogCi0JaWYgKCgoZGV2X2FkZHIg
KyBzaXplIC0gMSA8PSBkbWFfbWFzaykpIHx8Ci0JICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2Jv
dW5kYXJ5KHBoeXMsIHNpemUpKQorCWlmICghV0FSTl9PTigoZGV2X2FkZHIgKyBzaXplIC0gMSA+
IGRtYV9tYXNrKSB8fAorCQkgICAgIHJhbmdlX3N0cmFkZGxlc19wYWdlX2JvdW5kYXJ5KHBoeXMs
IHNpemUpKSkKIAkJeGVuX2Rlc3Ryb3lfY29udGlndW91c19yZWdpb24ocGh5cywgb3JkZXIpOwog
CiAJeGVuX2ZyZWVfY29oZXJlbnRfcGFnZXMoaHdkZXYsIHNpemUsIHZhZGRyLCAoZG1hX2FkZHJf
dClwaHlzLCBhdHRycyk7Ci0tIAoyLjE2LjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
