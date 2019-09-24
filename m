Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C3CBC8A6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2019 15:14:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCkaS-0000J2-Af; Tue, 24 Sep 2019 13:10:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=kqGS=XT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iCkaQ-0000Ix-T9
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2019 13:10:34 +0000
X-Inumbo-ID: b0a2804a-decc-11e9-961d-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id b0a2804a-decc-11e9-961d-12813bfff9fa;
 Tue, 24 Sep 2019 13:10:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3EE37B755;
 Tue, 24 Sep 2019 13:10:31 +0000 (UTC)
To: Juergen Gross <jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-39-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <11902c4a-c099-1f77-4b4a-9a5f8a21a824@suse.com>
Date: Tue, 24 Sep 2019 15:10:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190914085251.18816-39-jgross@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTQuMDkuMjAxOSAxMDo1MiwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBIYXZpbmcgYSBwb2lu
dGVyIHRvIHN0cnVjdCBjcHVwb29sIGluIHN0cnVjdCBzY2hlZF9yZXNvdXJjZSBpbnN0ZWFkCj4g
b2YgcGVyIGNwdSBpcyBlbm91Z2guCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8
amdyb3NzQHN1c2UuY29tPgoKVGVjaG5pY2FsbHkgLyBtZWNoYW5pY2FsbHkKUmV2aWV3ZWQtYnk6
IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCkhvd2V2ZXIsIEknbSBjb25mdXNlZCBi
eSB3aGF0IGFwcGVhcnMgdG8gYmUgYSByZXN1bHRpbmcgY2hpY2tlbi1hbmQtCmVnZyBwcm9ibGVt
IHdoZW4gY29uc2lkZXJpbmcgdGhlIHBsYW4gb2YgYWxsb3dpbmcgZGlmZmVyZW50CmdyYW51bGFy
aXRpZXMgaW4gZGlmZmVyZW50IGNwdXBvb2xzLiBQZXJoYXBzIEknbSBlaXRoZXIgbWlzLQpyZW1l
bWJlcmluZyB0aGF0IHBsYW4sIG9yIGl0J3Mgbm90IGNsZWFyIHRvIG1lIGhvdyBkYXRhIHdvdWxk
IGdldApzdHJ1Y3R1cmVkIGluIHRoYXQgY2FzZS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
