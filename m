Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8ED817BF21
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 14:38:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAD91-0004dk-9C; Fri, 06 Mar 2020 13:36:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JlMq=4X=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jAD8z-0004df-Pj
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 13:36:01 +0000
X-Inumbo-ID: 6ad9d63a-5faf-11ea-b52f-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ad9d63a-5faf-11ea-b52f-bc764e2007e4;
 Fri, 06 Mar 2020 13:36:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B00EAC67;
 Fri,  6 Mar 2020 13:36:00 +0000 (UTC)
To: Paul Durrant <xadimgnik@gmail.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
 <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
 <132bb159fcf049ae87e402537ccc7d2a@EX13D32EUC003.ant.amazon.com>
 <b9bb89e1-1490-c3e6-11b6-f6944750a791@suse.com>
 <f361c33b-1fdd-d296-edb3-3dbe8d0bc18b@xen.org>
 <7170eda8579cc4c9e6a899980a87e0eb0e9c71cd.camel@amazon.co.uk>
 <7de58cb0-d8b5-ea86-f573-151356edbb79@suse.com>
 <d14b125acb6f22db084d889b4b1abcf5e5b1815e.camel@infradead.org>
 <bc28ea41-0d13-4182-db2e-9eeaf4408e3b@suse.com>
 <dc77e892d554d671e609374df8f2d19e88dc357b.camel@infradead.org>
 <54f5cb50-ebe6-7dc9-d46c-6b7a8f388577@suse.com>
 <007f01d5f3b9$110d20b0$33276210$@xen.org>
 <733e2b6c-c0b2-39a7-7def-0d18ca280649@suse.com>
 <00cc01d5f3ba$e3a89300$aaf9b900$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <91c6ffa0-a53e-86a5-4544-935616bb3eee@suse.com>
Date: Fri, 6 Mar 2020 14:36:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <00cc01d5f3ba$e3a89300$aaf9b900$@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org, konrad.wilk@oracle.com,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 'David Woodhouse' <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDYuMDMuMjAyMCAxNDoyNiwgUGF1bCBEdXJyYW50IHdyb3RlOgo+PiBGcm9tOiBYZW4tZGV2
ZWwgPHhlbi1kZXZlbC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2Yg
SmFuIEJldWxpY2gKPj4gU2VudDogMDYgTWFyY2ggMjAyMCAxMzoyNAo+Pgo+PiBPbiAwNi4wMy4y
MDIwIDE0OjEzLCBQYXVsIER1cnJhbnQgd3JvdGU6Cj4+PiBNeSBhaW0gaXMgdG8gbWFrZSB0aGUg
c2VwYXJhdGlvbiBhYnVuZGFudGx5IG9idmlvdXMgYnkgZ2V0dGluZyByaWQKPj4+IG9mIHNoYXJl
ZCB4ZW5oZWFwIHBhZ2VzIChmb3Igbm9uLXN5c3RlbSBkb21haW5zIGF0IGxlYXN0KSBidXQgSQo+
Pj4gY2FuJ3QgZG8gdGhhdCBiZWZvcmUgY29udmVydGluZyBzaGFyZWRfaW5mbyBhbmQgZ3JhbnQg
c2hhcmVkL3N0YXR1cwo+Pj4gZnJhbWVzIHRvIGRvbWhlYXAuCj4+Cj4+IEZvbGxvd2luZyBEYXZp
ZCdzIHZhcmlvdXMgcmVwbGllcyAtIGluc3RlYWQgb2YgZ29pbmcgdGhpcyByb3V0ZSBvZgo+PiBy
ZXBsYWNpbmcgdGhlIHNoYXJpbmcgb2YgeGVuaGVhcCBwYWdlcyBieSBkaWZmZXJlbnQgbG9naWMs
IHRoZQo+PiBzYW1lIG91Z2h0IHRvIGJlIGFjaGlldmFibGUgYnkgbWFraW5nIHRoZSBiYWNraW5n
IGFsbG9jYXRpb25zIGNvbWUKPj4gZnJvbSB0aGUgY29ycmVjdCBwb29sPwo+Pgo+IAo+IEkgc3Rp
bGwgcHJlZmVyIHRoZSBzaW1wbGlmaWNhdGlvbiBvZiBub3QgaGF2aW5nIHRvIGNsZWFuIHVwIHRo
ZQo+IHNoYXJlZCB4ZW5oZWFwIHBhZ2UgbGlzdCBpbiBkb21haW5fa2lsbCgpIHNvIElNTyBpdCBp
cyBzdGlsbCB3b3J0aAo+IGl0IGZvciB0aGF0IGFsb25lLgoKSSBkb24ndCBzZWUgYW55dGhpbmcg
dmVyeSBzcGVjaWFsIHdpdGggdGhlIGNsZWFuaW5nIHVwIGluCmRvbWFpbl9raWxsKCkgLyBkb21h
aW5fcmVsaW5xdWlzaF9yZXNvdXJjZXMoKS4gV2hhdCBJJ2QgdmlldyBhcwptb3JlIGRlc2lyYWJs
ZSBpbiB0aGlzIHJlZ2FyZCBpcyB0aGUgZ2VuZXJhbCBmYWN0IG9mIG5lZWRpbmcKdHdvIGxpc3Rz
LiBCdXQgeW91IHJlYWxpemUgdGhlcmUncyBhIGRvd25zaWRlIHRvIHRoaXMgYXMgd2VsbD8KZHVt
cF9wYWdlZnJhbWVfaW5mbygpIHdpbGwgcmVsaWFibHkgc2hvdyBfYWxsXyBYZW4gaGVhcCBwYWdl
cwphc3NvY2lhdGVkIHdpdGggYSBkb21haW4sIGJ1dCBpdCB3aWxsIG9ubHkgZXZlciBzaG93IHVw
IHRvIDEwCnBhZ2VzIG9uIC0+cGFnZV9saXN0IGZvciBhIGRvbWFpbiB0aGF0J3Mgbm90IGFscmVh
ZHkgYmVpbmcKY2xlYW5lZCB1cC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
