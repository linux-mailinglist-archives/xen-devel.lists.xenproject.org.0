Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A5142F00
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 16:46:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itZC3-0002Ce-4D; Mon, 20 Jan 2020 15:42:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itZC0-0002CX-Vq
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 15:42:21 +0000
X-Inumbo-ID: 7029157a-3b9b-11ea-b995-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7029157a-3b9b-11ea-b995-12813bfff9fa;
 Mon, 20 Jan 2020 15:42:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2EF3DB15F;
 Mon, 20 Jan 2020 15:42:17 +0000 (UTC)
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <620f37b6-43f2-030e-b259-84a4e9ceb7fc@suse.com>
Date: Mon, 20 Jan 2020 16:42:22 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
Subject: [Xen-devel] [PATCH v2] VT-d: don't pass bridge devices to
 domain_context_mapping_one()
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

V2hlbiBwYXNzZWQgYSBub24tTlVMTCBwZGV2LCB0aGUgZnVuY3Rpb24gZG9lcyBhbiBvd25lciBj
aGVjayB3aGVuIGl0CmZpbmRzIGFuIGFscmVhZHkgZXhpc3RpbmcgY29udGV4dCBtYXBwaW5nLiBC
cmlkZ2VzLCBob3dldmVyLCBkb24ndCBnZXQKcGFzc2VkIHRocm91Z2ggdG8gZ3Vlc3RzLCBhbmQg
aGVuY2UgdGhlaXIgb3duZXIgaXMgYWx3YXlzIGdvaW5nIHRvIGJlCkRvbTAsIGxlYWRpbmcgdG8g
dGhlIGFzc2lnbWVudCBvZiBhbGwgYnV0IG9uZSBvZiB0aGUgZnVuY3Rpb24gb2YgbXVsdGktCmZ1
bmN0aW9uIFBDSSBkZXZpY2VzIGJlaGluZCBicmlkZ2VzIHRvIGZhaWwuCgpSZXBvcnRlZC1ieTog
TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIu
Y29tPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Ci0tLQp2
MjogQWRkIGNvbW1lbnRzLgotLS0KTm90ZTogVGhpcyB3YXMgcmVwb3J0ZWQgYXMgYW4gYXBwYXJl
bnQgcmVncmVzc2lvbiBmcm9tIFhTQS0zMDIgLyAtMzA2LgogICAgICBTbyBmYXIgSSBoYXZlbid0
IGJlZW4gYWJsZSB0byBmaWd1cmUgb3V0IGhvdyB0aGUgY29kZSB3b3VsZCBoYXZlCiAgICAgIHdv
cmtlZCBiZWZvcmUsIGkuZS4gdG8gbWUgaXQgbG9va3MgbGlrZSBhIHByZS1leGlzdGluZyBwcm9i
bGVtLgogICAgICBUaGlzIGxlYXZlcyB0aGUgcmlzayBvZiB0aGUgY2hhbmdlIGhlcmUgcGFwZXJp
bmcgb3ZlciBhbm90aGVyCiAgICAgIGlzc3VlLgoKLS0tIGEveGVuL2RyaXZlcnMvcGFzc3Rocm91
Z2gvdnRkL2lvbW11LmMKKysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL2lvbW11LmMK
QEAgLTE0OTMsMTggKzE0OTMsMjggQEAgc3RhdGljIGludCBkb21haW5fY29udGV4dF9tYXBwaW5n
KHN0cnVjdAogICAgICAgICBpZiAoIGZpbmRfdXBzdHJlYW1fYnJpZGdlKHNlZywgJmJ1cywgJmRl
dmZuLCAmc2VjYnVzKSA8IDEgKQogICAgICAgICAgICAgYnJlYWs7CiAKKyAgICAgICAgLyoKKyAg
ICAgICAgICogTWFwcGluZyBhIGJyaWRnZSBzaG91bGQsIGlmIGFueXRoaW5nLCBwYXNzIHRoZSBz
dHJ1Y3QgcGNpX2RldiBvZgorICAgICAgICAgKiB0aGF0IGJyaWRnZS4gU2luY2UgYnJpZGdlcyBk
b24ndCBub3JtYWxseSBnZXQgYXNzaWduZWQgdG8gZ3Vlc3RzLAorICAgICAgICAgKiB0aGVpciBv
d25lciB3b3VsZCBiZSB0aGUgd3Jvbmcgb25lLiBQYXNzIE5VTEwgaW5zdGVhZC4KKyAgICAgICAg
ICovCiAgICAgICAgIHJldCA9IGRvbWFpbl9jb250ZXh0X21hcHBpbmdfb25lKGRvbWFpbiwgZHJo
ZC0+aW9tbXUsIGJ1cywgZGV2Zm4sCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHBjaV9nZXRfcGRldihzZWcsIGJ1cywgZGV2Zm4pKTsKKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgTlVMTCk7CiAKICAgICAgICAgLyoKICAgICAgICAgICog
RGV2aWNlcyBiZWhpbmQgUENJZS10by1QQ0kvUENJeCBicmlkZ2UgbWF5IGdlbmVyYXRlIGRpZmZl
cmVudAogICAgICAgICAgKiByZXF1ZXN0ZXItaWQuIEl0IG1heSBvcmlnaW5hdGUgZnJvbSBkZXZm
bj0wIG9uIHRoZSBzZWNvbmRhcnkgYnVzCiAgICAgICAgICAqIGJlaGluZCB0aGUgYnJpZGdlLiBN
YXAgdGhhdCBpZCBhcyB3ZWxsIGlmIHdlIGRpZG4ndCBhbHJlYWR5LgorICAgICAgICAgKgorICAg
ICAgICAgKiBTb21ld2hhdCBzaW1pbGFyIGFzIGZvciBicmlkZ2VzLCB3ZSBkb24ndCB3YW50IHRv
IHBhc3MgYSBzdHJ1Y3QKKyAgICAgICAgICogcGNpX2RldiBoZXJlIC0gdGhlcmUgbWF5IG5vdCBl
dmVuIGV4aXN0IG9uZSBmb3IgdGhpcyAoc2VjYnVzLDAsMCkKKyAgICAgICAgICogdHVwbGUuIElm
IHRoZXJlIGlzIG9uZSwgd2l0aG91dCBwcm9wZXJseSB3b3JraW5nIGRldmljZSBncm91cHMgaXQK
KyAgICAgICAgICogbWF5IGFnYWluIG5vdCBoYXZlIHRoZSBjb3JyZWN0IG93bmVyLgogICAgICAg
ICAgKi8KICAgICAgICAgaWYgKCAhcmV0ICYmIHBkZXZfdHlwZShzZWcsIGJ1cywgZGV2Zm4pID09
IERFVl9UWVBFX1BDSWUyUENJX0JSSURHRSAmJgogICAgICAgICAgICAgIChzZWNidXMgIT0gcGRl
di0+YnVzIHx8IHBkZXYtPmRldmZuICE9IDApICkKICAgICAgICAgICAgIHJldCA9IGRvbWFpbl9j
b250ZXh0X21hcHBpbmdfb25lKGRvbWFpbiwgZHJoZC0+aW9tbXUsIHNlY2J1cywgMCwKLSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBjaV9nZXRfcGRldihzZWcs
IHNlY2J1cywgMCkpOworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTlVMTCk7CiAKICAgICAgICAgYnJlYWs7CiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
