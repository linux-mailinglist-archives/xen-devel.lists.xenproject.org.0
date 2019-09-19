Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD73B7EA0
	for <lists+xen-devel@lfdr.de>; Thu, 19 Sep 2019 17:56:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iAykF-0001Xu-Q9; Thu, 19 Sep 2019 15:53:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=5hYN=XO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iAykE-0001Xp-NO
 for xen-devel@lists.xenproject.org; Thu, 19 Sep 2019 15:53:22 +0000
X-Inumbo-ID: 9ac35dba-daf5-11e9-a337-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ac35dba-daf5-11e9-a337-bc764e2007e4;
 Thu, 19 Sep 2019 15:53:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6A975C142;
 Thu, 19 Sep 2019 15:53:20 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-14-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe0d39d5-fb21-33e2-59de-38da683d62f9@suse.com>
Date: Thu, 19 Sep 2019 17:53:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-14-jgross@suse.com>
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

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBAQCAtMTY3Myw4ICsx
Njc2LDEwIEBAIHN0YXRpYyB2b2lkIHNjaGVkdWxlKHZvaWQpCj4gICAgICAgKiBzd2l0Y2gsIGVs
c2UgbG9zdF9yZWNvcmRzIHJlc3VtZSB3aWxsIG5vdCB3b3JrIHByb3Blcmx5Lgo+ICAgICAgICov
Cj4gIAo+IC0gICAgQVNTRVJUKCFuZXh0LT5pc19ydW5uaW5nKTsKPiArICAgIEFTU0VSVCghbmV4
dC0+c2NoZWRfdW5pdC0+aXNfcnVubmluZyk7Cj4gICAgICBuZXh0LT5pc19ydW5uaW5nID0gMTsK
PiArICAgIG5leHQtPnNjaGVkX3VuaXQtPmlzX3J1bm5pbmcgPSAxOwoKTml0OiBUaGUgbmV3IGZp
ZWxkIGlzIG9mIHR5cGUgYm9vbCwgYW5kIGhlbmNlIHlvdSBzaG91bGQgd3JpdGUgdHJ1ZQphbmQg
ZmFsc2UgaW50byBpdC4gVGhpcyBtYXkgbG9vayBvZGQgbmV4dCB0byB0aGUgMSBhYm92ZSwgYnV0
IGJ5CnRoZSBlbmQgb2YgdGhlIHNlcmllcyB0aGUgdHdvIHdvbid0IHNpdCBuZXh0IHRvIGVhY2gg
b3RoZXIgYW55bW9yZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
