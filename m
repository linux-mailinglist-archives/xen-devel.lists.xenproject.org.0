Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2851D01
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2019 23:20:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hfWLw-0005Mg-Qe; Mon, 24 Jun 2019 21:18:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=VJaK=UX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hfWLv-0005Mb-6H
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2019 21:18:15 +0000
X-Inumbo-ID: 936ba8c4-96c5-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 936ba8c4-96c5-11e9-8980-bc764e045a96;
 Mon, 24 Jun 2019 21:18:13 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A27E344;
 Mon, 24 Jun 2019 14:18:13 -0700 (PDT)
Received: from [10.37.9.192] (unknown [10.37.9.192])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9BE833F71E;
 Mon, 24 Jun 2019 14:18:12 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <a7c44d926cbe4a0e6447c4aaf8d9862e@sslemail.net>
 <af3fe48d-afaa-3184-e142-9a1e2b8574f4@arm.com>
 <2ed30cde-e2ab-745e-94f5-0cf6155c9122@mxnavi.com>
 <7c645dfb-72f5-5fc2-b559-0a4d09ba8801@arm.com>
 <36531850-15de-2642-6f28-c752a360959c@mxnavi.com>
 <alpine.DEB.2.21.1906241109440.2468@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.1906241121070.2468@sstabellini-ThinkPad-T480s>
 <bc042ae4-db0a-6b25-1e9c-d71a73a0315d@arm.com>
 <alpine.DEB.2.21.1906241313480.2468@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <c253cdaf-658d-01ce-9d32-273db4a84f17@arm.com>
Date: Mon, 24 Jun 2019 22:18:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906241313480.2468@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: io: add function
 swap_mmio_handler()
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
Cc: chenbaodong <chenbaodong@mxnavi.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA2LzI0LzE5IDk6MTcgUE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPiBPbiBN
b24sIDI0IEp1biAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4+IEhpIFN0ZWZhbm8sCj4+Cj4+
IE9uIDI0LzA2LzIwMTkgMTk6MjcsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIE1v
biwgMjQgSnVuIDIwMTksIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+PiBPbiBUaHUsIDEz
IEp1biAyMDE5LCBjaGVuYmFvZG9uZyB3cm90ZToKPj4+IExldCBtZSBhZGQgdGhhdCBpZiB5b3Ug
cHJlZmVyIHRvIGRvY3VtZW50IG9uZSBvZiB0aGUgb3RoZXIgaW50ZXJmYWNlcwo+Pj4gbGlzdGVk
IGFib3ZlIGluIG15IGVtYWlsLCB5b3UgYXJlIHdlbGNvbWUgdG8gcGljayBhbm90aGVyIG9uZS4g
Rm9yCj4+PiBleGFtcGxlLCB3ZSBhcmUgYWxzbyBtaXNzaW5nIGEgZG9jIGFib3V0IHRoZSBEb21V
IG1lbW9yeSBtYXAsIGxpc3RpbmcKPj4+IGFsbCBtZW1vcnkgcmVnaW9ucyB3aXRoIGFkZHJlc3Nl
cyBhbmQgc2l6ZXMsIGJvdGggTU1JTyBhbmQgbm9ybWFsCj4+PiBtZW1vcnkuIEZvciB0aGF0LCBt
b3N0IG9mIHRoZSBpbmZvcm1hdGlvbiBpczoKPj4+Cj4+PiB4ZW4vaW5jbHVkZS9wdWJsaWMvYXJj
aC1hcm0uaAo+Pj4KPj4+IEEgd2VsbCB3cml0dGVuIGluLWNvZGUgY29tbWVudCBpbiBhcmNoLWFy
bS5oIHdvdWxkIGJlIE9LLCBvciBhbHNvIGEKPj4+IGRvY3VtZW50IHVuZGVyIGRvY3MvbWlzYy9h
cm0uCj4+Cj4+IFBsZWFzZSBubyBkdXBsaWNhdGlvbiwgaXQgaXMgYWxyZWFkeSBxdWl0ZSBoYXJk
IHRvIG1haW50YWluIG9uZSBwbGFjZS4KPj4gSW5zdGVhZCwgd2Ugc2hvdWxkIGRvY3VtZW50IGFs
bCB0aGUgaGVhZGVycyBpbiBhIGRvY3VtZW50ZWQgZm9ybWF0IHRoYXQKPj4gY2FuIGJlIGV4dHJh
Y3RlZCBhdXRvbWF0aWNhbGx5Lgo+IAo+IEFzIHdlIGhhdmUgbm8gc3VjaCB0aGluZyB0b2RheSAo
YXMgZmFyIGFzIEkgYW0gYXdhcmUpLCBwbGVhc2UgbWFrZSBhCj4gcHJvcG9zYWwgd2l0aCBhIGJp
dCBtb3JlIGRldGFpbHMsIG90aGVyd2lzZSBJIGRvbid0IHRoaW5rIEJhb2Rvbmcgd2lsbAo+IGJl
IGFibGUgdG8gdGFrZSB0aGUgbmV4dCBzdGVwLgoKSSBkb24ndCBoYXZlIGEgY29uY3JldGUgcHJv
cG9zYWwgc28gZmFyLiBFeGNlcHQgdGhhdCBkb2N1bWVudGF0aW9uIApvdXRzaWRlIG9mIHRoZSBo
ZWFkZXJzIGlzIGEgbm8tZ28gZnJvbSBteSBzaWRlLiBUaGUgZ29hbCBvZiBkb2N1bWVudGluZyAK
d2l0aGluIHRoZSBoZWFkZXJzIHJhdGhlciB0aGFuIG91dHNpZGUgaXMgeW91IGFsc28gaGVscCB0
aGUgZGV2ZWxvcGVyIG9mIApndWVzdCBPUy4KCkEgZmV3IHdlZWtzIGFnbyBJYW4gSmFja3NvbiBw
b2ludGVkIHRvIGRvY3MveGVuLWhlYWRlcnMgZm9yIGEgcG90ZW50aWFsIApzeW50YXguIFNhZGx5
LCB0aGVyZSBhcmUgbm8gZG9jdW1lbnRhdGlvbiBvZiB0aGUgc2NyaXB0IHNvIGZhci4gSSAKaGF2
ZW4ndCBoYWQgdGltZSB0byBsb29rIGl0IHNvIGZhci4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
