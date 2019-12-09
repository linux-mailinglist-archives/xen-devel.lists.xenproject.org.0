Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 135D6116A3C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 10:53:45 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieFgk-0004TA-Fa; Mon, 09 Dec 2019 09:50:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3VR8=Z7=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ieFgj-0004Sn-49
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 09:50:45 +0000
X-Inumbo-ID: 5e77a15b-1a69-11ea-87af-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 5e77a15b-1a69-11ea-87af-12813bfff9fa;
 Mon, 09 Dec 2019 09:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575885044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQooNv4KuAJbOCpnZQESZEyWieR/hAlT1WGgxUjJTpQ=;
 b=U3HV4rr7iW79bGAKPiRi+Rd8YGmb53rNOOlxOe+UHSKPEVZ738PbEKBO8bIpRz5lfJh0jK
 an7mObpz0dFn/6F2SSK9+ASkaRL37n/Q03TPIi2j1AnvKFP34dt/boOSB0hKd+mWi1p8K3
 isCGQuhhBlUuc4rzv0aJ1TfETmYZ/Lw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-gfa2tifNPLWJqkaOzwt-IQ-1; Mon, 09 Dec 2019 04:50:41 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A7CD800D53;
 Mon,  9 Dec 2019 09:50:40 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-142.brq.redhat.com [10.40.205.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5472519C5B;
 Mon,  9 Dec 2019 09:50:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  9 Dec 2019 10:49:59 +0100
Message-Id: <20191209095002.32194-4-philmd@redhat.com>
In-Reply-To: <20191209095002.32194-1-philmd@redhat.com>
References: <20191209095002.32194-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: gfa2tifNPLWJqkaOzwt-IQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH-for-5.0 v3 3/6] hw/pci-host/i440fx: Use size_t
 to iterate over ARRAY_SIZE()
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

V2UgZG9uJ3QgZW5mb3JjZSB0aGUgLVdzaWduLWNvbnZlcnNpb24gQ1BQRkxBRywgYnV0IGl0IGRv
ZXNuJ3QgaHVydAp0byBhdm9pZCB0aGlzIHdhcm5pbmc6CgogIHdhcm5pbmc6IGltcGxpY2l0IGNv
bnZlcnNpb24gY2hhbmdlcyBzaWduZWRuZXNzOiAnaW50JyB0byAnc2l6ZV90JyAoYWthICd1bnNp
Z25lZCBsb25nJykgWy1Xc2lnbi1jb252ZXJzaW9uXQoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L3BjaS1ob3N0L2k0NDBm
eC5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9pNDQwZnguYyBiL2h3L3BjaS1ob3N0L2k0
NDBmeC5jCmluZGV4IGZiZGM1NjM1OTkuLjBjYzgwYjI3NmQgMTAwNjQ0Ci0tLSBhL2h3L3BjaS1o
b3N0L2k0NDBmeC5jCisrKyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCkBAIC00MTksMTIgKzQxOSwx
MSBAQCBvdXQ6CiBzdGF0aWMgdm9pZCBpZ2RfcHRfaTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpw
Y2lfZGV2LCBFcnJvciAqKmVycnApCiB7CiAgICAgdWludDMyX3QgdmFsID0gMDsKLSAgICBpbnQg
aSwgbnVtOworICAgIHNpemVfdCBpOwogICAgIGludCBwb3MsIGxlbjsKICAgICBFcnJvciAqbG9j
YWxfZXJyID0gTlVMTDsKIAotICAgIG51bSA9IEFSUkFZX1NJWkUoaWdkX2hvc3RfYnJpZGdlX2lu
Zm9zKTsKLSAgICBmb3IgKGkgPSAwOyBpIDwgbnVtOyBpKyspIHsKKyAgICBmb3IgKGkgPSAwOyBp
IDwgQVJSQVlfU0laRShpZ2RfaG9zdF9icmlkZ2VfaW5mb3MpOyBpKyspIHsKICAgICAgICAgcG9z
ID0gaWdkX2hvc3RfYnJpZGdlX2luZm9zW2ldLm9mZnNldDsKICAgICAgICAgbGVuID0gaWdkX2hv
c3RfYnJpZGdlX2luZm9zW2ldLmxlbjsKICAgICAgICAgaG9zdF9wY2lfY29uZmlnX3JlYWQocG9z
LCBsZW4sICZ2YWwsICZsb2NhbF9lcnIpOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
