Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EECDDC687
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:52:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLScI-0004hm-H4; Fri, 18 Oct 2019 13:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLScG-0004hW-Oq
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:48:28 +0000
X-Inumbo-ID: f649ea18-f1ad-11e9-beca-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f649ea18-f1ad-11e9-beca-bc764e2007e4;
 Fri, 18 Oct 2019 13:48:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4755118C4288;
 Fri, 18 Oct 2019 13:48:27 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E74C60BF1;
 Fri, 18 Oct 2019 13:48:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:36 +0200
Message-Id: <20191018134754.16362-3-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Fri, 18 Oct 2019 13:48:27 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 02/20] piix4: Add the Reset Control Register
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKVGhlIFJDUiBJ
L08gcG9ydCAoMHhjZjkpIGlzIHVzZWQgdG8gZ2VuZXJhdGUgYSBoYXJkIHJlc2V0IG9yIGEgc29m
dCByZXNldC4KCkFja2VkLWJ5OiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEByZWRoYXQuY29tPgpB
Y2tlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgpNZXNzYWdlLUlkOiA8
MjAxNzEyMTYwOTAyMjguMjg1MDUtNy1ocG91c3NpbkByZWFjdG9zLm9yZz4KUmV2aWV3ZWQtYnk6
IEFsZWtzYW5kYXIgTWFya292aWMgPGFtYXJrb3ZpY0B3YXZlY29tcC5jb20+CltQTUQ6IHJlYmFz
ZWQsIHVwZGF0ZWQgaW5jbHVkZXNdClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1
ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4KLS0tCiBody9pc2EvcGlpeDQuYyB8IDQ5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2h3L2lzYS9w
aWl4NC5jIGIvaHcvaXNhL3BpaXg0LmMKaW5kZXggODkwZDk5OWFiZi4uZDBiMThlMDU4NiAxMDA2
NDQKLS0tIGEvaHcvaXNhL3BpaXg0LmMKKysrIGIvaHcvaXNhL3BpaXg0LmMKQEAgLTIsNiArMiw3
IEBACiAgKiBRRU1VIFBJSVg0IFBDSSBCcmlkZ2UgRW11bGF0aW9uCiAgKgogICogQ29weXJpZ2h0
IChjKSAyMDA2IEZhYnJpY2UgQmVsbGFyZAorICogQ29weXJpZ2h0IChjKSAyMDE4IEhlcnbDqSBQ
b3Vzc2luZWF1CiAgKgogICogUGVybWlzc2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBj
aGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0YWluaW5nIGEgY29weQogICogb2YgdGhpcyBzb2Z0d2Fy
ZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVudGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRv
IGRlYWwKQEAgLTI4LDExICsyOSwxNyBAQAogI2luY2x1ZGUgImh3L2lzYS9pc2EuaCIKICNpbmNs
dWRlICJody9zeXNidXMuaCIKICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0ZS5oIgorI2luY2x1
ZGUgInN5c2VtdS9yZXNldC5oIgorI2luY2x1ZGUgInN5c2VtdS9ydW5zdGF0ZS5oIgogCiBQQ0lE
ZXZpY2UgKnBpaXg0X2RldjsKIAogdHlwZWRlZiBzdHJ1Y3QgUElJWDRTdGF0ZSB7CiAgICAgUENJ
RGV2aWNlIGRldjsKKworICAgIC8qIFJlc2V0IENvbnRyb2wgUmVnaXN0ZXIgKi8KKyAgICBNZW1v
cnlSZWdpb24gcmNyX21lbTsKKyAgICB1aW50OF90IHJjcjsKIH0gUElJWDRTdGF0ZTsKIAogI2Rl
ZmluZSBUWVBFX1BJSVg0X1BDSV9ERVZJQ0UgIlBJSVg0IgpAQCAtODcsMTUgKzk0LDUxIEBAIHN0
YXRpYyBjb25zdCBWTVN0YXRlRGVzY3JpcHRpb24gdm1zdGF0ZV9waWl4NCA9IHsKICAgICB9CiB9
OwogCitzdGF0aWMgdm9pZCBwaWl4NF9yY3Jfd3JpdGUodm9pZCAqb3BhcXVlLCBod2FkZHIgYWRk
ciwgdWludDY0X3QgdmFsLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGlu
dCBsZW4pCit7CisgICAgUElJWDRTdGF0ZSAqcyA9IG9wYXF1ZTsKKworICAgIGlmICh2YWwgJiA0
KSB7CisgICAgICAgIHFlbXVfc3lzdGVtX3Jlc2V0X3JlcXVlc3QoU0hVVERPV05fQ0FVU0VfR1VF
U1RfUkVTRVQpOworICAgICAgICByZXR1cm47CisgICAgfQorCisgICAgcy0+cmNyID0gdmFsICYg
MjsgLyoga2VlcCBTeXN0ZW0gUmVzZXQgdHlwZSBvbmx5ICovCit9CisKK3N0YXRpYyB1aW50NjRf
dCBwaWl4NF9yY3JfcmVhZCh2b2lkICpvcGFxdWUsIGh3YWRkciBhZGRyLCB1bnNpZ25lZCBpbnQg
bGVuKQoreworICAgIFBJSVg0U3RhdGUgKnMgPSBvcGFxdWU7CisKKyAgICByZXR1cm4gcy0+cmNy
OworfQorCitzdGF0aWMgY29uc3QgTWVtb3J5UmVnaW9uT3BzIHBpaXg0X3Jjcl9vcHMgPSB7Cisg
ICAgLnJlYWQgPSBwaWl4NF9yY3JfcmVhZCwKKyAgICAud3JpdGUgPSBwaWl4NF9yY3Jfd3JpdGUs
CisgICAgLmVuZGlhbm5lc3MgPSBERVZJQ0VfTElUVExFX0VORElBTiwKKyAgICAuaW1wbCA9IHsK
KyAgICAgICAgLm1pbl9hY2Nlc3Nfc2l6ZSA9IDEsCisgICAgICAgIC5tYXhfYWNjZXNzX3NpemUg
PSAxLAorICAgIH0sCit9OworCiBzdGF0aWMgdm9pZCBwaWl4NF9yZWFsaXplKFBDSURldmljZSAq
ZGV2LCBFcnJvciAqKmVycnApCiB7Ci0gICAgUElJWDRTdGF0ZSAqZCA9IFBJSVg0X1BDSV9ERVZJ
Q0UoZGV2KTsKKyAgICBQSUlYNFN0YXRlICpzID0gUElJWDRfUENJX0RFVklDRShkZXYpOwogCi0g
ICAgaWYgKCFpc2FfYnVzX25ldyhERVZJQ0UoZCksIHBjaV9hZGRyZXNzX3NwYWNlKGRldiksCisg
ICAgaWYgKCFpc2FfYnVzX25ldyhERVZJQ0UoZGV2KSwgcGNpX2FkZHJlc3Nfc3BhY2UoZGV2KSwK
ICAgICAgICAgICAgICAgICAgICAgIHBjaV9hZGRyZXNzX3NwYWNlX2lvKGRldiksIGVycnApKSB7
CiAgICAgICAgIHJldHVybjsKICAgICB9Ci0gICAgcGlpeDRfZGV2ID0gJmQtPmRldjsKKworICAg
IG1lbW9yeV9yZWdpb25faW5pdF9pbygmcy0+cmNyX21lbSwgT0JKRUNUKGRldiksICZwaWl4NF9y
Y3Jfb3BzLCBzLAorICAgICAgICAgICAgICAgICAgICAgICAgICAicmVzZXQtY29udHJvbCIsIDEp
OworICAgIG1lbW9yeV9yZWdpb25fYWRkX3N1YnJlZ2lvbl9vdmVybGFwKHBjaV9hZGRyZXNzX3Nw
YWNlX2lvKGRldiksIDB4Y2Y5LAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICZzLT5yY3JfbWVtLCAxKTsKKworICAgIHBpaXg0X2RldiA9IGRldjsKIH0KIAogaW50IHBp
aXg0X2luaXQoUENJQnVzICpidXMsIElTQUJ1cyAqKmlzYV9idXMsIGludCBkZXZmbikKLS0gCjIu
MjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
