Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7091700A9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2020 15:00:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j6xCC-0001lv-Bz; Wed, 26 Feb 2020 13:57:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=joxT=4O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j6xCB-0001lq-40
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2020 13:57:51 +0000
X-Inumbo-ID: f9612cd0-589f-11ea-9428-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f9612cd0-589f-11ea-9428-12813bfff9fa;
 Wed, 26 Feb 2020 13:57:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7D9F7ABEA;
 Wed, 26 Feb 2020 13:57:48 +0000 (UTC)
To: Paul Durrant <pdurrant@amazon.com>
References: <20200225095357.3923-1-pdurrant@amazon.com>
 <20200225095357.3923-3-pdurrant@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2653c2cf-9add-dd0c-03e5-36d951ee621e@suse.com>
Date: Wed, 26 Feb 2020 14:57:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200225095357.3923-3-pdurrant@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/2] domain: use PGC_extra domheap page for
 shared_info
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDIuMjAyMCAxMDo1MywgUGF1bCBEdXJyYW50IHdyb3RlOgo+IFRoZXJlJ3Mgbm8gcGFy
dGljdWxhciByZWFzb24gc2hhcmVkX2luZm8gbmVlZCB1c2UgYSB4ZW5oZWFwIHBhZ2UuIEl0J3MK
PiBvbmx5IHB1cnBvc2UgaXMgdG8gYmUgbWFwcGVkIGJ5IHRoZSBndWVzdCBzbyB1c2UgYSBQR0Nf
ZXh0cmEgZG9taGVhcCBwYWdlCj4gaW5zdGVhZC4KClNpbmNlIHRoZSBjb3ZlciBsZXR0ZXIgYWxz
byBkb2Vzbid0IGdpdmUgYW55IGJhY2tncm91bmQgLSBpcyB0aGVyZSBhCnByb2JsZW0gd2l0aCB0
aGUgY3VycmVudCBhcnJhbmdlbWVudHM/IEFyZSB0aGVyZSBhbnkgZnVydGhlciBwbGFucwpkZXBl
bmRpbmcgb24gdGhpcyBiZWluZyBjaGFuZ2VkPyBPciBpcyB0aGlzIHNpbXBseSAibGV0J3MgZG8g
aXQKYmVjYXVzZSBub3cgd2UgY2FuIj8KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
