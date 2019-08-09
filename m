Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C0882C6
	for <lists+xen-devel@lfdr.de>; Fri,  9 Aug 2019 20:41:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hw9mt-0005Vy-VU; Fri, 09 Aug 2019 18:38:51 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1Cff=WF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hw9ms-0005Ux-7j
 for xen-devel@lists.xenproject.org; Fri, 09 Aug 2019 18:38:50 +0000
X-Inumbo-ID: ecde476b-bad4-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ecde476b-bad4-11e9-8980-bc764e045a96;
 Fri, 09 Aug 2019 18:38:49 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h28so70134492lfj.5
 for <xen-devel@lists.xenproject.org>; Fri, 09 Aug 2019 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CdWJrb5UCEsnf23CYRQ0LpMe9z5EwP5s8ZokTx5KX4U=;
 b=mEFju2Did8ZeXPz+gpM/saSvaQuT5kQRdWbMVy8JyM0UNiJlWi65dsGeKIJKNTOnr7
 M/P7ehV2qwVm01QI6JcQBVZyeTX/skqvjFTCWI+//1qbSdqOOhZatQRtYsPhOBs2vyqd
 XJB4RnIzh231qWuxC2Z8mHhDMuUDWAilnbTu6cGZz8szaIxXxcfsu8qlVWVReHcd+Km4
 BtRWD1S2h2hAImTaWRlIKBMxaWBd1H8puFavb3lbTjuw2Xd9rn1COEj0pUplMvsXoJdG
 MDpYEcEFwqcCxmShQJW0JN0ZpehiIhjd0anlh/h61yQ6zuhp6UjTNZkVw1C5GNz+nteI
 YUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=CdWJrb5UCEsnf23CYRQ0LpMe9z5EwP5s8ZokTx5KX4U=;
 b=hfSmVJgxA6Koe0JkabeP35lcg7BuAZ/zows8kY2QF7hONtsl2CcgD0okOr0rMzYpAl
 bfTw+yB0rpyAGYEPSHz6iHVQAgwc9NvqLKW53D2OO3mKwcHwntgpQnTCVUFZF43TZhJW
 Olh07lD8VYNxz/m1/cBvgT8Qwozceq/kWOoo2yidmLhPkX8a2TytrWOFOYv37UIzTzZb
 y+9Nr1RgNqyXPdfMFLYu1JMvOJK9OQpacIc6Z/qcF0ALVqKTldYc4UUrCJp8Y08iQWs7
 I3Dt8Lz/HppS44d3vj8HS2fNfy0RChcCwrhX3trS/cTz5zPf1RniXTIKfVVlz4R/K+y4
 T4GA==
X-Gm-Message-State: APjAAAXtV2pb/hxNpsMmefSKZasTQF2Vy/vA9FM9okNp1kTNhiXwUHmx
 okBi7mqTHMGnV9CnOMpHvGk=
X-Google-Smtp-Source: APXvYqz1hxUcGSBEN72LVA3qEK2dfHvgbxF97PwfUU+7Fzrky4+qQAA8ADVqN1QtUhdCTr1wHRTnJQ==
X-Received: by 2002:a19:5217:: with SMTP id m23mr13255918lfb.124.1565375927566; 
 Fri, 09 Aug 2019 11:38:47 -0700 (PDT)
Received: from [10.17.182.120] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id 199sm19522892ljf.44.2019.08.09.11.38.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 09 Aug 2019 11:38:47 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>
References: <1564763985-20312-1-git-send-email-olekstysh@gmail.com>
 <1564763985-20312-7-git-send-email-olekstysh@gmail.com>
 <OSBPR01MB453664F7A6D6AA717761BC07D8D40@OSBPR01MB4536.jpnprd01.prod.outlook.com>
 <a49eccf6-935c-c87a-1fcc-fdc12a67d58e@gmail.com>
 <42cc28a7-5ab3-e24f-16d3-7a287f7f14e8@arm.com>
 <CAPD2p-kJe6=YZ_rPrdDpay-u+r3GDPp58LpxqLpBg0oN_3W1-g@mail.gmail.com>
 <7cecce50-31e9-0e3f-d41c-a051ea6f9971@arm.com>
 <11de4dee-2d2f-2578-57ae-4313c985e645@gmail.com>
 <03b1bac9-40ca-3bd4-d3fa-a4acc4e9e958@arm.com>
 <e2af5e18-2a95-0880-4acc-492848800b19@gmail.com>
 <cefcad8a-b6a5-9caa-0102-72951f9fcb7e@arm.com>
 <862f74f1-2039-8737-6d71-fe3fc07a06ff@gmail.com>
 <8d38df29-7314-02a8-94d7-5e317c8ea442@arm.com>
 <CAPD2p-nv27=4RH5RVMyzBdAfTXeSArW3nvKEydhKWgm-mRoBmg@mail.gmail.com>
 <a2e19875-5c22-bdc0-0a84-5a983921fbd7@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <53e65d6f-6424-53c5-31aa-f08bb0208d65@gmail.com>
