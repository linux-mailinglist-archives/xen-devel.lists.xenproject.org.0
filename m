Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC912D7BC2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:34:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPjl-0005aE-F6; Tue, 15 Oct 2019 16:31:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPjk-0005Zl-Hv
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:31:52 +0000
X-Inumbo-ID: 4ae4574e-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4ae4574e-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:31:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B7FE8AC6F5;
 Tue, 15 Oct 2019 16:31:51 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D974419C58;
 Tue, 15 Oct 2019 16:31:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:56 +0200
Message-Id: <20191015162705.28087-24-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.69]); Tue, 15 Oct 2019 16:31:51 +0000 (UTC)
Subject: [Xen-devel] [PATCH 23/32] hw/i386/pc: Extract pc_i8259_create()
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

VGhlIGk4MjU5IGNyZWF0aW9uIGNvZGUgaXMgY29tbW9uIHRvIGFsbCBQQyBtYWNoaW5lcywgZXh0
cmFjdCB0aGUKY29tbW9uIGNvZGUuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvaTM4Ni9wYy5jICAgICAgICAgfCAxOSAr
KysrKysrKysrKysrKysrKysrCiBody9pMzg2L3BjX3BpaXguYyAgICB8IDEzICstLS0tLS0tLS0t
LS0KIGh3L2kzODYvcGNfcTM1LmMgICAgIHwgMTQgKy0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvaHcv
aTM4Ni9wYy5oIHwgIDEgKwogNCBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCAyNSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9pMzg2L3BjLmMgYi9ody9pMzg2L3BjLmMKaW5k
ZXggNTlkZTBjOGExZi4uMmI2YTUyZjIzYiAxMDA2NDQKLS0tIGEvaHcvaTM4Ni9wYy5jCisrKyBi
L2h3L2kzODYvcGMuYwpAQCAtMTk3OCw2ICsxOTc4LDI1IEBAIHZvaWQgcGNfbmljX2luaXQoUENN
YWNoaW5lQ2xhc3MgKnBjbWMsIElTQUJ1cyAqaXNhX2J1cywgUENJQnVzICpwY2lfYnVzKQogICAg
IHJvbV9yZXNldF9vcmRlcl9vdmVycmlkZSgpOwogfQogCit2b2lkIHBjX2k4MjU5X2NyZWF0ZShJ
U0FCdXMgKmlzYV9idXMsIHFlbXVfaXJxICppODI1OV9pcnFzKQoreworICAgIHFlbXVfaXJxICpp
ODI1OTsKKworICAgIGlmIChrdm1fcGljX2luX2tlcm5lbCgpKSB7CisgICAgICAgIGk4MjU5ID0g
a3ZtX2k4MjU5X2luaXQoaXNhX2J1cyk7CisgICAgfSBlbHNlIGlmICh4ZW5fZW5hYmxlZCgpKSB7
CisgICAgICAgIGk4MjU5ID0geGVuX2ludGVycnVwdF9jb250cm9sbGVyX2luaXQoKTsKKyAgICB9
IGVsc2UgeworICAgICAgICBpODI1OSA9IGk4MjU5X2luaXQoaXNhX2J1cywgcGNfYWxsb2NhdGVf
Y3B1X2lycSgpKTsKKyAgICB9CisKKyAgICBmb3IgKHNpemVfdCBpID0gMDsgaSA8IElTQV9OVU1f
SVJRUzsgaSsrKSB7CisgICAgICAgIGk4MjU5X2lycXNbaV0gPSBpODI1OVtpXTsKKyAgICB9CisK
KyAgICBnX2ZyZWUoaTgyNTkpOworfQorCiB2b2lkIGlvYXBpY19pbml0X2dzaShHU0lTdGF0ZSAq
Z3NpX3N0YXRlLCBjb25zdCBjaGFyICpwYXJlbnRfbmFtZSkKIHsKICAgICBEZXZpY2VTdGF0ZSAq
ZGV2OwpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9wY19waWl4LmMgYi9ody9pMzg2L3BjX3BpaXguYwpp
bmRleCA0NTJiMTA3ZTFiLi4wYTcxOTNhM2NjIDEwMDY0NAotLS0gYS9ody9pMzg2L3BjX3BpaXgu
YworKysgYi9ody9pMzg2L3BjX3BpaXguYwpAQCAtODEsNyArODEsNiBAQCBzdGF0aWMgdm9pZCBw
Y19pbml0MShNYWNoaW5lU3RhdGUgKm1hY2hpbmUsCiAgICAgSVNBQnVzICppc2FfYnVzOwogICAg
IFBDSUk0NDBGWFN0YXRlICppNDQwZnhfc3RhdGU7CiAgICAgaW50IHBpaXgzX2RldmZuID0gLTE7
Ci0gICAgcWVtdV9pcnEgKmk4MjU5OwogICAgIHFlbXVfaXJxIHNtaV9pcnE7CiAgICAgR1NJU3Rh
dGUgKmdzaV9zdGF0ZTsKICAgICBEcml2ZUluZm8gKmhkW01BWF9JREVfQlVTICogTUFYX0lERV9E
RVZTXTsKQEAgLTIwOCwxOCArMjA3LDggQEAgc3RhdGljIHZvaWQgcGNfaW5pdDEoTWFjaGluZVN0
YXRlICptYWNoaW5lLAogICAgIH0KICAgICBpc2FfYnVzX2lycXMoaXNhX2J1cywgcGNtcy0+Z3Np
KTsKIAotICAgIGlmIChrdm1fcGljX2luX2tlcm5lbCgpKSB7Ci0gICAgICAgIGk4MjU5ID0ga3Zt
X2k4MjU5X2luaXQoaXNhX2J1cyk7Ci0gICAgfSBlbHNlIGlmICh4ZW5fZW5hYmxlZCgpKSB7Ci0g
ICAgICAgIGk4MjU5ID0geGVuX2ludGVycnVwdF9jb250cm9sbGVyX2luaXQoKTsKLSAgICB9IGVs
c2UgewotICAgICAgICBpODI1OSA9IGk4MjU5X2luaXQoaXNhX2J1cywgcGNfYWxsb2NhdGVfY3B1
X2lycSgpKTsKLSAgICB9CisgICAgcGNfaTgyNTlfY3JlYXRlKGlzYV9idXMsIGdzaV9zdGF0ZS0+
aTgyNTlfaXJxKTsKIAotICAgIGZvciAoaSA9IDA7IGkgPCBJU0FfTlVNX0lSUVM7IGkrKykgewot
ICAgICAgICBnc2lfc3RhdGUtPmk4MjU5X2lycVtpXSA9IGk4MjU5W2ldOwotICAgIH0KLSAgICBn
X2ZyZWUoaTgyNTkpOwogICAgIGlmIChwY21jLT5wY2lfZW5hYmxlZCkgewogICAgICAgICBpb2Fw
aWNfaW5pdF9nc2koZ3NpX3N0YXRlLCAiaTQ0MGZ4Iik7CiAgICAgfQpkaWZmIC0tZ2l0IGEvaHcv
aTM4Ni9wY19xMzUuYyBiL2h3L2kzODYvcGNfcTM1LmMKaW5kZXggNmQwOTZlZmYyOC4uZjRmYjlh
MDJiYSAxMDA2NDQKLS0tIGEvaHcvaTM4Ni9wY19xMzUuYworKysgYi9ody9pMzg2L3BjX3EzNS5j
CkBAIC0xMjgsNyArMTI4LDYgQEAgc3RhdGljIHZvaWQgcGNfcTM1X2luaXQoTWFjaGluZVN0YXRl
ICptYWNoaW5lKQogICAgIE1lbW9yeVJlZ2lvbiAqcmFtX21lbW9yeTsKICAgICBHU0lTdGF0ZSAq
Z3NpX3N0YXRlOwogICAgIElTQUJ1cyAqaXNhX2J1czsKLSAgICBxZW11X2lycSAqaTgyNTk7CiAg
ICAgaW50IGk7CiAgICAgSUNIOUxQQ1N0YXRlICppY2g5X2xwYzsKICAgICBQQ0lEZXZpY2UgKmFo
Y2k7CkBAIC0yNTUsMTggKzI1NCw3IEBAIHN0YXRpYyB2b2lkIHBjX3EzNV9pbml0KE1hY2hpbmVT
dGF0ZSAqbWFjaGluZSkKICAgICBwY2lfYnVzX3NldF9yb3V0ZV9pcnFfZm4oaG9zdF9idXMsIGlj
aDlfcm91dGVfaW50eF9waW5fdG9faXJxKTsKICAgICBpc2FfYnVzID0gaWNoOV9scGMtPmlzYV9i
dXM7CiAKLSAgICBpZiAoa3ZtX3BpY19pbl9rZXJuZWwoKSkgewotICAgICAgICBpODI1OSA9IGt2
bV9pODI1OV9pbml0KGlzYV9idXMpOwotICAgIH0gZWxzZSBpZiAoeGVuX2VuYWJsZWQoKSkgewot
ICAgICAgICBpODI1OSA9IHhlbl9pbnRlcnJ1cHRfY29udHJvbGxlcl9pbml0KCk7Ci0gICAgfSBl
bHNlIHsKLSAgICAgICAgaTgyNTkgPSBpODI1OV9pbml0KGlzYV9idXMsIHBjX2FsbG9jYXRlX2Nw
dV9pcnEoKSk7Ci0gICAgfQotCi0gICAgZm9yIChpID0gMDsgaSA8IElTQV9OVU1fSVJRUzsgaSsr
KSB7Ci0gICAgICAgIGdzaV9zdGF0ZS0+aTgyNTlfaXJxW2ldID0gaTgyNTlbaV07Ci0gICAgfQot
ICAgIGdfZnJlZShpODI1OSk7CisgICAgcGNfaTgyNTlfY3JlYXRlKGlzYV9idXMsIGdzaV9zdGF0
ZS0+aTgyNTlfaXJxKTsKIAogICAgIGlmIChwY21jLT5wY2lfZW5hYmxlZCkgewogICAgICAgICBp
b2FwaWNfaW5pdF9nc2koZ3NpX3N0YXRlLCAicTM1Iik7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3
L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCmluZGV4IDc1YjQ0ZTE1NmMuLjE4MzMy
NmQ5ZmUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCisrKyBiL2luY2x1ZGUvaHcv
aTM4Ni9wYy5oCkBAIC0yMzUsNiArMjM1LDcgQEAgdm9pZCBwY19wY2lfZGV2aWNlX2luaXQoUENJ
QnVzICpwY2lfYnVzKTsKIAogdHlwZWRlZiB2b2lkICgqY3B1X3NldF9zbW1fdCkoaW50IHNtbSwg
dm9pZCAqYXJnKTsKIAordm9pZCBwY19pODI1OV9jcmVhdGUoSVNBQnVzICppc2FfYnVzLCBxZW11
X2lycSAqaTgyNTlfaXJxcyk7CiB2b2lkIGlvYXBpY19pbml0X2dzaShHU0lTdGF0ZSAqZ3NpX3N0
YXRlLCBjb25zdCBjaGFyICpwYXJlbnRfbmFtZSk7CiAKIElTQURldmljZSAqcGNfZmluZF9mZGMw
KHZvaWQpOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
