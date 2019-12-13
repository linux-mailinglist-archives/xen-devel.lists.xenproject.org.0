Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C1C11E820
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 17:23:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifng6-0001Kk-Em; Fri, 13 Dec 2019 16:20:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=WS5b=2D=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1ifng5-0001KK-Di
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 16:20:29 +0000
X-Inumbo-ID: 795f6f8b-1dc4-11ea-8f78-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 795f6f8b-1dc4-11ea-8f78-12813bfff9fa;
 Fri, 13 Dec 2019 16:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576254027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EftjF8HiFSpwXHv8YZWYjoqxeIDtjy2n7wAZHjtMGk=;
 b=A7+DBJ7RSW942P7zwXRg7R/4n94VRlMi/c+EYQ01Y06nQzqCZ/sThWMLJn63sTY5tB0oNo
 lvCGQte90GCw1wP93Gj518KogjhUpFe2GXxwSisgw4ZjsG6i6HiCM/DBO06m8HP2NOeyuW
 P5DKzHrfleAOjeUz2SFgVMT+ONgAO80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-fqun19fLNLSrG9Al94wyOA-1; Fri, 13 Dec 2019 11:20:26 -0500
X-MC-Unique: fqun19fLNLSrG9Al94wyOA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89139800D4E;
 Fri, 13 Dec 2019 16:20:24 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-147.brq.redhat.com [10.40.205.147])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E95AD19481;
 Fri, 13 Dec 2019 16:20:12 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Dec 2019 17:17:52 +0100
Message-Id: <20191213161753.8051-12-philmd@redhat.com>
In-Reply-To: <20191213161753.8051-1-philmd@redhat.com>
References: <20191213161753.8051-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Subject: [Xen-devel] [PATCH 11/12] hw/i386/pc: Move
 x86_machine_allocate_cpu_irq() to 'hw/i386/x86.c'
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Sergio Lopez <slp@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, xen-devel@lists.xenproject.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

