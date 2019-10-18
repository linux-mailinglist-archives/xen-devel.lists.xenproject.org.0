Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E475DDC69C
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:54:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLSeC-00060o-5X; Fri, 18 Oct 2019 13:50:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLSeA-0005zy-5m
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:50:26 +0000
X-Inumbo-ID: 3c750cac-f1ae-11e9-8aca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c750cac-f1ae-11e9-8aca-bc764e2007e4;
 Fri, 18 Oct 2019 13:50:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F15B518CB91A;
 Fri, 18 Oct 2019 13:50:24 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E7B3D60BF1;
 Fri, 18 Oct 2019 13:50:19 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:47 +0200
Message-Id: <20191018134754.16362-14-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 18 Oct 2019 13:50:25 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 13/20] hw/pci-host/piix: Extract
 piix3_create()
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

RXh0cmFjdCB0aGUgUElJWDMgY3JlYXRpb24gY29kZSBmcm9tIHRoZSBpNDQwZnhfaW5pdCgpIGZ1
bmN0aW9uLgoKUmV2aWV3ZWQtYnk6IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZl
Y29tcC5jb20+ClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRA
cmVkaGF0LmNvbT4KLS0tCiBody9wY2ktaG9zdC9waWl4LmMgfCA1MSArKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMzEgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaHcvcGNpLWhvc3QvcGlpeC5j
IGIvaHcvcGNpLWhvc3QvcGlpeC5jCmluZGV4IDJmNGNiY2JmZTkuLjMyOTI3MDNkZTcgMTAwNjQ0
Ci0tLSBhL2h3L3BjaS1ob3N0L3BpaXguYworKysgYi9ody9wY2ktaG9zdC9waWl4LmMKQEAgLTMz
MSw2ICszMzEsMzYgQEAgc3RhdGljIHZvaWQgaTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpkZXYs
IEVycm9yICoqZXJycCkKICAgICB9CiB9CiAKK3N0YXRpYyBQSUlYM1N0YXRlICpwaWl4M19jcmVh
dGUoUENJQnVzICpwY2lfYnVzLCBJU0FCdXMgKippc2FfYnVzKQoreworICAgIFBJSVgzU3RhdGUg
KnBpaXgzOworICAgIFBDSURldmljZSAqcGNpX2RldjsKKworICAgIC8qCisgICAgICogWGVuIHN1
cHBvcnRzIGFkZGl0aW9uYWwgaW50ZXJydXB0IHJvdXRlcyBmcm9tIHRoZSBQQ0kgZGV2aWNlcyB0
bworICAgICAqIHRoZSBJT0FQSUM6IHRoZSBmb3VyIHBpbnMgb2YgZWFjaCBQQ0kgZGV2aWNlIG9u
IHRoZSBidXMgYXJlIGFsc28KKyAgICAgKiBjb25uZWN0ZWQgdG8gdGhlIElPQVBJQyBkaXJlY3Rs
eS4KKyAgICAgKiBUaGVzZSBhZGRpdGlvbmFsIHJvdXRlcyBjYW4gYmUgZGlzY292ZXJlZCB0aHJv
dWdoIEFDUEkuCisgICAgICovCisgICAgaWYgKHhlbl9lbmFibGVkKCkpIHsKKyAgICAgICAgcGNp
X2RldiA9IHBjaV9jcmVhdGVfc2ltcGxlX211bHRpZnVuY3Rpb24ocGNpX2J1cywgLTEsIHRydWUs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRZUEVf
UElJWDNfWEVOX0RFVklDRSk7CisgICAgICAgIHBpaXgzID0gUElJWDNfUENJX0RFVklDRShwY2lf
ZGV2KTsKKyAgICAgICAgcGNpX2J1c19pcnFzKHBjaV9idXMsIHhlbl9waWl4M19zZXRfaXJxLCB4
ZW5fcGNpX3Nsb3RfZ2V0X3BpcnEsCisgICAgICAgICAgICAgICAgICAgICBwaWl4MywgWEVOX1BJ
SVhfTlVNX1BJUlFTKTsKKyAgICB9IGVsc2UgeworICAgICAgICBwY2lfZGV2ID0gcGNpX2NyZWF0
ZV9zaW1wbGVfbXVsdGlmdW5jdGlvbihwY2lfYnVzLCAtMSwgdHJ1ZSwKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVFlQRV9QSUlYM19ERVZJQ0UpOwor
ICAgICAgICBwaWl4MyA9IFBJSVgzX1BDSV9ERVZJQ0UocGNpX2Rldik7CisgICAgICAgIHBjaV9i
dXNfaXJxcyhwY2lfYnVzLCBwaWl4M19zZXRfaXJxLCBwY2lfc2xvdF9nZXRfcGlycSwKKyAgICAg
ICAgICAgICAgICAgICAgIHBpaXgzLCBQSUlYX05VTV9QSVJRUyk7CisgICAgICAgIHBjaV9idXNf
c2V0X3JvdXRlX2lycV9mbihwY2lfYnVzLCBwaWl4M19yb3V0ZV9pbnR4X3Bpbl90b19pcnEpOwor
ICAgIH0KKyAgICAqaXNhX2J1cyA9IElTQV9CVVMocWRldl9nZXRfY2hpbGRfYnVzKERFVklDRShw
aWl4MyksICJpc2EuMCIpKTsKKworICAgIHJldHVybiBwaWl4MzsKK30KKwogUENJQnVzICppNDQw
ZnhfaW5pdChjb25zdCBjaGFyICpob3N0X3R5cGUsIGNvbnN0IGNoYXIgKnBjaV90eXBlLAogICAg
ICAgICAgICAgICAgICAgICBQQ0lJNDQwRlhTdGF0ZSAqKnBpNDQwZnhfc3RhdGUsCiAgICAgICAg
ICAgICAgICAgICAgIGludCAqcGlpeDNfZGV2Zm4sCkBAIC00MDAsMjcgKzQzMCw4IEBAIFBDSUJ1
cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBlLCBjb25zdCBjaGFyICpwY2lfdHlw
ZSwKICAgICAgICAgICAgICAgICAgUEFNX0VYUEFOX1NJWkUpOwogICAgIH0KIAotICAgIC8qIFhl
biBzdXBwb3J0cyBhZGRpdGlvbmFsIGludGVycnVwdCByb3V0ZXMgZnJvbSB0aGUgUENJIGRldmlj
ZXMgdG8KLSAgICAgKiB0aGUgSU9BUElDOiB0aGUgZm91ciBwaW5zIG9mIGVhY2ggUENJIGRldmlj
ZSBvbiB0aGUgYnVzIGFyZSBhbHNvCi0gICAgICogY29ubmVjdGVkIHRvIHRoZSBJT0FQSUMgZGly
ZWN0bHkuCi0gICAgICogVGhlc2UgYWRkaXRpb25hbCByb3V0ZXMgY2FuIGJlIGRpc2NvdmVyZWQg
dGhyb3VnaCBBQ1BJLiAqLwotICAgIGlmICh4ZW5fZW5hYmxlZCgpKSB7Ci0gICAgICAgIFBDSURl
dmljZSAqcGNpX2RldiA9IHBjaV9jcmVhdGVfc2ltcGxlX211bHRpZnVuY3Rpb24oYiwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLTEsIHRydWUsIFRZUEVfUElJWDNfWEVOX0RFVklDRSk7
Ci0gICAgICAgIHBpaXgzID0gUElJWDNfUENJX0RFVklDRShwY2lfZGV2KTsKLSAgICAgICAgcGNp
X2J1c19pcnFzKGIsIHhlbl9waWl4M19zZXRfaXJxLCB4ZW5fcGNpX3Nsb3RfZ2V0X3BpcnEsCi0g
ICAgICAgICAgICAgICAgcGlpeDMsIFhFTl9QSUlYX05VTV9QSVJRUyk7Ci0gICAgfSBlbHNlIHsK
LSAgICAgICAgUENJRGV2aWNlICpwY2lfZGV2ID0gcGNpX2NyZWF0ZV9zaW1wbGVfbXVsdGlmdW5j
dGlvbihiLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtMSwgdHJ1ZSwgVFlQRV9QSUlY
M19ERVZJQ0UpOwotICAgICAgICBwaWl4MyA9IFBJSVgzX1BDSV9ERVZJQ0UocGNpX2Rldik7Ci0g
ICAgICAgIHBjaV9idXNfaXJxcyhiLCBwaWl4M19zZXRfaXJxLCBwY2lfc2xvdF9nZXRfcGlycSwg
cGlpeDMsCi0gICAgICAgICAgICAgICAgUElJWF9OVU1fUElSUVMpOwotICAgICAgICBwY2lfYnVz
X3NldF9yb3V0ZV9pcnFfZm4oYiwgcGlpeDNfcm91dGVfaW50eF9waW5fdG9faXJxKTsKLSAgICB9
CisgICAgcGlpeDMgPSBwaWl4M19jcmVhdGUoYiwgaXNhX2J1cyk7CiAgICAgcGlpeDMtPnBpYyA9
IHBpYzsKLSAgICAqaXNhX2J1cyA9IElTQV9CVVMocWRldl9nZXRfY2hpbGRfYnVzKERFVklDRShw
aWl4MyksICJpc2EuMCIpKTsKLQogICAgICpwaWl4M19kZXZmbiA9IHBpaXgzLT5kZXYuZGV2Zm47
CiAKICAgICByYW1fc2l6ZSA9IHJhbV9zaXplIC8gOCAvIDEwMjQgLyAxMDI0OwotLSAKMi4yMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
