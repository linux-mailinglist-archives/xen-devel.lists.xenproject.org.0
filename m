Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3A4C2F8E
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:04:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFE2p-0002tX-Li; Tue, 01 Oct 2019 09:02:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uaPp=X2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iFE2o-0002tR-Cj
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:02:06 +0000
X-Inumbo-ID: 20698a56-e42a-11e9-97fb-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id 20698a56-e42a-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 09:01:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4F203554CD;
 Tue,  1 Oct 2019 09:01:59 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-182.ams2.redhat.com [10.36.117.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C8CA91D9;
 Tue,  1 Oct 2019 09:01:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  1 Oct 2019 11:01:50 +0200
Message-Id: <20191001090152.1770-2-david@redhat.com>
In-Reply-To: <20191001090152.1770-1-david@redhat.com>
References: <20191001090152.1770-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 01 Oct 2019 09:01:59 +0000 (UTC)
Subject: [Xen-devel] [PATCH v1 1/3] xen/balloon: Drop __balloon_append()
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
 David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TGV0J3Mgc2ltcGx5IHVzZSBiYWxsb29uX2FwcGVuZCgpIGRpcmVjdGx5LgoKQ2M6IEJvcmlzIE9z
dHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+CkNjOiBKdWVyZ2VuIEdyb3NzIDxq
Z3Jvc3NAc3VzZS5jb20+CkNjOiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5l
bC5vcmc+ClNpZ25lZC1vZmYtYnk6IERhdmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29t
PgotLS0KIGRyaXZlcnMveGVuL2JhbGxvb24uYyB8IDExICsrKy0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMveGVuL2JhbGxvb24uYyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwppbmRleCA5MWNiYTcwYjY5
ZGYuLjM3NDQzYzVmZGE5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4vYmFsbG9vbi5jCisrKyBi
L2RyaXZlcnMveGVuL2JhbGxvb24uYwpAQCAtMTU2LDcgKzE1Niw3IEBAIHN0YXRpYyBERUNMQVJF
X0RFTEFZRURfV09SSyhiYWxsb29uX3dvcmtlciwgYmFsbG9vbl9wcm9jZXNzKTsKIAkoR0ZQX0hJ
R0hVU0VSIHwgX19HRlBfTk9XQVJOIHwgX19HRlBfTk9SRVRSWSB8IF9fR0ZQX05PTUVNQUxMT0Mp
CiAKIC8qIGJhbGxvb25fYXBwZW5kOiBhZGQgdGhlIGdpdmVuIHBhZ2UgdG8gdGhlIGJhbGxvb24u
ICovCi1zdGF0aWMgdm9pZCBfX2JhbGxvb25fYXBwZW5kKHN0cnVjdCBwYWdlICpwYWdlKQorc3Rh
dGljIHZvaWQgYmFsbG9vbl9hcHBlbmQoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7CiAJLyogTG93bWVt
IGlzIHJlLXBvcHVsYXRlZCBmaXJzdCwgc28gaGlnaG1lbSBwYWdlcyBnbyBhdCBsaXN0IHRhaWwu
ICovCiAJaWYgKFBhZ2VIaWdoTWVtKHBhZ2UpKSB7CkBAIC0xNjksMTEgKzE2OSw2IEBAIHN0YXRp
YyB2b2lkIF9fYmFsbG9vbl9hcHBlbmQoc3RydWN0IHBhZ2UgKnBhZ2UpCiAJd2FrZV91cCgmYmFs
bG9vbl93cSk7CiB9CiAKLXN0YXRpYyB2b2lkIGJhbGxvb25fYXBwZW5kKHN0cnVjdCBwYWdlICpw
YWdlKQotewotCV9fYmFsbG9vbl9hcHBlbmQocGFnZSk7Ci19Ci0KIC8qIGJhbGxvb25fcmV0cmll
dmU6IHJlc2N1ZSBhIHBhZ2UgZnJvbSB0aGUgYmFsbG9vbiwgaWYgaXQgaXMgbm90IGVtcHR5LiAq
Lwogc3RhdGljIHN0cnVjdCBwYWdlICpiYWxsb29uX3JldHJpZXZlKGJvb2wgcmVxdWlyZV9sb3dt
ZW0pCiB7CkBAIC0zNzgsNyArMzczLDcgQEAgc3RhdGljIHZvaWQgeGVuX29ubGluZV9wYWdlKHN0
cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBpbnQgb3JkZXIpCiAJCXAgPSBwZm5fdG9fcGFnZShz
dGFydF9wZm4gKyBpKTsKIAkJX19vbmxpbmVfcGFnZV9zZXRfbGltaXRzKHApOwogCQlfX1NldFBh
Z2VPZmZsaW5lKHApOwotCQlfX2JhbGxvb25fYXBwZW5kKHApOworCQliYWxsb29uX2FwcGVuZChw
KTsKIAl9CiAJbXV0ZXhfdW5sb2NrKCZiYWxsb29uX211dGV4KTsKIH0KQEAgLTY4OSw3ICs2ODQs
NyBAQCBzdGF0aWMgdm9pZCBfX2luaXQgYmFsbG9vbl9hZGRfcmVnaW9uKHVuc2lnbmVkIGxvbmcg
c3RhcnRfcGZuLAogCQkgICBpbmNsdWRlIHRoZSBib290LXRpbWUgYmFsbG9vbiBleHRlbnNpb24s
IHNvCiAJCSAgIGRvbid0IHN1YnRyYWN0IGZyb20gaXQuICovCiAJCV9fU2V0UGFnZU9mZmxpbmUo
cGFnZSk7Ci0JCV9fYmFsbG9vbl9hcHBlbmQocGFnZSk7CisJCWJhbGxvb25fYXBwZW5kKHBhZ2Up
OwogCX0KIAogCWJhbGxvb25fc3RhdHMudG90YWxfcGFnZXMgKz0gZXh0cmFfcGZuX2VuZCAtIHN0
YXJ0X3BmbjsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
