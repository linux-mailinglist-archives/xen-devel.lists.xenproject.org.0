Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4EBD7BB7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:33:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPjY-0005U1-4g; Tue, 15 Oct 2019 16:31:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPjW-0005TP-NB
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:31:38 +0000
X-Inumbo-ID: 4269b762-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4269b762-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:31:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6136810C093C;
 Tue, 15 Oct 2019 16:31:37 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7337A19C58;
 Tue, 15 Oct 2019 16:31:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:55 +0200
Message-Id: <20191015162705.28087-23-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.66]); Tue, 15 Oct 2019 16:31:37 +0000 (UTC)
Subject: [Xen-devel] [PATCH 22/32] hw/i386/pc: Move gsi_state creation code
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

VGhlIGJsb2NrIGNvZGUgcmVsYXRlZCB0byBJUlEgc3RhcnQgZmV3IGxpbmVzIGxhdGVyLiBNb3Zl
CnRoZSBjb21tZW50IGFuZCB0aGUgcGNfZ3NpX2NyZWF0ZSgpIGNhbGwgd2hlcmUgd2Ugc3RhcnQK
dG8gdXNlIHRoZSBJUlFzLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2kzODYvcGNfcTM1LmMgfCA2ICsrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9ody9pMzg2L3BjX3EzNS5jIGIvaHcvaTM4Ni9wY19xMzUuYwppbmRleCA1MjI2MTk2MmI4Li42
ZDA5NmVmZjI4IDEwMDY0NAotLS0gYS9ody9pMzg2L3BjX3EzNS5jCisrKyBiL2h3L2kzODYvcGNf
cTM1LmMKQEAgLTIwOSw5ICsyMDksNiBAQCBzdGF0aWMgdm9pZCBwY19xMzVfaW5pdChNYWNoaW5l
U3RhdGUgKm1hY2hpbmUpCiAgICAgICAgICAgICAgICAgICAgICAgIHJvbV9tZW1vcnksICZyYW1f
bWVtb3J5KTsKICAgICB9CiAKLSAgICAvKiBpcnEgbGluZXMgKi8KLSAgICBnc2lfc3RhdGUgPSBw
Y19nc2lfY3JlYXRlKCZwY21zLT5nc2ksIHBjbWMtPnBjaV9lbmFibGVkKTsKLQogICAgIC8qIGNy
ZWF0ZSBwY2kgaG9zdCBidXMgKi8KICAgICBxMzVfaG9zdCA9IFEzNV9IT1NUX0RFVklDRShxZGV2
X2NyZWF0ZShOVUxMLCBUWVBFX1EzNV9IT1NUX0RFVklDRSkpOwogCkBAIC0yNDUsNiArMjQyLDkg
QEAgc3RhdGljIHZvaWQgcGNfcTM1X2luaXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQogICAgIG9i
amVjdF9wcm9wZXJ0eV9zZXRfbGluayhPQkpFQ1QobWFjaGluZSksIE9CSkVDVChscGMpLAogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBQQ19NQUNISU5FX0FDUElfREVWSUNFX1BST1AsICZl
cnJvcl9hYm9ydCk7CiAKKyAgICAvKiBpcnEgbGluZXMgKi8KKyAgICBnc2lfc3RhdGUgPSBwY19n
c2lfY3JlYXRlKCZwY21zLT5nc2ksIHBjbWMtPnBjaV9lbmFibGVkKTsKKwogICAgIGljaDlfbHBj
ID0gSUNIOV9MUENfREVWSUNFKGxwYyk7CiAgICAgbHBjX2RldiA9IERFVklDRShscGMpOwogICAg
IGZvciAoaSA9IDA7IGkgPCBHU0lfTlVNX1BJTlM7IGkrKykgewotLSAKMi4yMS4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
