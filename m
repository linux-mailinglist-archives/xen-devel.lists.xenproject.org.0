Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C93A0649
	for <lists+xen-devel@lfdr.de>; Wed, 28 Aug 2019 17:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2zq1-0003yA-73; Wed, 28 Aug 2019 15:26:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=uWOn=WY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2zq0-0003y5-9n
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2019 15:26:20 +0000
X-Inumbo-ID: 2ef53882-c9a8-11e9-951b-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ef53882-c9a8-11e9-951b-bc764e2007e4;
 Wed, 28 Aug 2019 15:26:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C5CC1ABE3;
 Wed, 28 Aug 2019 15:26:18 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-9-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6401261d-fe3d-e1a2-ef49-77860892e382@suse.com>
Date: Wed, 28 Aug 2019 17:26:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-9-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 08/15] microcode/amd: call
 svm_host_osvw_init() in common code
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Ashok Raj <ashok.raj@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAwMzoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2
L21pY3JvY29kZV9hbWQuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9taWNyb2NvZGVfYW1kLmMKPiBA
QCAtNTk0LDEwICs1OTQsNiBAQCBzdGF0aWMgaW50IGNwdV9yZXF1ZXN0X21pY3JvY29kZShjb25z
dCB2b2lkICpidWYsIHNpemVfdCBidWZzaXplKQo+ICAgICAgeGZyZWUobWNfYW1kKTsKPiAgCj4g
ICAgb3V0Ogo+IC0jaWYgQ09ORklHX0hWTQo+IC0gICAgc3ZtX2hvc3Rfb3N2d19pbml0KCk7Cj4g
LSNlbmRpZgo+IC0KPiAgICAgIC8qCj4gICAgICAgKiBJbiBzb21lIGNhc2VzIHdlIG1heSByZXR1
cm4gYW4gZXJyb3IgZXZlbiBpZiBwcm9jZXNzb3IncyBtaWNyb2NvZGUgaGFzCj4gICAgICAgKiBi
ZWVuIHVwZGF0ZWQuIEZvciBleGFtcGxlLCB0aGUgZmlyc3QgcGF0Y2ggaW4gYSBjb250YWluZXIg
ZmlsZSBpcyBsb2FkZWQKPiBAQCAtNjA5LDI3ICs2MDUsMjggQEAgc3RhdGljIGludCBjcHVfcmVx
dWVzdF9taWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVmLCBzaXplX3QgYnVmc2l6ZSkKPiAgCj4gIHN0
YXRpYyBpbnQgc3RhcnRfdXBkYXRlKHZvaWQpCj4gIHsKPiAtI2lmIENPTkZJR19IVk0KPiAgICAg
IC8qCj4gLSAgICAgKiBXZSBhc3N1bWUgaGVyZSB0aGF0IHN2bV9ob3N0X29zdndfaW5pdCgpIHdp
bGwgYmUgY2FsbGVkIG9uIGVhY2ggY3B1IChmcm9tCj4gLSAgICAgKiBjcHVfcmVxdWVzdF9taWNy
b2NvZGUoKSkuCj4gLSAgICAgKgo+IC0gICAgICogTm90ZSB0aGF0IGlmIGNvbGxlY3RfY3B1X2lu
Zm8oKSByZXR1cm5zIGFuIGVycm9yIHRoZW4KPiAtICAgICAqIGNwdV9yZXF1ZXN0X21pY3JvY29k
ZSgpIHdpbGwgbm90IGludm9rZWQgdGh1cyBsZWF2aW5nIE9TVlcgYml0cyBub3QKPiAtICAgICAq
IHVwZGF0ZWQuIEN1cnJlbnRseSB0aG91Z2ggY29sbGVjdF9jcHVfaW5mbygpIHdpbGwgbm90IGZh
aWwgb24gcHJvY2Vzc29ycwo+IC0gICAgICogc3VwcG9ydGluZyBPU1ZXIHNvIHdlIHdpbGwgbm90
IGRlYWwgd2l0aCB0aGlzIHBvc3NpYmlsaXR5Lgo+ICsgICAgICogc3ZtX2hvc3Rfb3N2d19pbml0
KCkgd2lsbCBiZSBjYWxsZWQgb24gZWFjaCBjcHUgYnkgY2FsbGluZyAnLmVuZF91cGRhdGUnCj4g
KyAgICAgKiBpbiBjb21tb24gY29kZS4KPiAgICAgICAqLwo+ICAgICAgc3ZtX2hvc3Rfb3N2d19y
ZXNldCgpOwo+IC0jZW5kaWYKPiAgCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiArc3RhdGlj
IHZvaWQgZW5kX3VwZGF0ZSh2b2lkKQo+ICt7Cj4gKyAgICBzdm1faG9zdF9vc3Z3X2luaXQoKTsK
PiArfQo+ICsKPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfb3BzIG1pY3JvY29kZV9h
bWRfb3BzID0gewo+ICAgICAgLmNwdV9yZXF1ZXN0X21pY3JvY29kZSAgICAgICAgICAgID0gY3B1
X3JlcXVlc3RfbWljcm9jb2RlLAo+ICAgICAgLmNvbGxlY3RfY3B1X2luZm8gICAgICAgICAgICAg
ICAgID0gY29sbGVjdF9jcHVfaW5mbywKPiAgICAgIC5hcHBseV9taWNyb2NvZGUgICAgICAgICAg
ICAgICAgICA9IGFwcGx5X21pY3JvY29kZSwKPiArI2lmIENPTkZJR19IVk0KCkkgcmVhbGl6ZSBp
dCB3YXMgd3JvbmcgaW4gdGhlIG9sZCBjb2RlIGFzIHdlbGwsIGJ1dCBwbGVhc2UgdXNlCiNpZmRl
ZiBpbnN0ZWFkIG9mICNpZi4KCj4gICAgICAuc3RhcnRfdXBkYXRlICAgICAgICAgICAgICAgICAg
ICAgPSBzdGFydF91cGRhdGUsCj4gKyAgICAuZW5kX3VwZGF0ZSAgICAgICAgICAgICAgICAgICAg
ICAgPSBlbmRfdXBkYXRlLAo+ICsjZW5kaWYKCldpdGggdGhpcyB0aGVyZSdsbCBiZSB0d28gd2Fy
bmluZ3MgYWJvdXQgdW51c2VkIGZ1bmN0aW9ucyB3aGVuCiFIVk0gLSB5b3UgbmVlZCB0byBmcmFt
ZSB0aGUgaW1wbGVtZW50YXRpb25zIHdpdGggYW4gI2lmZGVmIGFzCndlbGwuCgpKYW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWls
aW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVu
cHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
