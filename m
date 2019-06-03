Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6153733AB9
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2019 00:05:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hXv2Q-0003RX-T1; Mon, 03 Jun 2019 22:02:42 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fnY6=UC=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hXv2O-0003RO-Ip
 for xen-devel@lists.xenproject.org; Mon, 03 Jun 2019 22:02:40 +0000
X-Inumbo-ID: 4d9e98e1-864b-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 4d9e98e1-864b-11e9-8980-bc764e045a96;
 Mon, 03 Jun 2019 22:02:39 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49079A78;
 Mon,  3 Jun 2019 15:02:39 -0700 (PDT)
Received: from [10.37.12.69] (unknown [10.37.12.69])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73DCE3F5AF;
 Mon,  3 Jun 2019 15:02:37 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <JBeulich@suse.com>
References: <alpine.DEB.2.21.1905081538170.9403@sstabellini-ThinkPad-T480s>
 <20190508224727.11549-3-sstabellini@kernel.org>
 <5CD3EFD5020000780022D0D8@prv1-mh.provo.novell.com>
 <alpine.DEB.2.21.1906031447300.14041@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <b49eb323-e4d4-b959-7c99-1c124c9a5df0@arm.com>
Date: Mon, 3 Jun 2019 23:02:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1906031447300.14041@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 3/3] xen/arm: fix mask calculation in
 pdx_init_mask
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
Cc: Stefano Stabellini <stefanos@xilinx.com>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgU3RlZmFubywKCk9uIDYvMy8xOSAxMDo1NiBQTSwgU3RlZmFubyBTdGFiZWxsaW5pIHdyb3Rl
Ogo+IE9uIFRodSwgOSBNYXkgMjAxOSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4+IE9uIDA5LjA1
LjE5IGF0IDAwOjQ3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4+PiAtLS0gYS94
ZW4vY29tbW9uL3BkeC5jCj4+PiArKysgYi94ZW4vY29tbW9uL3BkeC5jCj4+PiBAQCAtNTAsOSAr
NTAsMTMgQEAgc3RhdGljIHU2NCBfX2luaXQgZmlsbF9tYXNrKHU2NCBtYXNrKQo+Pj4gICAgICAg
cmV0dXJuIG1hc2s7Cj4+PiAgIH0KPj4+ICAgCj4+PiArLyoKPj4+ICsgKiBXZSBhbHdheXMgbWFw
IHRoZSBmaXJzdCAxPDxNQVhfT1JERVIgcGFnZXMgb2YgUkFNLCBoZW5jZSwgdGhleQo+Pj4gKyAq
IGFyZSBsZWZ0IHVuY29tcHJlc3NlZC4KPj4+ICsgKi8KPj4+ICAgdTY0IF9faW5pdCBwZHhfaW5p
dF9tYXNrKHU2NCBiYXNlX2FkZHIpCj4+PiAgIHsKPj4+IC0gICAgcmV0dXJuIGZpbGxfbWFzayhi
YXNlX2FkZHIgLSAxKTsKPj4+ICsgICAgcmV0dXJuIGZpbGxfbWFzayhtYXgoYmFzZV9hZGRyLCAo
dTY0KTEgPDwgKE1BWF9PUkRFUiArIFBBR0VfU0hJRlQpKSAtIDEpOwo+Pgo+PiBQZXJzb25hbGx5
IEkgdGhpbmsgdGhhdCBkZXNwaXRlIHRoZSBzdXJyb3VuZGluZyB1NjQgdGhpcyBzaG91bGQgYmUK
Pj4gdWludDY0X3QuIFlvdSBjb3VsZCBhdm9pZCB0aGlzIGFsdG9nZXRoZXIgYnkgdXNpbmcgMVVM
TC4KPiAKPiBJIGNhbm5vdCB1c2UgMVVMTCBiZWNhdXNlIGl0IHdvdWxkIGJyZWFrIHRoZSBidWls
ZDogdGhlIHJlYXNvbiBpcyB0aGF0Cj4gdTY0IGlzIGRlZmluZWQgYXMgdW5zaWduZWQgbG9uZyBv
biBzb21lIGFyY2hpdGVjdHVyZXMgYW5kIHVuc2lnbmVkIGxvbmcKPiBsb25nIG9uIG90aGVycy4g
VGhlIHBvaW50ZXJzIGNvbXBhcmlzb24gaW4gdGhlIG1heCBtYWNybyB3aWxsIGZhaWwgdG8KPiBj
b21waWxlLgo+IAo+IEkgY291bGQgdXNlIHVpbnQ2NF90LCB0aGF0IHdvcmtzLCBidXQgSSB0aGlu
ayBpcyBub3QgYSBnb29kIGlkZWEgdG8gdXNlCj4gcG90ZW50aWFsbHkgZGlmZmVyZW50IHR5cGVz
IGJldHdlZW4gdGhlIGFyZ3VtZW50cyBwYXNzZWQgdG8gbWF4LiBJZiB5b3UKPiBzdGlsbCB3b3Vs
ZCBsaWtlIG1lIHRvIGNoYW5nZSAodTY0KTEgdG8gKHVpbnQ2NF90KTEgcGxlYXNlIGV4cGxhaW4g
d2h5Cj4gaW4gbW9yZSBkZXRhaWxzLgoKV2UgYXJlIHBoYXNpbmcgb3V0IHVYWCBpbiBmYXZvciBv
ZiB1aW50WFhfdCBzbyBJIGFncmVlIHdpdGggSmFuIHRoYXQgd2UgCndhbnQgdG8gYXZvaWQgaW50
cm9kdWNpbmcgbW9yZSBoZXJlLgoKRXhjZXB0IHRoZSB3YXkgdGhleSBhcmUgZGVmaW5lZCwgdTY0
IGFuZCB1aW50NjRfdCB3aWxsIGFsd2F5cyBiZSBlcXVhbCAKdG8gNjQtYml0cy4gU28geW91IGNh
biBlYXNpbHkgdXBkYXRlIHRoZSBpbnRlcmZhY2UgdG8gdXNlIHVpbnQ2NF90IAppbnN0ZWFkIG9m
IHU2NCB3aXRob3V0IHdvcnJ5aW5nIGFib3V0IHR5cGUgaXNzdWUuCgpDaGVlcnMsCgotLSAKSnVs
aWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
