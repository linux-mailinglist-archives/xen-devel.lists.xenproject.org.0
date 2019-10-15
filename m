Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9834BD7BB2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:32:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPj1-0005Ba-G9; Tue, 15 Oct 2019 16:31:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPj0-0005Ar-5V
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:31:06 +0000
X-Inumbo-ID: 2eb7643a-ef69-11e9-a531-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2eb7643a-ef69-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 16:31:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 51DDC3090FC6;
 Tue, 15 Oct 2019 16:31:04 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B2C319C58;
 Tue, 15 Oct 2019 16:30:55 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:53 +0200
Message-Id: <20191015162705.28087-21-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 15 Oct 2019 16:31:04 +0000 (UTC)
Subject: [Xen-devel] [PATCH 20/32] hw/i386/pc: Extract pc_gsi_create()
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

VGhlIEdTSSBjcmVhdGlvbiBjb2RlIGlzIGNvbW1vbiB0byBhbGwgUEMgbWFjaGluZXMsIGV4dHJh
Y3QgdGhlCmNvbW1vbiBjb2RlLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2kzODYvcGMuYyAgICAgICAgIHwgMTUgKysr
KysrKysrKysrKysrCiBody9pMzg2L3BjX3BpaXguYyAgICB8ICA5ICstLS0tLS0tLQogaHcvaTM4
Ni9wY19xMzUuYyAgICAgfCAgOSArLS0tLS0tLS0KIGluY2x1ZGUvaHcvaTM4Ni9wYy5oIHwgIDIg
KysKIDQgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvaHcvaTM4Ni9wYy5jIGIvaHcvaTM4Ni9wYy5jCmluZGV4IGJjZGE1MGVmY2Mu
LmE3NTk3YzZjNDQgMTAwNjQ0Ci0tLSBhL2h3L2kzODYvcGMuYworKysgYi9ody9pMzg2L3BjLmMK
QEAgLTM1Nyw2ICszNTcsMjEgQEAgdm9pZCBnc2lfaGFuZGxlcih2b2lkICpvcGFxdWUsIGludCBu
LCBpbnQgbGV2ZWwpCiAgICAgcWVtdV9zZXRfaXJxKHMtPmlvYXBpY19pcnFbbl0sIGxldmVsKTsK
IH0KIAorR1NJU3RhdGUgKnBjX2dzaV9jcmVhdGUocWVtdV9pcnEgKippcnFzLCBib29sIHBjaV9l
bmFibGVkKQoreworICAgIEdTSVN0YXRlICpzOworCisgICAgcyA9IGdfbmV3MChHU0lTdGF0ZSwg
MSk7CisgICAgaWYgKGt2bV9pb2FwaWNfaW5fa2VybmVsKCkpIHsKKyAgICAgICAga3ZtX3BjX3Nl
dHVwX2lycV9yb3V0aW5nKHBjaV9lbmFibGVkKTsKKyAgICAgICAgKmlycXMgPSBxZW11X2FsbG9j
YXRlX2lycXMoa3ZtX3BjX2dzaV9oYW5kbGVyLCBzLCBHU0lfTlVNX1BJTlMpOworICAgIH0gZWxz
ZSB7CisgICAgICAgICppcnFzID0gcWVtdV9hbGxvY2F0ZV9pcnFzKGdzaV9oYW5kbGVyLCBzLCBH
U0lfTlVNX1BJTlMpOworICAgIH0KKworICAgIHJldHVybiBzOworfQorCiBzdGF0aWMgdm9pZCBp
b3BvcnQ4MF93cml0ZSh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1aW50NjRfdCBkYXRhLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgc2l6ZSkKIHsKZGlmZiAtLWdpdCBh
L2h3L2kzODYvcGNfcGlpeC5jIGIvaHcvaTM4Ni9wY19waWl4LmMKaW5kZXggNDMxOTY1ZDkyMS4u
NDUyYjEwN2UxYiAxMDA2NDQKLS0tIGEvaHcvaTM4Ni9wY19waWl4LmMKKysrIGIvaHcvaTM4Ni9w
Y19waWl4LmMKQEAgLTE4OCwxNCArMTg4LDcgQEAgc3RhdGljIHZvaWQgcGNfaW5pdDEoTWFjaGlu
ZVN0YXRlICptYWNoaW5lLAogICAgICAgICB4ZW5fbG9hZF9saW51eChwY21zKTsKICAgICB9CiAK
LSAgICBnc2lfc3RhdGUgPSBnX21hbGxvYzAoc2l6ZW9mKCpnc2lfc3RhdGUpKTsKLSAgICBpZiAo
a3ZtX2lvYXBpY19pbl9rZXJuZWwoKSkgewotICAgICAgICBrdm1fcGNfc2V0dXBfaXJxX3JvdXRp
bmcocGNtYy0+cGNpX2VuYWJsZWQpOwotICAgICAgICBwY21zLT5nc2kgPSBxZW11X2FsbG9jYXRl
X2lycXMoa3ZtX3BjX2dzaV9oYW5kbGVyLCBnc2lfc3RhdGUsCi0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBHU0lfTlVNX1BJTlMpOwotICAgIH0gZWxzZSB7Ci0gICAgICAg
IHBjbXMtPmdzaSA9IHFlbXVfYWxsb2NhdGVfaXJxcyhnc2lfaGFuZGxlciwgZ3NpX3N0YXRlLCBH
U0lfTlVNX1BJTlMpOwotICAgIH0KKyAgICBnc2lfc3RhdGUgPSBwY19nc2lfY3JlYXRlKCZwY21z
LT5nc2ksIHBjbWMtPnBjaV9lbmFibGVkKTsKIAogICAgIGlmIChwY21jLT5wY2lfZW5hYmxlZCkg
ewogICAgICAgICBwY2lfYnVzID0gaTQ0MGZ4X2luaXQoaG9zdF90eXBlLApkaWZmIC0tZ2l0IGEv
aHcvaTM4Ni9wY19xMzUuYyBiL2h3L2kzODYvcGNfcTM1LmMKaW5kZXggOGZhZDIwZjMxNC4uNTIy
NjE5NjJiOCAxMDA2NDQKLS0tIGEvaHcvaTM4Ni9wY19xMzUuYworKysgYi9ody9pMzg2L3BjX3Ez
NS5jCkBAIC0yMTAsMTQgKzIxMCw3IEBAIHN0YXRpYyB2b2lkIHBjX3EzNV9pbml0KE1hY2hpbmVT
dGF0ZSAqbWFjaGluZSkKICAgICB9CiAKICAgICAvKiBpcnEgbGluZXMgKi8KLSAgICBnc2lfc3Rh
dGUgPSBnX21hbGxvYzAoc2l6ZW9mKCpnc2lfc3RhdGUpKTsKLSAgICBpZiAoa3ZtX2lvYXBpY19p
bl9rZXJuZWwoKSkgewotICAgICAgICBrdm1fcGNfc2V0dXBfaXJxX3JvdXRpbmcocGNtYy0+cGNp
X2VuYWJsZWQpOwotICAgICAgICBwY21zLT5nc2kgPSBxZW11X2FsbG9jYXRlX2lycXMoa3ZtX3Bj
X2dzaV9oYW5kbGVyLCBnc2lfc3RhdGUsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBHU0lfTlVNX1BJTlMpOwotICAgIH0gZWxzZSB7Ci0gICAgICAgIHBjbXMtPmdzaSA9
IHFlbXVfYWxsb2NhdGVfaXJxcyhnc2lfaGFuZGxlciwgZ3NpX3N0YXRlLCBHU0lfTlVNX1BJTlMp
OwotICAgIH0KKyAgICBnc2lfc3RhdGUgPSBwY19nc2lfY3JlYXRlKCZwY21zLT5nc2ksIHBjbWMt
PnBjaV9lbmFibGVkKTsKIAogICAgIC8qIGNyZWF0ZSBwY2kgaG9zdCBidXMgKi8KICAgICBxMzVf
aG9zdCA9IFEzNV9IT1NUX0RFVklDRShxZGV2X2NyZWF0ZShOVUxMLCBUWVBFX1EzNV9IT1NUX0RF
VklDRSkpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9ody9pMzg2L3BjLmggYi9pbmNsdWRlL2h3L2kz
ODYvcGMuaAppbmRleCBiNjNmYzc2MzFlLi5kMGM2YjlkNDY5IDEwMDY0NAotLS0gYS9pbmNsdWRl
L2h3L2kzODYvcGMuaAorKysgYi9pbmNsdWRlL2h3L2kzODYvcGMuaApAQCAtMTc0LDYgKzE3NCw4
IEBAIHR5cGVkZWYgc3RydWN0IEdTSVN0YXRlIHsKIAogdm9pZCBnc2lfaGFuZGxlcih2b2lkICpv
cGFxdWUsIGludCBuLCBpbnQgbGV2ZWwpOwogCitHU0lTdGF0ZSAqcGNfZ3NpX2NyZWF0ZShxZW11
X2lycSAqKmlycXMsIGJvb2wgcGNpX2VuYWJsZWQpOworCiAvKiB2bXBvcnQuYyAqLwogI2RlZmlu
ZSBUWVBFX1ZNUE9SVCAidm1wb3J0IgogdHlwZWRlZiB1aW50MzJfdCAoVk1Qb3J0UmVhZEZ1bmMp
KHZvaWQgKm9wYXF1ZSwgdWludDMyX3QgYWRkcmVzcyk7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
