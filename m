Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 680E612F9A4
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2020 16:19:05 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1inOgk-0008Bv-Ej; Fri, 03 Jan 2020 15:16:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1inOgi-0008Bo-R5
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2020 15:16:32 +0000
X-Inumbo-ID: 0558f242-2e3c-11ea-a4c4-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0558f242-2e3c-11ea-a4c4-12813bfff9fa;
 Fri, 03 Jan 2020 15:16:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 3887CAC69;
 Fri,  3 Jan 2020 15:16:31 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191224132616.47441-1-roger.pau@citrix.com>
 <20191224132616.47441-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <89458569-90b1-433a-c192-c22564c881c3@suse.com>
Date: Fri, 3 Jan 2020 16:17:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191224132616.47441-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 1/2] x86/hvm: improve performance of
 HVMOP_flush_tlbs
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMTIuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZXJlJ3Mgbm8g
bmVlZCB0byBjYWxsIHBhZ2luZ191cGRhdGVfY3IzIHVubGVzcyBDUjMgdHJhcHBpbmcgaXMKPiBl
bmFibGVkLCBhbmQgdGhhdCdzIG9ubHkgdGhlIGNhc2Ugd2hlbiB1c2luZyBzaGFkb3cgcGFnaW5n
IG9yIHdoZW4KPiByZXF1ZXN0ZWQgZm9yIGludHJvc3BlY3Rpb24gcHVycG9zZXMsIG90aGVyd2lz
ZSB0aGVyZSdzIG5vIG5lZWQgdG8KPiBwYXVzZSBhbGwgdGhlIHZDUFVzIG9mIHRoZSBkb21haW4g
aW4gb3JkZXIgdG8gcGVyZm9ybSB0aGUgZmx1c2guCj4gCj4gQ2hlY2sgd2hldGhlciBDUjMgdHJh
cHBpbmcgaXMgY3VycmVudGx5IGluIHVzZSBpbiBvcmRlciB0byBkZWNpZGUKPiB3aGV0aGVyIHRo
ZSB2Q1BVcyBzaG91bGQgYmUgcGF1c2VkLCBvdGhlcndpc2UganVzdCBwZXJmb3JtIHRoZSBmbHVz
aC4KCkZpcnN0IG9mIGFsbCAtIHdpdGggdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyB0aGUgcGF1c2lu
ZyBub3Qgc2F5aW5nCmFueXRoaW5nIG9uIHRoZSAid2h5IiwgeW91IG11c3QgaGF2ZSBnYWluZWQg
c29tZSB1bmRlcnN0YW5kaW5nCnRoZXJlLiBDb3VsZCB5b3Ugc2hhcmUgdGhpcz8gSSBjYW4ndCBz
ZWUgd2h5IHRoaXMgd2FzIG5lZWRlZCwgYW5kCnNoX3VwZGF0ZV9jcjMoKSBhbHNvIGRvZXNuJ3Qg
bG9vayB0byBoYXZlIGFueSByZXNwZWN0aXZlIEFTU0VSVCgpCm9yIGFsaWtlLiBJJ20gaGF2aW5n
IGV2ZW4gbW9yZSB0cm91YmxlIHNlZWluZyB3aHkgaW4gSEFQIG1vZGUgdGhlCnBhdXNpbmcgd291
bGQgYmUgbmVlZGVkLgoKQXMgYSByZXN1bHQgSSB3b25kZXIgd2hldGhlciwgcmF0aGVyIHRoYW4g
ZGV0ZXJtaW5pbmcgd2hldGhlcgpwYXVzaW5nIGlzIG5lZWRlZCBpbnNpZGUgdGhlIGZ1bmN0aW9u
LCB0aGlzIHNob3VsZG4ndCBiZSBhIGZsYWcKaW4gc3RydWN0IHBhZ2luZ19tb2RlLgoKTmV4dCBJ
IHNlcmlvdXNseSBkb3VidCBpbnRyb3NwZWN0aW9uIGhvb2tzIHNob3VsZCBiZSBjYWxsZWQgaGVy
ZS4KSW50cm9zcGVjdGlvbiBzaG91bGQgYmUgYWJvdXQgZ3Vlc3QgYWN0aW9ucywgYW5kIHVzIGNh
bGxpbmcKcGFnaW5nX3VwZGF0ZV9jcjMoKSBpcyBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb2Yg
WGVuLCBub3QKc29tZXRoaW5nIHRoZSBndWVzdCBjb250cm9scy4gRXZlbiBtb3JlLCB0aGVyZSBu
b3QgYmVpbmcgYW55IENSMwpjaGFuZ2UgaGVyZSBJIHdvbmRlciB3aGV0aGVyIHRoZSBjYWxsIGJ5
IHRoZSBob29rcyB0bwpodm1fdXBkYXRlX2d1ZXN0X2NyMygpIGNvdWxkbid0IGJlIHN1cHByZXNz
ZWQgYWx0b2dldGhlciBpbiB0aGlzCmNhc2UuIFF1aXRlIHBvc3NpYmx5IGluIHRoZSBzaGFkb3cg
Y2FzZSB0aGVyZSBjb3VsZCBiZSBtb3JlCnN0ZXBzIHRoYXQgYXJlbid0IHJlYWxseSBuZWVkZWQs
IHNvIHBlcmhhcHMgYSBzZXBhcmF0ZSBob29rIG1pZ2h0CmJlIG9uIG9yZGVyLgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
