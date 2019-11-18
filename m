Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E11100C50
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 20:40:20 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWmoT-0003KB-SV; Mon, 18 Nov 2019 19:35:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e2Is=ZK=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iWmoR-0003K6-OG
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 19:35:52 +0000
X-Inumbo-ID: a000977e-0a3a-11ea-a2e0-12813bfff9fa
Received: from mout01.posteo.de (unknown [185.67.36.65])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a000977e-0a3a-11ea-a2e0-12813bfff9fa;
 Mon, 18 Nov 2019 19:35:50 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id AFF9C16005C
 for <xen-devel@lists.xenproject.org>; Mon, 18 Nov 2019 20:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1574105748; bh=zVJ0jqmFtApOy9iFuLFyXgIbmRg0KI5Y/OOvk1dtsoI=;
 h=From:Subject:To:Cc:Date:From;
 b=sKyOlThf7vggx5SlZGrbe6kUdRXfgW1u1AqFBAaLqiUqeDuMBCQx7yPcvpfS7XYJ6
 oDe5F4bUwrwmYmhPAod8rNXLiMiIFRpE6tJoLkaewrje2BVh1V8lWow1tygv2qBrHn
 6o5T+fQ5ZWvYV/Uc2C6mUU47aLdT112lwIQNV+g/kuYaTkFoTTjYWRFtBzGZlk+taW
 5l17U9zy8JiV2pQQL6OyTmmFemSZbywBthSgGpplWUkRM49x8wFrdHpbjxIph/wtGK
 1hBIBRT/0q40E7XIlbDmDT/9cFNUd8ErPBMm08Wfpj/OxUZft2hAfn5FUTRCtef46Y
 LJvC3sib0x/EQ==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47GzhM20byz6tmM;
 Mon, 18 Nov 2019 20:35:47 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: Jan Beulich <jbeulich@suse.com>
References: <4bc44777-103b-ada5-839a-809da33ba00c@posteo.de>
 <10fe632c-0f08-5399-0342-f6dfd9ca9b19@posteo.de>
 <ab806fa6-bd5f-84e1-1c4b-b704b18fd020@suse.com>
 <9d781f63-c565-01fa-b289-10b31c9ad4f1@posteo.de>
Message-ID: <5991e76e-f4bd-971f-110e-d87fbc19a437@posteo.de>
Date: Mon, 18 Nov 2019 20:35:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <9d781f63-c565-01fa-b289-10b31c9ad4f1@posteo.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMTEuMjAxOSAxMjowMSwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+IE9uIDE0LjExLjIw
MTkgMTI6MjksIEphbiBCZXVsaWNoIHdyb3RlOgo+PiBPbiAxNC4xMS4yMDE5IDAwOjEwLCBBbmRy
ZWFzIEtpbnpsZXIgd3JvdGU6Cj4+PiBJIGNhbWUgYWNyb3NzIHRoZSBmb2xsb3dpbmc6IGh0dHBz
Oi8vbGttbC5vcmcvbGttbC8yMDE5LzgvMjkvNTM2Cj4+PiBDb3VsZCB0aGF0IGJlIHRoZSByZWFz
b24gZm9yIHRoZSBwcm9ibGVtIG1lbnRpb25lZCBiZWxvdz8gWGVuIGlzIHVzaW5nCj4+PiBIUEVU
IGFzIGNsb2Nrc291cmNlIG9uIHRoZSBwbGF0Zm9ybS9tYWluYm9hcmQuIElzIHRoZXJlIGFuIChl
YXN5KSB3YXkgdG8KPj4+IHZlcmlmeSBpZiBYZW4gdXNlcyBQQzEwPwo+PiBIZW5jZSBJIGNhbiBv
bmx5IHN1Z2dlc3QgdGhhdCB5b3UgdHJ5IGFnYWluIHdpdGggbGltaXRlZCBvciBubwo+PiB1c2Ug
b2YgQyBzdGF0ZXMsIHRvIGF0IGxlYXN0IGdldCBhIGhpbnQgYXMgdG8gYSBwb3NzaWJsZQo+IEkg
Y2hhbmdlZCB0aGUgQklPUyBzZXR0aW5nIHRvIGEgbGltaXQgb2YgUEM3IGFuZCBpdCBpcyBub3cg
cnVubmluZy4gSSAKPiBoYXZlIHRvIHdhaXQgZm9yIHRoZSByZXN1bHQuIFRoYW5rcy4KClByZXZp
b3VzbHkgdGhlIGRyaWZ0IGFmdGVyIDQgZGF5cyB1cHRpbWUgd2FzIDYwIHNlYy4gTm93IGFmdGVy
IDQgZGF5cyAKdXB0aW1lIGRyaWZ0IGlzIDkgc2VjLiBTbyBzZXR0aW5nIHRoZSBwYWNrYWdlIGMt
c3RhdGUgbGltaXQgdG8gUEM3IHdhcyBhIApzdWNjZXNzLgoKUmVnYXJkcyBBbmRyZWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
