Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA4094BFC
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 19:46:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzlh0-0007cG-BM; Mon, 19 Aug 2019 17:43:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8TEA=WP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1hzlgz-0007c9-DT
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 17:43:41 +0000
X-Inumbo-ID: e1768f58-c2a8-11e9-a661-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1768f58-c2a8-11e9-a661-bc764e2007e4;
 Mon, 19 Aug 2019 17:43:40 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.xilinx.com
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E995822CE9;
 Mon, 19 Aug 2019 17:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566236620;
 bh=844nyVFBsPArCfQb/Y6AXHrw7gwHIR98vGwgWYnfApo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zl/DCfADQSa0bYPxF4qS2YfSk6k1u5KP2BtGDcqeWXpTqLTmwIfMf1cCX6QV2oJDJ
 eo2sCr84I0ztezaa/Hc1lPjXEf9DjcLTgLs3FEkm1Rtgnx8WvqHpmN6m3tLPw/zyN2
 76zLZzc72i8OQ2PAexA4kxGXoKSvge7wMkCCjMwo=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Date: Mon, 19 Aug 2019 10:43:31 -0700
Message-Id: <20190819174338.10466-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.1908191011060.20094@sstabellini-ThinkPad-T480s>
Subject: [Xen-devel] [PATCH v7 1/8] xen/arm: pass node to
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
aGUgbm9kZSB0bwpzdGFydCB0aGUgc2VhcmNoIGZyb20uCgpUbyBhdm9pZCBzY2FubmluZyBkZXZp
Y2UgdHJlZSwgYW5kIGdpdmVuIHRoYXQgd2Ugb25seSBjYXJlIGFib3V0CnJlbGF0aXZlIGluY3Jl
bWVudHMgb2YgZGVwdGggY29tcGFyZWQgdG8gdGhlIGRlcHRoIG9mIHRoZSBpbml0aWFsIG5vZGUs
CndlIHNldCB0aGUgaW5pdGlhbCBkZXB0aCB0byAwLiBUaGVuLCB3ZSBjYWxsIGZ1bmMoKSBmb3Ig
ZXZlcnkgbm9kZSB3aXRoCmRlcHRoID4gMC4KCkRvbid0IGNhbGwgZnVuYygpIG9uIHRoZSBwYXJl
bnQgbm9kZSBwYXNzZWQgYXMgYW4gYXJndW1lbnQuIENsYXJpZnkgdGhlCmNoYW5nZSBpbiB0aGUg
Y29tbWVudCBvbiB0b3Agb2YgdGhlIGZ1bmN0aW9uLiBUaGUgY3VycmVudCBjYWxsZXJzIHBhc3MK
dGhlIHJvb3Qgbm9kZSBhcyBhcmd1bWVudDogaXQgaXMgT0sgdG8gc2tpcCB0aGUgcm9vdCBub2Rl
IGJlY2F1c2Ugbm8KcmVsZXZhbnQgcHJvcGVydGllcyBhcmUgaW4gaXQsIG9ubHkgc3Vibm9kZXMu
CgpTaWduZWQtb2ZmLWJ5OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHN0ZWZhbm9zQHhpbGlueC5jb20+
Ci0tLQpDaGFuZ2VzIGluIHY3OgotIGZpeCBjb21taXQgbWVzc2FnZQotIHVzZSBjb25zdAotIGlu
aXQgZGVwdGggYW5kIG1pbl9kZXB0aCB0byAwCgpDaGFuZ2VzIGluIHY2OgotIGZpeCBjb2RlIHN0
eWxlCi0gZG9uJ3QgY2FsbCBmdW5jKCkgb24gdGhlIGZpcnN0IG5vZGUKCkNoYW5nZXMgaW4gdjU6
Ci0gZ28gYmFjayB0byB2MwotIGNvZGUgc3R5bGUgaW1wcm92ZW1lbnQgaW4gYWNwaS9ib290LmMK
LSBpbXByb3ZlIGNvbW1lbnRzIGFuZCBjb21taXQgbWVzc2FnZQotIGluY3JlYXNlIG1pbl9kZXB0
aCB0byBhdm9pZCBwYXJzaW5nIHNpYmxpbmdzCi0gcmVwbGFjZSBmb3Igd2l0aCBkby93aGlsZSBs
b29wIGFuZCBpbmNyZWFzZSBtaW5fZGVwdGggdG8gYXZvaWQKICBzY2FubmluZyBzaWJsaW5ncyBv
ZiB0aGUgaW5pdGlhbCBub2RlCi0gcGFzcyBvbmx5IG5vZGUsIGNhbGN1bGF0ZSBkZXB0aAoKQ2hh
bmdlcyBpbiB2MzoKLSBpbXByb3ZlIGNvbW1pdCBtZXNzYWdlCi0gaW1wcm92ZSBpbi1jb2RlIGNv
bW1lbnRzCi0gaW1wcm92ZSBjb2RlIHN0eWxlCgpDaGFuZ2VzIGluIHYyOgotIG5ldwotLS0KIHhl
bi9hcmNoL2FybS9hY3BpL2Jvb3QuYyAgICAgIHwgIDggKysrKystLS0KIHhlbi9hcmNoL2FybS9i
b290ZmR0LmMgICAgICAgIHwgMzggKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0K
IHhlbi9pbmNsdWRlL3hlbi9kZXZpY2VfdHJlZS5oIHwgIDYgKysrLS0tCiAzIGZpbGVzIGNoYW5n
ZWQsIDMyIGluc2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL2FybS9hY3BpL2Jvb3QuYyBiL3hlbi9hcmNoL2FybS9hY3BpL2Jvb3QuYwppbmRleCA5YjI5
NzY5YTEwLi5iZjljNzhiMDJjIDEwMDY0NAotLS0gYS94ZW4vYXJjaC9hcm0vYWNwaS9ib290LmMK
KysrIGIveGVuL2FyY2gvYXJtL2FjcGkvYm9vdC5jCkBAIC0yNDYsOSArMjQ2LDExIEBAIGludCBf
X2luaXQgYWNwaV9ib290X3RhYmxlX2luaXQodm9pZCkKICAgICAgKiAtIHRoZSBkZXZpY2UgdHJl
ZSBpcyBub3QgZW1wdHkgKGl0IGhhcyBtb3JlIHRoYW4ganVzdCBhIC9jaG9zZW4gbm9kZSkKICAg
ICAgKiAgIGFuZCBBQ1BJIGhhcyBub3QgYmVlbiBmb3JjZSBlbmFibGVkIChhY3BpPWZvcmNlKQog
ICAgICAqLwotICAgIGlmICggcGFyYW1fYWNwaV9vZmYgfHwgKCAhcGFyYW1fYWNwaV9mb3JjZQot
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmJiBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2Rl
KGRldmljZV90cmVlX2ZsYXR0ZW5lZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGR0X3NjYW5fZGVwdGgxX25vZGVzLCBOVUxMKSkpCisgICAgaWYg
KCBwYXJhbV9hY3BpX29mZikKKyAgICAgICAgZ290byBkaXNhYmxlOworICAgIGlmICggIXBhcmFt
X2FjcGlfZm9yY2UgJiYKKyAgICAgICAgIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoZGV2aWNl
X3RyZWVfZmxhdHRlbmVkLCAwLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
dF9zY2FuX2RlcHRoMV9ub2RlcywgTlVMTCkgKQogICAgICAgICBnb3RvIGRpc2FibGU7CiAKICAg
ICAvKgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gvYXJtL2Jvb3RmZHQuYyBiL3hlbi9hcmNoL2FybS9i
b290ZmR0LmMKaW5kZXggODkxYjRiNjZmZi4uMGNhM2MyMGYwNSAxMDA2NDQKLS0tIGEveGVuL2Fy
Y2gvYXJtL2Jvb3RmZHQuYworKysgYi94ZW4vYXJjaC9hcm0vYm9vdGZkdC5jCkBAIC03NSw5ICs3
NSwxMCBAQCBzdGF0aWMgdTMyIF9faW5pdCBkZXZpY2VfdHJlZV9nZXRfdTMyKGNvbnN0IHZvaWQg
KmZkdCwgaW50IG5vZGUsCiB9CiAKIC8qKgotICogZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSAt
IGl0ZXJhdGUgb3ZlciBhbGwgZGV2aWNlIHRyZWUgbm9kZXMKKyAqIGRldmljZV90cmVlX2Zvcl9l
YWNoX25vZGUgLSBpdGVyYXRlIG92ZXIgYWxsIGRldmljZSB0cmVlIHN1Yi1ub2RlcwogICogQGZk
dDogZmxhdCBkZXZpY2UgdHJlZS4KLSAqIEBmdW5jOiBmdW5jdGlvbiB0byBjYWxsIGZvciBlYWNo
IG5vZGUuCisgKiBAbm9kZTogcGFyZW50IG5vZGUgdG8gc3RhcnQgdGhlIHNlYXJjaCBmcm9tCisg
KiBAZnVuYzogZnVuY3Rpb24gdG8gY2FsbCBmb3IgZWFjaCBzdWItbm9kZS4KICAqIEBkYXRhOiBk
YXRhIHRvIHBhc3MgdG8gQGZ1bmMuCiAgKgogICogQW55IG5vZGVzIG5lc3RlZCBhdCBERVZJQ0Vf
VFJFRV9NQVhfREVQVEggb3IgZGVlcGVyIGFyZSBpZ25vcmVkLgpAQCAtODUsMjAgKzg2LDIyIEBA
IHN0YXRpYyB1MzIgX19pbml0IGRldmljZV90cmVlX2dldF91MzIoY29uc3Qgdm9pZCAqZmR0LCBp
bnQgbm9kZSwKICAqIFJldHVybnMgMCBpZiBhbGwgbm9kZXMgd2VyZSBpdGVyYXRlZCBvdmVyIHN1
Y2Nlc3NmdWxseS4gIElmIEBmdW5jCiAgKiByZXR1cm5zIGEgdmFsdWUgZGlmZmVyZW50IGZyb20g
MCwgdGhhdCB2YWx1ZSBpcyByZXR1cm5lZCBpbW1lZGlhdGVseS4KICAqLwotaW50IF9faW5pdCBk
ZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwKK2ludCBfX2luaXQgZGV2
aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShjb25zdCB2b2lkICpmZHQsIGludCBub2RlLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90cmVlX25vZGVfZnVuYyBmdW5j
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpCiB7Ci0g
ICAgaW50IG5vZGU7Ci0gICAgaW50IGRlcHRoOworICAgIC8qCisgICAgICogV2Ugb25seSBjYXJl
IGFib3V0IHJlbGF0aXZlIGRlcHRoIGluY3JlbWVudHMsIGFzc3VtZSBkZXB0aCBvZgorICAgICAq
IG5vZGUgaXMgMCBmb3Igc2ltcGxpY2l0eS4KKyAgICAgKi8KKyAgICBpbnQgZGVwdGggPSAwOwor
ICAgIGNvbnN0IGludCBtaW5fZGVwdGggPSBkZXB0aDsKKyAgICBjb25zdCBpbnQgZmlyc3Rfbm9k
ZSA9IG5vZGU7CiAgICAgdTMyIGFkZHJlc3NfY2VsbHNbREVWSUNFX1RSRUVfTUFYX0RFUFRIXTsK
ICAgICB1MzIgc2l6ZV9jZWxsc1tERVZJQ0VfVFJFRV9NQVhfREVQVEhdOwogICAgIGludCByZXQ7
CiAKLSAgICBmb3IgKCBub2RlID0gMCwgZGVwdGggPSAwOwotICAgICAgICAgIG5vZGUgPj0wICYm
IGRlcHRoID49IDA7Ci0gICAgICAgICAgbm9kZSA9IGZkdF9uZXh0X25vZGUoZmR0LCBub2RlLCAm
ZGVwdGgpICkKLSAgICB7CisgICAgZG8gewogICAgICAgICBjb25zdCBjaGFyICpuYW1lID0gZmR0
X2dldF9uYW1lKGZkdCwgbm9kZSwgTlVMTCk7CiAgICAgICAgIHUzMiBhcywgc3M7CiAKQEAgLTEx
NywxMCArMTIwLDE3IEBAIGludCBfX2luaXQgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZShjb25z
dCB2b2lkICpmZHQsCiAgICAgICAgIHNpemVfY2VsbHNbZGVwdGhdID0gZGV2aWNlX3RyZWVfZ2V0
X3UzMihmZHQsIG5vZGUsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiI3NpemUtY2VsbHMiLCBzcyk7CiAKLSAgICAgICAgcmV0ID0gZnVuYyhmZHQsIG5v
ZGUsIG5hbWUsIGRlcHRoLCBhcywgc3MsIGRhdGEpOwotICAgICAgICBpZiAoIHJldCAhPSAwICkK
LSAgICAgICAgICAgIHJldHVybiByZXQ7Ci0gICAgfQorICAgICAgICAvKiBza2lwIHRoZSBmaXJz
dCBub2RlICovCisgICAgICAgIGlmICggbm9kZSAhPSBmaXJzdF9ub2RlICkKKyAgICAgICAgewor
ICAgICAgICAgICAgcmV0ID0gZnVuYyhmZHQsIG5vZGUsIG5hbWUsIGRlcHRoLCBhcywgc3MsIGRh
dGEpOworICAgICAgICAgICAgaWYgKCByZXQgIT0gMCApCisgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKKyAgICAgICAgfQorCisgICAgICAgIG5vZGUgPSBmZHRfbmV4dF9ub2RlKGZkdCwgbm9k
ZSwgJmRlcHRoKTsKKyAgICB9IHdoaWxlICggbm9kZSA+PSAwICYmIGRlcHRoID4gbWluX2RlcHRo
ICk7CisKICAgICByZXR1cm4gMDsKIH0KIApAQCAtMzU3LDcgKzM2Nyw3IEBAIHNpemVfdCBfX2lu
aXQgYm9vdF9mZHRfaW5mbyhjb25zdCB2b2lkICpmZHQsIHBhZGRyX3QgcGFkZHIpCiAKICAgICBh
ZGRfYm9vdF9tb2R1bGUoQk9PVE1PRF9GRFQsIHBhZGRyLCBmZHRfdG90YWxzaXplKGZkdCksIGZh
bHNlKTsKIAotICAgIGRldmljZV90cmVlX2Zvcl9lYWNoX25vZGUoKHZvaWQgKilmZHQsIGVhcmx5
X3NjYW5fbm9kZSwgTlVMTCk7CisgICAgZGV2aWNlX3RyZWVfZm9yX2VhY2hfbm9kZSgodm9pZCAq
KWZkdCwgMCwgZWFybHlfc2Nhbl9ub2RlLCBOVUxMKTsKICAgICBlYXJseV9wcmludF9pbmZvKCk7
CiAKICAgICByZXR1cm4gZmR0X3RvdGFsc2l6ZShmZHQpOwpkaWZmIC0tZ2l0IGEveGVuL2luY2x1
ZGUveGVuL2RldmljZV90cmVlLmggYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaAppbmRl
eCA4MzE1NjI5N2UyLi45YTdhOGYyZGFiIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS94ZW4vZGV2
aWNlX3RyZWUuaAorKysgYi94ZW4vaW5jbHVkZS94ZW4vZGV2aWNlX3RyZWUuaApAQCAtMTU4LDkg
KzE1OCw5IEBAIHR5cGVkZWYgaW50ICgqZGV2aWNlX3RyZWVfbm9kZV9mdW5jKShjb25zdCB2b2lk
ICpmZHQsCiAKIGV4dGVybiBjb25zdCB2b2lkICpkZXZpY2VfdHJlZV9mbGF0dGVuZWQ7CiAKLWlu
dCBkZXZpY2VfdHJlZV9mb3JfZWFjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwKLSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHJlZV9ub2RlX2Z1bmMgZnVuYywKLSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpkYXRhKTsKK2ludCBkZXZp
Y2VfdHJlZV9mb3JfZWFjaF9ub2RlKGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGUsCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHJlZV9ub2RlX2Z1bmMgZnVuYywKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKmRhdGEpOwogCiAvKioKICAqIGR0X3VuZmxh
dHRlbl9ob3N0X2RldmljZV90cmVlIC0gVW5mbGF0dGVuIHRoZSBob3N0IGRldmljZSB0cmVlCi0t
IAoyLjE3LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
