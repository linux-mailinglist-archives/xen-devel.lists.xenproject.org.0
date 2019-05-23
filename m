Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BC278F5
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2019 11:13:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hTjk4-0006Yy-Fe; Thu, 23 May 2019 09:10:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SD5s=TX=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hTjk3-0006Yt-RX
 for xen-devel@lists.xenproject.org; Thu, 23 May 2019 09:10:27 +0000
X-Inumbo-ID: 9a33243d-7d3a-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 9a33243d-7d3a-11e9-8980-bc764e045a96;
 Thu, 23 May 2019 09:10:26 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6330A78;
 Thu, 23 May 2019 02:10:25 -0700 (PDT)
Received: from [10.1.38.70] (prometheus.cambridge.arm.com [10.1.38.70])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F5743F740;
 Thu, 23 May 2019 02:10:24 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <20190422164106.20331-1-julien.grall@arm.com>
 <alpine.DEB.2.10.1904231709250.24598@sstabellini-ThinkPad-X260>
 <d664ac40-a4aa-9967-8534-ea722f8e0724@arm.com>
 <5CE6597D0200007800231998@prv1-mh.provo.novell.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <e2566da4-fa4e-d228-3ee3-7beb80fbab3e@arm.com>
Date: Thu, 23 May 2019 10:10:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CE6597D0200007800231998@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/arm: Allow cleaning the directory even
 when CONFIG_EARLY_PRINTK is set
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgSmFuLAoKVGhhbmsgeW91IGZvciB0aGUgZmVlZGJhY2suCgpPbiA1LzIzLzE5IDk6MjcgQU0s
IEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9uIDI0LjA0LjE5IGF0IDEyOjQ3LCA8anVsaWVuLmdy
YWxsQGFybS5jb20+IHdyb3RlOgo+PiBPbiAyNC8wNC8yMDE5IDAxOjIwLCBTdGVmYW5vIFN0YWJl
bGxpbmkgd3JvdGU6Cj4+PiBPbiBNb24sIDIyIEFwciAyMDE5LCBKdWxpZW4gR3JhbGwgd3JvdGU6
Cj4+Pj4gVGhpcyBjb2RlIGlzIHByZXR0eSBuYXN0eSwgYnV0IEkgaGF2ZW4ndCBmb3VuZCBhIGJl
dHRlciB3YXkgZm9yIGF2b2lkaW5nCj4+Pj4gdG8gY2hlY2sgaWYgQ09ORklHX0RFQlVHIGlzIGVu
YWJsZWQgd2hlbiB0aGUgdGFyZ2V0IGNsZWFuIGlzIGNhbGxlZC4KPj4+Pgo+Pj4+IElkZWFsbHkg
d2Ugd2lsbCB3YW50IHRvIG1vdmUgQ09ORklHX0VBUkxZX1BSSU5USyBpbiBLY29uZmlnLiBJIGhh
dmVuJ3QKPj4+PiBoYWQgdGltZSB5ZXQgdG8gbG9vayBhdCBpdCBwcm9wZXJseSBzbyBmYXIuCj4g
Cj4gVGhpcywgdG8gbWUsIHdvdWxkIHNlZW0gdG8gYmUgdGhlIG11Y2ggYmV0dGVyIGFwcHJvYWNo
LCBhcyBpdCB3b3VsZAo+IGF2b2lkIHJlcGxhY2luZyBvbmUgbmFzdHkgY29uc3RydWN0IGJ5IGFu
b3RoZXIuIEFyZSB0aGVyZSBhbnkKPiBjb21wbGljYXRpb25zPwoKTGFzdCB0aW1lIEkgbG9va2Vk
IGF0IG1vdmluZyBlYXJseXByaW50ayB0byBLY29uZmlnIEkgd2FzIHN0cnVnZ2xpbmcgdG8gCmZp
bmQgYSBnb29kIHdheSBkZXNjcmliaW5nIHRoZW0uCgpJIGd1ZXNzIEkgY2FuIGhhdmUgYW5vdGhl
ciBsb29rIGlmIEkgY2FuIG1hbmFnZSB0byBkbyBpdCBpbiBhIGNvdXBsZSBvZiAKaG91cnMuCgpU
aGlzIHBhdGNoIGlzIG1vcmUgYSB3YXkgdG8gcGFwZXIgdGhlIHByb2JsZW0gYmVmb3JlIGNhdXNp
bmcgbW9yZSAKdHJvdWJsZSB3aGVuIGJ1aWxkaW5nIHVzaW5nIFlvY3RvLgoKQ2hlZXJzLAoKPj4+
IENhbiB3ZSBpbmNsdWRlIC5jb25maWcgaW4gdGhlIGNsZWFuIHRhcmdldD8KPj4gSSBkaWQgb25s
eSBtZW50aW9uIHRoZSBjbGVhbiB0YXJnZXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGJ1dCB0aGUg
aXNzdWUgaXMgdGhlCj4+IHNhbWUgZm9yIGFueSB0YXJnZXQgbm90IGluY2x1ZGUgLmNvbmZpZy4g
Rm9yIGluc3RhbmNlLCBhIGRpc3RjbGVhbiByZXN1bHRzIHRvCj4+IHRoZSBzYW1lIGVycm9yLgo+
Pgo+PiBJdCBhbHNvIGZlZWxzIHF1aXRlIHdyb25nIHRvIGV4cGVjdCB0aGUgLmNvbmZpZyB0byBi
ZSBpbiBwbGFjZSBmb3IgYW55IHRhcmdldAo+PiBvdGhlciB0aGFuIGJ1aWxkLgo+IAo+IEkgYWdy
ZWUuCj4gCj4gSmFuCj4gCj4gCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
