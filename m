Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB205168700
	for <lists+xen-devel@lfdr.de>; Fri, 21 Feb 2020 19:52:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j5DMy-0006iY-JH; Fri, 21 Feb 2020 18:49:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JJS4=4J=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1j5DMw-0006hw-M5
 for xen-devel@lists.xenproject.org; Fri, 21 Feb 2020 18:49:46 +0000
X-Inumbo-ID: e80d6e4e-54da-11ea-b0fd-bc764e2007e4
Received: from mga12.intel.com (unknown [192.55.52.136])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e80d6e4e-54da-11ea-b0fd-bc764e2007e4;
 Fri, 21 Feb 2020 18:49:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 10:49:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,469,1574150400"; d="scan'208";a="259709283"
Received: from btraw-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.1.240])
 by fmsmga004.fm.intel.com with ESMTP; 21 Feb 2020 10:49:33 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Fri, 21 Feb 2020 10:49:20 -0800
Message-Id: <08d22ed5ffef1d947b819606aafa6414a16bed0b.1582310142.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1582310142.git.tamas.lengyel@intel.com>
References: <cover.1582310142.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v9 2/5] xen: add parent_domid field to
 createdomain domctl
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas.lengyel@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

V2hlbiBjcmVhdGluZyBhIGRvbWFpbiB0aGF0IHdpbGwgYmUgdXNlZCBhcyBhIFZNIGZvcmsgc29t
ZSBpbmZvcm1hdGlvbiBpcwpyZXF1aXJlZCB0byBzZXQgdGhpbmdzIHVwIHByb3Blcmx5LCBsaWtl
IHRoZSBtYXhfdmNwdXMgY291bnQuIEluc3RlYWQgb2YgdGhlCnRvb2xzdGFjayBoYXZpbmcgdG8g
Z2F0aGVyIHRoaXMgaW5mb3JtYXRpb24gZm9yIGVhY2ggZm9yayBpbiBhIHNlcGFyYXRlCmh5cGVy
Y2FsbCB3ZSBjYW4ganVzdCBpbmNsdWRlIHRoZSBwYXJlbnQgZG9tYWluJ3MgaWQgaW4gdGhlIGNy
ZWF0ZWRvbWFpbiBkb21jdGwKc28gdGhhdCBYZW4gY2FuIGNvcHkgdGhlIHNldHRpbmcgd2l0aG91
dCB0aGUgZXh0cmEgdG9vbHN0YWNrIHF1ZXJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBUYW1hcyBLIExl
bmd5ZWwgPHRhbWFzLmxlbmd5ZWxAaW50ZWwuY29tPgotLS0KIHhlbi9jb21tb24vZG9tY3RsLmMg
ICAgICAgICB8IDE0ICsrKysrKysrKysrKysrCiB4ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3RsLmgg
fCAgMyArKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZG9tY3RsLmMgYi94ZW4vY29tbW9uL2RvbWN0bC5j
CmluZGV4IGE2OWIzYjU5YTguLjIyYWNlYjM4NjAgMTAwNjQ0Ci0tLSBhL3hlbi9jb21tb24vZG9t
Y3RsLmMKKysrIGIveGVuL2NvbW1vbi9kb21jdGwuYwpAQCAtNDg5LDYgKzQ4OSw3IEBAIGxvbmcg
ZG9fZG9tY3RsKFhFTl9HVUVTVF9IQU5ETEVfUEFSQU0oeGVuX2RvbWN0bF90KSB1X2RvbWN0bCkK
ICAgICBjYXNlIFhFTl9ET01DVExfY3JlYXRlZG9tYWluOgogICAgIHsKICAgICAgICAgZG9taWRf
dCAgICAgICAgZG9tOworICAgICAgICBkb21pZF90ICAgICAgICBwYXJlbnRfZG9tOwogICAgICAg
ICBzdGF0aWMgZG9taWRfdCByb3ZlciA9IDA7CiAKICAgICAgICAgZG9tID0gb3AtPmRvbWFpbjsK
QEAgLTUxNSw2ICs1MTYsMTkgQEAgbG9uZyBkb19kb21jdGwoWEVOX0dVRVNUX0hBTkRMRV9QQVJB
TSh4ZW5fZG9tY3RsX3QpIHVfZG9tY3RsKQogICAgICAgICAgICAgcm92ZXIgPSBkb207CiAgICAg
ICAgIH0KIAorICAgICAgICBwYXJlbnRfZG9tID0gb3AtPnUuY3JlYXRlZG9tYWluLnBhcmVudF9k
b21pZDsKKyAgICAgICAgaWYgKCBwYXJlbnRfZG9tICkKKyAgICAgICAgeworICAgICAgICAgICAg
c3RydWN0IGRvbWFpbiAqcGQgPSByY3VfbG9ja19kb21haW5fYnlfaWQocGFyZW50X2RvbSk7CisK
KyAgICAgICAgICAgIHJldCA9IC1FSU5WQUw7CisgICAgICAgICAgICBpZiAoICFwZCApCisgICAg
ICAgICAgICAgICAgYnJlYWs7CisKKyAgICAgICAgICAgIG9wLT51LmNyZWF0ZWRvbWFpbi5tYXhf
dmNwdXMgPSBwZC0+bWF4X3ZjcHVzOworICAgICAgICAgICAgcmN1X3VubG9ja19kb21haW4ocGQp
OworICAgICAgICB9CisKICAgICAgICAgZCA9IGRvbWFpbl9jcmVhdGUoZG9tLCAmb3AtPnUuY3Jl
YXRlZG9tYWluLCBmYWxzZSk7CiAgICAgICAgIGlmICggSVNfRVJSKGQpICkKICAgICAgICAgewpk
aWZmIC0tZ2l0IGEveGVuL2luY2x1ZGUvcHVibGljL2RvbWN0bC5oIGIveGVuL2luY2x1ZGUvcHVi
bGljL2RvbWN0bC5oCmluZGV4IGZlYzZmNmZkZDEuLjI1MWNjNDBlZjYgMTAwNjQ0Ci0tLSBhL3hl
bi9pbmNsdWRlL3B1YmxpYy9kb21jdGwuaAorKysgYi94ZW4vaW5jbHVkZS9wdWJsaWMvZG9tY3Rs
LmgKQEAgLTM4LDcgKzM4LDcgQEAKICNpbmNsdWRlICJodm0vc2F2ZS5oIgogI2luY2x1ZGUgIm1l
bW9yeS5oIgogCi0jZGVmaW5lIFhFTl9ET01DVExfSU5URVJGQUNFX1ZFUlNJT04gMHgwMDAwMDAx
MgorI2RlZmluZSBYRU5fRE9NQ1RMX0lOVEVSRkFDRV9WRVJTSU9OIDB4MDAwMDAwMTMKIAogLyoK
ICAqIE5CLiB4ZW5fZG9tY3RsLmRvbWFpbiBpcyBhbiBJTi9PVVQgcGFyYW1ldGVyIGZvciB0aGlz
IG9wZXJhdGlvbi4KQEAgLTkyLDYgKzkyLDcgQEAgc3RydWN0IHhlbl9kb21jdGxfY3JlYXRlZG9t
YWluIHsKICAgICB1aW50MzJfdCBtYXhfZXZ0Y2huX3BvcnQ7CiAgICAgaW50MzJfdCBtYXhfZ3Jh
bnRfZnJhbWVzOwogICAgIGludDMyX3QgbWF4X21hcHRyYWNrX2ZyYW1lczsKKyAgICBkb21pZF90
IHBhcmVudF9kb21pZDsKIAogICAgIHN0cnVjdCB4ZW5fYXJjaF9kb21haW5jb25maWcgYXJjaDsK
IH07Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
