Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE9523CF0
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2019 18:13:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hSksI-00024l-3c; Mon, 20 May 2019 16:10:54 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ag2u=TU=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hSksG-00024g-UA
 for xen-devel@lists.xenproject.org; Mon, 20 May 2019 16:10:52 +0000
X-Inumbo-ID: d5f35c18-7b19-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id d5f35c18-7b19-11e9-8980-bc764e045a96;
 Mon, 20 May 2019 16:10:51 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a10so13037173ljf.6
 for <xen-devel@lists.xenproject.org>; Mon, 20 May 2019 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=r0nl4eanT86ZxLBzSaWal4etk6BqRuZmHt2wCZAbWlk=;
 b=daL0GTuUDv2Znr7mdbioco0PXl4a+SlNjOVhhW8kFAIP8Tc554V4K287Bawy+TQP8M
 Hzk4xhvqQoDD2oxI93sqpW2P1o8pGfaxL9Qc1Wh2k6ubR9FzkYAgrUB5zShULStO0y8e
 B2AWzRTCuTNpJ7VwDgSZ09m4sFuuiT/vkc2oY/MwECFUClONvm17Kx7XOmme0HtsYnZ7
 oCXAju/+zdpz5YNHv1Zn2titTGkP/yajVOxg7T7VgObCxvNvLpQvFnvJAoZdNBH7NdWU
 XzP/hUBPK3sY0F1jCfGrkR10+jUTPYzssi3DasXREpDh2rUChl3XLL0AeU6D9ngQHQtZ
 xvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=r0nl4eanT86ZxLBzSaWal4etk6BqRuZmHt2wCZAbWlk=;
 b=i378gtUxm3qH7ALOF+s0zjTHczdqY7iWpxj6b8WCq2hJ4RtNhRMQEPcDJtwcbm8FN2
 a0iPuwgpdPSihNZzF639KrgFnvKd2Dm4QhpopVzaxGdJWG43/mtyqPvunnZCqg5uZG8W
 23mqQihUhlL1PflpdvYGtvMI6OXvzfVdb9Os9H9Uq4L1Hlw+2B5X+O8hfXAINr8SkhF7
 MJ/Lzg1EjeREFQvobojEp3Jzo8HUWWddG907kwrRUMLXZX7fFq9Zuxt5otK4st//yyES
 5ByOAbg5Hdlf3XsRIFXKRG+E171JeTt2BVCVLNKthwoea0+HAB+TwDllOej8WKDoRMlh
 erpw==
X-Gm-Message-State: APjAAAWjeyKJM4HlrNp47HbMe+Ds1jK5dF5cZu3ouO9NkLU8L/3nDkWw
 +k73VOgUA2xKSnU9oFhLRM0=
X-Google-Smtp-Source: APXvYqwH0OLTCm1UHlNvoM8Sfq6YIIdzbILp6xWR0kR4dZkHvA8LFmIVAmbKPM/ij5apJktSfR21rQ==
X-Received: by 2002:a2e:3806:: with SMTP id f6mr2777321lja.33.1558368649924;
 Mon, 20 May 2019 09:10:49 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id i14sm592414ljj.57.2019.05.20.09.10.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 09:10:49 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1556806436-26283-1-git-send-email-olekstysh@gmail.com>
 <1556806436-26283-3-git-send-email-olekstysh@gmail.com>
 <fbff2663-666b-143d-548b-d47007cccbe2@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <03801f3e-4f0e-eb72-8ea4-c4860939ff6c@gmail.com>
