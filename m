Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E0410177
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 23:09:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLZxs-0000MI-VW; Tue, 30 Apr 2019 21:07:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8ZiC=TA=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hLZxr-0000MB-S2
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 21:06:59 +0000
X-Inumbo-ID: 54c6d320-6b8b-11e9-87ac-1fc2ba82c803
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 54c6d320-6b8b-11e9-87ac-1fc2ba82c803;
 Tue, 30 Apr 2019 21:02:58 +0000 (UTC)
Received: from sstabellini-ThinkPad-X260.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A80D217D6;
 Tue, 30 Apr 2019 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556658177;
 bh=mDmgj+zPtn+AKbS1JChR6ZLHxHQ50ygJNrJz20vO0xg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G1zVapUaz3Gcdm8KW4Ra9Oi5o7mb+biWzQbiNRaGneGWmdpjVpKK6VRwog6VqK91e
 qP45ApnVMnANuYI1dnpz7o/9xVbgpWBRYBndf5ET6AI+KJ6y6noUK6bAHevXnZOY6Z
 MG0ysSfZVcCVraZWa0+HKKpNcFnjpvjsj0w2dac4=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Tue, 30 Apr 2019 14:02:48 -0700
Message-Id: <1556658172-8824-6-git-send-email-sstabellini@kernel.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
Subject: [Xen-devel] [PATCH v2 06/10] xen/arm: extend
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
 sstabellini@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

