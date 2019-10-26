Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DAFE5E7B
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:07:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQQl-000683-35; Sat, 26 Oct 2019 18:04:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQQj-00067N-Fe
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:04:49 +0000
X-Inumbo-ID: 17490a32-f81b-11e9-94d7-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [207.211.31.81])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 17490a32-f81b-11e9-94d7-12813bfff9fa;
 Sat, 26 Oct 2019 18:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T2dLm2Xz1fiqAxTYOSPP2mDkuhzEl+Dho4NsPEDSoi8=;
 b=e3K20mIpScMZpQQgImxzUR3u+/qIdt0q/HDNDd+5HrurKWTvo6+TB/PAkMEZsQxWN8NlHR
 vhbM3Z7GULSKomOObq4Q7+BGCW92jbwu7+PL17bQycwESl3dESXIsO16v75jyfab1by3os
 Wmg34FK4xGYQN9EIi/tvA5pmS0VFzqY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-qWviySrFN8a-Vf41-bibzQ-1; Sat, 26 Oct 2019 14:04:26 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60CB0800D41;
 Sat, 26 Oct 2019 18:04:25 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AB6B60F82;
 Sat, 26 Oct 2019 18:04:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:37 +0200
Message-Id: <20191026180143.7369-15-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: qWviySrFN8a-Vf41-bibzQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 14/20] hw/pci-host/piix: Move RCR_IOPORT
 register definition
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

RnJvbTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPGY0YnVnQGFtc2F0Lm9yZz4KClRoZSBSQ1Jf
SU9QT1JUIHJlZ2lzdGVyIGJlbG9uZ3MgdG8gdGhlIFBJSVggY2hpcHNldC4KTW92ZSB0aGUgZGVm
aW5pdGlvbiB0byAicGlpeC5oIiwgYW5kIHByZXBlbmQgdGhlIFBJSVggcHJlZml4LgoKUmV2aWV3
ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0t
CnYyOiBwcmVwZW5kIFBJSVggcHJlZml4IChBbGVrc2FuZGFyKQotLS0KIGh3L2kzODYvYWNwaS1i
dWlsZC5jICAgICAgICAgIHwgMiArLQogaHcvaXNhL3BpaXg0LmMgICAgICAgICAgICAgICAgfCAy
ICstCiBody9wY2ktaG9zdC9waWl4LmMgICAgICAgICAgICB8IDcgKysrKy0tLQogaW5jbHVkZS9o
dy9pMzg2L3BjLmggICAgICAgICAgfCA2IC0tLS0tLQogaW5jbHVkZS9ody9zb3V0aGJyaWRnZS9w
aWl4LmggfCA2ICsrKysrKwogNSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxMSBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9pMzg2L2FjcGktYnVpbGQuYyBiL2h3L2kzODYv
YWNwaS1idWlsZC5jCmluZGV4IGIxYjA1MGQ4ZTIuLjI2NmQ5YjUzNGIgMTAwNjQ0Ci0tLSBhL2h3
L2kzODYvYWNwaS1idWlsZC5jCisrKyBiL2h3L2kzODYvYWNwaS1idWlsZC5jCkBAIC0yMDksNyAr
MjA5LDcgQEAgc3RhdGljIHZvaWQgYWNwaV9nZXRfcG1faW5mbyhNYWNoaW5lU3RhdGUgKm1hY2hp
bmUsIEFjcGlQbUluZm8gKnBtKQogCiAgICAgLyogVGhlIGFib3ZlIG5lZWQgbm90IGJlIGNvbmRp
dGlvbmFsIG9uIG1hY2hpbmUgdHlwZSBiZWNhdXNlIHRoZSByZXNldCBwb3J0CiAgICAgICogaGFw
cGVucyB0byBiZSB0aGUgc2FtZSBvbiBQSUlYIChwYykgYW5kIElDSDkgKHEzNSkuICovCi0gICAg
UUVNVV9CVUlMRF9CVUdfT04oSUNIOV9SU1RfQ05UX0lPUE9SVCAhPSBSQ1JfSU9QT1JUKTsKKyAg
ICBRRU1VX0JVSUxEX0JVR19PTihJQ0g5X1JTVF9DTlRfSU9QT1JUICE9IFBJSVhfUkNSX0lPUE9S
VCk7CiAKICAgICAvKiBGaWxsIGluIG9wdGlvbmFsIHMzL3M0IHJlbGF0ZWQgcHJvcGVydGllcyAq
LwogICAgIG8gPSBvYmplY3RfcHJvcGVydHlfZ2V0X3FvYmplY3Qob2JqLCBBQ1BJX1BNX1BST1Bf
UzNfRElTQUJMRUQsIE5VTEwpOwpkaWZmIC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2Ev
cGlpeDQuYwppbmRleCBmM2UyMWVhNzZkLi44NjY3OGU2ODI5IDEwMDY0NAotLS0gYS9ody9pc2Ev
cGlpeDQuYworKysgYi9ody9pc2EvcGlpeDQuYwpAQCAtMTY2LDcgKzE2Niw3IEBAIHN0YXRpYyB2
b2lkIHBpaXg0X3JlYWxpemUoUENJRGV2aWNlICpkZXYsIEVycm9yICoqZXJycCkKICAgICBtZW1v
cnlfcmVnaW9uX2luaXRfaW8oJnMtPnJjcl9tZW0sIE9CSkVDVChkZXYpLCAmcGlpeDRfcmNyX29w
cywgcywKICAgICAgICAgICAgICAgICAgICAgICAgICAgInJlc2V0LWNvbnRyb2wiLCAxKTsKICAg
ICBtZW1vcnlfcmVnaW9uX2FkZF9zdWJyZWdpb25fb3ZlcmxhcChwY2lfYWRkcmVzc19zcGFjZV9p
byhkZXYpLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFJDUl9JT1BP
UlQsICZzLT5yY3JfbWVtLCAxKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBQSUlYX1JDUl9JT1BPUlQsICZzLT5yY3JfbWVtLCAxKTsKIAogICAgIC8qIGluaXRpYWxp
emUgaTgyNTkgcGljICovCiAgICAgaTgyNTlfb3V0X2lycSA9IHFlbXVfYWxsb2NhdGVfaXJxcyhw
aWl4NF9yZXF1ZXN0X2k4MjU5X2lycSwgcywgMSk7CmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9w
aWl4LmMgYi9ody9wY2ktaG9zdC9waWl4LmMKaW5kZXggMzI5MjcwM2RlNy4uNjU0OGQ5YTRiNSAx
MDA2NDQKLS0tIGEvaHcvcGNpLWhvc3QvcGlpeC5jCisrKyBiL2h3L3BjaS1ob3N0L3BpaXguYwpA
QCAtMjcsNiArMjcsNyBAQAogI2luY2x1ZGUgImh3L2lycS5oIgogI2luY2x1ZGUgImh3L3BjaS9w
Y2kuaCIKICNpbmNsdWRlICJody9wY2kvcGNpX2hvc3QuaCIKKyNpbmNsdWRlICJody9zb3V0aGJy
aWRnZS9waWl4LmgiCiAjaW5jbHVkZSAiaHcvcWRldi1wcm9wZXJ0aWVzLmgiCiAjaW5jbHVkZSAi
aHcvaXNhL2lzYS5oIgogI2luY2x1ZGUgImh3L3N5c2J1cy5oIgpAQCAtODcsNyArODgsNyBAQCB0
eXBlZGVmIHN0cnVjdCBQSUlYM1N0YXRlIHsKICAgICAvKiBSZXNldCBDb250cm9sIFJlZ2lzdGVy
IGNvbnRlbnRzICovCiAgICAgdWludDhfdCByY3I7CiAKLSAgICAvKiBJTyBtZW1vcnkgcmVnaW9u
IGZvciBSZXNldCBDb250cm9sIFJlZ2lzdGVyIChSQ1JfSU9QT1JUKSAqLworICAgIC8qIElPIG1l
bW9yeSByZWdpb24gZm9yIFJlc2V0IENvbnRyb2wgUmVnaXN0ZXIgKFBJSVhfUkNSX0lPUE9SVCkg
Ki8KICAgICBNZW1vcnlSZWdpb24gcmNyX21lbTsKIH0gUElJWDNTdGF0ZTsKIApAQCAtNjk1LDgg
KzY5Niw4IEBAIHN0YXRpYyB2b2lkIHBpaXgzX3JlYWxpemUoUENJRGV2aWNlICpkZXYsIEVycm9y
ICoqZXJycCkKIAogICAgIG1lbW9yeV9yZWdpb25faW5pdF9pbygmZC0+cmNyX21lbSwgT0JKRUNU
KGRldiksICZyY3Jfb3BzLCBkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAicGlpeDMtcmVz
ZXQtY29udHJvbCIsIDEpOwotICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbl9vdmVybGFw
KHBjaV9hZGRyZXNzX3NwYWNlX2lvKGRldiksIFJDUl9JT1BPUlQsCi0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgJmQtPnJjcl9tZW0sIDEpOworICAgIG1lbW9yeV9yZWdp
b25fYWRkX3N1YnJlZ2lvbl9vdmVybGFwKHBjaV9hZGRyZXNzX3NwYWNlX2lvKGRldiksCisgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUElJWF9SQ1JfSU9QT1JULCAmZC0+
cmNyX21lbSwgMSk7CiAKICAgICBxZW11X3JlZ2lzdGVyX3Jlc2V0KHBpaXgzX3Jlc2V0LCBkKTsK
IH0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvaTM4Ni9wYy5oIGIvaW5jbHVkZS9ody9pMzg2L3Bj
LmgKaW5kZXggMmZkNDBjZWViZS4uZDZmZjk1ZTA0NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9ody9p
Mzg2L3BjLmgKKysrIGIvaW5jbHVkZS9ody9pMzg2L3BjLmgKQEAgLTI0MCwxMiArMjQwLDYgQEAg
dHlwZWRlZiBzdHJ1Y3QgUENJSTQ0MEZYU3RhdGUgUENJSTQ0MEZYU3RhdGU7CiAKICNkZWZpbmUg
VFlQRV9JR0RfUEFTU1RIUk9VR0hfSTQ0MEZYX1BDSV9ERVZJQ0UgImlnZC1wYXNzdGhyb3VnaC1p
NDQwRlgiCiAKLS8qCi0gKiBSZXNldCBDb250cm9sIFJlZ2lzdGVyOiBQQ0ktYWNjZXNzaWJsZSBJ
U0EtQ29tcGF0aWJsZSBSZWdpc3RlciBhdCBhZGRyZXNzCi0gKiAweGNmOSwgcHJvdmlkZWQgYnkg
dGhlIFBDSS9JU0EgYnJpZGdlIChQSUlYMyBQQ0kgZnVuY3Rpb24gMCwgODA4Njo3MDAwKS4KLSAq
LwotI2RlZmluZSBSQ1JfSU9QT1JUIDB4Y2Y5Ci0KIFBDSUJ1cyAqaTQ0MGZ4X2luaXQoY29uc3Qg
Y2hhciAqaG9zdF90eXBlLCBjb25zdCBjaGFyICpwY2lfdHlwZSwKICAgICAgICAgICAgICAgICAg
ICAgUENJSTQ0MEZYU3RhdGUgKipwaTQ0MGZ4X3N0YXRlLCBpbnQgKnBpaXhfZGV2Zm4sCiAgICAg
ICAgICAgICAgICAgICAgIElTQUJ1cyAqKmlzYV9idXMsIHFlbXVfaXJxICpwaWMsCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2h3L3NvdXRoYnJpZGdlL3BpaXguaCBiL2luY2x1ZGUvaHcvc291dGhicmlk
Z2UvcGlpeC5oCmluZGV4IGFkZDM1MjQ1NmIuLmU0OWQ0YTZiYmUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvaHcvc291dGhicmlkZ2UvcGlpeC5oCisrKyBiL2luY2x1ZGUvaHcvc291dGhicmlkZ2UvcGlp
eC5oCkBAIC0xOCw2ICsxOCwxMiBAQCBJMkNCdXMgKnBpaXg0X3BtX2luaXQoUENJQnVzICpidXMs
IGludCBkZXZmbiwgdWludDMyX3Qgc21iX2lvX2Jhc2UsCiAgICAgICAgICAgICAgICAgICAgICAg
cWVtdV9pcnEgc2NpX2lycSwgcWVtdV9pcnEgc21pX2lycSwKICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgc21tX2VuYWJsZWQsIERldmljZVN0YXRlICoqcGlpeDRfcG0pOwogCisvKgorICogUmVz
ZXQgQ29udHJvbCBSZWdpc3RlcjogUENJLWFjY2Vzc2libGUgSVNBLUNvbXBhdGlibGUgUmVnaXN0
ZXIgYXQgYWRkcmVzcworICogMHhjZjksIHByb3ZpZGVkIGJ5IHRoZSBQQ0kvSVNBIGJyaWRnZSAo
UElJWDMgUENJIGZ1bmN0aW9uIDAsIDgwODY6NzAwMCkuCisgKi8KKyNkZWZpbmUgUElJWF9SQ1Jf
SU9QT1JUIDB4Y2Y5CisKIGV4dGVybiBQQ0lEZXZpY2UgKnBpaXg0X2RldjsKIAogRGV2aWNlU3Rh
dGUgKnBpaXg0X2NyZWF0ZShQQ0lCdXMgKnBjaV9idXMsIElTQUJ1cyAqKmlzYV9idXMsCi0tIAoy
LjIxLjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
