Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0914D7BB0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:32:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPiD-0004gr-L7; Tue, 15 Oct 2019 16:30:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPiC-0004gE-4A
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:30:16 +0000
X-Inumbo-ID: 10dac420-ef69-11e9-8aca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10dac420-ef69-11e9-8aca-bc764e2007e4;
 Tue, 15 Oct 2019 16:30:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2FDE08E1CE4;
 Tue, 15 Oct 2019 16:30:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 198B019C58;
 Tue, 15 Oct 2019 16:29:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:48 +0200
Message-Id: <20191015162705.28087-16-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 15 Oct 2019 16:30:14 +0000 (UTC)
Subject: [Xen-devel] [PATCH 15/32] piix4: add a i8254 pit controller as
 specified in datasheet
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKUmVtb3ZlIGk4
MjU0IGluc3RhbmNpYXRlZCBpbiBtYWx0YSBib2FyZCwgdG8gbm90IGhhdmUgaXQgdHdpY2UuCgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTEwLWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBw
ZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvaXNhL3BpaXg0LmMg
ICAgICAgfCA0ICsrKysKIGh3L21pcHMvbWlwc19tYWx0YS5jIHwgNCAtLS0tCiAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9p
c2EvcGlpeDQuYyBiL2h3L2lzYS9waWl4NC5jCmluZGV4IDFiYzkxYjU5MGMuLjBiMGEwZWNhYjEg
MTAwNjQ0Ci0tLSBhL2h3L2lzYS9waWl4NC5jCisrKyBiL2h3L2lzYS9waWl4NC5jCkBAIC0zMCw2
ICszMCw3IEBACiAjaW5jbHVkZSAiaHcvaXNhL2lzYS5oIgogI2luY2x1ZGUgImh3L3N5c2J1cy5o
IgogI2luY2x1ZGUgImh3L2RtYS9pODI1Ny5oIgorI2luY2x1ZGUgImh3L3RpbWVyL2k4MjU0Lmgi
CiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIKICNpbmNsdWRlICJzeXNlbXUvcmVzZXQu
aCIKICNpbmNsdWRlICJzeXNlbXUvcnVuc3RhdGUuaCIKQEAgLTE2NSw2ICsxNjYsOSBAQCBzdGF0
aWMgdm9pZCBwaWl4NF9yZWFsaXplKFBDSURldmljZSAqcGNpX2RldiwgRXJyb3IgKiplcnJwKQog
ICAgIC8qIGluaXRpYWxpemUgSVNBIGlycXMgKi8KICAgICBpc2FfYnVzX2lycXMoaXNhX2J1cywg
cy0+aXNhKTsKIAorICAgIC8qIGluaXRpYWxpemUgcGl0ICovCisgICAgaTgyNTRfcGl0X2luaXQo
aXNhX2J1cywgMHg0MCwgMCwgTlVMTCk7CisKICAgICAvKiBETUEgKi8KICAgICBpODI1N19kbWFf
aW5pdChpc2FfYnVzLCAwKTsKIApkaWZmIC0tZ2l0IGEvaHcvbWlwcy9taXBzX21hbHRhLmMgYi9o
dy9taXBzL21pcHNfbWFsdGEuYwppbmRleCBkZjI0NzE3N2NhLi4xNmQ3YTBlNzg1IDEwMDY0NAot
LS0gYS9ody9taXBzL21pcHNfbWFsdGEuYworKysgYi9ody9taXBzL21pcHNfbWFsdGEuYwpAQCAt
NDUsNyArNDUsNiBAQAogI2luY2x1ZGUgImh3L2xvYWRlci5oIgogI2luY2x1ZGUgImVsZi5oIgog
I2luY2x1ZGUgImh3L3RpbWVyL21jMTQ2ODE4cnRjLmgiCi0jaW5jbHVkZSAiaHcvdGltZXIvaTgy
NTQuaCIKICNpbmNsdWRlICJleGVjL2FkZHJlc3Mtc3BhY2VzLmgiCiAjaW5jbHVkZSAiaHcvc3lz
YnVzLmgiICAgICAgICAgICAgIC8qIFN5c0J1c0RldmljZSAqLwogI2luY2x1ZGUgInFlbXUvaG9z
dC11dGlscy5oIgpAQCAtOTksOCArOTgsNiBAQCB0eXBlZGVmIHN0cnVjdCB7CiAgICAgcWVtdV9p
cnEgaTgyNTlbMTZdOwogfSBNYWx0YVN0YXRlOwogCi1zdGF0aWMgSVNBRGV2aWNlICpwaXQ7Ci0K
IHN0YXRpYyBzdHJ1Y3QgX2xvYWRlcnBhcmFtcyB7CiAgICAgaW50IHJhbV9zaXplLCByYW1fbG93
X3NpemU7CiAgICAgY29uc3QgY2hhciAqa2VybmVsX2ZpbGVuYW1lOwpAQCAtMTQyOCw3ICsxNDI1
LDYgQEAgdm9pZCBtaXBzX21hbHRhX2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQogICAgIHBj
aV9jcmVhdGVfc2ltcGxlKHBjaV9idXMsIHBpaXg0X2RldmZuICsgMiwgInBpaXg0LXVzYi11aGNp
Iik7CiAgICAgc21idXMgPSBwaWl4NF9wbV9pbml0KHBjaV9idXMsIHBpaXg0X2RldmZuICsgMywg
MHgxMTAwLAogICAgICAgICAgICAgICAgICAgICAgICAgICBpc2FfZ2V0X2lycShOVUxMLCA5KSwg
TlVMTCwgMCwgTlVMTCk7Ci0gICAgcGl0ID0gaTgyNTRfcGl0X2luaXQoaXNhX2J1cywgMHg0MCwg
MCwgTlVMTCk7CiAgICAgbWMxNDY4MThfcnRjX2luaXQoaXNhX2J1cywgMjAwMCwgTlVMTCk7CiAK
ICAgICAvKiBnZW5lcmF0ZSBTUEQgRUVQUk9NIGRhdGEgKi8KLS0gCjIuMjEuMAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
