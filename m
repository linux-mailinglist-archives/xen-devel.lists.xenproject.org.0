Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A32BC1EB9
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 12:12:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEsc8-0003xP-30; Mon, 30 Sep 2019 10:09:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hbFO=XZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iEsc6-0003xI-5Z
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 10:09:06 +0000
X-Inumbo-ID: 552167de-e36a-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 552167de-e36a-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 10:09:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00D9EB12F;
 Mon, 30 Sep 2019 10:09:03 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Sep 2019 12:09:00 +0200
Message-Id: <20190930100900.660-1-jgross@suse.com>
X-Mailer: git-send-email 2.16.4
Subject: [Xen-devel] [PATCH v5 20/19] docs: add "sched-gran" boot parameter
 documentation
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBuZXcgInNjaGVkLWdyYW4iIGh5cGVydmlzb3IgYm9v
dCBwYXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+Ci0tLQogZG9jcy9taXNjL3hlbi1jb21tYW5kLWxpbmUucGFuZG9jIHwgMjEgKysrKysrKysr
KysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL2RvY3MvbWlzYy94ZW4tY29tbWFuZC1saW5lLnBhbmRvYyBiL2RvY3MvbWlzYy94ZW4tY29t
bWFuZC1saW5lLnBhbmRvYwppbmRleCBmYzY0NDI5MDY0Li5jODU1MjQ2MDUwIDEwMDY0NAotLS0g
YS9kb2NzL21pc2MveGVuLWNvbW1hbmQtbGluZS5wYW5kb2MKKysrIGIvZG9jcy9taXNjL3hlbi1j
b21tYW5kLWxpbmUucGFuZG9jCkBAIC0xNzgyLDYgKzE3ODIsMjcgQEAgU2V0IHRoZSB0aW1lc2xp
Y2Ugb2YgdGhlIGNyZWRpdDEgc2NoZWR1bGVyLCBpbiBtaWxsaXNlY29uZHMuICBUaGUKIGRlZmF1
bHQgaXMgMzBtcy4gIFJlYXNvbmFibGUgdmFsdWVzIG1heSBpbmNsdWRlIDEwLCA1LCBvciBldmVu
IDEgZm9yCiB2ZXJ5IGxhdGVuY3ktc2Vuc2l0aXZlIHdvcmtsb2Fkcy4KIAorIyMjIHNjaGVkLWdy
YW4gKHg4NikKKz4gYD0gY3B1IHwgY29yZSB8IHNvY2tldGAKKworPiBEZWZhdWx0OiBgc2NoZWQt
Z3Jhbj1jcHVgCisKK1NldCB0aGUgc2NoZWR1bGluZyBncmFudWxhcml0eS4gSW4gY2FzZSB0aGUg
Z3JhbnVsYXJpdHkgaXMgbGFyZ2VyIHRoYW4gMSAoZS5nLgorYGNvcmVgb24gYSBTTVQtZW5hYmxl
ZCBzeXN0ZW0sIG9yIGBzb2NrZXRgKSBtdWx0aXBsZSB2Y3B1cyBhcmUgYXNzaWduZWQKK3N0YXRp
Y2FsbHkgdG8gYSAic2NoZWR1bGluZyB1bml0IiB3aGljaCB3aWxsIHRoZW4gYmUgc3ViamVjdCB0
byBzY2hlZHVsaW5nLgorVGhpcyBhc3NpZ25tZW50IG9mIHZjcHVzIHRvIHNjaGVkdWxpbmcgdW5p
dHMgaXMgZml4ZWQuCisKK2BjcHVgOiBWY3B1cyB3aWxsIGJlIHNjaGVkdWxlZCBpbmRpdmlkdWFs
bHkgb24gc2luZ2xlIGNwdXMuCisKK2Bjb3JlYDogQXMgbWFueSB2Y3B1cyBhcyB0aGVyZSBhcmUg
aHlwZXJ0aHJlYWRzIG9uIGEgcGh5c2ljYWwgY29yZSBhcmUKK3NjaGVkdWxlZCB0b2dldGhlciBv
biBhIHBoeXNpY2FsIGNvcmUuCisKK2Bzb2NrZXRgOiBBcyBtYW55IHZjcHVzIGFzIHRoZXJlIGFy
ZSBoeXBlcnRocmVhZHMgb24gYSBwaHlzaWNhbCBzb2NrZXRzIGFyZQorc2NoZWR1bGVkIHRvZ2V0
aGVyIG9uIGEgcGh5c2ljYWwgc29ja2V0LgorCitOb3RlOiBhIHZhbHVlIG90aGVyIHRoYW4gYGNw
dWAgd2lsbCByZXN1bHQgaW4gcmVqZWN0aW5nIGEgcnVudGltZSBtb2RpZmljYXRpb24KK29mIHRo
ZSAic210IiBzZXR0aW5nLgorCiAjIyMgc2NoZWRfcmF0ZWxpbWl0X3VzCiA+IGA9IDxpbnRlZ2Vy
PmAKIAotLSAKMi4xNi40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
