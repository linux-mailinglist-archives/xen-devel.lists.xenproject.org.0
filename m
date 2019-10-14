Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DBBD6541
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:33:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1O2-0001tk-1y; Mon, 14 Oct 2019 14:31:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1O1-0001tc-81
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:31:49 +0000
X-Inumbo-ID: 5ae0588a-ee8f-11e9-bbab-bc764e2007e4
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ae0588a-ee8f-11e9-bbab-bc764e2007e4;
 Mon, 14 Oct 2019 14:31:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0F7D63086211;
 Mon, 14 Oct 2019 14:31:48 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E5E7600CD;
 Mon, 14 Oct 2019 14:31:20 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:44 +0200
Message-Id: <20191014142246.4538-19-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Mon, 14 Oct 2019 14:31:48 +0000 (UTC)
Subject: [Xen-devel] [PATCH 18/20] hw/i386: Include "hw/mem/nvdimm.h"
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Wen Congyang <wencongyang2@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWxsIHRoaXMgZmlsZXMgdXNlIG1ldGhvZHMvZGVmaW5pdGlvbnMgZGVjbGFyZWQgaW4gdGhlIE5W
RElNTQpkZXZpY2UgaGVhZGVyLiBJbmNsdWRlIGl0LgoKVGhpcyBmaXhlcyAod2hlbiBtb2RpZnlp
bmcgdW5yZWxhdGVkIGhlYWRlcnMpOgoKICBody9pMzg2L2FjcGktYnVpbGQuYzoyNzMzOjk6IGVy
cm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnbnZkaW1tX2J1aWxkX2FjcGkn
IGlzIGludmFsaWQgaW4gQzk5IFstV2Vycm9yLC1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRp
b25dCiAgICAgICAgbnZkaW1tX2J1aWxkX2FjcGkodGFibGVfb2Zmc2V0cywgdGFibGVzX2Jsb2Is
IHRhYmxlcy0+bGlua2VyLAogICAgICAgIF4KICBody9pMzg2L3BjLmM6MTk5Njo2MTogZXJyb3I6
IHVzZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ1RZUEVfTlZESU1NJwogICAgY29uc3QgYm9v
bCBpc19udmRpbW0gPSBvYmplY3RfZHluYW1pY19jYXN0KE9CSkVDVChkZXYpLCBUWVBFX05WRElN
TSk7CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KICBody9pMzg2L3BjLmM6MjAzMjo1NTogZXJyb3I6IHVzZSBvZiB1bmRlY2xhcmVk
IGlkZW50aWZpZXIgJ1RZUEVfTlZESU1NJwogICAgYm9vbCBpc19udmRpbW0gPSBvYmplY3RfZHlu
YW1pY19jYXN0KE9CSkVDVChkZXYpLCBUWVBFX05WRElNTSk7CiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBody9pMzg2L3BjLmM6MjA0MDo5
OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ252ZGltbV9wbHVnJyBp
cyBpbnZhbGlkIGluIEM5OSBbLVdlcnJvciwtV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9u
XQogICAgICAgIG52ZGltbV9wbHVnKG1zLT5udmRpbW1zX3N0YXRlKTsKICAgICAgICBeCiAgaHcv
aTM4Ni9wYy5jOjIwNDA6OTogZXJyb3I6IHRoaXMgZnVuY3Rpb24gZGVjbGFyYXRpb24gaXMgbm90
IGEgcHJvdG90eXBlIFstV2Vycm9yLC1Xc3RyaWN0LXByb3RvdHlwZXNdCiAgICAgICAgbnZkaW1t
X3BsdWcobXMtPm52ZGltbXNfc3RhdGUpOwogICAgICAgIF4KICBody9pMzg2L3BjLmM6MjA2NTo0
MjogZXJyb3I6IHVzZSBvZiB1bmRlY2xhcmVkIGlkZW50aWZpZXIgJ1RZUEVfTlZESU1NJwogICAg
aWYgKG9iamVjdF9keW5hbWljX2Nhc3QoT0JKRUNUKGRldiksIFRZUEVfTlZESU1NKSkgewogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KICBody9pMzg2L3BjX2k0NDBm
eC5jOjMwNzo5OiBlcnJvcjogaW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ252ZGlt
bV9pbml0X2FjcGlfc3RhdGUnIGlzIGludmFsaWQgaW4gQzk5IFstV2Vycm9yLC1XaW1wbGljaXQt
ZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgICAgICAgbnZkaW1tX2luaXRfYWNwaV9zdGF0ZShtYWNo
aW5lLT5udmRpbW1zX3N0YXRlLCBzeXN0ZW1faW8sCiAgICAgICAgXgogIGh3L2kzODYvcGNfcTM1
LmM6MzMyOjk6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAnbnZkaW1t
X2luaXRfYWNwaV9zdGF0ZScgaXMgaW52YWxpZCBpbiBDOTkgWy1XZXJyb3IsLVdpbXBsaWNpdC1m
dW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAgICBudmRpbW1faW5pdF9hY3BpX3N0YXRlKG1hY2hp
bmUtPm52ZGltbXNfc3RhdGUsIHN5c3RlbV9pbywKICAgICAgICBeCgpTaWduZWQtb2ZmLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQogaHcvaTM4Ni9h
Y3BpLWJ1aWxkLmMgfCAxICsKIGh3L2kzODYvcGMuYyAgICAgICAgIHwgMSArCiBody9pMzg2L3Bj
X3BpaXguYyAgICB8IDEgKwogaHcvaTM4Ni9wY19xMzUuYyAgICAgfCAxICsKIDQgZmlsZXMgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9hY3BpLWJ1aWxkLmMg
Yi9ody9pMzg2L2FjcGktYnVpbGQuYwppbmRleCA0ZTBmOWY0MjVhLi5hYzQ2OTM2ZjYzIDEwMDY0
NAotLS0gYS9ody9pMzg2L2FjcGktYnVpbGQuYworKysgYi9ody9pMzg2L2FjcGktYnVpbGQuYwpA
QCAtNDgsNiArNDgsNyBAQAogI2luY2x1ZGUgImh3L3RpbWVyL21jMTQ2ODE4cnRjX3JlZ3MuaCIK
ICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0ZS5oIgogI2luY2x1ZGUgImh3L21lbS9tZW1vcnkt
ZGV2aWNlLmgiCisjaW5jbHVkZSAiaHcvbWVtL252ZGltbS5oIgogI2luY2x1ZGUgInN5c2VtdS9u
dW1hLmgiCiAjaW5jbHVkZSAic3lzZW11L3Jlc2V0LmgiCiAKZGlmZiAtLWdpdCBhL2h3L2kzODYv
cGMuYyBiL2h3L2kzODYvcGMuYwppbmRleCBiY2RhNTBlZmNjLi5jZmYzMzA4MDJkIDEwMDY0NAot
LS0gYS9ody9pMzg2L3BjLmMKKysrIGIvaHcvaTM4Ni9wYy5jCkBAIC03Myw2ICs3Myw3IEBACiAj
aW5jbHVkZSAiaHcvYm9hcmRzLmgiCiAjaW5jbHVkZSAiYWNwaS1idWlsZC5oIgogI2luY2x1ZGUg
Imh3L21lbS9wYy1kaW1tLmgiCisjaW5jbHVkZSAiaHcvbWVtL252ZGltbS5oIgogI2luY2x1ZGUg
InFhcGkvZXJyb3IuaCIKICNpbmNsdWRlICJxYXBpL3FhcGktdmlzaXQtY29tbW9uLmgiCiAjaW5j
bHVkZSAicWFwaS92aXNpdG9yLmgiCmRpZmYgLS1naXQgYS9ody9pMzg2L3BjX3BpaXguYyBiL2h3
L2kzODYvcGNfcGlpeC5jCmluZGV4IDY4MjRiNzIxMjQuLjg2NTFiNmUyZWMgMTAwNjQ0Ci0tLSBh
L2h3L2kzODYvcGNfcGlpeC5jCisrKyBiL2h3L2kzODYvcGNfcGlpeC5jCkBAIC01OCw2ICs1OCw3
IEBACiAjaW5jbHVkZSAibWlncmF0aW9uL21pc2MuaCIKICNpbmNsdWRlICJrdm1faTM4Ni5oIgog
I2luY2x1ZGUgInN5c2VtdS9udW1hLmgiCisjaW5jbHVkZSAiaHcvbWVtL252ZGltbS5oIgogCiAj
ZGVmaW5lIE1BWF9JREVfQlVTIDIKIApkaWZmIC0tZ2l0IGEvaHcvaTM4Ni9wY19xMzUuYyBiL2h3
L2kzODYvcGNfcTM1LmMKaW5kZXggOGZhZDIwZjMxNC4uOTFiYTIzMWVmMSAxMDA2NDQKLS0tIGEv
aHcvaTM4Ni9wY19xMzUuYworKysgYi9ody9pMzg2L3BjX3EzNS5jCkBAIC01Myw2ICs1Myw3IEBA
CiAjaW5jbHVkZSAicWFwaS9lcnJvci5oIgogI2luY2x1ZGUgInFlbXUvZXJyb3ItcmVwb3J0Lmgi
CiAjaW5jbHVkZSAic3lzZW11L251bWEuaCIKKyNpbmNsdWRlICJody9tZW0vbnZkaW1tLmgiCiAK
IC8qIElDSDkgQUhDSSBoYXMgNiBwb3J0cyAqLwogI2RlZmluZSBNQVhfU0FUQV9QT1JUUyAgICAg
NgotLSAKMi4yMS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
