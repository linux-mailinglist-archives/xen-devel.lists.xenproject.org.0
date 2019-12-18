Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6791D1243D9
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 11:01:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihW6g-0000Bf-LB; Wed, 18 Dec 2019 09:59:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=nDAh=2I=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ihW6f-0000BX-3L
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:59:01 +0000
X-Inumbo-ID: fdba9d84-217c-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdba9d84-217c-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 09:58:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C16C3B15F;
 Wed, 18 Dec 2019 09:58:49 +0000 (UTC)
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
References: <20191217151144.9781-1-aisaila@bitdefender.com>
 <9012ab5f-4a3b-d469-6c03-20aa59773c2a@suse.com>
 <20fedb38-ac6e-772b-1859-eebd03c92989@bitdefender.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <faed09b4-6206-80b9-60ea-1607aba7e38d@suse.com>
Date: Wed, 18 Dec 2019 10:59:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20fedb38-ac6e-772b-1859-eebd03c92989@bitdefender.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 1/4] x86/mm: Add array_index_nospec to
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

T24gMTguMTIuMjAxOSAwOTowNiwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6Cj4gT24g
MTcuMTIuMjAxOSAxODo1MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE3LjEyLjIwMTkgMTY6
MTIsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOgo+Pj4gLS0tIGEveGVuL2FyY2gveDg2
L21tL21lbV9hY2Nlc3MuYwo+Pj4gKysrIGIveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYwo+
Pj4gQEAgLTM2NywxMCArMzY3LDExIEBAIGxvbmcgcDJtX3NldF9tZW1fYWNjZXNzKHN0cnVjdCBk
b21haW4gKmQsIGdmbl90IGdmbiwgdWludDMyX3QgbnIsCj4+PiAgICAgICBpZiAoIGFsdHAybV9p
ZHggKQo+Pj4gICAgICAgewo+Pj4gICAgICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSBNQVhfQUxU
UDJNIHx8Cj4+PiAtICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF0g
PT0gbWZuX3goSU5WQUxJRF9NRk4pICkKPj4+ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1f
ZXB0cFthcnJheV9pbmRleF9ub3NwZWMoYWx0cDJtX2lkeCwgTUFYX0VQVFApXSA9PQo+Pgo+PiBU
aGUgYm91bmRzIGNoZWNrIGlzIGFnYWluc3QgTUFYX0FMVFAyTS4gQm90aCBNQVhfIHZhbHVlcyBs
b29rIHRvIGJlCj4+IGluZGVwZW5kZW50LCB3aGljaCBtZWFucyBib3VuZHMgY2hlY2sgYW5kIHZh
bHVlIHBhc3NlZCB0byB0aGUKPj4gaGVscGVyIG5lZWQgdG8gbWF0Y2ggdXAgKG5vdCBqdXN0IGhl
cmUpLgo+IAo+IEkgd2lsbCBoYXZlIGJvdGggY2hlY2tzIGFnYWluc3QgTUFYX0FMVFAyTS4KCkFu
IGFsdGVybmF0aXZlIHdvdWxkIGJlIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YKCiAgICAg
ICAgICAgaWYgKCBhbHRwMm1faWR4ID49IG1pbihNQVhfQUxUUDJNLCBNQVhfRVBUUCkgfHwKCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