Date: Fri, 9 Aug 2019 21:38:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a2e19875-5c22-bdc0-0a84-5a983921fbd7@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V2 6/6] iommu/arm: Add Renesas IPMMU-VMSA
 support
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CkhpLCBKdWxpZW4KCgo+Pgo+PiDCoMKgwqAgV2hhdCB3aWxsIGFjdHVhbGx5IGhhcHBlbiBpZiB0
aGUgdHJhbnNhY3Rpb24gZmFpbCBhZ2Fpbj8gRm9yIAo+PiBpbnN0YW5jZSwKPj4gwqDCoMKgIGlm
IHRoZSBJT1ZBIHdhcyBub3QgbWFwcGVkLiBXaWxsIHlvdSByZWNlaXZlIHRoZSBpbnRlcnJ1cHQg
YWdhaW4/Cj4+IMKgwqDCoCBJZiBzbywgYXJlIHlvdSBnb2luZyB0byBtYWtlIHRoZSBmbHVzaCBh
Z2FpbiBhbmQgYWdhaW4gdW50aWwgdGhlIAo+PiBndWVzdAo+PiDCoMKgwqAgaXMga2lsbGVkPwo+
Pgo+Pgo+PiBUaGlzIGlzIGEgZ29vZCBxdWVzdGlvbi4gSSB0aGluaywgaWYgYWRkcmVzcyBpcyBu
b3QgbWFwcGVkLCB0aGUgCj4+IHRyYW5zYWN0aW9uIHdpbGwgZmFpbCBhZ2FpbiBhbmQgd2Ugd2ls
bCBnZXQgdGhlIGludGVycnVwdCBhZ2Fpbi4gTm90IAo+PiBzdXJlLCB1bnRpbCB0aGUgZ3Vlc3Qg
aXMga2lsbGVkIG9yIHVudGlsIHRoZSBkcml2ZXIgaW4gdGhlIGd1ZXN0IAo+PiBkZXRlY3RzIHRp
bWVvdXQgYW5kIGNhbmNlbHMgRE1BLiBMZXQncyBjb25zaWRlciB0aGUgd29yc3QgY2FzZSwgdW50
aWwgCj4+IHRoZSBndWVzdCBpcyBraWxsZWQuCj4+Cj4+IFNvIG15IHF1ZXN0aW9ucyBhcmUgd2hh
dCBkbyB5b3UgdGhpbmsgd291bGQgYmUgdGhlIHByb3BlciBkcml2ZXIncyAKPj4gYmVoYXZpb3Ig
aW4gdGhhdCBjYXNlPyBEbyBub3RoaW5nIGFuZCBkb24ndCBldmVuIHRyeSB0byByZXNvbHZlIGVy
cm9yIAo+PiBjb25kaXRpb24vdW5ibG9jayB0cmFuc2xhdGlvbiBhdCB0aGUgZmlyc3QgcGFnZSBm
YXVsdCwgb3IgZ2l2ZSBpdCBhIAo+PiBmZXcgYXR0ZW1wdHMsIG9yIHVuYmxvY2sgZXZlcnkgdGlt
ZS4KPgo+IEkgd2lsbCBhbnN3ZXIgYmFjayB3aXRoIGEgcXVlc3Rpb24gaGVyZS4gSG93IGlzIHRo
ZSBUTEIgZmx1c2ggaXMgZ29pbmcgCj4gdG8gdW5ibG9jayBhbnl0aGluZz8gVGhlIG1vcmUgeW91
IGFyZSBub3QgZml4aW5nIGFueSBlcnJvciBjb25kaXRpb24gCj4gaGVyZS4uLiBBbmQgdGhlIHBy
aW50ICJVbmhhbmRsZWQgZmF1bHQiIGp1c3QgYWZ0ZXJ3YXJkcyBjbGVhcmx5IGxlYWRzIAo+IHRv
IHRoaW5rIHRoYXQgdGhlcmUgYXJlIHZlcnkgbGl0dGxlIGNoYW5jZSB0aGUgZmF1bHQgaGFzIGJl
ZW4gcmVzb2x2ZWQuCgpOb3cgSSB1bmRlcnN0YW5kIHlvdXIgcG9pbnQuIFRoaXMgcmVhbGx5IG1h
a2VzIHNlbnNlLgoKCj4KPj4gSG93IGRvZXMgdGhlIFNNTVUgZHJpdmVyIGFjdCBpbiBzdWNoIHNp
dHVhdGlvbj8KPgo+IEkgaGF2ZSBDQ2VkIFJvYmluIHdobyBrbm93cyBiZXR0ZXIgdGhhbiBtZSB0
aGUgU01NVSBkcml2ZXIuIFRob3VnaCBpdCAKPiBpcyB0aGUgTGludXggb25lIGJ1dCBYZW4gaXMg
YmFzZWQgb24gaXQuCj4KPiBGcm9tIG15IHVuZGVyc3RhbmRpbmcsIGl0IGlzIGltcGxlbWVudGF0
aW9uIGRlZmluZWQgd2hldGhlciB0aGUgU01NVSAKPiBzdXBwb3J0cyBzdGFsbGluZyBhIHRyYW5z
YWN0aW9uIG9uIGZhdWx0LiBBRkFJQ1QsIHRoZSBjdXJyZW50IFhlbiAKPiBkcml2ZXIgd2lsbCBq
dXN0IHRlcm1pbmF0ZSB0aGUgdHJhbnNhY3Rpb24gYW5kIHRoZXJlZm9yZSB0aGUgY2xpZW50IAo+
IHRyYW5zYWN0aW9uIGJlaGF2ZSBhcyBSQVovV0kuCgpJIGdvdCBpdC4gU28sIHNvdW5kcyBsaWtl
IHRoZSBjbGllbnQgd29uJ3QgYmUgYWJsZSB0byBkbyBzb21ldGhpbmcgYmFkLCAKYW5kIHdlIHdv
bid0IHJlY2VpdmUgYW4gaW50ZXJydXB0IHN0b3JtIGhlcmUgaW4gWGVuLgoKCj4KPgo+Pgo+PiBR
dWl0ZSBjbGVhciwgaWYgd2UgZ2V0IGEgZmF1bHQsIHRoZW4gYWRkcmVzcyBpcyBub3QgbWFwcGVk
LiBJIHRoaW5rLCAKPj4gaXQgY2FuIGJlIGJvdGg6IGJ5IGlzc3Vpbmcgd3JvbmcgYWRkcmVzcyAo
YmFnZ3kgZHJpdmVyLCBtYWxpY2lvdXMgCj4+IGRyaXZlcikgb3IgYnkgcmFjZSAodW5saWtlbHkp
LiBJZiB0aGlzIGlzIHRoZSByZWFsIHJhY2UgKGRldmljZSBoaXRzIAo+PiBicmFrZS1iZWZvcmUt
bWFrZSwgZm9yIGV4YW1wbGUpLCB3ZSBjb3VsZCBnaXZlIGl0IGFub3RoZXIgYXR0ZW1wdCwgCj4+
IGZvciBleGFtcGxlLiBMb29rcyBsaWtlIHdlIG5lZWQgc29tZSBtZWNoYW5pc20gdG8gZGVwbG95
IGZhdWx0ZWQgCj4+IGFkZHJlc3MgdG8gUDJNIGNvZGUgKHdoaWNoIG1hbmFnZXMgcGFnZSB0YWJs
ZSkgdG8gYW5hbHl6ZT8gT3IgaXQgaXMgCj4+IG5vdCB3b3J0aCBkb2luZyB0aGF0Pwo+Cj4gWW91
IHNlZW0gdG8gc3BlYWsgYWJvdXQgYnJlYWstYmVmb3JlLW1ha2UgYXMgaXQgd2FzIGFuIGVycm9y
LiAKPiBCcmVhay1CZWZvcmUtTWFrZSBpcyBqdXN0IGEgc2VxdWVuY2UgdG8gcHJldmVudCB0aGUg
VExCIHdhbGtlciB0byAKPiBjYWNoZSBib3RoIG9sZCBhbmQgbmV3IG1hcHBpbmcgYXQgdGhlIHNh
bWUgdGltZS4gQXQgYSBnaXZlbiBwb2ludCB0aGUgCj4gSU9WQSB0cmFuc2xhdGlvbiBjYW4gb25s
eSBiZToKPiDCoMKgIDEpIFRoZSBvbGQgcGh5c2ljYWwgYWRkcmVzcwo+IMKgwqAgMikgTm8gYWRk
cmVzcyAtPiByZXN1bHQgdG8gYSBmYXVsdAo+IMKgwqAgMykgVGhlIG5ldyBwaHlzaWNhbCBhZGRy
ZXNzCj4KPiAxKSBhbmQgMykgc2hvdWxkIG5vdCByZXN1bHQgdG8gYSBmYXVsdC4gMikgd2lsbCBy
ZXN1bHQgdG8gYSBmYXVsdCBidXQgCj4gdGhlbiB0aGUgVExCIHNob3VsZCBub3QgY2FjaGUgaW52
YWxpZCBlbnRyeSwgcmlnaHQ/CgpyaWdodC4KCgo+Cj4gSW4gb3JkZXIgdG8gc2VlIDIpLCB3ZSBh
bHdheXMgZmx1c2ggdGhlIFRMQnMgYWZ0ZXIgcmVtb3ZpbmcgdGhlIG9sZCAKPiBwaHlzaWNhbCBh
ZGRyZXNzLgo+Cj4gVW5mb3J0dW5hdGVseSwgc29tZSBvZiB0aGUgSU9NTVVzIGFyZSBub3QgYWJs
ZSB0byByZXN0YXJ0IAo+IHRyYW5zYWN0aW9ucywgWGVuIGN1cnJlbnRseSBhdm9pZHMgdG8gZmx1
c2ggdGhlIFRMQnMgYWZ0ZXIgMikuIFNvIHlvdSAKPiBtYXkgYmUgYWJsZSB0byBzZWUgYm90aCBt
YXBwaW5nIGF0IHRoZSBzYW1lIHRpbWUuCj4KPiBMb29raW5nIGF0IHlvdXIgZHJpdmVyLCBJIGJl
bGlldmUgeW91IHdvdWxkIGhhdmUgdGhlIGZsYWcgSU1TVFIuTUhJVCAKPiAobXVsdGlwbGUgdGxi
IGhpdHMpIHNldCBiZWNhdXNlIHRoaXMgaXMgdGhlIGNvbmRpdGlvbiB3ZSBhcmUgdHJ5aW5nIHRv
IAo+IHByZXZlbnQgd2l0aCBicmVhay1iZWZvcmUtbWFrZS4gVGhlIGNvbW1lbnQgaW4gdGhlIGNv
ZGUgbGVhZHMgdG8gdGhpbmsgCj4gdGhpcyBpcyBhIGZhdWx0IGVycm9yLCBzbyBJIGFtIG5vdCBz
dXJlIHdoeSB5b3Ugd291bGQgcmVjb3ZlciBoZXJlLi4uCj4KPiBJZiB5b3VyIElPTU1VIGlzIGFi
bGUgdG8gc3RhbGwgdHJhbnNhY3Rpb24sIHRoZW4gaXQgd291bGQgYmUgYmVzdCBpZiAKPiB3ZSBw
cm9wZXJseSBoYW5kbGUgYnJlYWstYmVmb3JlLW1ha2Ugd2l0aCBpdC4KClRoYW5rIHlvdSBmb3Ig
dGhlIGRldGFpbGVkIGFuc3dlci4gSSB3b3VsZCBsaWtlIHRvIHNheSB0aGF0IEkgaGF2ZSBuZXZl
ciAKc2VlbiBNdWx0aXBsZSB0bGIgaGl0cyBlcnJvciByYWlzZWQgYnkgSVBNTVUgaW4gWGVuLgoK
Cj4KPiBPdmVyYWxsLCBpdCBmZWVscyB0byBtZSB0aGUgVExCIGZsdXNoIGlzIGhlcmUgZm9yIGEg
ZGlmZmVyZW50IHJlYXNvbi4KCgpJIHdpbGwgZHJvcCB0aGlzIFRMQiBmbHVzaCBmcm9tIGludGVy
cnVwdCBoYW5kbGVyIHVudGlsIGNsYXJpZmllZC4KCgotLSAKUmVnYXJkcywKCk9sZWtzYW5kciBU
eXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