Date: Mon, 20 May 2019 19:10:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fbff2663-666b-143d-548b-d47007cccbe2@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [RFC PATCH 2/2] xen/device-tree: Add ability to
 handle nodes with interrupts-extended prop
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
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 sstabellini@kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ck9uIDIwLjA1LjE5IDE1OjI1LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGksCgpIaSwgSnVsaWVu
LgoKCj4KPiBPbiAwMi8wNS8yMDE5IDE1OjEzLCBPbGVrc2FuZHIgVHlzaGNoZW5rbyB3cm90ZToK
Pj4gRnJvbTogT2xla3NhbmRyIFR5c2hjaGVua28gPG9sZWtzYW5kcl90eXNoY2hlbmtvQGVwYW0u
Y29tPgo+Pgo+PiBYZW4gZXhwZWN0cyB0byBzZWUgImludGVycnVwdHMiIHByb3BlcnR5IHdoZW4g
cGFyc2luZyBob3N0Cj4+IGRldmljZS10cmVlLiBCdXQsIHRoZXJlIGFyZSBjYXNlcyB3aGVuIHNv
bWUgZGV2aWNlIG5vZGVzIGNvbnRhaW4KPj4gImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3BlcnR5
IGluc3RlYWQuCj4+Cj4+IFRoZSBnb29kIGV4YW1wbGUgaGVyZSBpcyBhcmNoIHRpbWVyIG5vZGUg
Zm9yIFItQ2FyIEdlbjMvR2VuMiBmYW1pbHksCj4+IHdoaWNoIGlzIG1hbmRhdG9yeSBkZXZpY2Ug
Zm9yIFhlbiB1c2FnZSBvbiBBUk0uIEFuZCB3aXRob3V0IGFiaWxpdHkKPj4gdG8gaGFuZGxlIHN1
Y2ggbm9kZXMsIFhlbiBmYWlscyB0byBvcGVyYXRlOgo+Cj4gUGVyIHRoZSBiaW5kaW5nIGRvY3Vt
ZW50YXRpb24gWzFdLCB0aGUgaW50ZXJydXB0cy1leHRlbmQgcHJvcGVydHkgCj4gc2hvdWxkIG9u
bHkgYmUgdXNlZCB3aGVuIGEgZGV2aWNlIGhhcyBtdWx0aXBsZSBpbnRlcnJ1cHQgcGFyZW50cy4g
VGhpcyAKPiBpcyBub3QgdGhlIGNhc2Ugb2YgdGhlIGFyY2ggdGltZXIsIHNvIHdoeSBpcyBpdCB1
c2VkIHRoZXJlPwo+IERvbid0IGdldCBtZSB3cm9uZywgSSBhbSBmaW5lIHdpdGggdGhlIGlkZWEg
b2YgYWRkaW5nIAo+ICJpbnRlcnJ1cHRzLWV4dGVuZCIuIEhvd2V2ZXIsIHRoZSBjb21taXQgbWVz
c2FnZSBzaG91bGQgZ2l2ZSBzb21lIAo+IGdyb3VuZCB3aHkgYSBuZXcgcHJvcGVydHkgaGFzIGJl
ZW4gaW50cm9kdWNlZC91c2VkIG92ZXIgdGhlIGN1cnJlbnQgb25lLgoKSGF2ZSBqdXN0IGdyZXBw
ZWQsIGxvb2tzIGxpa2UsIFItQ2FyIEdlbjIvR2VuMyBkdHNpIGZpbGVzIGFyZSBub3QgdGhlIApv
bmx5IHNpbmdsZSB1c2VycyBvZiAiaW50ZXJydXB0cy1leHRlbmRlZCIgcHJvcGVydHkgZm9yIGEg
ZGV2aWNlIHdpdGggYSAKc2luZ2xlIGludGVycnVwdCBwYXJlbnQuLi4KClVuZm9ydHVuYXRlbHks
IEkgZG9uJ3Qga25vdyB0aGUgcmVhbCByZWFzb24sIGNhbiBndWVzcyBvbmx5IHRoYXQgZm9yIGEg
CmRldmljZSAod2l0aCBhIHNpbmdsZSBpbnRlcnJ1cHQgcGFyZW50KSBvdXRzaWRlICIvc29jIiBj
b250YWluZXIgdGhlIAp1c2FnZSBvZiBzaW5nbGUgImludGVycnVwdHMtZXh0ZW5kZWQiIHByb3Bl
cnR5IGlzIG1vcmUgc2ltcGxlci9jbGVhbmVyIAp0aGFuIHVzYWdlIG9mIHBhaXJzICgiaW50ZXJy
dXB0LXBhcmVudCIgKyAiaW50ZXJydXB0cyIpLsKgIExvb2tzIGxpa2UsIAp0aGUgcGF0Y2ggIkFS
TTogZHRzOiByOGE3NzkwOiBhZGQgc29jIG5vZGUiIGZyb20gdGhpcyBzZXJpZXMgWzFdIHN0YXJ0
ZWQgCnVzaW5nICJpbnRlcnJ1cHRzLWV4dGVuZGVkIiBwcm9wZXJ0eSBmb3IgQVJDSCB0aW1lciBu
b2RlLiBJIHdpbGwgbWVudGlvbiAKdGhhdCBpbiBwYXRjaCBkZXNjcmlwdGlvbi4KCgo+PiArwqDC
oMKgIC8qIFRyeSB0aGUgbmV3LXN0eWxlIGludGVycnVwdHMtZXh0ZW5kZWQgZmlyc3QgKi8KPj4g
K8KgwqDCoCBpbnRudW0gPSBkdF9jb3VudF9waGFuZGxlX3dpdGhfYXJncyhkZXZpY2UsICJpbnRl
cnJ1cHRzLWV4dGVuZGVkIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiI2ludGVycnVwdC1j
ZWxscyIpOwo+PiArwqDCoMKgIGlmICggaW50bnVtID4gMCApCj4KPiBJSVVDIGR0X2NvdW50X3Bo
YW5kbGVfd2l0aF9hcmdzLCAwIHdvdWxkIG1lYW5zIHRoZSBwcm9wZXJ0eSBpcyBwcmVzZW50IAo+
IGJ1dCBkb2Vzbid0IGNvbnRhaW4gYW55IGludGVycnVwdHMuIEkgZG8gYWdyZWUgdGhpcyBpcyBh
IHByb2JhYmx5IGEgCj4gd3JvbmcgZGV2aWNlLXRyZWUsIGJ1dCB0ZWNobmljYWxseSBJIGFtIG5v
dCBzdXJlIHdlIHNob3VsZCB0cnkgdG8gbG9vayAKPiBmb3IgIiNpbnRlcnJ1cHRzIiBpZiBpbnRu
dW0gPSAwLgoKYWdyZWUsIHdpbGwgcmV0dXJuIDAgaWYgaW50bnVtID09IDAKCgo+Cj4+ICvCoMKg
wqAgewo+PiArwqDCoMKgwqDCoMKgwqAgZHRfZHByaW50aygiIGludG51bT0lZFxuIiwgaW50bnVt
KTsKPgo+IFlvdSBhcmUgcmUtdXNpbmcgdGhlIGV4YWN0IHNhbWUgZGVidWcgbWVzc2FnZSBhcyBm
b3IgImludGVycnVwdHMiLiBTbyAKPiBpdCB3b3VsZCBiZSBkaWZmaWN1bHQgZm9yIGEgZGV2ZWxv
cGVyIHRvIGtub3cgZXhhY3RseSB3aGljaCBwYXRoIGlzIAo+IHVzZWQuIENvdWxkIHdlIHByaW50
IG1lc3NhZ2UgcmVnYXJkaW5nIHdoZXRoZXIgImludGVycnVwdHMtZXh0ZW5kZWQiIAo+IG9yICJp
bnRlcnJ1cHRzIiBpcyB1c2VkPwoKSSBjb3VsZG4ndCBmaW5kIHdoZXJlIGVsc2UgdGhlIHNhbWUg
ZGVidWcgbWVzc2FnZSB3YXMgdXNlZCwgY291bGQgeW91LCAKcGxlYXNlLCBwb2ludCBtZT8gQnV0
LCBJIGRvbid0IG1pbmQgdG8gYWRkIHNvbWUgaW5kaWNhdG9yLiBGb3IgCiJpbnRlcnJ1cHRzLWV4
dGVuZGVkIiBwYXRoIChuZXdseSBhZGRlZCBwcmludHMpIEkgY2FuIGFkZCB0aGUgCmNvcnJlc3Bv
bmRpbmcgcHJlZml4Li4uCgoKPgo+Cj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gaW50bnVtOwo+
PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIC8qIEdldCB0aGUgaW50ZXJydXB0cyBwcm9w
ZXJ0eSAqLwo+PiDCoMKgwqDCoMKgIGludHNwZWMgPSBkdF9nZXRfcHJvcGVydHkoZGV2aWNlLCAi
aW50ZXJydXB0cyIsICZpbnRsZW4pOwo+PiDCoMKgwqDCoMKgIGlmICggaW50c3BlYyA9PSBOVUxM
ICkKPj4gQEAgLTE0MjAsMTAgKzE0MzAsMjkgQEAgaW50IGR0X2RldmljZV9nZXRfcmF3X2lycShj
b25zdCBzdHJ1Y3QgCj4+IGR0X2RldmljZV9ub2RlICpkZXZpY2UsCj4+IMKgwqDCoMKgwqAgY29u
c3QgX19iZTMyICppbnRzcGVjLCAqdG1wLCAqYWRkcjsKPj4gwqDCoMKgwqDCoCB1MzIgaW50c2l6
ZSwgaW50bGVuOwo+PiDCoMKgwqDCoMKgIGludCByZXMgPSAtRUlOVkFMOwo+PiArwqDCoMKgIHN0
cnVjdCBkdF9waGFuZGxlX2FyZ3MgYXJnczsKPj4gK8KgwqDCoCBpbnQgaTsKPj4gwqAgwqDCoMKg
wqDCoCBkdF9kcHJpbnRrKCJkdF9kZXZpY2VfZ2V0X3Jhd19pcnE6IGRldj0lcywgaW5kZXg9JXVc
biIsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldmljZS0+ZnVsbF9uYW1l
LCBpbmRleCk7Cj4+IMKgICvCoMKgwqAgLyogR2V0IHRoZSByZWcgcHJvcGVydHkgKGlmIGFueSkg
Ki8KPj4gK8KgwqDCoCBhZGRyID0gZHRfZ2V0X3Byb3BlcnR5KGRldmljZSwgInJlZyIsIE5VTEwp
Owo+PiArCj4+ICvCoMKgwqAgLyogVHJ5IHRoZSBuZXctc3R5bGUgaW50ZXJydXB0cy1leHRlbmRl
ZCBmaXJzdCAqLwo+PiArwqDCoMKgIHJlcyA9IGR0X3BhcnNlX3BoYW5kbGVfd2l0aF9hcmdzKGRl
dmljZSwgImludGVycnVwdHMtZXh0ZW5kZWQiLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIjaW50ZXJy
dXB0LWNlbGxzIiwgaW5kZXgsICZhcmdzKTsKPj4gK8KgwqDCoCBpZiAoICFyZXMgKQo+Cj4gSSBk
b24ndCB0aGluayB0aGUgY2hlY2sgaXMgY29ycmVjdC4gZHRfcGFyc2VfcGhhbmRsZV93aXRoX2Fy
Z3MgbWF5IAo+IHJldHVybiBhIG5lZ2F0aXZlIHZhbHVlIGluIGNhc2Ugb2YgYW4gZXJyb3IuIFNv
IHdlIGxpa2VseSB3YW50ICJyZXMgPj0gCj4gMCIgaGVyZS4KCkkgYW0gbm90IHN1cmUgSSB1bmRl
cnN0YW5kIHlvdXIgcG9pbnQgY29ycmVjdGx5LiBXaHkgZG8gd2UgbmVlZCB0byBjaGVjayAKZm9y
IHJlcyA+IDAgYXMgd2VsbD8KCklmIGluZGV4IGlzIG5vdCAtMSwgdGhlbiBmdW5jdGlvbiB3aWxs
IHJldHVybiBlaXRoZXIgMCAob24gc3VjY2Vzcykgb3IgCi1FUlJfWFhYLgoKCj4KPgo+PiArwqDC
oMKgIHsKPj4gK8KgwqDCoMKgwqDCoMKgIGR0X2RwcmludGsoIiBpbnRzcGVjPSVkIGludHNpemU9
JWRcbiIsIGFyZ3MuYXJnc1swXSwgCj4+IGFyZ3MuYXJnc19jb3VudCk7Cj4KPiBTYW1lIHJlbWFy
ayBmb3IgdGhlIG1lc3NhZ2UgaGVyZS4KCmFncmVlLgoKClsxXSBodHRwczovL3d3dy5zcGluaWNz
Lm5ldC9saXN0cy9saW51eC1yZW5lc2FzLXNvYy9tc2cyMjUzOS5odG1sCgotLSAKUmVnYXJkcywK
Ck9sZWtzYW5kciBUeXNoY2hlbmtvCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3hlbi1kZXZlbA==
