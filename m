Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0229DA15FB
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 12:32:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3HgF-0005VN-Cj; Thu, 29 Aug 2019 10:29:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3HgE-0005VG-0m
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 10:29:26 +0000
X-Inumbo-ID: deea19c0-ca47-11e9-ae64-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deea19c0-ca47-11e9-ae64-12813bfff9fa;
 Thu, 29 Aug 2019 10:29:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09D90ADAA;
 Thu, 29 Aug 2019 10:29:24 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1566177928-19114-1-git-send-email-chao.gao@intel.com>
 <1566177928-19114-12-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eb35364e-ab5b-7d02-3237-fb6625a96bb9@suse.com>
Date: Thu, 29 Aug 2019 12:29:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1566177928-19114-12-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v9 11/15] microcode: unify loading update
 during CPU resuming and AP wakeup
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

T24gMTkuMDguMjAxOSAwMzoyNSwgQ2hhbyBHYW8gd3JvdGU6Cj4gQm90aCBhcmUgbG9hZGluZyB0
aGUgY2FjaGVkIHBhdGNoLiBTaW5jZSBBUHMgY2FsbCB0aGUgdW5pZmllZCBmdW5jdGlvbiwKPiBt
aWNyb2NvZGVfdXBkYXRlX29uZSgpLCBkdXJpbmcgd2FrZXVwLCB0aGUgJ3N0YXJ0X3VwZGF0ZScg
cGFyYW1ldGVyCj4gd2hpY2ggb3JpZ2luYWxseSB1c2VkIHRvIGRpc3Rpbmd1aXNoIEJTUCBhbmQg
QVBzIGlzIHJlZHVuZGFudC4gU28gcmVtb3ZlCj4gdGhpcyBwYXJhbWV0ZXIuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ2hhbyBHYW8gPGNoYW8uZ2FvQGludGVsLmNvbT4KPiAtLS0KPiBOb3RlIHRoYXQg
aGVyZSBpcyBhIGZ1bmN0aW9uYWwgY2hhbmdlOiByZXN1bWluZyBhIENQVSB3b3VsZCBjYWxsCj4g
LT5lbmRfdXBkYXRlKCkgbm93IHdoaWxlIHByZXZpb3VzbHkgaXQgd2Fzbid0LiBOb3QgcXVpdGUg
c3VyZQo+IHdoZXRoZXIgaXQgaXMgY29ycmVjdC4KCkkgdGhpbmsgaXQgaXMsIGFzIGltcGxpZWQg
YnkgdGhlIG90aGVyIHJlc3BvbnNlIEkndmUgc2VudC4gQnV0IGl0CnNob3VsZCB0aGVuIChhcyBh
bHNvIHNhaWQpIGluY2x1ZGUgY2FsbGluZyAtPnN0YXJ0X3VwZGF0ZSgpIGFzIHdlbGwuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
