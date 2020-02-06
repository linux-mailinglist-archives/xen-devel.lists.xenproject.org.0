Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B815403A
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2020 09:32:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1izcYT-0001Wp-87; Thu, 06 Feb 2020 08:30:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ya+N=32=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1izcYQ-0001Wi-Qb
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2020 08:30:30 +0000
X-Inumbo-ID: ed778e5f-48ba-11ea-aeef-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ed778e5f-48ba-11ea-aeef-12813bfff9fa;
 Thu, 06 Feb 2020 08:30:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0F521B1DA;
 Thu,  6 Feb 2020 08:30:28 +0000 (UTC)
To: Julien Grall <julien@xen.org>
References: <ad98947f577560d47ea7825deb624149788645d0.1580219401.git.hongyxia@amazon.com>
 <1398d8919b9f5c81e54b459c69e6b89352260ebe.camel@amazon.com>
 <c125fe8e-a2c6-a972-e7f7-a18f8c75a3ab@suse.com>
 <0316c4aa-4511-cd04-e40d-46ab92350e14@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a303e65a-578f-205e-70a1-ac8435245824@suse.com>
Date: Thu, 6 Feb 2020 09:30:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <0316c4aa-4511-cd04-e40d-46ab92350e14@xen.org>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v6] x86: introduce a new set of APIs to
 manage Xen page tables
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
Cc: "wl@xen.org" <wl@xen.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDIuMjAyMCAxODo0NSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE9uIDA1LzAyLzIwMjAg
MTY6NDcsIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAwNS4wMi4yMDIwIDE3OjI1LCBYaWEsIEhv
bmd5YW4gd3JvdGU6Cj4+PiBQaW5nLgo+Pgo+PiBTb3JyeSwgdGhlcmUncyBqdXN0IHRvbyBtdWNo
IGVsc2UgYWxzbyBuZWVkaW5nIGF0dGVudGlvbi4gSSdtCj4+IGRvaW5nIHdoYXQgSSBjYW4gcmV2
aWV3LXdpc2UsIGFuZCBJIGFzc3VtZSBzb21lIG90aGVycyBkbyBzbywKPj4gdG9vLiBZb3UncmUg
dmVyeSB3ZWxjb21lIHRvIGhlbHAgd2l0aCB0aGUgcmV2aWV3IGxvYWQuCj4gCj4gV2VpIGFuZCBJ
IGFscmVhZHkgcmV2aWV3ZWQgdGhlIHBhdGNoLiBTbyBIb25neWFuIGlzIG1haW5seSB3YWl0aW5n
IG9uIAo+IHRoZSBtYWludGFpbmVycyAoQW5kcmV3IGFuZCB5b3UpIHRvIGdpdmUgdGhlaXIgZmlu
YWwgYWNrLgo+IAo+IFdvdWxkIHlvdSBiZSBoYXBweSB0byBnaXZlIHlvdXIgYWNrIGJhc2VkIG9u
IHRoZSByZXZpZXdzIGZyb20gV2VpIGFuZCBtZT8KCk9uIHNvbWUgY2hhbmdlcyBJIHdvdWxkIGJl
LCBidXQgZS5nLiBuZXdseSBpbnRyb2R1Y2VkIEFQSXMgSSB3YW50CnRvIGxvb2sgYXQgY2xvc2Vs
eSBteXNlbGYsIGFuZCBoZXJlIHRoZSBtb3JlIHRvIHNlZSB3aGV0aGVyIHByaW9yCmNvbW1lbnRz
IG9mIG1pbmUgKHdoaWNoIGlpcmMgSSBkaWQgcHJvdmlkZSkgaGF2ZSBiZWVuIGFkZHJlc3NlZApz
dWl0YWJseS4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
