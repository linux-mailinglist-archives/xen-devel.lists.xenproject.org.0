Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD211443B0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:54:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxfp-0004yz-9C; Tue, 21 Jan 2020 17:50:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxfn-0004xi-BC
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:50:43 +0000
X-Inumbo-ID: 7ae41101-3c76-11ea-bb21-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ae41101-3c76-11ea-bb21-12813bfff9fa;
 Tue, 21 Jan 2020 17:50:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929189"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:04 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:43 -0800
Message-Id: <59bdc31b9fcffc92c5a8817aeba8eaa2de75a43c.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 10/18] x86/mem_sharing: Convert
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

TUVNX1NIQVJJTkdfREVTVFJPWV9HRk4gaXMgdXNlZCBvbiB0aGUgJ2ZsYWdzJyBiaXRmaWVsZCBk
dXJpbmcgdW5zaGFyaW5nLgpIb3dldmVyLCB0aGUgYml0ZmllbGQgaXMgbm90IHVzZWQgZm9yIGFu
eXRoaW5nIGVsc2UsIHNvIGp1c3QgY29udmVydCBpdCB0byBhCmJvb2wgaW5zdGVhZC4KClNpZ25l
ZC1vZmYtYnk6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXMubGVuZ3llbEBpbnRlbC5jb20+ClJldmll
d2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQogeGVuL2FyY2gveDg2
L21tL21lbV9zaGFyaW5nLmMgICAgIHwgOSArKysrLS0tLS0KIHhlbi9pbmNsdWRlL2FzbS14ODYv
bWVtX3NoYXJpbmcuaCB8IDUgKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9tZW1fc2hhcmlu
Zy5jIGIveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKaW5kZXggNWQ4NDA1NTBmNC4uZGE3
ZDE0MmFkOCAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKKysrIGIv
eGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMKQEAgLTExNzAsNyArMTE3MCw3IEBAIGVycl9v
dXQ6CiAgKi8KIGludCBfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpk
LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuLAotICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQxNl90IGZsYWdzKQorICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGJvb2wgZGVzdHJveSkKIHsKICAgICBwMm1fdHlwZV90IHAybXQ7
CiAgICAgbWZuX3QgbWZuOwpAQCAtMTIyNiw3ICsxMjI2LDcgQEAgaW50IF9fbWVtX3NoYXJpbmdf
dW5zaGFyZV9wYWdlKHN0cnVjdCBkb21haW4gKmQsCiAgICAgICogSWYgdGhlIEdGTiBpcyBnZXR0
aW5nIGRlc3Ryb3llZCBkcm9wIHRoZSByZWZlcmVuY2VzIHRvIE1GTgogICAgICAqIChwb3NzaWJs
eSBmcmVlaW5nIHRoZSBwYWdlKSwgYW5kIGV4aXQgZWFybHkuCiAgICAgICovCi0gICAgaWYgKCBm
bGFncyAmIE1FTV9TSEFSSU5HX0RFU1RST1lfR0ZOICkKKyAgICBpZiAoIGRlc3Ryb3kgKQogICAg
IHsKICAgICAgICAgaWYgKCAhbGFzdF9nZm4gKQogICAgICAgICAgICAgbWVtX3NoYXJpbmdfZ2Zu
X2Rlc3Ryb3kocGFnZSwgZCwgZ2ZuX2luZm8pOwpAQCAtMTMxNyw5ICsxMzE3LDggQEAgaW50IHJl
bGlucXVpc2hfc2hhcmVkX3BhZ2VzKHN0cnVjdCBkb21haW4gKmQpCiAgICAgICAgIG1mbiA9IHAy
bS0+Z2V0X2VudHJ5KHAybSwgX2dmbihnZm4pLCAmdCwgJmEsIDAsIE5VTEwsIE5VTEwpOwogICAg
ICAgICBpZiAoIG1mbl92YWxpZChtZm4pICYmIHAybV9pc19zaGFyZWQodCkgKQogICAgICAgICB7
Ci0gICAgICAgICAgICAvKiBEb2VzIG5vdCBmYWlsIHdpdGggRU5PTUVNIGdpdmVuIHRoZSBERVNU
Uk9ZIGZsYWcgKi8KLSAgICAgICAgICAgIEJVR19PTihfX21lbV9zaGFyaW5nX3Vuc2hhcmVfcGFn
ZSgKLSAgICAgICAgICAgICAgICAgICAgICAgZCwgZ2ZuLCBNRU1fU0hBUklOR19ERVNUUk9ZX0dG
TikpOworICAgICAgICAgICAgLyogRG9lcyBub3QgZmFpbCB3aXRoIEVOT01FTSBnaXZlbiAiZGVz
dHJveSIgaXMgc2V0IHRvIHRydWUgKi8KKyAgICAgICAgICAgIEJVR19PTihfX21lbV9zaGFyaW5n
X3Vuc2hhcmVfcGFnZShkLCBnZm4sIHRydWUpKTsKICAgICAgICAgICAgIC8qCiAgICAgICAgICAg
ICAgKiBDbGVhciBvdXQgdGhlIHAybSBlbnRyeSBzbyBubyBvbmUgZWxzZSBtYXkgdHJ5IHRvCiAg
ICAgICAgICAgICAgKiB1bnNoYXJlLiAgTXVzdCBzdWNjZWVkOiB3ZSBqdXN0IHJlYWQgdGhlIG9s
ZCBlbnRyeSBhbmQKZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcu
aCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvbWVtX3NoYXJpbmcuaAppbmRleCBhMTBhZjlkNTcwLi41
Mzc2MGEyODk2IDEwMDY0NAotLS0gYS94ZW4vaW5jbHVkZS9hc20teDg2L21lbV9zaGFyaW5nLmgK
KysrIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9tZW1fc2hhcmluZy5oCkBAIC03NSwxNiArNzUsMTUg
QEAgc3RydWN0IHBhZ2Vfc2hhcmluZ19pbmZvCiB1bnNpZ25lZCBpbnQgbWVtX3NoYXJpbmdfZ2V0
X25yX3NhdmVkX21mbnModm9pZCk7CiB1bnNpZ25lZCBpbnQgbWVtX3NoYXJpbmdfZ2V0X25yX3No
YXJlZF9tZm5zKHZvaWQpOwogCi0jZGVmaW5lIE1FTV9TSEFSSU5HX0RFU1RST1lfR0ZOICAgICAg
ICgxPDwxKQogLyogT25seSBmYWlscyB3aXRoIC1FTk9NRU0uIEVuZm9yY2UgaXQgd2l0aCBhIEJV
R19PTiB3cmFwcGVyLiAqLwogaW50IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKHN0cnVjdCBk
b21haW4gKmQsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBn
Zm4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDE2X3QgZmxhZ3MpOworICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgZGVzdHJveSk7CiAKIHN0YXRpYyBpbmxp
bmUgaW50IG1lbV9zaGFyaW5nX3Vuc2hhcmVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLAogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZ2ZuKQog
ewotICAgIGludCByYyA9IF9fbWVtX3NoYXJpbmdfdW5zaGFyZV9wYWdlKGQsIGdmbiwgMCk7Cisg
ICAgaW50IHJjID0gX19tZW1fc2hhcmluZ191bnNoYXJlX3BhZ2UoZCwgZ2ZuLCBmYWxzZSk7CiAg
ICAgQlVHX09OKHJjICYmIChyYyAhPSAtRU5PTUVNKSk7CiAgICAgcmV0dXJuIHJjOwogfQotLSAK
Mi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
