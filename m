Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC2142F63
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2020 17:13:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itZdI-0005K6-6C; Mon, 20 Jan 2020 16:10:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1itZdG-0005K0-M3
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2020 16:10:30 +0000
X-Inumbo-ID: 5fc28b37-3b9f-11ea-b99a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5fc28b37-3b9f-11ea-b99a-12813bfff9fa;
 Mon, 20 Jan 2020 16:10:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A7C26AE07;
 Mon, 20 Jan 2020 16:10:27 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200117110811.43321-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <538864f7-f537-be0d-e37b-8f29baf82ee0@suse.com>
Date: Mon, 20 Jan 2020 17:10:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20200117110811.43321-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] x86/hvmloader: round up memory BAR size
 to 4K
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
Cc: xen-devel@lists.xenproject.org, Jason Andryuk <jandryuk@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDEuMjAyMCAxMjowOCwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFdoZW4gcGxhY2lu
ZyBtZW1vcnkgQkFScyB3aXRoIHNpemVzIHNtYWxsZXIgdGhhbiA0SyBtdWx0aXBsZSBtZW1vcnkK
PiBCQVJzIGNhbiBlbmQgdXAgbWFwcGVkIHRvIHRoZSBzYW1lIGd1ZXN0IHBoeXNpY2FsIGFkZHJl
c3MsIGFuZCB0aHVzCj4gd29uJ3Qgd29yayBjb3JyZWN0bHkuCgpUaGlua2luZyBhYm91dCBpdCBh
Z2FpbiwgYXJlbid0IHlvdSBmaXhpbmcgb25lIHBvc3NpYmxlIGNhc2UgYnkKYnJlYWtpbmcgdGhl
IG9wcG9zaXRlIG9uZTogV2hhdCB5b3UgZml4IGlzIHdoZW4gdGhlIHR3byBkaXN0aW5jdApCQVJz
IChvZiB0aGUgc2FtZSBvciBkaWZmZXJlbnQgZGV2aWNlcykgbWFwIHRvIGRpc3RpbmN0IE1GTnMK
KHdoaWNoIHdvdWxkIGhhdmUgcmVxdWlyZWQgYSBzaW5nbGUgR0ZOIHRvIG1hcCB0byBib3RoIG9m
IHRoZXNlCk1GTnMpLiBCdXQgZG9uJ3QgeW91LCBhdCB0aGUgc2FtZSB0aW1lLCBicmVhayB0aGUg
Y2FzZSBvZiB0d28KQkFScyAocGVyaGFwcywgYnV0IG5vdCBuZWNlc3NhcmlseSwgb2YgdGhlIHNh
bWUgcGh5c2ljYWwgZGV2aWNlKQptYXBwaW5nIGJvdGggdG8gdGhlIHNhbWUgTUZOLCBpLmUuIHJl
cXVpcmluZyB0byBoYXZlIHR3byBkaXN0aW5jdApHRk5zIG1hcCB0byBvbmUgTUZOPyAoQXQgbGVh
c3QgZm9yIHRoZSBtb21lbnQgSSBjYW4ndCBzZWUgYSB3YXkKZm9yIGh2bWxvYWRlciB0byBkaXN0
aW5ndWlzaCB0aGUgdHdvIGNhc2VzLikKCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
