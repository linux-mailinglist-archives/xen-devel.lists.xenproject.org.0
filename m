Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9EF31399
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2019 19:15:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWl45-0004S5-Pd; Fri, 31 May 2019 17:11:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=2tza=T7=arm.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hWl43-0004S0-Ux
 for xen-devel@lists.xenproject.org; Fri, 31 May 2019 17:11:35 +0000
X-Inumbo-ID: 245ad8d6-83c7-11e9-9f80-cf2f541b6716
Received: from foss.arm.com (unknown [217.140.101.70])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 245ad8d6-83c7-11e9-9f80-cf2f541b6716;
 Fri, 31 May 2019 17:11:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18A43A78;
 Fri, 31 May 2019 10:11:34 -0700 (PDT)
Received: from [10.1.196.50] (e108454-lin.cambridge.arm.com [10.1.196.50])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2780A3F59C;
 Fri, 31 May 2019 10:11:33 -0700 (PDT)
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xenproject.org
References: <1558949370-14331-1-git-send-email-andrii.anisov@gmail.com>
 <d63ff1d7-963a-bd1a-7835-ee5b30504628@arm.com>
 <20d30591-bc90-5321-2de9-a11f7d36cb11@gmail.com>
 <f0e27dd4-fc59-05d8-e910-b63c0d398c00@arm.com>
 <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <4d27c123-826d-ad07-ed0a-e7a7517fca62@arm.com>
