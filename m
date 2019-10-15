Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEA0D7B97
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:30:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPhD-0003WO-70; Tue, 15 Oct 2019 16:29:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPhB-0003Vm-Gi
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:29:13 +0000
X-Inumbo-ID: ec10cf36-ef68-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec10cf36-ef68-11e9-beca-bc764e2007e4;
 Tue, 15 Oct 2019 16:29:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7E8ED307D942;
 Tue, 15 Oct 2019 16:29:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 21B2419C58;
 Tue, 15 Oct 2019 16:29:05 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:42 +0200
Message-Id: <20191015162705.28087-10-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 15 Oct 2019 16:29:12 +0000 (UTC)
Subject: [Xen-devel] [PATCH 09/32] piix4: add Reset Control Register
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKVGhlIFJDUiBJ
L08gcG9ydCAoMHhjZjkpIGlzIHVzZWQgdG8gZ2VuZXJhdGUgYSBoYXJkIHJlc2V0IG9yIGEgc29m
dCByZXNldC4KCkFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpB
Y2tlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgpNZXNzYWdlLUlkOiA8
MjAxNzEyMTYwOTAyMjguMjg1MDUtNy1ocG91c3NpbkByZWFjdG9zLm9yZz4KW1BNRDogcmViYXNl
ZCwgdXBkYXRlZCBpbmNsdWRlc10KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVk
w6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2lzYS9waWl4NC5jIHwgNDAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQwIGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9ody9pc2EvcGlpeDQuYyBiL2h3L2lzYS9waWl4NC5jCmlu
ZGV4IDQyMDIyNDNlNDEuLjZlMmQ5Yjk3NzQgMTAwNjQ0Ci0tLSBhL2h3L2lzYS9waWl4NC5jCisr
KyBiL2h3L2lzYS9waWl4NC5jCkBAIC0yLDYgKzIsNyBAQAogICogUUVNVSBQSUlYNCBQQ0kgQnJp
ZGdlIEVtdWxhdGlvbgogICoKICAqIENvcHlyaWdodCAoYykgMjAwNiBGYWJyaWNlIEJlbGxhcmQK
KyAqIENvcHlyaWdodCAoYykgMjAxOCBIZXJ2w6kgUG91c3NpbmVhdQogICoKICAqIFBlcm1pc3Np
b24gaXMgaGVyZWJ5IGdyYW50ZWQsIGZyZWUgb2YgY2hhcmdlLCB0byBhbnkgcGVyc29uIG9idGFp
bmluZyBhIGNvcHkKICAqIG9mIHRoaXMgc29mdHdhcmUgYW5kIGFzc29jaWF0ZWQgZG9jdW1lbnRh
dGlvbiBmaWxlcyAodGhlICJTb2Z0d2FyZSIpLCB0byBkZWFsCkBAIC0yOSwxMSArMzAsMTYgQEAK
ICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0ZS5oIgog
I2luY2x1ZGUgInN5c2VtdS9yZXNldC5oIgorI2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0ZS5oIgog
CiBQQ0lEZXZpY2UgKnBpaXg0X2RldjsKIAogdHlwZWRlZiBzdHJ1Y3QgUElJWDRTdGF0ZSB7CiAg
ICAgUENJRGV2aWNlIGRldjsKKworICAgIC8qIFJlc2V0IENvbnRyb2wgUmVnaXN0ZXIgKi8KKyAg
ICBNZW1vcnlSZWdpb24gcmNyX21lbTsKKyAgICB1aW50OF90IHJjcjsKIH0gUElJWDRTdGF0ZTsK
IAogI2RlZmluZSBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UgIlBJSVg0IgpAQCAtODgsNiArOTQsMzQg
QEAgc3RhdGljIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX3BpaXg0ID0gewogICAg
IH0KIH07CiAKK3N0YXRpYyB2b2lkIHBpaXg0X3Jjcl93cml0ZSh2b2lkICpvcGFxdWUsIGh3YWRk
ciBhZGRyLCB1aW50NjRfdCB2YWwsCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWdu
ZWQgaW50IGxlbikKK3sKKyAgICBQSUlYNFN0YXRlICpzID0gb3BhcXVlOworCisgICAgaWYgKHZh
bCAmIDQpIHsKKyAgICAgICAgcWVtdV9zeXN0ZW1fcmVzZXRfcmVxdWVzdChTSFVURE9XTl9DQVVT
RV9HVUVTVF9SRVNFVCk7CisgICAgICAgIHJldHVybjsKKyAgICB9CisgICAgcy0+cmNyID0gdmFs
ICYgMjsgLyoga2VlcCBTeXN0ZW0gUmVzZXQgdHlwZSBvbmx5ICovCit9CisKK3N0YXRpYyB1aW50
NjRfdCBwaWl4NF9yY3JfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1bnNpZ25lZCBp
bnQgbGVuKQoreworICAgIFBJSVg0U3RhdGUgKnMgPSBvcGFxdWU7CisgICAgcmV0dXJuIHMtPnJj
cjsKK30KKworc3RhdGljIGNvbnN0IE1lbW9yeVJlZ2lvbk9wcyBwaWl4NF9yY3Jfb3BzID0gewor
ICAgIC5yZWFkID0gcGlpeDRfcmNyX3JlYWQsCisgICAgLndyaXRlID0gcGlpeDRfcmNyX3dyaXRl
LAorICAgIC5lbmRpYW5uZXNzID0gREVWSUNFX0xJVFRMRV9FTkRJQU4sCisgICAgLmltcGwgPSB7
CisgICAgICAgIC5taW5fYWNjZXNzX3NpemUgPSAxLAorICAgICAgICAubWF4X2FjY2Vzc19zaXpl
ID0gMSwKKyAgICB9LAorfTsKKwogc3RhdGljIHZvaWQgcGlpeDRfcmVhbGl6ZShQQ0lEZXZpY2Ug
KnBjaV9kZXYsIEVycm9yICoqZXJycCkKIHsKICAgICBEZXZpY2VTdGF0ZSAqZGV2ID0gREVWSUNF
KHBjaV9kZXYpOwpAQCAtOTcsNiArMTMxLDEyIEBAIHN0YXRpYyB2b2lkIHBpaXg0X3JlYWxpemUo
UENJRGV2aWNlICpwY2lfZGV2LCBFcnJvciAqKmVycnApCiAgICAgICAgICAgICAgICAgICAgICBw
Y2lfYWRkcmVzc19zcGFjZV9pbyhwY2lfZGV2KSwgZXJycCkpIHsKICAgICAgICAgcmV0dXJuOwog
ICAgIH0KKworICAgIG1lbW9yeV9yZWdpb25faW5pdF9pbygmcy0+cmNyX21lbSwgT0JKRUNUKGRl
diksICZwaWl4NF9yY3Jfb3BzLCBzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAicmVzZXQt
Y29udHJvbCIsIDEpOworICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbl9vdmVybGFwKHBj
aV9hZGRyZXNzX3NwYWNlX2lvKHBjaV9kZXYpLCAweGNmOSwKKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAmcy0+cmNyX21lbSwgMSk7CisKICAgICBwaWl4NF9kZXYgPSBw
Y2lfZGV2OwogICAgIHFlbXVfcmVnaXN0ZXJfcmVzZXQocGlpeDRfcmVzZXQsIHMpOwogfQotLSAK
Mi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
