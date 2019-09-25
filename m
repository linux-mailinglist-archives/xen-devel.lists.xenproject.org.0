Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43888BDECC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:19:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7AJ-0000gY-R2; Wed, 25 Sep 2019 13:17:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=jAfE=XU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iD7AH-0000gK-PG
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:17:05 +0000
X-Inumbo-ID: c497df62-df96-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id c497df62-df96-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 13:17:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 70536B65B;
 Wed, 25 Sep 2019 13:17:04 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-39-jgross@suse.com>
 <11902c4a-c099-1f77-4b4a-9a5f8a21a824@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <50cae387-465c-6347-846c-c520cf1b38b7@suse.com>
Date: Wed, 25 Sep 2019 15:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <11902c4a-c099-1f77-4b4a-9a5f8a21a824@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3 38/47] xen/sched: move per-cpu variable
 cpupool to struct sched_resource
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMTkgMTU6MTAsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDE0LjA5LjIwMTkgMTA6
NTIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEhhdmluZyBhIHBvaW50ZXIgdG8gc3RydWN0IGNw
dXBvb2wgaW4gc3RydWN0IHNjaGVkX3Jlc291cmNlIGluc3RlYWQKPj4gb2YgcGVyIGNwdSBpcyBl
bm91Z2guCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNv
bT4KPiAKPiBUZWNobmljYWxseSAvIG1lY2hhbmljYWxseQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gCj4gSG93ZXZlciwgSSdtIGNvbmZ1c2VkIGJ5IHdo
YXQgYXBwZWFycyB0byBiZSBhIHJlc3VsdGluZyBjaGlja2VuLWFuZC0KPiBlZ2cgcHJvYmxlbSB3
aGVuIGNvbnNpZGVyaW5nIHRoZSBwbGFuIG9mIGFsbG93aW5nIGRpZmZlcmVudAo+IGdyYW51bGFy
aXRpZXMgaW4gZGlmZmVyZW50IGNwdXBvb2xzLiBQZXJoYXBzIEknbSBlaXRoZXIgbWlzLQo+IHJl
bWVtYmVyaW5nIHRoYXQgcGxhbiwgb3IgaXQncyBub3QgY2xlYXIgdG8gbWUgaG93IGRhdGEgd291
bGQgZ2V0Cj4gc3RydWN0dXJlZCBpbiB0aGF0IGNhc2UuCgpUaGVyZSBzdGlsbCBpczoKCkRFRklO
RV9QRVJfQ1BVX1JFQURfTU9TVExZKHN0cnVjdCBzY2hlZF9yZXNvdXJjZSAqLCBzY2hlZF9yZXMp
OwoKCkp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
