Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA9DD653E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:33:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Mq-0001YJ-1Z; Mon, 14 Oct 2019 14:30:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Mo-0001Xp-Ba
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:30:34 +0000
X-Inumbo-ID: 2e59d458-ee8f-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e59d458-ee8f-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:30:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 478AE3CA06;
 Mon, 14 Oct 2019 14:30:33 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BDDF3600CD;
 Mon, 14 Oct 2019 14:30:09 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:41 +0200
Message-Id: <20191014142246.4538-16-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 14 Oct 2019 14:30:33 +0000 (UTC)
Subject: [Xen-devel] [PATCH 15/20] hw/i2c/smbus_ich9: Include "qemu/range.h"
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

aHcvaTJjL3NtYnVzX2ljaDkuYyBjYWxscyByYW5nZV9jb3ZlcnNfYnl0ZSgpLiBJbmNsdWRlICJx
ZW11L3JhbmdlLmgiCndoaWNoIGRlY2xhcmVzIGl0LgoKVGhpcyBmaXhlcyAod2hlbiBtb2RpZnlp
bmcgdW5yZWxhdGVkIGhlYWRlcnMpOgoKICBody9pMmMvc21idXNfaWNoOS5jOjY2Ojk6IGVycm9y
OiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAncmFuZ2VfY292ZXJzX2J5dGUnIGlz
IGludmFsaWQgaW4gQzk5IFstV2Vycm9yLC1XaW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25d
CiAgICAgIGlmIChyYW5nZV9jb3ZlcnNfYnl0ZShhZGRyZXNzLCBsZW4sIElDSDlfU01CX0hPU1RD
KSkgewogICAgICAgICAgXgoKU2lnbmVkLW9mZi1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kg
PHBoaWxtZEByZWRoYXQuY29tPgotLS0KIGh3L2kyYy9zbWJ1c19pY2g5LmMgfCAxICsKIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2h3L2kyYy9zbWJ1c19pY2g5
LmMgYi9ody9pMmMvc21idXNfaWNoOS5jCmluZGV4IGZkNTBmYjg1MWEuLjQ4ZjFmZjQxOTEgMTAw
NjQ0Ci0tLSBhL2h3L2kyYy9zbWJ1c19pY2g5LmMKKysrIGIvaHcvaTJjL3NtYnVzX2ljaDkuYwpA
QCAtMjEsNiArMjEsNyBAQAogICovCiAKICNpbmNsdWRlICJxZW11L29zZGVwLmgiCisjaW5jbHVk
ZSAicWVtdS9yYW5nZS5oIgogI2luY2x1ZGUgImh3L2kyYy9wbV9zbWJ1cy5oIgogI2luY2x1ZGUg
Imh3L3BjaS9wY2kuaCIKICNpbmNsdWRlICJtaWdyYXRpb24vdm1zdGF0ZS5oIgotLSAKMi4yMS4w
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
