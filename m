Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2BE5E79
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:07:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQRc-0006hF-0q; Sat, 26 Oct 2019 18:05:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQRZ-0006g5-O5
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:05:41 +0000
X-Inumbo-ID: 36d646a8-f81b-11e9-8aca-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [205.139.110.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 36d646a8-f81b-11e9-8aca-bc764e2007e4;
 Sat, 26 Oct 2019 18:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572113137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WQsFUyLAwDljpdipMYVdl0GqrBsJ3XrvhlsEYkdcey4=;
 b=gjvbuaCvY68k0tG73B0o8YxEku85CRaX2rxLRRszoqJFdMA/p64FAhoML6qsVHXDOGJTy4
 n0W+IbwOyY3BHc8Keh/4+zZImBbDnCkjrOHJK5w6sUqHO9xuh67meCOsGCH3cIVcfGyFfF
 s+Q39GGO9MzBHyKREKN3jx5OOol4GFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-DrSHE9VQP-SzjnH1n34PiQ-1; Sat, 26 Oct 2019 14:05:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C37B71800E00;
 Sat, 26 Oct 2019 18:05:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A27A60C83;
 Sat, 26 Oct 2019 18:05:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:43 +0200
Message-Id: <20191026180143.7369-21-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: DrSHE9VQP-SzjnH1n34PiQ-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 20/20] hw/pci-host/i440fx: Remove the last
 PIIX3 traces
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