S2VlcCAncGMuYycgZm9yIFBDLW1hY2hpbmUgc3BlY2lmaWMgY29kZSwgYW5kIHVzZSAneDg2LmMn
IGZvciBjb2RlCnVzZWQgYnkgYWxsIHRoZSBYODYtYmFzZWQgbWFjaGluZXMuCgpTaWduZWQtb2Zm
LWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaW5j
bHVkZS9ody9pMzg2L3BjLmggIHwgIDEgLQogaW5jbHVkZS9ody9pMzg2L3g4Ni5oIHwgIDIgKysK
IGh3L2kzODYvcGMuYyAgICAgICAgICB8IDI3IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQog
aHcvaTM4Ni94ODYuYyAgICAgICAgIHwgMzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
CiA0IGZpbGVzIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKaW5k
ZXggMjQ0ZGJmMmVjMC4uMmVmNmUyY2ZmZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9pMzg2L3Bj
LmgKKysrIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKQEAgLTE5OCw3ICsxOTgsNiBAQCB2b2lkIHBj
X21lbW9yeV9pbml0KFBDTWFjaGluZVN0YXRlICpwY21zLAogICAgICAgICAgICAgICAgICAgICBN
ZW1vcnlSZWdpb24gKnJvbV9tZW1vcnksCiAgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lv
biAqKnJhbV9tZW1vcnkpOwogdWludDY0X3QgcGNfcGNpX2hvbGU2NF9zdGFydCh2b2lkKTsKLXFl
bXVfaXJxIHg4Nl9tYWNoaW5lX2FsbG9jYXRlX2NwdV9pcnEodm9pZCk7CiBEZXZpY2VTdGF0ZSAq
cGNfdmdhX2luaXQoSVNBQnVzICppc2FfYnVzLCBQQ0lCdXMgKnBjaV9idXMpOwogdm9pZCBwY19i
YXNpY19kZXZpY2VfaW5pdChJU0FCdXMgKmlzYV9idXMsIHFlbXVfaXJxICpnc2ksCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgIElTQURldmljZSAqKnJ0Y19zdGF0ZSwKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvaHcvaTM4Ni94ODYuaCBiL2luY2x1ZGUvaHcvaTM4Ni94ODYuaAppbmRleCA0Yjg0OTE3
ODg1Li40YzNkZDZmMzNlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2h3L2kzODYveDg2LmgKKysrIGIv
aW5jbHVkZS9ody9pMzg2L3g4Ni5oCkBAIC05NSw0ICs5NSw2IEBAIHZvaWQgeDg2X2xvYWRfbGlu
dXgoWDg2TWFjaGluZVN0YXRlICp4ODZtcywKICAgICAgICAgICAgICAgICAgICAgYm9vbCBwdmhf
ZW5hYmxlZCwKICAgICAgICAgICAgICAgICAgICAgYm9vbCBsaW51eGJvb3RfZG1hX2VuYWJsZWQp
OwogCitxZW11X2lycSB4ODZfbWFjaGluZV9hbGxvY2F0ZV9jcHVfaXJxKHZvaWQpOworCiAjZW5k
aWYKZGlmZiAtLWdpdCBhL2h3L2kzODYvcGMuYyBiL2h3L2kzODYvcGMuYwppbmRleCA0ZGVmZWUy
NzRmLi40YzAxODczNWIwIDEwMDY0NAotLS0gYS9ody9pMzg2L3BjLmMKKysrIGIvaHcvaTM4Ni9w
Yy5jCkBAIC00MTIsMjggKzQxMiw2IEBAIGludCBjcHVfZ2V0X3BpY19pbnRlcnJ1cHQoQ1BVWDg2
U3RhdGUgKmVudikKICAgICByZXR1cm4gaW50bm87CiB9CiAKLXN0YXRpYyB2b2lkIHBpY19pcnFf
cmVxdWVzdCh2b2lkICpvcGFxdWUsIGludCBpcnEsIGludCBsZXZlbCkKLXsKLSAgICBDUFVTdGF0
ZSAqY3MgPSBmaXJzdF9jcHU7Ci0gICAgWDg2Q1BVICpjcHUgPSBYODZfQ1BVKGNzKTsKLQotICAg
IHRyYWNlX3g4Nl9waWNfaW50ZXJydXB0KGlycSwgbGV2ZWwpOwotICAgIGlmIChjcHUtPmFwaWNf
c3RhdGUgJiYgIWt2bV9pcnFjaGlwX2luX2tlcm5lbCgpKSB7Ci0gICAgICAgIENQVV9GT1JFQUNI
KGNzKSB7Ci0gICAgICAgICAgICBjcHUgPSBYODZfQ1BVKGNzKTsKLSAgICAgICAgICAgIGlmIChh
cGljX2FjY2VwdF9waWNfaW50cihjcHUtPmFwaWNfc3RhdGUpKSB7Ci0gICAgICAgICAgICAgICAg
YXBpY19kZWxpdmVyX3BpY19pbnRyKGNwdS0+YXBpY19zdGF0ZSwgbGV2ZWwpOwotICAgICAgICAg
ICAgfQotICAgICAgICB9Ci0gICAgfSBlbHNlIHsKLSAgICAgICAgaWYgKGxldmVsKSB7Ci0gICAg
ICAgICAgICBjcHVfaW50ZXJydXB0KGNzLCBDUFVfSU5URVJSVVBUX0hBUkQpOwotICAgICAgICB9
IGVsc2UgewotICAgICAgICAgICAgY3B1X3Jlc2V0X2ludGVycnVwdChjcywgQ1BVX0lOVEVSUlVQ
VF9IQVJEKTsKLSAgICAgICAgfQotICAgIH0KLX0KLQogLyogUEMgY21vcyBtYXBwaW5ncyAqLwog
CiAjZGVmaW5lIFJFR19FUVVJUE1FTlRfQllURSAgICAgICAgICAweDE0CkBAIC0xMjgyLDExICsx
MjYwLDYgQEAgdWludDY0X3QgcGNfcGNpX2hvbGU2NF9zdGFydCh2b2lkKQogICAgIHJldHVybiBS
T1VORF9VUChob2xlNjRfc3RhcnQsIDEgKiBHaUIpOwogfQogCi1xZW11X2lycSB4ODZfbWFjaGlu
ZV9hbGxvY2F0ZV9jcHVfaXJxKHZvaWQpCi17Ci0gICAgcmV0dXJuIHFlbXVfYWxsb2NhdGVfaXJx
KHBpY19pcnFfcmVxdWVzdCwgTlVMTCwgMCk7Ci19Ci0KIERldmljZVN0YXRlICpwY192Z2FfaW5p
dChJU0FCdXMgKmlzYV9idXMsIFBDSUJ1cyAqcGNpX2J1cykKIHsKICAgICBEZXZpY2VTdGF0ZSAq
ZGV2ID0gTlVMTDsKZGlmZiAtLWdpdCBhL2h3L2kzODYveDg2LmMgYi9ody9pMzg2L3g4Ni5jCmlu
ZGV4IDM5NGVkYzJmNzIuLmE2YTM5NGNhMzYgMTAwNjQ0Ci0tLSBhL2h3L2kzODYveDg2LmMKKysr
IGIvaHcvaTM4Ni94ODYuYwpAQCAtMzQsNiArMzQsNyBAQAogI2luY2x1ZGUgInN5c2VtdS9udW1h
LmgiCiAjaW5jbHVkZSAic3lzZW11L3JlcGxheS5oIgogI2luY2x1ZGUgInN5c2VtdS9zeXNlbXUu
aCIKKyNpbmNsdWRlICJzeXNlbXUva3ZtLmgiCiAKICNpbmNsdWRlICJody9pMzg2L3g4Ni5oIgog
I2luY2x1ZGUgInRhcmdldC9pMzg2L2NwdS5oIgpAQCAtNDEsMTEgKzQyLDEzIEBACiAjaW5jbHVk
ZSAiaHcvaTM4Ni9md19jZmcuaCIKIAogI2luY2x1ZGUgImh3L2FjcGkvY3B1X2hvdHBsdWcuaCIK
KyNpbmNsdWRlICJody9pcnEuaCIKICNpbmNsdWRlICJody9ubWkuaCIKICNpbmNsdWRlICJody9s
b2FkZXIuaCIKICNpbmNsdWRlICJtdWx0aWJvb3QuaCIKICNpbmNsdWRlICJlbGYuaCIKICNpbmNs
dWRlICJzdGFuZGFyZC1oZWFkZXJzL2FzbS14ODYvYm9vdHBhcmFtLmgiCisjaW5jbHVkZSAidHJh
Y2UuaCIKIAogI2RlZmluZSBCSU9TX0ZJTEVOQU1FICJiaW9zLmJpbiIKIApAQCAtMjA2LDYgKzIw
OSwzMyBAQCBzdGF0aWMgdm9pZCB4ODZfbm1pKE5NSVN0YXRlICpuLCBpbnQgY3B1X2luZGV4LCBF
cnJvciAqKmVycnApCiAgICAgfQogfQogCitzdGF0aWMgdm9pZCBwaWNfaXJxX3JlcXVlc3Qodm9p
ZCAqb3BhcXVlLCBpbnQgaXJxLCBpbnQgbGV2ZWwpCit7CisgICAgQ1BVU3RhdGUgKmNzID0gZmly
c3RfY3B1OworICAgIFg4NkNQVSAqY3B1ID0gWDg2X0NQVShjcyk7CisKKyAgICB0cmFjZV94ODZf
cGljX2ludGVycnVwdChpcnEsIGxldmVsKTsKKyAgICBpZiAoY3B1LT5hcGljX3N0YXRlICYmICFr
dm1faXJxY2hpcF9pbl9rZXJuZWwoKSkgeworICAgICAgICBDUFVfRk9SRUFDSChjcykgeworICAg
ICAgICAgICAgY3B1ID0gWDg2X0NQVShjcyk7CisgICAgICAgICAgICBpZiAoYXBpY19hY2NlcHRf
cGljX2ludHIoY3B1LT5hcGljX3N0YXRlKSkgeworICAgICAgICAgICAgICAgIGFwaWNfZGVsaXZl
cl9waWNfaW50cihjcHUtPmFwaWNfc3RhdGUsIGxldmVsKTsKKyAgICAgICAgICAgIH0KKyAgICAg
ICAgfQorICAgIH0gZWxzZSB7CisgICAgICAgIGlmIChsZXZlbCkgeworICAgICAgICAgICAgY3B1
X2ludGVycnVwdChjcywgQ1BVX0lOVEVSUlVQVF9IQVJEKTsKKyAgICAgICAgfSBlbHNlIHsKKyAg
ICAgICAgICAgIGNwdV9yZXNldF9pbnRlcnJ1cHQoY3MsIENQVV9JTlRFUlJVUFRfSEFSRCk7Cisg
ICAgICAgIH0KKyAgICB9Cit9CisKK3FlbXVfaXJxIHg4Nl9tYWNoaW5lX2FsbG9jYXRlX2NwdV9p
cnEodm9pZCkKK3sKKyAgICByZXR1cm4gcWVtdV9hbGxvY2F0ZV9pcnEocGljX2lycV9yZXF1ZXN0
LCBOVUxMLCAwKTsKK30KKwogc3RhdGljIGxvbmcgZ2V0X2ZpbGVfc2l6ZShGSUxFICpmKQogewog
ICAgIGxvbmcgd2hlcmUsIHNpemU7Ci0tIAoyLjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
