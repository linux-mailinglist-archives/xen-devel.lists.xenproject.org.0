Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23310D0BE6
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 11:54:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI8bH-00064y-Cs; Wed, 09 Oct 2019 09:49:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=GB/u=YC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iI8bG-00064t-Js
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 09:49:42 +0000
X-Inumbo-ID: 1d2bf1fc-ea7a-11e9-80e3-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d2bf1fc-ea7a-11e9-80e3-bc764e2007e4;
 Wed, 09 Oct 2019 09:49:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 307F4AF85;
 Wed,  9 Oct 2019 09:49:40 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191009083321.1743-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a82f6b0-e79f-261f-de6f-a88ab8cd53ee@suse.com>
Date: Wed, 9 Oct 2019 11:49:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009083321.1743-1-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] pci: clear {host/guest}_maskall field on
 assign
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stanislav Spassov <stanspas@amazon.de>, xen-devel@lists.xenproject.org,
 Chao Gao <chao.gao@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDkuMTAuMjAxOSAxMDozMywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uIG9mIGhvc3RfbWFza2FsbCBtYWtlcyBpdCBzdGlja3kgYWNyb3NzCj4g
YXNzaWduIGFuZCBkZWFzc2lnbiBjYWxscywgd2hpY2ggbWVhbnMgdGhhdCBvbmNlIGEgZ3Vlc3Qg
Zm9yY2VzIFhlbiB0bwo+IHNldCBob3N0X21hc2thbGwgdGhlIG1hc2thbGwgYml0IGlzIG5vdCBn
b2luZyB0byBiZSBjbGVhcmVkIHVudGlsIGEKPiBjYWxsIHRvIFBIWVNERVZPUF9wcmVwYXJlX21z
aXggaXMgcGVyZm9ybWVkLiBTdWNoIGNhbGwgaG93ZXZlcgo+IHNob3VsZG4ndCBiZSBwYXJ0IG9m
IHRoZSBub3JtYWwgZmxvdyB3aGVuIGRvaW5nIFBDSSBwYXNzdGhyb3VnaCwgYW5kCj4gaGVuY2Ug
dGhlIGZsYWcgbmVlZHMgdG8gYmUgY2xlYXJlZCB3aGVuIGFzc2lnbmluZyBpbiBvcmRlciB0byBw
cmV2ZW50Cj4gaG9zdF9tYXNrYWxsIGJlaW5nIGNhcnJpZWQgb3ZlciBmcm9tIHByZXZpb3VzIGFz
c2lnbmF0aW9ucy4KPiAKPiBOb3RlIHRoYXQgdGhlIGVudHJ5IG1hc2tiaXQgaXMgcmVzZXQgd2hl
biB0aGUgbXNpeCBjYXBhYmlsaXR5IGlzCj4gaW5pdGlhbGl6ZWQsIGFuZCB0aGUgZ3Vlc3RfbWFz
a2FsbCBmaWVsZCBpcyBhbHNvIGNsZWFyZWQgc28gdGhhdCB0aGUKPiBoYXJkd2FyZSB2YWx1ZSBt
YXRjaGVzIFhlbidzIGludGVybmFsIHN0YXRlIChoYXJkd2FyZSBtYXNrYWxsID0KPiBob3N0X21h
c2thbGwgfMKgZ3Vlc3RfbWFza2FsbCkuCj4gCj4gQWxzbyBub3RlIHRoYXQgZG9pbmcgdGhlIHJl
c2V0IG9mIGhvc3RfbWFza2FsbCB0aGVyZSB3b3VsZCBhbGxvdyB0aGUKPiBndWVzdCB0byByZXNl
dCBzdWNoIGZpZWxkIGJ5IGVuYWJsaW5nIGFuZCBkaXNhYmxpbmcgTVNJWCwgd2hpY2ggaXMgbm90
Cj4gaW50ZW5kZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIu
cGF1QGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2Uu
Y29tPgoKSSdtIGFsc28gQ2MtaW5nIErDvHJnZW4gZm9yIGEgcG9zc2libGUgcmVsZWFzZSBhY2sg
Zm9yIDQuMTMsIGJ1dApJJ2QgYWxzbyBsaWtlIHRvIHBvaW50IG91dCB0aGF0IEknZCBwcmVmZXIg
dG8gd2FpdCBhIGxpdHRsZSB3aXRoCmNvbW1pdHRpbmcgdGhpcyB0byBnZXQgYXQgbGVhc3Qgb25l
IFRlc3RlZC1ieS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
