Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1319E101394
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 06:26:33 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWvwY-00029r-Dc; Tue, 19 Nov 2019 05:20:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wZDO=ZL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1iWvwW-00029m-CW
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 05:20:48 +0000
X-Inumbo-ID: 570482ae-0a8c-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 570482ae-0a8c-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 05:20:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 777ADACFA;
 Tue, 19 Nov 2019 05:20:45 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20191118181509.10981-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <06e01928-476a-892e-853b-31c9b5f8bb7d@suse.com>
Date: Tue, 19 Nov 2019 06:20:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191118181509.10981-1-andrew.cooper3@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86/nested-hap: Fix handling of L0_ERROR
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMTEuMTkgMTk6MTUsIEFuZHJldyBDb29wZXIgd3JvdGU6Cj4gV2hlbiBuZXN0ZWRodm1f
aGFwX25lc3RlZF9wYWdlX2ZhdWx0KCkgcmV0dXJucyBMMF9FUlJPUiwKPiBodm1faGFwX25lc3Rl
ZF9wYWdlX2ZhdWx0KCkgb3BlcmF0ZXMgb24gdGhlIGFkanVzdGVkIGdwYS4gIEhvd2V2ZXIsIGl0
Cj4gb3BlcmF0ZXMgd2l0aCB0aGUgb3JpZ2luYWwgbnBmZWMsIHdoaWNoIGlzIG5vIGxvbmdlciBi
ZSBjb3JyZWN0Lgo+IAo+IEluIHBhcnRpY3VsYXIsIGl0IGlzIHBvc3NpYmxlIHRvIGdldCBhIG5l
c3RlZCBmYXVsdCB3aGVyZSB0aGUgdHJhbnNsYXRpb24gaXMKPiBub3QgcHJlc2VudCBpbiBMMTIg
KGFuZCB0aGVyZWZvcmUgTDAyKSwgd2hpbGUgaXQgaXMgcHJlc2VudCBpbiBMMDEuCj4gCj4gV2hl
biBoYW5kbGluZyBhbiBMMF9FUlJPUiwgYWRqdXN0IG5wZmVjIGFzIHdlbGwgYXMgZ3BhLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpSZWxlYXNlLWFja2VkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CgoKSnVl
cmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
