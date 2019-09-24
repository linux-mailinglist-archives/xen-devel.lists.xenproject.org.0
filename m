Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAC6BC77F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 14:03:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjUS-0002PZ-9v; Tue, 24 Sep 2019 12:00:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCjUR-0002PR-8n
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 12:00:19 +0000
X-Inumbo-ID: dfeb0692-dec2-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id dfeb0692-dec2-11e9-8628-bc764e2007e4;
 Tue, 24 Sep 2019 12:00:18 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DC679B791;
 Tue, 24 Sep 2019 12:00:16 +0000 (UTC)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-14-jgross@suse.com>
 <fe0d39d5-fb21-33e2-59de-38da683d62f9@suse.com>
 <b2ac925d-64c0-039b-40cb-c1254fe73127@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8b536899-0de9-cfce-7792-f61d433715e1@suse.com>
Date: Tue, 24 Sep 2019 14:00:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <b2ac925d-64c0-039b-40cb-c1254fe73127@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 13/47] xen/sched: add is_running
 indicator to struct sched_unit
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
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxMzo0NywgSsO8cmdlbiBHcm/DnyB3cm90ZToKPiBPbiAxOS4wOS4xOSAx
Nzo1MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4+IE9uIDE0LjA5LjIwMTkgMTA6NTIsIEp1ZXJnZW4g
R3Jvc3Mgd3JvdGU6Cj4+PiBAQCAtMTY3Myw4ICsxNjc2LDEwIEBAIHN0YXRpYyB2b2lkIHNjaGVk
dWxlKHZvaWQpCj4+PiAgICAgICAgKiBzd2l0Y2gsIGVsc2UgbG9zdF9yZWNvcmRzIHJlc3VtZSB3
aWxsIG5vdCB3b3JrIHByb3Blcmx5Lgo+Pj4gICAgICAgICovCj4+PiAgIAo+Pj4gLSAgICBBU1NF
UlQoIW5leHQtPmlzX3J1bm5pbmcpOwo+Pj4gKyAgICBBU1NFUlQoIW5leHQtPnNjaGVkX3VuaXQt
PmlzX3J1bm5pbmcpOwo+Pj4gICAgICAgbmV4dC0+aXNfcnVubmluZyA9IDE7Cj4+PiArICAgIG5l
eHQtPnNjaGVkX3VuaXQtPmlzX3J1bm5pbmcgPSAxOwo+Pgo+PiBOaXQ6IFRoZSBuZXcgZmllbGQg
aXMgb2YgdHlwZSBib29sLCBhbmQgaGVuY2UgeW91IHNob3VsZCB3cml0ZSB0cnVlCj4+IGFuZCBm
YWxzZSBpbnRvIGl0LiBUaGlzIG1heSBsb29rIG9kZCBuZXh0IHRvIHRoZSAxIGFib3ZlLCBidXQg
YnkKPj4gdGhlIGVuZCBvZiB0aGUgc2VyaWVzIHRoZSB0d28gd29uJ3Qgc2l0IG5leHQgdG8gZWFj
aCBvdGhlciBhbnltb3JlLgo+IAo+IEluZGVlZC4gQW5kIG1ha2luZyB2Y3B1LT5pc19ydW5uaW5n
IGEgYm9vbCBpcyBhbm90aGVyIGl0ZW0gb24gbXkgbGlzdAo+IGZvciB0aGUgY2xlYW51cC4KCklz
IGl0PyBJdCdzIGFscmVhZHkgYm9vbCBhZmFpY3MuIEl0J3MganVzdCB0aGUgdmFsdWVzIHdyaXR0
ZW4gdG8gaXQKd2hpY2ggYXJlbid0IHByb3Blcmx5IHRydWUgLyBmYWxzZS4KCkphbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
