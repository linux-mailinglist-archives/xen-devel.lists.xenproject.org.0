Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CB1170349
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 16:56:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6z0J-0004bX-Ff; Wed, 26 Feb 2020 15:53:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sq/2=4O=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1j6z0I-0004bS-Lm
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 15:53:42 +0000
X-Inumbo-ID: 2835666c-58b0-11ea-9471-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 2835666c-58b0-11ea-9471-12813bfff9fa;
 Wed, 26 Feb 2020 15:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582732420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/NO9ujX8YYZ3QrrhXQKFjMK8w9A/HGCMrKEjwOf1Ew=;
 b=C3Did1uFkJM9oLhxmynw0EF2eFZVziIfOdLGMSoRLu7lF4QzY/Mj06EUS8Fd0ftQoSpEJf
 ozjSMwkgF4/1H2t/hcAanZS5d1k9cJqYICTpJb6XvaEXP6PzondRUrRtdEd6KSQ3XDaKpy
 sa0c6umxB8+VJ5PY75xBYRDeykDXiVs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-UfpxVpTxPGiiAisvxOWLQw-1; Wed, 26 Feb 2020 10:53:39 -0500
X-MC-Unique: UfpxVpTxPGiiAisvxOWLQw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BDBCC881293;
 Wed, 26 Feb 2020 15:53:37 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-196.ams2.redhat.com [10.36.117.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EDE10100E7E3;
 Wed, 26 Feb 2020 15:53:31 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Feb 2020 16:52:54 +0100
Message-Id: <20200226155304.60219-4-david@redhat.com>
In-Reply-To: <20200226155304.60219-1-david@redhat.com>
References: <20200226155304.60219-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Xen-devel] [PATCH v3 03/13] numa: Teach ram block notifiers about
 resizeable ram blocks
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paul Durrant <paul@xen.org>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UmFtIGJsb2NrIG5vdGlmaWVycyBhcmUgY3VycmVudGx5IG5vdCBhd2FyZSBvZiByZXNpemVzLiBF
c3BlY2lhbGx5IHRvCmhhbmRsZSByZXNpemVzIGR1cmluZyBtaWdyYXRpb24sIGJ1dCBhbHNvIHRv
IGltcGxlbWVudCBhY3R1YWxseSByZXNpemVhYmxlCnJhbSBibG9ja3MgKG1ha2UgZXZlcnl0aGlu
ZyBiZXR3ZWVuIHVzZWRfbGVuZ3RoIGFuZCBtYXhfbGVuZ3RoCmluYWNjZXNzaWJsZSksIHdlIHdh
bnQgdG8gdGVhY2ggcmFtIGJsb2NrIG5vdGlmaWVycyBhYm91dCByZXNpemVhYmxlCnJhbS4KCklu
dHJvZHVjZSB0aGUgYmFzaWMgaW5mcmFzdHJ1Y3R1cmUgYnV0IGtlZXAgdXNpbmcgbWF4X3NpemUg
aW4gdGhlCmV4aXN0aW5nIG5vdGlmaWVycy4gU3VwcGx5IHRoZSBtYXhfc2l6ZSB3aGVuIGFkZGlu
ZyBhbmQgcmVtb3ZpbmcgcmFtCmJsb2Nrcy4gQWxzbywgbm90aWZ5IG9uIHJlc2l6ZXMuCgpBY2tl
ZC1ieTogUGF1bCBEdXJyYW50IDxwYXVsQHhlbi5vcmc+ClJldmlld2VkLWJ5OiBQZXRlciBYdSA8
cGV0ZXJ4QHJlZGhhdC5jb20+CkNjOiBSaWNoYXJkIEhlbmRlcnNvbiA8cnRoQHR3aWRkbGUubmV0
PgpDYzogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KQ2M6ICJEci4gRGF2aWQg
QWxhbiBHaWxiZXJ0IiA8ZGdpbGJlcnRAcmVkaGF0LmNvbT4KQ2M6IEVkdWFyZG8gSGFia29zdCA8
ZWhhYmtvc3RAcmVkaGF0LmNvbT4KQ2M6IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZlbGJh
dW1AZ21haWwuY29tPgpDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwu
b3JnPgpDYzogQW50aG9ueSBQZXJhcmQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5jb20+CkNjOiBQ
YXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4KQ2M6ICJNaWNoYWVsIFMuIFRzaXJraW4iIDxtc3RA
cmVkaGF0LmNvbT4KQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpDYzogSWdvciBN
YW1tZWRvdiA8aW1hbW1lZG9AcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGF2aWQgSGlsZGVu
YnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+Ci0tLQogZXhlYy5jICAgICAgICAgICAgICAgICAgICAg
fCAxMyArKysrKysrKysrKy0tCiBody9jb3JlL251bWEuYyAgICAgICAgICAgICB8IDIyICsrKysr
KysrKysrKysrKysrLS0tLS0KIGh3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jIHwgIDcgKysrKy0t
LQogaW5jbHVkZS9leGVjL3JhbWxpc3QuaCAgICAgfCAxMyArKysrKysrKystLS0tCiB0YXJnZXQv
aTM4Ni9oYXgtbWVtLmMgICAgICB8ICA1ICsrKy0tCiB0YXJnZXQvaTM4Ni9zZXYuYyAgICAgICAg
ICB8IDE4ICsrKysrKysrKystLS0tLS0tLQogdXRpbC92ZmlvLWhlbHBlcnMuYyAgICAgICAgfCAx
NiArKysrKysrKy0tLS0tLS0tCiA3IGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDMy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2V4ZWMuYyBiL2V4ZWMuYwppbmRleCBiMmE2NWI3
OTNmLi4zZWUxNDk4NzYxIDEwMDY0NAotLS0gYS9leGVjLmMKKysrIGIvZXhlYy5jCkBAIC0yMDc4
LDYgKzIwNzgsOCBAQCBzdGF0aWMgaW50IG1lbW9yeV90cnlfZW5hYmxlX21lcmdpbmcodm9pZCAq
YWRkciwgc2l6ZV90IGxlbikKICAqLwogaW50IHFlbXVfcmFtX3Jlc2l6ZShSQU1CbG9jayAqYmxv
Y2ssIHJhbV9hZGRyX3QgbmV3c2l6ZSwgRXJyb3IgKiplcnJwKQogeworICAgIGNvbnN0IHJhbV9h
ZGRyX3Qgb2xkc2l6ZSA9IGJsb2NrLT51c2VkX2xlbmd0aDsKKwogICAgIGFzc2VydChibG9jayk7
CiAKICAgICBuZXdzaXplID0gSE9TVF9QQUdFX0FMSUdOKG5ld3NpemUpOwpAQCAtMjEwMiw2ICsy
MTA0LDExIEBAIGludCBxZW11X3JhbV9yZXNpemUoUkFNQmxvY2sgKmJsb2NrLCByYW1fYWRkcl90
IG5ld3NpemUsIEVycm9yICoqZXJycCkKICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CiAgICAgfQog
CisgICAgLyogTm90aWZ5IGJlZm9yZSBtb2RpZnlpbmcgdGhlIHJhbSBibG9jayBhbmQgdG91Y2hp
bmcgdGhlIGJpdG1hcHMuICovCisgICAgaWYgKGJsb2NrLT5ob3N0KSB7CisgICAgICAgIHJhbV9i
bG9ja19ub3RpZnlfcmVzaXplKGJsb2NrLT5ob3N0LCBvbGRzaXplLCBuZXdzaXplKTsKKyAgICB9
CisKICAgICBjcHVfcGh5c2ljYWxfbWVtb3J5X2NsZWFyX2RpcnR5X3JhbmdlKGJsb2NrLT5vZmZz
ZXQsIGJsb2NrLT51c2VkX2xlbmd0aCk7CiAgICAgYmxvY2stPnVzZWRfbGVuZ3RoID0gbmV3c2l6
ZTsKICAgICBjcHVfcGh5c2ljYWxfbWVtb3J5X3NldF9kaXJ0eV9yYW5nZShibG9jay0+b2Zmc2V0
LCBibG9jay0+dXNlZF9sZW5ndGgsCkBAIC0yMjY4LDcgKzIyNzUsOCBAQCBzdGF0aWMgdm9pZCBy
YW1fYmxvY2tfYWRkKFJBTUJsb2NrICpuZXdfYmxvY2ssIEVycm9yICoqZXJycCwgYm9vbCBzaGFy
ZWQpCiAgICAgICAgICAgICBxZW11X21hZHZpc2UobmV3X2Jsb2NrLT5ob3N0LCBuZXdfYmxvY2st
Pm1heF9sZW5ndGgsCiAgICAgICAgICAgICAgICAgICAgICAgICAgUUVNVV9NQURWX0RPTlRGT1JL
KTsKICAgICAgICAgfQotICAgICAgICByYW1fYmxvY2tfbm90aWZ5X2FkZChuZXdfYmxvY2stPmhv
c3QsIG5ld19ibG9jay0+bWF4X2xlbmd0aCk7CisgICAgICAgIHJhbV9ibG9ja19ub3RpZnlfYWRk
KG5ld19ibG9jay0+aG9zdCwgbmV3X2Jsb2NrLT51c2VkX2xlbmd0aCwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbmV3X2Jsb2NrLT5tYXhfbGVuZ3RoKTsKICAgICB9CiB9CiAKQEAgLTI0
NDgsNyArMjQ1Niw4IEBAIHZvaWQgcWVtdV9yYW1fZnJlZShSQU1CbG9jayAqYmxvY2spCiAgICAg
fQogCiAgICAgaWYgKGJsb2NrLT5ob3N0KSB7Ci0gICAgICAgIHJhbV9ibG9ja19ub3RpZnlfcmVt
b3ZlKGJsb2NrLT5ob3N0LCBibG9jay0+bWF4X2xlbmd0aCk7CisgICAgICAgIHJhbV9ibG9ja19u
b3RpZnlfcmVtb3ZlKGJsb2NrLT5ob3N0LCBibG9jay0+dXNlZF9sZW5ndGgsCisgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJsb2NrLT5tYXhfbGVuZ3RoKTsKICAgICB9CiAKICAgICBx
ZW11X211dGV4X2xvY2tfcmFtbGlzdCgpOwpkaWZmIC0tZ2l0IGEvaHcvY29yZS9udW1hLmMgYi9o
dy9jb3JlL251bWEuYwppbmRleCBkYzVlNWI0MDQ2Li5mZTZjYTVjNTBkIDEwMDY0NAotLS0gYS9o
dy9jb3JlL251bWEuYworKysgYi9ody9jb3JlL251bWEuYwpAQCAtODU3LDExICs4NTcsMTIgQEAg
dm9pZCBxdWVyeV9udW1hX25vZGVfbWVtKE51bWFOb2RlTWVtIG5vZGVfbWVtW10sIE1hY2hpbmVT
dGF0ZSAqbXMpCiBzdGF0aWMgaW50IHJhbV9ibG9ja19ub3RpZnlfYWRkX3NpbmdsZShSQU1CbG9j
ayAqcmIsIHZvaWQgKm9wYXF1ZSkKIHsKICAgICBjb25zdCByYW1fYWRkcl90IG1heF9zaXplID0g
cWVtdV9yYW1fZ2V0X21heF9sZW5ndGgocmIpOworICAgIGNvbnN0IHJhbV9hZGRyX3Qgc2l6ZSA9
IHFlbXVfcmFtX2dldF91c2VkX2xlbmd0aChyYik7CiAgICAgdm9pZCAqaG9zdCA9IHFlbXVfcmFt
X2dldF9ob3N0X2FkZHIocmIpOwogICAgIFJBTUJsb2NrTm90aWZpZXIgKm5vdGlmaWVyID0gb3Bh
cXVlOwogCiAgICAgaWYgKGhvc3QpIHsKLSAgICAgICAgbm90aWZpZXItPnJhbV9ibG9ja19hZGRl
ZChub3RpZmllciwgaG9zdCwgbWF4X3NpemUpOworICAgICAgICBub3RpZmllci0+cmFtX2Jsb2Nr
X2FkZGVkKG5vdGlmaWVyLCBob3N0LCBzaXplLCBtYXhfc2l6ZSk7CiAgICAgfQogICAgIHJldHVy
biAwOwogfQpAQCAtODc4LDIwICs4NzksMzEgQEAgdm9pZCByYW1fYmxvY2tfbm90aWZpZXJfcmVt
b3ZlKFJBTUJsb2NrTm90aWZpZXIgKm4pCiAgICAgUUxJU1RfUkVNT1ZFKG4sIG5leHQpOwogfQog
Ci12b2lkIHJhbV9ibG9ja19ub3RpZnlfYWRkKHZvaWQgKmhvc3QsIHNpemVfdCBzaXplKQordm9p
ZCByYW1fYmxvY2tfbm90aWZ5X2FkZCh2b2lkICpob3N0LCBzaXplX3Qgc2l6ZSwgc2l6ZV90IG1h
eF9zaXplKQogewogICAgIFJBTUJsb2NrTm90aWZpZXIgKm5vdGlmaWVyOwogCiAgICAgUUxJU1Rf
Rk9SRUFDSChub3RpZmllciwgJnJhbV9saXN0LnJhbWJsb2NrX25vdGlmaWVycywgbmV4dCkgewot
ICAgICAgICBub3RpZmllci0+cmFtX2Jsb2NrX2FkZGVkKG5vdGlmaWVyLCBob3N0LCBzaXplKTsK
KyAgICAgICAgbm90aWZpZXItPnJhbV9ibG9ja19hZGRlZChub3RpZmllciwgaG9zdCwgc2l6ZSwg
bWF4X3NpemUpOwogICAgIH0KIH0KIAotdm9pZCByYW1fYmxvY2tfbm90aWZ5X3JlbW92ZSh2b2lk
ICpob3N0LCBzaXplX3Qgc2l6ZSkKK3ZvaWQgcmFtX2Jsb2NrX25vdGlmeV9yZW1vdmUodm9pZCAq
aG9zdCwgc2l6ZV90IHNpemUsIHNpemVfdCBtYXhfc2l6ZSkKIHsKICAgICBSQU1CbG9ja05vdGlm
aWVyICpub3RpZmllcjsKIAogICAgIFFMSVNUX0ZPUkVBQ0gobm90aWZpZXIsICZyYW1fbGlzdC5y
YW1ibG9ja19ub3RpZmllcnMsIG5leHQpIHsKLSAgICAgICAgbm90aWZpZXItPnJhbV9ibG9ja19y
ZW1vdmVkKG5vdGlmaWVyLCBob3N0LCBzaXplKTsKKyAgICAgICAgbm90aWZpZXItPnJhbV9ibG9j
a19yZW1vdmVkKG5vdGlmaWVyLCBob3N0LCBzaXplLCBtYXhfc2l6ZSk7CisgICAgfQorfQorCit2
b2lkIHJhbV9ibG9ja19ub3RpZnlfcmVzaXplKHZvaWQgKmhvc3QsIHNpemVfdCBvbGRfc2l6ZSwg
c2l6ZV90IG5ld19zaXplKQoreworICAgIFJBTUJsb2NrTm90aWZpZXIgKm5vdGlmaWVyOworCisg
ICAgUUxJU1RfRk9SRUFDSChub3RpZmllciwgJnJhbV9saXN0LnJhbWJsb2NrX25vdGlmaWVycywg
bmV4dCkgeworICAgICAgICBpZiAobm90aWZpZXItPnJhbV9ibG9ja19yZXNpemVkKSB7CisgICAg
ICAgICAgICBub3RpZmllci0+cmFtX2Jsb2NrX3Jlc2l6ZWQobm90aWZpZXIsIGhvc3QsIG9sZF9z
aXplLCBuZXdfc2l6ZSk7CisgICAgICAgIH0KICAgICB9CiB9CmRpZmYgLS1naXQgYS9ody9pMzg2
L3hlbi94ZW4tbWFwY2FjaGUuYyBiL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCmluZGV4IDVi
MTIwZWQ0NGIuLmQ2ZGNlYTY1ZDEgMTAwNjQ0Ci0tLSBhL2h3L2kzODYveGVuL3hlbi1tYXBjYWNo
ZS5jCisrKyBiL2h3L2kzODYveGVuL3hlbi1tYXBjYWNoZS5jCkBAIC0xNjksNyArMTY5LDggQEAg
c3RhdGljIHZvaWQgeGVuX3JlbWFwX2J1Y2tldChNYXBDYWNoZUVudHJ5ICplbnRyeSwKIAogICAg
IGlmIChlbnRyeS0+dmFkZHJfYmFzZSAhPSBOVUxMKSB7CiAgICAgICAgIGlmICghKGVudHJ5LT5m
bGFncyAmIFhFTl9NQVBDQUNIRV9FTlRSWV9EVU1NWSkpIHsKLSAgICAgICAgICAgIHJhbV9ibG9j
a19ub3RpZnlfcmVtb3ZlKGVudHJ5LT52YWRkcl9iYXNlLCBlbnRyeS0+c2l6ZSk7CisgICAgICAg
ICAgICByYW1fYmxvY2tfbm90aWZ5X3JlbW92ZShlbnRyeS0+dmFkZHJfYmFzZSwgZW50cnktPnNp
emUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBlbnRyeS0+c2l6ZSk7CiAg
ICAgICAgIH0KICAgICAgICAgaWYgKG11bm1hcChlbnRyeS0+dmFkZHJfYmFzZSwgZW50cnktPnNp
emUpICE9IDApIHsKICAgICAgICAgICAgIHBlcnJvcigidW5tYXAgZmFpbHMiKTsKQEAgLTIxMSw3
ICsyMTIsNyBAQCBzdGF0aWMgdm9pZCB4ZW5fcmVtYXBfYnVja2V0KE1hcENhY2hlRW50cnkgKmVu
dHJ5LAogICAgIH0KIAogICAgIGlmICghKGVudHJ5LT5mbGFncyAmIFhFTl9NQVBDQUNIRV9FTlRS
WV9EVU1NWSkpIHsKLSAgICAgICAgcmFtX2Jsb2NrX25vdGlmeV9hZGQodmFkZHJfYmFzZSwgc2l6
ZSk7CisgICAgICAgIHJhbV9ibG9ja19ub3RpZnlfYWRkKHZhZGRyX2Jhc2UsIHNpemUsIHNpemUp
OwogICAgIH0KIAogICAgIGVudHJ5LT52YWRkcl9iYXNlID0gdmFkZHJfYmFzZTsKQEAgLTQ1Miw3
ICs0NTMsNyBAQCBzdGF0aWMgdm9pZCB4ZW5faW52YWxpZGF0ZV9tYXBfY2FjaGVfZW50cnlfdW5s
b2NrZWQodWludDhfdCAqYnVmZmVyKQogICAgIH0KIAogICAgIHBlbnRyeS0+bmV4dCA9IGVudHJ5
LT5uZXh0OwotICAgIHJhbV9ibG9ja19ub3RpZnlfcmVtb3ZlKGVudHJ5LT52YWRkcl9iYXNlLCBl
bnRyeS0+c2l6ZSk7CisgICAgcmFtX2Jsb2NrX25vdGlmeV9yZW1vdmUoZW50cnktPnZhZGRyX2Jh
c2UsIGVudHJ5LT5zaXplLCBlbnRyeS0+c2l6ZSk7CiAgICAgaWYgKG11bm1hcChlbnRyeS0+dmFk
ZHJfYmFzZSwgZW50cnktPnNpemUpICE9IDApIHsKICAgICAgICAgcGVycm9yKCJ1bm1hcCBmYWls
cyIpOwogICAgICAgICBleGl0KC0xKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZXhlYy9yYW1saXN0
LmggYi9pbmNsdWRlL2V4ZWMvcmFtbGlzdC5oCmluZGV4IGJjNGZhYTFiMDAuLjI5M2MwZGRhYmUg
MTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZXhlYy9yYW1saXN0LmgKKysrIGIvaW5jbHVkZS9leGVjL3Jh
bWxpc3QuaApAQCAtNjUsMTUgKzY1LDIwIEBAIHZvaWQgcWVtdV9tdXRleF9sb2NrX3JhbWxpc3Qo
dm9pZCk7CiB2b2lkIHFlbXVfbXV0ZXhfdW5sb2NrX3JhbWxpc3Qodm9pZCk7CiAKIHN0cnVjdCBS
QU1CbG9ja05vdGlmaWVyIHsKLSAgICB2b2lkICgqcmFtX2Jsb2NrX2FkZGVkKShSQU1CbG9ja05v
dGlmaWVyICpuLCB2b2lkICpob3N0LCBzaXplX3Qgc2l6ZSk7Ci0gICAgdm9pZCAoKnJhbV9ibG9j
a19yZW1vdmVkKShSQU1CbG9ja05vdGlmaWVyICpuLCB2b2lkICpob3N0LCBzaXplX3Qgc2l6ZSk7
CisgICAgdm9pZCAoKnJhbV9ibG9ja19hZGRlZCkoUkFNQmxvY2tOb3RpZmllciAqbiwgdm9pZCAq
aG9zdCwgc2l6ZV90IHNpemUsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IG1h
eF9zaXplKTsKKyAgICB2b2lkICgqcmFtX2Jsb2NrX3JlbW92ZWQpKFJBTUJsb2NrTm90aWZpZXIg
Km4sIHZvaWQgKmhvc3QsIHNpemVfdCBzaXplLAorICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2l6ZV90IG1heF9zaXplKTsKKyAgICB2b2lkICgqcmFtX2Jsb2NrX3Jlc2l6ZWQpKFJBTUJs
b2NrTm90aWZpZXIgKm4sIHZvaWQgKmhvc3QsIHNpemVfdCBvbGRfc2l6ZSwKKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHNpemVfdCBuZXdfc2l6ZSk7CiAgICAgUUxJU1RfRU5UUlkoUkFN
QmxvY2tOb3RpZmllcikgbmV4dDsKIH07CiAKIHZvaWQgcmFtX2Jsb2NrX25vdGlmaWVyX2FkZChS
QU1CbG9ja05vdGlmaWVyICpuKTsKIHZvaWQgcmFtX2Jsb2NrX25vdGlmaWVyX3JlbW92ZShSQU1C
bG9ja05vdGlmaWVyICpuKTsKLXZvaWQgcmFtX2Jsb2NrX25vdGlmeV9hZGQodm9pZCAqaG9zdCwg
c2l6ZV90IHNpemUpOwotdm9pZCByYW1fYmxvY2tfbm90aWZ5X3JlbW92ZSh2b2lkICpob3N0LCBz
aXplX3Qgc2l6ZSk7Cit2b2lkIHJhbV9ibG9ja19ub3RpZnlfYWRkKHZvaWQgKmhvc3QsIHNpemVf
dCBzaXplLCBzaXplX3QgbWF4X3NpemUpOwordm9pZCByYW1fYmxvY2tfbm90aWZ5X3JlbW92ZSh2
b2lkICpob3N0LCBzaXplX3Qgc2l6ZSwgc2l6ZV90IG1heF9zaXplKTsKK3ZvaWQgcmFtX2Jsb2Nr
X25vdGlmeV9yZXNpemUodm9pZCAqaG9zdCwgc2l6ZV90IG9sZF9zaXplLCBzaXplX3QgbmV3X3Np
emUpOwogCiB2b2lkIHJhbV9ibG9ja19kdW1wKE1vbml0b3IgKm1vbik7CiAKZGlmZiAtLWdpdCBh
L3RhcmdldC9pMzg2L2hheC1tZW0uYyBiL3RhcmdldC9pMzg2L2hheC1tZW0uYwppbmRleCA2YmI1
YTI0OTE3Li40NTRkN2ZiMjEyIDEwMDY0NAotLS0gYS90YXJnZXQvaTM4Ni9oYXgtbWVtLmMKKysr
IGIvdGFyZ2V0L2kzODYvaGF4LW1lbS5jCkBAIC0yOTMsNyArMjkzLDggQEAgc3RhdGljIE1lbW9y
eUxpc3RlbmVyIGhheF9tZW1vcnlfbGlzdGVuZXIgPSB7CiAgICAgLnByaW9yaXR5ID0gMTAsCiB9
OwogCi1zdGF0aWMgdm9pZCBoYXhfcmFtX2Jsb2NrX2FkZGVkKFJBTUJsb2NrTm90aWZpZXIgKm4s
IHZvaWQgKmhvc3QsIHNpemVfdCBzaXplKQorc3RhdGljIHZvaWQgaGF4X3JhbV9ibG9ja19hZGRl
ZChSQU1CbG9ja05vdGlmaWVyICpuLCB2b2lkICpob3N0LCBzaXplX3Qgc2l6ZSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IG1heF9zaXplKQogewogICAgIC8qCiAgICAg
ICogV2UgbXVzdCByZWdpc3RlciBlYWNoIFJBTSBibG9jayB3aXRoIHRoZSBIQVhNIGtlcm5lbCBt
b2R1bGUsIG9yCkBAIC0zMDQsNyArMzA1LDcgQEAgc3RhdGljIHZvaWQgaGF4X3JhbV9ibG9ja19h
ZGRlZChSQU1CbG9ja05vdGlmaWVyICpuLCB2b2lkICpob3N0LCBzaXplX3Qgc2l6ZSkKICAgICAg
KiBob3N0IHBoeXNpY2FsIHBhZ2VzIGZvciB0aGUgUkFNIGJsb2NrIGFzIHBhcnQgb2YgdGhpcyBy
ZWdpc3RyYXRpb24KICAgICAgKiBwcm9jZXNzLCBoZW5jZSB0aGUgbmFtZSBoYXhfcG9wdWxhdGVf
cmFtKCkuCiAgICAgICovCi0gICAgaWYgKGhheF9wb3B1bGF0ZV9yYW0oKHVpbnQ2NF90KSh1aW50
cHRyX3QpaG9zdCwgc2l6ZSkgPCAwKSB7CisgICAgaWYgKGhheF9wb3B1bGF0ZV9yYW0oKHVpbnQ2
NF90KSh1aW50cHRyX3QpaG9zdCwgbWF4X3NpemUpIDwgMCkgewogICAgICAgICBmcHJpbnRmKHN0
ZGVyciwgIkhBWCBmYWlsZWQgdG8gcG9wdWxhdGUgUkFNXG4iKTsKICAgICAgICAgYWJvcnQoKTsK
ICAgICB9CmRpZmYgLS1naXQgYS90YXJnZXQvaTM4Ni9zZXYuYyBiL3RhcmdldC9pMzg2L3Nldi5j
CmluZGV4IDAyNGJiMjRlNTEuLjZiNGNlZTI0YTIgMTAwNjQ0Ci0tLSBhL3RhcmdldC9pMzg2L3Nl
di5jCisrKyBiL3RhcmdldC9pMzg2L3Nldi5jCkBAIC0xMjksNyArMTI5LDggQEAgc2V2X3NldF9n
dWVzdF9zdGF0ZShTZXZTdGF0ZSBuZXdfc3RhdGUpCiB9CiAKIHN0YXRpYyB2b2lkCi1zZXZfcmFt
X2Jsb2NrX2FkZGVkKFJBTUJsb2NrTm90aWZpZXIgKm4sIHZvaWQgKmhvc3QsIHNpemVfdCBzaXpl
KQorc2V2X3JhbV9ibG9ja19hZGRlZChSQU1CbG9ja05vdGlmaWVyICpuLCB2b2lkICpob3N0LCBz
aXplX3Qgc2l6ZSwKKyAgICAgICAgICAgICAgICAgICAgc2l6ZV90IG1heF9zaXplKQogewogICAg
IGludCByOwogICAgIHN0cnVjdCBrdm1fZW5jX3JlZ2lvbiByYW5nZTsKQEAgLTE0NiwxOSArMTQ3
LDIwIEBAIHNldl9yYW1fYmxvY2tfYWRkZWQoUkFNQmxvY2tOb3RpZmllciAqbiwgdm9pZCAqaG9z
dCwgc2l6ZV90IHNpemUpCiAgICAgfQogCiAgICAgcmFuZ2UuYWRkciA9IChfX3U2NCkodW5zaWdu
ZWQgbG9uZylob3N0OwotICAgIHJhbmdlLnNpemUgPSBzaXplOworICAgIHJhbmdlLnNpemUgPSBt
YXhfc2l6ZTsKIAotICAgIHRyYWNlX2t2bV9tZW1jcnlwdF9yZWdpc3Rlcl9yZWdpb24oaG9zdCwg
c2l6ZSk7CisgICAgdHJhY2Vfa3ZtX21lbWNyeXB0X3JlZ2lzdGVyX3JlZ2lvbihob3N0LCBtYXhf
c2l6ZSk7CiAgICAgciA9IGt2bV92bV9pb2N0bChrdm1fc3RhdGUsIEtWTV9NRU1PUllfRU5DUllQ
VF9SRUdfUkVHSU9OLCAmcmFuZ2UpOwogICAgIGlmIChyKSB7CiAgICAgICAgIGVycm9yX3JlcG9y
dCgiJXM6IGZhaWxlZCB0byByZWdpc3RlciByZWdpb24gKCVwKyUjengpIGVycm9yICclcyciLAot
ICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGhvc3QsIHNpemUsIHN0cmVycm9yKGVycm5v
KSk7CisgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaG9zdCwgbWF4X3NpemUsIHN0cmVy
cm9yKGVycm5vKSk7CiAgICAgICAgIGV4aXQoMSk7CiAgICAgfQogfQogCiBzdGF0aWMgdm9pZAot
c2V2X3JhbV9ibG9ja19yZW1vdmVkKFJBTUJsb2NrTm90aWZpZXIgKm4sIHZvaWQgKmhvc3QsIHNp
emVfdCBzaXplKQorc2V2X3JhbV9ibG9ja19yZW1vdmVkKFJBTUJsb2NrTm90aWZpZXIgKm4sIHZv
aWQgKmhvc3QsIHNpemVfdCBzaXplLAorICAgICAgICAgICAgICAgICAgICAgIHNpemVfdCBtYXhf
c2l6ZSkKIHsKICAgICBpbnQgcjsKICAgICBzdHJ1Y3Qga3ZtX2VuY19yZWdpb24gcmFuZ2U7CkBA
IC0xNzUsMTMgKzE3NywxMyBAQCBzZXZfcmFtX2Jsb2NrX3JlbW92ZWQoUkFNQmxvY2tOb3RpZmll
ciAqbiwgdm9pZCAqaG9zdCwgc2l6ZV90IHNpemUpCiAgICAgfQogCiAgICAgcmFuZ2UuYWRkciA9
IChfX3U2NCkodW5zaWduZWQgbG9uZylob3N0OwotICAgIHJhbmdlLnNpemUgPSBzaXplOworICAg
IHJhbmdlLnNpemUgPSBtYXhfc2l6ZTsKIAotICAgIHRyYWNlX2t2bV9tZW1jcnlwdF91bnJlZ2lz
dGVyX3JlZ2lvbihob3N0LCBzaXplKTsKKyAgICB0cmFjZV9rdm1fbWVtY3J5cHRfdW5yZWdpc3Rl
cl9yZWdpb24oaG9zdCwgbWF4X3NpemUpOwogICAgIHIgPSBrdm1fdm1faW9jdGwoa3ZtX3N0YXRl
LCBLVk1fTUVNT1JZX0VOQ1JZUFRfVU5SRUdfUkVHSU9OLCAmcmFuZ2UpOwogICAgIGlmIChyKSB7
CiAgICAgICAgIGVycm9yX3JlcG9ydCgiJXM6IGZhaWxlZCB0byB1bnJlZ2lzdGVyIHJlZ2lvbiAo
JXArJSN6eCkiLAotICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGhvc3QsIHNpemUpOwor
ICAgICAgICAgICAgICAgICAgICAgX19mdW5jX18sIGhvc3QsIG1heF9zaXplKTsKICAgICB9CiB9
CiAKZGlmZiAtLWdpdCBhL3V0aWwvdmZpby1oZWxwZXJzLmMgYi91dGlsL3ZmaW8taGVscGVycy5j
CmluZGV4IDI2MDU3MGFlMTkuLjllYzAxYmZlMjYgMTAwNjQ0Ci0tLSBhL3V0aWwvdmZpby1oZWxw
ZXJzLmMKKysrIGIvdXRpbC92ZmlvLWhlbHBlcnMuYwpAQCAtMzcyLDI2ICszNzIsMjYgQEAgZmFp
bF9jb250YWluZXI6CiAgICAgcmV0dXJuIHJldDsKIH0KIAotc3RhdGljIHZvaWQgcWVtdV92Zmlv
X3JhbV9ibG9ja19hZGRlZChSQU1CbG9ja05vdGlmaWVyICpuLAotICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICpob3N0LCBzaXplX3Qgc2l6ZSkKK3N0YXRpYyB2b2lk
IHFlbXVfdmZpb19yYW1fYmxvY2tfYWRkZWQoUkFNQmxvY2tOb3RpZmllciAqbiwgdm9pZCAqaG9z
dCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZV90IHNpemUsIHNp
emVfdCBtYXhfc2l6ZSkKIHsKICAgICBRRU1VVkZJT1N0YXRlICpzID0gY29udGFpbmVyX29mKG4s
IFFFTVVWRklPU3RhdGUsIHJhbV9ub3RpZmllcik7CiAgICAgaW50IHJldDsKIAotICAgIHRyYWNl
X3FlbXVfdmZpb19yYW1fYmxvY2tfYWRkZWQocywgaG9zdCwgc2l6ZSk7Ci0gICAgcmV0ID0gcWVt
dV92ZmlvX2RtYV9tYXAocywgaG9zdCwgc2l6ZSwgZmFsc2UsIE5VTEwpOworICAgIHRyYWNlX3Fl
bXVfdmZpb19yYW1fYmxvY2tfYWRkZWQocywgaG9zdCwgbWF4X3NpemUpOworICAgIHJldCA9IHFl
bXVfdmZpb19kbWFfbWFwKHMsIGhvc3QsIG1heF9zaXplLCBmYWxzZSwgTlVMTCk7CiAgICAgaWYg
KHJldCkgewotICAgICAgICBlcnJvcl9yZXBvcnQoInFlbXVfdmZpb19kbWFfbWFwKCVwLCAlenUp
IGZhaWxlZDogJXMiLCBob3N0LCBzaXplLAorICAgICAgICBlcnJvcl9yZXBvcnQoInFlbXVfdmZp
b19kbWFfbWFwKCVwLCAlenUpIGZhaWxlZDogJXMiLCBob3N0LCBtYXhfc2l6ZSwKICAgICAgICAg
ICAgICAgICAgICAgIHN0cmVycm9yKC1yZXQpKTsKICAgICB9CiB9CiAKLXN0YXRpYyB2b2lkIHFl
bXVfdmZpb19yYW1fYmxvY2tfcmVtb3ZlZChSQU1CbG9ja05vdGlmaWVyICpuLAotICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmhvc3QsIHNpemVfdCBzaXplKQor
c3RhdGljIHZvaWQgcWVtdV92ZmlvX3JhbV9ibG9ja19yZW1vdmVkKFJBTUJsb2NrTm90aWZpZXIg
Km4sIHZvaWQgKmhvc3QsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
c2l6ZV90IHNpemUsIHNpemVfdCBtYXhfc2l6ZSkKIHsKICAgICBRRU1VVkZJT1N0YXRlICpzID0g
Y29udGFpbmVyX29mKG4sIFFFTVVWRklPU3RhdGUsIHJhbV9ub3RpZmllcik7CiAgICAgaWYgKGhv
c3QpIHsKLSAgICAgICAgdHJhY2VfcWVtdV92ZmlvX3JhbV9ibG9ja19yZW1vdmVkKHMsIGhvc3Qs
IHNpemUpOworICAgICAgICB0cmFjZV9xZW11X3ZmaW9fcmFtX2Jsb2NrX3JlbW92ZWQocywgaG9z
dCwgbWF4X3NpemUpOwogICAgICAgICBxZW11X3ZmaW9fZG1hX3VubWFwKHMsIGhvc3QpOwogICAg
IH0KIH0KLS0gCjIuMjQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
