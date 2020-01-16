Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DFD13D870
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jan 2020 11:59:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1is2p6-00065P-3N; Thu, 16 Jan 2020 10:56:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1is2p5-00065K-7t
 for xen-devel@lists.xenproject.org; Thu, 16 Jan 2020 10:56:23 +0000
X-Inumbo-ID: d373a29e-384e-11ea-86f9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d373a29e-384e-11ea-86f9-12813bfff9fa;
 Thu, 16 Jan 2020 10:56:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EABCBB33A;
 Thu, 16 Jan 2020 10:56:18 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200114181345.27565-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <32fee1fe-3269-fea5-7fd8-74ecdc152a5d@suse.com>
Date: Thu, 16 Jan 2020 11:56:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200114181345.27565-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/hvmloader: align BAR position to 4K
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDEuMjAyMCAxOToxMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gcGxhY2lu
ZyBCQVJzIHdpdGggc2l6ZXMgc21hbGxlciB0aGFuIDRLIG11bHRpcGxlIEJBUnMgY2FuIGVuZAo+
IHVwIG1hcHBlZCB0byB0aGUgc2FtZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzLCBhbmQgdGh1cyB3
b24ndCB3b3JrCj4gY29ycmVjdGx5LgoKQkFScyBvZiB0aGUgc2FtZSBkZXZpY2UgY2FuIHZlcnkg
d2VsbCBzaGFyZSBhIHBhZ2UgaW4gdGhlIGNvbW1vbgpjYXNlLCBjYW4ndCB0aGV5PyAoVGhlcmUg
bWF5IGJlIHJlYXNvbnMsIGxpa2UgdGhpbmdzIGdldHRpbmcgdG9vCmNvbXBsaWNhdGVkLCBmb3Ig
bm90IGFjdHVhbGx5IGhvbm9yaW5nIHRoaXMsIGJ1dCB0aGVuIHRoZQpkZXNjcmlwdGlvbiBzaG91
bGQgc2F5IHNvIGltby4pCgo+IEFsaWduIGFsbCBCQVJzIHBsYWNlbWVudCB0byA0SyBpbiBodm1s
b2FkZXIgdG8gcHJldmVudCBzdWNoCj4gb3ZlcmxhcHBpbmcuCj4gCj4gTm90ZSB0aGF0IHRoZSBn
dWVzdCBjYW4gc3RpbGwgbW92ZSB0aGUgQkFScyBhcm91bmQgYW5kIGNyZWF0ZSB0aGlzCj4gY29s
bGlzaW9ucywgYW5kIHRoYXQgQkFScyBub3QgZmlsbGluZyB1cCBhIHBoeXNpY2FsIHBhZ2UgbWln
aHQgbGVhawo+IGFjY2VzcyB0byBvdGhlciBNTUlPIHJlZ2lvbnMgcGxhY2VkIGluIHRoZSBzYW1l
IGhvc3QgcGh5c2ljYWwgcGFnZS4KClRocm91Z2hvdXQgdGhlIGRlc2NyaXB0aW9uIGFuZCBpbiB0
aGUgdGl0bGUgSSB0aGluayB5b3Ugd291bGQKYmV0dGVyIHNheSAibWVtb3J5IEJBUiIuCgo+IC0t
LSBhL3Rvb2xzL2Zpcm13YXJlL2h2bWxvYWRlci9wY2kuYwo+ICsrKyBiL3Rvb2xzL2Zpcm13YXJl
L2h2bWxvYWRlci9wY2kuYwo+IEBAIC00ODksNiArNDg5LDEwIEBAIHZvaWQgcGNpX3NldHVwKHZv
aWQpCj4gIAo+ICAgICAgICAgIHJlc291cmNlLT5iYXNlID0gYmFzZTsKPiAgCj4gKyAgICAgICAg
aWYgKCAoYmFyX2RhdGEgJiBQQ0lfQkFTRV9BRERSRVNTX1NQQUNFKSA9PQo+ICsgICAgICAgICAg
ICAgUENJX0JBU0VfQUREUkVTU19TUEFDRV9NRU1PUlkgKQo+ICsgICAgICAgICAgICByZXNvdXJj
ZS0+YmFzZSA9IFJPVU5EVVAocmVzb3VyY2UtPmJhc2UsIFBBR0VfU0laRSk7CgpEb2Vzbid0IHRo
aXMgbmVlZCBhZGp1c3RtZW50cyB0byB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIE1NSU8KaG9sZSBz
aXplIGhpZ2hlciB1cCBpbiB0aGUgZnVuY3Rpb24/CgpBbHNvLCBhcyBwZXIgYSBmZXcgbGluZXMg
dXAsIHBlcmhhcHMKCiAgICAgICAgaWYgKCByZXNvdXJjZSA9PSAmbWVtX3Jlc291cmNlKQoKPwoK
SmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
