Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACFDB0EF1
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 14:38:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8OJ8-00012D-Gf; Thu, 12 Sep 2019 12:34:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8OJ7-000128-EN
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 12:34:41 +0000
X-Inumbo-ID: b037bf34-d559-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b037bf34-d559-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 12:34:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B20DCB723;
 Thu, 12 Sep 2019 12:34:38 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-8-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0ec4fdb3-c53d-c4fb-8b3f-ebaa20a74883@suse.com>
Date: Thu, 12 Sep 2019 14:34:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-8-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 07/16] microcode/amd: call
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Ashok Raj <ashok.raj@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gSW50cm9kdWNlIGEgdmVuZG9y
IGhvb2ssIC5lbmRfdXBkYXRlX3BlcmNwdSwgZm9yIHN2bV9ob3N0X29zdndfaW5pdCgpLgo+IFRo
ZSBob29rIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbiBlYWNoIGNwdSBhZnRlciBsb2FkaW5nIGFuIHVw
ZGF0ZS4KPiBJdCBpcyBhIHByZXBhcmF0aW9uIGZvciBzcGxpdGluZyBvdXQgYXBwbHlfbWljcm9j
b2RlKCkgZnJvbQo+IGNwdV9yZXF1ZXN0X21pY3JvY29kZSgpLgo+IAo+IE5vdGUgdGhhdCBzdm1f
aG9zdF9vc3ZtX2luaXQoKSBzaG91bGQgYmUgY2FsbGVkIHJlZ2FyZGxlc3Mgb2YgdGhlCj4gcmVz
dWx0IG9mIGxvYWRpbmcgYW4gdXBkYXRlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxj
aGFvLmdhb0BpbnRlbC5jb20+Cj4gUmV2aWV3ZWQtYnk6IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2Vy
LnBhdUBjaXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNl
LmNvbT4KYWxiZWl0IHdpdGggb25lIGZ1cnRoZXIgcmVtYXJrOgoKPiBAQCAtNjEzLDI5ICs2MDks
MzIgQEAgc3RhdGljIGludCBjcHVfcmVxdWVzdF9taWNyb2NvZGUoY29uc3Qgdm9pZCAqYnVmLCBz
aXplX3QgYnVmc2l6ZSkKPiAgICAgIHJldHVybiBlcnJvcjsKPiAgfQo+ICAKPiArI2lmZGVmIENP
TkZJR19IVk0KPiAgc3RhdGljIGludCBzdGFydF91cGRhdGUodm9pZCkKPiAgewo+IC0jaWYgQ09O
RklHX0hWTQo+ICAgICAgLyoKPiAtICAgICAqIFdlIGFzc3VtZSBoZXJlIHRoYXQgc3ZtX2hvc3Rf
b3N2d19pbml0KCkgd2lsbCBiZSBjYWxsZWQgb24gZWFjaCBjcHUgKGZyb20KPiAtICAgICAqIGNw
dV9yZXF1ZXN0X21pY3JvY29kZSgpKS4KPiAtICAgICAqCj4gLSAgICAgKiBOb3RlIHRoYXQgaWYg
Y29sbGVjdF9jcHVfaW5mbygpIHJldHVybnMgYW4gZXJyb3IgdGhlbgo+IC0gICAgICogY3B1X3Jl
cXVlc3RfbWljcm9jb2RlKCkgd2lsbCBub3QgaW52b2tlZCB0aHVzIGxlYXZpbmcgT1NWVyBiaXRz
IG5vdAo+IC0gICAgICogdXBkYXRlZC4gQ3VycmVudGx5IHRob3VnaCBjb2xsZWN0X2NwdV9pbmZv
KCkgd2lsbCBub3QgZmFpbCBvbiBwcm9jZXNzb3JzCj4gLSAgICAgKiBzdXBwb3J0aW5nIE9TVlcg
c28gd2Ugd2lsbCBub3QgZGVhbCB3aXRoIHRoaXMgcG9zc2liaWxpdHkuCj4gKyAgICAgKiBzdm1f
aG9zdF9vc3Z3X2luaXQoKSB3aWxsIGJlIGNhbGxlZCBvbiBlYWNoIGNwdSBieSBjYWxsaW5nICcu
ZW5kX3VwZGF0ZScKPiArICAgICAqIGluIGNvbW1vbiBjb2RlLgo+ICAgICAgICovCj4gICAgICBz
dm1faG9zdF9vc3Z3X3Jlc2V0KCk7Cj4gLSNlbmRpZgo+ICAKPiAgICAgIHJldHVybiAwOwo+ICB9
Cj4gIAo+ICtzdGF0aWMgdm9pZCBlbmRfdXBkYXRlX3BlcmNwdSh2b2lkKQo+ICt7Cj4gKyAgICBz
dm1faG9zdF9vc3Z3X2luaXQoKTsKPiArfQoKSSBkb24ndCBzZWUgdGhlIG5lZWQgZm9yIHRoaXMg
d3JhcHBlciwgeW91IGNvdWxkIC4uLgoKPiArI2VuZGlmCj4gKwo+ICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1pY3JvY29kZV9vcHMgbWljcm9jb2RlX2FtZF9vcHMgPSB7Cj4gICAgICAuY3B1X3JlcXVl
c3RfbWljcm9jb2RlICAgICAgICAgICAgPSBjcHVfcmVxdWVzdF9taWNyb2NvZGUsCj4gICAgICAu
Y29sbGVjdF9jcHVfaW5mbyAgICAgICAgICAgICAgICAgPSBjb2xsZWN0X2NwdV9pbmZvLAo+ICAg
ICAgLmFwcGx5X21pY3JvY29kZSAgICAgICAgICAgICAgICAgID0gYXBwbHlfbWljcm9jb2RlLAo+
ICsjaWZkZWYgQ09ORklHX0hWTQo+ICAgICAgLnN0YXJ0X3VwZGF0ZSAgICAgICAgICAgICAgICAg
ICAgID0gc3RhcnRfdXBkYXRlLAo+ICsgICAgLmVuZF91cGRhdGVfcGVyY3B1ICAgICAgICAgICAg
ICAgID0gZW5kX3VwZGF0ZV9wZXJjcHUsCgouLi4gdXNlIHN2bV9ob3N0X29zdndfaW5pdCBoZXJl
IGRpcmVjdGx5LgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
