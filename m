Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 288CBD6514
	for <lists+xen-devel@lfdr.de>; Mon, 14 Oct 2019 16:26:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iK1Fl-0007rX-EP; Mon, 14 Oct 2019 14:23:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=raPH=YH=redhat.com=philmd@srs-us1.protection.inumbo.net>)
 id 1iK1Fj-0007rQ-La
 for xen-devel@lists.xenproject.org; Mon, 14 Oct 2019 14:23:15 +0000
X-Inumbo-ID: 289da70d-ee8e-11e9-937f-12813bfff9fa
Received: from mx1.redhat.com (unknown [209.132.183.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 289da70d-ee8e-11e9-937f-12813bfff9fa;
 Mon, 14 Oct 2019 14:23:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 313B85117D;
 Mon, 14 Oct 2019 14:23:14 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.206.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CD7C600CD;
 Mon, 14 Oct 2019 14:22:48 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Date: Mon, 14 Oct 2019 16:22:26 +0200
Message-Id: <20191014142246.4538-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 14 Oct 2019 14:23:14 +0000 (UTC)
Subject: [Xen-devel] [PATCH 00/20] hw: Clean up hw/i386 headers (and few
 alpha/hppa)
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

VGhpcyBpcyBhIGZvbGxvdy11cCBvZiBNYXJrdXMncyBjbGVhbnVwIHNlcmllczoKVGFtZSBhIGZl
dyAidG91Y2ggdGhpcywgcmVjb21waWxlIHRoZSB3b3JsZCIKaHR0cHM6Ly93d3cubWFpbC1hcmNo
aXZlLmNvbS9xZW11LWRldmVsQG5vbmdudS5vcmcvbXNnNjM1NzQ4Lmh0bWwKClRoaXMgcGFydCBp
cyBtb3N0bHkgcmVzdHJpY3RlZCB0byBYODYsIGJ1dCBzaW5jZSBzb21lIGZpbGUgZnJvbSB0aGUK
QWxwaGEvUEEtUklTQyBtYWNoaW5lcyBpbmNsdWRlICJody9pMzg2L3BjLmgiIEkgaGFkIHRvIGZp
eCB0aGVtCnRvby4KCkV2ZW50dWFsbHkgSSdsbCBzdWNjZWVkIGF0IHJlbW92aW5nIGh3L2kzODYv
IGRlcGVuZGVuY3kgb24gbm9uLVg4NgpwbGF0Zm9ybXMgKFF1ZXN0IEkgc3RhcnRlZCAyIHllYXJz
IGFnby4uLikuCgpSZWdhcmRzLAoKUGhpbC4KClBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpICgyMCk6
CiAgdmw6IEFkZCBtaXNzaW5nICJody9ib2FyZHMuaCIgaW5jbHVkZQogIGh3L3NvdXRoYnJpZGdl
L2ljaDk6IFJlbW92ZWQgdW51c2VkIGhlYWRlcnMKICBody9pbnB1dC9wY2tiZDogUmVtb3ZlIHVu
dXNlZCAiaHcvaTM4Ni9wYy5oIiBoZWFkZXIKICBody9pMzg2L2lvYXBpY19pbnRlcm5hbDogUmVt
b3ZlIHVudXNlZCAiaHcvaTM4Ni9pb2FwaWMuaCIgaGVhZGVyCiAgaHcvdGltZXI6IFJlbW92ZSB1
bnVzZWQgInVpL2NvbnNvbGUuaCIgaGVhZGVyCiAgaHcvdXNiL2Rldi1zdG9yYWdlOiBSZW1vdmUg
dW51c2VkICJ1aS9jb25zb2xlLmgiIGhlYWRlcgogIGh3L2kzODYvaW50ZWxfaW9tbXU6IFJlbW92
ZSB1bnVzZWQgaW5jbHVkZXMKICBody94ZW4veGVuX3B0X2xvYWRfcm9tOiBSZW1vdmUgdW51c2Vk
IGluY2x1ZGVzCiAgaHcvYWxwaGEvYWxwaGFfc3lzOiBSZW1vdmUgdW51c2VkICJody9pZGUuaCIg
aGVhZGVyCiAgaHcvYWxwaGEvZHAyNjQ6IEluY2x1ZGUgIm5ldC9uZXQuaCIKICBody9ocHBhL21h
Y2hpbmU6IEluY2x1ZGUgIm5ldC9uZXQuaCIKICBody9hY3BpL2NwdV9ob3RwbHVnOiBJbmNsdWRl
ICJody9wY2kvcGNpLmgiCiAgaHcvdGltZXIvaHBldDogSW5jbHVkZSAiZXhlYy9hZGRyZXNzLXNw
YWNlcy5oIgogIGh3L3BjaS1ob3N0L3EzNTogSW5jbHVkZSAicWVtdS9yYW5nZS5oIgogIGh3L2ky
Yy9zbWJ1c19pY2g5OiBJbmNsdWRlICJxZW11L3JhbmdlLmgiCiAgaHcvcGNpLWhvc3QvcGlpeDog
SW5jbHVkZSAicWVtdS9yYW5nZS5oIgogIGh3L2FjcGk6IEluY2x1ZGUgImh3L21lbS9udmRpbW0u
aCIKICBody9pMzg2OiBJbmNsdWRlICJody9tZW0vbnZkaW1tLmgiCiAgaHcvcGNpLWhvc3QvcTM1
OiBSZW1vdmUgdW51c2VkIGluY2x1ZGVzCiAgaHcvaTM4Ni9wYzogQ2xlYW4gdXAgaW5jbHVkZXMK
CiBody9hY3BpL2NwdV9ob3RwbHVnLmMgICAgICAgICAgICAgfCAgMSArCiBody9hY3BpL2ljaDku
YyAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogaHcvYWNwaS9waWl4NC5jICAgICAgICAgICAg
ICAgICAgIHwgIDEgKwogaHcvYWxwaGEvYWxwaGFfc3lzLmggICAgICAgICAgICAgIHwgIDEgLQog
aHcvYWxwaGEvZHAyNjQuYyAgICAgICAgICAgICAgICAgIHwgIDEgKwogaHcvaHBwYS9tYWNoaW5l
LmMgICAgICAgICAgICAgICAgIHwgIDEgKwogaHcvaTJjL3NtYnVzX2ljaDkuYyAgICAgICAgICAg
ICAgIHwgIDEgKwogaHcvaTM4Ni9hY3BpLWJ1aWxkLmMgICAgICAgICAgICAgIHwgIDEgKwogaHcv
aTM4Ni9wYy5jICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogaHcvaTM4Ni9wY19waWl4LmMg
ICAgICAgICAgICAgICAgIHwgIDEgKwogaHcvaTM4Ni9wY19xMzUuYyAgICAgICAgICAgICAgICAg
IHwgIDEgKwogaHcvaW5wdXQvcGNrYmQuYyAgICAgICAgICAgICAgICAgIHwgIDEgLQogaHcvaXNh
L2xwY19pY2g5LmMgICAgICAgICAgICAgICAgIHwgIDIgLS0KIGh3L3BjaS1ob3N0L3BpaXguYyAg
ICAgICAgICAgICAgICB8ICAxICsKIGh3L3BjaS1ob3N0L3EzNS5jICAgICAgICAgICAgICAgICB8
ICAxICsKIGh3L3RpbWVyL2hwZXQuYyAgICAgICAgICAgICAgICAgICB8ICAyICstCiBody90aW1l
ci90d2w5MjIzMC5jICAgICAgICAgICAgICAgfCAgMSAtCiBody91c2IvZGV2LXN0b3JhZ2UuYyAg
ICAgICAgICAgICAgfCAgMSAtCiBody94ZW4veGVuX3B0X2xvYWRfcm9tLmMgICAgICAgICAgfCAg
NCAtLS0tCiBpbmNsdWRlL2h3L2kzODYvaWNoOS5oICAgICAgICAgICAgfCAgMSAtCiBpbmNsdWRl
L2h3L2kzODYvaW50ZWxfaW9tbXUuaCAgICAgfCAgNCAtLS0tCiBpbmNsdWRlL2h3L2kzODYvaW9h
cGljX2ludGVybmFsLmggfCAgMSAtCiBpbmNsdWRlL2h3L2kzODYvcGMuaCAgICAgICAgICAgICAg
fCAxMiArKystLS0tLS0tLS0KIGluY2x1ZGUvaHcvcGNpLWhvc3QvcTM1LmggICAgICAgICB8ICA4
ICstLS0tLS0tCiB2bC5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAyNSBm
aWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKCi0tIAoyLjIx
LjAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
