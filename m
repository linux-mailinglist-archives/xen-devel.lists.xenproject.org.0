Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC09DC69A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:54:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSdU-00058G-QH; Fri, 18 Oct 2019 13:49:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSdS-00057k-UM
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:49:42 +0000
X-Inumbo-ID: 22577ea4-f1ae-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22577ea4-f1ae-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 13:49:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2696F10DCC9F;
 Fri, 18 Oct 2019 13:49:41 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B94CF60BF1;
 Fri, 18 Oct 2019 13:49:29 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:43 +0200
Message-Id: <20191018134754.16362-10-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Fri, 18 Oct 2019 13:49:41 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 09/20] hw/mips/mips_malta: Create IDE hard
 drive array dynamically
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

SW4gdGhlIG5leHQgY29tbWl0IHdlJ2xsIHJlZmFjdG9yIHRoZSBQSUlYNCBjb2RlIG91dCBvZgpt
aXBzX21hbHRhX2luaXQoKS4gQXMgYSBwcmVsaW1pbmFyeSBzdGVwLCBhZGQgdGhlICdpZGVfZHJp
dmVzJwp2YXJpYWJsZSBhbmQgY3JlYXRlIHRoZSBkcml2ZSBhcnJheSBkeW5hbWljYWxseS4KClJl
dmlld2VkLWJ5OiBBbGVrc2FuZGFyIE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29tPgpT
aWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+
Ci0tLQogaHcvbWlwcy9taXBzX21hbHRhLmMgfCA3ICsrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvbWlwcy9taXBz
X21hbHRhLmMgYi9ody9taXBzL21pcHNfbWFsdGEuYwppbmRleCA1MjhjMzRhMWMzLi43NzRiYjgx
MGY2IDEwMDY0NAotLS0gYS9ody9taXBzL21pcHNfbWFsdGEuYworKysgYi9ody9taXBzL21pcHNf
bWFsdGEuYwpAQCAtMTIzNSw3ICsxMjM1LDggQEAgdm9pZCBtaXBzX21hbHRhX2luaXQoTWFjaGlu
ZVN0YXRlICptYWNoaW5lKQogICAgIGludCBwaWl4NF9kZXZmbjsKICAgICBJMkNCdXMgKnNtYnVz
OwogICAgIERyaXZlSW5mbyAqZGluZm87Ci0gICAgRHJpdmVJbmZvICpoZFtNQVhfSURFX0JVUyAq
IE1BWF9JREVfREVWU107CisgICAgY29uc3Qgc2l6ZV90IGlkZV9kcml2ZXMgPSBNQVhfSURFX0JV
UyAqIE1BWF9JREVfREVWUzsKKyAgICBEcml2ZUluZm8gKipoZDsKICAgICBpbnQgZmxfaWR4ID0g
MDsKICAgICBpbnQgYmU7CiAKQEAgLTE0MDYsNyArMTQwNyw4IEBAIHZvaWQgbWlwc19tYWx0YV9p
bml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKICAgICBwY2lfYnVzID0gZ3Q2NDEyMF9yZWdpc3Rl
cihzLT5pODI1OSk7CiAKICAgICAvKiBTb3V0aGJyaWRnZSAqLwotICAgIGlkZV9kcml2ZV9nZXQo
aGQsIEFSUkFZX1NJWkUoaGQpKTsKKyAgICBoZCA9IGdfbmV3KERyaXZlSW5mbyAqLCBpZGVfZHJp
dmVzKTsKKyAgICBpZGVfZHJpdmVfZ2V0KGhkLCBpZGVfZHJpdmVzKTsKIAogICAgIHBjaSA9IHBj
aV9jcmVhdGVfc2ltcGxlX211bHRpZnVuY3Rpb24ocGNpX2J1cywgUENJX0RFVkZOKDEwLCAwKSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsIFRZUEVfUElJ
WDRfUENJX0RFVklDRSk7CkBAIC0xNDIxLDYgKzE0MjMsNyBAQCB2b2lkIG1pcHNfbWFsdGFfaW5p
dChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgfQogCiAgICAgcGNpX3BpaXg0X2lkZV9pbml0
KHBjaV9idXMsIGhkLCBwaWl4NF9kZXZmbiArIDEpOworICAgIGdfZnJlZShoZCk7CiAgICAgcGNp
X2NyZWF0ZV9zaW1wbGUocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAyLCAicGlpeDQtdXNiLXVoY2ki
KTsKICAgICBzbWJ1cyA9IHBpaXg0X3BtX2luaXQocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAzLCAw
eDExMDAsCiAgICAgICAgICAgICAgICAgICAgICAgICAgIGlzYV9nZXRfaXJxKE5VTEwsIDkpLCBO
VUxMLCAwLCBOVUxMKTsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
