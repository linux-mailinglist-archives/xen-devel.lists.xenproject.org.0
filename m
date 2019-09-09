Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B73DADA0C
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 15:37:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Jnu-00042V-1f; Mon, 09 Sep 2019 13:34:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=NFaf=XE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i7Jnt-00042M-6l
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2019 13:34:01 +0000
X-Inumbo-ID: 7ac99bc4-d306-11e9-978d-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7ac99bc4-d306-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 13:34:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F2FA3ACC9;
 Mon,  9 Sep 2019 13:33:58 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190809145833.1020-1-jgross@suse.com>
 <20190809145833.1020-20-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0fea0ecf-5cde-7e5e-4a18-3c86f13d1d8f@suse.com>
Date: Mon, 9 Sep 2019 15:34:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190809145833.1020-20-jgross@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 19/48] xen: add sched_unit_pause_nosync()
 and sched_unit_unpause()
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

T24gMDkuMDguMjAxOSAxNjo1OCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGUgY3JlZGl0IHNj
aGVkdWxlciBjYWxscyB2Y3B1X3BhdXNlX25vc3luYygpIGFuZCB2Y3B1X3VucGF1c2UoKQo+IHRv
ZGF5LiBBZGQgc2NoZWRfdW5pdF9wYXVzZV9ub3N5bmMoKSBhbmQgc2NoZWRfdW5pdF91bnBhdXNl
KCkgdG8KPiBwZXJmb3JtIHRoZSBzYW1lIG9wZXJhdGlvbnMgb24gc2NoZWR1bGVyIHVuaXRzIGlu
c3RlYWQuCgpBbmQgYnkgcGxhY2luZyB0aGVtIGluIHNjaGVkLWlmLmggeW91IG1lYW4gdG8gaW5k
aWNhdGUgdGhhdCB0aGV5J3JlCm5vdCBtZWFudCB0byBiZSB1c2VkIGJ5IG90aGVyIHRoYW4gc2No
ZWR1bGVyIGNvZGU/IEkgYXNrIGJlY2F1c2UKdGhlIHZjcHUgYW5kIGRvbWFpbiBjb3VudGVycGFy
dHMgYXJlIHZhbGlkbHkgdXNhYmxlIGVsc2V3aGVyZS4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
