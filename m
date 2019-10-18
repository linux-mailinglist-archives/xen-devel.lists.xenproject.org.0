Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B84C8DC68F
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:52:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSd5-0004y4-6s; Fri, 18 Oct 2019 13:49:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSd3-0004xb-Pa
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:49:17 +0000
X-Inumbo-ID: 13bca108-f1ae-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 13bca108-f1ae-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 13:49:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A749D3090FEC;
 Fri, 18 Oct 2019 13:49:16 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D673960BF4;
 Fri, 18 Oct 2019 13:49:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:41 +0200
Message-Id: <20191018134754.16362-8-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 18 Oct 2019 13:49:16 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 07/20] piix4: Add a i8254 PIT Controller as
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKUmVtb3ZlIGk4
MjU0IGluc3RhbmNpYXRlZCBpbiBtYWx0YSBib2FyZCwgdG8gbm90IGhhdmUgaXQgdHdpY2UuCgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTEwLWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpSZXZpZXdlZC1ieTogQWxla3NhbmRh
ciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbT4KU2lnbmVkLW9mZi1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KdjI6IEZpeGVkIHR5cG8g
KHRodXRoKQotLS0KIGh3L2lzYS9waWl4NC5jICAgICAgIHwgNCArKysrCiBody9taXBzL21pcHNf
bWFsdGEuYyB8IDQgLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2EvcGlpeDQuYwpp
bmRleCAwYjI0ZDgzMjNjLi5kZGE4YmMzZjkwIDEwMDY0NAotLS0gYS9ody9pc2EvcGlpeDQuYwor
KysgYi9ody9pc2EvcGlpeDQuYwpAQCAtMzAsNiArMzAsNyBAQAogI2luY2x1ZGUgImh3L2lzYS9p
c2EuaCIKICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJody9kbWEvaTgyNTcuaCIK
KyNpbmNsdWRlICJody90aW1lci9pODI1NC5oIgogI2luY2x1ZGUgIm1pZ3JhdGlvbi92bXN0YXRl
LmgiCiAjaW5jbHVkZSAic3lzZW11L3Jlc2V0LmgiCiAjaW5jbHVkZSAic3lzZW11L3J1bnN0YXRl
LmgiCkBAIC0xNjgsNiArMTY5LDkgQEAgc3RhdGljIHZvaWQgcGlpeDRfcmVhbGl6ZShQQ0lEZXZp
Y2UgKmRldiwgRXJyb3IgKiplcnJwKQogICAgIC8qIGluaXRpYWxpemUgSVNBIGlycXMgKi8KICAg
ICBpc2FfYnVzX2lycXMoaXNhX2J1cywgcy0+aXNhKTsKIAorICAgIC8qIGluaXRpYWxpemUgcGl0
ICovCisgICAgaTgyNTRfcGl0X2luaXQoaXNhX2J1cywgMHg0MCwgMCwgTlVMTCk7CisKICAgICAv
KiBETUEgKi8KICAgICBpODI1N19kbWFfaW5pdChpc2FfYnVzLCAwKTsKIApkaWZmIC0tZ2l0IGEv
aHcvbWlwcy9taXBzX21hbHRhLmMgYi9ody9taXBzL21pcHNfbWFsdGEuYwppbmRleCBkZjI0NzE3
N2NhLi4xNmQ3YTBlNzg1IDEwMDY0NAotLS0gYS9ody9taXBzL21pcHNfbWFsdGEuYworKysgYi9o
dy9taXBzL21pcHNfbWFsdGEuYwpAQCAtNDUsNyArNDUsNiBAQAogI2luY2x1ZGUgImh3L2xvYWRl
ci5oIgogI2luY2x1ZGUgImVsZi5oIgogI2luY2x1ZGUgImh3L3RpbWVyL21jMTQ2ODE4cnRjLmgi
Ci0jaW5jbHVkZSAiaHcvdGltZXIvaTgyNTQuaCIKICNpbmNsdWRlICJleGVjL2FkZHJlc3Mtc3Bh
Y2VzLmgiCiAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiICAgICAgICAgICAgIC8qIFN5c0J1c0Rldmlj
ZSAqLwogI2luY2x1ZGUgInFlbXUvaG9zdC11dGlscy5oIgpAQCAtOTksOCArOTgsNiBAQCB0eXBl
ZGVmIHN0cnVjdCB7CiAgICAgcWVtdV9pcnEgaTgyNTlbMTZdOwogfSBNYWx0YVN0YXRlOwogCi1z
dGF0aWMgSVNBRGV2aWNlICpwaXQ7Ci0KIHN0YXRpYyBzdHJ1Y3QgX2xvYWRlcnBhcmFtcyB7CiAg
ICAgaW50IHJhbV9zaXplLCByYW1fbG93X3NpemU7CiAgICAgY29uc3QgY2hhciAqa2VybmVsX2Zp
bGVuYW1lOwpAQCAtMTQyOCw3ICsxNDI1LDYgQEAgdm9pZCBtaXBzX21hbHRhX2luaXQoTWFjaGlu
ZVN0YXRlICptYWNoaW5lKQogICAgIHBjaV9jcmVhdGVfc2ltcGxlKHBjaV9idXMsIHBpaXg0X2Rl
dmZuICsgMiwgInBpaXg0LXVzYi11aGNpIik7CiAgICAgc21idXMgPSBwaWl4NF9wbV9pbml0KHBj
aV9idXMsIHBpaXg0X2RldmZuICsgMywgMHgxMTAwLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICBpc2FfZ2V0X2lycShOVUxMLCA5KSwgTlVMTCwgMCwgTlVMTCk7Ci0gICAgcGl0ID0gaTgyNTRf
cGl0X2luaXQoaXNhX2J1cywgMHg0MCwgMCwgTlVMTCk7CiAgICAgbWMxNDY4MThfcnRjX2luaXQo
aXNhX2J1cywgMjAwMCwgTlVMTCk7CiAKICAgICAvKiBnZW5lcmF0ZSBTUEQgRUVQUk9NIGRhdGEg
Ki8KLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
