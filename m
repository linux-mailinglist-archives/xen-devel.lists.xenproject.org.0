Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DD8B93F8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 17:29:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBKoq-0001gG-BM; Fri, 20 Sep 2019 15:27:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iBKop-0001g6-2A
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 15:27:35 +0000
X-Inumbo-ID: 2af39056-dbbb-11e9-b299-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2af39056-dbbb-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 15:27:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 31619B022;
 Fri, 20 Sep 2019 15:27:33 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-26-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0b50ab7e-f617-d187-01af-a6a22950833e@suse.com>
Date: Fri, 20 Sep 2019 17:27:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-26-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 25/47] xen/sched: add runstate counters
 to struct sched_unit
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
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMzY4LDcgKzM3
Miw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfdW5pdCAqc2NoZWRfYWxsb2NfdW5pdChzdHJ1Y3Qg
dmNwdSAqdikKPiAgICAgIHVuaXQtPnZjcHVfbGlzdCA9IHY7Cj4gICAgICB1bml0LT51bml0X2lk
ID0gdi0+dmNwdV9pZDsKPiAgICAgIHVuaXQtPmRvbWFpbiA9IGQ7Cj4gLSAgICB2LT5zY2hlZF91
bml0ID0gdW5pdDsKPiArICAgIHVuaXQtPnJ1bnN0YXRlX2NudFt2LT5ydW5zdGF0ZS5zdGF0ZV0r
KzsKPiAgCj4gICAgICBmb3IgKCBwcmV2X3VuaXQgPSAmZC0+c2NoZWRfdW5pdF9saXN0OyAqcHJl
dl91bml0Owo+ICAgICAgICAgICAgcHJldl91bml0ID0gJigqcHJldl91bml0KS0+bmV4dF9pbl9s
aXN0ICkKPiBAQCAtMzg0LDYgKzM4OCw4IEBAIHN0YXRpYyBzdHJ1Y3Qgc2NoZWRfdW5pdCAqc2No
ZWRfYWxsb2NfdW5pdChzdHJ1Y3QgdmNwdSAqdikKPiAgICAgICAgICAgIXphbGxvY19jcHVtYXNr
X3ZhcigmdW5pdC0+Y3B1X3NvZnRfYWZmaW5pdHkpICkKPiAgICAgICAgICBnb3RvIGZhaWw7Cj4g
IAo+ICsgICAgdi0+c2NoZWRfdW5pdCA9IHVuaXQ7Cj4gKwo+ICAgICAgcmV0dXJuIHVuaXQ7Cj4g
IAo+ICAgZmFpbDoKCklzIHRoaXMgbW92ZW1lbnQgb2YgdGhlIGFzc2lnbm1lbnQgc29tZXRoaW5n
IHdoaWNoIHJlYWxseSBiZWxvbmdzCmhlcmUsIHJhdGhlciB0aGFuIGluIHNvbWUgZWFybGllciBw
YXRjaCAocGVyaGFwcyB0aGUgb25lIGFjdHVhbGx5CmludHJvZHVjaW5nIGl0KT8KCkphbgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
