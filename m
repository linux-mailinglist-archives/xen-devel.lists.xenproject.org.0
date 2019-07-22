Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5736FC3C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 11:33:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpUeq-0007pb-2j; Mon, 22 Jul 2019 09:31:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZN+7=VT=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hpUep-0007pW-4t
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 09:30:59 +0000
X-Inumbo-ID: 68d89fa1-ac63-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 68d89fa1-ac63-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 09:30:58 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u10so26083852lfm.12
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2019 02:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Oz7voeBiFJuyxLGYbKMRgC+5FGxaaDJph+1rb3cEfj8=;
 b=E31D9AFItaZfcLuOpTZBG1X1AnBHw6H0J2qpvKJ13C1Kz1qS8CiSRbPmaBNmv4MWd0
 h0zRRiKzlHGbxvarH+YxRbv2NOjfyUNJvmr/T1ELv83rAAukdLzfgw4X5niZ8epTTtB9
 BVo7vtr7lqBRE3GrJOpkLXiEN6NBNl6ANDipTIlff3Z/CyIaSBZkPvPh6vJ0WPRnrgVl
 1ZXJfKo7iskhjiasGIcuZJodm0Gj38t73EiATP1e9uSwePq4sGW0CmJeaTjdU4oU+XSU
 MmbhQ4T5tKA3a6/FTzCbjVzFae54l6OOeneU2kcivAhXfC+QrnjrkNucYGeF4eTHrLVE
 FgUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Oz7voeBiFJuyxLGYbKMRgC+5FGxaaDJph+1rb3cEfj8=;
 b=dTnnzcQ/iZJwlRv138QYFE/ECQ7fTuq/XNq+pcndbQz7AeU8UoAiWZ0/fJcSrS4iLx
 RReFRIWnzETvvD4LoseohzblaO91hNt0y6n//Cp7sljtEZ46n7KqDiM/Y+ubYGrlhEBb
 yTqSW2ji0syPUNly7nBfLauXyRQP4AarmN1oHnFaKTNW9aG3YM5foSD2b7WpGdA7yY5p
 p4wig2dR1Y/QYAbCl9USUunUueqoRNi4SdYwo6HWKwB4UaopAafn+b2koGFIVJswkh29
 5oG1ZtCg0d6OCqJEz21Lltc/9Gk/uF56VqCQD265xZQ7qpPFSoFwsnTANhm1KkA0M7fn
 oZJw==
X-Gm-Message-State: APjAAAUWstAvn4efX593aUSop/5WzcJtPXGz3XZK1wQNDCRTdnpY0x7i
 ruo9HYKBYGSZppuxpGQigvo=
X-Google-Smtp-Source: APXvYqzt5hIzC2j5UNbZ0kvmyvrKzwQI+GZvKN00HCxfObwMS9VIDkUSz3x6J2luGzC4tUfP87XdKw==
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr28716589lfg.152.1563787856695; 
 Mon, 22 Jul 2019 02:30:56 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 j7sm8265019lji.27.2019.07.22.02.30.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jul 2019 02:30:55 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <1563469897-2773-1-git-send-email-andrii.anisov@gmail.com>
 <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <261e0c5e-a886-f389-3c37-413613c9bf4f@gmail.com>
Date: Mon, 22 Jul 2019 12:30:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2d71f4c0-023f-7a09-731e-e84e21378e26@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] vunmap: let vunmap align virtual address by
 itself
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS4wNy4xOSAxMjozNywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gT24gMTguMDcuMjAxOSAx
OToxMSwgQW5kcmlpIEFuaXNvdiB3cm90ZToKPj4gTGV0IHZ1bm1hcCBhbGlnbiBwYXNzZWQgdmly
dHVhbCBhZGRyZXNzIGJ5IFBBR0VfU0laRS4KPiAKPiBEZXNwaXRlIHNlZWluZyBBbmRyZXcncyBS
LWIgeW91J3ZlIGFscmVhZHkgZ290IEknZCBsaWtlIHRvIHBvaW50IG91dAo+IHRoYXQgdGhpcyBp
bmNyZWFzZXMgdGhlIHJpc2sgb2Ygc29tZSBjb2RlIHBhc3NpbmcgdGhlIHdyb25nIHBvaW50ZXIK
PiBpbnRvIGhlcmUuIHssdW59bWFwX2RvbWFpbl9wYWdlKCkgYWN0IG9uIHNpbmdsZSBwYWdlcyBv
bmx5LCBzbyB0aGVyZSdzCj4gbm8gYW1iaWd1aXR5LiBXaGVuIHRhbGtpbmcgYWJvdXQgbXVsdGkt
cGFnZSByZWdpb25zIHRob3VnaCwgbm90IHVuZG9pbmcKPiBhcml0aG1ldGljIHByZXZpb3VzbHkg
ZG9uZSBtYXkgbWVhbiBhY3R1YWxseSBwb2ludGluZyBhdCBvdGhlciB0aGFuIHRoZQo+IGZpcnN0
IHBhZ2Ugb2YgdGhlIG1hcHBpbmcuCgpXZWxsLCB3aGF0IHdlIGFyZSBtb3ZpbmcgaW50byB2dW5t
YXAoKSwgaXMgYSBwYWdlIGFsaWdubWVudCBvbmx5LiBJdCBjYW4ndCBzYXZlIHVzIGZyb20gdGhl
IHdyb25nIHBvaW50ZXIsIGV2ZW4gaWYgaXQgaXMgZG9uZSBvdXRzaWRlIHRoZSB2dW5tYXAoKS4K
Cj4+IFdpdGggdGhlIG1haW4gY2hhbmdlLCBhbHNvOgo+PiAgICAtIHN0cmlwIGFsbCBleGlzdGlu
ZyB2dW5tYXAoKSBjYWxscyBmcm9tIHByaW9yIG1hc2tpbmcKPiAKPiBfSWZfIHdlIGFyZSB0byBn
byB0aGlzIHJvdXRlLCB0aGVuIHVubWFwX2RvbWFpbl9wYWdlX2dsb2JhbCgpCj4gY2FsbGVycyBz
aG91bGQgYWxzbyBiZSBhZGp1c3RlZC4gVGhlcmUsIGFzIGZvciB1bm1hcF9kb21haW5fcGFnZSgp
LAo+IEkgYWdyZWUgaXQgd291bGQgbWFrZSBzZW5zZSB0byBiZSBtb3JlIHRvbGVyYW50LgoKSSd2
ZSBmb3VuZCB0d28gcGFnZSBhbGlnbm1lbnRzIHByaW9yIHRvIGB1bm1hcF9kb21haW5fcGFnZV9n
bG9iYWwoKWAgY2FsbC4gU2hvdWxkIEkgd2lwZSB0aGVtIGluIHRoaXMgcGF0Y2gsIG9yIGluIHNl
cGFyYXRlPwoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
