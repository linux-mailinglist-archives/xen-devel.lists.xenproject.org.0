Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 337411051DD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Nov 2019 12:54:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXl08-0003rl-9T; Thu, 21 Nov 2019 11:51:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=N53E=ZN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iXl07-0003rg-3X
 for xen-devel@lists.xenproject.org; Thu, 21 Nov 2019 11:51:55 +0000
X-Inumbo-ID: 4f4bcc32-0c55-11ea-a32d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f4bcc32-0c55-11ea-a32d-12813bfff9fa;
 Thu, 21 Nov 2019 11:51:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8D7B1AB7F;
 Thu, 21 Nov 2019 11:51:52 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>, Chao Gao <chao.gao@intel.com>
References: <1574291155-26032-1-git-send-email-chao.gao@intel.com>
 <1574291155-26032-2-git-send-email-chao.gao@intel.com>
 <43845525-6a6d-3378-01a1-6e7902d3864a@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b85108bc-2614-9658-4a45-a071ad6ecb58@suse.com>
Date: Thu, 21 Nov 2019 12:51:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <43845525-6a6d-3378-01a1-6e7902d3864a@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v1 2/2] microcode: reject late ucode loading
 if any core is parked
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
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjEuMTEuMTkgMTE6MjEsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDIxLjExLjIwMTkgMDA6
MDUsIENoYW8gR2FvIHdyb3RlOgo+PiBJZiBhIGNvcmUgd2l0aCBhbGwgb2YgaXRzIHRocmVhZCBi
ZWluZyBwYXJrZWQsIGxhdGUgdWNvZGUgbG9hZGluZwo+PiB3aGljaCBjdXJyZW50bHkgb25seSBs
b2FkcyB1Y29kZSBvbiBvbmxpbmUgdGhyZWFkcyB3b3VsZCBsZWFkIHRvCj4+IGRpZmZlcmluZyB1
Y29kZSByZXZpc2lvbnMgaW4gdGhlIHN5c3RlbS4gSW4gZ2VuZXJhbCwga2VlcGluZyB1Y29kZQo+
PiByZXZpc2lvbiBjb25zaXN0ZW50IHdvdWxkIGJlIGxlc3MgZXJyb3ItcHJvbmUuIFRvIHRoaXMg
ZW5kLCBpZiB0aGVyZQo+PiBpcyBhIHBhcmtlZCB0aHJlYWQgZG9lc24ndCBoYXZlIGFuIG9ubGlu
ZSBzaWJsaW5nIHRocmVhZCwgbGF0ZSB1Y29kZQo+PiBsb2FkaW5nIGlzIHJlamVjdGVkLgo+IAo+
IEknbSBjb25mdXNlZC4gSSB0aG91Z2h0IHdlIGhhZCBhZ3JlZWQgdGhhdCB0aGUgbG9uZyB0ZXJt
IHNvbHV0aW9uCj4gd291bGQgYmUgdG8gYnJpZWZseSBicmluZyBvbmxpbmUgYSB0aHJlYWQgb2Yg
Y29yZXMgd2l0aCBhbGwgdGhlaXIKPiB0aHJlYWRzIHBhcmtlZC4gV2hhdCB5b3UgZG8gaGVyZSB3
YXMgbWVhbnQgdG8gYmUgYSB0ZW1wb3Jhcnkgc3RlcAo+IG9ubHkgZm9yIDQuMTMsIGZvciB3aGlj
aCBpdCBpcyB0b28gbGF0ZSBub3cgKHVubGVzcyBKw7xyZ2VuCj4gaW5kaWNhdGVzIG90aGVyd2lz
ZSkuCgpXaGljaCBJIGRvbid0IGludGVuZCB0byBkby4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
