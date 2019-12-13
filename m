Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A54D11E80C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:20:43 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifne6-0008LT-N4; Fri, 13 Dec 2019 16:18:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifne5-0008LO-KK
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:18:25 +0000
X-Inumbo-ID: 3009ebe4-1dc4-11ea-8f6f-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 3009ebe4-1dc4-11ea-8f6f-12813bfff9fa;
 Fri, 13 Dec 2019 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253904;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zCZ3/HzJt6UebSooqSPs4MgLhNuCHweYJBKUsTXMBXw=;
 b=RglyfGT3r9CU70deDTCvjAs5XCx3qtvStP4m6DkjyTQrfiM21GcbA+NAnRxI/KyttjdCI6
 W1jxIIZ+o+/88oWO3+eFqn3FO0PGLmpJdX8LrQ1PYXB61ihC7lfKJKitd6YQm20d4tbSHq
 MpgdcYuw+CpGhDmcHc8BsdnKdxHjr7I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-3ZUD0pJMOhuSY8G0PHLj2g-1; Fri, 13 Dec 2019 11:18:21 -0500
X-MC-Unique: 3ZUD0pJMOhuSY8G0PHLj2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B5BB107ACC4;
 Fri, 13 Dec 2019 16:18:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB3BD19C4F;
 Fri, 13 Dec 2019 16:18:12 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:42 +0100
Message-Id: <20191213161753.8051-2-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 01/12] hw/i386/pc: Convert DPRINTF() to trace
 events
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

