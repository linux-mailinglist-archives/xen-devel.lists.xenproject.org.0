Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF35A11307C
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2019 18:06:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icY5E-0002fL-KB; Wed, 04 Dec 2019 17:05:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qu5=Z2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icY5D-0002fG-IO
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2019 17:04:59 +0000
X-Inumbo-ID: 334487b4-16b8-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 334487b4-16b8-11ea-a0d2-bc764e2007e4;
 Wed, 04 Dec 2019 17:04:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 64D8AB126;
 Wed,  4 Dec 2019 17:04:57 +0000 (UTC)
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20191204151208.37076-1-roger.pau@citrix.com>
 <77e8cd84-07ec-3219-a588-211c376d99bc@suse.com>
 <20191204161834.GM980@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9b099b26-4a91-5db5-8d02-6cfe0a91a997@suse.com>
Date: Wed, 4 Dec 2019 18:05:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191204161834.GM980@Air-de-Roger>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] x86: do not enable global pages when
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

T24gMDQuMTIuMjAxOSAxNzoxOCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBXZWQsIERl
YyAwNCwgMjAxOSBhdCAwNToxMTo0MlBNICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24g
MDQuMTIuMjAxOSAxNjoxMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+Pj4gQEAgLTEzMCw3ICsx
NDMsNyBAQCB1bnNpZ25lZCBsb25nIHB2X21ha2VfY3I0KGNvbnN0IHN0cnVjdCB2Y3B1ICp2KQo+
Pj4gICAgICAgKi8KPj4+ICAgICAgaWYgKCBkLT5hcmNoLnB2LnBjaWQgKQo+Pj4gICAgICAgICAg
Y3I0IHw9IFg4Nl9DUjRfUENJREU7Cj4+PiAtICAgIGVsc2UgaWYgKCAhZC0+YXJjaC5wdi54cHRp
ICkKPj4+ICsgICAgZWxzZSBpZiAoICFkLT5hcmNoLnB2LnhwdGkgJiYgb3B0X2dsb2JhbF9wYWdl
cyApCj4+PiAgICAgICAgICBjcjQgfD0gWDg2X0NSNF9QR0U7Cj4+Cj4+IEknbSBzb3JyeSBmb3Ig
bm90aWNpbmcgdGhpcyBvbmx5IG5vdywgYnV0IHdoYXQgYWJvdXQgWEVOX01JTklNQUxfQ1I0LAo+
PiB3aGljaCBpbmNsdWRlcyBYODZfQ1I0X1BHRT8KPiAKPiBJJ3ZlIHRyaWVkIHJlbW92aW5nIFBH
RSBmcm9tIFhFTl9NSU5JTUFMX0NSNCBidXQgaXQgbWFkZSBubyBub3RpY2VhYmxlCj4gcGVyZm9y
bWFuY2UgZGlmZmVyZW5jZSwgc28gSSBsZWZ0IGl0IGFzLWlzLgoKTXkgY29uY2VybiBpc24ndCBh
Ym91dCBwZXJmb3JtYW5jZSwgYnV0IGNvcnJlY3RuZXNzLiBJIGFkbWl0IEkKZm9yZ290IGZvciBh
IG1vbWVudCB0aGF0IHdlIG5vdyBhbHdheXMgd3JpdGUgQ1I0ICh1bmxlc3MgdGhlCmNhY2hlZCB2
YWx1ZSBtYXRjaGVzIHRoZSBpbnRlbmRlZCBuZXcgb25lKS4gWWV0Cm1tdV9jcjRfZmVhdHVyZXMg
KHN0YXJ0aW5nIG91dCBhcyBYRU5fTUlOSU1BTF9DUjQpIGlzIHN0aWxsIG9mCmNvbmNlcm4uCgpJ
IHRoaW5rIHRoaXMgYXQgbGVhc3QgcmVxdWlyZXMgZXh0ZW5kaW5nIHRoZSBkZXNjcmlwdGlvbiB0
bwpkaXNjdXNzIHRoZSBjb3JyZWN0bmVzcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