Date: Fri, 31 May 2019 18:11:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c0de5da0-9986-ea97-b7d3-6902bd789c19@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] gic: drop interrupts enabling on
 interrupts processing
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
Cc: Andre Przywara <andre.przywara@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGkgQW5kcmlpLAoKT24gMzAvMDUvMjAxOSAxNzoxMiwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBP
biAyOS4wNS4xOSAxODozMiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBJdCB3b3VsZCBoYXZlIGJl
ZW4gbmljZSB0byBhdCBsZWFzdCBmaXggdXAgdGhlIGNvbW1pdCBtZXNzYWdlIHdpdGggdGhlIHR5
cG9lcyAKPj4gKGFuZCByZXdvcmRpbmcpIEkgbWVudGlvbmVkIGluIG15IHByZXZpb3VzIGUtbWFp
bC4KPj4gWW91ciBjb21taXQgbWVzc2FnZSBuZWVkcyB0byBleHBsYWluZWQgd2h5IHRoaXMgaXMg
ZmluZSB0byBrZWVwIHRoZSBpbnRlcnJ1cHQgCj4+IG1hc2tlZCBhIGJpdCBsb25nZXIuIEkgd3Jv
dGUgdGhlIGV4cGxhbmF0aW9uIGluIG15IHByZXZpb3VzIGUtbWFpbCBzbyB5b3UgY2FuIAo+PiBi
b3Jyb3cgdGhlIHJhdGlvbmFsZSBmcm9tIHRoZXJlLgo+IHhlbi9hcm06IGdpYzogRGVmZXIgdGhl
IGRlY2lzaW9uIHRvIHVubWFzayBpbnRlcnJ1cHRzIHRvIGRvX3tMUEksIElSUX0oKQo+IAo+IEhh
dmluZyBpcnFzIGVuYWJsZWQgaGVyZSBsZWF2ZXMgYSByb29tIGZvciB0cmFwcGluZyBhbmQgZ29p
bmcgdGhyb3VnaCB0aGUgdHJhcAoKUGxlYXNlIGF2b2lkICJoZXJlIiBpbiBjb21taXQgbWVzc2Fn
ZSBpZiB5b3UgaGF2ZW4ndCBkZWZpbmVkIHdoZXJlIGlzIHRoZSBpc3N1ZS4KCj4gcGF0aCBhZ2Fp
biBpZiB3ZSBoYXZlIGEgbmV3IGd1ZXN0IGludGVycnVwdCBhcnJpdmVkIChldmVuIHdpdGggdGhl
IHNhbWUgb3IKCkkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgIm5ldyBndWVzdCBpbnRlcnJ1cHQgYXJy
aXZlZCIuCgo+IGxvd2VyIHByaW9yaXR5LCBhZnRlciBgZGVzYy0+aGFuZGxlci0+ZW5kKGRlc2Mp
YCBpbiBgZG9fSVJRKClgKS4KPiBLZWVwaW5nIGludGVycnVwdHMgZGlzYWJsZWQgZHVyaW5nIGd1
ZXN0IGludGVycnVwdHMgcHJvY2Vzc2luZyBhbGxvd3MgYXMKCk1pc3Npbmcgd29yZCBiZWNhdXNl
ICJhbGxvd3MiIGFuZCAiYXMiPwoKPiBhdm9pZGluZyBleGNlc3NpdmUgdHJhcHMgKGFuZCB3YXN0
aW5nIGNwdSBjeWNsZXMgZm9yIHRyYXAgcGF0aCkgd2hpbGUgdGhlIG5ldwo+IGludGVycnVwdHMg
d291bGQgYmUgcHJvY2Vzc2VkIGluIHRoZSBsb29wIGFueXdheS4gUHJvY2Vzc2luZyBndWVzdCBp
bnRlcnJ1cHRzIGJ5Cj4gdGhlIGxvb3Agc2hvdWxkIG5vdCBpbnRyb2R1Y2Ugc2lnbmlmaWNhbnQg
YWRkaXRpb25hbCBsYXRlbmN5IGJlY2F1c2UKCkkgYW0gYWx3YXlzIHdvcnJ5IHdoZW4gSSBzZWUg
dGhlIHdvcmQgInNob3VsZCBub3QiIGFzc29jaWF0ZWQgd2l0aCAibGF0ZW5jeSIgCmJlY2F1c2Ug
b2Z0ZW4gaXQgaXMgYWN0dWFsbHkgdGhlIGNvbnRyYXJ5IChzZWUgdGhlIHJlY2VudCBhdHRlbXB0
IHRvIG9wdGltaXplIAp0aGUgb2xkIHZHSUMpLiBJZiB5b3UgZG9uJ3QgaGF2ZSBudW1iZXIsIHRo
ZW4geW91IHNob3VsZCBkZXRhaWwgdGhlIHJhdGlvbmFsZSBoZXJlLgoKVGhlIG1vcmUgSSB0aGlu
ayBhYm91dCBpdCwgdGhlIG1vcmUgSSBmZWVsIGl0IHdvdWxkIGp1c3QgYmUgYmVzdCB0byBtYXNr
IHRoZSAKaW50ZXJydXB0IGp1c3QgYmVmb3JlIGRyb3BwaW5nIHRoZSBwcmlvcml0eS4gQnV0IEkg
YW0gaGFwcHkgdG8gY29uc2lkZXIgdGhpcyBpZiAKeW91IGhhdmUgc29tZSBncm91bmQgdG8gYmFj
ayB0aGUgYXBwcm9hY2ggKHRoZXkgc2hvdWxkIGJlIHBhcnQgb2YgdGhlIGNvbW1pdCAKbWVzc2Fn
ZSkuCgo+IHZnaWNfaW5qZWN0X2lycSguLi4pIGFscmVhZHkgbWFza2luZyB0aGUgaW50ZXJydXB0
cyBpbiBtb3N0IG9mIHRoZSBjYXNlcy4KCkhlcmUgbXkgdGFrZSBvbiB0aGUgY29tbWl0IG1lc3Nh
Z2U6CgpnaWNfaW50ZXJydXB0KCkgd2FzIGltcGxlbWVudGVkIHVzaW5nIGEgbG9vcCB0byBsaW1p
dCB0aGUgY29zdCBvZiB0aGUgdHJhcCBpZiAKdGhlcmUgYXJlIG11bHRpcGxlIGludGVycnVwdHMg
cGVuZGluZy4KCkF0IHRoZSBtb21lbnQsIGludGVycnVwdHMgYXJlIHVubWFza2VkIGJ5IGdpY19p
bnRlcnJ1cHQoKSBiZWZvcmUgY2FsbGluZyAKZG9fe0lSUSwgTFBJfSgpLiBJbiB0aGUgY2FzZSBv
ZiBoYW5kbGluZyBhbiBpbnRlcnJ1cHQgcm91dGVkIHRvIGd1ZXN0cywgaXRzIApwcmlvcml0eSB3
aWxsIGJlIGRyb3BwZWQsIHZpYSBkZXNjLT5oYW5kbGVyLT5lbmQoKSBjYWxsZWQgZnJvbSBkb19p
cnEoKSwgd2l0aCAKaW50ZXJydXB0IHVubWFza2VkLgoKSW4gb3RoZXIgd29yZHM6CiAgICAgLSBV
bnRpbCB0aGUgcHJpb3JpdHkgaXMgZHJvcHBlZCwgb25seSBoaWdoZXIgcHJpb3JpdHkgaW50ZXJy
dXB0IGNhbiBiZSAKcmVjZWl2ZWQuIFRvZGF5LCBvbmx5IFhlbiBpbnRlcnJ1cHRzIGhhdmUgaGln
aGVyIHByaW9yaXR5LgogICAgIC0gQXMgc29vbiBhcyBwcmlvcml0eSBpcyBkcm9wcGVkLCBhbnkg
aW50ZXJydXB0IGNhbiBiZSByZWNlaXZlZC4KClRoaXMgbWVhbnMgdGhlIHB1cnBvc2Ugb2YgdGhl
IGxvb3AgaW4gZ2ljX2ludGVycnVwdCgpIGlzIGRlZmVhdGVkIGFzIGFsbCAKaW50ZXJydXB0cyBt
YXkgZ2V0IHRyYXBwZWQgZWFybGllci4gVG8gcmVpbnN0YXRlIHRoZSBwdXJwb3NlIG9mIHRoZSBs
b29wIChhbmQgCnByZXZlbnQgdGhlIHRyYXApLCBpbnRlcnJ1cHRzIHNob3VsZCBiZSBtYXNrZWQg
d2hlbiBkcm9wcGluZyB0aGUgcHJpb3JpdHkuCgpGb3IgaW50ZXJydXB0cyByb3V0ZWQgdG8gWGVu
LCBwcmlvcml0eSB3aWxsIGFsd2F5cyBiZSBkcm9wcGVkIHdpdGggaW50ZXJydXB0cyAKbWFza2Vk
LiBTbyB0aGUgaXNzdWUgaXMgbm90IHByZXNlbnQuIEhvd2V2ZXIsIGl0IG1lYW5zIHRoYXQgd2Ug
YXJlIHBvaW50bGVzcyB0cnkgCnRvIG1hc2sgdGhlIGludGVycnVwdHMuCgpUbyBhdm9pZCBjb25m
bGljdGluZyBiZWhhdmlvciBiZXR3ZWVuIGludGVycnVwdCBoYW5kbGluZywgZ2ljX2ludGVycnVw
dCgpIGlzIG5vdyAKa2VlcGluZyBpbnRlcnJ1cHRzIG1hc2tlZCBhbmQgZGVmZXIgdGhlIGRlY2lz
aW9uIHRvIGRvX3tMUEksIElSUX0uCgpbIERldGFpbHMgdG8gYmUgYWRkZWQgb25jZSB5b3UgZ2l2
ZSBtb3JlIGdyb3VuZCBdCgpDaGVlcnMsCgotLSAKSnVsaWVuIEdyYWxsCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
