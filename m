Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FB61EAA5
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 11:06:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQpph-0006fe-2v; Wed, 15 May 2019 09:04:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=HoWo=TP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQppe-0006fZ-Sm
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:04:14 +0000
X-Inumbo-ID: 684d0ee6-76f0-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 684d0ee6-76f0-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 09:04:13 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so1821305ljw.0
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2019 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CzmSYa5I5dz0Es0o5Z4ACeHj31/FGfrsylph0dw8X9A=;
 b=kmS6DI9nymy5JlVmVVDUKqHd0Aa8s048Yr1Pi/MdhWCsKqW3KFrh+jBu5BW7m7Chlc
 EnXSduHyrWAo/shg4E+qpicOZ8al0ruQHtM3I934AKZjBQp0ks929bm/PEHIes9yN542
 4XNwaIBVFGKta4KaPJrvum4wXweFX1Azpm7qvf+C75OJYkQ0+t/dpprtJK6KHmdZOz/Q
 AhVnlIex8RsCtNSR/SgDWJjSA2YBNSvdtXBGRlLOw1cZBZpc/co2LuF+430aZx33Rw9l
 4IRdf6nuJr4ahc/vC9/ozJmwDJTeUWIBz7EheKXYrczy7jmDr9n8CTW4RI6jO368AvZW
 sDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CzmSYa5I5dz0Es0o5Z4ACeHj31/FGfrsylph0dw8X9A=;
 b=f7xmete7yXijUbPA+2VUH5Qk0fF9hjtIvBtvUFrzGAG5nHV2IaTysFPzGAmfYfURi5
 W3Xx3EQS4xdtWVDU+LEW51ITV+aVuqfXQeOICbZ4qrwEJSVmAseiRLdC+EO2Y9evCUVe
 IZvnis06Bh9DpfqIs3hS43j9skgkihyM7nS5Haow3881ACsJMd89flvs3XE8NjdVq1/m
 bAoeW+NiLfymZhYJTqdzFXs0/yJV8LuOSUgHlrqVzaKLEZDMvpojyqjaHRF6hmgDjOF7
 SyiqBeIoUmd7aVVlHz12JTNUHMsU59vKGmNu8YMcnbko9iyEAvrBUtVp3gthJMVIcfyh
 MpLg==
X-Gm-Message-State: APjAAAX3lAcareE3QLyyHzhIpkOQdH7YfGwSL0CJ5I5ifQ4U0nt26sjh
 NySqp7j+BhiJ1BYNiJZg5Po=
X-Google-Smtp-Source: APXvYqxPGjPoRaogwhkXpb/FzmLq6CZM1qo2BAiyo11bgLYF86Q6IYQSFq6Zb1BkvsFoH1J/HgDMKA==
X-Received: by 2002:a2e:4c7:: with SMTP id a68mr2323612ljf.165.1557911051990; 
 Wed, 15 May 2019 02:04:11 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 l76sm273054lfe.77.2019.05.15.02.04.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 02:04:11 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
 <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
 <8f1d8d76-b2a6-7443-a38b-201058b6e84d@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <c58b5000-623d-766e-eba8-a4df1fbe1a44@gmail.com>
