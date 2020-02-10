Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE24157CC3
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2020 14:49:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j19P4-0000zd-ON; Mon, 10 Feb 2020 13:47:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=4wzj=36=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1j19P2-0000zY-Md
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2020 13:47:08 +0000
X-Inumbo-ID: d3f70078-4c0b-11ea-852a-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d3f70078-4c0b-11ea-852a-bc764e2007e4;
 Mon, 10 Feb 2020 13:47:07 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ADF57ABE7;
 Mon, 10 Feb 2020 13:47:06 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200208151939.31691-1-andrew.cooper3@citrix.com>
 <43b54452-b4e8-eaca-466b-f79480f0b2c4@suse.com>
 <cd5a5f78-8cef-88b0-51e3-9367bb7df063@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f4fc0f8-6d3a-58f6-5a13-e9b14ca3c3cc@suse.com>
Date: Mon, 10 Feb 2020 14:47:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <cd5a5f78-8cef-88b0-51e3-9367bb7df063@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/pvh: Fix segment selector ABI
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <Ian.Jackson@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTAuMDIuMjAyMCAxNDoyOSwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxMC8wMi8yMDIw
IDEzOjIyLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMDguMDIuMjAyMCAxNjoxOSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IC0tLSBhL2RvY3MvbWlzYy9wdmgucGFuZG9jCj4+PiArKysgYi9k
b2NzL21pc2MvcHZoLnBhbmRvYwo+Pj4gQEAgLTIzLDcgKzIzLDcgQEAgZm9sbG93aW5nIG1hY2hp
bmUgc3RhdGU6Cj4+PiAgICogYGNzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFkL2V4ZWN1dGUgY29k
ZSBzZWdtZW50IHdpdGggYSBiYXNlIG9mIOKAmDDigJkKPj4+ICAgICBhbmQgYSBsaW1pdCBvZiDi
gJgweEZGRkZGRkZG4oCZLiBUaGUgc2VsZWN0b3IgdmFsdWUgaXMgdW5zcGVjaWZpZWQuCj4+PiAg
Cj4+PiAtICogYGRzYCwgYGVzYDogbXVzdCBiZSBhIDMyLWJpdCByZWFkL3dyaXRlIGRhdGEgc2Vn
bWVudCB3aXRoIGEgYmFzZSBvZgo+Pj4gKyAqIGBkc2AsIGBlc2AsIGBzc2A6IG11c3QgYmUgYSAz
Mi1iaXQgcmVhZC93cml0ZSBkYXRhIHNlZ21lbnQgd2l0aCBhIGJhc2Ugb2YKPj4+ICAgICDigJgw
4oCZIGFuZCBhIGxpbWl0IG9mIOKAmDB4RkZGRkZGRkbigJkuIFRoZSBzZWxlY3RvciB2YWx1ZXMg
YXJlIGFsbCB1bnNwZWNpZmllZC4KPj4gV291bGRuJ3QgdGhpcyB3YW50IGFjY29tcGFueWluZyB3
aXRoIGFuIGFkanVzdG1lbnQgdG8KPj4geGVuL2FyY2gveDg2L2h2bS9kb21haW4uYzpjaGVja19z
ZWdtZW50KCksIHdoaWNoIHJpZ2h0IG5vdwo+PiBpc24ndCBpbiBsaW5lIHdpdGggZWl0aGVyIG9s
ZCBvciBuZXcgdmVyc2lvbiBvZiB0aGlzIGRvYz8KPiAKPiBXaGF0IGRvIHlvdSB0aGluZyBpcyBt
aXNzaW5nP8KgIEl0IHRvbyBpcyB3cml0dGVuIHdpdGggdGhlIGV4cGVjdGF0aW9uIG9mCj4gJWVz
IGJlaW5nIHNldCB1cCwgd2hpY2ggSSBjaGVja2VkIGJlZm9yZSBzZW5kaW5nIHRoaXMgcGF0Y2gu
CgpUaGUgZnVuY3Rpb24gZm9yIGV4YW1wbGUgbG9va3MgdG8gcGVybWl0IHplcm8gc2VnbWVudCBh
dHRyaWJ1dGVzCmZvciBib3RoIERTIGFuZCBFUy4gSXQgYWxzbyBsb29rcyB0byBwZXJtaXQgbm9u
LXdyaXRhYmxlCmF0dHJpYnV0ZXMgZm9yIGJvdGgsIGFuZCBhIG5vbi1yZWFkYWJsZSBDUy4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
