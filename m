Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F76AD7B8C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:30:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPfh-00031o-US; Tue, 15 Oct 2019 16:27:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPff-00031P-QT
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:27:39 +0000
X-Inumbo-ID: b444d296-ef68-11e9-9396-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b444d296-ef68-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 16:27:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E1AE41801ED1;
 Tue, 15 Oct 2019 16:27:38 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E3A819C58;
 Tue, 15 Oct 2019 16:27:28 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:35 +0200
Message-Id: <20191015162705.28087-3-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Tue, 15 Oct 2019 16:27:39 +0000 (UTC)
Subject: [Xen-devel] [PATCH 02/32] hw/i386/pc: Move kvm_i8259_init()
 declaration to sysemu/kvm.h
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

TW92ZSB0aGUgS1ZNLXJlbGF0ZWQgY2FsbCB0byAic3lzZW11L2t2bS5oIi4KClNpZ25lZC1vZmYt
Ynk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBpbmNs
dWRlL2h3L2kzODYvcGMuaCB8IDEgLQogaW5jbHVkZS9zeXNlbXUva3ZtLmggfCAxICsKIDIgZmls
ZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9p
bmNsdWRlL2h3L2kzODYvcGMuaCBiL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCmluZGV4IDZkZjRmNGI2
ZmIuLjA5ZTc0ZTc3NjQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oCisrKyBiL2lu
Y2x1ZGUvaHcvaTM4Ni9wYy5oCkBAIC0xNTgsNyArMTU4LDYgQEAgdHlwZWRlZiBzdHJ1Y3QgUENN
YWNoaW5lQ2xhc3MgewogCiBleHRlcm4gRGV2aWNlU3RhdGUgKmlzYV9waWM7CiBxZW11X2lycSAq
aTgyNTlfaW5pdChJU0FCdXMgKmJ1cywgcWVtdV9pcnEgcGFyZW50X2lycSk7Ci1xZW11X2lycSAq
a3ZtX2k4MjU5X2luaXQoSVNBQnVzICpidXMpOwogaW50IHBpY19yZWFkX2lycShEZXZpY2VTdGF0
ZSAqZCk7CiBpbnQgcGljX2dldF9vdXRwdXQoRGV2aWNlU3RhdGUgKmQpOwogCmRpZmYgLS1naXQg
YS9pbmNsdWRlL3N5c2VtdS9rdm0uaCBiL2luY2x1ZGUvc3lzZW11L2t2bS5oCmluZGV4IDlkMTQz
MjgyYmMuLmRhOGFhOWY1YTggMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc3lzZW11L2t2bS5oCisrKyBi
L2luY2x1ZGUvc3lzZW11L2t2bS5oCkBAIC01MTMsNiArNTEzLDcgQEAgdm9pZCBrdm1faXJxY2hp
cF9zZXRfcWVtdWlycV9nc2koS1ZNU3RhdGUgKnMsIHFlbXVfaXJxIGlycSwgaW50IGdzaSk7CiB2
b2lkIGt2bV9wY19nc2lfaGFuZGxlcih2b2lkICpvcGFxdWUsIGludCBuLCBpbnQgbGV2ZWwpOwog
dm9pZCBrdm1fcGNfc2V0dXBfaXJxX3JvdXRpbmcoYm9vbCBwY2lfZW5hYmxlZCk7CiB2b2lkIGt2
bV9pbml0X2lycV9yb3V0aW5nKEtWTVN0YXRlICpzKTsKK3FlbXVfaXJxICprdm1faTgyNTlfaW5p
dChJU0FCdXMgKmJ1cyk7CiAKIC8qKgogICoga3ZtX2FyY2hfaXJxY2hpcF9jcmVhdGU6Ci0tIAoy
LjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
