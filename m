Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995C4DC694
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:53:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSe5-0005xg-RC; Fri, 18 Oct 2019 13:50:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSe4-0005wa-LV
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:50:20 +0000
X-Inumbo-ID: 3920604c-f1ae-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3920604c-f1ae-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 13:50:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 69BB73175295;
 Fri, 18 Oct 2019 13:50:19 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C4C760BF1;
 Fri, 18 Oct 2019 13:50:02 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:46 +0200
Message-Id: <20191018134754.16362-13-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 18 Oct 2019 13:50:19 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 12/20] hw/i386: Remove obsolete
 LoadStateHandler::load_state_old handlers
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paul Durrant <paul@xen.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

VGhlc2UgZGV2aWNlcyBpbXBsZW1lbnRlZCB0aGVpciBsb2FkX3N0YXRlX29sZCgpIGhhbmRsZXIg
MTAgeWVhcnMKYWdvLCBwcmV2aW91cyB0byBRRU1VIHYwLjEyLgpTaW5jZSBjb21taXQgY2M0MjVi
NWRkZiByZW1vdmVkIHRoZSBwYy0wLjEwIGFuZCBwYy0wLjExIG1hY2hpbmVzLAp3ZSBjYW4gZHJv
cCB0aGlzIGNvZGUuCgpOb3RlOiB0aGUgbWlwc19yNGsgbWFjaGluZSBzdGFydGVkIHRvIHVzZSB0
aGUgaTgyNTQgZGV2aWNlIGp1c3QKYWZ0ZXIgUUVNVSB2MC41LjAsIGJ1dCB0aGUgTUlQUyBtYWNo
aW5lIHR5cGVzIGFyZSBub3QgdmVyc2lvbmVkLApzbyB0aGVyZSBpcyBubyBtaWdyYXRpb24gY29t
cGF0aWJpbGl0eSBpc3N1ZSByZW1vdmluZyB0aGlzIGhhbmRsZXIuCgpTdWdnZXN0ZWQtYnk6IFBl
dGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KUmV2aWV3ZWQtYnk6IEFsZWtz
YW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClNpZ25lZC1vZmYtYnk6IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9hY3BpL3Bp
aXg0LmMgICAgICAgICB8IDQwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogaHcv
aW50Yy9hcGljX2NvbW1vbi5jICAgfCA0OSAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogaHcvcGNpLWhvc3QvcGlpeC5jICAgICAgfCAyNSAtLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIGh3L3RpbWVyL2k4MjU0X2NvbW1vbi5jIHwgNDAgLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tCiA0IGZpbGVzIGNoYW5nZWQsIDE1NCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9ody9hY3BpL3BpaXg0LmMgYi9ody9hY3BpL3BpaXg0LmMKaW5kZXggMmVmZDE2MDViOC4u
OTNhZWMyZGQyYyAxMDA2NDQKLS0tIGEvaHcvYWNwaS9waWl4NC5jCisrKyBiL2h3L2FjcGkvcGlp
eDQuYwpAQCAtNDEsNyArNDEsNiBAQAogI2luY2x1ZGUgImh3L2FjcGkvbWVtb3J5X2hvdHBsdWcu
aCIKICNpbmNsdWRlICJody9hY3BpL2FjcGlfZGV2X2ludGVyZmFjZS5oIgogI2luY2x1ZGUgImh3
L3hlbi94ZW4uaCIKLSNpbmNsdWRlICJtaWdyYXRpb24vcWVtdS1maWxlLXR5cGVzLmgiCiAjaW5j
bHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIKICNpbmNsdWRlICJody9jb3JlL2NwdS5oIgogI2lu
Y2x1ZGUgInRyYWNlLmgiCkBAIC0yMDQsNDMgKzIwMyw2IEBAIHN0YXRpYyBjb25zdCBWTVN0YXRl
RGVzY3JpcHRpb24gdm1zdGF0ZV9wY2lfc3RhdHVzID0gewogICAgIH0KIH07CiAKLXN0YXRpYyBp
bnQgYWNwaV9sb2FkX29sZChRRU1VRmlsZSAqZiwgdm9pZCAqb3BhcXVlLCBpbnQgdmVyc2lvbl9p
ZCkKLXsKLSAgICBQSUlYNFBNU3RhdGUgKnMgPSBvcGFxdWU7Ci0gICAgaW50IHJldCwgaTsKLSAg
ICB1aW50MTZfdCB0ZW1wOwotCi0gICAgcmV0ID0gcGNpX2RldmljZV9sb2FkKFBDSV9ERVZJQ0Uo
cyksIGYpOwotICAgIGlmIChyZXQgPCAwKSB7Ci0gICAgICAgIHJldHVybiByZXQ7Ci0gICAgfQot
ICAgIHFlbXVfZ2V0X2JlMTZzKGYsICZzLT5hci5wbTEuZXZ0LnN0cyk7Ci0gICAgcWVtdV9nZXRf
YmUxNnMoZiwgJnMtPmFyLnBtMS5ldnQuZW4pOwotICAgIHFlbXVfZ2V0X2JlMTZzKGYsICZzLT5h
ci5wbTEuY250LmNudCk7Ci0KLSAgICByZXQgPSB2bXN0YXRlX2xvYWRfc3RhdGUoZiwgJnZtc3Rh
dGVfYXBtLCAmcy0+YXBtLCAxKTsKLSAgICBpZiAocmV0KSB7Ci0gICAgICAgIHJldHVybiByZXQ7
Ci0gICAgfQotCi0gICAgdGltZXJfZ2V0KGYsIHMtPmFyLnRtci50aW1lcik7Ci0gICAgcWVtdV9n
ZXRfc2JlNjRzKGYsICZzLT5hci50bXIub3ZlcmZsb3dfdGltZSk7Ci0KLSAgICBxZW11X2dldF9i
ZTE2cyhmLCAodWludDE2X3QgKilzLT5hci5ncGUuc3RzKTsKLSAgICBmb3IgKGkgPSAwOyBpIDwg
MzsgaSsrKSB7Ci0gICAgICAgIHFlbXVfZ2V0X2JlMTZzKGYsICZ0ZW1wKTsKLSAgICB9Ci0KLSAg
ICBxZW11X2dldF9iZTE2cyhmLCAodWludDE2X3QgKilzLT5hci5ncGUuZW4pOwotICAgIGZvciAo
aSA9IDA7IGkgPCAzOyBpKyspIHsKLSAgICAgICAgcWVtdV9nZXRfYmUxNnMoZiwgJnRlbXApOwot
ICAgIH0KLQotICAgIHJldCA9IHZtc3RhdGVfbG9hZF9zdGF0ZShmLCAmdm1zdGF0ZV9wY2lfc3Rh
dHVzLAotICAgICAgICAmcy0+YWNwaV9wY2lfaG90cGx1Zy5hY3BpX3BjaWhwX3BjaV9zdGF0dXNb
QUNQSV9QQ0lIUF9CU0VMX0RFRkFVTFRdLCAxKTsKLSAgICByZXR1cm4gcmV0OwotfQotCiBzdGF0
aWMgYm9vbCB2bXN0YXRlX3Rlc3RfdXNlX2FjcGlfcGNpX2hvdHBsdWcodm9pZCAqb3BhcXVlLCBp
bnQgdmVyc2lvbl9pZCkKIHsKICAgICBQSUlYNFBNU3RhdGUgKnMgPSBvcGFxdWU7CkBAIC0zMTIs
OCArMjc0LDYgQEAgc3RhdGljIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX2FjcGkg
PSB7CiAgICAgLm5hbWUgPSAicGlpeDRfcG0iLAogICAgIC52ZXJzaW9uX2lkID0gMywKICAgICAu
bWluaW11bV92ZXJzaW9uX2lkID0gMywKLSAgICAubWluaW11bV92ZXJzaW9uX2lkX29sZCA9IDEs
Ci0gICAgLmxvYWRfc3RhdGVfb2xkID0gYWNwaV9sb2FkX29sZCwKICAgICAucG9zdF9sb2FkID0g
dm1zdGF0ZV9hY3BpX3Bvc3RfbG9hZCwKICAgICAuZmllbGRzID0gKFZNU3RhdGVGaWVsZFtdKSB7
CiAgICAgICAgIFZNU1RBVEVfUENJX0RFVklDRShwYXJlbnRfb2JqLCBQSUlYNFBNU3RhdGUpLApk
aWZmIC0tZ2l0IGEvaHcvaW50Yy9hcGljX2NvbW1vbi5jIGIvaHcvaW50Yy9hcGljX2NvbW1vbi5j
CmluZGV4IGFhZmQ4ZTBlMzMuLjM3NWNiNmFiZTkgMTAwNjQ0Ci0tLSBhL2h3L2ludGMvYXBpY19j
b21tb24uYworKysgYi9ody9pbnRjL2FwaWNfY29tbW9uLmMKQEAgLTMxLDcgKzMxLDYgQEAKICNp
bmNsdWRlICJzeXNlbXUva3ZtLmgiCiAjaW5jbHVkZSAiaHcvcWRldi1wcm9wZXJ0aWVzLmgiCiAj
aW5jbHVkZSAiaHcvc3lzYnVzLmgiCi0jaW5jbHVkZSAibWlncmF0aW9uL3FlbXUtZmlsZS10eXBl
cy5oIgogI2luY2x1ZGUgIm1pZ3JhdGlvbi92bXN0YXRlLmgiCiAKIHN0YXRpYyBpbnQgYXBpY19p
cnFfZGVsaXZlcmVkOwpAQCAtMjYyLDUyICsyNjEsNiBAQCBzdGF0aWMgdm9pZCBhcGljX3Jlc2V0
X2NvbW1vbihEZXZpY2VTdGF0ZSAqZGV2KQogICAgIGFwaWNfaW5pdF9yZXNldChkZXYpOwogfQog
Ci0vKiBUaGlzIGZ1bmN0aW9uIGlzIG9ubHkgdXNlZCBmb3Igb2xkIHN0YXRlIHZlcnNpb24gMSBh
bmQgMiAqLwotc3RhdGljIGludCBhcGljX2xvYWRfb2xkKFFFTVVGaWxlICpmLCB2b2lkICpvcGFx
dWUsIGludCB2ZXJzaW9uX2lkKQotewotICAgIEFQSUNDb21tb25TdGF0ZSAqcyA9IG9wYXF1ZTsK
LSAgICBBUElDQ29tbW9uQ2xhc3MgKmluZm8gPSBBUElDX0NPTU1PTl9HRVRfQ0xBU1Mocyk7Ci0g
ICAgaW50IGk7Ci0KLSAgICBpZiAodmVyc2lvbl9pZCA+IDIpIHsKLSAgICAgICAgcmV0dXJuIC1F
SU5WQUw7Ci0gICAgfQotCi0gICAgLyogWFhYOiB3aGF0IGlmIHRoZSBiYXNlIGNoYW5nZXM/IChy
ZWdpc3RlcmVkIG1lbW9yeSByZWdpb25zKSAqLwotICAgIHFlbXVfZ2V0X2JlMzJzKGYsICZzLT5h
cGljYmFzZSk7Ci0gICAgcWVtdV9nZXRfOHMoZiwgJnMtPmlkKTsKLSAgICBxZW11X2dldF84cyhm
LCAmcy0+YXJiX2lkKTsKLSAgICBxZW11X2dldF84cyhmLCAmcy0+dHByKTsKLSAgICBxZW11X2dl
dF9iZTMycyhmLCAmcy0+c3B1cmlvdXNfdmVjKTsKLSAgICBxZW11X2dldF84cyhmLCAmcy0+bG9n
X2Rlc3QpOwotICAgIHFlbXVfZ2V0XzhzKGYsICZzLT5kZXN0X21vZGUpOwotICAgIGZvciAoaSA9
IDA7IGkgPCA4OyBpKyspIHsKLSAgICAgICAgcWVtdV9nZXRfYmUzMnMoZiwgJnMtPmlzcltpXSk7
Ci0gICAgICAgIHFlbXVfZ2V0X2JlMzJzKGYsICZzLT50bXJbaV0pOwotICAgICAgICBxZW11X2dl
dF9iZTMycyhmLCAmcy0+aXJyW2ldKTsKLSAgICB9Ci0gICAgZm9yIChpID0gMDsgaSA8IEFQSUNf
TFZUX05COyBpKyspIHsKLSAgICAgICAgcWVtdV9nZXRfYmUzMnMoZiwgJnMtPmx2dFtpXSk7Ci0g
ICAgfQotICAgIHFlbXVfZ2V0X2JlMzJzKGYsICZzLT5lc3IpOwotICAgIHFlbXVfZ2V0X2JlMzJz
KGYsICZzLT5pY3JbMF0pOwotICAgIHFlbXVfZ2V0X2JlMzJzKGYsICZzLT5pY3JbMV0pOwotICAg
IHFlbXVfZ2V0X2JlMzJzKGYsICZzLT5kaXZpZGVfY29uZik7Ci0gICAgcy0+Y291bnRfc2hpZnQg
PSBxZW11X2dldF9iZTMyKGYpOwotICAgIHFlbXVfZ2V0X2JlMzJzKGYsICZzLT5pbml0aWFsX2Nv
dW50KTsKLSAgICBzLT5pbml0aWFsX2NvdW50X2xvYWRfdGltZSA9IHFlbXVfZ2V0X2JlNjQoZik7
Ci0gICAgcy0+bmV4dF90aW1lID0gcWVtdV9nZXRfYmU2NChmKTsKLQotICAgIGlmICh2ZXJzaW9u
X2lkID49IDIpIHsKLSAgICAgICAgcy0+dGltZXJfZXhwaXJ5ID0gcWVtdV9nZXRfYmU2NChmKTsK
LSAgICB9Ci0KLSAgICBpZiAoaW5mby0+cG9zdF9sb2FkKSB7Ci0gICAgICAgIGluZm8tPnBvc3Rf
bG9hZChzKTsKLSAgICB9Ci0gICAgcmV0dXJuIDA7Ci19Ci0KIHN0YXRpYyBjb25zdCBWTVN0YXRl
RGVzY3JpcHRpb24gdm1zdGF0ZV9hcGljX2NvbW1vbjsKIAogc3RhdGljIHZvaWQgYXBpY19jb21t
b25fcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBFcnJvciAqKmVycnApCkBAIC00MDgsOCArMzYx
LDYgQEAgc3RhdGljIGNvbnN0IFZNU3RhdGVEZXNjcmlwdGlvbiB2bXN0YXRlX2FwaWNfY29tbW9u
ID0gewogICAgIC5uYW1lID0gImFwaWMiLAogICAgIC52ZXJzaW9uX2lkID0gMywKICAgICAubWlu
aW11bV92ZXJzaW9uX2lkID0gMywKLSAgICAubWluaW11bV92ZXJzaW9uX2lkX29sZCA9IDEsCi0g
ICAgLmxvYWRfc3RhdGVfb2xkID0gYXBpY19sb2FkX29sZCwKICAgICAucHJlX2xvYWQgPSBhcGlj
X3ByZV9sb2FkLAogICAgIC5wcmVfc2F2ZSA9IGFwaWNfZGlzcGF0Y2hfcHJlX3NhdmUsCiAgICAg
LnBvc3RfbG9hZCA9IGFwaWNfZGlzcGF0Y2hfcG9zdF9sb2FkLApkaWZmIC0tZ2l0IGEvaHcvcGNp
LWhvc3QvcGlpeC5jIGIvaHcvcGNpLWhvc3QvcGlpeC5jCmluZGV4IDEzNWM2NDU1MzUuLjJmNGNi
Y2JmZTkgMTAwNjQ0Ci0tLSBhL2h3L3BjaS1ob3N0L3BpaXguYworKysgYi9ody9wY2ktaG9zdC9w
aWl4LmMKQEAgLTMzLDcgKzMzLDYgQEAKICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCiAjaW5jbHVk
ZSAicWVtdS9yYW5nZS5oIgogI2luY2x1ZGUgImh3L3hlbi94ZW4uaCIKLSNpbmNsdWRlICJtaWdy
YXRpb24vcWVtdS1maWxlLXR5cGVzLmgiCiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIK
ICNpbmNsdWRlICJody9wY2ktaG9zdC9wYW0uaCIKICNpbmNsdWRlICJzeXNlbXUvcmVzZXQuaCIK
QEAgLTE3NCwyOCArMTczLDYgQEAgc3RhdGljIHZvaWQgaTQ0MGZ4X3dyaXRlX2NvbmZpZyhQQ0lE
ZXZpY2UgKmRldiwKICAgICB9CiB9CiAKLXN0YXRpYyBpbnQgaTQ0MGZ4X2xvYWRfb2xkKFFFTVVG
aWxlKiBmLCB2b2lkICpvcGFxdWUsIGludCB2ZXJzaW9uX2lkKQotewotICAgIFBDSUk0NDBGWFN0
YXRlICpkID0gb3BhcXVlOwotICAgIFBDSURldmljZSAqcGQgPSBQQ0lfREVWSUNFKGQpOwotICAg
IGludCByZXQsIGk7Ci0gICAgdWludDhfdCBzbW1fZW5hYmxlZDsKLQotICAgIHJldCA9IHBjaV9k
ZXZpY2VfbG9hZChwZCwgZik7Ci0gICAgaWYgKHJldCA8IDApCi0gICAgICAgIHJldHVybiByZXQ7
Ci0gICAgaTQ0MGZ4X3VwZGF0ZV9tZW1vcnlfbWFwcGluZ3MoZCk7Ci0gICAgcWVtdV9nZXRfOHMo
ZiwgJnNtbV9lbmFibGVkKTsKLQotICAgIGlmICh2ZXJzaW9uX2lkID09IDIpIHsKLSAgICAgICAg
Zm9yIChpID0gMDsgaSA8IFBJSVhfTlVNX1BJUlFTOyBpKyspIHsKLSAgICAgICAgICAgIHFlbXVf
Z2V0X2JlMzIoZik7IC8qIGR1bW15IGxvYWQgZm9yIGNvbXBhdGliaWxpdHkgKi8KLSAgICAgICAg
fQotICAgIH0KLQotICAgIHJldHVybiAwOwotfQotCiBzdGF0aWMgaW50IGk0NDBmeF9wb3N0X2xv
YWQodm9pZCAqb3BhcXVlLCBpbnQgdmVyc2lvbl9pZCkKIHsKICAgICBQQ0lJNDQwRlhTdGF0ZSAq
ZCA9IG9wYXF1ZTsKQEAgLTIwOCw4ICsxODUsNiBAQCBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2Ny
aXB0aW9uIHZtc3RhdGVfaTQ0MGZ4ID0gewogICAgIC5uYW1lID0gIkk0NDBGWCIsCiAgICAgLnZl
cnNpb25faWQgPSAzLAogICAgIC5taW5pbXVtX3ZlcnNpb25faWQgPSAzLAotICAgIC5taW5pbXVt
X3ZlcnNpb25faWRfb2xkID0gMSwKLSAgICAubG9hZF9zdGF0ZV9vbGQgPSBpNDQwZnhfbG9hZF9v
bGQsCiAgICAgLnBvc3RfbG9hZCA9IGk0NDBmeF9wb3N0X2xvYWQsCiAgICAgLmZpZWxkcyA9IChW
TVN0YXRlRmllbGRbXSkgewogICAgICAgICBWTVNUQVRFX1BDSV9ERVZJQ0UocGFyZW50X29iaiwg
UENJSTQ0MEZYU3RhdGUpLApkaWZmIC0tZ2l0IGEvaHcvdGltZXIvaTgyNTRfY29tbW9uLmMgYi9o
dy90aW1lci9pODI1NF9jb21tb24uYwppbmRleCA1N2JmMTBjYzk0Li4wNTA4NzViNDk3IDEwMDY0
NAotLS0gYS9ody90aW1lci9pODI1NF9jb21tb24uYworKysgYi9ody90aW1lci9pODI1NF9jb21t
b24uYwpAQCAtMjksNyArMjksNiBAQAogI2luY2x1ZGUgInFlbXUvdGltZXIuaCIKICNpbmNsdWRl
ICJody90aW1lci9pODI1NC5oIgogI2luY2x1ZGUgImh3L3RpbWVyL2k4MjU0X2ludGVybmFsLmgi
Ci0jaW5jbHVkZSAibWlncmF0aW9uL3FlbXUtZmlsZS10eXBlcy5oIgogI2luY2x1ZGUgIm1pZ3Jh
dGlvbi92bXN0YXRlLmgiCiAKIC8qIHZhbCBtdXN0IGJlIDAgb3IgMSAqLwpAQCAtMjAyLDQzICsy
MDEsNiBAQCBzdGF0aWMgY29uc3QgVk1TdGF0ZURlc2NyaXB0aW9uIHZtc3RhdGVfcGl0X2NoYW5u
ZWwgPSB7CiAgICAgfQogfTsKIAotc3RhdGljIGludCBwaXRfbG9hZF9vbGQoUUVNVUZpbGUgKmYs
IHZvaWQgKm9wYXF1ZSwgaW50IHZlcnNpb25faWQpCi17Ci0gICAgUElUQ29tbW9uU3RhdGUgKnBp
dCA9IG9wYXF1ZTsKLSAgICBQSVRDb21tb25DbGFzcyAqYyA9IFBJVF9DT01NT05fR0VUX0NMQVNT
KHBpdCk7Ci0gICAgUElUQ2hhbm5lbFN0YXRlICpzOwotICAgIGludCBpOwotCi0gICAgaWYgKHZl
cnNpb25faWQgIT0gMSkgewotICAgICAgICByZXR1cm4gLUVJTlZBTDsKLSAgICB9Ci0KLSAgICBm
b3IgKGkgPSAwOyBpIDwgMzsgaSsrKSB7Ci0gICAgICAgIHMgPSAmcGl0LT5jaGFubmVsc1tpXTsK
LSAgICAgICAgcy0+Y291bnQgPSBxZW11X2dldF9iZTMyKGYpOwotICAgICAgICBxZW11X2dldF9i
ZTE2cyhmLCAmcy0+bGF0Y2hlZF9jb3VudCk7Ci0gICAgICAgIHFlbXVfZ2V0XzhzKGYsICZzLT5j
b3VudF9sYXRjaGVkKTsKLSAgICAgICAgcWVtdV9nZXRfOHMoZiwgJnMtPnN0YXR1c19sYXRjaGVk
KTsKLSAgICAgICAgcWVtdV9nZXRfOHMoZiwgJnMtPnN0YXR1cyk7Ci0gICAgICAgIHFlbXVfZ2V0
XzhzKGYsICZzLT5yZWFkX3N0YXRlKTsKLSAgICAgICAgcWVtdV9nZXRfOHMoZiwgJnMtPndyaXRl
X3N0YXRlKTsKLSAgICAgICAgcWVtdV9nZXRfOHMoZiwgJnMtPndyaXRlX2xhdGNoKTsKLSAgICAg
ICAgcWVtdV9nZXRfOHMoZiwgJnMtPnJ3X21vZGUpOwotICAgICAgICBxZW11X2dldF84cyhmLCAm
cy0+bW9kZSk7Ci0gICAgICAgIHFlbXVfZ2V0XzhzKGYsICZzLT5iY2QpOwotICAgICAgICBxZW11
X2dldF84cyhmLCAmcy0+Z2F0ZSk7Ci0gICAgICAgIHMtPmNvdW50X2xvYWRfdGltZSA9IHFlbXVf
Z2V0X2JlNjQoZik7Ci0gICAgICAgIHMtPmlycV9kaXNhYmxlZCA9IDA7Ci0gICAgICAgIGlmIChp
ID09IDApIHsKLSAgICAgICAgICAgIHMtPm5leHRfdHJhbnNpdGlvbl90aW1lID0gcWVtdV9nZXRf
YmU2NChmKTsKLSAgICAgICAgfQotICAgIH0KLSAgICBpZiAoYy0+cG9zdF9sb2FkKSB7Ci0gICAg
ICAgIGMtPnBvc3RfbG9hZChwaXQpOwotICAgIH0KLSAgICByZXR1cm4gMDsKLX0KLQogc3RhdGlj
IGludCBwaXRfZGlzcGF0Y2hfcHJlX3NhdmUodm9pZCAqb3BhcXVlKQogewogICAgIFBJVENvbW1v
blN0YXRlICpzID0gb3BhcXVlOwpAQCAtMjY2LDggKzIyOCw2IEBAIHN0YXRpYyBjb25zdCBWTVN0
YXRlRGVzY3JpcHRpb24gdm1zdGF0ZV9waXRfY29tbW9uID0gewogICAgIC5uYW1lID0gImk4MjU0
IiwKICAgICAudmVyc2lvbl9pZCA9IDMsCiAgICAgLm1pbmltdW1fdmVyc2lvbl9pZCA9IDIsCi0g
ICAgLm1pbmltdW1fdmVyc2lvbl9pZF9vbGQgPSAxLAotICAgIC5sb2FkX3N0YXRlX29sZCA9IHBp
dF9sb2FkX29sZCwKICAgICAucHJlX3NhdmUgPSBwaXRfZGlzcGF0Y2hfcHJlX3NhdmUsCiAgICAg
LnBvc3RfbG9hZCA9IHBpdF9kaXNwYXRjaF9wb3N0X2xvYWQsCiAgICAgLmZpZWxkcyA9IChWTVN0
YXRlRmllbGRbXSkgewotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
