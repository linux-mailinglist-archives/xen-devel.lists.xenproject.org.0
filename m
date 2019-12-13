Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2011E81B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:22:04 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifnfg-0000j4-7v; Fri, 13 Dec 2019 16:20:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifnfe-0000aw-O5
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:20:02 +0000
X-Inumbo-ID: 6568569a-1dc4-11ea-a914-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 6568569a-1dc4-11ea-a914-bc764e2007e4;
 Fri, 13 Dec 2019 16:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=psjmWWDdVhLhKwDb1Wq8yYWFEUJUVcwEEB0iH9Xv/kA=;
 b=Nfy7zHBJEdilzAJnjb4XMffrbB907kyCRzm0FbdKOlR9dknJ7U9w/dq8+qrD2eW03mMf+5
 A+75QNNc22NM6Y9BC0QCgjlLTALzM2slucuOp1RXkvmrMvOtKjmKG36snfFCOamCt740X6
 ceYM0N4R9ij/Qmy9CdXPaXLevg92IM8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-XiV1IY8PM82PJ_OyDAlfBg-1; Fri, 13 Dec 2019 11:19:50 -0500
X-MC-Unique: XiV1IY8PM82PJ_OyDAlfBg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE9211856A65;
 Fri, 13 Dec 2019 16:19:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 070AE19C4F;
 Fri, 13 Dec 2019 16:19:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:49 +0100
