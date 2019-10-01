Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7827DC2F99
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:05:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFE2v-0002ua-0i; Tue, 01 Oct 2019 09:02:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uaPp=X2=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1iFE2t-0002uM-Co
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:02:11 +0000
X-Inumbo-ID: 2190534c-e42a-11e9-97fb-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by localhost (Halon) with ESMTPS
 id 2190534c-e42a-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 09:02:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2D1C58980F9;
 Tue,  1 Oct 2019 09:02:01 +0000 (UTC)
Received: from t460s.redhat.com (ovpn-117-182.ams2.redhat.com [10.36.117.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B09D60624;
 Tue,  1 Oct 2019 09:01:59 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Tue,  1 Oct 2019 11:01:51 +0200
Message-Id: <20191001090152.1770-3-david@redhat.com>
In-Reply-To: <20191001090152.1770-1-david@redhat.com>
References: <20191001090152.1770-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Tue, 01 Oct 2019 09:02:01 +0000 (UTC)
Subject: [Xen-devel] [PATCH v1 2/3] xen/balloon: Mark pages PG_offline in
 balloon_append()
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

TGV0J3MgbW92ZSB0aGUgX19TZXRQYWdlT2ZmbGluZSgpIGNhbGwgd2hpY2ggYWxsIGNhbGxlcnMg
cGVyZm9ybSBpbnRvCmJhbGxvb25fYXBwZW5kKCkuCgpJbiBicF9zdGF0ZSBkZWNyZWFzZV9yZXNl
cnZhdGlvbigpLCBwYWdlcyBhcmUgbm93IG1hcmtlZCBQR19vZmZsaW5lIGEKbGl0dGxlIGxhdGVy
IHRoYW4gYmVmb3JlLCBob3dldmVyLCB0aGlzIHNob3VsZCBub3QgbWF0dGVyIGZvciBYRU4uCgpT
dWdnZXN0ZWQtYnk6IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+
CkNjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPgpDYzogSnVl
cmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL3hlbi9iYWxsb29uLmMgfCAxMyArKysrLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMveGVuL2JhbGxvb24uYyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwpp
bmRleCAzNzQ0M2M1ZmRhOTkuLjhjMjQ1ZTk5YmIwNiAxMDA2NDQKLS0tIGEvZHJpdmVycy94ZW4v
YmFsbG9vbi5jCisrKyBiL2RyaXZlcnMveGVuL2JhbGxvb24uYwpAQCAtMTU4LDYgKzE1OCw4IEBA
IHN0YXRpYyBERUNMQVJFX0RFTEFZRURfV09SSyhiYWxsb29uX3dvcmtlciwgYmFsbG9vbl9wcm9j
ZXNzKTsKIC8qIGJhbGxvb25fYXBwZW5kOiBhZGQgdGhlIGdpdmVuIHBhZ2UgdG8gdGhlIGJhbGxv
b24uICovCiBzdGF0aWMgdm9pZCBiYWxsb29uX2FwcGVuZChzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsK
KwlfX1NldFBhZ2VPZmZsaW5lKHBhZ2UpOworCiAJLyogTG93bWVtIGlzIHJlLXBvcHVsYXRlZCBm
aXJzdCwgc28gaGlnaG1lbSBwYWdlcyBnbyBhdCBsaXN0IHRhaWwuICovCiAJaWYgKFBhZ2VIaWdo
TWVtKHBhZ2UpKSB7CiAJCWxpc3RfYWRkX3RhaWwoJnBhZ2UtPmxydSwgJmJhbGxvb25lZF9wYWdl
cyk7CkBAIC0zNzIsNyArMzc0LDYgQEAgc3RhdGljIHZvaWQgeGVuX29ubGluZV9wYWdlKHN0cnVj
dCBwYWdlICpwYWdlLCB1bnNpZ25lZCBpbnQgb3JkZXIpCiAJZm9yIChpID0gMDsgaSA8IHNpemU7
IGkrKykgewogCQlwID0gcGZuX3RvX3BhZ2Uoc3RhcnRfcGZuICsgaSk7CiAJCV9fb25saW5lX3Bh
Z2Vfc2V0X2xpbWl0cyhwKTsKLQkJX19TZXRQYWdlT2ZmbGluZShwKTsKIAkJYmFsbG9vbl9hcHBl
bmQocCk7CiAJfQogCW11dGV4X3VubG9jaygmYmFsbG9vbl9tdXRleCk7CkBAIC00NjYsNyArNDY3
LDYgQEAgc3RhdGljIGVudW0gYnBfc3RhdGUgZGVjcmVhc2VfcmVzZXJ2YXRpb24odW5zaWduZWQg
bG9uZyBucl9wYWdlcywgZ2ZwX3QgZ2ZwKQogCQkJc3RhdGUgPSBCUF9FQUdBSU47CiAJCQlicmVh
azsKIAkJfQotCQlfX1NldFBhZ2VPZmZsaW5lKHBhZ2UpOwogCQlhZGp1c3RfbWFuYWdlZF9wYWdl
X2NvdW50KHBhZ2UsIC0xKTsKIAkJeGVubWVtX3Jlc2VydmF0aW9uX3NjcnViX3BhZ2UocGFnZSk7
CiAJCWxpc3RfYWRkKCZwYWdlLT5scnUsICZwYWdlcyk7CkBAIC02NDgsMTAgKzY0OCw4IEBAIHZv
aWQgZnJlZV94ZW5iYWxsb29uZWRfcGFnZXMoaW50IG5yX3BhZ2VzLCBzdHJ1Y3QgcGFnZSAqKnBh
Z2VzKQogCW11dGV4X2xvY2soJmJhbGxvb25fbXV0ZXgpOwogCiAJZm9yIChpID0gMDsgaSA8IG5y
X3BhZ2VzOyBpKyspIHsKLQkJaWYgKHBhZ2VzW2ldKSB7Ci0JCQlfX1NldFBhZ2VPZmZsaW5lKHBh
Z2VzW2ldKTsKKwkJaWYgKHBhZ2VzW2ldKQogCQkJYmFsbG9vbl9hcHBlbmQocGFnZXNbaV0pOwot
CQl9CiAJfQogCiAJYmFsbG9vbl9zdGF0cy50YXJnZXRfdW5wb3B1bGF0ZWQgLT0gbnJfcGFnZXM7
CkBAIC02NjksNyArNjY3LDYgQEAgc3RhdGljIHZvaWQgX19pbml0IGJhbGxvb25fYWRkX3JlZ2lv
bih1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwKIAkJCQkgICAgICB1bnNpZ25lZCBsb25nIHBhZ2Vz
KQogewogCXVuc2lnbmVkIGxvbmcgcGZuLCBleHRyYV9wZm5fZW5kOwotCXN0cnVjdCBwYWdlICpw
YWdlOwogCiAJLyoKIAkgKiBJZiB0aGUgYW1vdW50IG9mIHVzYWJsZSBtZW1vcnkgaGFzIGJlZW4g
bGltaXRlZCAoZS5nLiwgd2l0aApAQCAtNjc5LDEyICs2NzYsMTAgQEAgc3RhdGljIHZvaWQgX19p
bml0IGJhbGxvb25fYWRkX3JlZ2lvbih1bnNpZ25lZCBsb25nIHN0YXJ0X3BmbiwKIAlleHRyYV9w
Zm5fZW5kID0gbWluKG1heF9wZm4sIHN0YXJ0X3BmbiArIHBhZ2VzKTsKIAogCWZvciAocGZuID0g
c3RhcnRfcGZuOyBwZm4gPCBleHRyYV9wZm5fZW5kOyBwZm4rKykgewotCQlwYWdlID0gcGZuX3Rv
X3BhZ2UocGZuKTsKIAkJLyogdG90YWxyYW1fcGFnZXMgYW5kIHRvdGFsaGlnaF9wYWdlcyBkbyBu
b3QKIAkJICAgaW5jbHVkZSB0aGUgYm9vdC10aW1lIGJhbGxvb24gZXh0ZW5zaW9uLCBzbwogCQkg
ICBkb24ndCBzdWJ0cmFjdCBmcm9tIGl0LiAqLwotCQlfX1NldFBhZ2VPZmZsaW5lKHBhZ2UpOwot
CQliYWxsb29uX2FwcGVuZChwYWdlKTsKKwkJYmFsbG9vbl9hcHBlbmQocGZuX3RvX3BhZ2UocGZu
KSk7CiAJfQogCiAJYmFsbG9vbl9zdGF0cy50b3RhbF9wYWdlcyArPSBleHRyYV9wZm5fZW5kIC0g
c3RhcnRfcGZuOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
