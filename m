Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E63BE11841F
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2019 10:52:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iec9J-0003a7-Im; Tue, 10 Dec 2019 09:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1mH3=2A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iec9I-0003a2-P8
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2019 09:49:44 +0000
X-Inumbo-ID: 6448d1ac-1b32-11ea-890b-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6448d1ac-1b32-11ea-890b-12813bfff9fa;
 Tue, 10 Dec 2019 09:49:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D7060B230;
 Tue, 10 Dec 2019 09:49:42 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191209173757.46833-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2f254221-04c9-a4ce-a776-cacd7fbc9b6c@suse.com>
Date: Tue, 10 Dec 2019 10:50:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191209173757.46833-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] x86: do not enable global pages when
 virtualized on AMD hardware
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
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTIuMjAxOSAxODozNywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gdXNpbmcg
Z2xvYmFsIHBhZ2VzIGEgZnVsbCB0bGIgZmx1c2ggY2FuIG9ubHkgYmUgcGVyZm9ybWVkIGJ5Cj4g
dG9nZ2xpbmcgdGhlIFBHRSBiaXQgaW4gQ1I0LCB3aGljaCBpcyB1c3VhbGx5IHF1aXRlIGV4cGVu
c2l2ZSBpbiB0ZXJtcwo+IG9mIHBlcmZvcm1hbmNlIHdoZW4gcnVubmluZyB2aXJ0dWFsaXplZC4g
VGhpcyBpcyBzcGVjaWFsbHkgcmVsZXZhbnQgb24KPiBBTUQgaGFyZHdhcmUsIHdoaWNoIGRvZXNu
J3QgaGF2ZSB0aGUgYWJpbGl0eSB0byBkbyBzZWxlY3RpdmUgQ1I0Cj4gdHJhcHBpbmcsIGJ1dCBj
YW4gYWxzbyBiZSByZWxldmFudCBvbiBJbnRlbCBpZiB0aGUgdW5kZXJseWluZwo+IGh5cGVydmlz
b3IgYWxzbyB0cmFwcyBhY2Nlc3NlcyB0byB0aGUgUEdFIENSNCBiaXQuCj4gCj4gSW4gb3JkZXIg
dG8gYXZvaWQgdGhpcyBwZXJmb3JtYW5jZSBwZW5hbHR5LCBkbyBub3QgdXNlIGdsb2JhbCBwYWdl
cwo+IHdoZW4gcnVubmluZyB2aXJ0dWFsaXplZCBvbiBBTUQgaGFyZHdhcmUuIEEgY29tbWFuZCBs
aW5lIG9wdGlvbgo+ICdnbG9iYWwtcGFnZXMnIGlzIHByb3ZpZGVkIGluIG9yZGVyIHRvIGFsbG93
IHRoZSB1c2VyIHRvIHNlbGVjdAo+IHdoZXRoZXIgZ2xvYmFsIHBhZ2VzIHdpbGwgYmUgZW5hYmxl
ZCBmb3IgUFYgZ3Vlc3RzLgo+IAo+IFRoZSBhYm92ZSBmaWd1cmVzIGFyZSBmcm9tIGEgUFYgc2hp
bSBydW5uaW5nIG9uIEFNRCBoYXJkd2FyZSB3aXRoCj4gMzIgdkNQVXM6Cj4gCj4gUEdFIGVuYWJs
ZWQsIHgyQVBJQyBtb2RlOgo+IAo+IChYRU4pIEdsb2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9
ZmZmZjgyZDA4MDRiMDFjMCwgbG9ja3ZhbD0xYWRiMWFkYiwgbm90IGxvY2tlZAo+IChYRU4pICAg
bG9jazoxODQxODgzKDEzNzUxMjg5OTg1NDMpLCBibG9jazoxNjU4NzE2KDEwMTkzMDU0ODkwNzgx
KQo+IAo+IEF2ZXJhZ2UgbG9jayB0aW1lOiAgIDc0NjU4OG5zCj4gQXZlcmFnZSBibG9jayB0aW1l
OiA2MTQ1MTQ3bnMKPiAKPiBQR0UgZGlzYWJsZWQsIHgyQVBJQyBtb2RlOgo+IAo+IChYRU4pIEds
b2JhbCBsb2NrIGZsdXNoX2xvY2s6IGFkZHI9ZmZmZjgyZDA4MDRhZjFjMCwgbG9ja3ZhbD1hOGJm
YThiZiwgbm90IGxvY2tlZAo+IChYRU4pICAgbG9jazoyNzMwMTc1KDY1NzUwNTM4OTg4NiksIGJs
b2NrOjIwMzk3MTYoMjk2Mzc2ODI0NzczOCkKPiAKPiBBdmVyYWdlIGxvY2sgdGltZTogICAyNDA4
Mjlucwo+IEF2ZXJhZ2UgYmxvY2sgdGltZTogMTQ1MzAyOW5zCj4gCj4gQXMgc2VlbiBmcm9tIHRo
ZSBhYm92ZSBmaWd1cmVzIHRoZSBsb2NrIGFuZCBibG9jayB0aW1lIG9mIHRoZSBmbHVzaAo+IGxv
Y2sgaXMgcmVkdWNlZCB0byBhcHByb3hpbWF0ZWx5IDEvMyBvZiB0aGUgb3JpZ2luYWwgdmFsdWUu
Cj4gCj4gTm90ZSB0aGF0IFhFTl9NSU5JTUFMX0NSNCBhbmQgbW11X2NyNF9mZWF0dXJlcyBhcmUg
bm90IG1vZGlmaWVkLCBhbmQKPiB0aHVzIGdsb2JhbCBwYWdlcyBhcmUgbGVmdCBlbmFibGVkIGZv
ciB0aGUgaHlwZXJ2aXNvci4gVGhpcyBpcyBub3QgYW4KPiBpc3N1ZSBiZWNhdXNlIHRoZSBjb2Rl
IHRvIHN3aXRjaCB0aGUgY29udHJvbCByZWdpc3RlcnMgKGNyMyBhbmQgY3I0KQo+IGFscmVhZHkg
dGFrZXMgaW50byBhY2NvdW50IHN1Y2ggc2l0dWF0aW9uIGFuZCBwZXJmb3JtcyB0aGUgbmVjZXNz
YXJ5Cj4gZmx1c2hlcy4gVGhlIHNhbWUgYWxyZWFkeSBoYXBwZW5zIHdoZW4gdXNpbmcgWFBUSSBv
ciBQQ0lERSwgYXMgdGhlCj4gZ3Vlc3QgY3I0IGRvZXNuJ3QgaGF2ZSBnbG9iYWwgcGFnZXMgZW5h
YmxlZCBpbiB0aGF0IGNhc2UgZWl0aGVyLgo+IAo+IEFsc28gbm90ZSB0aGF0IHRoZSBzdXNwZW5k
IGFuZCByZXN1bWUgY29kZSBpcyBjb3JyZWN0IGluIHdyaXRpbmcKPiBtbXVfY3I0X2ZlYXR1cmVz
IGludG8gY3I0IG9uIHJlc3VtZSwgc2luY2UgdGhhdCdzIHRoZSBjcjQgdXNlZCBieSB0aGUKPiBp
ZGxlIHZDUFUgd2hpY2ggaXMgdGhlIGNvbnRleHQgdXNlZCBieSB0aGUgc3VzcGVuZCBhbmQgcmVz
dW1lIHJvdXRpbmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
