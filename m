Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E2E18B0C7
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 11:02:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jErxO-0008Ib-46; Thu, 19 Mar 2020 09:59:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jErxM-0008IU-8T
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 09:59:16 +0000
X-Inumbo-ID: 4a885f0a-69c8-11ea-b34e-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a885f0a-69c8-11ea-b34e-bc764e2007e4;
 Thu, 19 Mar 2020 09:59:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D9DFEAF85;
 Thu, 19 Mar 2020 09:59:14 +0000 (UTC)
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200318210540.5602-1-andrew.cooper3@citrix.com>
 <02b265af-0b0d-0d8f-ed53-4e27c1d12beb@suse.com>
 <cefd1fb0-d6cf-0798-169f-56b49356d2ac@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c322646e-ada5-fb39-743e-c2d167da8e3b@suse.com>
Date: Thu, 19 Mar 2020 10:59:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <cefd1fb0-d6cf-0798-169f-56b49356d2ac@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] xen/x86: Move microcode into its own
 directory
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDMuMjAyMCAxMDo1MiwgQW5kcmV3IENvb3BlciB3cm90ZToKPiBPbiAxOS8wMy8yMDIw
IDA5OjIxLCBKYW4gQmV1bGljaCB3cm90ZToKPj4gT24gMTguMDMuMjAyMCAyMjowNSwgQW5kcmV3
IENvb3BlciB3cm90ZToKPj4+IFNwbGl0IHRoZSBleGlzdGluZyBhc20vbWljcm9jb2RlLmggaW4g
aGFsZiwga2VlcGluZyB0aGUgcGVyLWNwdSBjcHVfc2lnCj4+PiBhdmFpbGFibGUgdG8gZXh0ZXJu
YWwgdXNlcnMsIGFuZCBtb3ZpbmcgZXZlcnl0aGluZyBlbHNlIGludG8gcHJpdmF0ZS5oCj4+Pgo+
Pj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gdHJpbSBhbmQgY2xlYW4gdXAgdGhlIGluY2x1ZGUg
bGlzdHMgZm9yIGFsbCAzIHNvdXJjZQo+Pj4gZmlsZXMsIGFsbCBvZiB3aGljaCBpbmNsdWRlIHJh
dGhlciBtb3JlIHRoYW4gbmVjZXNzYXJ5Lgo+Pj4KPj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+
Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4+IEFja2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4+IGFs
YmVpdCBwcmVmZXJhYmx5IHdpdGggLi4uCj4+Cj4+PiAtLS0KPj4+ICB4ZW4vYXJjaC94ODYvTWFr
ZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstLQo+Pj4gIHhlbi9hcmNo
L3g4Ni9taWNyb2NvZGUvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgIHwgIDMgKysKPj4+ICB4
ZW4vYXJjaC94ODYve21pY3JvY29kZV9hbWQuYyA9PiBtaWNyb2NvZGUvYW1kLmN9ICB8IDEyICsr
KystLS0tCj4+PiAgeGVuL2FyY2gveDg2L3ttaWNyb2NvZGUuYyA9PiBtaWNyb2NvZGUvY29yZS5j
fSAgICAgfCAxNSArKystLS0tLS0tCj4+PiAgLi4uL3g4Ni97bWljcm9jb2RlX2ludGVsLmMgPT4g
bWljcm9jb2RlL2ludGVsLmN9ICAgfCAgOSArKy0tLS0KPj4+ICAuLi4vbWljcm9jb2RlLmggPT4g
YXJjaC94ODYvbWljcm9jb2RlL3ByaXZhdGUuaH0gICB8IDE5ICsrKystLS0tLS0tLS0KPj4gLi4u
IHRoZXNlIGdvaW5nIGludG8geGVuL2FyY2gveDg2L2NwdS9taWNyb2NvZGUvLiBUaG91Z2h0cz8K
PiAKPiBUQkgsIEkndmUgYWx3YXlzIGZvdW5kIHRoZSBjcHUvIGRpcmVjdG9yeSByZWR1bmRhbnQu
wqAgRXZlcnl0aGluZyBpbgo+IGFyY2gveDg2IGlzIHBhcnQgb2YgdGhlIENQVSwgYW5kIHRoZXNl
IGRheXMsIGV2ZW4gZHJpdmVycy9wYXNzdGhyb3VnaCBpcwo+IHBhcnQgb2YgdGhlIENQVS4KCkkn
bSBzdXJwcmlzZWQgb2YgeW91IHNheWluZyBzbyAtIGNlcnRhaW5seSBlLmcuIG1lbW9yeSBtYW5h
Z2VtZW50CnN0dWZmIGFsc28gaW50ZXJmYWNlcyB3aXRoIHRoZSBDUFUsIGJ1dCBpcyBpbW8gc3Rp
bGwgaGVscGZ1bCB0byBiZQpzZXBhcmF0ZWQuIExpa2V3aXNlIHdoaWxlIElPTU1VIHN0dWZmIG1h
eSB0b2RheSBiZSBwYXJ0IG9mIHRoZQpDUFUgcGFja2FnZSwgaXQncyBzdGlsbCBub3QgY29yZSBD
UFUgZnVuY3Rpb25hbGl0eSBpbW8uCgo+IEknbSBoYXBweSB0byBwdXQgaXQgd2hlcmV2ZXIgbWFr
ZXMgc2Vuc2UsIHNvIGxvbmcgYXMgdGhlcmUgaXMgYSBjbGVhcgo+IHVuZGVyc3RhbmRpbmcgb2Yg
d2h5LgoKVGhlIGJvdW5kYXJpZXMgYXJlIGFsd2F5cyBnb2luZyB0byBiZSBmdXp6eSwgSSB0aGlu
ay4gQXMgc2FpZCwgSSdkCnByZWZlciB0aGUgYWx0ZXJuYXRpdmUgcGxhY2UsIGJ1dCBJJ20gbm90
IGdvaW5nIHRvIGluc2lzdC4KCkphbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
