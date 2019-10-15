Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC004D7B9C
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:31:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPgi-0003Ji-93; Tue, 15 Oct 2019 16:28:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPgg-0003J8-KM
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:28:42 +0000
X-Inumbo-ID: d9bb7750-ef68-11e9-9396-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d9bb7750-ef68-11e9-9396-12813bfff9fa;
 Tue, 15 Oct 2019 16:28:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9115A20FF;
 Tue, 15 Oct 2019 16:28:41 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5778C19C69;
 Tue, 15 Oct 2019 16:28:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:39 +0200
Message-Id: <20191015162705.28087-7-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 15 Oct 2019 16:28:41 +0000 (UTC)
Subject: [Xen-devel] [PATCH 06/32] mc146818rtc: always register rtc to rtc
 list
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKV2UgYXJlIG5v
dCByZXF1aXJlZCBhbnltb3JlIHRvIHVzZSBydGNfaW5pdCgpIGZ1bmN0aW9uLgoKQWNrZWQtYnk6
IE1pY2hhZWwgUy4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+CkFja2VkLWJ5OiBQYW9sbyBCb256
aW5pIDxwYm9uemluaUByZWRoYXQuY29tPgpTaWduZWQtb2ZmLWJ5OiBIZXJ2w6kgUG91c3NpbmVh
dSA8aHBvdXNzaW5AcmVhY3Rvcy5vcmc+Ck1lc3NhZ2UtSWQ6IDwyMDE3MTIxNjA5MDIyOC4yODUw
NS01LWhwb3Vzc2luQHJlYWN0b3Mub3JnPgpbUE1EOiByZWJhc2VkLCBmaXggT0JKRUNUKCkgdmFs
dWVdClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0
LmNvbT4KLS0tCiBody90aW1lci9tYzE0NjgxOHJ0Yy5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody90
aW1lci9tYzE0NjgxOHJ0Yy5jIGIvaHcvdGltZXIvbWMxNDY4MThydGMuYwppbmRleCAwYzA0Yjc0
YzJlLi44ZjdkM2E5Y2RmIDEwMDY0NAotLS0gYS9ody90aW1lci9tYzE0NjgxOHJ0Yy5jCisrKyBi
L2h3L3RpbWVyL21jMTQ2ODE4cnRjLmMKQEAgLTk2MywxNyArOTYzLDE2IEBAIHN0YXRpYyB2b2lk
IHJ0Y19yZWFsaXplZm4oRGV2aWNlU3RhdGUgKmRldiwgRXJyb3IgKiplcnJwKQogICAgIG9iamVj
dF9wcm9wZXJ0eV9hZGRfdG0oT0JKRUNUKHMpLCAiZGF0ZSIsIHJ0Y19nZXRfZGF0ZSwgTlVMTCk7
CiAKICAgICBxZGV2X2luaXRfZ3Bpb19vdXQoZGV2LCAmcy0+aXJxLCAxKTsKKyAgICBRTElTVF9J
TlNFUlRfSEVBRCgmcnRjX2RldmljZXMsIHMsIGxpbmspOwogfQogCiBJU0FEZXZpY2UgKm1jMTQ2
ODE4X3J0Y19pbml0KElTQUJ1cyAqYnVzLCBpbnQgYmFzZV95ZWFyLCBxZW11X2lycSBpbnRlcmNl
cHRfaXJxKQogewogICAgIERldmljZVN0YXRlICpkZXY7CiAgICAgSVNBRGV2aWNlICppc2FkZXY7
Ci0gICAgUlRDU3RhdGUgKnM7CiAKICAgICBpc2FkZXYgPSBpc2FfY3JlYXRlKGJ1cywgVFlQRV9N
QzE0NjgxOF9SVEMpOwogICAgIGRldiA9IERFVklDRShpc2FkZXYpOwotICAgIHMgPSBNQzE0Njgx
OF9SVEMoaXNhZGV2KTsKICAgICBxZGV2X3Byb3Bfc2V0X2ludDMyKGRldiwgImJhc2VfeWVhciIs
IGJhc2VfeWVhcik7CiAgICAgcWRldl9pbml0X25vZmFpbChkZXYpOwogICAgIGlmIChpbnRlcmNl
cHRfaXJxKSB7CkBAIC05ODEsOSArOTgwLDggQEAgSVNBRGV2aWNlICptYzE0NjgxOF9ydGNfaW5p
dChJU0FCdXMgKmJ1cywgaW50IGJhc2VfeWVhciwgcWVtdV9pcnEgaW50ZXJjZXB0X2lycSkKICAg
ICB9IGVsc2UgewogICAgICAgICBpc2FfY29ubmVjdF9ncGlvX291dChpc2FkZXYsIDAsIFJUQ19J
U0FfSVJRKTsKICAgICB9Ci0gICAgUUxJU1RfSU5TRVJUX0hFQUQoJnJ0Y19kZXZpY2VzLCBzLCBs
aW5rKTsKIAotICAgIG9iamVjdF9wcm9wZXJ0eV9hZGRfYWxpYXMocWRldl9nZXRfbWFjaGluZSgp
LCAicnRjLXRpbWUiLCBPQkpFQ1QocyksCisgICAgb2JqZWN0X3Byb3BlcnR5X2FkZF9hbGlhcyhx
ZGV2X2dldF9tYWNoaW5lKCksICJydGMtdGltZSIsIE9CSkVDVChpc2FkZXYpLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgImRhdGUiLCBOVUxMKTsKIAogICAgIHJldHVybiBpc2FkZXY7
CkBAIC0xMDE1LDggKzEwMTMsNiBAQCBzdGF0aWMgdm9pZCBydGNfY2xhc3NfaW5pdGZuKE9iamVj
dENsYXNzICprbGFzcywgdm9pZCAqZGF0YSkKICAgICBkYy0+cmVzZXQgPSBydGNfcmVzZXRkZXY7
CiAgICAgZGMtPnZtc2QgPSAmdm1zdGF0ZV9ydGM7CiAgICAgZGMtPnByb3BzID0gbWMxNDY4MThy
dGNfcHJvcGVydGllczsKLSAgICAvKiBSZWFzb246IG5lZWRzIHRvIGJlIHdpcmVkIHVwIGJ5IHJ0
Y19pbml0KCkgKi8KLSAgICBkYy0+dXNlcl9jcmVhdGFibGUgPSBmYWxzZTsKIH0KIAogc3RhdGlj
IGNvbnN0IFR5cGVJbmZvIG1jMTQ2ODE4cnRjX2luZm8gPSB7Ci0tIAoyLjIxLjAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
