Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF1DD7BC1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:34:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPkK-0005sQ-H0; Tue, 15 Oct 2019 16:32:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPkI-0005rR-Um
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:32:26 +0000
X-Inumbo-ID: 5f59fa6c-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f59fa6c-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:32:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CF7F618CB911;
 Tue, 15 Oct 2019 16:32:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26E3619C58;
 Tue, 15 Oct 2019 16:32:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:59 +0200
Message-Id: <20191015162705.28087-27-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 15 Oct 2019 16:32:25 +0000 (UTC)
Subject: [Xen-devel] [PATCH 26/32] hw/pci-host/piix: Move RCR_IOPORT
 register definition
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBSQ1Jf
SU9QT1JUIHJlZ2lzdGVyIGJlbG9uZ3MgdG8gdGhlIFBJSVggY2hpcHNldC4KTW92ZSB0aGUgZGVm
aW5pdGlvbiB0byAicGlpeC5oIi4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9wY2ktaG9zdC9waWl4LmMgICAgICAgICAg
ICB8IDEgKwogaW5jbHVkZS9ody9pMzg2L3BjLmggICAgICAgICAgfCA2IC0tLS0tLQogaW5jbHVk
ZS9ody9zb3V0aGJyaWRnZS9waWl4LmggfCA2ICsrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvcGlp
eC5jIGIvaHcvcGNpLWhvc3QvcGlpeC5jCmluZGV4IDMyOTI3MDNkZTcuLjM3NzA1NzVjMWEgMTAw
NjQ0Ci0tLSBhL2h3L3BjaS1ob3N0L3BpaXguYworKysgYi9ody9wY2ktaG9zdC9waWl4LmMKQEAg
LTI3LDYgKzI3LDcgQEAKICNpbmNsdWRlICJody9pcnEuaCIKICNpbmNsdWRlICJody9wY2kvcGNp
LmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaV9ob3N0LmgiCisjaW5jbHVkZSAiaHcvc291dGhicmlk
Z2UvcGlpeC5oIgogI2luY2x1ZGUgImh3L3FkZXYtcHJvcGVydGllcy5oIgogI2luY2x1ZGUgImh3
L2lzYS9pc2EuaCIKICNpbmNsdWRlICJody9zeXNidXMuaCIKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
aHcvaTM4Ni9wYy5oIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKaW5kZXggMTgzMzI2ZDlmZS4uMWMy
MGI5NjU3MSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9pMzg2L3BjLmgKKysrIGIvaW5jbHVkZS9o
dy9pMzg2L3BjLmgKQEAgLTI1NywxMiArMjU3LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgUENJSTQ0MEZY
U3RhdGUgUENJSTQ0MEZYU3RhdGU7CiAKICNkZWZpbmUgVFlQRV9JR0RfUEFTU1RIUk9VR0hfSTQ0
MEZYX1BDSV9ERVZJQ0UgImlnZC1wYXNzdGhyb3VnaC1pNDQwRlgiCiAKLS8qCi0gKiBSZXNldCBD
b250cm9sIFJlZ2lzdGVyOiBQQ0ktYWNjZXNzaWJsZSBJU0EtQ29tcGF0aWJsZSBSZWdpc3RlciBh
dCBhZGRyZXNzCi0gKiAweGNmOSwgcHJvdmlkZWQgYnkgdGhlIFBDSS9JU0EgYnJpZGdlIChQSUlY
MyBQQ0kgZnVuY3Rpb24gMCwgODA4Njo3MDAwKS4KLSAqLwotI2RlZmluZSBSQ1JfSU9QT1JUIDB4
Y2Y5Ci0KIFBDSUJ1cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBlLCBjb25zdCBj
aGFyICpwY2lfdHlwZSwKICAgICAgICAgICAgICAgICAgICAgUENJSTQ0MEZYU3RhdGUgKipwaTQ0
MGZ4X3N0YXRlLCBpbnQgKnBpaXhfZGV2Zm4sCiAgICAgICAgICAgICAgICAgICAgIElTQUJ1cyAq
KmlzYV9idXMsIHFlbXVfaXJxICpwaWMsCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3NvdXRoYnJp
ZGdlL3BpaXguaCBiL2luY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oCmluZGV4IGFkZDM1MjQ1
NmIuLjc5ZWJlMDA4OWIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5o
CisrKyBiL2luY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oCkBAIC0xOCw2ICsxOCwxMiBAQCBJ
MkNCdXMgKnBpaXg0X3BtX2luaXQoUENJQnVzICpidXMsIGludCBkZXZmbiwgdWludDMyX3Qgc21i
X2lvX2Jhc2UsCiAgICAgICAgICAgICAgICAgICAgICAgcWVtdV9pcnEgc2NpX2lycSwgcWVtdV9p
cnEgc21pX2lycSwKICAgICAgICAgICAgICAgICAgICAgICBpbnQgc21tX2VuYWJsZWQsIERldmlj
ZVN0YXRlICoqcGlpeDRfcG0pOwogCisvKgorICogUmVzZXQgQ29udHJvbCBSZWdpc3RlcjogUENJ
LWFjY2Vzc2libGUgSVNBLUNvbXBhdGlibGUgUmVnaXN0ZXIgYXQgYWRkcmVzcworICogMHhjZjks
IHByb3ZpZGVkIGJ5IHRoZSBQQ0kvSVNBIGJyaWRnZSAoUElJWDMgUENJIGZ1bmN0aW9uIDAsIDgw
ODY6NzAwMCkuCisgKi8KKyNkZWZpbmUgUkNSX0lPUE9SVCAweGNmOQorCiBleHRlcm4gUENJRGV2
aWNlICpwaWl4NF9kZXY7CiAKIERldmljZVN0YXRlICpwaWl4NF9jcmVhdGUoUENJQnVzICpwY2lf
YnVzLCBJU0FCdXMgKippc2FfYnVzLAotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
