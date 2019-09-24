Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 042C8BC726
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 13:50:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCjI0-0000do-Um; Tue, 24 Sep 2019 11:47:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=MVCM=XT=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iCjHy-0000db-Pw
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 11:47:26 +0000
X-Inumbo-ID: 13608576-dec1-11e9-9617-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 13608576-dec1-11e9-9617-12813bfff9fa;
 Tue, 24 Sep 2019 11:47:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1259FAE5C;
 Tue, 24 Sep 2019 11:47:24 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-14-jgross@suse.com>
 <fe0d39d5-fb21-33e2-59de-38da683d62f9@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b2ac925d-64c0-039b-40cb-c1254fe73127@suse.com>
Date: Tue, 24 Sep 2019 13:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <fe0d39d5-fb21-33e2-59de-38da683d62f9@suse.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDkuMTkgMTc6NTMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEBAIC0xNjczLDggKzE2NzYsMTAgQEAgc3RhdGlj
IHZvaWQgc2NoZWR1bGUodm9pZCkKPj4gICAgICAgICogc3dpdGNoLCBlbHNlIGxvc3RfcmVjb3Jk
cyByZXN1bWUgd2lsbCBub3Qgd29yayBwcm9wZXJseS4KPj4gICAgICAgICovCj4+ICAgCj4+IC0g
ICAgQVNTRVJUKCFuZXh0LT5pc19ydW5uaW5nKTsKPj4gKyAgICBBU1NFUlQoIW5leHQtPnNjaGVk
X3VuaXQtPmlzX3J1bm5pbmcpOwo+PiAgICAgICBuZXh0LT5pc19ydW5uaW5nID0gMTsKPj4gKyAg
ICBuZXh0LT5zY2hlZF91bml0LT5pc19ydW5uaW5nID0gMTsKPiAKPiBOaXQ6IFRoZSBuZXcgZmll
bGQgaXMgb2YgdHlwZSBib29sLCBhbmQgaGVuY2UgeW91IHNob3VsZCB3cml0ZSB0cnVlCj4gYW5k
IGZhbHNlIGludG8gaXQuIFRoaXMgbWF5IGxvb2sgb2RkIG5leHQgdG8gdGhlIDEgYWJvdmUsIGJ1
dCBieQo+IHRoZSBlbmQgb2YgdGhlIHNlcmllcyB0aGUgdHdvIHdvbid0IHNpdCBuZXh0IHRvIGVh
Y2ggb3RoZXIgYW55bW9yZS4KCkluZGVlZC4gQW5kIG1ha2luZyB2Y3B1LT5pc19ydW5uaW5nIGEg
Ym9vbCBpcyBhbm90aGVyIGl0ZW0gb24gbXkgbGlzdApmb3IgdGhlIGNsZWFudXAuCgoKSnVlcmdl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
