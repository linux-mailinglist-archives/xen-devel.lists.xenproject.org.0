Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C40E5E68
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQPb-0005UI-CL; Sat, 26 Oct 2019 18:03:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQPa-0005To-73
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:03:38 +0000
X-Inumbo-ID: ee95a60f-f81a-11e9-94d7-12813bfff9fa
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.61])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id ee95a60f-f81a-11e9-94d7-12813bfff9fa;
 Sat, 26 Oct 2019 18:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XYh96A3bk8WETk3dsp7XF9lSfVDIViqRJLr20zg03RA=;
 b=f+DCAWbFU0YBY/1ryH+S9QE9atiQIn53bolhYHhtbxnB++EHUsmzIQVtexhDkQCa/DmTA9
 rZn23FbxsyZ1xD/Su0IgKn75PC4nDkxfCZZljeumZJkJ0MXrcTZlWTudqCSt9c21DG25j1
 FH7I/5PISVfvEVV2Ge4C8ldntJliEgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-04pa6g25PVmIWihwN2uAeA-1; Sat, 26 Oct 2019 14:03:32 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 536C7100550E;
 Sat, 26 Oct 2019 18:03:30 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9557D60F82;
 Sat, 26 Oct 2019 18:03:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:31 +0200
Message-Id: <20191026180143.7369-9-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 04pa6g25PVmIWihwN2uAeA-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 08/20] piix4: Add a MC146818 RTC Controller
 as specified in datasheet
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClJlbW92ZSBt
YzE0NjgxOHJ0YyBpbnN0YW5jaWF0ZWQgaW4gbWFsdGEgYm9hcmQsIHRvIG5vdCBoYXZlIGl0IHR3
aWNlLgoKQWNrZWQtYnk6IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CkFja2Vk
LWJ5OiBQYW9sbyBCb256aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBI
ZXJ2w6kgUG91c3NpbmVhdSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDE3
MTIxNjA5MDIyOC4yODUwNS0xMy1ocG91c3NpbkByZWFjdG9zLm9yZz4KW1BNRDogcmViYXNlZCwg
c2V0IFJUQyBiYXNlX3llYXIgdG8gMjAwMF0KUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292
aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhp
ZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBNQUlOVEFJTkVSUyAgICAgICAgICAg
ICAgICAgICB8ICAzICsrLQogaHcvYWNwaS9waWl4NC5jICAgICAgICAgICAgICAgfCAgMiArLQog
aHcvaTM4Ni9hY3BpLWJ1aWxkLmMgICAgICAgICAgfCAgMyArLS0KIGh3L2kzODYvcGNfcGlpeC5j
ICAgICAgICAgICAgIHwgIDEgKwogaHcvaXNhL3BpaXg0LmMgICAgICAgICAgICAgICAgfCAyMiAr
KysrKysrKysrKysrKysrKysrKysrCiBody9taXBzL21pcHNfbWFsdGEuYyAgICAgICAgICB8ICA0
ICstLS0KIGluY2x1ZGUvaHcvYWNwaS9waWl4NC5oICAgICAgIHwgIDYgLS0tLS0tCiBpbmNsdWRl
L2h3L2kzODYvcGMuaCAgICAgICAgICB8ICA2IC0tLS0tLQogaW5jbHVkZS9ody9zb3V0aGJyaWRn
ZS9waWl4LmggfCAyMCArKysrKysrKysrKysrKysrKysrKwogOSBmaWxlcyBjaGFuZ2VkLCA0OCBp
bnNlcnRpb25zKCspLCAxOSBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBpbmNsdWRl
L2h3L2FjcGkvcGlpeDQuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvaHcvc291dGhicmlk
Z2UvcGlpeC5oCgpkaWZmIC0tZ2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUwppbmRleCAx
ZjA0NTAyZmFjLi45MGM1ZWNlMDRiIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlO
VEFJTkVSUwpAQCAtMTIzNSw3ICsxMjM1LDcgQEAgRjogaHcvaTJjL3NtYnVzX2ljaDkuYwogRjog
aHcvYWNwaS9waWl4NC5jCiBGOiBody9hY3BpL2ljaDkuYwogRjogaW5jbHVkZS9ody9hY3BpL2lj
aDkuaAotRjogaW5jbHVkZS9ody9hY3BpL3BpaXg0LmgKK0Y6IGluY2x1ZGUvaHcvc291dGhicmlk
Z2UvcGlpeC5oCiBGOiBody9taXNjL3NnYS5jCiBGOiBody9pc2EvYXBtLmMKIEY6IGluY2x1ZGUv
aHcvaXNhL2FwbS5oCkBAIC0xNzM0LDYgKzE3MzQsNyBAQCBNOiBIZXJ2w6kgUG91c3NpbmVhdSA8
aHBvdXNzaW5AcmVhY3Rvcy5vcmc+CiBNOiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8ZjRidWdA
YW1zYXQub3JnPgogUzogTWFpbnRhaW5lZAogRjogaHcvaXNhL3BpaXg0LmMKK0Y6IGluY2x1ZGUv
aHcvc291dGhicmlkZ2UvcGlpeC5oCiAKIEZpcm13YXJlIGNvbmZpZ3VyYXRpb24gKGZ3X2NmZykK
IE06IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KZGlmZiAtLWdp
dCBhL2h3L2FjcGkvcGlpeDQuYyBiL2h3L2FjcGkvcGlpeDQuYwppbmRleCA0ZTA3OWIzOWJkLi4y
ZWZkMTYwNWI4IDEwMDY0NAotLS0gYS9ody9hY3BpL3BpaXg0LmMKKysrIGIvaHcvYWNwaS9waWl4
NC5jCkBAIC0yMSw2ICsyMSw3IEBACiAKICNpbmNsdWRlICJxZW11L29zZGVwLmgiCiAjaW5jbHVk
ZSAiaHcvaTM4Ni9wYy5oIgorI2luY2x1ZGUgImh3L3NvdXRoYnJpZGdlL3BpaXguaCIKICNpbmNs
dWRlICJody9pcnEuaCIKICNpbmNsdWRlICJody9pc2EvYXBtLmgiCiAjaW5jbHVkZSAiaHcvaTJj
L3BtX3NtYnVzLmgiCkBAIC0zMiw3ICszMyw2IEBACiAjaW5jbHVkZSAicWFwaS9lcnJvci5oIgog
I2luY2x1ZGUgInFlbXUvcmFuZ2UuaCIKICNpbmNsdWRlICJleGVjL2FkZHJlc3Mtc3BhY2VzLmgi
Ci0jaW5jbHVkZSAiaHcvYWNwaS9waWl4NC5oIgogI2luY2x1ZGUgImh3L2FjcGkvcGNpaHAuaCIK
ICNpbmNsdWRlICJody9hY3BpL2NwdV9ob3RwbHVnLmgiCiAjaW5jbHVkZSAiaHcvYWNwaS9jcHUu
aCIKZGlmZiAtLWdpdCBhL2h3L2kzODYvYWNwaS1idWlsZC5jIGIvaHcvaTM4Ni9hY3BpLWJ1aWxk
LmMKaW5kZXggOWRkM2RiYjE2Yy4uYjFiMDUwZDhlMiAxMDA2NDQKLS0tIGEvaHcvaTM4Ni9hY3Bp
LWJ1aWxkLmMKKysrIGIvaHcvaTM4Ni9hY3BpLWJ1aWxkLmMKQEAgLTM0LDcgKzM0LDYgQEAKICNp
bmNsdWRlICJody9hY3BpL2FjcGktZGVmcy5oIgogI2luY2x1ZGUgImh3L2FjcGkvYWNwaS5oIgog
I2luY2x1ZGUgImh3L2FjcGkvY3B1LmgiCi0jaW5jbHVkZSAiaHcvYWNwaS9waWl4NC5oIgogI2lu
Y2x1ZGUgImh3L252cmFtL2Z3X2NmZy5oIgogI2luY2x1ZGUgImh3L2FjcGkvYmlvcy1saW5rZXIt
bG9hZGVyLmgiCiAjaW5jbHVkZSAiaHcvaXNhL2lzYS5oIgpAQCAtNTIsNyArNTEsNyBAQAogI2lu
Y2x1ZGUgInN5c2VtdS9yZXNldC5oIgogCiAvKiBTdXBwb3J0ZWQgY2hpcHNldHM6ICovCi0jaW5j
bHVkZSAiaHcvYWNwaS9waWl4NC5oIgorI2luY2x1ZGUgImh3L3NvdXRoYnJpZGdlL3BpaXguaCIK
ICNpbmNsdWRlICJody9hY3BpL3BjaWhwLmgiCiAjaW5jbHVkZSAiaHcvaTM4Ni9pY2g5LmgiCiAj
aW5jbHVkZSAiaHcvcGNpL3BjaV9idXMuaCIKZGlmZiAtLWdpdCBhL2h3L2kzODYvcGNfcGlpeC5j
IGIvaHcvaTM4Ni9wY19waWl4LmMKaW5kZXggYzE1OTI5YTFmNS4uYTk2ZWRlMTliMiAxMDA2NDQK
LS0tIGEvaHcvaTM4Ni9wY19waWl4LmMKKysrIGIvaHcvaTM4Ni9wY19waWl4LmMKQEAgLTMwLDYg
KzMwLDcgQEAKICNpbmNsdWRlICJody9pMzg2L3g4Ni5oIgogI2luY2x1ZGUgImh3L2kzODYvcGMu
aCIKICNpbmNsdWRlICJody9pMzg2L2FwaWMuaCIKKyNpbmNsdWRlICJody9zb3V0aGJyaWRnZS9w
aWl4LmgiCiAjaW5jbHVkZSAiaHcvZGlzcGxheS9yYW1mYi5oIgogI2luY2x1ZGUgImh3L2Zpcm13
YXJlL3NtYmlvcy5oIgogI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKZGlmZiAtLWdpdCBhL2h3L2lz
YS9waWl4NC5jIGIvaHcvaXNhL3BpaXg0LmMKaW5kZXggYzA3YTFlMTRhOC4uNmJmNmYwYzVkOSAx
MDA2NDQKLS0tIGEvaHcvaXNhL3BpaXg0LmMKKysrIGIvaHcvaXNhL3BpaXg0LmMKQEAgLTI0LDYg
KzI0LDcgQEAKICAqLwogCiAjaW5jbHVkZSAicWVtdS9vc2RlcC5oIgorI2luY2x1ZGUgInFhcGkv
ZXJyb3IuaCIKICNpbmNsdWRlICJody9pcnEuaCIKICNpbmNsdWRlICJody9pMzg2L3BjLmgiCiAj
aW5jbHVkZSAiaHcvcGNpL3BjaS5oIgpAQCAtMzEsNiArMzIsNyBAQAogI2luY2x1ZGUgImh3L3N5
c2J1cy5oIgogI2luY2x1ZGUgImh3L2RtYS9pODI1Ny5oIgogI2luY2x1ZGUgImh3L3RpbWVyL2k4
MjU0LmgiCisjaW5jbHVkZSAiaHcvcnRjL21jMTQ2ODE4cnRjLmgiCiAjaW5jbHVkZSAibWlncmF0
aW9uL3Ztc3RhdGUuaCIKICNpbmNsdWRlICJzeXNlbXUvcmVzZXQuaCIKICNpbmNsdWRlICJzeXNl
bXUvcnVuc3RhdGUuaCIKQEAgLTQyLDYgKzQ0LDcgQEAgdHlwZWRlZiBzdHJ1Y3QgUElJWDRTdGF0
ZSB7CiAgICAgcWVtdV9pcnEgY3B1X2ludHI7CiAgICAgcWVtdV9pcnEgKmlzYTsKIAorICAgIFJU
Q1N0YXRlIHJ0YzsKICAgICAvKiBSZXNldCBDb250cm9sIFJlZ2lzdGVyICovCiAgICAgTWVtb3J5
UmVnaW9uIHJjcl9tZW07CiAgICAgdWludDhfdCByY3I7CkBAIC0xNDUsNiArMTQ4LDcgQEAgc3Rh
dGljIHZvaWQgcGlpeDRfcmVhbGl6ZShQQ0lEZXZpY2UgKmRldiwgRXJyb3IgKiplcnJwKQogICAg
IFBJSVg0U3RhdGUgKnMgPSBQSUlYNF9QQ0lfREVWSUNFKGRldik7CiAgICAgSVNBQnVzICppc2Ff
YnVzOwogICAgIHFlbXVfaXJxICppODI1OV9vdXRfaXJxOworICAgIEVycm9yICplcnIgPSBOVUxM
OwogCiAgICAgaXNhX2J1cyA9IGlzYV9idXNfbmV3KERFVklDRShkZXYpLCBwY2lfYWRkcmVzc19z
cGFjZShkZXYpLAogICAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfYWRkcmVzc19zcGFjZV9p
byhkZXYpLCBlcnJwKTsKQEAgLTE3NSw5ICsxNzksMjYgQEAgc3RhdGljIHZvaWQgcGlpeDRfcmVh
bGl6ZShQQ0lEZXZpY2UgKmRldiwgRXJyb3IgKiplcnJwKQogICAgIC8qIERNQSAqLwogICAgIGk4
MjU3X2RtYV9pbml0KGlzYV9idXMsIDApOwogCisgICAgLyogUlRDICovCisgICAgcWRldl9zZXRf
cGFyZW50X2J1cyhERVZJQ0UoJnMtPnJ0YyksIEJVUyhpc2FfYnVzKSk7CisgICAgcWRldl9wcm9w
X3NldF9pbnQzMihERVZJQ0UoJnMtPnJ0YyksICJiYXNlX3llYXIiLCAyMDAwKTsKKyAgICBvYmpl
Y3RfcHJvcGVydHlfc2V0X2Jvb2woT0JKRUNUKCZzLT5ydGMpLCB0cnVlLCAicmVhbGl6ZWQiLCAm
ZXJyKTsKKyAgICBpZiAoZXJyKSB7CisgICAgICAgIGVycm9yX3Byb3BhZ2F0ZShlcnJwLCBlcnIp
OworICAgICAgICByZXR1cm47CisgICAgfQorICAgIGlzYV9pbml0X2lycShJU0FfREVWSUNFKCZz
LT5ydGMpLCAmcy0+cnRjLmlycSwgUlRDX0lTQV9JUlEpOworCiAgICAgcGlpeDRfZGV2ID0gZGV2
OwogfQogCitzdGF0aWMgdm9pZCBwaWl4NF9pbml0KE9iamVjdCAqb2JqKQoreworICAgIFBJSVg0
U3RhdGUgKnMgPSBQSUlYNF9QQ0lfREVWSUNFKG9iaik7CisKKyAgICBvYmplY3RfaW5pdGlhbGl6
ZSgmcy0+cnRjLCBzaXplb2Yocy0+cnRjKSwgVFlQRV9NQzE0NjgxOF9SVEMpOworfQorCiBzdGF0
aWMgdm9pZCBwaWl4NF9jbGFzc19pbml0KE9iamVjdENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkK
IHsKICAgICBEZXZpY2VDbGFzcyAqZGMgPSBERVZJQ0VfQ0xBU1Moa2xhc3MpOwpAQCAtMjAyLDYg
KzIyMyw3IEBAIHN0YXRpYyBjb25zdCBUeXBlSW5mbyBwaWl4NF9pbmZvID0gewogICAgIC5uYW1l
ICAgICAgICAgID0gVFlQRV9QSUlYNF9QQ0lfREVWSUNFLAogICAgIC5wYXJlbnQgICAgICAgID0g
VFlQRV9QQ0lfREVWSUNFLAogICAgIC5pbnN0YW5jZV9zaXplID0gc2l6ZW9mKFBJSVg0U3RhdGUp
LAorICAgIC5pbnN0YW5jZV9pbml0ID0gcGlpeDRfaW5pdCwKICAgICAuY2xhc3NfaW5pdCAgICA9
IHBpaXg0X2NsYXNzX2luaXQsCiAgICAgLmludGVyZmFjZXMgPSAoSW50ZXJmYWNlSW5mb1tdKSB7
CiAgICAgICAgIHsgSU5URVJGQUNFX0NPTlZFTlRJT05BTF9QQ0lfREVWSUNFIH0sCmRpZmYgLS1n
aXQgYS9ody9taXBzL21pcHNfbWFsdGEuYyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCmluZGV4IDlh
ZjQ4NmM3N2MuLjY0NWMyMjNlZGIgMTAwNjQ0Ci0tLSBhL2h3L21pcHMvbWlwc19tYWx0YS5jCisr
KyBiL2h3L21pcHMvbWlwc19tYWx0YS5jCkBAIC0yNiw3ICsyNiw3IEBACiAjaW5jbHVkZSAicWVt
dS91bml0cy5oIgogI2luY2x1ZGUgInFlbXUtY29tbW9uLmgiCiAjaW5jbHVkZSAiY3B1LmgiCi0j
aW5jbHVkZSAiaHcvaTM4Ni9wYy5oIgorI2luY2x1ZGUgImh3L3NvdXRoYnJpZGdlL3BpaXguaCIK
ICNpbmNsdWRlICJody9pc2Evc3VwZXJpby5oIgogI2luY2x1ZGUgImh3L2NoYXIvc2VyaWFsLmgi
CiAjaW5jbHVkZSAibmV0L25ldC5oIgpAQCAtNDQsNyArNDQsNiBAQAogI2luY2x1ZGUgImh3L2ly
cS5oIgogI2luY2x1ZGUgImh3L2xvYWRlci5oIgogI2luY2x1ZGUgImVsZi5oIgotI2luY2x1ZGUg
Imh3L3J0Yy9tYzE0NjgxOHJ0Yy5oIgogI2luY2x1ZGUgImV4ZWMvYWRkcmVzcy1zcGFjZXMuaCIK
ICNpbmNsdWRlICJody9zeXNidXMuaCIgICAgICAgICAgICAgLyogU3lzQnVzRGV2aWNlICovCiAj
aW5jbHVkZSAicWVtdS9ob3N0LXV0aWxzLmgiCkBAIC0xNDI1LDcgKzE0MjQsNiBAQCB2b2lkIG1p
cHNfbWFsdGFfaW5pdChNYWNoaW5lU3RhdGUgKm1hY2hpbmUpCiAgICAgcGNpX2NyZWF0ZV9zaW1w
bGUocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAyLCAicGlpeDQtdXNiLXVoY2kiKTsKICAgICBzbWJ1
cyA9IHBpaXg0X3BtX2luaXQocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAzLCAweDExMDAsCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGlzYV9nZXRfaXJxKE5VTEwsIDkpLCBOVUxMLCAwLCBOVUxM
KTsKLSAgICBtYzE0NjgxOF9ydGNfaW5pdChpc2FfYnVzLCAyMDAwLCBOVUxMKTsKIAogICAgIC8q
IGdlbmVyYXRlIFNQRCBFRVBST00gZGF0YSAqLwogICAgIGdlbmVyYXRlX2VlcHJvbV9zcGQoJnNt
YnVzX2VlcHJvbV9idWZbMCAqIDI1Nl0sIHJhbV9zaXplKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
aHcvYWNwaS9waWl4NC5oIGIvaW5jbHVkZS9ody9hY3BpL3BpaXg0LmgKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IDAyOGJiNTNlM2QuLjAwMDAwMDAwMDAKLS0tIGEvaW5jbHVkZS9ody9h
Y3BpL3BpaXg0LmgKKysrIC9kZXYvbnVsbApAQCAtMSw2ICswLDAgQEAKLSNpZm5kZWYgSFdfQUNQ
SV9QSUlYNF9ICi0jZGVmaW5lIEhXX0FDUElfUElJWDRfSAotCi0jZGVmaW5lIFRZUEVfUElJWDRf
UE0gIlBJSVg0X1BNIgotCi0jZW5kaWYKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5o
IGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKaW5kZXggZjU1M2IyOTY1Mi4uYzkzM2MwZDNhMSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9ody9pMzg2L3BjLmgKKysrIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgK
QEAgLTIyOCwxMiArMjI4LDYgQEAgaW50IGNtb3NfZ2V0X2ZkX2RyaXZlX3R5cGUoRmxvcHB5RHJp
dmVUeXBlIGZkMCk7CiAKICNkZWZpbmUgUE9SVDkyX0EyMF9MSU5FICJhMjAiCiAKLS8qIGFjcGlf
cGlpeC5jICovCi0KLUkyQ0J1cyAqcGlpeDRfcG1faW5pdChQQ0lCdXMgKmJ1cywgaW50IGRldmZu
LCB1aW50MzJfdCBzbWJfaW9fYmFzZSwKLSAgICAgICAgICAgICAgICAgICAgICBxZW11X2lycSBz
Y2lfaXJxLCBxZW11X2lycSBzbWlfaXJxLAotICAgICAgICAgICAgICAgICAgICAgIGludCBzbW1f
ZW5hYmxlZCwgRGV2aWNlU3RhdGUgKipwaWl4NF9wbSk7Ci0KIC8qIGhwZXQuYyAqLwogZXh0ZXJu
IGludCBub19ocGV0OwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2h3L3NvdXRoYnJpZGdlL3BpaXgu
aCBiL2luY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oCm5ldyBmaWxlIG1vZGUgMTAwNjQ0Cmlu
ZGV4IDAwMDAwMDAwMDAuLmI4Y2UyNmZlYzQKLS0tIC9kZXYvbnVsbAorKysgYi9pbmNsdWRlL2h3
L3NvdXRoYnJpZGdlL3BpaXguaApAQCAtMCwwICsxLDIwIEBACisvKgorICogUUVNVSBQSUlYIFNv
dXRoIEJyaWRnZSBFbXVsYXRpb24KKyAqCisgKiBDb3B5cmlnaHQgKGMpIDIwMDYgRmFicmljZSBC
ZWxsYXJkCisgKgorICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJtcyBvZiB0
aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxhdGVyLgorICogU2VlIHRoZSBDT1BZSU5HIGZpbGUg
aW4gdGhlIHRvcC1sZXZlbCBkaXJlY3RvcnkuCisgKgorICovCisKKyNpZm5kZWYgSFdfU09VVEhC
UklER0VfUElJWF9ICisjZGVmaW5lIEhXX1NPVVRIQlJJREdFX1BJSVhfSAorCisjZGVmaW5lIFRZ
UEVfUElJWDRfUE0gIlBJSVg0X1BNIgorCitJMkNCdXMgKnBpaXg0X3BtX2luaXQoUENJQnVzICpi
dXMsIGludCBkZXZmbiwgdWludDMyX3Qgc21iX2lvX2Jhc2UsCisgICAgICAgICAgICAgICAgICAg
ICAgcWVtdV9pcnEgc2NpX2lycSwgcWVtdV9pcnEgc21pX2lycSwKKyAgICAgICAgICAgICAgICAg
ICAgICBpbnQgc21tX2VuYWJsZWQsIERldmljZVN0YXRlICoqcGlpeDRfcG0pOworCisjZW5kaWYK
LS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
