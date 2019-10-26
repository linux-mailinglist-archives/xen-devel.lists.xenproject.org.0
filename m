Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15513E5E69
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQPv-0005fI-5G; Sat, 26 Oct 2019 18:03:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQPt-0005eV-0v
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:03:57 +0000
X-Inumbo-ID: f6ac4c44-f81a-11e9-bbab-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id f6ac4c44-f81a-11e9-bbab-bc764e2007e4;
 Sat, 26 Oct 2019 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4J3P2UfFCzOddbSMsyW2LgzLAlP7e/TG1wlFn/qvUL0=;
 b=SgusqDay645e31LzxjS//s2yXvv/S7IEtmZgoZ6BqON9FPimuvljFohAGN7ncc20fMwxLs
 c/fdkhxnCfakup6D+E3A8PNiQSZYBniSJwMwfYlIj9rhJbL4rqK9wCKdsHWMMyQ/whx5dt
 dHLwFwI0PpiznHsBVRSNPg/tn54Qm4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-FS2Vq82NMNu9l-_oFimI0A-1; Sat, 26 Oct 2019 14:03:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB7D6801E6F;
 Sat, 26 Oct 2019 18:03:44 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C47C60C80;
 Sat, 26 Oct 2019 18:03:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:33 +0200
Message-Id: <20191026180143.7369-11-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: FS2Vq82NMNu9l-_oFimI0A-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 10/20] hw/mips/mips_malta: Extract the PIIX4
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlIE1hbHRhIGJvYXJkIGluc3RhbnRpYXRlIGEgUElJWDQgY2hpcHNldCBkb2luZyB2YXJpb3Vz
CmNhbGxzLiBSZWZhY3RvciBhbGwgdGhvc2UgcmVsYXRlZCBjYWxscyBpbnRvIGEgc2luZ2xlCmZ1
bmN0aW9uOiBwaWl4NF9jcmVhdGUoKS4KClJldmlld2VkLWJ5OiBBbGVrc2FuZGFyIE1hcmtvdmlj
IDxhbWFya292aWNAd2F2ZWNvbXAuY29tPgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1
LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvbWlwcy9taXBzX21hbHRhLmMgfCA0
NyArKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3
L21pcHMvbWlwc19tYWx0YS5jIGIvaHcvbWlwcy9taXBzX21hbHRhLmMKaW5kZXggMjM5ZWE5OGVm
OC4uOTAxNGQ3N2I3YSAxMDA2NDQKLS0tIGEvaHcvbWlwcy9taXBzX21hbHRhLmMKKysrIGIvaHcv
bWlwcy9taXBzX21hbHRhLmMKQEAgLTEyMTAsNiArMTIxMCwzNCBAQCBzdGF0aWMgdm9pZCBtaXBz
X2NyZWF0ZV9jcHUoTWFjaGluZVN0YXRlICptcywgTWFsdGFTdGF0ZSAqcywKICAgICB9CiB9CiAK
K3N0YXRpYyBEZXZpY2VTdGF0ZSAqcGlpeDRfY3JlYXRlKFBDSUJ1cyAqcGNpX2J1cywgSVNBQnVz
ICoqaXNhX2J1cywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEkyQ0J1cyAqKnNt
YnVzLCBzaXplX3QgaWRlX2J1c2VzKQoreworICAgIGNvbnN0IHNpemVfdCBpZGVfZHJpdmVzID0g
aWRlX2J1c2VzICogTUFYX0lERV9ERVZTOworICAgIERyaXZlSW5mbyAqKmhkOworICAgIFBDSURl
dmljZSAqcGNpOworICAgIERldmljZVN0YXRlICpkZXY7CisKKyAgICBwY2kgPSBwY2lfY3JlYXRl
X3NpbXBsZV9tdWx0aWZ1bmN0aW9uKHBjaV9idXMsIFBDSV9ERVZGTigxMCwgMCksCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCBUWVBFX1BJSVg0X1BDSV9E
RVZJQ0UpOworICAgIGRldiA9IERFVklDRShwY2kpOworICAgIGlmIChpc2FfYnVzKSB7CisgICAg
ICAgICppc2FfYnVzID0gSVNBX0JVUyhxZGV2X2dldF9jaGlsZF9idXMoZGV2LCAiaXNhLjAiKSk7
CisgICAgfQorCisgICAgaGQgPSBnX25ldyhEcml2ZUluZm8gKiwgaWRlX2RyaXZlcyk7CisgICAg
aWRlX2RyaXZlX2dldChoZCwgaWRlX2RyaXZlcyk7CisgICAgcGNpX3BpaXg0X2lkZV9pbml0KHBj
aV9idXMsIGhkLCBwY2ktPmRldmZuICsgMSk7CisgICAgZ19mcmVlKGhkKTsKKyAgICBwY2lfY3Jl
YXRlX3NpbXBsZShwY2lfYnVzLCBwY2ktPmRldmZuICsgMiwgInBpaXg0LXVzYi11aGNpIik7Cisg
ICAgaWYgKHNtYnVzKSB7CisgICAgICAgICpzbWJ1cyA9IHBpaXg0X3BtX2luaXQocGNpX2J1cywg
cGNpLT5kZXZmbiArIDMsIDB4MTEwMCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBp
c2FfZ2V0X2lycShOVUxMLCA5KSwgTlVMTCwgMCwgTlVMTCk7CisgICB9CisKKyAgICByZXR1cm4g
ZGV2OworfQorCiBzdGF0aWMKIHZvaWQgbWlwc19tYWx0YV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFj
aGluZSkKIHsKQEAgLTEyMzEsMTIgKzEyNTksOCBAQCB2b2lkIG1pcHNfbWFsdGFfaW5pdChNYWNo
aW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgUENJQnVzICpwY2lfYnVzOwogICAgIElTQUJ1cyAqaXNh
X2J1czsKICAgICBxZW11X2lycSBjYnVzX2lycSwgaTgyNTlfaXJxOwotICAgIFBDSURldmljZSAq
cGNpOwotICAgIGludCBwaWl4NF9kZXZmbjsKICAgICBJMkNCdXMgKnNtYnVzOwogICAgIERyaXZl
SW5mbyAqZGluZm87Ci0gICAgY29uc3Qgc2l6ZV90IGlkZV9kcml2ZXMgPSBNQVhfSURFX0JVUyAq
IE1BWF9JREVfREVWUzsKLSAgICBEcml2ZUluZm8gKipoZDsKICAgICBpbnQgZmxfaWR4ID0gMDsK
ICAgICBpbnQgYmU7CiAKQEAgLTE0MDcsMTQgKzE0MzEsNyBAQCB2b2lkIG1pcHNfbWFsdGFfaW5p
dChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgcGNpX2J1cyA9IGd0NjQxMjBfcmVnaXN0ZXIo
cy0+aTgyNTkpOwogCiAgICAgLyogU291dGhicmlkZ2UgKi8KLSAgICBoZCA9IGdfbmV3KERyaXZl
SW5mbyAqLCBpZGVfZHJpdmVzKTsKLSAgICBpZGVfZHJpdmVfZ2V0KGhkLCBpZGVfZHJpdmVzKTsK
LQotICAgIHBjaSA9IHBjaV9jcmVhdGVfc2ltcGxlX211bHRpZnVuY3Rpb24ocGNpX2J1cywgUENJ
X0RFVkZOKDEwLCAwKSwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHRydWUsIFRZUEVfUElJWDRfUENJX0RFVklDRSk7Ci0gICAgZGV2ID0gREVWSUNFKHBjaSk7Ci0g
ICAgaXNhX2J1cyA9IElTQV9CVVMocWRldl9nZXRfY2hpbGRfYnVzKGRldiwgImlzYS4wIikpOwot
ICAgIHBpaXg0X2RldmZuID0gcGNpLT5kZXZmbjsKKyAgICBkZXYgPSBwaWl4NF9jcmVhdGUocGNp
X2J1cywgJmlzYV9idXMsICZzbWJ1cywgTUFYX0lERV9CVVMpOwogCiAgICAgLyogSW50ZXJydXB0
IGNvbnRyb2xsZXIgKi8KICAgICBxZGV2X2Nvbm5lY3RfZ3Bpb19vdXRfbmFtZWQoZGV2LCAiaW50
ciIsIDAsIGk4MjU5X2lycSk7CkBAIC0xNDIyLDEyICsxNDM5LDYgQEAgdm9pZCBtaXBzX21hbHRh
X2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQogICAgICAgICBzLT5pODI1OVtpXSA9IHFkZXZf
Z2V0X2dwaW9faW5fbmFtZWQoZGV2LCAiaXNhIiwgaSk7CiAgICAgfQogCi0gICAgcGNpX3BpaXg0
X2lkZV9pbml0KHBjaV9idXMsIGhkLCBwaWl4NF9kZXZmbiArIDEpOwotICAgIGdfZnJlZShoZCk7
Ci0gICAgcGNpX2NyZWF0ZV9zaW1wbGUocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAyLCAicGlpeDQt
dXNiLXVoY2kiKTsKLSAgICBzbWJ1cyA9IHBpaXg0X3BtX2luaXQocGNpX2J1cywgcGlpeDRfZGV2
Zm4gKyAzLCAweDExMDAsCi0gICAgICAgICAgICAgICAgICAgICAgICAgIGlzYV9nZXRfaXJxKE5V
TEwsIDkpLCBOVUxMLCAwLCBOVUxMKTsKLQogICAgIC8qIGdlbmVyYXRlIFNQRCBFRVBST00gZGF0
YSAqLwogICAgIGdlbmVyYXRlX2VlcHJvbV9zcGQoJnNtYnVzX2VlcHJvbV9idWZbMCAqIDI1Nl0s
IHJhbV9zaXplKTsKICAgICBnZW5lcmF0ZV9lZXByb21fc2VyaWFsKCZzbWJ1c19lZXByb21fYnVm
WzYgKiAyNTZdKTsKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