Message-Id: <20191213161753.8051-9-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 08/12] hw/ide/piix: Use ARRAY_SIZE() instead of
 magic numbers
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VXNpbmcgbWFnaWMgbnVtYmVycyBpcyBkYW5nZXJvdXMgYmVjYXVzZSB0aGUgc3RydWN0dXJlcyBQ
Q0lJREVTdGF0ZQptaWdodCBiZSBtb2RpZmllZCBhbmQgdGhpcyBzb3VyY2UgZmlsZSBjb25zdW1p
bmcgdGhlICJpZGUvcGNpLmgiCmhlYWRlciB3b3VsZCBiZSBvdXQgb2Ygc3luYywgZXZlbnR1YWxs
eSBhY2Nlc3Npbmcgb3V0IG9mIGJvdW5kCmFycmF5IG1lbWJlcnMuClVzZSB0aGUgQVJSQVlfU0la
RSgpIHRvIGtlZXAgdGhlIHNvdXJjZSBmaWxlIHN5bmMuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvaWRlL3BpaXguYyB8
IDI2ICsrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0
aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaWRlL3BpaXguYyBiL2h3
L2lkZS9waWl4LmMKaW5kZXggZmZlZmY0ZTA5NS4uYWIyMzYxM2E0NCAxMDA2NDQKLS0tIGEvaHcv
aWRlL3BpaXguYworKysgYi9ody9pZGUvcGlpeC5jCkBAIC04NywxMCArODcsOSBAQCBzdGF0aWMg
Y29uc3QgTWVtb3J5UmVnaW9uT3BzIHBpaXhfYm1kbWFfb3BzID0gewogCiBzdGF0aWMgdm9pZCBi
bWRtYV9zZXR1cF9iYXIoUENJSURFU3RhdGUgKmQpCiB7Ci0gICAgaW50IGk7Ci0KICAgICBtZW1v
cnlfcmVnaW9uX2luaXQoJmQtPmJtZG1hX2JhciwgT0JKRUNUKGQpLCAicGlpeC1ibWRtYS1jb250
YWluZXIiLCAxNik7Ci0gICAgZm9yKGkgPSAwO2kgPCAyOyBpKyspIHsKKworICAgIGZvciAoc2l6
ZV90IGkgPSAwOyBpIDwgQVJSQVlfU0laRShkLT5ibWRtYSk7IGkrKykgewogICAgICAgICBCTURN
QVN0YXRlICpibSA9ICZkLT5ibWRtYVtpXTsKIAogICAgICAgICBtZW1vcnlfcmVnaW9uX2luaXRf
aW8oJmJtLT5leHRyYV9pbywgT0JKRUNUKGQpLCAmcGlpeF9ibWRtYV9vcHMsIGJtLApAQCAtMTA3
LDkgKzEwNiw4IEBAIHN0YXRpYyB2b2lkIHBpaXhfaWRlX3Jlc2V0KERldmljZVN0YXRlICpkZXYp
CiAgICAgUENJSURFU3RhdGUgKmQgPSBQQ0lfSURFKGRldik7CiAgICAgUENJRGV2aWNlICpwZCA9
IFBDSV9ERVZJQ0UoZCk7CiAgICAgdWludDhfdCAqcGNpX2NvbmYgPSBwZC0+Y29uZmlnOwotICAg
IGludCBpOwogCi0gICAgZm9yIChpID0gMDsgaSA8IDI7IGkrKykgeworICAgIGZvciAoc2l6ZV90
IGkgPSAwOyBpIDwgQVJSQVlfU0laRShkLT5idXMpOyBpKyspIHsKICAgICAgICAgaWRlX2J1c19y
ZXNldCgmZC0+YnVzW2ldKTsKICAgICB9CiAKQEAgLTEzMiwxMCArMTMwLDEwIEBAIHN0YXRpYyB2
b2lkIHBjaV9waWl4X2luaXRfcG9ydHMoUENJSURFU3RhdGUgKmQpIHsKICAgICAgICAgezB4MWYw
LCAweDNmNiwgMTR9LAogICAgICAgICB7MHgxNzAsIDB4Mzc2LCAxNX0sCiAgICAgfTsKLSAgICBp
bnQgaTsKIAotICAgIGZvciAoaSA9IDA7IGkgPCAyOyBpKyspIHsKLSAgICAgICAgaWRlX2J1c19u
ZXcoJmQtPmJ1c1tpXSwgc2l6ZW9mKGQtPmJ1c1tpXSksIERFVklDRShkKSwgaSwgMik7CisgICAg
Zm9yIChzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGQtPmJ1cyk7IGkrKykgeworICAgICAg
ICBpZGVfYnVzX25ldygmZC0+YnVzW2ldLCBzaXplb2YoZC0+YnVzW2ldKSwgREVWSUNFKGQpLCBp
LAorICAgICAgICAgICAgICAgICAgICBBUlJBWV9TSVpFKGQtPmJ1c1swXS5pZnMpKTsKICAgICAg
ICAgaWRlX2luaXRfaW9wb3J0KCZkLT5idXNbaV0sIE5VTEwsIHBvcnRfaW5mb1tpXS5pb2Jhc2Us
CiAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0X2luZm9baV0uaW9iYXNlMik7CiAgICAgICAg
IGlkZV9pbml0MigmZC0+YnVzW2ldLCBpc2FfZ2V0X2lycShOVUxMLCBwb3J0X2luZm9baV0uaXNh
aXJxKSk7CkBAIC0xNjMsMTQgKzE2MSwxMyBAQCBzdGF0aWMgdm9pZCBwY2lfcGlpeF9pZGVfcmVh
bGl6ZShQQ0lEZXZpY2UgKmRldiwgRXJyb3IgKiplcnJwKQogCiBpbnQgcGNpX3BpaXgzX3hlbl9p
ZGVfdW5wbHVnKERldmljZVN0YXRlICpkZXYsIGJvb2wgYXV4KQogewotICAgIFBDSUlERVN0YXRl
ICpwY2lfaWRlOworICAgIFBDSUlERVN0YXRlICpwY2lfaWRlID0gUENJX0lERShkZXYpOwogICAg
IERyaXZlSW5mbyAqZGk7Ci0gICAgaW50IGk7CiAgICAgSURFRGV2aWNlICppZGVkZXY7CisgICAg
Y29uc3Qgc2l6ZV90IGlkZWRldl9tYXggPSBBUlJBWV9TSVpFKHBjaV9pZGUtPmJ1cykKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAqIEFSUkFZX1NJWkUocGNpX2lkZS0+YnVzWzBdLmlmcyk7
CiAKLSAgICBwY2lfaWRlID0gUENJX0lERShkZXYpOwotCi0gICAgZm9yIChpID0gYXV4ID8gMSA6
IDA7IGkgPCA0OyBpKyspIHsKKyAgICBmb3IgKHNpemVfdCBpID0gYXV4ID8gMSA6IDA7IGkgPCBp
ZGVkZXZfbWF4OyBpKyspIHsKICAgICAgICAgZGkgPSBkcml2ZV9nZXRfYnlfaW5kZXgoSUZfSURF
LCBpKTsKICAgICAgICAgaWYgKGRpICE9IE5VTEwgJiYgIWRpLT5tZWRpYV9jZCkgewogICAgICAg
ICAgICAgQmxvY2tCYWNrZW5kICpibGsgPSBibGtfYnlfbGVnYWN5X2RpbmZvKGRpKTsKQEAgLTIx
MCw5ICsyMDcsOCBAQCBQQ0lEZXZpY2UgKnBjaV9waWl4M194ZW5faWRlX2luaXQoUENJQnVzICpi
dXMsIERyaXZlSW5mbyAqKmhkX3RhYmxlLCBpbnQgZGV2Zm4pCiBzdGF0aWMgdm9pZCBwY2lfcGlp
eF9pZGVfZXhpdGZuKFBDSURldmljZSAqZGV2KQogewogICAgIFBDSUlERVN0YXRlICpkID0gUENJ
X0lERShkZXYpOwotICAgIHVuc2lnbmVkIGk7CiAKLSAgICBmb3IgKGkgPSAwOyBpIDwgMjsgKytp
KSB7CisgICAgZm9yIChzaXplX3QgaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGQtPmJtZG1hKTsgKytp
KSB7CiAgICAgICAgIG1lbW9yeV9yZWdpb25fZGVsX3N1YnJlZ2lvbigmZC0+Ym1kbWFfYmFyLCAm
ZC0+Ym1kbWFbaV0uZXh0cmFfaW8pOwogICAgICAgICBtZW1vcnlfcmVnaW9uX2RlbF9zdWJyZWdp
b24oJmQtPmJtZG1hX2JhciwgJmQtPmJtZG1hW2ldLmFkZHJfaW9wb3J0KTsKICAgICB9Ci0tIAoy
LjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
