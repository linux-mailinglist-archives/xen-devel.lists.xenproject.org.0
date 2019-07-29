Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6A778941
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2019 12:08:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hs2XQ-00052F-Jw; Mon, 29 Jul 2019 10:05:52 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=l3zY=V2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hs2XO-000529-E7
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2019 10:05:50 +0000
X-Inumbo-ID: 70227d62-b1e8-11e9-8980-bc764e045a96
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTP
 id 70227d62-b1e8-11e9-8980-bc764e045a96;
 Mon, 29 Jul 2019 10:05:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1239F15AB;
 Mon, 29 Jul 2019 03:05:48 -0700 (PDT)
Received: from [10.37.8.36] (unknown [10.37.8.36])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0C6B63F694;
 Mon, 29 Jul 2019 03:05:46 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <20318831-02d8-cce3-46e9-b4eb22506dce@arm.com>
Date: Mon, 29 Jul 2019 11:05:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <5c88239b-de0f-5f81-72c4-7fdb07524278@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] dom0-build: fix build with clang5
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
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzE3LzE5IDc6NDcgQU0sIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdpdGggbm9uLWVt
cHR5IENPTkZJR19ET00wX01FTSBjbGFuZzUgcHJvZHVjZXMKPiAKPiBkb20wX2J1aWxkLmM6MzQ0
OjI0OiBlcnJvcjogdXNlIG9mIGxvZ2ljYWwgJyYmJyB3aXRoIGNvbnN0YW50IG9wZXJhbmQgWy1X
ZXJyb3IsLVdjb25zdGFudC1sb2dpY2FsLW9wZXJhbmRdCj4gICAgICAgaWYgKCAhZG9tMF9tZW1f
c2V0ICYmIENPTkZJR19ET00wX01FTVswXSApCj4gICAgICAgICAgICAgICAgICAgICAgICAgIF4g
IH5+fn5+fn5+fn5+fn5+fn5+fgo+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHVzZSAnJicg
Zm9yIGEgYml0d2lzZSBvcGVyYXRpb24KPiAgICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09O
RklHX0RPTTBfTUVNWzBdICkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgJgo+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92ZSBj
b25zdGFudCB0byBzaWxlbmNlIHRoaXMgd2FybmluZwo+ICAgICAgIGlmICggIWRvbTBfbWVtX3Nl
dCAmJiBDT05GSUdfRE9NMF9NRU1bMF0gKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIH5efn5+
fn5+fn5+fn5+fn5+fn5+fn4KPiAxIGVycm9yIGdlbmVyYXRlZC4KPiAKPiBPYnZpb3VzbHkgbmVp
dGhlciBvZiB0aGUgdHdvIHN1Z2dlc3Rpb25zIGFyZSBhbiBvcHRpb24gaGVyZS4gT2RkbHkKPiBl
bm91Z2ggc3dhcHBpbmcgdGhlIG9wZXJhbmRzIG9mIHRoZSAmJiBoZWxwcywgd2hpbGUgZS5nLiBj
YXN0aW5nIG9yCj4gcGFyZW50aGVzaXppbmcgZG9lc24ndC4gQW5vdGhlciB3b3JrYWJsZSB2YXJp
YW50IGxvb2tzIHRvIGJlIHRoZSB1c2Ugb2YKPiAhISBvbiB0aGUgY29uc3RhbnQuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgo+IC0tLQo+IHYyOiBB
bHNvIGFkanVzdCB0aGUgQXJtIGluY2FybmF0aW9uIG9mIHRoZSBzYW1lIGNvbnN0cnVjdC4KPiAt
LS0KPiBJJ20gb3BlbiB0byBnb2luZyB0aGUgISEgb3IgeWV0IHNvbWUgZGlmZmVyZW50IHJvdXRl
IChidXQgbm90IHJlYWxseSB0aGUKPiBzdWdnZXN0ZWQgc3RybGVuKCkgb25lKS4gTm8gbWF0dGVy
IHdoaWNoIG9uZSB3ZSBjaG9vc2UsIEknbSBhZnJhaWQgaXQgaXMKPiBnb2luZyB0byByZW1haW4g
Z3Vlc3N3b3JrIHdoYXQgbmV3ZXIgKGFuZCBmdXR1cmUpIHZlcnNpb25zIG9mIGNsYW5nIHdpbGwK
PiBjaG9rZSBvbi4KCkkgcXVpdGUgbGlrZSB0aGUgc3RybGVuIG9uZSwgaG93ZXZlciBsb29raW5n
IGFyb3VuZCBvbmxpbmUgdGhpcyBtYXkgbm90IApzb2x2ZSB0aGUgcHJvYmxlbS4gQUZBSUssIENs
YW5nIGlzIG5vdCBoYXBweSBiZWNhdXNlIHRoZSBjb25zdGFudCBpcyBub3QgCmEgYm9vbGVhbi4K
ClNvICEhIG9yICE9IDAgc2hvdWxkIHdvcmsgaGVyZS4KCkNoZWVycywKCi0tIApKdWxpZW4gR3Jh
bGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
