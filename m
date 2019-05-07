Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A624616798
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 18:15:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO2hY-0006zk-3k; Tue, 07 May 2019 16:12:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VLhp=TH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hO2hW-0006zd-IH
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 16:12:18 +0000
X-Inumbo-ID: e2447a52-70e2-11e9-843c-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e2447a52-70e2-11e9-843c-bc764e045a96;
 Tue, 07 May 2019 16:12:17 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Tue, 07 May 2019 10:12:16 -0600
Message-Id: <5CD1AE5D020000780022C9AF@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.0 
Date: Tue, 07 May 2019 10:12:13 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Marek Marczykowski" <marmarek@invisiblethingslab.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
 <5CD14B6E020000780022C646@prv1-mh.provo.novell.com>
 <20190507153825.GA1502@mail-itl>
In-Reply-To: <20190507153825.GA1502@mail-itl>
Mime-Version: 1.0
Content-Disposition: inline
Subject: Re: [Xen-devel] [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDA3LjA1LjE5IGF0IDE3OjM4LCA8bWFybWFyZWtAaW52aXNpYmxldGhpbmdzbGFiLmNv
bT4gd3JvdGU6Cj4gV2hhdCBkbyB5b3UgdGhpbmsgYWJvdXQgYWRkaW5nIHNvbWV0aGluZyB0aGF0
IGNvdWxkIGJlIGJhY2twb3J0ZWQ/Cj4gWGVuIGlzIHF1aXRlIGluc2lzdGVudCBvbiBpbml0aWFs
aXppbmcgZnJhbWVidWZmZXIsIGV2ZW4gd2l0aAo+IGNvbnNvbGU9Y29tMSBvciBjb25zb2xlPW5v
bmUuIFdoaWNoIG1lYW5zLCB0aGVyZSBpcyBubyB3b3JrYXJvdW5kIGZvcgo+IHRoaXMgcHJvYmxl
bS4KCldoZW4gdGhlIHN5c3RlbSBpcyBpbiBhIHNpbXBsZSB0ZXh0IG1vZGUgdGhlIC9iYXNldmlk
ZW8gb3B0aW9uIG9mCnhlbi5lZmkgb3VnaHQgdG8gaGVscCwgYnV0IGlmIGl0J3MgaW4gYW4gTEZC
LWJhc2VkIG1vZGUgYWxyZWFkeSAod2hpY2gKaXMgdGhlIGNhc2Ugb24gdGhlIHN5c3RlbXMgSSBo
YXZlKSB0aGVuIGluZGVlZCBJIGNhbid0IHNlZSBhbnkKd29ya2Fyb3VuZC4KCj4gTWF5YmUsIGFz
IGEgZmlyc3Qgc3RlcCwgYSBjaGFuZ2UgdGhhdCBhYm9ydCBmcmFtZWJ1ZmZlciBpbml0aWFsaXph
dGlvbgo+IGlmIGxmYl9iYXNlID09IDAgKEkgYXNzdW1lIHRoaXMgaXMgbmV2ZXIgdmFsaWQgdmFs
dWUgaGVyZSwgcmlnaHQ/KT8KClllcywgdGhhdCB3b3VsZCBiZSBhbiBvcHRpb24uIEJ1dCBpdCB3
b3VsZCBoZWxwIG9ubHkgaW4geW91ciBzcGVjaWZpYwpjYXNlLCBub3QgaWYgdGhlIHRydW5jYXRp
b24gcmVzdWx0cyBpbiBhIG5vbi16ZXJvIHZhbHVlLiBJIGd1ZXNzIHdlJ2QKYmV0dGVyIGF2b2lk
IGZpbGxpbmcgdGhlIHN0cnVjdHVyZSBpZiB3ZSdkIHRydW5jYXRlIHRoZSB2YWx1ZS4KCkJ1dCB3
aGF0J3Mgd3Jvbmcgd2l0aCBiYWNrcG9ydGluZyB5b3VyIGNoYW5nZSBhcyBpcz8KCj4gSWYgbm90
LCB0aGVuIGF0IGxlYXN0IGFib3J0IGJvb3Qgd2hlbiB0ZXh0IGNvbnNvbGUgaXMgc3RpbGwgdGhl
cmUKPiAoYmxleGl0IGJlZm9yZSBlZmlfZXhpdF9ib290KS4gQW55IHByZWZlcmVuY2U/CgpXaGF0
J3Mgd3Jvbmcgd2l0aCB0aGUgdGV4dCBjb25zb2xlIHN0aWxsIGFjdGl2ZT8gT3IgbWF5YmUgSSdt
Cm1pc3VuZGVyc3RhbmRpbmcgdGhpcyBwb2ludCB5b3UgbWFrZS4uLgoKSmFuCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
