Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED88C173CE3
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2020 17:28:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j7iS0-0006ie-EH; Fri, 28 Feb 2020 16:25:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j7iRz-0006iZ-BO
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2020 16:25:19 +0000
X-Inumbo-ID: e88a1770-5a46-11ea-b472-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e88a1770-5a46-11ea-b472-bc764e2007e4;
 Fri, 28 Feb 2020 16:25:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D7FD7AD08;
 Fri, 28 Feb 2020 16:25:17 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200219174354.84726-1-roger.pau@citrix.com>
 <20200219174354.84726-6-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b9b9842-dea7-e223-4057-91b5532faf83@suse.com>
Date: Fri, 28 Feb 2020 17:25:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219174354.84726-6-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v5 5/7] x86/tlb: allow disabling the TLB
 clock
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

T24gMTkuMDIuMjAyMCAxODo0MywgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IFRoZSBUTEIgY2xv
Y2sgaXMgaGVscGZ1bCB3aGVuIHJ1bm5pbmcgWGVuIG9uIGJhcmUgbWV0YWwgYmVjYXVzZSB3aGVu
Cj4gZG9pbmcgYSBUTEIgZmx1c2ggZWFjaCBDUFUgaXMgSVBJJ2VkIGFuZCBjYW4ga2VlcCBhIHRp
bWVzdGFtcCBvZiB0aGUKPiBsYXN0IGZsdXNoLgo+IAo+IFRoaXMgaXMgbm90IHRoZSBjYXNlIGhv
d2V2ZXIgd2hlbiBYZW4gaXMgcnVubmluZyB2aXJ0dWFsaXplZCwgYW5kIHRoZQo+IHVuZGVybHlp
bmcgaHlwZXJ2aXNvciBwcm92aWRlcyBtZWNoYW5pc20gdG8gYXNzaXN0IGluIHBlcmZvcm1pbmcg
VExCCj4gZmx1c2hlczogWGVuIGl0c2VsZiBmb3IgZXhhbXBsZSBvZmZlcnMgYSBIVk1PUF9mbHVz
aF90bGJzIGh5cGVyY2FsbCBpbgo+IG9yZGVyIHRvIHBlcmZvcm0gYSBUTEIgZmx1c2ggd2l0aG91
dCBoYXZpbmcgdG8gSVBJIGVhY2ggQ1BVLiBXaGVuCj4gdXNpbmcgc3VjaCBtZWNoYW5pc21zIGl0
J3Mgbm8gbG9uZ2VyIHBvc3NpYmxlIHRvIGtlZXAgYSB0aW1lc3RhbXAgb2YKPiB0aGUgZmx1c2hl
cyBvbiBlYWNoIENQVSwgYXMgdGhleSBhcmUgcGVyZm9ybWVkIGJ5IHRoZSB1bmRlcmx5aW5nCj4g
aHlwZXJ2aXNvci4KPiAKPiBPZmZlciBhIGJvb2xlYW4gaW4gb3JkZXIgdG8gc2lnbmFsIFhlbiB0
aGF0IHRoZSB0aW1lc3RhbXBlZCBUTEIKPiBzaG91bGRuJ3QgYmUgdXNlZC4gVGhpcyBhdm9pZHMg
a2VlcGluZyB0aGUgdGltZXN0YW1wcyBvZiB0aGUgZmx1c2hlcywKPiBhbmQgYWxzbyBmb3JjZXMg
TkVFRF9GTFVTSCB0byBhbHdheXMgcmV0dXJuIHRydWUuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFu
Z2UgaW50ZW5kZWQsIGFzIHRoaXMgY2hhbmdlIGRvZXNuJ3QgaW50cm9kdWNlIGFueQo+IHVzZXIg
dGhhdCBkaXNhYmxlcyB0aGUgdGltZXN0YW1wZWQgVExCLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IFJldmlld2VkLWJ5OiBXZWkg
TGl1IDx3bEB4ZW4ub3JnPgoKQWNrZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNv
bT4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
