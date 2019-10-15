Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F3ED7BAE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:32:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPii-0004yl-Ka; Tue, 15 Oct 2019 16:30:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPih-0004xz-1U
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:30:47 +0000
X-Inumbo-ID: 23b84019-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 23b84019-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1F817308FBAC;
 Tue, 15 Oct 2019 16:30:46 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 22B6819C5B;
 Tue, 15 Oct 2019 16:30:35 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:51 +0200
Message-Id: <20191015162705.28087-19-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 15 Oct 2019 16:30:46 +0000 (UTC)
Subject: [Xen-devel] [PATCH 18/32] hw/mips/mips_malta: Extract the PIIX4
 creation code as piix4_create()
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

VGhlIE1hbHRhIGJvYXJkIGluc3RhbnRpYXRlIGEgUElJWDQgY2hpcHNldCBkb2luZyB2YXJpb3Vz
CmNhbGxzLiBSZWZhY3RvciBhbGwgdGhvc2UgcmVsYXRlZCBjYWxscyBpbnRvIGEgc2luZ2xlCmZ1
bmN0aW9uOiBwaWl4NF9jcmVhdGUoKS4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9taXBzL21pcHNfbWFsdGEuYyB8IDQ3
ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcv
bWlwcy9taXBzX21hbHRhLmMgYi9ody9taXBzL21pcHNfbWFsdGEuYwppbmRleCA3NzRiYjgxMGY2
Li4wZDQzMTI4NDBiIDEwMDY0NAotLS0gYS9ody9taXBzL21pcHNfbWFsdGEuYworKysgYi9ody9t
aXBzL21pcHNfbWFsdGEuYwpAQCAtMTIxMCw2ICsxMjEwLDM0IEBAIHN0YXRpYyB2b2lkIG1pcHNf
Y3JlYXRlX2NwdShNYWNoaW5lU3RhdGUgKm1zLCBNYWx0YVN0YXRlICpzLAogICAgIH0KIH0KIAor
c3RhdGljIERldmljZVN0YXRlICpwaWl4NF9jcmVhdGUoUENJQnVzICpwY2lfYnVzLCBJU0FCdXMg
Kippc2FfYnVzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSTJDQnVzICoqc21i
dXMsIHNpemVfdCBpZGVfYnVzZXMpCit7CisgICAgY29uc3Qgc2l6ZV90IGlkZV9kcml2ZXMgPSBp
ZGVfYnVzZXMgKiBNQVhfSURFX0RFVlM7CisgICAgRHJpdmVJbmZvICoqaGQ7CisgICAgUENJRGV2
aWNlICpwY2k7CisgICAgRGV2aWNlU3RhdGUgKmRldjsKKworICAgIHBjaSA9IHBjaV9jcmVhdGVf
c2ltcGxlX211bHRpZnVuY3Rpb24ocGNpX2J1cywgUENJX0RFVkZOKDEwLCAwKSwKKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsIFRZUEVfUElJWDRfUENJX0RF
VklDRSk7CisgICAgZGV2ID0gREVWSUNFKHBjaSk7CisgICAgaWYgKGlzYV9idXMpIHsKKyAgICAg
ICAgKmlzYV9idXMgPSBJU0FfQlVTKHFkZXZfZ2V0X2NoaWxkX2J1cyhkZXYsICJpc2EuMCIpKTsK
KyAgICB9CisKKyAgICBoZCA9IGdfbmV3KERyaXZlSW5mbyAqLCBpZGVfZHJpdmVzKTsKKyAgICBp
ZGVfZHJpdmVfZ2V0KGhkLCBpZGVfZHJpdmVzKTsKKyAgICBwY2lfcGlpeDRfaWRlX2luaXQocGNp
X2J1cywgaGQsIHBjaS0+ZGV2Zm4gKyAxKTsKKyAgICBnX2ZyZWUoaGQpOworICAgIHBjaV9jcmVh
dGVfc2ltcGxlKHBjaV9idXMsIHBjaS0+ZGV2Zm4gKyAyLCAicGlpeDQtdXNiLXVoY2kiKTsKKyAg
ICBpZiAoc21idXMpIHsKKyAgICAgICAgKnNtYnVzID0gcGlpeDRfcG1faW5pdChwY2lfYnVzLCBw
Y2ktPmRldmZuICsgMywgMHgxMTAwLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlz
YV9nZXRfaXJxKE5VTEwsIDkpLCBOVUxMLCAwLCBOVUxMKTsKKyAgIH0KKworICAgIHJldHVybiBk
ZXY7Cit9CisKIHN0YXRpYwogdm9pZCBtaXBzX21hbHRhX2luaXQoTWFjaGluZVN0YXRlICptYWNo
aW5lKQogewpAQCAtMTIzMSwxMiArMTI1OSw4IEBAIHZvaWQgbWlwc19tYWx0YV9pbml0KE1hY2hp
bmVTdGF0ZSAqbWFjaGluZSkKICAgICBQQ0lCdXMgKnBjaV9idXM7CiAgICAgSVNBQnVzICppc2Ff
YnVzOwogICAgIHFlbXVfaXJxIGNidXNfaXJxLCBpODI1OV9pcnE7Ci0gICAgUENJRGV2aWNlICpw
Y2k7Ci0gICAgaW50IHBpaXg0X2RldmZuOwogICAgIEkyQ0J1cyAqc21idXM7CiAgICAgRHJpdmVJ
bmZvICpkaW5mbzsKLSAgICBjb25zdCBzaXplX3QgaWRlX2RyaXZlcyA9IE1BWF9JREVfQlVTICog
TUFYX0lERV9ERVZTOwotICAgIERyaXZlSW5mbyAqKmhkOwogICAgIGludCBmbF9pZHggPSAwOwog
ICAgIGludCBiZTsKIApAQCAtMTQwNywxNCArMTQzMSw3IEBAIHZvaWQgbWlwc19tYWx0YV9pbml0
KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKICAgICBwY2lfYnVzID0gZ3Q2NDEyMF9yZWdpc3Rlcihz
LT5pODI1OSk7CiAKICAgICAvKiBTb3V0aGJyaWRnZSAqLwotICAgIGhkID0gZ19uZXcoRHJpdmVJ
bmZvICosIGlkZV9kcml2ZXMpOwotICAgIGlkZV9kcml2ZV9nZXQoaGQsIGlkZV9kcml2ZXMpOwot
Ci0gICAgcGNpID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihwY2lfYnVzLCBQQ0lf
REVWRk4oMTAsIDApLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
dHJ1ZSwgVFlQRV9QSUlYNF9QQ0lfREVWSUNFKTsKLSAgICBkZXYgPSBERVZJQ0UocGNpKTsKLSAg
ICBpc2FfYnVzID0gSVNBX0JVUyhxZGV2X2dldF9jaGlsZF9idXMoZGV2LCAiaXNhLjAiKSk7Ci0g
ICAgcGlpeDRfZGV2Zm4gPSBwY2ktPmRldmZuOworICAgIGRldiA9IHBpaXg0X2NyZWF0ZShwY2lf
YnVzLCAmaXNhX2J1cywgJnNtYnVzLCBNQVhfSURFX0JVUyk7CiAKICAgICAvKiBJbnRlcnJ1cHQg
Y29udHJvbGxlciAqLwogICAgIHFkZXZfY29ubmVjdF9ncGlvX291dF9uYW1lZChkZXYsICJpbnRy
IiwgMCwgaTgyNTlfaXJxKTsKQEAgLTE0MjIsMTIgKzE0MzksNiBAQCB2b2lkIG1pcHNfbWFsdGFf
aW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgICAgIHMtPmk4MjU5W2ldID0gcWRldl9n
ZXRfZ3Bpb19pbl9uYW1lZChkZXYsICJpc2EiLCBpKTsKICAgICB9CiAKLSAgICBwY2lfcGlpeDRf
aWRlX2luaXQocGNpX2J1cywgaGQsIHBpaXg0X2RldmZuICsgMSk7Ci0gICAgZ19mcmVlKGhkKTsK
LSAgICBwY2lfY3JlYXRlX3NpbXBsZShwY2lfYnVzLCBwaWl4NF9kZXZmbiArIDIsICJwaWl4NC11
c2ItdWhjaSIpOwotICAgIHNtYnVzID0gcGlpeDRfcG1faW5pdChwY2lfYnVzLCBwaWl4NF9kZXZm
biArIDMsIDB4MTEwMCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgaXNhX2dldF9pcnEoTlVM
TCwgOSksIE5VTEwsIDAsIE5VTEwpOwotCiAgICAgLyogZ2VuZXJhdGUgU1BEIEVFUFJPTSBkYXRh
ICovCiAgICAgZ2VuZXJhdGVfZWVwcm9tX3NwZCgmc21idXNfZWVwcm9tX2J1ZlswICogMjU2XSwg
cmFtX3NpemUpOwogICAgIGdlbmVyYXRlX2VlcHJvbV9zZXJpYWwoJnNtYnVzX2VlcHJvbV9idWZb
NiAqIDI1Nl0pOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
