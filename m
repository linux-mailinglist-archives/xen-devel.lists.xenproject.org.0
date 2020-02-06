Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B011544F2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 14:33:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izhFB-0003Yw-Ax; Thu, 06 Feb 2020 13:30:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izhFA-0003Yr-Fo
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 13:30:56 +0000
X-Inumbo-ID: e70c6d44-48e4-11ea-841d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e70c6d44-48e4-11ea-841d-bc764e2007e4;
 Thu, 06 Feb 2020 13:30:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1672DAD79;
 Thu,  6 Feb 2020 13:30:54 +0000 (UTC)
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
Message-ID: <68fb9767-3104-3f0b-d052-20df7603e1e9@suse.com>
Date: Thu, 6 Feb 2020 14:31:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <6ef37772-81da-dfd0-01e7-c83998b2c2c4@suse.com>
Content-Language: en-US
Subject: [Xen-devel] [PATCH 1/2] VT-d: check all of an RMRR for being
 E820-reserved
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
Cc: Kevin Tian <kevin.tian@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q2hlY2tpbmcganVzdCB0aGUgZmlyc3QgYW5kIGxhc3QgcGFnZSBpcyBub3Qgc3VmZmljaWVudCAo
YW5kIHJlZHVuZGFudApmb3Igc2luZ2xlLXBhZ2UgcmVnaW9ucykuIEFzIHdlIGRvbid0IG5lZWQg
dG8gY2FyZSBhYm91dCBJQTY0IGFueW1vcmUsCnVzZSBhbiB4ODYtc3BlY2lmaWMgZnVuY3Rpb24g
dG8gZ2V0IHRoaXMgZG9uZSB3aXRob3V0IGxvb3Bpbmcgb3ZlciBlYWNoCmluZGl2aWR1YWwgcGFn
ZS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBh
L3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9kbWFyLmMKKysrIGIveGVuL2RyaXZlcnMvcGFz
c3Rocm91Z2gvdnRkL2RtYXIuYwpAQCAtMjksNiArMjksNyBAQAogI2luY2x1ZGUgPHhlbi9wY2ku
aD4KICNpbmNsdWRlIDx4ZW4vcGNpX3JlZ3MuaD4KICNpbmNsdWRlIDxhc20vYXRvbWljLmg+Cisj
aW5jbHVkZSA8YXNtL2U4MjAuaD4KICNpbmNsdWRlIDxhc20vc3RyaW5nLmg+CiAjaW5jbHVkZSAi
ZG1hci5oIgogI2luY2x1ZGUgImlvbW11LmgiCkBAIC02MzIsMTQgKzYzMywxMSBAQCBhY3BpX3Bh
cnNlX29uZV9ybXJyKHN0cnVjdCBhY3BpX2RtYXJfaGVhCiAgICAgICogbm90IHByb3Blcmx5IHJl
cHJlc2VudGVkIGluIHRoZSBzeXN0ZW0gbWVtb3J5IG1hcCBhbmQKICAgICAgKiBpbmZvcm0gdGhl
IHVzZXIKICAgICAgKi8KLSAgICBpZiAoICghcGFnZV9pc19yYW1fdHlwZShwYWRkcl90b19wZm4o
YmFzZV9hZGRyKSwgUkFNX1RZUEVfUkVTRVJWRUQpKSB8fAotICAgICAgICAgKCFwYWdlX2lzX3Jh
bV90eXBlKHBhZGRyX3RvX3BmbihlbmRfYWRkciksIFJBTV9UWVBFX1JFU0VSVkVEKSkgKQotICAg
IHsKKyAgICBpZiAoICFlODIwX2FsbF9tYXBwZWQoYmFzZV9hZGRyLCBlbmRfYWRkciArIDEsIFJB
TV9UWVBFX1JFU0VSVkVEKSApCiAgICAgICAgIHByaW50ayhYRU5MT0dfV0FSTklORyBWVERQUkVG
SVgKICAgICAgICAgICAgICAgICIgIFJNUlIgYWRkcmVzcyByYW5nZSAlIlBSSXg2NCIuLiUiUFJJ
eDY0IiBub3QgaW4gcmVzZXJ2ZWQgbWVtb3J5OyIKICAgICAgICAgICAgICAgICIgbmVlZCBcImlv
bW11X2luY2x1c2l2ZV9tYXBwaW5nPTFcIj9cbiIsCiAgICAgICAgICAgICAgICAgYmFzZV9hZGRy
LCBlbmRfYWRkcik7Ci0gICAgfQogCiAgICAgcm1ycnUgPSB4emFsbG9jKHN0cnVjdCBhY3BpX3Jt
cnJfdW5pdCk7CiAgICAgaWYgKCAhcm1ycnUgKQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
