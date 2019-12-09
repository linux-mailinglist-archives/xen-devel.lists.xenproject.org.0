Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B21116A2F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:52:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFgY-0004PM-5o; Mon, 09 Dec 2019 09:50:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3VR8=Z7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ieFgX-0004P4-2F
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:50:33 +0000
X-Inumbo-ID: 5605b459-1a69-11ea-87af-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5605b459-1a69-11ea-87af-12813bfff9fa;
 Mon, 09 Dec 2019 09:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=65dn2EaMCTP37YOCYHLxZUlHztk6cKACuH+ML1W/q/Y=;
 b=FbT1BtM+ats12IGQYugzBIR4/YSU68bbLczAyWMSNsDdjA/P20a5qLWxruUiI6WG3kJl9p
 6OsY6Uo+ahQuB+FyQJz+D73bnOsDaafE2oSUZE1v7Oqw0yU0o7nd5oGb2cNa88Clq7gSuE
 fniY2zBc6fyAXKRTkDf0O3X8XSqUM4A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-iZ-_Yi-lPHK3MEi807cAbQ-1; Mon, 09 Dec 2019 04:50:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 581F01800D45;
 Mon,  9 Dec 2019 09:50:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-142.brq.redhat.com [10.40.205.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B2519C5B;
 Mon,  9 Dec 2019 09:50:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Dec 2019 10:49:58 +0100
Message-Id: <20191209095002.32194-3-philmd@redhat.com>
In-Reply-To: <20191209095002.32194-1-philmd@redhat.com>
References: <20191209095002.32194-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: iZ-_Yi-lPHK3MEi807cAbQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH-for-5.0 v3 2/6] hw/pci-host/i440fx: Extract
 PCII440FXState to "hw/pci-host/i440fx.h"
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TWFrZSB0aGUgUENJSTQ0MEZYU3RhdGUgc3RydWN0dXJlIHB1YmxpYywgc28gaXQgY2FuIGJlIHVz
ZWQgb3V0IG9mCnRoaXMgc291cmNlIGZpbGUuIFRoaXMgd2lsbCBhbGxvdyB1cyB0byBleHRyYWN0
IHRoZSBJR0QgUGFzc3Rocm91Z2gKSG9zdCBCcmlkZ2UsIHdoaWNoIGlzIGEgY2hpbGRyZW4gb2Yg
dGhlIFRZUEVfSTQ0MEZYX1BDSV9ERVZJQ0UuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRo
aWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaW5jbHVkZS9ody9wY2ktaG9zdC9p
NDQwZnguaCB8IDE5ICsrKysrKysrKysrKysrKysrLS0KIGh3L3BjaS1ob3N0L2k0NDBmeC5jICAg
ICAgICAgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9wY2ktaG9z
dC9pNDQwZnguaCBiL2luY2x1ZGUvaHcvcGNpLWhvc3QvaTQ0MGZ4LmgKaW5kZXggZjU0ZTY0NjZl
NC4uY2M1OGQ4MmVkNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9wY2ktaG9zdC9pNDQwZnguaAor
KysgYi9pbmNsdWRlL2h3L3BjaS1ob3N0L2k0NDBmeC5oCkBAIC0xMywxMiArMTMsMjcgQEAKIAog
I2luY2x1ZGUgImh3L2h3LmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaV9idXMuaCIKLQotdHlwZWRl
ZiBzdHJ1Y3QgUENJSTQ0MEZYU3RhdGUgUENJSTQ0MEZYU3RhdGU7CisjaW5jbHVkZSAiaHcvcGNp
LWhvc3QvcGFtLmgiCiAKICNkZWZpbmUgVFlQRV9JNDQwRlhfUENJX0hPU1RfQlJJREdFICJpNDQw
RlgtcGNpaG9zdCIKICNkZWZpbmUgVFlQRV9JNDQwRlhfUENJX0RFVklDRSAiaTQ0MEZYIgogCisj
ZGVmaW5lIEk0NDBGWF9QQ0lfREVWSUNFKG9iaikgXAorICAgIE9CSkVDVF9DSEVDSyhQQ0lJNDQw
RlhTdGF0ZSwgKG9iaiksIFRZUEVfSTQ0MEZYX1BDSV9ERVZJQ0UpCisKK3R5cGVkZWYgc3RydWN0
IFBDSUk0NDBGWFN0YXRlIHsKKyAgICAvKjwgcHJpdmF0ZSA+Ki8KKyAgICBQQ0lEZXZpY2UgcGFy
ZW50X29iajsKKyAgICAvKjwgcHVibGljID4qLworCisgICAgTWVtb3J5UmVnaW9uICpzeXN0ZW1f
bWVtb3J5OworICAgIE1lbW9yeVJlZ2lvbiAqcGNpX2FkZHJlc3Nfc3BhY2U7CisgICAgTWVtb3J5
UmVnaW9uICpyYW1fbWVtb3J5OworICAgIFBBTU1lbW9yeVJlZ2lvbiBwYW1fcmVnaW9uc1sxM107
CisgICAgTWVtb3J5UmVnaW9uIHNtcmFtX3JlZ2lvbjsKKyAgICBNZW1vcnlSZWdpb24gc21yYW0s
IGxvd19zbXJhbTsKK30gUENJSTQ0MEZYU3RhdGU7CisKICNkZWZpbmUgVFlQRV9JR0RfUEFTU1RI
Uk9VR0hfSTQ0MEZYX1BDSV9ERVZJQ0UgImlnZC1wYXNzdGhyb3VnaC1pNDQwRlgiCiAKIFBDSUJ1
cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBlLCBjb25zdCBjaGFyICpwY2lfdHlw
ZSwKZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L2k0NDBmeC5jIGIvaHcvcGNpLWhvc3QvaTQ0MGZ4
LmMKaW5kZXggM2ZjOTQ0MjZlYS4uZmJkYzU2MzU5OSAxMDA2NDQKLS0tIGEvaHcvcGNpLWhvc3Qv
aTQ0MGZ4LmMKKysrIGIvaHcvcGNpLWhvc3QvaTQ0MGZ4LmMKQEAgLTMxLDcgKzMxLDYgQEAKICNp
bmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCiAjaW5jbHVkZSAi
bWlncmF0aW9uL3Ztc3RhdGUuaCIKLSNpbmNsdWRlICJody9wY2ktaG9zdC9wYW0uaCIKICNpbmNs
dWRlICJxYXBpL3Zpc2l0b3IuaCIKICNpbmNsdWRlICJxZW11L2Vycm9yLXJlcG9ydC5oIgogCkBA
IC01MSwyMyArNTAsNiBAQCB0eXBlZGVmIHN0cnVjdCBJNDQwRlhTdGF0ZSB7CiAgICAgdWludDMy
X3Qgc2hvcnRfcm9vdF9idXM7CiB9IEk0NDBGWFN0YXRlOwogCi0jZGVmaW5lIEk0NDBGWF9QQ0lf
REVWSUNFKG9iaikgXAotICAgIE9CSkVDVF9DSEVDSyhQQ0lJNDQwRlhTdGF0ZSwgKG9iaiksIFRZ
UEVfSTQ0MEZYX1BDSV9ERVZJQ0UpCi0KLXN0cnVjdCBQQ0lJNDQwRlhTdGF0ZSB7Ci0gICAgLyo8
IHByaXZhdGUgPiovCi0gICAgUENJRGV2aWNlIHBhcmVudF9vYmo7Ci0gICAgLyo8IHB1YmxpYyA+
Ki8KLQotICAgIE1lbW9yeVJlZ2lvbiAqc3lzdGVtX21lbW9yeTsKLSAgICBNZW1vcnlSZWdpb24g
KnBjaV9hZGRyZXNzX3NwYWNlOwotICAgIE1lbW9yeVJlZ2lvbiAqcmFtX21lbW9yeTsKLSAgICBQ
QU1NZW1vcnlSZWdpb24gcGFtX3JlZ2lvbnNbMTNdOwotICAgIE1lbW9yeVJlZ2lvbiBzbXJhbV9y
ZWdpb247Ci0gICAgTWVtb3J5UmVnaW9uIHNtcmFtLCBsb3dfc21yYW07Ci19OwotCi0KICNkZWZp
bmUgSTQ0MEZYX1BBTSAgICAgIDB4NTkKICNkZWZpbmUgSTQ0MEZYX1BBTV9TSVpFIDcKICNkZWZp
bmUgSTQ0MEZYX1NNUkFNICAgIDB4NzIKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
