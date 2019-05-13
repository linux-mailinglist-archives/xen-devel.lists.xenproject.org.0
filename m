Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C671B7F3
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:18:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQBjF-00085w-6A; Mon, 13 May 2019 14:14:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=GA65=TN=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQBjE-00085l-HI
 for xen-devel@lists.xen.org; Mon, 13 May 2019 14:14:56 +0000
X-Inumbo-ID: 7a66520a-7589-11e9-8980-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 7a66520a-7589-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:14:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id v18so9214385lfi.1
 for <xen-devel@lists.xen.org>; Mon, 13 May 2019 07:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=q3+p+zDAu+o/M00WI4MkYwdZ/997lm9TdjRw7By/4Vw=;
 b=b5XAuWwksFvGn5ePgAnkoHaFwClvLLMQphlcgvYep7L6VQn5tm4hFA/VFYry90vpTS
 BhuHhuyoyhG3nl15e4XKbrSyq2KwxPJ0uVvZ9jNcc5vC8TYtDTVl61Gcd0B1qALxTlwf
 NABPvK2SfxNgx/KSSFjxwZj+rn5juVuEOoTWE/HF3rZJQxMj7khYjB1I0LugiDrYuzBo
 q244dSbVOLyXiFzZ0GMzYO0bseeCkwwusphoWV+CoBkpG+zezu4M8mEaPPbVBLV/v5Gh
 2Nlpcy9BCzPQVLYpp0bmm8QK+LZdkQOK0icPIbwAF9ksrQj/a6F0NX6Nkk9v7umYciPI
 0GIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=q3+p+zDAu+o/M00WI4MkYwdZ/997lm9TdjRw7By/4Vw=;
 b=HgY3bVZbO30b+nYzaQ7lTctvPwPko1X4IV4r/joo+Ejy7QtKcyPQrlgorx6+UoC8mI
 dcfvdeizRpboqsjwgVuwySouhuUk15CtutFFFcoPw2nmXl8ymP9FxI8h+XnJseyNWnJ3
 7mgVlYYJdypQDa0X8yUjKdNXJ7Gya363nb4eAazTwV2rmu3Oc/iSPoiQ3P0GBTR1Fdrz
 SK3okVieeWICeuRkSAL4bX2tqrltHpbL5CWPJgVqGmMNB7KaYRbivw9w//pJjwmRdP63
 HFyKFqZVM4DQQUSSnPCgxNpmEY9L3XMxYg3CAT5ff83nOIkjrOW7Ejwh7ybF0FaqZ+Qf
 Y3HQ==
X-Gm-Message-State: APjAAAULukJR8YIr0A6zVaZX0FBhb3pCTMWLm2Z5EI/J6MTw24XRbLNL
 2oQdWKnRS1VDBsKJzS63Zx0=
X-Google-Smtp-Source: APXvYqxc40fXGOkiaMGALfw+3i6opX3eZJoFHidAIxoUqSN58/Wav50Q6imXZWcGDt/qVNHBYkSDsA==
X-Received: by 2002:a19:ccca:: with SMTP id c193mr13347111lfg.36.1557756892991; 
 Mon, 13 May 2019 07:14:52 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 w19sm3195588lfe.23.2019.05.13.07.14.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 13 May 2019 07:14:52 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <8f8a401d-bdfc-4a40-61bc-4ceb8c518ade@arm.com>
 <9553a5cc-ac8b-04c4-3b89-13b1d92e306e@gmail.com>
 <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <539f8230-87af-9ffd-0b9b-4f44a2e26599@gmail.com>
