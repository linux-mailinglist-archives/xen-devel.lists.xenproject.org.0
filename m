Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0B0108E2B
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2019 13:48:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZDl5-0008At-CG; Mon, 25 Nov 2019 12:46:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vxxO=ZR=posteo.de=hfp@srs-us1.protection.inumbo.net>)
 id 1iZDl3-0008Ak-W7
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2019 12:46:26 +0000
X-Inumbo-ID: 95e8fb7c-0f81-11ea-9455-bc764e2007e4
Received: from mout02.posteo.de (unknown [185.67.36.66])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 95e8fb7c-0f81-11ea-9455-bc764e2007e4;
 Mon, 25 Nov 2019 12:46:23 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 489182400FF
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2019 13:46:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1574685982; bh=RVytzATxhyFFMwNw9hhwp+S5SBE2ETKyF1HUo/meIYM=;
 h=From:Subject:To:Cc:Date:From;
 b=TsGKjAOQr/7w6q2LGdYuvwJ6InH1KciyionkASVf+bMmk+u0aXDMQtq5snQ/cOyml
 I3aYk2sOFlDgccXeYuVsbnPJUNNaadVZGuQj1urMurU1cB6Omb0I6cbFRl6/rwVO8H
 1mXYks/uSihv9vBpBkZSTBH2ZLu0AmHGCU1KZ7QfMBcvaU/G4Y+I1KaasDeXvQgbXW
 CjfAZQTX1vA4FRkbvK5VD7jXNUoRifkpuR2Lz2w6r0EB4A7D6qpalQoGpckK0UHQS9
 6npyOiVosU36eKewfTZS83slcC7gmAmxna2etpCPq6odT2Cg2372bYTjamPLmH8IRg
 lB9m7wBn6YVkg==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 47M6Gh4Rr9z9rxB;
 Mon, 25 Nov 2019 13:46:20 +0100 (CET)
From: Andreas Kinzler <hfp@posteo.de>
To: Jan Beulich <jbeulich@suse.com>
References: <fba2992c-e306-dfb2-8edb-20fe5d18ca98@suse.com>
 <ad0a9bc4-dbd6-d59c-d33b-8bed744376ae@citrix.com>
 <ccebdbf3-7cd9-b1e9-b3c5-976ee5b5380b@suse.com>
 <7d2259af-188b-031f-6853-44a0151b7ee3@citrix.com>
 <e628dd1c-dd2b-76e0-6735-5785361756a1@posteo.de>
 <84babdfb-3d85-38b9-5a39-a2d0d8cb4439@suse.com>
Message-ID: <0d7e90b3-348d-535d-3d2c-f3f214bcf7fb@posteo.de>
Date: Mon, 25 Nov 2019 13:46:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <84babdfb-3d85-38b9-5a39-a2d0d8cb4439@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] x86: avoid HPET use on certain Intel
 platforms
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMTEuMjAxOSAxMToxNSwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMjMuMTEuMjAxOSAw
MDoxMCwgQW5kcmVhcyBLaW56bGVyIHdyb3RlOgo+PiBCVFc6IFhlb24gRS0yMTM2IEAgQzI0MiBo
YXMgODA4NjozZWNhIGFzIElELiBPbmUgbmVlZHMgdG8gY2hlY2sgd2l0aAo+PiBJbnRlbCB3aGlj
aCBjb21iaW5hdGlvbnMgYXJlIHJlYWxseSBhZmZlY3RlZC4KPiBBcmUgeW91IHNheWluZyB5b3Ug
b2JzZXJ2ZWQgdGhlIHNhbWUgaXNzdWUgb24gc3VjaCBhIChzZXJ2ZXIgcHJvY2Vzc29yKQo+IHN5
c3RlbSBhcyB3ZWxsPyBOZWl0aGVyIGl0cyBkYXRhc2hlZXQgbm9yIGl0cyBzcGVjaWZpY2F0aW9u
IHVwZGF0ZQoKVGhlIHdob2xlIHRocmVhZCBzdGFydGluZyB3aXRoIApodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRldmVsLzIwMTktMTAvbXNnMDA5NjYuaHRt
bCAKd2FzIGFib3V0IFhlb24gRS0yMTM2LgoKU2V0dGluZyBhIGxpbWl0IHRvIFBDNyBncmVhdGx5
IHJlZHVjZWQgdGhlIGRyaWZ0IAooaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9hcmNoaXZl
cy9odG1sL3hlbi1kZXZlbC8yMDE5LTExL21zZzAxMDQ0Lmh0bWwpCgo+ICh3aGljaCBJIHNwZWNp
ZmljYWxseSBkb3dubG9hZGVkIGFuZCBsb29rZWQgdGhyb3VnaCBqdXN0IGJlY2F1c2Ugb2YgeW91
cgo+IHJlbWFyaykgaGF2ZSBhbnkgbWVudGlvbiBvZiBhIHNpbWlsYXIgaXNzdWUuIEkgYWxzbyB0
YWtlIGl0IHRoYXQgdGhlCj4gY29kZSBjb21tZW50IGluaGVyaXRlZCBmcm9tIExpbnV4IHNheXMg
IlNvQ3MiIGZvciBhIHJlYXNvbi4KCkV2ZW4gdGhlIGtlcm5lbCBtYWlsaW5nIGxpc3QgcG9zdGlu
Z3MgbGFjayBvZmZpY2lhbCBjb25maXJtYXRpb24gZnJvbSAKSW50ZWwuIFRoYXQgaXMgd2h5IEkg
c2FpZDogc29tZW9uZSAod2l0aCBpbnRlcm5hbCBJbnRlbCBrbm93bGVkZ2UpIG5lZWRzIAp0byBj
b25maXJtIHdoaWNoIGNvbWJpbmF0aW9ucyBhcmUgYWZmZWN0ZWQuCgpSZWdhcmRzIEFuZHJlYXMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
