Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B531647BC
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:05:39 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4Qrt-0000Gb-2T; Wed, 19 Feb 2020 15:02:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gyox=4H=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1j4Qrr-0000GW-JR
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:02:27 +0000
X-Inumbo-ID: d774b30c-5328-11ea-b0fd-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d774b30c-5328-11ea-b0fd-bc764e2007e4;
 Wed, 19 Feb 2020 15:02:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 085F5B133;
 Wed, 19 Feb 2020 15:02:25 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
References: <20200213125449.14226-1-jgross@suse.com>
 <20200213125449.14226-4-jgross@suse.com>
 <3f11237e-09a8-4003-597a-c02e1b60711b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5b7eee77-776b-1e5e-e25c-a783520748e1@suse.com>
Date: Wed, 19 Feb 2020 16:02:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <3f11237e-09a8-4003-597a-c02e1b60711b@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 3/8] xen/sched: don't use irqsave locks in
 dumping functions
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>, xen-devel@lists.xenproject.org,
 Meng Xu <mengxu@cis.upenn.edu>, Dario Faggioli <dfaggioli@suse.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDIuMjAgMTU6MjcsIEphbiBCZXVsaWNoIHdyb3RlOgo+IE9uIDEzLjAyLjIwMjAgMTM6
NTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6Cj4+IEFsbCBkdW1waW5nIGZ1bmN0aW9ucyBpbnZva2Vk
IGJ5IHRoZSAicnVucSIga2V5aGFuZGxlciBhcmUgY2FsbGVkIHdpdGgKPj4gZGlzYWJsZWQgaW50
ZXJydXB0cywKPiAKPiBJcyB0aGlzIGFjdHVhbGx5IG5lZWRlZCBmb3IgYW55dGhpbmc/IEl0IG1l
YW5zIG5vdCBzZXJ2aWNpbmcKPiBpbnRlcnJ1cHRzIGZvciBwZXJoYXBzIGFuIGV4dGVuZGVkIHBl
cmlvZCBvZiB0aW1lLiBEZWJ1ZyBrZXlzCj4gYXJlbid0IHByb21pc2VkIHRvIGJlIG5vbi1pbnRy
dXNpdmUsIGJ1dCB0aGV5IGFsc28gc2hvdWxkbid0Cj4gYmUgbW9yZSBpbnRydXNpdmUgdGhhbiBy
ZWFsbHkgbmVlZGVkLiBXb3VsZG4ndCBpdCB0aGVyZWZvcmUKPiBiZSBiZXR0ZXIgdG8ga2VlcCBs
b2NraW5nIGFzIGl0IGlzIG5vdywgYW5kIGluc3RlYWQgbWFrZSBzdXJlCj4gaW50ZXJydXB0cyBn
ZXQgdHVybmVkIG9mZiBlbHNld2hlcmUgKGlmIG5lZWRlZCkgZm9yIG11Y2gKPiBzaG9ydGVyIHBl
cmlvZHMgb2YgdGltZT8KCkluZGVlZCB0aGlzIGlzIHRoZSBiZXR0ZXIgb3B0aW9uLiBJIGp1c3Qg
Y2hlY2tlZCB0aGUgY29kZSBhbmQKdGhpbmsgYmxpbmRseSB0dXJuaW5nIGludGVycnVwdHMgb2Zm
IGlzIG5vdCBuZWVkZWQuCgpJJ2xsIHJld29yayB0aGUgcGF0Y2ggYW5kIHNlbmQgaXQgb3V0IHNl
cGFyYXRlbHkuCgoKSnVlcmdlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
