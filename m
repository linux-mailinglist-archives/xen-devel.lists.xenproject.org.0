Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03538D7BB5
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:33:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPiX-0004sF-AS; Tue, 15 Oct 2019 16:30:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPiW-0004ro-Du
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:30:36 +0000
X-Inumbo-ID: 1d8bc6c4-ef69-11e9-9397-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1d8bc6c4-ef69-11e9-9397-12813bfff9fa;
 Tue, 15 Oct 2019 16:30:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7AF671DA2;
 Tue, 15 Oct 2019 16:30:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B8CE19C58;
 Tue, 15 Oct 2019 16:30:24 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:50 +0200
Message-Id: <20191015162705.28087-18-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 15 Oct 2019 16:30:35 +0000 (UTC)
Subject: [Xen-devel] [PATCH 17/32] hw/mips/mips_malta: Create IDE hard drive
 array dynamically
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

SW4gdGhlIG5leHQgY29tbWl0IHdlJ2xsIHJlZmFjdG9yIHRoZSBQSUlYNCBjb2RlIG91dCBvZgpt
aXBzX21hbHRhX2luaXQoKS4gQXMgYSBwcmVsaW1pbmFyeSBzdGVwLCBhZGQgdGhlICdpZGVfZHJp
dmVzJwp2YXJpYWJsZSBhbmQgY3JlYXRlIHRoZSBkcml2ZSBhcnJheSBkeW5hbWljYWxseS4KClNp
Z25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4K
LS0tCiBody9taXBzL21pcHNfbWFsdGEuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9taXBzL21pcHNf
bWFsdGEuYyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCmluZGV4IDUyOGMzNGExYzMuLjc3NGJiODEw
ZjYgMTAwNjQ0Ci0tLSBhL2h3L21pcHMvbWlwc19tYWx0YS5jCisrKyBiL2h3L21pcHMvbWlwc19t
YWx0YS5jCkBAIC0xMjM1LDcgKzEyMzUsOCBAQCB2b2lkIG1pcHNfbWFsdGFfaW5pdChNYWNoaW5l
U3RhdGUgKm1hY2hpbmUpCiAgICAgaW50IHBpaXg0X2RldmZuOwogICAgIEkyQ0J1cyAqc21idXM7
CiAgICAgRHJpdmVJbmZvICpkaW5mbzsKLSAgICBEcml2ZUluZm8gKmhkW01BWF9JREVfQlVTICog
TUFYX0lERV9ERVZTXTsKKyAgICBjb25zdCBzaXplX3QgaWRlX2RyaXZlcyA9IE1BWF9JREVfQlVT
ICogTUFYX0lERV9ERVZTOworICAgIERyaXZlSW5mbyAqKmhkOwogICAgIGludCBmbF9pZHggPSAw
OwogICAgIGludCBiZTsKIApAQCAtMTQwNiw3ICsxNDA3LDggQEAgdm9pZCBtaXBzX21hbHRhX2lu
aXQoTWFjaGluZVN0YXRlICptYWNoaW5lKQogICAgIHBjaV9idXMgPSBndDY0MTIwX3JlZ2lzdGVy
KHMtPmk4MjU5KTsKIAogICAgIC8qIFNvdXRoYnJpZGdlICovCi0gICAgaWRlX2RyaXZlX2dldCho
ZCwgQVJSQVlfU0laRShoZCkpOworICAgIGhkID0gZ19uZXcoRHJpdmVJbmZvICosIGlkZV9kcml2
ZXMpOworICAgIGlkZV9kcml2ZV9nZXQoaGQsIGlkZV9kcml2ZXMpOwogCiAgICAgcGNpID0gcGNp
X2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihwY2lfYnVzLCBQQ0lfREVWRk4oMTAsIDApLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdHJ1ZSwgVFlQRV9QSUlY
NF9QQ0lfREVWSUNFKTsKQEAgLTE0MjEsNiArMTQyMyw3IEBAIHZvaWQgbWlwc19tYWx0YV9pbml0
KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKICAgICB9CiAKICAgICBwY2lfcGlpeDRfaWRlX2luaXQo
cGNpX2J1cywgaGQsIHBpaXg0X2RldmZuICsgMSk7CisgICAgZ19mcmVlKGhkKTsKICAgICBwY2lf
Y3JlYXRlX3NpbXBsZShwY2lfYnVzLCBwaWl4NF9kZXZmbiArIDIsICJwaWl4NC11c2ItdWhjaSIp
OwogICAgIHNtYnVzID0gcGlpeDRfcG1faW5pdChwY2lfYnVzLCBwaWl4NF9kZXZmbiArIDMsIDB4
MTEwMCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgaXNhX2dldF9pcnEoTlVMTCwgOSksIE5V
TEwsIDAsIE5VTEwpOwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
