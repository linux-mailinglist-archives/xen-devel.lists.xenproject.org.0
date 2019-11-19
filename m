Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5505102737
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2019 15:46:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iX4jh-00014l-AX; Tue, 19 Nov 2019 14:44:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=56Vh=ZL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iX4jf-00013h-SL
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2019 14:44:07 +0000
X-Inumbo-ID: 08f67b7c-0adb-11ea-9631-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08f67b7c-0adb-11ea-9631-bc764e2007e4;
 Tue, 19 Nov 2019 14:44:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D6E8EB0B6;
 Tue, 19 Nov 2019 14:44:04 +0000 (UTC)
To: Andreas Kinzler <hfp@posteo.de>
References: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
 <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
 <ab806fa6-bd5f-84e1-1c4b-b704b18fd020@suse.com>
 <9d781f63-c565-01fa-b289-10b31c9ad4f1@posteo.de>
 <5991e76e-f4bd-971f-110e-d87fbc19a437@posteo.de>
 <db8d7ae7-3abd-6df6-cd14-6dee3619e4be@suse.com>
 <3d021741-17eb-4d88-9628-23170ce38b0c@posteo.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fefdc7a3-c76e-2596-c296-6c1025ab917d@suse.com>
Date: Tue, 19 Nov 2019 15:44:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <3d021741-17eb-4d88-9628-23170ce38b0c@posteo.de>
Content-Language: en-US
Subject: Re: [Xen-devel] wall clock drift on Coffee Lake / C24x mainboard
 (HPET broken?), best practices
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
Cc: xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMTEuMjAxOSAxNTozMSwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IE9uIDE5LjExLjIw
MTkgMTA6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBOb3cgd291bGQgeW91IGJlIHVwIHRvIGNo
ZWNraW5nIHdoZXRoZXIsIHJhdGhlciB0aGFuIHZpYSBCSU9TCj4+IHNldHRpbmdzICh3aGljaCBu
b3QgYWxsIEJJT1NlcyBtYXkgb2ZmZXIpIHRoZSBzYW1lIGNhbiBiZQo+PiBhY2hpZXZlZCBieSB1
c2luZyBYZW4ncyBjb21tYW5kIGxpbmUgb3B0aW9uICJtYXhfY3N0YXRlPSI/Cj4+IEFsc28gZGlk
IHlvdSBjaGVjayB3aGV0aGVyIGZ1cnRoZXIgbGltaXRpbmcgQyBzdGF0ZSB1c2Ugd291bGQKPiAK
PiBJIGNhbm5vdCB0cnkgb24gcHJvZHVjdGlvbiBtYWNoaW5lcy4gSSBtYXkgaGF2ZSBhIHNsb3Qg
b24gbGFiIG1hY2hpbmVzIAo+IGJ1dCBJIGNhbm5vdCBwcm9taXNlLgo+IAo+ICA+IGZ1cnRoZXIg
aW1wcm92ZSB0aGUgc2l0dWF0aW9uPyBBbmQgZGlkIHlvdSBwb3NzaWJseSBhbHNvIGNoZWNrCj4g
ID4gd2hldGhlciB0ZWxsaW5nIFhlbiBub3QgdG8gdXNlIHRoZSBIUEVUIHdvdWxkIG1ha2UgYSBk
aWZmZXJlbmNlPwo+IAo+IFdoaWNoIG90aGVyIGNsb2Nrc291cmNlIGRvIHlvdSBwcmVmZXI/IElz
IFhlbiB0ZXN0ZWQgKGZpZWxkLXByb3Zlbikgb24gCj4gdGhhdCBvdGhlciBjbG9ja3NvdXJjZT8K
CiJhY3BpIiAoaS5lLiB0aGUgUE0gdGltZXIpIG91Z2h0IHRvIGJlIGZpbmUuIFRoYXQncyB3aGF0
IFhlbiB3YXMKcHJpbWFyaWx5IHVzaW5nIGJlZm9yZSBIUEVUIGJlY2FtZSBjb21tb25seSBleHBv
c2VkIGJ5IHRoZSBBQ1BJCnRhYmxlcy4gInRzYyIgb3VnaHQgdG8gYmUgZmluZSB0b28gb24gc2lu
Z2xlLXNvY2tldCBzeXN0ZW1zLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
