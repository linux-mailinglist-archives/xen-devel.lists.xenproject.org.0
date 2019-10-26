Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FFAE5E6D
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQPT-0005Qm-2a; Sat, 26 Oct 2019 18:03:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQPR-0005Pz-5Y
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:03:29 +0000
X-Inumbo-ID: e91de9d4-f81a-11e9-bbab-bc764e2007e4
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id e91de9d4-f81a-11e9-bbab-bc764e2007e4;
 Sat, 26 Oct 2019 18:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zOd0udsusP6PV9SSkD8zKTkS3mLJ/h//I9mB8ltdC+8=;
 b=OqZQkHvCmg2NhmWGc9LT3/aTrpUgP9UTpRb7Ag5rKkLGrQQHySBAbeqKNJjJ37cf50IhE7
 JD7rVMly1L14XrzW1saNughHCAGmfiAElgmyPkAbmDNh2h7jwTd0WwgSR7qlowcpBH53Y9
 PDIwxNyAj1Kqh+W63PWPl8DuDCZh4R8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-uTTQ-BWHNRq0tavASywL-w-1; Sat, 26 Oct 2019 14:03:23 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A916107AD25;
 Sat, 26 Oct 2019 18:03:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C4E760C57;
 Sat, 26 Oct 2019 18:03:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:30 +0200
Message-Id: <20191026180143.7369-8-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: uTTQ-BWHNRq0tavASywL-w-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 07/20] piix4: Add an i8254 PIT Controller as
 specified in datasheet
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKUmVtb3ZlIGk4
MjU0IGluc3RhbmNpYXRlZCBpbiBtYWx0YSBib2FyZCwgdG8gbm90IGhhdmUgaXQgdHdpY2UuCgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTEwLWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpSZXZpZXdlZC1ieTogQWxla3NhbmRh
ciBNYXJrb3ZpYyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbT4KU2lnbmVkLW9mZi1ieTogUGhpbGlw
cGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KdjI6IEZpeGVkIHR5cG8g
KHRodXRoKQotLS0KIGh3L2lzYS9waWl4NC5jICAgICAgIHwgNCArKysrCiBody9taXBzL21pcHNf
bWFsdGEuYyB8IDQgLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2EvcGlpeDQuYwpp
bmRleCA5ZWJlOThiZGMzLi5jMDdhMWUxNGE4IDEwMDY0NAotLS0gYS9ody9pc2EvcGlpeDQuYwor
KysgYi9ody9pc2EvcGlpeDQuYwpAQCAtMzAsNiArMzAsNyBAQAogI2luY2x1ZGUgImh3L2lzYS9p
c2EuaCIKICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJody9kbWEvaTgyNTcuaCIK
KyNpbmNsdWRlICJody90aW1lci9pODI1NC5oIgogI2luY2x1ZGUgIm1pZ3JhdGlvbi92bXN0YXRl
LmgiCiAjaW5jbHVkZSAic3lzZW11L3Jlc2V0LmgiCiAjaW5jbHVkZSAic3lzZW11L3J1bnN0YXRl
LmgiCkBAIC0xNjgsNiArMTY5LDkgQEAgc3RhdGljIHZvaWQgcGlpeDRfcmVhbGl6ZShQQ0lEZXZp
Y2UgKmRldiwgRXJyb3IgKiplcnJwKQogICAgIC8qIGluaXRpYWxpemUgSVNBIGlycXMgKi8KICAg
ICBpc2FfYnVzX2lycXMoaXNhX2J1cywgcy0+aXNhKTsKIAorICAgIC8qIGluaXRpYWxpemUgcGl0
ICovCisgICAgaTgyNTRfcGl0X2luaXQoaXNhX2J1cywgMHg0MCwgMCwgTlVMTCk7CisKICAgICAv
KiBETUEgKi8KICAgICBpODI1N19kbWFfaW5pdChpc2FfYnVzLCAwKTsKIApkaWZmIC0tZ2l0IGEv
aHcvbWlwcy9taXBzX21hbHRhLmMgYi9ody9taXBzL21pcHNfbWFsdGEuYwppbmRleCA0NGU1Zjhi
MjZiLi45YWY0ODZjNzdjIDEwMDY0NAotLS0gYS9ody9taXBzL21pcHNfbWFsdGEuYworKysgYi9o
dy9taXBzL21pcHNfbWFsdGEuYwpAQCAtNDUsNyArNDUsNiBAQAogI2luY2x1ZGUgImh3L2xvYWRl
ci5oIgogI2luY2x1ZGUgImVsZi5oIgogI2luY2x1ZGUgImh3L3J0Yy9tYzE0NjgxOHJ0Yy5oIgot
I2luY2x1ZGUgImh3L3RpbWVyL2k4MjU0LmgiCiAjaW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNwYWNl
cy5oIgogI2luY2x1ZGUgImh3L3N5c2J1cy5oIiAgICAgICAgICAgICAvKiBTeXNCdXNEZXZpY2Ug
Ki8KICNpbmNsdWRlICJxZW11L2hvc3QtdXRpbHMuaCIKQEAgLTk5LDggKzk4LDYgQEAgdHlwZWRl
ZiBzdHJ1Y3QgewogICAgIHFlbXVfaXJxIGk4MjU5W0lTQV9OVU1fSVJRU107CiB9IE1hbHRhU3Rh
dGU7CiAKLXN0YXRpYyBJU0FEZXZpY2UgKnBpdDsKLQogc3RhdGljIHN0cnVjdCBfbG9hZGVycGFy
YW1zIHsKICAgICBpbnQgcmFtX3NpemUsIHJhbV9sb3dfc2l6ZTsKICAgICBjb25zdCBjaGFyICpr
ZXJuZWxfZmlsZW5hbWU7CkBAIC0xNDI4LDcgKzE0MjUsNiBAQCB2b2lkIG1pcHNfbWFsdGFfaW5p
dChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgcGNpX2NyZWF0ZV9zaW1wbGUocGNpX2J1cywg
cGlpeDRfZGV2Zm4gKyAyLCAicGlpeDQtdXNiLXVoY2kiKTsKICAgICBzbWJ1cyA9IHBpaXg0X3Bt
X2luaXQocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAzLCAweDExMDAsCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGlzYV9nZXRfaXJxKE5VTEwsIDkpLCBOVUxMLCAwLCBOVUxMKTsKLSAgICBwaXQg
PSBpODI1NF9waXRfaW5pdChpc2FfYnVzLCAweDQwLCAwLCBOVUxMKTsKICAgICBtYzE0NjgxOF9y
dGNfaW5pdChpc2FfYnVzLCAyMDAwLCBOVUxMKTsKIAogICAgIC8qIGdlbmVyYXRlIFNQRCBFRVBS
T00gZGF0YSAqLwotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