Q29udmVydCB0aGUgZGVwcmVjYXRlZCBEUFJJTlRGKCkgbWFjcm8gdG8gdHJhY2UgZXZlbnRzLgoK
U2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29t
PgotLS0KdjI6IHJlbmFtZSBwY19waWMgLT4geDg2X3BpYwotLS0KIGh3L2kzODYvcGMuYyAgICAg
ICAgIHwgMTkgKysrKystLS0tLS0tLS0tLS0tLQogaHcvaTM4Ni90cmFjZS1ldmVudHMgfCAgNiAr
KysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9wYy5jIGIvaHcvaTM4Ni9wYy5jCmluZGV4IGFjMDhlNjM2
MDQuLjVmOGUzOWMwMjUgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvcGMuYworKysgYi9ody9pMzg2L3Bj
LmMKQEAgLTkwLDE2ICs5MCw3IEBACiAjaW5jbHVkZSAiY29uZmlnLWRldmljZXMuaCIKICNpbmNs
dWRlICJlODIwX21lbW9yeV9sYXlvdXQuaCIKICNpbmNsdWRlICJmd19jZmcuaCIKLQotLyogZGVi
dWcgUEMvSVNBIGludGVycnVwdHMgKi8KLS8vI2RlZmluZSBERUJVR19JUlEKLQotI2lmZGVmIERF
QlVHX0lSUQotI2RlZmluZSBEUFJJTlRGKGZtdCwgLi4uKSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIFwKLSAgICBkbyB7IHByaW50ZigiQ1BVSVJROiAiIGZtdCAsICMjIF9f
VkFfQVJHU19fKTsgfSB3aGlsZSAoMCkKLSNlbHNlCi0jZGVmaW5lIERQUklOVEYoZm10LCAuLi4p
Ci0jZW5kaWYKKyNpbmNsdWRlICJ0cmFjZS5oIgogCiBzdHJ1Y3QgaHBldF9md19jb25maWcgaHBl
dF9jZmcgPSB7LmNvdW50ID0gVUlOVDhfTUFYfTsKIApAQCAtMzQ4LDcgKzMzOSw3IEBAIHZvaWQg
Z3NpX2hhbmRsZXIodm9pZCAqb3BhcXVlLCBpbnQgbiwgaW50IGxldmVsKQogewogICAgIEdTSVN0
YXRlICpzID0gb3BhcXVlOwogCi0gICAgRFBSSU5URigicGM6ICVzIEdTSSAlZFxuIiwgbGV2ZWwg
PyAicmFpc2luZyIgOiAibG93ZXJpbmciLCBuKTsKKyAgICB0cmFjZV94ODZfZ3NpX2ludGVycnVw
dChuLCBsZXZlbCk7CiAgICAgaWYgKG4gPCBJU0FfTlVNX0lSUVMpIHsKICAgICAgICAgcWVtdV9z
ZXRfaXJxKHMtPmk4MjU5X2lycVtuXSwgbGV2ZWwpOwogICAgIH0KQEAgLTQyNiw3ICs0MTcsNyBA
QCBzdGF0aWMgdm9pZCBwaWNfaXJxX3JlcXVlc3Qodm9pZCAqb3BhcXVlLCBpbnQgaXJxLCBpbnQg
bGV2ZWwpCiAgICAgQ1BVU3RhdGUgKmNzID0gZmlyc3RfY3B1OwogICAgIFg4NkNQVSAqY3B1ID0g
WDg2X0NQVShjcyk7CiAKLSAgICBEUFJJTlRGKCJwaWNfaXJxczogJXMgaXJxICVkXG4iLCBsZXZl
bD8gInJhaXNlIiA6ICJsb3dlciIsIGlycSk7CisgICAgdHJhY2VfeDg2X3BpY19pbnRlcnJ1cHQo
aXJxLCBsZXZlbCk7CiAgICAgaWYgKGNwdS0+YXBpY19zdGF0ZSAmJiAha3ZtX2lycWNoaXBfaW5f
a2VybmVsKCkpIHsKICAgICAgICAgQ1BVX0ZPUkVBQ0goY3MpIHsKICAgICAgICAgICAgIGNwdSA9
IFg4Nl9DUFUoY3MpOwpAQCAtNzYwLDcgKzc1MSw3IEBAIHN0YXRpYyB2b2lkIHBvcnQ5Ml93cml0
ZSh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1aW50NjRfdCB2YWwsCiAgICAgUG9ydDkyU3Rh
dGUgKnMgPSBvcGFxdWU7CiAgICAgaW50IG9sZHZhbCA9IHMtPm91dHBvcnQ7CiAKLSAgICBEUFJJ
TlRGKCJwb3J0OTI6IHdyaXRlIDB4JTAyIiBQUkl4NjQgIlxuIiwgdmFsKTsKKyAgICB0cmFjZV9w
b3J0OTJfd3JpdGUodmFsKTsKICAgICBzLT5vdXRwb3J0ID0gdmFsOwogICAgIHFlbXVfc2V0X2ly
cShzLT5hMjBfb3V0LCAodmFsID4+IDEpICYgMSk7CiAgICAgaWYgKCh2YWwgJiAxKSAmJiAhKG9s
ZHZhbCAmIDEpKSB7CkBAIC03NzUsNyArNzY2LDcgQEAgc3RhdGljIHVpbnQ2NF90IHBvcnQ5Ml9y
ZWFkKHZvaWQgKm9wYXF1ZSwgaHdhZGRyIGFkZHIsCiAgICAgdWludDMyX3QgcmV0OwogCiAgICAg
cmV0ID0gcy0+b3V0cG9ydDsKLSAgICBEUFJJTlRGKCJwb3J0OTI6IHJlYWQgMHglMDJ4XG4iLCBy
ZXQpOworICAgIHRyYWNlX3BvcnQ5Ml9yZWFkKHJldCk7CiAgICAgcmV0dXJuIHJldDsKIH0KIApk
aWZmIC0tZ2l0IGEvaHcvaTM4Ni90cmFjZS1ldmVudHMgYi9ody9pMzg2L3RyYWNlLWV2ZW50cwpp
bmRleCBjOGJjNDY0YmM1Li5hNjA4YTViNjM1IDEwMDY0NAotLS0gYS9ody9pMzg2L3RyYWNlLWV2
ZW50cworKysgYi9ody9pMzg2L3RyYWNlLWV2ZW50cwpAQCAtMTExLDMgKzExMSw5IEBAIGFtZHZp
X2lyX2lydGVfZ2FfdmFsKHVpbnQ2NF90IGhpLCB1aW50NjRfdCBsbykgImhpIDB4JSJQUkl4NjQi
IGxvIDB4JSJQUkl4NjQKICMgdm1wb3J0LmMKIHZtcG9ydF9yZWdpc3Rlcih1bnNpZ25lZCBjaGFy
IGNvbW1hbmQsIHZvaWQgKmZ1bmMsIHZvaWQgKm9wYXF1ZSkgImNvbW1hbmQ6IDB4JTAyeCBmdW5j
OiAlcCBvcGFxdWU6ICVwIgogdm1wb3J0X2NvbW1hbmQodW5zaWduZWQgY2hhciBjb21tYW5kKSAi
Y29tbWFuZDogMHglMDJ4IgorCisjIHBjLmMKK3g4Nl9nc2lfaW50ZXJydXB0KGludCBpcnFuLCBp
bnQgbGV2ZWwpICJHU0kgaW50ZXJydXB0ICMlZCBsZXZlbDolZCIKK3g4Nl9waWNfaW50ZXJydXB0
KGludCBpcnFuLCBpbnQgbGV2ZWwpICJQSUMgaW50ZXJydXB0ICMlZCBsZXZlbDolZCIKK3BvcnQ5
Ml9yZWFkKHVpbnQ4X3QgdmFsKSAicG9ydDkyOiByZWFkIDB4JTAyeCIKK3BvcnQ5Ml93cml0ZSh1
aW50OF90IHZhbCkgInBvcnQ5Mjogd3JpdGUgMHglMDJ4IgotLSAKMi4yMS4wCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
