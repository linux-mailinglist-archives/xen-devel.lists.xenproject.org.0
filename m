Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9978F46401
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 18:26:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbozc-0003Gw-7U; Fri, 14 Jun 2019 16:23:56 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ztYt=UN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbozb-0003Gq-9O
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 16:23:55 +0000
X-Inumbo-ID: cc8f894d-8ec0-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cc8f894d-8ec0-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 16:23:53 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id s21so2986955lji.8
 for <xen-devel@lists.xenproject.org>; Fri, 14 Jun 2019 09:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eAzbUrO4J0zH2bzItj/p5OXrsnTXoizPPszCbEGy1vI=;
 b=VYvF1tCEObwOqK3QUKyLipeAes7kqe/GKDYctKJPXseJ8CKOrgJwNycBrwLfclPKM1
 FJU4F1fb+dVHhGC0oKYMcIHJcSM/SKXFs8dyhW4GrujcQSyDejuceP7cjBpyQ8er2+Qh
 hYU1hb5IrTPcGPTlb1jLeTvy3GJKEDxfAYYdHVfCfZVr+nniglk12QaYjVBgy0EYBLk1
 +AWpMm4UsuWpLuO0NCU4Mie79QEwj+a+PsaCCty/aYaHWmhYB+GXKg1w+PZso21br+pX
 Yih0/LmAuvPvSz6P3HB2HFrurrMMne6lEvlSPbuO2VPZ+EmD1l4uS8yebArL5nyUCIcS
 XEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eAzbUrO4J0zH2bzItj/p5OXrsnTXoizPPszCbEGy1vI=;
 b=euFrQ7BEOdjYT1yqm1ccvmpf5UL3A2eQTvZ0wJt59viyJEdc0ryosd08t2zGwkQ5VA
 TZyq3jhnBOamQSm3Qj/HPwwpGWR1jDgw78RRMk4xpWzFnFoMD6xI/Hkbr+iw6M75QKil
 0jMyzcG94KaM7BrXjFQQWmV9OWmfu8oaXI4iKrXtZ0fjG0+/KcDxExWPJ8+exKg2MGQg
 GO0yhB3UQF/B3z8UJwlcH8Fc8ttuXG1rmsMMWh4ecF5VMh7YmAeGaiKqkp7yuhUFP4rp
 c4/6muw6ILHjciEJc/YsRY33fvhCY7Cujpp+RMdbh19csSkzLwBsIxqvzuHZoiGTOqVE
 Gmrg==
X-Gm-Message-State: APjAAAUo55Z6k7lO8cFwlAZqqaWzuHETMbvLnaU0V6lBDATSF/sDOf/u
 xlPHq/sKylowigZitw9ZClo=
X-Google-Smtp-Source: APXvYqyAALYx/3sFDCG0OWGTJm/AAZxnjblxmoKJl/QKVB2erzkQ6AbA7ZMo/d8HI1hwjZn1cybUmA==
X-Received: by 2002:a2e:824c:: with SMTP id j12mr43690307ljh.53.1560529432301; 
 Fri, 14 Jun 2019 09:23:52 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 q13sm543307lfk.65.2019.06.14.09.23.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 09:23:51 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
 <7a225ac4-f1e0-7cf8-b697-ea1f985f2dc8@arm.com>
 <5CFF6FEE0200007800236E11@prv1-mh.provo.novell.com>
 <7de133a9-6aa7-1523-3f8f-b5506efef032@gmail.com>
 <5D02448E0200007800237D77@prv1-mh.provo.novell.com>
 <9390f580-d99b-0163-48c2-7c1bd2d0133d@arm.com>
 <5D0248770200007800237DAF@prv1-mh.provo.novell.com>
 <f5b28793-5cc4-0f83-d571-af87d75e38c0@arm.com>
 <5D0252300200007800237E93@prv1-mh.provo.novell.com>
 <f90caffd-32c1-54a4-a28a-8d5f3976f8f8@arm.com>
 <90a3c768-5274-dbb8-8eb2-2eda902c3e5b@gmail.com>
 <a439c5ec-cec5-51be-bf76-eebdf50cf1bb@arm.com>
 <5e13f916-4ea7-05a6-3156-df6dc8bbd1d8@gmail.com>
 <5D03C06F020000780023864D@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <46e206de-dd8e-6931-bda6-32af5c7ba964@gmail.com>
Date: Fri, 14 Jun 2019 19:23:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5D03C06F020000780023864D@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSmFuLAoKT24gMTQuMDYuMTkgMTg6NDIsIEphbiBCZXVsaWNoIHdyb3RlOgo+Pj4+IE9u
IDE0LjA2LjE5IGF0IDE3OjExLCA8YW5kcmlpLmFuaXNvdkBnbWFpbC5jb20+IHdyb3RlOgo+PiBP
biAxNC4wNi4xOSAxNzozOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gQWZ0ZXIgYWxsIHRoZXkg
aGF2ZSBleGFjdGx5IHRoZSBzYW1lIGRhdGEuLi4KPj4KPj4gWWVzLCBidXQgbm9ybWFsIGd1ZXN0
cyBzaG91bGQgdXNlIG9ubHkgb25lIGludGVyZmFjZS4KPiAKPiBJIHRob3VnaHQgaXQgaGFkIGJl
ZW4gY2xhcmlmaWVkIGFscmVhZHkgdGhhdCBub3JtYWwgZ3Vlc3RzIGNhbiB2ZXJ5Cj4gd2VsbCB1
c2UgYm90aCBpbnRlcmZhY2VzLCBqdXN0IG5vdCBib3RoIGF0IHRoZSBzYW1lIHRpbWU6IEJvb3Qg
bG9hZGVyCj4gYW5kIE9TIGNvdWxkIGRpc2FncmVlIGluIHRoaXMgcmVnYXJkLCBhcyB0aGUgcHJp
bWUgZXhhbXBsZS4KCkkgbWlzc2VkICJhdCB0aGUgc2FtZSB0aW1lIi4KCldlIG1heSByZXF1aXJl
IGV4aXN0aW5nIHJ1bnN0YXRlIGFyZWEgdW5yZWdpc3RlcmluZyBpZiB0aGUgc3lzdGVtIGlzIGF3
YXJlIG9mIGl0LiBCdXQgaXQgaXMgZm9yIHRoZSBuZXcgaW50ZXJmYWNlLgpUaGUgb2xkIG9uZSBo
YXMgbm8gZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgdW5yZWdpc3RlcmluZy4gVGhlIGltcGxpY2l0
IHdheSBpcyBrbm93biB0byB1cywgYnV0IG5vdCBrbm93biB0byB1c2Vycy4KSG93IHRvIHNvbHZl
IHRoZSBjbGFzaD8KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
