Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A823717350C
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 11:12:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7cZR-0003l5-OA; Fri, 28 Feb 2020 10:08:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7cZP-0003l0-KK
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 10:08:35 +0000
X-Inumbo-ID: 477c36d0-5a12-11ea-98ec-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 477c36d0-5a12-11ea-98ec-12813bfff9fa;
 Fri, 28 Feb 2020 10:08:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D519FB3BF;
 Fri, 28 Feb 2020 10:08:33 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200228093334.36586-1-roger.pau@citrix.com>
 <20200228093334.36586-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <15481182-aa35-da08-c289-29ff74eba686@suse.com>
Date: Fri, 28 Feb 2020 11:08:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200228093334.36586-2-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] x86/smp: use a dedicated CPU mask in
 send_IPI_mask
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

T24gMjguMDIuMjAyMCAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9zbXAuYwo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9zbXAuYwo+IEBAIC01OSw2ICs1OSw4
IEBAIHN0YXRpYyB2b2lkIHNlbmRfSVBJX3Nob3J0Y3V0KHVuc2lnbmVkIGludCBzaG9ydGN1dCwg
aW50IHZlY3RvciwKPiAgICAgIGFwaWNfd3JpdGUoQVBJQ19JQ1IsIGNmZyk7Cj4gIH0KPiAgCj4g
K0RFQ0xBUkVfUEVSX0NQVShjcHVtYXNrX3Zhcl90LCBzZW5kX2lwaV9jcHVtYXNrKTsKClRoaXMg
bmVlZHMgdG8gYmUgcHV0IGluIGEgaGVhZGVyLCBzbyB0aGF0IC4uLgoKPiAtLS0gYS94ZW4vYXJj
aC94ODYvc21wYm9vdC5jCj4gKysrIGIveGVuL2FyY2gveDg2L3NtcGJvb3QuYwo+IEBAIC01Nyw2
ICs1Nyw5IEBAIERFRklORV9QRVJfQ1BVX1JFQURfTU9TVExZKGNwdW1hc2tfdmFyX3QsIGNwdV9j
b3JlX21hc2spOwo+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShjcHVtYXNrX3Zhcl90LCBz
Y3JhdGNoX2NwdW1hc2spOwo+ICBzdGF0aWMgY3B1bWFza190IHNjcmF0Y2hfY3B1MG1hc2s7Cj4g
IAo+ICtERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWShjcHVtYXNrX3Zhcl90LCBzZW5kX2lwaV9j
cHVtYXNrKTsKCi4uLiB0aGlzIGdldHMgY29tcGlsZWQgd2l0aCBoYXZpbmcgc2VlbiB0aGUgZGVj
bGFyYXRpb24sIHN1Y2gKdGhhdCBpZiBvbmUgZ2V0cyBjaGFuZ2VkIHdpdGhvdXQgYWxzbyBjaGFu
Z2luZyB0aGUgb3RoZXIsIHRoZQpidWlsZCB3aWxsIGJyZWFrLgoKRXZlcnl0aGluZyBlbHNlIGxv
b2tzIGZpbmUgdG8gbWUuCgpKYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
