Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1892E5E6E
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:06:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQQI-0005sT-SY; Sat, 26 Oct 2019 18:04:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQQI-0005s9-2e
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:04:22 +0000
X-Inumbo-ID: fec15082-f81a-11e9-bbab-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id fec15082-f81a-11e9-bbab-bc764e2007e4;
 Sat, 26 Oct 2019 18:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UaGGIPdRKREyMkIJNKEc0RLVDqW+DoJcRjwnPCc+80g=;
 b=gOqNn4U+yL28ovWcXf/ouh9gkYayGlqe8kSzfUkOI0qPfdY6wqg3dtkvt3Nni4lVAPVOTR
 8A34LNeCBVU1d0uMp/cpgI6RTYt4XEhfNq2YC8EUKqROW4b782OHZb+8qHq5fnGOiy7S4V
 g/CqNfohteVzKPgSGTCeyWF9sp55cXU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-NGRn1jszN-WVVLXS3MXkEA-1; Sat, 26 Oct 2019 14:03:59 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE8B2800D41;
 Sat, 26 Oct 2019 18:03:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A11A660C57;
 Sat, 26 Oct 2019 18:03:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:34 +0200
Message-Id: <20191026180143.7369-12-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: NGRn1jszN-WVVLXS3MXkEA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 11/20] hw/isa/piix4: Move piix4_create() to
 hw/isa/piix4.c
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 xen-devel@lists.xenproject.org,
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCk5vdyB0aGF0
IHdlIHByb3Blcmx5IHJlZmFjdG9yZWQgdGhlIHBpaXg0X2NyZWF0ZSgpIGZ1bmN0aW9uLCBsZXQn
cwptb3ZlIGl0IHRvIGh3L2lzYS9waWl4NC5jIHdoZXJlIGl0IGJlbG9uZ3MsIHNvIGl0IGNhbiBi
ZSByZXVzZWQKb24gb3RoZXIgcGxhY2VzLgoKUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292
aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9pc2EvcGlpeDQuYyAgICAgICAg
ICAgICAgICB8IDMwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogaHcvbWlwcy9ndDY0
eHh4X3BjaS5jICAgICAgICAgfCAgMSArCiBody9taXBzL21pcHNfbWFsdGEuYyAgICAgICAgICB8
IDI4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvaHcvaTM4Ni9wYy5oICAg
ICAgICAgIHwgIDIgLS0KIGluY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oIHwgIDYgKysrKysr
CiA1IGZpbGVzIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2h3L2lzYS9waWl4NC5jIGIvaHcvaXNhL3BpaXg0LmMKaW5kZXggNmJmNmYwYzVk
OS4uZjNlMjFlYTc2ZCAxMDA2NDQKLS0tIGEvaHcvaXNhL3BpaXg0LmMKKysrIGIvaHcvaXNhL3Bp
aXg0LmMKQEAgLTI3LDEyICsyNywxNCBAQAogI2luY2x1ZGUgInFhcGkvZXJyb3IuaCIKICNpbmNs
dWRlICJody9pcnEuaCIKICNpbmNsdWRlICJody9pMzg2L3BjLmgiCisjaW5jbHVkZSAiaHcvc291
dGhicmlkZ2UvcGlpeC5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKICNpbmNsdWRlICJody9p
c2EvaXNhLmgiCiAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCiAjaW5jbHVkZSAiaHcvZG1hL2k4MjU3
LmgiCiAjaW5jbHVkZSAiaHcvdGltZXIvaTgyNTQuaCIKICNpbmNsdWRlICJody9ydGMvbWMxNDY4
MThydGMuaCIKKyNpbmNsdWRlICJody9pZGUuaCIKICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0
ZS5oIgogI2luY2x1ZGUgInN5c2VtdS9yZXNldC5oIgogI2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0
ZS5oIgpAQCAtMjM3LDMgKzIzOSwzMSBAQCBzdGF0aWMgdm9pZCBwaWl4NF9yZWdpc3Rlcl90eXBl
cyh2b2lkKQogfQogCiB0eXBlX2luaXQocGlpeDRfcmVnaXN0ZXJfdHlwZXMpCisKK0RldmljZVN0
YXRlICpwaWl4NF9jcmVhdGUoUENJQnVzICpwY2lfYnVzLCBJU0FCdXMgKippc2FfYnVzLAorICAg
ICAgICAgICAgICAgICAgICAgICAgICBJMkNCdXMgKipzbWJ1cywgc2l6ZV90IGlkZV9idXNlcykK
K3sKKyAgICBzaXplX3QgaWRlX2RyaXZlcyA9IGlkZV9idXNlcyAqIE1BWF9JREVfREVWUzsKKyAg
ICBEcml2ZUluZm8gKipoZDsKKyAgICBQQ0lEZXZpY2UgKnBjaTsKKyAgICBEZXZpY2VTdGF0ZSAq
ZGV2OworCisgICAgcGNpID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihwY2lfYnVz
LCBQQ0lfREVWRk4oMTAsIDApLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdHJ1ZSwgVFlQRV9QSUlYNF9QQ0lfREVWSUNFKTsKKyAgICBkZXYgPSBERVZJQ0UocGNp
KTsKKyAgICBpZiAoaXNhX2J1cykgeworICAgICAgICAqaXNhX2J1cyA9IElTQV9CVVMocWRldl9n
ZXRfY2hpbGRfYnVzKGRldiwgImlzYS4wIikpOworICAgIH0KKworICAgIGhkID0gZ19uZXcoRHJp
dmVJbmZvICosIGlkZV9kcml2ZXMpOworICAgIGlkZV9kcml2ZV9nZXQoaGQsIGlkZV9kcml2ZXMp
OworICAgIHBjaV9waWl4NF9pZGVfaW5pdChwY2lfYnVzLCBoZCwgcGNpLT5kZXZmbiArIDEpOwor
ICAgIGdfZnJlZShoZCk7CisgICAgcGNpX2NyZWF0ZV9zaW1wbGUocGNpX2J1cywgcGNpLT5kZXZm
biArIDIsICJwaWl4NC11c2ItdWhjaSIpOworICAgIGlmIChzbWJ1cykgeworICAgICAgICAqc21i
dXMgPSBwaWl4NF9wbV9pbml0KHBjaV9idXMsIHBjaS0+ZGV2Zm4gKyAzLCAweDExMDAsCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNhX2dldF9pcnEoTlVMTCwgOSksIE5VTEwsIDAs
IE5VTEwpOworICAgfQorCisgICAgcmV0dXJuIGRldjsKK30KZGlmZiAtLWdpdCBhL2h3L21pcHMv
Z3Q2NHh4eF9wY2kuYyBiL2h3L21pcHMvZ3Q2NHh4eF9wY2kuYwppbmRleCBmMzI1YmQ2YzFjLi5j
Mjc3Mzk4YzBkIDEwMDY0NAotLS0gYS9ody9taXBzL2d0NjR4eHhfcGNpLmMKKysrIGIvaHcvbWlw
cy9ndDY0eHh4X3BjaS5jCkBAIC0yOCw2ICsyOCw3IEBACiAjaW5jbHVkZSAiaHcvbWlwcy9taXBz
LmgiCiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2lfaG9zdC5o
IgorI2luY2x1ZGUgImh3L3NvdXRoYnJpZGdlL3BpaXguaCIKICNpbmNsdWRlICJtaWdyYXRpb24v
dm1zdGF0ZS5oIgogI2luY2x1ZGUgImh3L2kzODYvcGMuaCIKICNpbmNsdWRlICJody9pcnEuaCIK
ZGlmZiAtLWdpdCBhL2h3L21pcHMvbWlwc19tYWx0YS5jIGIvaHcvbWlwcy9taXBzX21hbHRhLmMK
aW5kZXggOTAxNGQ3N2I3YS4uOTJlOWNhNWJmYSAxMDA2NDQKLS0tIGEvaHcvbWlwcy9taXBzX21h
bHRhLmMKKysrIGIvaHcvbWlwcy9taXBzX21hbHRhLmMKQEAgLTEyMTAsMzQgKzEyMTAsNiBAQCBz
dGF0aWMgdm9pZCBtaXBzX2NyZWF0ZV9jcHUoTWFjaGluZVN0YXRlICptcywgTWFsdGFTdGF0ZSAq
cywKICAgICB9CiB9CiAKLXN0YXRpYyBEZXZpY2VTdGF0ZSAqcGlpeDRfY3JlYXRlKFBDSUJ1cyAq
cGNpX2J1cywgSVNBQnVzICoqaXNhX2J1cywKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIEkyQ0J1cyAqKnNtYnVzLCBzaXplX3QgaWRlX2J1c2VzKQotewotICAgIGNvbnN0IHNpemVf
dCBpZGVfZHJpdmVzID0gaWRlX2J1c2VzICogTUFYX0lERV9ERVZTOwotICAgIERyaXZlSW5mbyAq
KmhkOwotICAgIFBDSURldmljZSAqcGNpOwotICAgIERldmljZVN0YXRlICpkZXY7Ci0KLSAgICBw
Y2kgPSBwY2lfY3JlYXRlX3NpbXBsZV9tdWx0aWZ1bmN0aW9uKHBjaV9idXMsIFBDSV9ERVZGTigx
MCwgMCksCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cnVlLCBU
WVBFX1BJSVg0X1BDSV9ERVZJQ0UpOwotICAgIGRldiA9IERFVklDRShwY2kpOwotICAgIGlmIChp
c2FfYnVzKSB7Ci0gICAgICAgICppc2FfYnVzID0gSVNBX0JVUyhxZGV2X2dldF9jaGlsZF9idXMo
ZGV2LCAiaXNhLjAiKSk7Ci0gICAgfQotCi0gICAgaGQgPSBnX25ldyhEcml2ZUluZm8gKiwgaWRl
X2RyaXZlcyk7Ci0gICAgaWRlX2RyaXZlX2dldChoZCwgaWRlX2RyaXZlcyk7Ci0gICAgcGNpX3Bp
aXg0X2lkZV9pbml0KHBjaV9idXMsIGhkLCBwY2ktPmRldmZuICsgMSk7Ci0gICAgZ19mcmVlKGhk
KTsKLSAgICBwY2lfY3JlYXRlX3NpbXBsZShwY2lfYnVzLCBwY2ktPmRldmZuICsgMiwgInBpaXg0
LXVzYi11aGNpIik7Ci0gICAgaWYgKHNtYnVzKSB7Ci0gICAgICAgICpzbWJ1cyA9IHBpaXg0X3Bt
X2luaXQocGNpX2J1cywgcGNpLT5kZXZmbiArIDMsIDB4MTEwMCwKLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBpc2FfZ2V0X2lycShOVUxMLCA5KSwgTlVMTCwgMCwgTlVMTCk7Ci0gICB9
Ci0KLSAgICByZXR1cm4gZGV2OwotfQotCiBzdGF0aWMKIHZvaWQgbWlwc19tYWx0YV9pbml0KE1h
Y2hpbmVTdGF0ZSAqbWFjaGluZSkKIHsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5o
IGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKaW5kZXggYzkzM2MwZDNhMS4uMmZkNDBjZWViZSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9ody9pMzg2L3BjLmgKKysrIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgK
QEAgLTI1OCw4ICsyNTgsNiBAQCBQQ0lCdXMgKmk0NDBmeF9pbml0KGNvbnN0IGNoYXIgKmhvc3Rf
dHlwZSwgY29uc3QgY2hhciAqcGNpX3R5cGUsCiAgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJl
Z2lvbiAqcmFtX21lbW9yeSk7CiAKIFBDSUJ1cyAqZmluZF9pNDQwZngodm9pZCk7Ci0vKiBwaWl4
NC5jICovCi1leHRlcm4gUENJRGV2aWNlICpwaWl4NF9kZXY7CiAKIC8qIHBjX3N5c2Z3LmMgKi8K
IHZvaWQgcGNfc3lzdGVtX2ZsYXNoX2NyZWF0ZShQQ01hY2hpbmVTdGF0ZSAqcGNtcyk7CmRpZmYg
LS1naXQgYS9pbmNsdWRlL2h3L3NvdXRoYnJpZGdlL3BpaXguaCBiL2luY2x1ZGUvaHcvc291dGhi
cmlkZ2UvcGlpeC5oCmluZGV4IGI4Y2UyNmZlYzQuLmFkZDM1MjQ1NmIgMTAwNjQ0Ci0tLSBhL2lu
Y2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oCisrKyBiL2luY2x1ZGUvaHcvc291dGhicmlkZ2Uv
cGlpeC5oCkBAIC0yLDYgKzIsNyBAQAogICogUUVNVSBQSUlYIFNvdXRoIEJyaWRnZSBFbXVsYXRp
b24KICAqCiAgKiBDb3B5cmlnaHQgKGMpIDIwMDYgRmFicmljZSBCZWxsYXJkCisgKiBDb3B5cmln
aHQgKGMpIDIwMTggSGVydsOpIFBvdXNzaW5lYXUKICAqCiAgKiBUaGlzIHdvcmsgaXMgbGljZW5z
ZWQgdW5kZXIgdGhlIHRlcm1zIG9mIHRoZSBHTlUgR1BMLCB2ZXJzaW9uIDIgb3IgbGF0ZXIuCiAg
KiBTZWUgdGhlIENPUFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4KQEAgLTE3
LDQgKzE4LDkgQEAgSTJDQnVzICpwaWl4NF9wbV9pbml0KFBDSUJ1cyAqYnVzLCBpbnQgZGV2Zm4s
IHVpbnQzMl90IHNtYl9pb19iYXNlLAogICAgICAgICAgICAgICAgICAgICAgIHFlbXVfaXJxIHNj
aV9pcnEsIHFlbXVfaXJxIHNtaV9pcnEsCiAgICAgICAgICAgICAgICAgICAgICAgaW50IHNtbV9l
bmFibGVkLCBEZXZpY2VTdGF0ZSAqKnBpaXg0X3BtKTsKIAorZXh0ZXJuIFBDSURldmljZSAqcGlp
eDRfZGV2OworCitEZXZpY2VTdGF0ZSAqcGlpeDRfY3JlYXRlKFBDSUJ1cyAqcGNpX2J1cywgSVNB
QnVzICoqaXNhX2J1cywKKyAgICAgICAgICAgICAgICAgICAgICAgICAgSTJDQnVzICoqc21idXMs
IHNpemVfdCBpZGVfYnVzZXMpOworCiAjZW5kaWYKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
