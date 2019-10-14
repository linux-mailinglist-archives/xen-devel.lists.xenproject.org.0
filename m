Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF42DD6548
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:34:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1ND-0001fz-BB; Mon, 14 Oct 2019 14:30:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1NB-0001fd-SM
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:30:57 +0000
X-Inumbo-ID: 3c5cc4de-ee8f-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c5cc4de-ee8f-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:30:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C908C80166C;
 Mon, 14 Oct 2019 14:30:56 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A245600CD;
 Mon, 14 Oct 2019 14:30:33 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:42 +0200
Message-Id: <20191014142246.4538-17-philmd@redhat.com>
In-Reply-To: <20191014142246.4538-1-philmd@redhat.com>
References: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Mon, 14 Oct 2019 14:30:57 +0000 (UTC)
Subject: [Xen-devel] [PATCH 16/20] hw/pci-host/piix: Include "qemu/range.h"
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

aHcvcGNpLWhvc3QvcGlpeC5jIGNhbGxzIHZhcmlvdXMgZnVuY3Rpb25zIGZyb20gdGhlIFJhbmdl
IEFQSS4KSW5jbHVkZSAicWVtdS9yYW5nZS5oIiB3aGljaCBkZWNsYXJlcyB0aGVtLgoKVGhpcyBm
aXhlcyAod2hlbiBtb2RpZnlpbmcgdW5yZWxhdGVkIGhlYWRlcnMpOgoKICBody9wY2ktaG9zdC9p
NDQwZnguYzo1NDoxMTogZXJyb3I6IGZpZWxkIGhhcyBpbmNvbXBsZXRlIHR5cGUgJ1JhbmdlJyAo
YWthICdzdHJ1Y3QgUmFuZ2UnKQogICAgICBSYW5nZSBwY2lfaG9sZTsKICAgICAgICAgICBeCiAg
aW5jbHVkZS9xZW11L3R5cGVkZWZzLmg6MTE2OjE2OiBub3RlOiBmb3J3YXJkIGRlY2xhcmF0aW9u
IG9mICdzdHJ1Y3QgUmFuZ2UnCiAgdHlwZWRlZiBzdHJ1Y3QgUmFuZ2UgUmFuZ2U7CiAgICAgICAg
ICAgICAgICAgXgogIGh3L3BjaS1ob3N0L2k0NDBmeC5jOjEyNjo5OiBlcnJvcjogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3Jhbmdlc19vdmVybGFwJyBpcyBpbnZhbGlkIGluIEM5
OSBbLVdlcnJvciwtV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogICAgICBpZiAocmFu
Z2VzX292ZXJsYXAoYWRkcmVzcywgbGVuLCBJNDQwRlhfUEFNLCBJNDQwRlhfUEFNX1NJWkUpIHx8
CiAgICAgICAgICBeCiAgaHcvcGNpLWhvc3QvaTQ0MGZ4LmM6MTI2Ojk6IGVycm9yOiB0aGlzIGZ1
bmN0aW9uIGRlY2xhcmF0aW9uIGlzIG5vdCBhIHByb3RvdHlwZSBbLVdlcnJvciwtV3N0cmljdC1w
cm90b3R5cGVzXQogIGh3L3BjaS1ob3N0L2k0NDBmeC5jOjEyNzo5OiBlcnJvcjogaW1wbGljaXQg
ZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24gJ3JhbmdlX2NvdmVyc19ieXRlJyBpcyBpbnZhbGlkIGlu
IEM5OSBbLVdlcnJvciwtV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogICAgICAgICAg
cmFuZ2VfY292ZXJzX2J5dGUoYWRkcmVzcywgbGVuLCBJNDQwRlhfU01SQU0pKSB7CiAgICAgICAg
ICBeCiAgaHcvcGNpLWhvc3QvaTQ0MGZ4LmM6MTI3Ojk6IGVycm9yOiB0aGlzIGZ1bmN0aW9uIGRl
Y2xhcmF0aW9uIGlzIG5vdCBhIHByb3RvdHlwZSBbLVdlcnJvciwtV3N0cmljdC1wcm90b3R5cGVz
XQogIGh3L3BjaS1ob3N0L2k0NDBmeC5jOjE4OToxMzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0
aW9uIG9mIGZ1bmN0aW9uICdyYW5nZV9pc19lbXB0eScgaXMgaW52YWxpZCBpbiBDOTkgWy1XZXJy
b3IsLVdpbXBsaWNpdC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KICAgICAgdmFsNjQgPSByYW5nZV9p
c19lbXB0eSgmcy0+cGNpX2hvbGUpID8gMCA6IHJhbmdlX2xvYigmcy0+cGNpX2hvbGUpOwogICAg
ICAgICAgICAgIF4KClNpZ25lZC1vZmYtYnk6IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGls
bWRAcmVkaGF0LmNvbT4KLS0tCiBody9wY2ktaG9zdC9waWl4LmMgfCAxICsKIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2h3L3BjaS1ob3N0L3BpaXguYyBiL2h3
L3BjaS1ob3N0L3BpaXguYwppbmRleCAxMzVjNjQ1NTM1Li43NmVkMjUyYTYwIDEwMDY0NAotLS0g
YS9ody9wY2ktaG9zdC9waWl4LmMKKysrIGIvaHcvcGNpLWhvc3QvcGlpeC5jCkBAIC0yMyw2ICsy
Myw3IEBACiAgKi8KIAogI2luY2x1ZGUgInFlbXUvb3NkZXAuaCIKKyNpbmNsdWRlICJxZW11L3Jh
bmdlLmgiCiAjaW5jbHVkZSAiaHcvaTM4Ni9wYy5oIgogI2luY2x1ZGUgImh3L2lycS5oIgogI2lu
Y2x1ZGUgImh3L3BjaS9wY2kuaCIKLS0gCjIuMjEuMAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
