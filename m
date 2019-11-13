Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37675FB1C5
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 14:51:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUt1s-0002O0-VU; Wed, 13 Nov 2019 13:49:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=SDLk=ZF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iUt1s-0002Nv-Bc
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 13:49:52 +0000
X-Inumbo-ID: 7647839c-061c-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7647839c-061c-11ea-b678-bc764e2007e4;
 Wed, 13 Nov 2019 13:49:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91D51B109;
 Wed, 13 Nov 2019 13:49:49 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3141a4d-b1b8-cc8b-3171-73fe0e6dd1c9@suse.com>
Date: Wed, 13 Nov 2019 14:50:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH] AMD/IOMMU: restore DTE fields in
 amd_iommu_setup_domain_device()
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Q29tbWl0IDFiMDBjMTZiZGYgKCJBTUQvSU9NTVU6IHByZS1maWxsIGFsbCBEVEVzIHJpZ2h0IGFm
dGVyIHRhYmxlCmFsbG9jYXRpb24iKSBtb3ZlZCBvdXJzZWx2ZXMgaW50byBhIG1vcmUgc2VjdXJl
IGRlZmF1bHQgc3RhdGUsIGJ1dApkaWRuJ3QgdGFrZSBzdWZmaWNpZW50IGNhcmUgdG8gYWxzbyB1
bmRvIHRoZSBlZmZlY3RzIHdoZW4gaGFuZGluZyBhCnByZXZpb3VzbHkgZGlzYWJsZWQgZGV2aWNl
IGJhY2sgdG8gYShub3RoZXIpIGRvbWFpbi4gUHV0IHRoZSBmaWVsZHMKdGhhdCBtYXkgaGF2ZSBi
ZWVuIGNoYW5nZWQgZWxzZXdoZXJlIGJhY2sgdG8gdGhlaXIgaW50ZW5kZWQgdmFsdWVzCihzb21l
IGZpZWxkcyBhbWRfaW9tbXVfZGlzYWJsZV9kb21haW5fZGV2aWNlKCkgdG91Y2hlcyBkb24ndApj
dXJyZW50bHkgZ2V0IHdyaXR0ZW4gYW55d2hlcmUgZWxzZSwgYW5kIGhlbmNlIGRvbid0IG5lZWQg
bW9kaWZ5aW5nCmhlcmUpLgoKUmVwb3J0ZWQtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhA
ZWlrZWxlbmJvb20uaXQ+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KCi0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2FtZC9wY2lfYW1kX2lvbW11LmMK
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvYW1kL3BjaV9hbWRfaW9tbXUuYwpAQCAtMTE0
LDExICsxMTQsMjEgQEAgc3RhdGljIHZvaWQgYW1kX2lvbW11X3NldHVwX2RvbWFpbl9kZXZpYwog
CiAgICAgaWYgKCAhZHRlLT52IHx8ICFkdGUtPnR2ICkKICAgICB7CisgICAgICAgIGNvbnN0IHN0
cnVjdCBpdnJzX21hcHBpbmdzICppdnJzX2RldjsKKwogICAgICAgICAvKiBiaW5kIERURSB0byBk
b21haW4gcGFnZS10YWJsZXMgKi8KICAgICAgICAgYW1kX2lvbW11X3NldF9yb290X3BhZ2VfdGFi
bGUoCiAgICAgICAgICAgICBkdGUsIHBhZ2VfdG9fbWFkZHIoaGQtPmFyY2gucm9vdF90YWJsZSks
IGRvbWFpbi0+ZG9tYWluX2lkLAogICAgICAgICAgICAgaGQtPmFyY2gucGFnaW5nX21vZGUsIHZh
bGlkKTsKIAorICAgICAgICAvKiBVbmRvIHdoYXQgYW1kX2lvbW11X2Rpc2FibGVfZG9tYWluX2Rl
dmljZSgpIG1heSBoYXZlIGRvbmUuICovCisgICAgICAgIGl2cnNfZGV2ID0gJmdldF9pdnJzX21h
cHBpbmdzKGlvbW11LT5zZWcpW3JlcV9pZF07CisgICAgICAgIGlmICggZHRlLT5pdF9yb290ICkK
KyAgICAgICAgICAgIGR0ZS0+aW50X2N0bCA9IElPTU1VX0RFVl9UQUJMRV9JTlRfQ09OVFJPTF9U
UkFOU0xBVEVEOworICAgICAgICBkdGUtPml2ID0gaW9tbXVfaW50cmVtYXA7CisgICAgICAgIGR0
ZS0+ZXggPSBpdnJzX2Rldi0+ZHRlX2FsbG93X2V4Y2x1c2lvbjsKKyAgICAgICAgZHRlLT5zeXNf
bWd0ID0gTUFTS19FWFRSKGl2cnNfZGV2LT5kZXZpY2VfZmxhZ3MsIEFDUElfSVZIRF9TWVNURU1f
TUdNVCk7CisKICAgICAgICAgaWYgKCBwY2lfYXRzX2RldmljZShpb21tdS0+c2VnLCBidXMsIHBk
ZXYtPmRldmZuKSAmJgogICAgICAgICAgICAgIGlvbW11X2hhc19jYXAoaW9tbXUsIFBDSV9DQVBf
SU9UTEJfU0hJRlQpICkKICAgICAgICAgICAgIGR0ZS0+aSA9IGF0c19lbmFibGVkOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
