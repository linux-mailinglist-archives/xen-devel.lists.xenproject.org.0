Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC247BE1B0
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 17:52:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD9Yn-0002DT-AY; Wed, 25 Sep 2019 15:50:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=mFb1=XU=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1iD9Yl-0002CM-Of
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 15:50:31 +0000
X-Inumbo-ID: 14936df0-dfac-11e9-8628-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by localhost (Halon) with ESMTPS
 id 14936df0-dfac-11e9-8628-bc764e2007e4;
 Wed, 25 Sep 2019 15:49:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 08:49:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="193812709"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.129.153])
 by orsmga006.jf.intel.com with ESMTP; 25 Sep 2019 08:49:37 -0700
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 08:48:54 -0700
Message-Id: <b83cd37dedc7caff1efdead42fe6a105f0289834.1569425745.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569425745.git.tamas.lengyel@intel.com>
References: <cover.1569425745.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [RFC PATCH for-next 16/18] x86/mem_sharing: check page
 type count earlier
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

LS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEveGVuL2FyY2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3No
YXJpbmcuYwppbmRleCBkMzViN2ViMTM4Li5mNTQ5NjliY2FkIDEwMDY0NAotLS0gYS94ZW4vYXJj
aC94ODYvbW0vbWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcu
YwpAQCAtNjQ5LDE5ICs2NDksMTggQEAgc3RhdGljIGludCBwYWdlX21ha2Vfc2hhcmFibGUoc3Ry
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
