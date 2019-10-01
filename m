Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E69C3097
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2019 11:50:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFElL-0007uw-9T; Tue, 01 Oct 2019 09:48:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=T/b7=X2=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1iFElJ-0007ur-Lk
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 09:48:05 +0000
X-Inumbo-ID: 8efbd0ea-e430-11e9-97fb-bc764e2007e4
Received: from foss.arm.com (unknown [217.140.110.172])
 by localhost (Halon) with ESMTP
 id 8efbd0ea-e430-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 09:48:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CADBC1000;
 Tue,  1 Oct 2019 02:48:01 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 104D23F739;
 Tue,  1 Oct 2019 02:48:00 -0700 (PDT)
To: Stefano Stabellini <sstabellini@kernel.org>
References: <20190327184531.30986-1-julien.grall@arm.com>
 <20190327184531.30986-3-julien.grall@arm.com>
 <alpine.DEB.2.10.1904171340390.1370@sstabellini-ThinkPad-X260>
 <be790e9c-75bb-b38b-9a01-8c586580ed1a@arm.com>
 <alpine.DEB.2.10.1904181056410.1370@sstabellini-ThinkPad-X260>
 <441ce7f6-7907-dc23-b0e6-7503ba888953@arm.com>
 <alpine.DEB.2.21.1909301808070.2594@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <531c64b4-c0e0-2a9d-457a-3b933b94b6dc@arm.com>
Date: Tue, 1 Oct 2019 10:47:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1909301808070.2594@sstabellini-ThinkPad-T480s>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 02/12] xen/arm: fix get_cpu_info() when
 built with clang
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
Cc: Artem_Mygaiev@epam.com, xen-devel@lists.xenproject.org,
 Andrii_Anisov@epam.com, Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiAwMS8xMC8yMDE5IDAyOjE1LCBTdGVmYW5vIFN0YWJlbGxpbmkgd3JvdGU6Cj4gT24g
U3VuLCAyOSBTZXAgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBPbiA0LzE4LzE5IDc6MDMg
UE0sIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4+IE9uIFdlZCwgMTcgQXByIDIwMTksIEp1
bGllbiBHcmFsbCB3cm90ZToKPj4+PiBPbiA0LzE3LzE5IDk6NDUgUE0sIFN0ZWZhbm8gU3RhYmVs
bGluaSB3cm90ZToKPj4+Pj4gT24gV2VkLCAyNyBNYXIgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3Rl
Ogo+PiBCdXQgdGhlbiBpZiBjbGFuZyBpcyBhbHJlYWR5IGRlZmluaW5nIF9fR05VQ19fLCB3aGF0
IGFjdHVhbGx5IHByZXZlbnRzIGFueQo+PiBvdGhlciB0byBkbyBpdD8KPj4KPj4gSSBoYXZlIHll
dCB0byBzZWUgYW55b25lIHdhbnRlZCB0byBidWlsZCBYZW4gd2l0aCBhbm90aGVyIGNvbXBpbGVy
IG90aGVyIHRoYW4KPj4gY2xhbmcgYW5kIEdDQy4gU28gSSB3aWxsIGxlYXZlIHRoaXMgcGF0Y2gg
YXMgaXMuIEZlZWwgZnJlZSB0byBzdWdnZXN0IGEKPj4gZGlmZmVyZW50IGFwcHJvYWNoIGlmIHlv
dSBhcmUgbm90IGhhcHB5IHdpdGggdGhpcy4KPiAKPiBJcyB0aGVyZSBhIF9fUkVBTExZX1JFQUxM
WV9HVU5DX18gdmFyaWFibGU/IEkgZ3Vlc3Mgbm90LCBzbyBJIGRvbid0IGhhdmUKPiBhIGJldHRl
ciBzdWdnZXN0aW9uLiBUaGlzIHByb2JsZW0gaXMgcXVpdGUgYW5ub3lpbmcgKG5vdCB5b3VyIGZh
dWx0IG9mCj4gY291cnNlKSBJIHdvbmRlciBob3cgb3RoZXIgcHJvamVjdHMgZGVhbCB3aXRoIGl0
LiBUaGVyZSBtdXN0IGJlIGEKPiAiY2xlYW4iIHdheSB0byBkaXN0aW5ndWlzaCBnY2MgZnJvbSBv
dGhlcnM/CgpMaW51eCBvbmx5IHN1cHBvcnRzIGNsYW5nIGFuZCBHQ0MuIEFGQUlDVCB0aGV5IGFy
ZSB1c2luZyAhX19jbGFuZ19fIHRvIGRldGVjdCBpZiAKR0NDIGlzIHVzZWQuCgpDaGVlcnMsCgot
LSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
