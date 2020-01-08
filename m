Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AC41348FE
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2020 18:17:29 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipEv6-0000kF-8z; Wed, 08 Jan 2020 17:15:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=uSPe=25=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ipEv4-0000iy-QO
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2020 17:14:58 +0000
X-Inumbo-ID: 5af61a50-323a-11ea-b85f-12813bfff9fa
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5af61a50-323a-11ea-b85f-12813bfff9fa;
 Wed, 08 Jan 2020 17:14:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jan 2020 09:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,410,1571727600"; d="scan'208";a="395806105"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.132.23])
 by orsmga005.jf.intel.com with ESMTP; 08 Jan 2020 09:14:39 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed,  8 Jan 2020 09:14:06 -0800
Message-Id: <b3ae2ab43730b53cfe432439ce16788182ac34cd.1578503483.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578503483.git.tamas.lengyel@intel.com>
References: <cover.1578503483.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v4 09/18] x86/mem_sharing: Convert
 MEM_SHARING_DESTROY_GFN to a bool
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
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TUVNX1NIQVJJTkdfREVTVFJPWV9HRk4gaXMgdXNlZCBvbiB0aGUgJ2ZsYWdzJyBiaXRmaWVsZCBk
dXJpbmcgdW5zaGFyaW5nLgpIb3dldmVyLCB0aGUgYml0ZmllbGQgaXMgbm90IHVzZWQgZm9yIGFu
eXRoaW5nIGVsc2UsIHNvIGp1c3QgY29udmVydCBpdCB0byBhCmJvb2wgaW5zdGVhZC4KClNpZ25l
ZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+Ci0tLQog
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgICAgIHwgOSArKysrLS0tLS0KIHhlbi9pbmNs
dWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaCB8IDUgKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9t
bS9tZW1fc2hhcmluZy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKaW5kZXggODRi
OWYxMzBiOS4uMDQzNWE3ZjgwMyAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFy
aW5nLmMKKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTExODIsNyArMTE4
Miw3IEBAIGVycl9vdXQ6CiAgKi8KIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1
Y3QgZG9tYWluICpkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxv
bmcgZ2ZuLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGZsYWdzKQor
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZGVzdHJveSkKIHsKICAgICBwMm1f
dHlwZV90IHAybXQ7CiAgICAgbWZuX3QgbWZuOwpAQCAtMTIzOCw3ICsxMjM4LDcgQEAgaW50IF9f
bWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICogSWYgdGhl
IEdGTiBpcyBnZXR0aW5nIGRlc3Ryb3llZCBkcm9wIHRoZSByZWZlcmVuY2VzIHRvIE1GTgogICAg
ICAqIChwb3NzaWJseSBmcmVlaW5nIHRoZSBwYWdlKSwgYW5kIGV4aXQgZWFybHkuCiAgICAgICov
Ci0gICAgaWYgKCBmbGFncyAmIE1FTV9TSEFSSU5HX0RFU1RST1lfR0ZOICkKKyAgICBpZiAoIGRl
c3Ryb3kgKQogICAgIHsKICAgICAgICAgaWYgKCAhbGFzdF9nZm4gKQogICAgICAgICAgICAgbWVt
X3NoYXJpbmdfZ2ZuX2Rlc3Ryb3kocGFnZSwgZCwgZ2ZuX2luZm8pOwpAQCAtMTMyOSw5ICsxMzI5
LDggQEAgaW50IHJlbGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQpCiAgICAg
ICAgIG1mbiA9IHAybS0+Z2V0X2VudHJ5KHAybSwgX2dmbihnZm4pLCAmdCwgJmEsIDAsIE5VTEws
IE5VTEwpOwogICAgICAgICBpZiAoIG1mbl92YWxpZChtZm4pICYmIHAybV9pc19zaGFyZWQodCkg
KQogICAgICAgICB7Ci0gICAgICAgICAgICAvKiBEb2VzIG5vdCBmYWlsIHdpdGggRU5PTUVNIGdp
dmVuIHRoZSBERVNUUk9ZIGZsYWcgKi8KLSAgICAgICAgICAgIEJVR19PTihfX21lbV9zaGFyaW5n
X3Vuc2hhcmVfcGFnZSgKLSAgICAgICAgICAgICAgICAgICAgICAgZCwgZ2ZuLCBNRU1fU0hBUklO
R19ERVNUUk9ZX0dGTikpOworICAgICAgICAgICAgLyogRG9lcyBub3QgZmFpbCB3aXRoIEVOT01F
TSBnaXZlbiAiZGVzdHJveSIgaXMgc2V0IHRvIHRydWUgKi8KKyAgICAgICAgICAgIEJVR19PTihf
X21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShkLCBnZm4sIHRydWUpKTsKICAgICAgICAgICAgIC8q
CiAgICAgICAgICAgICAgKiBDbGVhciBvdXQgdGhlIHAybSBlbnRyeSBzbyBubyBvbmUgZWxzZSBt
YXkgdHJ5IHRvCiAgICAgICAgICAgICAgKiB1bnNoYXJlLiAgTXVzdCBzdWNjZWVkOiB3ZSBqdXN0
IHJlYWQgdGhlIG9sZCBlbnRyeSBhbmQKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYv
bWVtX3NoYXJpbmcuaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAppbmRleCAx
MzExNGI2MzQ2Li5jOTE1ZmQ5NzNmIDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21l
bV9zaGFyaW5nLmgKKysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCkBAIC03
NiwxNiArNzYsMTUgQEAgc3RydWN0IHBhZ2Vfc2hhcmluZ19pbmZvCiB1bnNpZ25lZCBpbnQgbWVt
X3NoYXJpbmdfZ2V0X25yX3NhdmVkX21mbnModm9pZCk7CiB1bnNpZ25lZCBpbnQgbWVtX3NoYXJp
bmdfZ2V0X25yX3NoYXJlZF9tZm5zKHZvaWQpOwogCi0jZGVmaW5lIE1FTV9TSEFSSU5HX0RFU1RS
T1lfR0ZOICAgICAgICgxPDwxKQogLyogT25seSBmYWlscyB3aXRoIC1FTk9NRU0uIEVuZm9yY2Ug
aXQgd2l0aCBhIEJVR19PTiB3cmFwcGVyLiAqLwogaW50IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9w
YWdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgbG9uZyBnZm4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3Qg
ZmxhZ3MpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZGVzdHJveSk7CiAK
IHN0YXRpYyBpbmxpbmUgaW50IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWlu
ICpkLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGxvbmcgZ2ZuKQogewotICAgIGludCByYyA9IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGQs
IGdmbiwgMCk7CisgICAgaW50IHJjID0gX19tZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UoZCwgZ2Zu
LCBmYWxzZSk7CiAgICAgQlVHX09OKHJjICYmIChyYyAhPSAtRU5PTUVNKSk7CiAgICAgcmV0dXJu
IHJjOwogfQotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
