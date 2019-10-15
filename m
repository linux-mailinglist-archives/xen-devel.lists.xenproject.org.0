Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16311D7B8B
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:30:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPgN-0003DX-W5; Tue, 15 Oct 2019 16:28:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPgM-0003DA-MD
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:28:22 +0000
X-Inumbo-ID: cd89d371-ef68-11e9-9396-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd89d371-ef68-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 16:28:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B1BF33082135;
 Tue, 15 Oct 2019 16:28:21 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3766D19C58;
 Tue, 15 Oct 2019 16:27:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:38 +0200
Message-Id: <20191015162705.28087-6-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 15 Oct 2019 16:28:21 +0000 (UTC)
Subject: [Xen-devel] [PATCH 05/32] mc146818rtc: Include "mc146818rtc_regs.h"
 directly in mc146818rtc.c
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KCkRldmljZXMv
Ym9hcmRzIHdhbnRpbmcgdG8gdXNlIHRoZSBNQzE0NjgxOCBSVEMgZG9uJ3QgbmVlZAp0aGUga25v
d2xlZGdlIGl0cyBpbnRlcm5hbCByZWdpc3RlcnMuIE1vdmUgdGhlICJtYzE0NjgxOHJ0Y19yZWdz
LmgiCmluY2x1c2lvbiB0byBtYzE0NjgxOHJ0Yy5jIHdoZXJlIGl0IGlzIHJlcXVpcmVkLgoKV2Ug
Y2FuIG5vdCBtb3ZlIHRoaXMgZmlsZSBmcm9tIGluY2x1ZGUvaHcvdGltZXIvIHRvIGh3L3RpbWVy
LyBmb3IKbG9jYWwgaW5jbHVzaW9uIGJlY2F1c2UgdGhlIEFDUEkgRkFEVCB0YWJsZSB1c2UgdGhl
IFJUQ19DRU5UVVJZCnJlZ2lzdGVyIGFkZHJlc3MuCgpTaWduZWQtb2ZmLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvdGltZXIvbWMxNDY4MThy
dGMuYyAgICAgICAgIHwgMSArCiBpbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRjLmggfCAxIC0K
IDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9ody90aW1lci9tYzE0NjgxOHJ0Yy5jIGIvaHcvdGltZXIvbWMxNDY4MThydGMuYwppbmRl
eCBlNDBiNTRlNzQzLi4wYzA0Yjc0YzJlIDEwMDY0NAotLS0gYS9ody90aW1lci9tYzE0NjgxOHJ0
Yy5jCisrKyBiL2h3L3RpbWVyL21jMTQ2ODE4cnRjLmMKQEAgLTQxLDYgKzQxLDcgQEAKICNpbmNs
dWRlICJxYXBpL3FhcGktZXZlbnRzLW1pc2MtdGFyZ2V0LmgiCiAjaW5jbHVkZSAicWFwaS92aXNp
dG9yLmgiCiAjaW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNlcy5oIgorI2luY2x1ZGUgImh3L3Rp
bWVyL21jMTQ2ODE4cnRjX3JlZ3MuaCIKIAogI2lmZGVmIFRBUkdFVF9JMzg2CiAjaW5jbHVkZSAi
aHcvaTM4Ni9hcGljLmgiCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRj
LmggYi9pbmNsdWRlL2h3L3RpbWVyL21jMTQ2ODE4cnRjLmgKaW5kZXggMTc3NjFjZjZkOS4uYTg1
N2RjZGM2OSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody90aW1lci9tYzE0NjgxOHJ0Yy5oCisrKyBi
L2luY2x1ZGUvaHcvdGltZXIvbWMxNDY4MThydGMuaApAQCAtNSw3ICs1LDYgQEAKICNpbmNsdWRl
ICJxZW11L3F1ZXVlLmgiCiAjaW5jbHVkZSAicWVtdS90aW1lci5oIgogI2luY2x1ZGUgImh3L2lz
YS9pc2EuaCIKLSNpbmNsdWRlICJody90aW1lci9tYzE0NjgxOHJ0Y19yZWdzLmgiCiAKICNkZWZp
bmUgVFlQRV9NQzE0NjgxOF9SVEMgIm1jMTQ2ODE4cnRjIgogI2RlZmluZSBNQzE0NjgxOF9SVEMo
b2JqKSBPQkpFQ1RfQ0hFQ0soUlRDU3RhdGUsIChvYmopLCBUWVBFX01DMTQ2ODE4X1JUQykKLS0g
CjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
