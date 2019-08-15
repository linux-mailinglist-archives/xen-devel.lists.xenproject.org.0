Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD758F7AF
	for <lists+xen-devel@lfdr.de>; Fri, 16 Aug 2019 01:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hyPI8-0004Wo-RW; Thu, 15 Aug 2019 23:36:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HmHk=WL=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hyPI7-0004Vy-Fi
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2019 23:36:23 +0000
X-Inumbo-ID: 7d63366a-bfb5-11e9-813a-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d63366a-bfb5-11e9-813a-bc764e2007e4;
 Thu, 15 Aug 2019 23:36:22 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 011BF206C2;
 Thu, 15 Aug 2019 23:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565912182;
 bh=kdoEydHJ0lAk4rl0w+kwY2uJo4+7v9YoaAYrixw9Gq4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mcTEsALRqmKKpF0hkKIw8+OkYF9f4B55o037GRD/lE1nyV/6Xy//SjYpyrSoyPKLT
 f/d+B8ME2HFIzabV7A7Kw6ab/SGmbgDbMn1eTIS0HjqtnwFld2j5kTSfV2UB6Ur8cK
 FuVvCvb/tZTSkxUfrdTvA+g85E2c/QnoJd4NksbQ=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Thu, 15 Aug 2019 16:36:11 -0700
Message-Id: <20190815233618.31630-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908151634170.8737@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v6 1/8] xen/arm: pass node to
 device_tree_for_each_node
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, julien.grall@arm.com,
 sstabellini@kernel.org, Volodymyr_Babchuk@epam.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIGEgbmV3IHBhcmFtZXRlciB0byBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlOiBub2RlLCB0