QWRkIHR3byBuZXcgcGFyYW10ZXJzIHRvIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGU6IG5vZGUg
YW5kIGRlcHRoLgpOb2RlIGlzIHRoZSBub2RlIHRvIHN0YXJ0IHRoZSBzZWFyY2ggZnJvbSBhbmQg
ZGVwdGggaXMgdGhlIG1pbiBkZXB0aCBvZgp0aGUgc2VhcmNoLgoKUGFzc2luZyAwLCAwIHRyaWdn
ZXJzIHRoZSBvbGQgYmVoYXZpb3IuCgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkg
PHN0ZWZhbm9zQHhpbGlueC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIG5ldwotLS0KIHhlbi9h
cmNoL2FybS9hY3BpL2Jvb3QuYyAgICAgIHwgIDIgKy0KIHhlbi9hcmNoL2FybS9ib290ZmR0LmMg
ICAgICAgIHwgMTIgKysrKysrLS0tLS0tCiB4ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaCB8
ICA1ICsrKy0tCiAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jIGIveGVuL2FyY2gvYXJt
L2FjcGkvYm9vdC5jCmluZGV4IDliMjk3NjkuLmNmYzg1YzIgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNo
L2FybS9hY3BpL2Jvb3QuYworKysgYi94ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMKQEAgLTI0OCw3
ICsyNDgsNyBAQCBpbnQgX19pbml0IGFjcGlfYm9vdF90YWJsZV9pbml0KHZvaWQpCiAgICAgICov
CiAgICAgaWYgKCBwYXJhbV9hY3BpX29mZiB8fCAoICFwYXJhbV9hY3BpX2ZvcmNlCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICYmIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoZGV2aWNl
X3RyZWVfZmxhdHRlbmVkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgZHRfc2Nhbl9kZXB0aDFfbm9kZXMsIE5VTEwpKSkKKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDAsIDAsIGR0X3NjYW5fZGVwdGgxX25vZGVzLCBOVUxMKSkpCiAg
ICAgICAgIGdvdG8gZGlzYWJsZTsKIAogICAgIC8qCmRpZmYgLS1naXQgYS94ZW4vYXJjaC9hcm0v
Ym9vdGZkdC5jIGIveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYwppbmRleCA4OTFiNGI2Li5lN2IwOGVk
IDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCisrKyBiL3hlbi9hcmNoL2FybS9i
b290ZmR0LmMKQEAgLTc3LDYgKzc3LDggQEAgc3RhdGljIHUzMiBfX2luaXQgZGV2aWNlX3RyZWVf
Z2V0X3UzMihjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAogLyoqCiAgKiBkZXZpY2VfdHJlZV9m
b3JfZWFjaF9ub2RlIC0gaXRlcmF0ZSBvdmVyIGFsbCBkZXZpY2UgdHJlZSBub2RlcwogICogQGZk
dDogZmxhdCBkZXZpY2UgdHJlZS4KKyAqIEBub2RlOiBub2RlIHRvIHN0YXJ0IHRoZSBzZWFyY2gg
ZnJvbQorICogQGRlcHRoOiBtaW4gZGVwdGggb2YgdGhlIHNlYXJjaAogICogQGZ1bmM6IGZ1bmN0
aW9uIHRvIGNhbGwgZm9yIGVhY2ggbm9kZS4KICAqIEBkYXRhOiBkYXRhIHRvIHBhc3MgdG8gQGZ1
bmMuCiAgKgpAQCAtODYsMTcgKzg4LDE1IEBAIHN0YXRpYyB1MzIgX19pbml0IGRldmljZV90cmVl
X2dldF91MzIoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZSwKICAqIHJldHVybnMgYSB2YWx1ZSBk
aWZmZXJlbnQgZnJvbSAwLCB0aGF0IHZhbHVlIGlzIHJldHVybmVkIGltbWVkaWF0ZWx5LgogICov
CiBpbnQgX19pbml0IGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoY29uc3Qgdm9pZCAqZmR0LAor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBub2RlLCBpbnQgZGVwdGgs
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3RyZWVfbm9kZV9m
dW5jIGZ1bmMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqZGF0
YSkKIHsKLSAgICBpbnQgbm9kZTsKLSAgICBpbnQgZGVwdGg7CiAgICAgdTMyIGFkZHJlc3NfY2Vs
bHNbREVWSUNFX1RSRUVfTUFYX0RFUFRIXTsKICAgICB1MzIgc2l6ZV9jZWxsc1tERVZJQ0VfVFJF
RV9NQVhfREVQVEhdOwotICAgIGludCByZXQ7CisgICAgaW50IHJldCwgbWluX2RlcHRoID0gZGVw
dGg7CiAKLSAgICBmb3IgKCBub2RlID0gMCwgZGVwdGggPSAwOwotICAgICAgICAgIG5vZGUgPj0w
ICYmIGRlcHRoID49IDA7CisgICAgZm9yICggOyBub2RlID49MCAmJiBkZXB0aCA+PSBtaW5fZGVw
dGg7CiAgICAgICAgICAgbm9kZSA9IGZkdF9uZXh0X25vZGUoZmR0LCBub2RlLCAmZGVwdGgpICkK
ICAgICB7CiAgICAgICAgIGNvbnN0IGNoYXIgKm5hbWUgPSBmZHRfZ2V0X25hbWUoZmR0LCBub2Rl
LCBOVUxMKTsKQEAgLTM1Nyw3ICszNTcsNyBAQCBzaXplX3QgX19pbml0IGJvb3RfZmR0X2luZm8o
Y29uc3Qgdm9pZCAqZmR0LCBwYWRkcl90IHBhZGRyKQogCiAgICAgYWRkX2Jvb3RfbW9kdWxlKEJP
T1RNT0RfRkRULCBwYWRkciwgZmR0X3RvdGFsc2l6ZShmZHQpLCBmYWxzZSk7CiAKLSAgICBkZXZp
Y2VfdHJlZV9mb3JfZWFjaF9ub2RlKCh2b2lkICopZmR0LCBlYXJseV9zY2FuX25vZGUsIE5VTEwp
OworICAgIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoKHZvaWQgKilmZHQsIDAsIDAsIGVhcmx5
X3NjYW5fbm9kZSwgTlVMTCk7CiAgICAgZWFybHlfcHJpbnRfaW5mbygpOwogCiAgICAgcmV0dXJu
IGZkdF90b3RhbHNpemUoZmR0KTsKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3hlbi9kZXZpY2Vf
dHJlZS5oIGIveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgKaW5kZXggNzQwOGE2Yy4uNGZm
NzhiYSAxMDA2NDQKLS0tIGEveGVuL2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgKKysrIGIveGVu
L2luY2x1ZGUveGVuL2RldmljZV90cmVlLmgKQEAgLTE1OSw4ICsxNTksOSBAQCB0eXBlZGVmIGlu
dCAoKmRldmljZV90cmVlX25vZGVfZnVuYykoY29uc3Qgdm9pZCAqZmR0LAogZXh0ZXJuIGNvbnN0
IHZvaWQgKmRldmljZV90cmVlX2ZsYXR0ZW5lZDsKIAogaW50IGRldmljZV90cmVlX2Zvcl9lYWNo
X25vZGUoY29uc3Qgdm9pZCAqZmR0LAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGRldmljZV90cmVlX25vZGVfZnVuYyBmdW5jLAotICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHZvaWQgKmRhdGEpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IG5vZGUsIGludCBkZXB0aCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldmlj
ZV90cmVlX25vZGVfZnVuYyBmdW5jLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9p
ZCAqZGF0YSk7CiAKIC8qKgogICogZHRfdW5mbGF0dGVuX2hvc3RfZGV2aWNlX3RyZWUgLSBVbmZs
YXR0ZW4gdGhlIGhvc3QgZGV2aWNlIHRyZWUKLS0gCjEuOS4xCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
