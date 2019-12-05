Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B198911453E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 17:59:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icuQw-0007YG-Bj; Thu, 05 Dec 2019 16:56:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icuQu-0007YB-SB
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 16:56:52 +0000
X-Inumbo-ID: 3b2addd5-1780-11ea-8232-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3b2addd5-1780-11ea-8232-12813bfff9fa;
 Thu, 05 Dec 2019 16:56:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D189CAF21;
 Thu,  5 Dec 2019 16:56:49 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <ad758354-b8e7-f5ef-b3cf-94a6a0d92bd4@suse.com>
 <e882a253-848a-0f03-4dbd-af7714c1fb3f@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d805323-cfa0-cf59-d575-bba6b29efbb4@suse.com>
Date: Thu, 5 Dec 2019 17:57:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e882a253-848a-0f03-4dbd-af7714c1fb3f@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4] gnttab: don't expose host physical
 address without need
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
 Wei Liu <wl@xen.org>, Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMTIuMjAxOSAxNjo0NywgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAwNS8xMi8yMDE5
IDE1OjM0LCBKYW4gQmV1bGljaCB3cm90ZToKPj4gVHJhbnNsYXRlZCBkb21haW5zIHNob3VsZG4n
dCBzZWUgaG9zdCBwaHlzaWNhbCBhZGRyZXNzZXMuIFdoaWxlIHRoZQo+PiBhZGRyZXNzIGlzIGFs
c28gbm90IHN1cHBvc2VkIHRvIGJlIGhhbmRlZCBiYWNrIGV2ZW4gdG8gbm9uLXRyYW5zbGF0ZWQK
Pj4gZG9tYWlucyB3aGVuIEdOVE1BUF9kZXZpY2VfbWFwIGlzIG5vdCBzZXQgKGFzIGV4cGxpY2l0
bHkgc3RhdGVkIGJ5IGEKPj4gY29tbWVudCBpbiB0aGUgcHVibGljIGhlYWRlciksIFBWIGtlcm5l
bHMgKExpbnV4IGF0IGxlYXN0KSBhc3N1bWUgdGhlCj4+IGZpZWxkIHRvIGdldCBwb3B1bGF0ZWQg
bmV2ZXJ0aGVsZXNzLgo+IAo+IFRoaXMgcmVhbGx5IG1lYW5zIHRoYXQgdGhlIHB1YmxpYyBoZWFk
ZXIgbmVlZHMgY29ycmVjdGluZy7CoCBUaGUgZmllbGQKPiBtYXkgbm90IGhhdmUgaW50ZW5kZWQg
dG8gZXNjYXBlIG91dCBvZiBYZW4sIGJ1dCBpdCBpcyBkZWZhY3RvIHBhcnQgb2YKPiB0aGUgQUJJ
IG5vdy4KCldlbGwsIHRoYXQncyBvbmUgb2YgdHdvIHBvc3NpYmxlIHJvdXRlcy4gVGhlIG90aGVy
IGlzIHRvIGhhdmUsIGxpa2UKeW91IGRpZCBzdWdnZXN0IGVhcmxpZXIgb24sIGEgbW9kZSBpbiB3
aGljaCB3ZSBiZWhhdmUgbW9yZSBzdHJpY3RseSwKYW5kIGN1cnJlbnQgTGludXggdGhlbiB3b3Vs
ZG4ndCB3b3JrIG9uIHN1Y2ggYSBYZW4gdW50aWwgZml4ZWQuCgo+PiAoU2ltaWxhcmx5IG1hcGtp
bmQoKSBzaG91bGQgY2hlY2sgb25seSBHTlRNQVBfZGV2aWNlX21hcC4pCj4gCj4gSXMgdGhpcyBj
b21tZW50IHN0YWxlLCBvciBoYXZlIEkgbWlzdW5kZXJzdG9vZCBzb21lIG9mIHRoZSByZWFzb25p
bmc/CgpJdCdzIGNlcnRhaW5seSBub3Qgc3RhbGUuIG1hcGtpbmQoKSBpcyB1c2VkIHRvIGRldGVy
bWluZSB3aGV0aGVyCklPTU1VIG1hcHBpbmcgYWRqdXN0bWVudHMgYXJlIG5lZWRlZC4gV2l0aCB0
aGlzLCBpdCBzaG91bGQgaW4KcHJpbmNpcGxlIG9ubHkgY29uc2lkZXIgd2hldGhlciB0aGUgY3Vy
cmVudCBvcGVyYXRpb24gd291bGQKcG9zc2libHkgYWx0ZXIgSU9NTVUgbWFwcGluZyBuZWVkcy4g
V2hhdCBuZWVkcyBkb2luZyBzaG91bGQsCmFjY29yZGluZyB0byBteSBpbnRlcnByZXRhdGlvbiBv
ZiB0aGUgb3JpZ2luYWxseSBpbnRlbmRlZCBkZXNpZ24sCm9ubHkgZGVwZW5kIG9uIGN1cnJlbnQg
YW5kIHByaW9yIHJlcXVlc3RzIHdpdGggR05UTUFQX2RldmljZV9tYXAKc2V0LgoKSmFuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
