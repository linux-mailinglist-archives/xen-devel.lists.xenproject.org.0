Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AC3628C0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2019 20:50:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hkYfb-00053i-3M; Mon, 08 Jul 2019 18:47:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Un8F=VF=wdc.com=prvs=0852429f4=chaitanya.kulkarni@srs-us1.protection.inumbo.net>)
 id 1hkYfZ-00053d-A8
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2019 18:47:21 +0000
X-Inumbo-ID: cf15188e-a1b0-11e9-919b-cf468974c32c
Received: from esa2.hgst.iphmx.com (unknown [68.232.143.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cf15188e-a1b0-11e9-919b-cf468974c32c;
 Mon, 08 Jul 2019 18:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1562611652; x=1594147652;
 h=from:to:cc:subject:date:message-id;
 bh=uTqlKG2ILdegr5sU0HeNGcEucdW/yuMkATM/4UkxKXI=;
 b=ODuIhuvk1IOPXS/upsxUSRbmTLc6jFjP9YfKc1oq6web14dhzogKBT7H
 kRQL8iMZSaWYJyYbag8irWBHyR11jMRLC37a07USYtuT9HC0cVKbGKurf
 IKN44Id7HlZ61ffxpmNKwXRNqMbMCzfCnFC3oN2V9RqJEgcQbbFYbWAHa
 ifcQO0K8GZPmILHxKj4SJly8Nj6buZt2N3r0jle+Qg1Gy+D3VlZnQVkke
 CUzErJz11v8we/Qwtd2wNYlud+rUUpltvZZ971AJd2+2ZcO6GDnaxK/zn
 wTcS6iSd6Qo+vXz+7HcKgTEQkCoMEXjibf6f9BuopDO7h82+VXcGGQA3P g==;
IronPort-SDR: dPbcEmD2s4dakDc7MTh8Qds7PQ0KQVsfKWh8eifa5GEZJYIWeGJ5PPD+7QRi54unx7kxuJ7fBt
 QcTk0x7XgA9cMjyGWXL+dMmKNWRKHet6rCkUD0Cb4jpRSqgEYW0mtfwKIaZAWEUYUSTOnofrKX
 CbHtyEj8ghdUJVWlYDIksRdnq0MqH4MwqfTf4AdlfAv19tNGM1lFVZ/sU/GTU4LxJ6vBWoBDrj
 LudkY19RNyessmOMVgBcD2c9unm2KqnIB999j84twfhwUAE+HVUig9f+HE0vpUCrgRjaIJxd8p
 QUI=
X-IronPort-AV: E=Sophos;i="5.63,466,1557158400"; d="scan'208";a="212364690"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Jul 2019 02:47:31 +0800
IronPort-SDR: 0uGl0jWUnel16ZGq6gKKxRRTxjDPOUGi/jLhg2HY8lfYuNNw+SDeqd+lqRN1sr1497net8a0rx
 JtjZjrqRUThghsEAK1E6Ae/l0+89a1gZ9GTKNGzL6BMSzUCS1KT8JhXQOY/jWhcRcvsu4uBT9y
 eDCLWoU+PmKh+IEMrTajfn5WZ+Oq/ukMsy1KItGSkwzsbsCeWub2/Z0i0asdOSOH8g6L8jNC2M
 HxKbUPZnbaogw0WEdnFfco5pCQqpI2VRuMUfYCjxHXgDz5QrDiaIuEauweJuezR8SmYd8iSiRu
 I9K7JmVYww5q1t0kJa4m7NnG
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 08 Jul 2019 11:46:05 -0700
IronPort-SDR: eW86af4OthOZtKlcukw8hg5FI8z3Pyrc2gRdLV4x4bpMNy4sygCYPSfYDcM2B4QXsj4ILsUxuF
 TQU3d19L1c5FTnZDXmSuL2XtMIjgw4+ea8vwSw8DmEbRevzLHYwgY1GdfVVK3SuKBCqem7cbn4
 XSceRHtmXS96JKNQcd4ThjYOnlatcCPqKA495dVcxKVT6l/6xIuUjOo10IT/VyGg6hXSPR4ROm
 3eC68pRisrEJDHQJIq9cvRlSgSS4pR/SeWPXZj+HOmUCZYEiKJ64+r/aVfvhqfvINTloVQsnsJ
 61U=
Received: from cvenusqemu.hgst.com ([10.202.66.73])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2019 11:47:16 -0700
From: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To: linux-block@vger.kernel.org
Date: Mon,  8 Jul 2019 11:47:02 -0700
Message-Id: <20190708184711.2984-1-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.17.0
Subject: [Xen-devel] [PATCH V4 0/9] block: use right accessor to read
 nr_sects
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
Cc: damien.lemoal@wdc.com, linux-btrace@vger.kernel.org, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, konrad.wilk@oracle.com,
 Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>, yuchao0@huawei.com,
 colyli@suse.de, linux-bcache@vger.kernel.org, jaegeuk@kernel.org,
 xen-devel@lists.xenproject.org, kent.overstreet@gmail.com,
 roger.pau@citrix.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpJbiB0aGUgYmxrLXpvbmVkLCBiY2FjaGUsIGYyZnMsIHRhcmdldC1wc2NzaSwgeGVuIGFu
ZCBibGt0cmFjZQppbXBsZW1lbnRhdGlvbiBibG9jayBkZXZpY2UtPmhkX3BhcnQtPm51bWJlciBv
ZiBzZWN0b3JzIGZpZWxkIGlzCmFjY2Vzc2VkIGRpcmVjdGx5IHdpdGhvdXQgYW55IGFwcHJvcHJp
YXRlIGxvY2tpbmcgb3IgYWNjZXNzb3IgZnVuY3Rpb24uIApUaGVyZSBpcyBhbiBleGlzdGluZyBh
Y2Nlc3NvciBmdW5jdGlvbiBwcmVzZW50IGluIHRoZSBpbiAKaW5jbHVkZS9saW51eC9nZW5oZC5o
IHdoaWNoIHNob3VsZCBiZSB1c2VkIHRvIHJlYWQgdGhlCmJkZXYtPmhkX3BhcnQtPm5yX3NlY3Rz
LgoKRnJvbSAke0tFUk5fRElSfS9pbmNsdWRlL2xpbnV4L2dlbmhkLmg6LQo8c25pcD4KNzE0IC8q
CjcxNSAgKiBBbnkgYWNjZXNzIG9mIHBhcnQtPm5yX3NlY3RzIHdoaWNoIGlzIG5vdCBwcm90ZWN0
ZWQgYnkgcGFydGl0aW9uCjcxNiAgKiBiZF9tdXRleCBvciBnZW5kaXNrIGJkZXYgYmRfbXV0ZXgs
IHNob3VsZCBiZSBkb25lIHVzaW5nIHRoaXMKNzE3ICAqIGFjY2Vzc29yIGZ1bmN0aW9uLgo3MTgg
ICoKNzE5ICAqIENvZGUgd3JpdHRlbiBhbG9uZyB0aGUgbGluZXMgb2YgaV9zaXplX3JlYWQoKSBh
bmQgaV9zaXplX3dyaXRlKCkuCjcyMCAgKiBDT05GSUdfUFJFRU1QVCBjYXNlIG9wdGltaXplcyB0
aGUgY2FzZSBvZiBVUCBrZXJuZWwgd2l0aCBwcmVlbXB0aW9uCjcyMSAgKiBvbi4KNzIyICAqLwo3
MjMgc3RhdGljIGlubGluZSBzZWN0b3JfdCBwYXJ0X25yX3NlY3RzX3JlYWQoc3RydWN0IGhkX3N0
cnVjdCAqcGFydCkKNzI0IHsKPHNuaXA+CgpUaGlzIHBhdGNoIHNlcmllcyBpbnRyb2R1Y2VzIGEg
aGVscGVyIGZ1bmN0aW9uIG9uIHRoZSB0b3Agb2YgdGhlCnBhcnRfbnJfc2VjdHNfcmVhZCgpIGFu
ZCByZW1vdmVzIHRoZSBhbGwgZGlyZWN0IGFjY2Vzc2VzIHRvIHRoZQpiZGV2LT5oZF9wYXJ0LT5u
cl9zZWN0cy4KClRoaXMgc2VyaWVzIGlzIGJhc2VkIG9uIDotCgoxLiBSZXBvIDotCiAgIGdpdDov
L2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9heGJvZS9saW51eC1ibG9j
ay5naXQuCjIuIEJyYW5jaCA6LSBmb3ItbmV4dC4KClBsZWFzZSBjb25zaWRlciB0aGlzIGZvciA1
LjMuCgpDaGFuZ2VzIGZyb20gVjM6LQoKMS4gR2V0IHJpZCBvZiB0aGUgY29tbWVudCBpbiB0aGUg
MXN0IHBhdGNoIGZvciBoZWxwZXIuIChCYXJ0KQoKQ2hhaXRhbnlhIEt1bGthcm5pICg5KToKICBi
bG9jazogYWRkIGEgaGVscGVyIGZ1bmN0aW9uIHRvIHJlYWQgbnJfc2V0Y3MKICBibGstem9uZWQ6
IHVwZGF0ZSBibGtkZXZfbnJfem9uZXMoKSB3aXRoIGhlbHBlcgogIGJsay16b25lZDogdXBkYXRl
IGJsa2Rldl9yZXBvcnRfem9uZSgpIHdpdGggaGVscGVyCiAgYmxrLXpvbmVkOiB1cGRhdGUgYmxr
ZGV2X3Jlc2V0X3pvbmVzKCkgd2l0aCBoZWxwZXIKICBiY2FjaGU6IHVwZGF0ZSBjYWNoZWRfZGV2
X2luaXQoKSB3aXRoIGhlbHBlcgogIGYyZnM6IHVzZSBoZWxwZXIgaW4gaW5pdF9ibGt6X2luZm8o
KQogIGJsa3RyYWNlOiB1c2UgaGVscGVyIGluIGJsa190cmFjZV9zZXR1cF9sYmEoKQogIHRhcmdl
dC9wc2NzaTogdXNlIGhlbHBlciBpbiBwc2NzaV9nZXRfYmxvY2tzKCkKICB4ZW4vYmxrYmFjazog
dXNlIGhlbHBlciBpbiB2YmRfc3ooKQoKIGJsb2NrL2Jsay16b25lZC5jICAgICAgICAgICAgICAg
ICAgfCAxMiArKysrKystLS0tLS0KIGRyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2svY29tbW9uLmgg
fCAgMiArLQogZHJpdmVycy9tZC9iY2FjaGUvc3VwZXIuYyAgICAgICAgICB8ICAyICstCiBkcml2
ZXJzL3RhcmdldC90YXJnZXRfY29yZV9wc2NzaS5jIHwgIDIgKy0KIGZzL2YyZnMvc3VwZXIuYyAg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQogaW5jbHVkZS9saW51eC9ibGtkZXYuaCAgICAgICAg
ICAgICB8ICA1ICsrKysrCiBrZXJuZWwvdHJhY2UvYmxrdHJhY2UuYyAgICAgICAgICAgIHwgIDIg
Ky0KIDcgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgot
LSAKMi4xNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
