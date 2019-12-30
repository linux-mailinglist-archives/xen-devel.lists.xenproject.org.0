Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2B12D1C6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Dec 2019 17:14:50 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ilxej-0002RQ-8t; Mon, 30 Dec 2019 16:12:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0QMt=2U=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1ilxeg-0002PY-U1
 for xen-devel@lists.xenproject.org; Mon, 30 Dec 2019 16:12:30 +0000
X-Inumbo-ID: 1c8738b6-2b1f-11ea-a914-bc764e2007e4
Received: from mga14.intel.com (unknown [192.55.52.115])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c8738b6-2b1f-11ea-a914-bc764e2007e4;
 Mon, 30 Dec 2019 16:12:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Dec 2019 08:12:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,375,1571727600"; d="scan'208";a="221167363"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.254.94.206])
 by orsmga003.jf.intel.com with ESMTP; 30 Dec 2019 08:12:00 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Mon, 30 Dec 2019 08:11:38 -0800
Message-Id: <0f92c0ee2861775e682fd6e89202c80315ff2ac3.1577721845.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577721845.git.tamas.lengyel@intel.com>
References: <cover.1577721845.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v3 14/18] x86/mem_sharing: check page type count
 earlier
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

U2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVsQGludGVsLmNvbT4K
LS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3No
YXJpbmcuYwppbmRleCBiYWEzZTM1ZGVkLi5lY2JlNDA1NDVkIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcu
YwpAQCAtNjUyLDE5ICs2NTIsMTggQEAgc3RhdGljIGludCBwYWdlX21ha2Vfc2hhcmFibGUoc3Ry
dWN0IGRvbWFpbiAqZCwKICAgICAgICAgcmV0dXJuIC1FQlVTWTsKICAgICB9CiAKLSAgICAvKiBD
aGFuZ2UgcGFnZSB0eXBlIGFuZCBjb3VudCBhdG9taWNhbGx5ICovCi0gICAgaWYgKCAhZ2V0X3Bh
Z2VfYW5kX3R5cGUocGFnZSwgZCwgUEdUX3NoYXJlZF9wYWdlKSApCisgICAgLyogQ2hlY2sgaWYg
cGFnZSBpcyBhbHJlYWR5IHR5cGVkIGFuZCBiYWlsIGVhcmx5IGlmIGl0IGlzICovCisgICAgaWYg
KCAocGFnZS0+dS5pbnVzZS50eXBlX2luZm8gJiBQR1RfY291bnRfbWFzaykgIT0gMSApCiAgICAg
ewogICAgICAgICBzcGluX3VubG9jaygmZC0+cGFnZV9hbGxvY19sb2NrKTsKLSAgICAgICAgcmV0
dXJuIC1FSU5WQUw7CisgICAgICAgIHJldHVybiAtRUVYSVNUOwogICAgIH0KIAotICAgIC8qIENo
ZWNrIGl0IHdhc24ndCBhbHJlYWR5IHNoYXJhYmxlIGFuZCB1bmRvIGlmIGl0IHdhcyAqLwotICAg
IGlmICggKHBhZ2UtPnUuaW51c2UudHlwZV9pbmZvICYgUEdUX2NvdW50X21hc2spICE9IDEgKQor
ICAgIC8qIENoYW5nZSBwYWdlIHR5cGUgYW5kIGNvdW50IGF0b21pY2FsbHkgKi8KKyAgICBpZiAo
ICFnZXRfcGFnZV9hbmRfdHlwZShwYWdlLCBkLCBQR1Rfc2hhcmVkX3BhZ2UpICkKICAgICB7CiAg
ICAgICAgIHNwaW5fdW5sb2NrKCZkLT5wYWdlX2FsbG9jX2xvY2spOwotICAgICAgICBwdXRfcGFn
ZV9hbmRfdHlwZShwYWdlKTsKLSAgICAgICAgcmV0dXJuIC1FRVhJU1Q7CisgICAgICAgIHJldHVy
biAtRUlOVkFMOwogICAgIH0KIAogICAgIC8qCi0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
