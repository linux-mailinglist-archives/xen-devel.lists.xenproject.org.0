Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99456B1AE8
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2019 11:34:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i8hw5-00017V-45; Fri, 13 Sep 2019 09:32:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=f4Vg=XI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i8hw3-00017Q-5D
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2019 09:32:11 +0000
X-Inumbo-ID: 5b8abfd0-d609-11e9-95aa-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5b8abfd0-d609-11e9-95aa-12813bfff9fa;
 Fri, 13 Sep 2019 09:32:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 90DBEAE8B;
 Fri, 13 Sep 2019 09:32:08 +0000 (UTC)
To: Chao Gao <chao.gao@intel.com>
References: <1568272949-1086-1-git-send-email-chao.gao@intel.com>
 <1568272949-1086-17-git-send-email-chao.gao@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <33d77575-8e22-5d7f-d070-8cf0f3a853ba@suse.com>
Date: Fri, 13 Sep 2019 11:32:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1568272949-1086-17-git-send-email-chao.gao@intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v10 16/16] microcode/intel: writeback and
 invalidate cache conditionally
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
Cj4gQEAgLTMwNSw2ICszMDUsMzEgQEAgc3RhdGljIGJvb2wgaXNfYmxhY2tsaXN0ZWQodm9pZCkK
PiAgICAgIHJldHVybiBmYWxzZTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgbWljcm9jb2RlX3F1
aXJrKHZvaWQpCj4gK3sKPiArICAgIHN0cnVjdCBjcHVpbmZvX3g4NiAqYzsKCmNvbnN0Cgo+ICsg
ICAgdWludDY0X3QgbGxjX3NpemU7Cj4gKwo+ICsgICAgLyoKPiArICAgICAqIERvbid0IHJlZmVy
IHRvIGN1cnJlbnRfY3B1X2RhdGEsIHdoaWNoIGlzbid0IGZ1bGx5IGluaXRpYWxpemVkCj4gKyAg
ICAgKiBiZWZvcmUgdGhpcyBzdGFnZS4KPiArICAgICAqLwo+ICsgICAgaWYgKCBzeXN0ZW1fc3Rh
dGUgPCBTWVNfU1RBVEVfc21wX2Jvb3QgKQo+ICsgICAgICAgIHJldHVybjsKCklmIHRoZSB3b3Jr
YXJvdW5kIGlzIG5lZWRlZCwgd2h5IHdvdWxkIGl0IG5vdCBiZSBuZWVkZWQgZm9yIHRoZSBCU1A/
Cgo+ICsgICAgYyA9ICZjdXJyZW50X2NwdV9kYXRhOwo+ICsgICAgbGxjX3NpemUgPSBjLT54ODZf
Y2FjaGVfc2l6ZSAqIDEwMjRVTEw7Cj4gKyAgICBkb19kaXYobGxjX3NpemUsIGMtPng4Nl9tYXhf
Y29yZXMpOwoKSW5zdGVhZCBvZiB0aGUgbG9jYWwgdmFyaWFibGUsIC4uLgoKPiArCj4gKyAgICAv
Kgo+ICsgICAgICogVG8gbWl0aWdhdGUgc29tZSBpc3N1ZXMgb24gdGhpcyBzcGVjaWZpYyBCcm9h
ZHdlbGwgQ1BVLCB3cml0ZWJhY2sgYW5kCj4gKyAgICAgKiBpbnZhbGlkYXRlIGNhY2hlIHJlZ2Fy
ZGxlc3Mgb2YgdWNvZGUgcmV2aXNpb24uCj4gKyAgICAgKi8KPiArICAgIGlmICggYy0+eDg2ID09
IDYgJiYgYy0+eDg2X21vZGVsID09IDB4NEYgJiYgYy0+eDg2X21hc2sgPT0gMHgxICYmCj4gKyAg
ICAgICAgIGxsY19zaXplID4gMjYyMTQ0MCApCgouLi4gd2h5IGRvbid0IHlvdSBjb21wYXJlIGMt
Png4Nl9jYWNoZV9zaXplIC8gYy0+eDg2X21heF9jb3JlcwphZ2FpbnN0IDI1NjAgaGVyZT8gSXMg
dGhlcmUgYW55IHJpc2sgb2YgdHJ1bmNhdGluZyByZWxldmFudCBsb3cKYml0cz8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
