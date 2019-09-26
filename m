Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F4057BF3FD
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:24:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTij-00071n-HL; Thu, 26 Sep 2019 13:22:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=breC=XV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iDTih-00071e-Gs
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:22:07 +0000
X-Inumbo-ID: a2d85e90-e060-11e9-8628-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a2d85e90-e060-11e9-8628-bc764e2007e4;
 Thu, 26 Sep 2019 13:22:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 22B73AEB3;
 Thu, 26 Sep 2019 13:22:06 +0000 (UTC)
To: hongyax@amazon.com
References: <cover.1569489002.git.hongyax@amazon.com>
 <30e7ab0c4eff006d752ecd004cd1f0130ef52536.1569489002.git.hongyax@amazon.com>
 <ff21a1f2-b97f-7ae4-018a-b14dc96e5bfe@arm.com>
 <fb8d955d-5b21-d9c6-85a5-6eda77a91b05@amazon.com>
 <96170e54-3c9a-84f5-c292-6cb23d32212b@arm.com>
 <db12612c-fa9d-3692-4940-4f1e54cbb698@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c95b57fb-017a-9eb3-5840-f18ebff9b54d@suse.com>
Date: Thu, 26 Sep 2019 15:22:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <db12612c-fa9d-3692-4940-4f1e54cbb698@amazon.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 68/84] page_alloc: actually do the
 mapping and unmapping on xenheap.
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDkuMjAxOSAxNTowMywgaG9uZ3lheEBhbWF6b24uY29tIHdyb3RlOgo+IFRoZSBzZXJp
ZXMgaXMgaW50ZW5kZWQgZm9yIHg4NiB3aGljaCB0aGVuIHN0YXJ0cyB3aXRoIG5vIHhlbmhlYXAg
bWFwcGluZ3MuIElmIAo+IG9uZSBjYWxsIHRvIG1hcF9wYWdlc190b194ZW4oKSBtYXBzIHRoZSBm
aXJzdCBoYWxmIG9mIGEgc3VwZXJwYWdlIGFuZCBhIHNlY29uZCAKPiBvbmUgbWFwcyB0aGUgcmVt
YWluaW5nLCB3aWxsIHRoZSBzZWNvbmQgY2FsbCBtZXJnZSB0aGVtIGludG8gYW4gYWN0dWFsIAo+
IHN1cGVycGFnZSBtYXBwaW5nPwoKSXQgd2lsbCB0cnkgdG8sIHllcy4KCj4gQWxzbywgZG8gd2Ug
ZG8gYSB4ZW5oZWFwIGFsbG9jYXRpb24gYW5kIHRoZW4gb25seSBmcmVlIHBhcnQgCj4gb2YgaXQg
aW4gc29tZSBjYXNlcz8KCldlIGRvLCB5ZXMuCgpXaGF0IEknbSBzZXZlcmVseSBjb25mdXNlZCBi
eSBpcyBob3cgeW91IHdvcmQgeW91ciBxdWVzdGlvbnMuCllvdSBzdXJlbHkgaGFkIGEgbmVlZCB0
byB1bmRlcnN0YW5kIGJvdGggb2YgdGhlc2UgZGV0YWlscwpiZWZvcmUgZXZlbiBwb3N0aW5nIHRo
ZSBzZXJpZXMsIHNvIG90aGVyIHRoYW4gdGhpcyAuLi4KCj4gSWYgYm90aCBhbnN3ZXJzIGFyZSBo
b3BlZnVsbHkgbm8sIHRoZW4gc2hhdHRlcmluZyB3b24ndCBoYXBwZW4uCgouLi4gaW1wbGllcyB5
b3Ugc2hvdWxkIGhhdmUga25vd24gdGhhdCB0aGUgYW5zd2VycyBhcmUgInllcyIKaW4gYm90aCBj
YXNlcy4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