Date: Wed, 15 May 2019 12:04:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <8f1d8d76-b2a6-7443-a38b-201058b6e84d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxNC4wNS4xOSAxNjo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFlvdSBoYXZlIHRvIGtl
ZXAgaW4gbWluZCB0aGF0IGV4aXN0aW5nIE9TIGhhdmUgdG8gcnVuIG9uIG5ld2VyIFhlbiB3aXRo
b3V0IGFueSBtb2RpZmljYXRpb24uCgpBcyBJIGp1c3Qgd3JpdHRlbiB0byBKYW4sIGl0IGlzIG9u
ZSBtb3JlIHJlYXNvbiB0byBrZWVwIHRob3NlIGludGVyZmFjZXMgbGl2aW5nIGluIHBhcmFsbGVs
IGFuZCBkbyBub3QgbWl4IHRoZWlyIGltcGxlbWVudGF0aW9uLgoKPiBUaGUgZXhpc3RpbmcgaHlw
ZXJjYWxsIGFsbG93cyB5b3UgdG86Cj4gIMKgwqAgMSkgRGUtcmVnaXN0ZXIgYW4gaW50ZXJmYWNl
IHVzaW5nIHRoZSB2YWx1ZSAwLgoKTXkgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBjYW4gZWFzaWx5
IGJlIHVwZGF0ZWQgd2l0aCB0aGUgc2FtZSBiZWhhdmlvci4KCj4gIMKgwqAgMikgUmVwbGFjaW5n
IGEgY3VycmVudCBleGlzdGluZyBpbnRlcmZhY2UKCj4gWW91IHByb2JhYmx5IGNhbid0IHVzZSAy
KSBmb3IgYSBib290bG9hZGVyIC0+IGtlcm5lbCBoYW5kb3ZlciBiZWNhdXNlIHdlIGFyZSBkZWFs
aW5nIHdpdGggZ3Vlc3QgdmlydHVhbCBhZGRyZXNzLiBUaGVyZSBpcyBhbiBoaWdoIGNoYW5jZSB0
aGUgdmlydHVhbCBhZGRyZXNzIHNwYWNlIGxheW91dCBpcyBnb2luZyB0byBiZSBkaWZmZXJlbnQg
b3IgZXZlbiB0dXJuaW5nIG9mZiBNTVUgZm9yIGEgYml0IChkb25lIG9uIEFybSkuIFNvIHlvdSBo
YXZlIHRvIHVzZSAxKSBvdGhlcndpc2UgeW91IG1pZ2h0IHdyaXRlIGluIGEgcmFuZG9tIHBsYWNl
IGluIG1lbW9yeS4KClRoaXMgZGVmaW5pdGVseSBub3QgdGhlIHdheSB0byBoYW5kbGUgdHJhbnNp
dGlvbnMgYmV0d2VlbiBzeXN0ZW1zIGluIGEgZ3Vlc3QgZG9tYWluLgoKPiBJIGFtIG5vdCBlbnRp
cmVseSBzdXJlIHdoZXRoZXIgdGhlcmUgYXJlIGFjdHVhbCB2YWx1ZSBmb3IgMikuIFRoZSBvbmx5
IHJlYXNvbiBJIGNhbiB0aGluayBvZiBpcyBpZiB5b3Ugd2FudCB0byBtb3ZlIGFyb3VuZCB0aGUg
cnVuc3RhdGUgaW4geW91ciB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UuIEJ1dCB0aGF0J3Mgc291bmRz
IGEgYml0IHdlaXJkIGF0IGxlYXN0IG9uIEFybS4KPiBGb3IgdGhlIG5ldyBoeXBlcmNhbGwsIEkg
dGhpbmsgd2UgYXQgbGVhc3Qgd2FudCAxKSAod2l0aCBhIG1hZ2ljIHZhbHVlIFRCRCkuIAoKVGhl
IG1hZ2ljIHZhbHVlIDB4MCBjYW4gZWFzaWx5IGJlIGludHJvZHVjZWQuCgo+ICAyKSBtaWdodCBi
ZSBoZWxwZnVsIGluIHRoZSBjYXNlIHRoZSBib290bG9hZGVyIGRpZG4ndCBkbyB0aGUgcmlnaHQg
dGhpbmcgb3Igd2UgYXJlIHVzaW5nIEtleGVjIHRvIGJvb3QgYSBuZXcga2VybmVsLiBUaGlzIHdv
dWxkIGFsc28gYmUgc2FmZXIgYXMgcGh5c2ljYWwgYWRkcmVzcyBjb3VsZCBiZSBleGNsdWRlZCBt
b3JlIGVhc2lseS4KCkJ1dCB0aGUgbmV3IHN5c3RlbSBoYXZlIHRvIGdldCBzb21lIGtub3dsZWRn
ZSBhYm91dCB0aGUgcHJldmlvdXMgcGh5cyBhZGRyIGlzIHJlc2VydmVkICh1c2VkIGJ5IGh5cGVy
dmlzb3IpLCBhbmQgZG8gbm90IHVzZSBpdCBwcmlvciB0byByZWdpc3RlcmluZyBuZXcgcnVuc3Rh
dGUgYXJlYS4KUHJvdmlkaW5nIHN1Y2ggYSBrbm93bGVkZ2UgaXMgc29tZXRoaW5nIChlLmcuKSB0
aGUgYm9vdGxvYWRlciBzaG91bGQgdGFrZSBjYXJlIG9mLiBCdXQsIElNTywgaXQgaXMgYmV0dGVy
IHRvIHJlcXVpcmUgZnJvbSAoZS5nLikgdGhlIGJvb3Rsb2FkZXIgdG8gdW5yZWdpc3RlciBpdHMg
cnVuc3RhdGUgYXJlYSBwcmlvciB0byBzd2l0Y2hpbmcgdG8gdGhlIG5ldyBzeXN0ZW0uCgotLSAK
U2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
