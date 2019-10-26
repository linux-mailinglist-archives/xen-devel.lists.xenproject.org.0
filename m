Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FE7E5E6C
	for <lists+xen-devel@lfdr.de>; Sat, 26 Oct 2019 20:05:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iOQOT-00057d-C8; Sat, 26 Oct 2019 18:02:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=G4JE=YT=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iOQOR-00057U-SG
 for xen-devel@lists.xenproject.org; Sat, 26 Oct 2019 18:02:27 +0000
X-Inumbo-ID: c4a96acf-f81a-11e9-94d7-12813bfff9fa
Received: from us-smtp-1.mimecast.com (unknown [205.139.110.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id c4a96acf-f81a-11e9-94d7-12813bfff9fa;
 Sat, 26 Oct 2019 18:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572112946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=leKb+mxeE3Ab87XsOqKSMcG+BfzCOIRLFQX4loQ4eOE=;
 b=J1qBrkZymO4kI+AsqO4NLvn9Gqnu4QSf9aHAR2Tl34uvje4/SrtSPq1QlQIgMZMYk/suWt
 kA64f92Y6JVGLkzEXw+HdkIUw4FamtSFQzQPeVcO7Hz0uBJFOI45eEsjx1PCAQxDA80CTF
 uH+4ERLMeeRGHivvh2ZphyIQJRBM3OI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-sUwBDL4wNaSRj2Jzaozt5w-1; Sat, 26 Oct 2019 14:02:21 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07D2E800D41;
 Sat, 26 Oct 2019 18:02:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-39.brq.redhat.com [10.40.204.39])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03ED460C57;
 Sat, 26 Oct 2019 18:02:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Sat, 26 Oct 2019 20:01:25 +0200
Message-Id: <20191026180143.7369-3-philmd@redhat.com>
In-Reply-To: <20191026180143.7369-1-philmd@redhat.com>
References: <20191026180143.7369-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: sUwBDL4wNaSRj2Jzaozt5w-1
X-Mimecast-Spam-Score: 0
Subject: [Xen-devel] [PATCH v3 02/20] piix4: Add the Reset Control Register
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
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@gmail.com>,
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKVGhlIFJDUiBJ
L08gcG9ydCAoMHhjZjkpIGlzIHVzZWQgdG8gZ2VuZXJhdGUgYSBoYXJkIHJlc2V0IG9yIGEgc29m
dCByZXNldC4KCkFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpB
Y2tlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgpNZXNzYWdlLUlkOiA8
MjAxNzEyMTYwOTAyMjguMjg1MDUtNy1ocG91c3NpbkByZWFjdG9zLm9yZz4KUmV2aWV3ZWQtYnk6
IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+ClJldmlld2VkLWJ5
OiBMaSBRaWFuZyA8bGlxM2VhQGdtYWlsLmNvbT4KW1BNRDogcmViYXNlZCwgdXBkYXRlZCBpbmNs
dWRlc10KU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEByZWRo
YXQuY29tPgotLS0KdjM6IFVzZSBSQ1JfSU9QT1JUIChMaSBRaWFuZykKLS0tCiBody9pc2EvcGlp
eDQuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2h3L2lzYS9waWl4NC5jIGIvaHcvaXNhL3BpaXg0LmMKaW5kZXggODkwZDk5OWFi
Zi4uN2ExMzYxYTlkZCAxMDA2NDQKLS0tIGEvaHcvaXNhL3BpaXg0LmMKKysrIGIvaHcvaXNhL3Bp
aXg0LmMKQEAgLTIsNiArMiw3IEBACiAgKiBRRU1VIFBJSVg0IFBDSSBCcmlkZ2UgRW11bGF0aW9u
CiAgKgogICogQ29weXJpZ2h0IChjKSAyMDA2IEZhYnJpY2UgQmVsbGFyZAorICogQ29weXJpZ2h0
IChjKSAyMDE4IEhlcnbDqSBQb3Vzc2luZWF1CiAgKgogICogUGVybWlzc2lvbiBpcyBoZXJlYnkg
Z3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQog
ICogb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0
aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKQEAgLTI4LDExICsyOSwxNyBAQAogI2luY2x1ZGUgImh3
L2lzYS9pc2EuaCIKICNpbmNsdWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJtaWdyYXRpb24v
dm1zdGF0ZS5oIgorI2luY2x1ZGUgInN5c2VtdS9yZXNldC5oIgorI2luY2x1ZGUgInN5c2VtdS9y
dW5zdGF0ZS5oIgogCiBQQ0lEZXZpY2UgKnBpaXg0X2RldjsKIAogdHlwZWRlZiBzdHJ1Y3QgUElJ
WDRTdGF0ZSB7CiAgICAgUENJRGV2aWNlIGRldjsKKworICAgIC8qIFJlc2V0IENvbnRyb2wgUmVn
aXN0ZXIgKi8KKyAgICBNZW1vcnlSZWdpb24gcmNyX21lbTsKKyAgICB1aW50OF90IHJjcjsKIH0g
UElJWDRTdGF0ZTsKIAogI2RlZmluZSBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UgIlBJSVg0IgpAQCAt
ODcsMTUgKzk0LDUxIEBAIHN0YXRpYyBjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24gdm1zdGF0ZV9w
aWl4NCA9IHsKICAgICB9CiB9OwogCitzdGF0aWMgdm9pZCBwaWl4NF9yY3Jfd3JpdGUodm9pZCAq
b3BhcXVlLCBod2FkZHIgYWRkciwgdWludDY0X3QgdmFsLAorICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGludCBsZW4pCit7CisgICAgUElJWDRTdGF0ZSAqcyA9IG9wYXF1ZTsK
KworICAgIGlmICh2YWwgJiA0KSB7CisgICAgICAgIHFlbXVfc3lzdGVtX3Jlc2V0X3JlcXVlc3Qo
U0hVVERPV05fQ0FVU0VfR1VFU1RfUkVTRVQpOworICAgICAgICByZXR1cm47CisgICAgfQorCisg
ICAgcy0+cmNyID0gdmFsICYgMjsgLyoga2VlcCBTeXN0ZW0gUmVzZXQgdHlwZSBvbmx5ICovCit9
CisKK3N0YXRpYyB1aW50NjRfdCBwaWl4NF9yY3JfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBh
ZGRyLCB1bnNpZ25lZCBpbnQgbGVuKQoreworICAgIFBJSVg0U3RhdGUgKnMgPSBvcGFxdWU7CisK
KyAgICByZXR1cm4gcy0+cmNyOworfQorCitzdGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIHBp
aXg0X3Jjcl9vcHMgPSB7CisgICAgLnJlYWQgPSBwaWl4NF9yY3JfcmVhZCwKKyAgICAud3JpdGUg
PSBwaWl4NF9yY3Jfd3JpdGUsCisgICAgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTElUVExFX0VORElB
TiwKKyAgICAuaW1wbCA9IHsKKyAgICAgICAgLm1pbl9hY2Nlc3Nfc2l6ZSA9IDEsCisgICAgICAg
IC5tYXhfYWNjZXNzX3NpemUgPSAxLAorICAgIH0sCit9OworCiBzdGF0aWMgdm9pZCBwaWl4NF9y
ZWFsaXplKFBDSURldmljZSAqZGV2LCBFcnJvciAqKmVycnApCiB7Ci0gICAgUElJWDRTdGF0ZSAq
ZCA9IFBJSVg0X1BDSV9ERVZJQ0UoZGV2KTsKKyAgICBQSUlYNFN0YXRlICpzID0gUElJWDRfUENJ
X0RFVklDRShkZXYpOwogCi0gICAgaWYgKCFpc2FfYnVzX25ldyhERVZJQ0UoZCksIHBjaV9hZGRy
ZXNzX3NwYWNlKGRldiksCisgICAgaWYgKCFpc2FfYnVzX25ldyhERVZJQ0UoZGV2KSwgcGNpX2Fk
ZHJlc3Nfc3BhY2UoZGV2KSwKICAgICAgICAgICAgICAgICAgICAgIHBjaV9hZGRyZXNzX3NwYWNl
X2lvKGRldiksIGVycnApKSB7CiAgICAgICAgIHJldHVybjsKICAgICB9Ci0gICAgcGlpeDRfZGV2
ID0gJmQtPmRldjsKKworICAgIG1lbW9yeV9yZWdpb25faW5pdF9pbygmcy0+cmNyX21lbSwgT0JK
RUNUKGRldiksICZwaWl4NF9yY3Jfb3BzLCBzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAi
cmVzZXQtY29udHJvbCIsIDEpOworICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbl9vdmVy
bGFwKHBjaV9hZGRyZXNzX3NwYWNlX2lvKGRldiksCisgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgUkNSX0lPUE9SVCwgJnMtPnJjcl9tZW0sIDEpOworCisgICAgcGlpeDRf
ZGV2ID0gZGV2OwogfQogCiBpbnQgcGlpeDRfaW5pdChQQ0lCdXMgKmJ1cywgSVNBQnVzICoqaXNh
X2J1cywgaW50IGRldmZuKQotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
