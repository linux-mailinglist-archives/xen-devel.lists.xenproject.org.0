Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1721443AB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 18:53:54 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itxg8-0005Gl-Uv; Tue, 21 Jan 2020 17:51:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ThP3=3K=intel.com=tamas.lengyel@srs-us1.protection.inumbo.net>)
 id 1itxg7-0005Fg-CB
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 17:51:03 +0000
X-Inumbo-ID: 7bdf470b-3c76-11ea-bb21-12813bfff9fa
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7bdf470b-3c76-11ea-bb21-12813bfff9fa;
 Tue, 21 Jan 2020 17:50:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 09:50:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="228929225"
Received: from tlengyel-mobl2.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.251.23.127])
 by orsmga006.jf.intel.com with ESMTP; 21 Jan 2020 09:50:06 -0800
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Date: Tue, 21 Jan 2020 09:49:46 -0800
Message-Id: <9ad4a109504c951a2da7e74021f9ccbc37edbda9.1579628566.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1579628566.git.tamas.lengyel@intel.com>
References: <cover.1579628566.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Subject: [Xen-devel] [PATCH v5 13/18] x86/mem_sharing: Skip xen heap pages
 in memshr nominate
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

VHJ5aW5nIHRvIHNoYXJlIHRoZXNlIHdvdWxkIGZhaWwgYW55d2F5LCBiZXR0ZXIgdG8gc2tpcCB0
aGVtIGVhcmx5LgoKU2lnbmVkLW9mZi1ieTogVGFtYXMgSyBMZW5neWVsIDx0YW1hcy5sZW5neWVs
QGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
LS0tCiB4ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYyB8IDYgKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEveGVuL2Fy
Y2gveDg2L21tL21lbV9zaGFyaW5nLmMgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpp
bmRleCAxNzJmMDJlNzgwLi5lYWM4MDQ3YzA3IDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0v
bWVtX3NoYXJpbmcuYworKysgYi94ZW4vYXJjaC94ODYvbW0vbWVtX3NoYXJpbmcuYwpAQCAtODQw
LDYgKzg0MCwxMSBAQCBzdGF0aWMgaW50IG5vbWluYXRlX3BhZ2Uoc3RydWN0IGRvbWFpbiAqZCwg
Z2ZuX3QgZ2ZuLAogICAgIGlmICggIXAybV9pc19zaGFyYWJsZShwMm10KSApCiAgICAgICAgIGdv
dG8gb3V0OwogCisgICAgLyogU2tpcCB4ZW4gaGVhcCBwYWdlcyAqLworICAgIHBhZ2UgPSBtZm5f
dG9fcGFnZShtZm4pOworICAgIGlmICggIXBhZ2UgfHwgaXNfeGVuX2hlYXBfcGFnZShwYWdlKSAp
CisgICAgICAgIGdvdG8gb3V0OworCiAgICAgLyogQ2hlY2sgaWYgdGhlcmUgYXJlIG1lbV9hY2Nl
c3MvcmVtYXBwZWQgYWx0cDJtIGVudHJpZXMgZm9yIHRoaXMgcGFnZSAqLwogICAgIGlmICggYWx0
cDJtX2FjdGl2ZShkKSApCiAgICAgewpAQCAtODcwLDcgKzg3NSw2IEBAIHN0YXRpYyBpbnQgbm9t
aW5hdGVfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sCiAgICAgfQogCiAgICAgLyog
VHJ5IHRvIGNvbnZlcnQgdGhlIG1mbiB0byB0aGUgc2hhcmFibGUgdHlwZSAqLwotICAgIHBhZ2Ug
PSBtZm5fdG9fcGFnZShtZm4pOwogICAgIHJldCA9IHBhZ2VfbWFrZV9zaGFyYWJsZShkLCBwYWdl
LCBleHBlY3RlZF9yZWZjbnQpOwogICAgIGlmICggcmV0ICkKICAgICAgICAgZ290byBvdXQ7Ci0t
IAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