VGhlIFBJSVgzIGlzIG5vdCB0aWVkIHRvIHRoZSBpNDQwRlggYW5kIGNhbiBldmVuIGJlIHVzZWQg
d2l0aG91dCBpdC4KTW92ZSBpdHMgY3JlYXRpb24gdG8gdGhlIG1hY2hpbmUgY29kZSAocGNfcGlp
eC5jKS4KV2UgaGF2ZSBub3cgcmVtb3ZlZCB0aGUgbGFzdCB0cmFjZSBvZiBzb3V0aGJyaWRnZSBj
b2RlIGluIHRoZSBpNDQwRlgKbm9ydGhicmlkZ2UuCgpSZXZpZXdlZC1ieTogQWxla3NhbmRhciBN
YXJrb3ZpYyA8YW1hcmtvdmljQHdhdmVjb21wLmNvbT4KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUg
TWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2kzODYvcGNfcGlpeC5j
ICAgICAgICAgICAgfCA4ICsrKysrKystCiBody9wY2ktaG9zdC9pNDQwZnguYyAgICAgICAgIHwg
OCAtLS0tLS0tLQogaW5jbHVkZS9ody9wY2ktaG9zdC9pNDQwZnguaCB8IDMgKy0tCiAzIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
aHcvaTM4Ni9wY19waWl4LmMgYi9ody9pMzg2L3BjX3BpaXguYwppbmRleCBiYTM1ZDU2ODVlLi4y
YWVmYTNiOGRmIDEwMDY0NAotLS0gYS9ody9pMzg2L3BjX3BpaXguYworKysgYi9ody9pMzg2L3Bj
X3BpaXguYwpAQCAtMTkyLDE0ICsxOTIsMjAgQEAgc3RhdGljIHZvaWQgcGNfaW5pdDEoTWFjaGlu
ZVN0YXRlICptYWNoaW5lLAogICAgIGdzaV9zdGF0ZSA9IHBjX2dzaV9jcmVhdGUoJng4Nm1zLT5n
c2ksIHBjbWMtPnBjaV9lbmFibGVkKTsKIAogICAgIGlmIChwY21jLT5wY2lfZW5hYmxlZCkgewor
ICAgICAgICBQSUlYM1N0YXRlICpwaWl4MzsKKwogICAgICAgICBwY2lfYnVzID0gaTQ0MGZ4X2lu
aXQoaG9zdF90eXBlLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGNpX3R5cGUsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmaTQ0MGZ4X3N0YXRlLCAmcGlpeDNfZGV2Zm4s
ICZpc2FfYnVzLCB4ODZtcy0+Z3NpLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJmk0
NDBmeF9zdGF0ZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN5c3RlbV9tZW1vcnks
IHN5c3RlbV9pbywgbWFjaGluZS0+cmFtX3NpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB4ODZtcy0+YmVsb3dfNGdfbWVtX3NpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB4ODZtcy0+YWJvdmVfNGdfbWVtX3NpemUsCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwY2lfbWVtb3J5LCByYW1fbWVtb3J5KTsKICAgICAgICAgcGNtcy0+YnVzID0gcGNpX2J1
czsKKworICAgICAgICBwaWl4MyA9IHBpaXgzX2NyZWF0ZShwY2lfYnVzLCAmaXNhX2J1cyk7Cisg
ICAgICAgIHBpaXgzLT5waWMgPSB4ODZtcy0+Z3NpOworICAgICAgICBwaWl4M19kZXZmbiA9IHBp
aXgzLT5kZXYuZGV2Zm47CiAgICAgfSBlbHNlIHsKICAgICAgICAgcGNpX2J1cyA9IE5VTEw7CiAg
ICAgICAgIGk0NDBmeF9zdGF0ZSA9IE5VTEw7CmRpZmYgLS1naXQgYS9ody9wY2ktaG9zdC9pNDQw
ZnguYyBiL2h3L3BjaS1ob3N0L2k0NDBmeC5jCmluZGV4IDc5ZWNkNThhMmIuLmYyNzEzMTEwMmQg
MTAwNjQ0Ci0tLSBhL2h3L3BjaS1ob3N0L2k0NDBmeC5jCisrKyBiL2h3L3BjaS1ob3N0L2k0NDBm
eC5jCkBAIC0yNyw3ICsyNyw2IEBACiAjaW5jbHVkZSAiaHcvcGNpL3BjaS5oIgogI2luY2x1ZGUg
Imh3L3BjaS9wY2lfaG9zdC5oIgogI2luY2x1ZGUgImh3L3BjaS1ob3N0L2k0NDBmeC5oIgotI2lu
Y2x1ZGUgImh3L3NvdXRoYnJpZGdlL3BpaXguaCIKICNpbmNsdWRlICJody9xZGV2LXByb3BlcnRp
ZXMuaCIKICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJxYXBpL2Vycm9yLmgiCkBA
IC0yNzIsOCArMjcxLDYgQEAgc3RhdGljIHZvaWQgaTQ0MGZ4X3JlYWxpemUoUENJRGV2aWNlICpk
ZXYsIEVycm9yICoqZXJycCkKIAogUENJQnVzICppNDQwZnhfaW5pdChjb25zdCBjaGFyICpob3N0
X3R5cGUsIGNvbnN0IGNoYXIgKnBjaV90eXBlLAogICAgICAgICAgICAgICAgICAgICBQQ0lJNDQw
RlhTdGF0ZSAqKnBpNDQwZnhfc3RhdGUsCi0gICAgICAgICAgICAgICAgICAgIGludCAqcGlpeDNf
ZGV2Zm4sCi0gICAgICAgICAgICAgICAgICAgIElTQUJ1cyAqKmlzYV9idXMsIHFlbXVfaXJxICpw
aWMsCiAgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19zcGFjZV9tZW0s
CiAgICAgICAgICAgICAgICAgICAgIE1lbW9yeVJlZ2lvbiAqYWRkcmVzc19zcGFjZV9pbywKICAg
ICAgICAgICAgICAgICAgICAgcmFtX2FkZHJfdCByYW1fc2l6ZSwKQEAgLTI4Niw3ICsyODMsNiBA
QCBQQ0lCdXMgKmk0NDBmeF9pbml0KGNvbnN0IGNoYXIgKmhvc3RfdHlwZSwgY29uc3QgY2hhciAq
cGNpX3R5cGUsCiAgICAgUENJQnVzICpiOwogICAgIFBDSURldmljZSAqZDsKICAgICBQQ0lIb3N0
U3RhdGUgKnM7Ci0gICAgUElJWDNTdGF0ZSAqcGlpeDM7CiAgICAgUENJSTQ0MEZYU3RhdGUgKmY7
CiAgICAgdW5zaWduZWQgaTsKICAgICBJNDQwRlhTdGF0ZSAqaTQ0MGZ4OwpAQCAtMzM5LDEwICsz
MzUsNiBAQCBQQ0lCdXMgKmk0NDBmeF9pbml0KGNvbnN0IGNoYXIgKmhvc3RfdHlwZSwgY29uc3Qg
Y2hhciAqcGNpX3R5cGUsCiAgICAgICAgICAgICAgICAgIFBBTV9FWFBBTl9TSVpFKTsKICAgICB9
CiAKLSAgICBwaWl4MyA9IHBpaXgzX2NyZWF0ZShiLCBpc2FfYnVzKTsKLSAgICBwaWl4My0+cGlj
ID0gcGljOwotICAgICpwaWl4M19kZXZmbiA9IHBpaXgzLT5kZXYuZGV2Zm47Ci0KICAgICByYW1f
c2l6ZSA9IHJhbV9zaXplIC8gOCAvIDEwMjQgLyAxMDI0OwogICAgIGlmIChyYW1fc2l6ZSA+IDI1
NSkgewogICAgICAgICByYW1fc2l6ZSA9IDI1NTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvaHcvcGNp
LWhvc3QvaTQ0MGZ4LmggYi9pbmNsdWRlL2h3L3BjaS1ob3N0L2k0NDBmeC5oCmluZGV4IGUzMjdm
OWJmODcuLmY1NGU2NDY2ZTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvaHcvcGNpLWhvc3QvaTQ0MGZ4
LmgKKysrIGIvaW5jbHVkZS9ody9wY2ktaG9zdC9pNDQwZnguaApAQCAtMjIsOCArMjIsNyBAQCB0
eXBlZGVmIHN0cnVjdCBQQ0lJNDQwRlhTdGF0ZSBQQ0lJNDQwRlhTdGF0ZTsKICNkZWZpbmUgVFlQ
RV9JR0RfUEFTU1RIUk9VR0hfSTQ0MEZYX1BDSV9ERVZJQ0UgImlnZC1wYXNzdGhyb3VnaC1pNDQw
RlgiCiAKIFBDSUJ1cyAqaTQ0MGZ4X2luaXQoY29uc3QgY2hhciAqaG9zdF90eXBlLCBjb25zdCBj
aGFyICpwY2lfdHlwZSwKLSAgICAgICAgICAgICAgICAgICAgUENJSTQ0MEZYU3RhdGUgKipwaTQ0
MGZ4X3N0YXRlLCBpbnQgKnBpaXhfZGV2Zm4sCi0gICAgICAgICAgICAgICAgICAgIElTQUJ1cyAq
KmlzYV9idXMsIHFlbXVfaXJxICpwaWMsCisgICAgICAgICAgICAgICAgICAgIFBDSUk0NDBGWFN0
YXRlICoqcGk0NDBmeF9zdGF0ZSwKICAgICAgICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICph
ZGRyZXNzX3NwYWNlX21lbSwKICAgICAgICAgICAgICAgICAgICAgTWVtb3J5UmVnaW9uICphZGRy
ZXNzX3NwYWNlX2lvLAogICAgICAgICAgICAgICAgICAgICByYW1fYWRkcl90IHJhbV9zaXplLAot
LSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
