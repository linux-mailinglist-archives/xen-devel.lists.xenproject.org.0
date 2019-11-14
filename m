Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0058FC5AE
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 12:51:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVDcO-00086M-Et; Thu, 14 Nov 2019 11:48:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H8L6=ZG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iVDcN-00086G-8E
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 11:48:55 +0000
X-Inumbo-ID: bb66c966-06d4-11ea-b678-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb66c966-06d4-11ea-b678-bc764e2007e4;
 Thu, 14 Nov 2019 11:48:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0DC76AE50;
 Thu, 14 Nov 2019 11:48:53 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191114095927.83723-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <465094ae-0a3a-b082-da70-89d1fa4fff74@suse.com>
Date: Thu, 14 Nov 2019 12:49:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191114095927.83723-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13] x86/clang: move and fix .skip check
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMTEuMjAxOSAxMDo1OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC5za2lwIGlzIG9u
bHkgdXNlZCBieSB4ODYgY29kZSwgc28gcGxhY2UgdGhlIGNsYW5nIC5za2lwIHdpdGggbGFiZWxz
Cj4gY2hlY2sgaW4geDg2L1J1bGVzLm1rIGluc3RlYWQgb2YgdGhlIHRvcCBsZXZlbCBSdWxlcy5t
ay4gV2hpbGUgdGhlcmUKPiBhbHNvIGZpeCBhbiBpc3N1ZSB3aXRoIGl0IGJ5IHJlbW92aW5nIHRo
ZSAnXG4nIHdoaWNoIHRyaWdnZXJzIHRoZQo+IGZvbGxvd2luZyBlcnJvcjoKPiAKPiA8c3RkaW4+
OjE6MzE6IGVycm9yOiBtaXNzaW5nIHRlcm1pbmF0aW5nICciJyBjaGFyYWN0ZXIgWy1XZXJyb3Is
LVdpbnZhbGlkLXBwLXRva2VuXQo+IHZvaWQgXyh2b2lkKSB7IGFzbSB2b2xhdGlsZSAoICIuTDA6
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+IDxzdGRpbj46MTozMTogZXJyb3I6
IGV4cGVjdGVkIHN0cmluZyBsaXRlcmFsIGluICdhc20nCj4gPHN0ZGluPjozOjE4OiBlcnJvcjog
bWlzc2luZyB0ZXJtaW5hdGluZyAnIicgY2hhcmFjdGVyIFstV2Vycm9yLC1XaW52YWxpZC1wcC10
b2tlbl0KPiAuc2tpcCAoLkwxIC0gLkwwKSIgKTsgfQo+ICAgICAgICAgICAgICAgICAgXgo+IDxz
dGRpbj46MzoyNDogZXJyb3I6IGV4cGVjdGVkICcpJwo+IC5za2lwICguTDEgLSAuTDApIiApOyB9
Cj4gICAgICAgICAgICAgICAgICAgICAgICBeCj4gPHN0ZGluPjoxOjI5OiBub3RlOiB0byBtYXRj
aCB0aGlzICcoJwo+IHZvaWQgXyh2b2lkKSB7IGFzbSB2b2xhdGlsZSAoICIuTDA6Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4KPiA8c3RkaW4+OjM6MjQ6IGVycm9yOiBleHBlY3RlZCAn
fScKPiAuc2tpcCAoLkwxIC0gLkwwKSIgKTsgfQo+ICAgICAgICAgICAgICAgICAgICAgICAgXgo+
IDxzdGRpbj46MToxNDogbm90ZTogdG8gbWF0Y2ggdGhpcyAneycKPiB2b2lkIF8odm9pZCkgeyBh
c20gdm9sYXRpbGUgKCAiLkwwOgo+ICAgICAgICAgICAgICBeCj4gNSBlcnJvcnMgZ2VuZXJhdGVk
LgoKQXMgc2FpZCBvbiB0aGUgb3RoZXIgdGhyZWFkIC0gSSdtIGFmcmFpZCB0aGVyZSdzIG1vcmUg
dG8gdGhpcyBkaWZmZXJlbmNlCmluIHVuLWVzY2FwaW5nIGJldHdlZW4geW91ciBhbmQgbXkgZW52
aXJvbm1lbnRzLiBJIGFncmVlIHRoZSBuZXdsaW5lcwphcmVuJ3QgbmVlZGVkIGhlcmUgYXQgYWxs
LCBzbyBJJ2QgYmUgZmluZSB0byBnaXZlIG15IFItYiwgYnV0IHdlIG5lZWQgdG8KZnVsbHkgdW5k
ZXJzdGFuZCB0aGUgZGlmZmVyZW5jZXMgaW4gb2JzZXJ2ZWQgYmVoYXZpb3IgYW55d2F5LgoKQWRk
aXRpb25hbGx5IEkgd29uZGVyIHdoZXRoZXIgeW91IHdvdWxkbid0IGJldHRlciByZXRhaW4gdGhl
IG9yaWdpbmFsCnNlcXVlbmNlIG9mIGNoZWNrcywgYnkgcGxhY2luZyB0aGUgY2hlY2sgeW91IG1v
dmUgYXQgdGhlIGJlZ2lubmluZyBvZgp0aGUgImlmZXEgKCQoY2xhbmcpLHkpIiBibG9jayBpbiB4
ODYvUnVsZXMubWsgaW5zdGVhZCBvZiBhdCB0aGUgZW5kLgpUaGF0J2xsIChpaXJjKSBhbHNvIGJl
dHRlciByZXByZXNlbnQgdGhlIGhpc3Rvcnkgb2YgdGhlIGFkZGl0aW9uIG9mCnRoZXNlIGNoZWNr
cyAoYWxzbyBkZW1vbnN0cmF0ZWQgYnkgdGhlIHJlZmVyZW5jZSBidWcgbnVtYmVycykuCgpKYW4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
