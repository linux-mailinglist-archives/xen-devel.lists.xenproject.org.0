Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B536DC686
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 15:52:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLScx-0004v7-SL; Fri, 18 Oct 2019 13:49:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=r+Mv=YL=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iLScw-0004uf-C2
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 13:49:10 +0000
X-Inumbo-ID: 0f6c0b3e-f1ae-11e9-93f5-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0f6c0b3e-f1ae-11e9-93f5-12813bfff9fa;
 Fri, 18 Oct 2019 13:49:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 652913001FEB;
 Fri, 18 Oct 2019 13:49:09 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.74])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2221360BF1;
 Fri, 18 Oct 2019 13:48:58 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 18 Oct 2019 15:47:40 +0200
Message-Id: <20191018134754.16362-7-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-1-philmd@redhat.com>
References: <20191018134754.16362-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 18 Oct 2019 13:49:09 +0000 (UTC)
Subject: [Xen-devel] [PATCH v2 06/20] piix4: Add a i8257 DMA Controller as
 specified in datasheet
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

RnJvbTogSGVydsOpIFBvdXNzaW5lYXUgPGhwb3Vzc2luQHJlYWN0b3Mub3JnPgoKUmVtb3ZlIGk4
MjU3IGluc3RhbnRpYXRlZCBpbiBtYWx0YSBib2FyZCwgdG8gbm90IGhhdmUgaXQgdHdpY2UuCgpB
Y2tlZC1ieTogTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KQWNrZWQtYnk6IFBh
b2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+ClNpZ25lZC1vZmYtYnk6IEhlcnbDqSBQ
b3Vzc2luZWF1IDxocG91c3NpbkByZWFjdG9zLm9yZz4KTWVzc2FnZS1JZDogPDIwMTcxMjE2MDkw
MjI4LjI4NTA1LTktaHBvdXNzaW5AcmVhY3Rvcy5vcmc+ClJldmlld2VkLWJ5OiBBbGVrc2FuZGFy
IE1hcmtvdmljIDxhbWFya292aWNAd2F2ZWNvbXAuY29tPgpbUE1EOiByZWJhc2VkXQpTaWduZWQt
b2ZmLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Ci0tLQog
aHcvaXNhL3BpaXg0LmMgICAgICAgfCA0ICsrKysKIGh3L21pcHMvbWlwc19tYWx0YS5jIHwgMiAt
LQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaHcvaXNhL3BpaXg0LmMgYi9ody9pc2EvcGlpeDQuYwppbmRleCBhYzkzODNhNjU4
Li4wYjI0ZDgzMjNjIDEwMDY0NAotLS0gYS9ody9pc2EvcGlpeDQuYworKysgYi9ody9pc2EvcGlp
eDQuYwpAQCAtMjksNiArMjksNyBAQAogI2luY2x1ZGUgImh3L3BjaS9wY2kuaCIKICNpbmNsdWRl
ICJody9pc2EvaXNhLmgiCiAjaW5jbHVkZSAiaHcvc3lzYnVzLmgiCisjaW5jbHVkZSAiaHcvZG1h
L2k4MjU3LmgiCiAjaW5jbHVkZSAibWlncmF0aW9uL3Ztc3RhdGUuaCIKICNpbmNsdWRlICJzeXNl
bXUvcmVzZXQuaCIKICNpbmNsdWRlICJzeXNlbXUvcnVuc3RhdGUuaCIKQEAgLTE2Nyw2ICsxNjgs
OSBAQCBzdGF0aWMgdm9pZCBwaWl4NF9yZWFsaXplKFBDSURldmljZSAqZGV2LCBFcnJvciAqKmVy
cnApCiAgICAgLyogaW5pdGlhbGl6ZSBJU0EgaXJxcyAqLwogICAgIGlzYV9idXNfaXJxcyhpc2Ff
YnVzLCBzLT5pc2EpOwogCisgICAgLyogRE1BICovCisgICAgaTgyNTdfZG1hX2luaXQoaXNhX2J1
cywgMCk7CisKICAgICBwaWl4NF9kZXYgPSBkZXY7CiB9CiAKZGlmZiAtLWdpdCBhL2h3L21pcHMv
bWlwc19tYWx0YS5jIGIvaHcvbWlwcy9taXBzX21hbHRhLmMKaW5kZXggZTQ5OWI3YTZiYi4uZGYy
NDcxNzdjYSAxMDA2NDQKLS0tIGEvaHcvbWlwcy9taXBzX21hbHRhLmMKKysrIGIvaHcvbWlwcy9t
aXBzX21hbHRhLmMKQEAgLTI4LDcgKzI4LDYgQEAKICNpbmNsdWRlICJjcHUuaCIKICNpbmNsdWRl
ICJody9pMzg2L3BjLmgiCiAjaW5jbHVkZSAiaHcvaXNhL3N1cGVyaW8uaCIKLSNpbmNsdWRlICJo
dy9kbWEvaTgyNTcuaCIKICNpbmNsdWRlICJody9jaGFyL3NlcmlhbC5oIgogI2luY2x1ZGUgIm5l
dC9uZXQuaCIKICNpbmNsdWRlICJody9ib2FyZHMuaCIKQEAgLTE0MzAsNyArMTQyOSw2IEBAIHZv
aWQgbWlwc19tYWx0YV9pbml0KE1hY2hpbmVTdGF0ZSAqbWFjaGluZSkKICAgICBzbWJ1cyA9IHBp
aXg0X3BtX2luaXQocGNpX2J1cywgcGlpeDRfZGV2Zm4gKyAzLCAweDExMDAsCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGlzYV9nZXRfaXJxKE5VTEwsIDkpLCBOVUxMLCAwLCBOVUxMKTsKICAg
ICBwaXQgPSBpODI1NF9waXRfaW5pdChpc2FfYnVzLCAweDQwLCAwLCBOVUxMKTsKLSAgICBpODI1
N19kbWFfaW5pdChpc2FfYnVzLCAwKTsKICAgICBtYzE0NjgxOF9ydGNfaW5pdChpc2FfYnVzLCAy
MDAwLCBOVUxMKTsKIAogICAgIC8qIGdlbmVyYXRlIFNQRCBFRVBST00gZGF0YSAqLwotLSAKMi4y
MS4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
