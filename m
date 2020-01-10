Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1413729C
	for <lists+xen-devel@lfdr.de>; Fri, 10 Jan 2020 17:16:00 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ipwu0-0001Jm-Nb; Fri, 10 Jan 2020 16:12:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xm9j=27=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ipwtz-0001Jh-0f
 for xen-devel@lists.xenproject.org; Fri, 10 Jan 2020 16:12:47 +0000
X-Inumbo-ID: 09e804e4-33c4-11ea-bf54-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 09e804e4-33c4-11ea-bf54-12813bfff9fa;
 Fri, 10 Jan 2020 16:12:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 793B1B1EB;
 Fri, 10 Jan 2020 16:12:45 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20200108140810.6528-1-aisaila@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bad288d5-c3e1-2af1-cabd-2d4c50535cdf@suse.com>
Date: Fri, 10 Jan 2020 17:12:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200108140810.6528-1-aisaila@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V7 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDEuMjAyMCAxNTowOCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gQ2hh
bmdlcyBzaW5jZSBWNjoKPiAJLSBSZW1vdmUgc3RyYXkgc3BhY2VzCj4gCS0gVXNlIEFSUkFZX1NJ
WkUoZC0+YXJjaC5hbHRwMm1fcDJtKSBpbnNlYWQgb2YgTUFYX0FMVFAyTS4KCkknbSBub3QgdXR0
ZXJseSBjb25mdXNlZDoKCj4gLS0tIGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9tbS9tZW1fYWNjZXNzLmMKPiBAQCAtMzY2LDExICszNjYsMTMgQEAg
bG9uZyBwMm1fc2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50
MzJfdCBuciwKPiAgI2lmZGVmIENPTkZJR19IVk0KPiAgICAgIGlmICggYWx0cDJtX2lkeCApCj4g
ICAgICB7Cj4gLSAgICAgICAgaWYgKCBhbHRwMm1faWR4ID49IE1BWF9BTFRQMk0gfHwKPiAtICAg
ICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0gPT0gbWZuX3goSU5WQUxJ
RF9NRk4pICkKPiArICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gbWluKEFSUkFZX1NJWkUoZC0+
YXJjaC5hbHRwMm1fcDJtKSwgTUFYX0VQVFApIHx8Cj4gKyAgICAgICAgICAgICBkLT5hcmNoLmFs
dHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfRVBUUCldID09Cj4g
KyAgICAgICAgICAgICBtZm5feChJTlZBTElEX01GTikgKQo+ICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsKPiAgCj4gLSAgICAgICAgYXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVthbHRwMm1f
aWR4XTsKPiArICAgICAgICBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25v
c3BlYyhhbHRwMm1faWR4LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVJS
QVlfU0laRShkLT5hcmNoLmFsdHAybV9wMm0pKV07CgpXaHkgaXMgdGhpcyBzdGlsbCBub3QKCiAg
ICAgICAgYXAybSA9IGFycmF5X2FjY2Vzc19ub3NwZWMoZC0+YXJjaC5hbHRwMm1fcDJtLCBhbHRw
Mm1faWR4KTsKCj8gV2hhdCBhbSBJIG1pc3Npbmc/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
