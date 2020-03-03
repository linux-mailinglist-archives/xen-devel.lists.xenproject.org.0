Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F46177BCD
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 17:22:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9AHy-00027l-Jj; Tue, 03 Mar 2020 16:20:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HQGm=4U=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j9AHx-00027g-Fq
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 16:20:57 +0000
X-Inumbo-ID: f618acd6-5d6a-11ea-a1b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f618acd6-5d6a-11ea-a1b5-12813bfff9fa;
 Tue, 03 Mar 2020 16:20:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3D021AEEE;
 Tue,  3 Mar 2020 16:20:56 +0000 (UTC)
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
References: <20200303123058.27210-1-jgross@suse.com>
 <c1bea0c8-3dc8-ede3-eb63-ca601b6d2d91@suse.com>
 <c8946349-ae40-fe58-26a8-c1bc918ddc82@suse.com>
Message-ID: <79bdd397-4c90-fe07-5d10-a62d193c2c83@suse.com>
Date: Tue, 3 Mar 2020 17:20:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c8946349-ae40-fe58-26a8-c1bc918ddc82@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/sched: fix cpu offlining with core
 scheduling
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
Cc: xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDMuMjAgMTc6MDUsIErDvHJnZW4gR3Jvw58gd3JvdGU6Cj4gT24gMDMuMDMuMjAgMTQ6
NDUsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwMy4wMy4yMDIwIDEzOjMwLCBKdWVyZ2VuIEdy
b3NzIHdyb3RlOgo+Pj4gQEAgLTI1MzgsNyArMjU1MiwxMCBAQCBzdGF0aWMgdm9pZCBzY2hlZF9z
bGF2ZSh2b2lkKQo+Pj4gwqDCoMKgwqDCoCBuZXh0ID0gc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2lu
KHByZXYsICZsb2NrLCBjcHUsIG5vdyk7Cj4+PiDCoMKgwqDCoMKgIGlmICggIW5leHQgKQo+Pj4g
K8KgwqDCoCB7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNf
cmN1bG9jayk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4gK8KgwqDCoCB9Cj4+
Cj4+IFRoaXMgYW5kIC4uLgo+Pgo+Pj4gQEAgLTI1OTksNyArMjYxNiwxMCBAQCBzdGF0aWMgdm9p
ZCBzY2hlZHVsZSh2b2lkKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGNwdW1hc2tfcmFpc2Vfc29m
dGlycShtYXNrLCBTQ0hFRF9TTEFWRV9TT0ZUSVJRKTsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBu
ZXh0ID0gc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKHByZXYsICZsb2NrLCBjcHUsIG5vdyk7Cj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCAhbmV4dCApCj4+PiArwqDCoMKgwqDCoMKgwqAgewo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmN1X3JlYWRfdW5sb2NrKCZzY2hlZF9yZXNfcmN1
bG9jayk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+PiArwqDCoMKg
wqDCoMKgwqAgfQo+Pgo+PiAuLi4gdGhpcyBsb29rIGxpa2UgaW5kZXBlbmRlbnQgZml4ZXMsIGFz
IG9uIEFybSwKPj4gc2NoZWRfd2FpdF9yZW5kZXp2b3VzX2luKCkgY2FuIGFscmVhZHkgcmV0dXJu
IE5VTEwuIElmIHRoZXkgZ2V0Cj4+IGZvbGRlZCBpbnRvIGhlcmUsIEkgdGhpbmsgdGhlIGRlc2Ny
aXB0aW9uIHNob3VsZCBjbGFyaWZ5IHRoYXQKPj4gdGhlc2UgYXJlIG9ydGhvZ29uYWwgdG8gdGhl
IHJlc3QuCj4gCj4gWWVhaCwgcHJvYmFibHkgYmV0dGVyIHRvIHNwbGl0IHRoZSBwYXRjaC4KCk9o
LCB0aGlzIHBhdGNoIHdhcyB3cm9uZzogVXAgdG8gbm93IHNjaGVkX3dhaXRfcmVuZGV6dm91c19p
bigpIGFsd2F5cwp3YXMgcmVzcG9uc2libGUgZm9yIGRyb3BwaW5nIHNjaGVkX3Jlc19yY3Vsb2Nr
LCBzbyBJIHNob3VsZCBkbyB0aGF0IGluCnRoZSBuZXcgTlVMTCByZXR1cm4gY2FzZSwgdG9vLgoK
U28gbm8gcGF0Y2ggc3BsaXR0aW5nLCBidXQgVjIuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
