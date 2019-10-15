Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE81D7BC6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 18:34:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKPkB-0005n9-3q; Tue, 15 Oct 2019 16:32:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=cnbq=YI=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iKPk9-0005mm-TJ
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 16:32:17 +0000
X-Inumbo-ID: 59bec57e-ef69-11e9-a531-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59bec57e-ef69-11e9-a531-bc764e2007e4;
 Tue, 15 Oct 2019 16:32:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6BBA61DA2;
 Tue, 15 Oct 2019 16:32:16 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0250A19C58;
 Tue, 15 Oct 2019 16:31:59 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2019 18:26:58 +0200
Message-Id: <20191015162705.28087-26-philmd@redhat.com>
In-Reply-To: <20191015162705.28087-1-philmd@redhat.com>
References: <20191015162705.28087-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 15 Oct 2019 16:32:16 +0000 (UTC)
Subject: [Xen-devel] [PATCH 25/32] hw/pci-host/piix: Extract piix3_create()
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

RXh0cmFjdCB0aGUgUElJWDMgY3JlYXRpb24gY29kZSBmcm9tIHRoZSBpNDQwZnhfaW5pdCgpIGZ1
bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBy
ZWRoYXQuY29tPgotLS0KIGh3L3BjaS1ob3N0L3BpaXguYyB8IDUxICsrKysrKysrKysrKysrKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9waWl4LmMg
Yi9ody9wY2ktaG9zdC9waWl4LmMKaW5kZXggMmY0Y2JjYmZlOS4uMzI5MjcwM2RlNyAxMDA2NDQK
LS0tIGEvaHcvcGNpLWhvc3QvcGlpeC5jCisrKyBiL2h3L3BjaS1ob3N0L3BpaXguYwpAQCAtMzMx
LDYgKzMzMSwzNiBAQCBzdGF0aWMgdm9pZCBpNDQwZnhfcmVhbGl6ZShQQ0lEZXZpY2UgKmRldiwg
RXJyb3IgKiplcnJwKQogICAgIH0KIH0KIAorc3RhdGljIFBJSVgzU3RhdGUgKnBpaXgzX2NyZWF0
ZShQQ0lCdXMgKnBjaV9idXMsIElTQUJ1cyAqKmlzYV9idXMpCit7CisgICAgUElJWDNTdGF0ZSAq
cGlpeDM7CisgICAgUENJRGV2aWNlICpwY2lfZGV2OworCisgICAgLyoKKyAgICAgKiBYZW4gc3Vw
cG9ydHMgYWRkaXRpb25hbCBpbnRlcnJ1cHQgcm91dGVzIGZyb20gdGhlIFBDSSBkZXZpY2VzIHRv
CisgICAgICogdGhlIElPQVBJQzogdGhlIGZvdXIgcGlucyBvZiBlYWNoIFBDSSBkZXZpY2Ugb24g
dGhlIGJ1cyBhcmUgYWxzbworICAgICAqIGNvbm5lY3RlZCB0byB0aGUgSU9BUElDIGRpcmVjdGx5
LgorICAgICAqIFRoZXNlIGFkZGl0aW9uYWwgcm91dGVzIGNhbiBiZSBkaXNjb3ZlcmVkIHRocm91
Z2ggQUNQSS4KKyAgICAgKi8KKyAgICBpZiAoeGVuX2VuYWJsZWQoKSkgeworICAgICAgICBwY2lf
ZGV2ID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihwY2lfYnVzLCAtMSwgdHJ1ZSwK
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRV9Q
SUlYM19YRU5fREVWSUNFKTsKKyAgICAgICAgcGlpeDMgPSBQSUlYM19QQ0lfREVWSUNFKHBjaV9k
ZXYpOworICAgICAgICBwY2lfYnVzX2lycXMocGNpX2J1cywgeGVuX3BpaXgzX3NldF9pcnEsIHhl
bl9wY2lfc2xvdF9nZXRfcGlycSwKKyAgICAgICAgICAgICAgICAgICAgIHBpaXgzLCBYRU5fUElJ
WF9OVU1fUElSUVMpOworICAgIH0gZWxzZSB7CisgICAgICAgIHBjaV9kZXYgPSBwY2lfY3JlYXRl
X3NpbXBsZV9tdWx0aWZ1bmN0aW9uKHBjaV9idXMsIC0xLCB0cnVlLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBUWVBFX1BJSVgzX0RFVklDRSk7Cisg
ICAgICAgIHBpaXgzID0gUElJWDNfUENJX0RFVklDRShwY2lfZGV2KTsKKyAgICAgICAgcGNpX2J1
c19pcnFzKHBjaV9idXMsIHBpaXgzX3NldF9pcnEsIHBjaV9zbG90X2dldF9waXJxLAorICAgICAg
ICAgICAgICAgICAgICAgcGlpeDMsIFBJSVhfTlVNX1BJUlFTKTsKKyAgICAgICAgcGNpX2J1c19z
ZXRfcm91dGVfaXJxX2ZuKHBjaV9idXMsIHBpaXgzX3JvdXRlX2ludHhfcGluX3RvX2lycSk7Cisg
ICAgfQorICAgICppc2FfYnVzID0gSVNBX0JVUyhxZGV2X2dldF9jaGlsZF9idXMoREVWSUNFKHBp
aXgzKSwgImlzYS4wIikpOworCisgICAgcmV0dXJuIHBpaXgzOworfQorCiBQQ0lCdXMgKmk0NDBm
eF9pbml0KGNvbnN0IGNoYXIgKmhvc3RfdHlwZSwgY29uc3QgY2hhciAqcGNpX3R5cGUsCiAgICAg
ICAgICAgICAgICAgICAgIFBDSUk0NDBGWFN0YXRlICoqcGk0NDBmeF9zdGF0ZSwKICAgICAgICAg
ICAgICAgICAgICAgaW50ICpwaWl4M19kZXZmbiwKQEAgLTQwMCwyNyArNDMwLDggQEAgUENJQnVz
ICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0X3R5cGUsIGNvbnN0IGNoYXIgKnBjaV90eXBl
LAogICAgICAgICAgICAgICAgICBQQU1fRVhQQU5fU0laRSk7CiAgICAgfQogCi0gICAgLyogWGVu
IHN1cHBvcnRzIGFkZGl0aW9uYWwgaW50ZXJydXB0IHJvdXRlcyBmcm9tIHRoZSBQQ0kgZGV2aWNl
cyB0bwotICAgICAqIHRoZSBJT0FQSUM6IHRoZSBmb3VyIHBpbnMgb2YgZWFjaCBQQ0kgZGV2aWNl
IG9uIHRoZSBidXMgYXJlIGFsc28KLSAgICAgKiBjb25uZWN0ZWQgdG8gdGhlIElPQVBJQyBkaXJl
Y3RseS4KLSAgICAgKiBUaGVzZSBhZGRpdGlvbmFsIHJvdXRlcyBjYW4gYmUgZGlzY292ZXJlZCB0
aHJvdWdoIEFDUEkuICovCi0gICAgaWYgKHhlbl9lbmFibGVkKCkpIHsKLSAgICAgICAgUENJRGV2
aWNlICpwY2lfZGV2ID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihiLAotICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAtMSwgdHJ1ZSwgVFlQRV9QSUlYM19YRU5fREVWSUNFKTsK
LSAgICAgICAgcGlpeDMgPSBQSUlYM19QQ0lfREVWSUNFKHBjaV9kZXYpOwotICAgICAgICBwY2lf
YnVzX2lycXMoYiwgeGVuX3BpaXgzX3NldF9pcnEsIHhlbl9wY2lfc2xvdF9nZXRfcGlycSwKLSAg
ICAgICAgICAgICAgICBwaWl4MywgWEVOX1BJSVhfTlVNX1BJUlFTKTsKLSAgICB9IGVsc2Ugewot
ICAgICAgICBQQ0lEZXZpY2UgKnBjaV9kZXYgPSBwY2lfY3JlYXRlX3NpbXBsZV9tdWx0aWZ1bmN0
aW9uKGIsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0xLCB0cnVlLCBUWVBFX1BJSVgz
X0RFVklDRSk7Ci0gICAgICAgIHBpaXgzID0gUElJWDNfUENJX0RFVklDRShwY2lfZGV2KTsKLSAg
ICAgICAgcGNpX2J1c19pcnFzKGIsIHBpaXgzX3NldF9pcnEsIHBjaV9zbG90X2dldF9waXJxLCBw
aWl4MywKLSAgICAgICAgICAgICAgICBQSUlYX05VTV9QSVJRUyk7Ci0gICAgICAgIHBjaV9idXNf
c2V0X3JvdXRlX2lycV9mbihiLCBwaWl4M19yb3V0ZV9pbnR4X3Bpbl90b19pcnEpOwotICAgIH0K
KyAgICBwaWl4MyA9IHBpaXgzX2NyZWF0ZShiLCBpc2FfYnVzKTsKICAgICBwaWl4My0+cGljID0g
cGljOwotICAgICppc2FfYnVzID0gSVNBX0JVUyhxZGV2X2dldF9jaGlsZF9idXMoREVWSUNFKHBp
aXgzKSwgImlzYS4wIikpOwotCiAgICAgKnBpaXgzX2RldmZuID0gcGlpeDMtPmRldi5kZXZmbjsK
IAogICAgIHJhbV9zaXplID0gcmFtX3NpemUgLyA4IC8gMTAyNCAvIDEwMjQ7Ci0tIAoyLjIxLjAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
