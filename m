Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76E0113D9E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2019 10:13:58 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1icn7Z-0006Pz-0c; Thu, 05 Dec 2019 09:08:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=90OC=Z3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1icn7X-0006PD-8T
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2019 09:08:23 +0000
X-Inumbo-ID: c9633a7a-173e-11ea-a0d2-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9633a7a-173e-11ea-a0d2-bc764e2007e4;
 Thu, 05 Dec 2019 09:08:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EF24CAFD8;
 Thu,  5 Dec 2019 09:08:21 +0000 (UTC)
To: Igor Druzhinin <igor.druzhinin@citrix.com>
References: <1575495080-27656-1-git-send-email-igor.druzhinin@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <254b3662-b339-1836-6a82-81a96949ef6f@suse.com>
Date: Thu, 5 Dec 2019 10:08:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1575495080-27656-1-git-send-email-igor.druzhinin@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] passthrough: add missed pcidevs_unlock
 following c/s cd7dedad820
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
Cc: xen-devel@lists.xenproject.org, linux@eikelenboom.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMTIuMjAxOSAyMjozMSwgSWdvciBEcnV6aGluaW4gd3JvdGU6Cj4gVGhlIGxvY2tpbmcg
cmVzcG9uc2liaWxpdGllcyBoYXZlIGNoYW5nZWQgYW5kIGEgcHJlbWF0dXJlIGJyZWFrIGluCj4g
dGhpcyBzZWN0aW9uIG5vdyBjYXVzZXMgdGhlIGZvbGxvd2luZyBhc3NlcnRpb246Cj4gCj4gQXNz
ZXJ0aW9uICchcHJlZW1wdF9jb3VudCgpJyBmYWlsZWQgYXQgcHJlZW1wdC5jOjM2Cj4gCj4gUmVw
b3J0ZWQtYnk6IFNhbmRlciBFaWtlbGVuYm9vbSA8bGludXhAZWlrZWxlbmJvb20uaXQ+Cj4gU2ln
bmVkLW9mZi1ieTogSWdvciBEcnV6aGluaW4gPGlnb3IuZHJ1emhpbmluQGNpdHJpeC5jb20+Cj4g
LS0tCj4gIHhlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jIHwgMSArCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS94ZW4vZHJpdmVycy9wYXNzdGhy
b3VnaC9wY2kuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gaW5kZXggY2VkMGMy
OC4uMjU5M2ZlNCAxMDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9wY2kuYwo+
ICsrKyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3BjaS5jCj4gQEAgLTE3MDUsNiArMTcwNSw3
IEBAIGludCBpb21tdV9kb19wY2lfZG9tY3RsKAo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNl
ZywgYnVzLCBQQ0lfU0xPVChkZXZmbiksIFBDSV9GVU5DKGRldmZuKSk7Cj4gICAgICAgICAgICAg
ICAgICByZXQgPSAtRUlOVkFMOwo+ICAgICAgICAgICAgICB9Cj4gKyAgICAgICAgICAgIHBjaWRl
dnNfdW5sb2NrKCk7Cj4gICAgICAgICAgICAgIGJyZWFrOwoKQXMgZGlzY3Vzc2VkIG9uIHRoZSB0
aHJlYWQgb2YgU2FuZGVyJ3MgcmVwb3J0LCBJIHRoaW5rIHdlJ2QgYmUKYmV0dGVyIG9mZiBzaW1w
bHkgZGVsZXRpbmcgdGhlIGJyZWFrIHN0YXRlbWVudC4KCkphbgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
