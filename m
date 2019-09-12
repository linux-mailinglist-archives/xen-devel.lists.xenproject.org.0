Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B478BB11C8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 17:06:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8QeV-0007hp-H5; Thu, 12 Sep 2019 15:04:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8QeT-0007hU-I6
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 15:04:53 +0000
X-Inumbo-ID: ac14039e-d56e-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac14039e-d56e-11e9-978d-bc764e2007e4;
 Thu, 12 Sep 2019 15:04:52 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6BD7B07D;
 Thu, 12 Sep 2019 15:04:51 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-12-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5f263e75-505b-b0b3-4831-5a1fcdf93542@suse.com>
Date: Thu, 12 Sep 2019 17:04:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-12-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 11/16] microcode: reduce memory
 allocation and copy when creating a patch
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

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gVG8gY3JlYXRlIGEgbWljcm9j
b2RlIHBhdGNoIGZyb20gYSB2ZW5kb3Itc3BlY2lmaWMgdXBkYXRlLAo+IGFsbG9jYXRlX21pY3Jv
Y29kZV9wYXRjaCgpIGNvcGllZCBldmVyeXRoaW5nIGZyb20gdGhlIHVwZGF0ZS4KPiBJdCBpcyBu
b3QgZWZmaWNpZW50LiBFc3NlbnRpYWxseSwgd2UganVzdCBuZWVkIHRvIGdvIHRocm91Z2gKPiB1
Y29kZXMgaW4gdGhlIGJsb2IsIGZpbmQgdGhlIG9uZSB3aXRoIHRoZSBuZXdlc3QgcmV2aXNpb24g
YW5kCj4gaW5zdGFsbCBpdCBpbnRvIHRoZSBtaWNyb2NvZGVfcGF0Y2guIEluIHRoZSBwcm9jZXNz
LCBidWZmZXJzCj4gbGlrZSBtY19hbWQsIGVxdWl2X2NwdV90YWJsZSAob24gQU1EIHNpZGUpLCBh
bmQgbWMgKG9uIEludGVsCj4gc2lkZSkgY2FuIGJlIHJldXNlZC4gbWljcm9jb2RlX3BhdGNoIG5v
dyBpcyBhbGxvY2F0ZWQgYWZ0ZXIKPiBpdCBpcyBzdXJlIHRoYXQgdGhlcmUgaXMgYSBtYXRjaGlu
ZyB1Y29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaGFvIEdhbyA8Y2hhby5nYW9AaW50ZWwuY29t
Pgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cgo+IEBAIC0zNTMs
OCArMzM0LDkgQEAgc3RhdGljIGludCBhcHBseV9taWNyb2NvZGUoY29uc3Qgc3RydWN0IG1pY3Jv
Y29kZV9wYXRjaCAqcGF0Y2gpCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAtc3RhdGljIGxv
bmcgZ2V0X25leHRfdWNvZGVfZnJvbV9idWZmZXIodm9pZCAqKm1jLCBjb25zdCB1OCAqYnVmLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNp
emUsIGxvbmcgb2Zmc2V0KQo+ICtzdGF0aWMgbG9uZyBnZXRfbmV4dF91Y29kZV9mcm9tX2J1ZmZl
cihzdHJ1Y3QgbWljcm9jb2RlX2ludGVsICoqbWMsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHU4ICpidWYsIHVuc2lnbmVkIGxvbmcgc2l6ZSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbG9uZyBvZmZzZXQpCgpBcyB5b3Ug
dG91Y2ggdGhpcyBhbnl3YXksIGl0IHdvdWxkIGhhdmUgYmVlbiBuaWNlIGlmIHlvdSBoYWQKdGFr
ZW4gdGhlIHRpbWUgdG8gY29ycmVjdCB0aGUgb25lIG9yIHR3byBzdHlsZSBpc3N1ZXMgaGVyZQoo
dTggLT4gdWludDhfdCBhbmQgbGlrZWx5IGxvbmcgLT4gdW5zaWduZWQgbG9uZykuCgpKYW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBt
YWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMu
eGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
