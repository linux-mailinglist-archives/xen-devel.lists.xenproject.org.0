Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 525A8D7BA3
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:31:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPhu-0003vL-5w; Tue, 15 Oct 2019 16:29:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPhs-0003uN-Dh
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:29:56 +0000
X-Inumbo-ID: 0522f441-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0522f441-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:29:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 83C9F8E1CE1;
 Tue, 15 Oct 2019 16:29:55 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2B1D19C58;
 Tue, 15 Oct 2019 16:29:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:47 +0200
Message-Id: <20191015162705.28087-15-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 15 Oct 2019 16:29:55 +0000 (UTC)
Subject: [Xen-devel] [PATCH 14/32] piix4: add a i8257 dma controller as
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
MjU3IGluc3RhbmNpYXRlZCBpbiBtYWx0YSBib2FyZCwgdG8gbm90IGhhdmUgaXQgdHdpY2UuCgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTktaHBvdXNzaW5AcmVhY3Rvcy5vcmc+CltQTUQ6IHJlYmFzZWRdClNpZ25lZC1v
ZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBo
dy9pc2EvcGlpeDQuYyAgICAgICB8IDQgKysrKwogaHcvbWlwcy9taXBzX21hbHRhLmMgfCAyIC0t
CiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9ody9pc2EvcGlpeDQuYyBiL2h3L2lzYS9waWl4NC5jCmluZGV4IDg5OThiMGNhNDcu
LjFiYzkxYjU5MGMgMTAwNjQ0Ci0tLSBhL2h3L2lzYS9waWl4NC5jCisrKyBiL2h3L2lzYS9waWl4
NC5jCkBAIC0yOSw2ICsyOSw3IEBACiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1ZGUg
Imh3L2lzYS9pc2EuaCIKICNpbmNsdWRlICJody9zeXNidXMuaCIKKyNpbmNsdWRlICJody9kbWEv
aTgyNTcuaCIKICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0ZS5oIgogI2luY2x1ZGUgInN5c2Vt
dS9yZXNldC5oIgogI2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0ZS5oIgpAQCAtMTY0LDYgKzE2NSw5
IEBAIHN0YXRpYyB2b2lkIHBpaXg0X3JlYWxpemUoUENJRGV2aWNlICpwY2lfZGV2LCBFcnJvciAq
KmVycnApCiAgICAgLyogaW5pdGlhbGl6ZSBJU0EgaXJxcyAqLwogICAgIGlzYV9idXNfaXJxcyhp
c2FfYnVzLCBzLT5pc2EpOwogCisgICAgLyogRE1BICovCisgICAgaTgyNTdfZG1hX2luaXQoaXNh
X2J1cywgMCk7CisKICAgICBwaWl4NF9kZXYgPSBwY2lfZGV2OwogfQogCmRpZmYgLS1naXQgYS9o
dy9taXBzL21pcHNfbWFsdGEuYyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCmluZGV4IGU0OTliN2E2
YmIuLmRmMjQ3MTc3Y2EgMTAwNjQ0Ci0tLSBhL2h3L21pcHMvbWlwc19tYWx0YS5jCisrKyBiL2h3
L21pcHMvbWlwc19tYWx0YS5jCkBAIC0yOCw3ICsyOCw2IEBACiAjaW5jbHVkZSAiY3B1LmgiCiAj
aW5jbHVkZSAiaHcvaTM4Ni9wYy5oIgogI2luY2x1ZGUgImh3L2lzYS9zdXBlcmlvLmgiCi0jaW5j
bHVkZSAiaHcvZG1hL2k4MjU3LmgiCiAjaW5jbHVkZSAiaHcvY2hhci9zZXJpYWwuaCIKICNpbmNs
dWRlICJuZXQvbmV0LmgiCiAjaW5jbHVkZSAiaHcvYm9hcmRzLmgiCkBAIC0xNDMwLDcgKzE0Mjks
NiBAQCB2b2lkIG1pcHNfbWFsdGFfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgc21i
dXMgPSBwaWl4NF9wbV9pbml0KHBjaV9idXMsIHBpaXg0X2RldmZuICsgMywgMHgxMTAwLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICBpc2FfZ2V0X2lycShOVUxMLCA5KSwgTlVMTCwgMCwgTlVM
TCk7CiAgICAgcGl0ID0gaTgyNTRfcGl0X2luaXQoaXNhX2J1cywgMHg0MCwgMCwgTlVMTCk7Ci0g
ICAgaTgyNTdfZG1hX2luaXQoaXNhX2J1cywgMCk7CiAgICAgbWMxNDY4MThfcnRjX2luaXQoaXNh
X2J1cywgMjAwMCwgTlVMTCk7CiAKICAgICAvKiBnZW5lcmF0ZSBTUEQgRUVQUk9NIGRhdGEgKi8K
LS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
