Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D761845E0
	for <lists+xen-devel@lfdr.de>; Fri, 13 Mar 2020 12:24:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jCiOH-0007gS-Ui; Fri, 13 Mar 2020 11:22:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jCiOG-0007gN-4N
 for xen-devel@lists.xenproject.org; Fri, 13 Mar 2020 11:22:08 +0000
X-Inumbo-ID: df80adca-651c-11ea-a6c1-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df80adca-651c-11ea-a6c1-bc764e2007e4;
 Fri, 13 Mar 2020 11:22:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 39ABBAAC7;
 Fri, 13 Mar 2020 11:22:06 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200312082831.22280-1-jgross@suse.com>
 <20200312082831.22280-2-jgross@suse.com>
 <1be676b5-267a-0b7e-7b78-2f15162475c7@xen.org>
 <7f39e716-641b-b2d3-7e2b-2f30ccda10c5@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <723a263f-467e-4a48-86b9-6de4dc6c396b@suse.com>
Date: Fri, 13 Mar 2020 12:22:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <7f39e716-641b-b2d3-7e2b-2f30ccda10c5@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 1/4] xen/rcu: don't use
 stop_machine_run() for rcu_barrier()
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTMuMDMuMjAyMCAxMjoxOCwgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxMy4wMy4yMCAx
MjowMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiAxMi8wMy8yMDIwIDA4OjI4LCBKdWVyZ2Vu
IEdyb3NzIHdyb3RlOgo+Pj4gK8KgwqDCoCBmb3IgKCA7OyApCj4+PiArwqDCoMKgIHsKPj4+ICvC
oMKgwqDCoMKgwqDCoCBpZiAoICFhdG9taWNfcmVhZCgmcGVuZGluZ19jb3VudCkgJiYgZ2V0X2Nw
dV9tYXBzKCkgKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG5fY3B1cyA9IG51bV9vbmxpbmVfY3B1cygpOwo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKCBhdG9taWNfY21weGNoZygmcGVuZGluZ19jb3VudCwgMCwgbl9jcHVzICsg
MSkgPT0gMCApCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4g
Kwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHV0X2NwdV9tYXBzKCk7Cj4+PiArwqDCoMKg
wqDCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIHByb2Nlc3NfcGVuZGluZ19zb2Z0
aXJxcygpOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNwdV9yZWxheCgpOwo+Pj4gK8KgwqDCoCB9Cj4+
PiArCj4+PiArwqDCoMKgIGF0b21pY19zZXQoJmNwdV9jb3VudCwgbl9jcHVzKTsKPj4+ICvCoMKg
wqAgY3B1bWFza19yYWlzZV9zb2Z0aXJxKCZjcHVfb25saW5lX21hcCwgUkNVX1NPRlRJUlEpOwo+
Pj4gKwo+Pj4gK8KgwqDCoCBwdXRfY3B1X21hcHMoKTsKPj4KPj4gSWYgeW91IHB1dCB0aGUgQ1BV
IG1hcHMsIHdvdWxkbid0IGl0IGJlIHBvc3NpYmxlIHRvIGhhdmUgYSBDUFUgdHVybmVkIAo+PiBv
ZmY/IElmIG5vdCwgY2FuIHlvdSBhZGQgYSBjb21tZW50IGluIHRoZSBjb2RlIHdoeSB0aGlzIGlz
IHNhZmU/Cj4gCj4gWWVzLCB5b3UgYXJlIHJpZ2h0LiBUaGlzIG1pZ2h0IGJlIHBvc3NpYmxlLCBl
dmVuIGlmIHJhdGhlcgo+IHVubGlrZWx5IGFzIGEgY3B1IGJlaW5nIHJlbW92ZWQgaGFzIHRvIGJl
IGluIGlkbGUgYWxyZWFkeSwgc28KPiB0aGUgcGVuZGluZyBzb2Z0aXJxIHNob3VsZCBiZSBwaWNr
ZWQgdXAgcmF0aGVyIGZhc3QuCgpJIHRoaW5rIHRoYXQncyBub3QgdGhlIG1haW4gYXNwZWN0LiBU
aGUgQ1BVIHRvIGJlIHJlbW92ZWQgbWF5CmFscmVhZHkgYmUgc3Bpbm5pbmcgaW4gY3B1X2hvdHBs
dWdfYmVnaW4oKSAoYW5kIG1heSBpbiBwYXJ0aWN1bGFyCmFsc28gYWxyZWFkeSBiZSBwYXN0IHRo
ZSByY3VfYmFycmllcigpIHRoYXQgSWdvcidzIHBhdGNoIGlzIGdvaW5nCnRvIHB1dCB0aGVyZSku
CgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