Date: Mon, 13 May 2019 17:14:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0e06d98d-f366-ff85-5f19-541c3079012c@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 0/2] Introduce runstate area registration
 with phys address
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
Cc: Andrii Anisov <andrii_anisov@epam.com>, Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMTMuMDUuMTkgMTQ6MTYsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4+
IEkgYW0gYWZyYWlkIEkgY2FuJ3QgcG9zc2libGUgYmFjayB0aGlzIGFzc3VtcHRpb24uIEFzIEkg
cG9pbnRlZCBvdXQgaW4gdGhlIHByZXZpb3VzIHZlcnNpb24sIEkgd291bGQgYmUgT0sgd2l0aCB0
aGUgYWx3YXlzIG1hcCBzb2x1dGlvbiBvbiBBcm0zMiAocGVuZGluZyBwZXJmb3JtYW5jZSkgYmVj
YXVzZSBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0byBpbmNyZWFzZSB0aGUgdmlydHVhbCBhZGRyZXNz
IGFyZWEgYnkgcmV3b3JraW5nIHRoZSBhZGRyZXNzIHNwYWNlLgo+Pgo+PiBJJ20gc29ycnksIEkn
bSBub3Qgc3VyZSB3aGF0IHNob3VsZCBiZSBteSBhY3Rpb25zIGFib3V0IHRoYXQuCj4gCj4gVGhl
cmUgbm8gY29kZSBtb2RpZmljYXRpb24gaW52b2x2ZWQgc28gZmFyLiBKdXN0IHVwZGF0aW5nIHlv
dXIgY292ZXIgbGV0dGVyIHdpdGggd2hhdCBJIGp1c3Qgc2FpZCBhYm92ZS4KCk9LLCBJJ2xsIHRh
a2UgaXQgZm9yIHRoZSBuZXh0IHZlcnNpb24uCgo+Pj4gVGhlIHBhdGNoIGxvb2tzIHdyb25nIHRv
IG1lLiBZb3UgYXJlIHVzaW5nIHZpcnRfdG9fcGh5cygpIG9uIGEgcGVyY3B1IGFyZWEuIFdoYXQg
ZG9lcyBhY3R1YWxseSBwcm9taXNlIHlvdSB0aGUgcGh5c2ljYWwgYWRkcmVzcyB3aWxsIGFsd2F5
cyBiZSB0aGUgc2FtZT8KPj4KPj4gU29ycnkgZm9yIG15IGlnbm9yYW5jZSBoZXJlLCBjb3VsZCB5
b3UgcGxlYXNlIGVsYWJvcmF0ZSBtb3JlIGFib3V0IHdoYXQgaXMgd3JvbmcgaGVyZT8KPiAKPiBX
aGlsZSB0aGUgdmlydHVhbCBhZGRyZXNzIHdpbGwgbmV2ZXIgY2hhbmdlIG92ZXIgb3ZlciB0aGUg
bGlmZSBjeWNsZSBvZiBhIHZhcmlhYmxlLCBJIGFtIG5vdCBlbnRpcmVseSBzdXJlIHdlIGNhbiBt
YWtlIHRoZSBzYW1lIGFzc3VtcHRpb24gZm9yIHRoZSBwaHlzaWNhbCBhZGRyZXNzLgo+IAo+IEkg
a25vdyB0aGF0IGttYWxsb2MoKSBpcyBwcm9taXNpbmcgeW91IHRoYXQgdGhlIHBoeXNpY2FsIGFk
ZHJlc3Mgd2lsbCBub3QgY2hhbmdlLiBCdXQgcGVyY3B1IGRvZXMgbm90IHNlZW0gdG8gdXNlIGtt
YWxsb2MoKSBzbyBoYXZlIHlvdSBjb25maXJtZWQgdGhpcyBhc3N1bXB0aW9uIGNhbiBob2xkPwoK
SSBuZWVkIGEgYml0IG1vcmUgdGltZSB0byBpbnZlc3RpZ2F0ZS4KCgo+Pj4gQXJlIHlvdSBzYXlp
bmcgdGhhdCB0aGUgY29tbWFuZCBkZCBpcyB0aGUgQ1BVQnVybj8gSSBhbSBub3Qgc3VyZSBob3cg
dGhpcyBjb3VsZCBiZSBjb25zaWRlcmVkIGFzIGEgQ1BVQnVybi4gSUhNTywgdGhpcyBpcyBtb3Jl
IElPIHJlbGF0ZWQuCj4+Cj4+IEJvdGggL2Rldi9udWxsIGFuZCAvZGV2L3plcm8gYXJlIHZpcnR1
YWwgZGV2aWNlcyBubyBhY3R1YWwgSU8gaXMgcGVyZm9ybWVkIGR1cmluZyB0aGVpciBvcGVyYXRp
b25zLCBhbGwgdGhlIGxvYWQgaXMgQ1BVICh1c2VyIGFuZCBzeXMpLgo+IAo+IFRoYW5rIHlvdSBm
b3IgdGhlIGV4cGxhbmF0aW9uLiBTaGFsbCBJIGd1ZXNzIHRoaXMgaXMgYW4gZXhpc3RpbmcgYmVu
Y2htYXJrIFsxXT8KCldlbGwsICJkZCBpZj0vZGV2L3plcm8gb2Y9L2Rldi9udWxsIiBpcyBqdXN0
IGEgdHJpdmlhbCB3YXkgdG8gZ2V0IG9uZSBDUFUgY29yZSBidXN5LiBJdCB3b3JrcyBmb3IgKGFs
bW9zdCkgYW55IExpbnV4IHN5c3RlbSB3aXRob3V0IGFueSBhZGRpdGlvbmFsIG1vdmVtZW50cy4K
VXNpbmcgYW5vdGhlciB0cml2aWFsIEdPIGFwcGxpY2F0aW9uIGZvciB0aGF0IHB1cnBvc2UsIHNl
ZW1zIHRvIG1lIGxpa2UgYW4gb3ZlcmtpbGwuIFlldCBpZiB5b3UgaW5zaXN0LCBJIGNhbiB1c2Ug
aXQuCgoKPj4gSSBkaWQgcnVuIGl0IHVudGlsIGF2ZyBtb3JlIG9yZSBsZXNzIHN0YWJpbGl6ZXMg
KDItMyBtaW51dGVzKSwgdGhlbiB0b29rIHRoZSBtaW5pbWFsIGF2ZyAobm90ZSwgd2UgaGF2ZSBh
IG1vdmluZyBhdmVyYWdlIHRoZXJlKS4KPiBEaWQgeW91IHJlLXJ1biBtdWx0aXBsZSB0aW1lP1ll
cywgc3VyZS4gVGhlc2UgYXJlIG5vdCB0aGUgb25lIHRyeSByZXN1bHRzLgoKLS0gClNpbmNlcmVs
eSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