aGUgbm9kZSB0bwpzdGFydCB0aGUgc2VhcmNoIGZyb20uIFBhc3NpbmcgMCB0cmlnZ2VycyB0aGUg
b2xkIGJlaGF2aW9yLgoKU2V0IG1pbl9kZXB0aCB0byBkZXB0aCBvZiB0aGUgY3VycmVudCBub2Rl
ICsgMSB0byBhdm9pZCBzY2FubmluZwpzaWJsaW5ncyBvZiB0aGUgaW5pdGlhbCBub2RlIHBhc3Nl
ZCBhcyBhbiBhcmd1bWVudC4KCkRvbid0IGNhbGwgZnVuYygpIG9uIHRoZSBwYXJlbnQgbm9kZSBw
YXNzZWQgYXMgYW4gYXJndW1lbnQuIENsYXJpZnkgdGhlCmNoYW5nZSBpbiB0aGUgY29tbWVudCBv
biB0b3Agb2YgdGhlIGZ1bmN0aW9uLgoKU2lnbmVkLW9mZi1ieTogU3RlZmFubyBTdGFiZWxsaW5p
IDxzdGVmYW5vc0B4aWxpbnguY29tPgotLS0KQ2hhbmdlcyBpbiB2NjoKLSBmaXggY29kZSBzdHls
ZQotIGRvbid0IGNhbGwgZnVuYygpIG9uIHRoZSBmaXJzdCBub2RlCgpDaGFuZ2VzIGluIHY1Ogot
IGdvIGJhY2sgdG8gdjMKLSBjb2RlIHN0eWxlIGltcHJvdmVtZW50IGluIGFjcGkvYm9vdC5jCi0g
aW1wcm92ZSBjb21tZW50cyBhbmQgY29tbWl0IG1lc3NhZ2UKLSBpbmNyZWFzZSBtaW5fZGVwdGgg
dG8gYXZvaWQgcGFyc2luZyBzaWJsaW5ncwotIHJlcGxhY2UgZm9yIHdpdGggZG8vd2hpbGUgbG9v
cCBhbmQgaW5jcmVhc2UgbWluX2RlcHRoIHRvIGF2b2lkCiAgc2Nhbm5pbmcgc2libGluZ3Mgb2Yg
dGhlIGluaXRpYWwgbm9kZQotIHBhc3Mgb25seSBub2RlLCBjYWxjdWxhdGUgZGVwdGgKCkNoYW5n
ZXMgaW4gdjM6Ci0gaW1wcm92ZSBjb21taXQgbWVzc2FnZQotIGltcHJvdmUgaW4tY29kZSBjb21t
ZW50cwotIGltcHJvdmUgY29kZSBzdHlsZQoKQ2hhbmdlcyBpbiB2MjoKLSBuZXcKLS0tCiB4ZW4v
YXJjaC9hcm0vYWNwaS9ib290LmMgICAgICB8ICA4ICsrKysrLS0tCiB4ZW4vYXJjaC9hcm0vYm9v
dGZkdC5jICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KIHhl
bi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIHwgIDYgKysrLS0tCiAzIGZpbGVzIGNoYW5nZWQs
IDI4IGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNo
L2FybS9hY3BpL2Jvb3QuYyBiL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYwppbmRleCA5YjI5NzY5
YTEwLi5iZjljNzhiMDJjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMKKysr
IGIveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jCkBAIC0yNDYsOSArMjQ2LDExIEBAIGludCBfX2lu
aXQgYWNwaV9ib290X3RhYmxlX2luaXQodm9pZCkKICAgICAgKiAtIHRoZSBkZXZpY2UgdHJlZSBp
cyBub3QgZW1wdHkgKGl0IGhhcyBtb3JlIHRoYW4ganVzdCBhIC9jaG9zZW4gbm9kZSkKICAgICAg
KiAgIGFuZCBBQ1BJIGhhcyBub3QgYmVlbiBmb3JjZSBlbmFibGVkIChhY3BpPWZvcmNlKQogICAg
ICAqLwotICAgIGlmICggcGFyYW1fYWNwaV9vZmYgfHwgKCAhcGFyYW1fYWNwaV9mb3JjZQotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmJiBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKGRl
dmljZV90cmVlX2ZsYXR0ZW5lZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGR0X3NjYW5fZGVwdGgxX25vZGVzLCBOVUxMKSkpCisgICAgaWYgKCBw
YXJhbV9hY3BpX29mZikKKyAgICAgICAgZ290byBkaXNhYmxlOworICAgIGlmICggIXBhcmFtX2Fj
cGlfZm9yY2UgJiYKKyAgICAgICAgIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoZGV2aWNlX3Ry
ZWVfZmxhdHRlbmVkLCAwLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkdF9z
Y2FuX2RlcHRoMV9ub2RlcywgTlVMTCkgKQogICAgICAgICBnb3RvIGRpc2FibGU7CiAKICAgICAv
KgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9ib290
ZmR0LmMKaW5kZXggODkxYjRiNjZmZi4uZjE2MTRlZjdmYyAxMDA2NDQKLS0tIGEveGVuL2FyY2gv
YXJtL2Jvb3RmZHQuYworKysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCkBAIC03NSw5ICs3NSwx
MCBAQCBzdGF0aWMgdTMyIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQgKmZk
dCwgaW50IG5vZGUsCiB9CiAKIC8qKgotICogZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSAtIGl0
ZXJhdGUgb3ZlciBhbGwgZGV2aWNlIHRyZWUgbm9kZXMKKyAqIGRldmljZV90cmVlX2Zvcl9lYWNo
X25vZGUgLSBpdGVyYXRlIG92ZXIgYWxsIGRldmljZSB0cmVlIHN1Yi1ub2RlcwogICogQGZkdDog
ZmxhdCBkZXZpY2UgdHJlZS4KLSAqIEBmdW5jOiBmdW5jdGlvbiB0byBjYWxsIGZvciBlYWNoIG5v
ZGUuCisgKiBAbm9kZTogcGFyZW50IG5vZGUgdG8gc3RhcnQgdGhlIHNlYXJjaCBmcm9tCisgKiBA
ZnVuYzogZnVuY3Rpb24gdG8gY2FsbCBmb3IgZWFjaCBzdWItbm9kZS4KICAqIEBkYXRhOiBkYXRh
IHRvIHBhc3MgdG8gQGZ1bmMuCiAgKgogICogQW55IG5vZGVzIG5lc3RlZCBhdCBERVZJQ0VfVFJF
RV9NQVhfREVQVEggb3IgZGVlcGVyIGFyZSBpZ25vcmVkLgpAQCAtODUsMjAgKzg2LDE4IEBAIHN0
YXRpYyB1MzIgX19pbml0IGRldmljZV90cmVlX2dldF91MzIoY29uc3Qgdm9pZCAqZmR0LCBpbnQg
bm9kZSwKICAqIFJldHVybnMgMCBpZiBhbGwgbm9kZXMgd2VyZSBpdGVyYXRlZCBvdmVyIHN1Y2Nl
c3NmdWxseS4gIElmIEBmdW5jCiAgKiByZXR1cm5zIGEgdmFsdWUgZGlmZmVyZW50IGZyb20gMCwg
dGhhdCB2YWx1ZSBpcyByZXR1cm5lZCBpbW1lZGlhdGVseS4KICAqLwotaW50IF9faW5pdCBkZXZp
Y2VfdHJlZV9mb3JfZWFjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwKK2ludCBfX2luaXQgZGV2aWNl
X3RyZWVfZm9yX2VhY2hfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90cmVlX25vZGVfZnVuYyBmdW5jLAog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCiB7Ci0gICAg
aW50IG5vZGU7Ci0gICAgaW50IGRlcHRoOworICAgIGludCBkZXB0aCA9IGZkdF9ub2RlX2RlcHRo
KGZkdCwgbm9kZSk7CisgICAgaW50IG1pbl9kZXB0aCA9IGRlcHRoICsgMTsKKyAgICBpbnQgZmly
c3Rfbm9kZSA9IG5vZGU7CiAgICAgdTMyIGFkZHJlc3NfY2VsbHNbREVWSUNFX1RSRUVfTUFYX0RF
UFRIXTsKICAgICB1MzIgc2l6ZV9jZWxsc1tERVZJQ0VfVFJFRV9NQVhfREVQVEhdOwogICAgIGlu
dCByZXQ7CiAKLSAgICBmb3IgKCBub2RlID0gMCwgZGVwdGggPSAwOwotICAgICAgICAgIG5vZGUg
Pj0wICYmIGRlcHRoID49IDA7Ci0gICAgICAgICAgbm9kZSA9IGZkdF9uZXh0X25vZGUoZmR0LCBu
b2RlLCAmZGVwdGgpICkKLSAgICB7CisgICAgZG8gewogICAgICAgICBjb25zdCBjaGFyICpuYW1l
ID0gZmR0X2dldF9uYW1lKGZkdCwgbm9kZSwgTlVMTCk7CiAgICAgICAgIHUzMiBhcywgc3M7CiAK
QEAgLTExNywxMCArMTE2LDE3IEBAIGludCBfX2luaXQgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9k
ZShjb25zdCB2b2lkICpmZHQsCiAgICAgICAgIHNpemVfY2VsbHNbZGVwdGhdID0gZGV2aWNlX3Ry
ZWVfZ2V0X3UzMihmZHQsIG5vZGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiI3NpemUtY2VsbHMiLCBzcyk7CiAKLSAgICAgICAgcmV0ID0gZnVuYyhm
ZHQsIG5vZGUsIG5hbWUsIGRlcHRoLCBhcywgc3MsIGRhdGEpOwotICAgICAgICBpZiAoIHJldCAh
PSAwICkKLSAgICAgICAgICAgIHJldHVybiByZXQ7Ci0gICAgfQorICAgICAgICAvKiBza2lwIHRo
ZSBmaXJzdCBub2RlICovCisgICAgICAgIGlmICggbm9kZSAhPSBmaXJzdF9ub2RlICkKKyAgICAg
ICAgeworICAgICAgICAgICAgcmV0ID0gZnVuYyhmZHQsIG5vZGUsIG5hbWUsIGRlcHRoLCBhcywg
c3MsIGRhdGEpOworICAgICAgICAgICAgaWYgKCByZXQgIT0gMCApCisgICAgICAgICAgICAgICAg
cmV0dXJuIHJldDsKKyAgICAgICAgfQorCisgICAgICAgIG5vZGUgPSBmZHRfbmV4dF9ub2RlKGZk
dCwgbm9kZSwgJmRlcHRoKTsKKyAgICB9IHdoaWxlICggbm9kZSA+PSAwICYmIGRlcHRoID49IG1p
bl9kZXB0aCApOworCiAgICAgcmV0dXJuIDA7CiB9CiAKQEAgLTM1Nyw3ICszNjMsNyBAQCBzaXpl
X3QgX19pbml0IGJvb3RfZmR0X2luZm8oY29uc3Qgdm9pZCAqZmR0LCBwYWRkcl90IHBhZGRyKQog
CiAgICAgYWRkX2Jvb3RfbW9kdWxlKEJPT1RNT0RfRkRULCBwYWRkciwgZmR0X3RvdGFsc2l6ZShm
ZHQpLCBmYWxzZSk7CiAKLSAgICBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKCh2b2lkICopZmR0
LCBlYXJseV9zY2FuX25vZGUsIE5VTEwpOworICAgIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUo
KHZvaWQgKilmZHQsIDAsIGVhcmx5X3NjYW5fbm9kZSwgTlVMTCk7CiAgICAgZWFybHlfcHJpbnRf
aW5mbygpOwogCiAgICAgcmV0dXJuIGZkdF90b3RhbHNpemUoZmR0KTsKZGlmZiAtLWdpdCBhL3hl
bi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIGIveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVl
LmgKaW5kZXggODMxNTYyOTdlMi4uOWE3YThmMmRhYiAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUv
eGVuL2RldmljZV90cmVlLmgKKysrIGIveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgKQEAg
LTE1OCw5ICsxNTgsOSBAQCB0eXBlZGVmIGludCAoKmRldmljZV90cmVlX25vZGVfZnVuYykoY29u
c3Qgdm9pZCAqZmR0LAogCiBleHRlcm4gY29uc3Qgdm9pZCAqZGV2aWNlX3RyZWVfZmxhdHRlbmVk
OwogCi1pbnQgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShjb25zdCB2b2lkICpmZHQsCi0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3RyZWVfbm9kZV9mdW5jIGZ1
bmMsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0YSk7Citp
bnQgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3RyZWVfbm9kZV9mdW5jIGZ1bmMs
CisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsKIAogLyoqCiAgKiBk
dF91bmZsYXR0ZW5faG9zdF9kZXZpY2VfdHJlZSAtIFVuZmxhdHRlbiB0aGUgaG9zdCBkZXZpY2Ug
dHJlZQotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
