Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1359B0CF5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2019 12:33:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8MM8-0004XH-Q1; Thu, 12 Sep 2019 10:29:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ncEf=XH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8MM7-0004XC-Qr
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2019 10:29:39 +0000
X-Inumbo-ID: 38ade7e3-d548-11e9-83e7-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38ade7e3-d548-11e9-83e7-12813bfff9fa;
 Thu, 12 Sep 2019 10:29:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D1E48ADE0;
 Thu, 12 Sep 2019 10:29:35 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-4-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d1705ae-15df-5c3b-334f-5b48c8df1d3a@suse.com>
Date: Thu, 12 Sep 2019 12:29:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-4-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 03/16] microcode: introduce a global
 cache of ucode patch
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

T24gMTIuMDkuMjAxOSAwOToyMiwgQ2hhbyBHYW8gd3JvdGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2
L21pY3JvY29kZV9pbnRlbC5jCj4gKysrIGIveGVuL2FyY2gveDg2L21pY3JvY29kZV9pbnRlbC5j
Cj4gQEAgLTI2MCw2ICsyNjAsMzYgQEAgc3RhdGljIGVudW0gbWljcm9jb2RlX21hdGNoX3Jlc3Vs
dCBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKAo+ICAgICAgcmV0dXJuIE1JU19VQ09ERTsKPiAgfQo+
ICAKPiArc3RhdGljIGJvb2wgbWF0Y2hfY3B1KGNvbnN0IHN0cnVjdCBtaWNyb2NvZGVfcGF0Y2gg
KnBhdGNoKQo+ICt7Cj4gKyAgICBpZiAoICFwYXRjaCApCj4gKyAgICAgICAgcmV0dXJuIGZhbHNl
Owo+ICsKPiArICAgIHJldHVybiBtaWNyb2NvZGVfdXBkYXRlX21hdGNoKCZwYXRjaC0+bWNfaW50
ZWwtPmhkciwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNtcF9wcm9jZXNz
b3JfaWQoKSkgPT0gTkVXX1VDT0RFOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBmcmVlX3BhdGNo
KHZvaWQgKm1jKQo+ICt7Cj4gKyAgICB4ZnJlZShtYyk7Cj4gK30KPiArCj4gK3N0YXRpYyBlbnVt
IG1pY3JvY29kZV9tYXRjaF9yZXN1bHQgY29tcGFyZV9wYXRjaCgKPiArICAgIGNvbnN0IHN0cnVj
dCBtaWNyb2NvZGVfcGF0Y2ggKm5ldywgY29uc3Qgc3RydWN0IG1pY3JvY29kZV9wYXRjaCAqb2xk
KQo+ICt7Cj4gKyAgICAvKgo+ICsgICAgICogQm90aCBwYXRjaGVzIHRvIGNvbXBhcmUgYXJlIHN1
cHBvc2VkIHRvIGJlIGFwcGxpY2FibGUgdG8gbG9jYWwgQ1BVLgo+ICsgICAgICogSnVzdCBjb21w
YXJlIHRoZSByZXZpc2lvbiBudW1iZXIuCj4gKyAgICAgKi8KPiArICAgIEFTU0VSVChtaWNyb2Nv
ZGVfdXBkYXRlX21hdGNoKCZvbGQtPm1jX2ludGVsLT5oZHIsIHNtcF9wcm9jZXNzb3JfaWQoKSkg
IT0KPiArICAgICAgICAgICAgICAgTUlTX1VDT0RFKTsKPiArICAgIEFTU0VSVChtaWNyb2NvZGVf
dXBkYXRlX21hdGNoKCZuZXctPm1jX2ludGVsLT5oZHIsIHNtcF9wcm9jZXNzb3JfaWQoKSkgIT0K
PiArICAgICAgICAgICAgICAgTUlTX1VDT0RFKTsKCldpdGggdGhlIGluZGVudGF0aW9uIGhlcmUg
Zml4ZWQKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
