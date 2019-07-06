Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 425656127E
	for <lists+xen-devel@lfdr.de>; Sat,  6 Jul 2019 19:58:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjou5-00052L-Jy; Sat, 06 Jul 2019 17:55:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L7pd=VD=gmail.com=denisobrezkov@srs-us1.protection.inumbo.net>)
 id 1hjou4-00052G-Rp
 for xen-devel@lists.xenproject.org; Sat, 06 Jul 2019 17:55:16 +0000
X-Inumbo-ID: 34dd8b91-a017-11e9-8980-bc764e045a96
Received: from mail-ed1-x541.google.com (unknown [2a00:1450:4864:20::541])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 34dd8b91-a017-11e9-8980-bc764e045a96;
 Sat, 06 Jul 2019 17:55:15 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id d4so10634391edr.13
 for <xen-devel@lists.xenproject.org>; Sat, 06 Jul 2019 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sdGqiqBuBdGpv6rShADMAnOsEyEM1ukDzbjsk66OFZw=;
 b=iUCboaxUJsgW1bxAl/UJ9d9N40CxzT0SKjx/3gNWO1pCblZQd66h/Vy1w+Tvip/FIn
 PphvW5zKcEz7Rn08wmJzt8b5xCuzTDOdtlEe4PkTwvDPWQAZgtVOj4dqFNHK363hD1/A
 UxYJyXXgPrk5KH/j9QPirsucvByhcxZz4u+EBNv7bizR0BSWUUB7z92LWdRoQDxYmuYE
 jiYX1BRua+eauP0bbs2UjaR0OoQd3Jrv+4VNfI5fRPO7K+V7NYNC8b33qyb1GajSo6LO
 3QNS8HjHn8mw8691O2Tai5hgp31jgGlxT87fMby4CHZExn8TWnTYJiraaKYOWaCql70H
 8Iew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sdGqiqBuBdGpv6rShADMAnOsEyEM1ukDzbjsk66OFZw=;
 b=feBcCBP3Wn2FPxBzA5Q6mg22KG6iUn7r/CmQmBoHxaSixgKgb51O6BPpzqps+Y6WZ1
 LGt+grVUt0c85MSiiB5Ooj8Hb5nSzMv0ao12IOwbK8cXPsawXGuJdIyWMKSgoGqnNedS
 jjWw/8dD1owyghB5VI3fWsni8yq3dHZ6AxeaGx1bFtnZhEWiRkgQhUyVMZq4IzTsVSJJ
 YLK6OF8ZTUliLis/H75y/x6SG3l2LvXOTJBNeAVcipLzaGGbLxqe7XOfgITk57UknzgD
 mrRLGSj1ki4MBKA5AFXyWiul2/1VrIfd9qcazd9dgn4Au9wD50gUgyEvla2OIG65jpnk
 twhA==
X-Gm-Message-State: APjAAAWsu2as9xcSixfwRalKv+yZiE63ZbPeaKAO2HJgBZWiinauddA3
 pCjnY+FdxZ5SUf/t5EzrQkA=
X-Google-Smtp-Source: APXvYqwbxxTx4b4UdYA2Twp+qFJDPJOJJG+e7bvVrp6WS201Hbf/7AyuY/tMiHIXE5D12sbNYlJvKA==
X-Received: by 2002:a17:906:45ce:: with SMTP id
 z14mr8988278ejq.144.1562435713957; 
 Sat, 06 Jul 2019 10:55:13 -0700 (PDT)
Received: from ?IPv6:2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6?
 (200116b866196c001e4bd6fffef946e6.dip.versatel-1u1.de.
 [2001:16b8:6619:6c00:1e4b:d6ff:fef9:46e6])
 by smtp.gmail.com with ESMTPSA id c15sm1208675ejs.17.2019.07.06.10.55.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 06 Jul 2019 10:55:13 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, Iain Hunter <drhunter95@gmail.com>
References: <4ec41ede-a8cb-6724-aa88-254387b2aa15@gmail.com>
 <CALC81-tWyUTXVf5uxtdi_i5Ndz0CRtoJ=XwTecz40bzyL7Ps1w@mail.gmail.com>
 <779518d6-b7f8-9faa-f22d-558013dc8cfb@gmail.com>
 <583833d2-8303-48f5-7cab-f9e4e112a694@gmail.com>
 <3a2a6185-0056-d931-a194-578239eedabc@gmail.com>
 <c85dcf69-2a56-811d-fa95-b313ca9ea66f@arm.com>
 <42daf482-9f3e-55c7-9bad-c61b147252af@gmail.com>
 <da1d04bb-54ad-5bf7-f62e-1fecbb1e7611@arm.com>
 <e22d87c2-d09b-848a-b520-e80599d895a1@gmail.com>
 <625d8126-5baa-4d83-b27c-fabd94fe5f77@arm.com>
 <27be8a8a-7bf1-2c18-bc1d-6dd4898da47b@gmail.com>
 <761afa88-7655-96d9-0ad9-3eb198c1eb59@arm.com>
From: Denis Obrezkov <denisobrezkov@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=denisobrezkov@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9e4fd741-176b-04dc-2356-587a1542b832@gmail.com>
Date: Sat, 6 Jul 2019 19:55:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <761afa88-7655-96d9-0ad9-3eb198c1eb59@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [GSOC-2019] Problem with initializing crossbar on
 bb-x15 in dom0
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
 nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Hunyue Yau <hy-gsoc@hy-research.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGksCgpPbiA3LzYvMTkgNzozNyBQTSwgSnVsaWVuIEdyYWxsIHdyb3RlOgoKPiAKPiBZZXMgaXQg
d291bGQgYmUgc2Vuc2libGUgdG8gdHJ5IHRvIGltcGxlbWVudCBhIGNyb3NzYmFyIGRyaXZlciBp
biBYZW4KPiBhbmQgdGVzdCB3aXRoIHRoZSBVQVJULiBMb29raW5nIGF0IHRoZSBkcml2ZXIgaW4g
TGludXgsIHRoaXMgc2hvdWxkIG5vdAo+IGJlIHRvbyBkaWZmaWN1bHQuCkkgZG9uJ3QgdW5kZXJz
dGFuZCB3aHkgeGVuIGRvZXNuJ3QgcmVhY3Qgb24gdHJpcGxlIEN0cmwrYS4gSXQgcHJvYmFibHkK
bWVhbnMgdGhhdCBVQVJUJ3MgaW50ZXJydXB0cyBkb2Vzbid0IHdvcmsuIEJ1dCBJIHdhcyBhYmxl
IHRvIHR5cGUgaW4KdS1ib290IHNvIHRoZSB1YXJ0IHNob3VsZCBiZSBhbHJlYWR5IGNvbmZpZ3Vy
ZWQuIE9yIG5vdD8gU2hvdWxkIEkgc2V0IHVwCml0IGluIGEgY3Jvc3NiYXIgZmlyc3Q/Cj4gCj4+
Pgo+IAo+IEkgZG9uJ3QgdGhpbmsgSSBldmVyIHN1Z2dlc3RlZCB0byBub3QgZXhwb3NlIHRoZSBj
cm9zc2JhciB0byBEb20wLgo+IEluc3RlYWQsIEkgc3VnZ2VzdGVkIHRvIHZpcnR1YWxpemUgZm9y
IERvbTAsIHNvIGl0IGNhbiBiZSB1c2VkIGJ5IFhlbiBhcwo+IHdlbGwuCj4gCj4+Pgo+Pj4+IEFs
c28sIHRoZSB0ZWdyYQo+Pj4+IGltcGxlbWVudGF0aW9uIGJsYWNrbGlzdCBvbmx5IGEgdWFydC4K
Pj4+Cj4+PiBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcy4KPj4gSW4gaGVyZSBbMV0geW91IGNhbiBm
aW5kIHRoYXQgb25seSB1YXJ0IGlzIGJsYWNrbGlzdGVkIChpbgo+PiB0ZWdyYV9ibGFja2xpc3Rf
ZGV2W10pLiBTbywgaW4gdGVncmEgdGhleSBkaWRuJ3QgYmxhY2tsaXN0IHRoZWlyIHZlcnNpb24K
Pj4gb2YgdGhlIGNyb3NzYmFyLgo+IAo+IFRoaXMgc2VyaWVzIGhhcyBub3QgYmVlbiBtZXJnZWQu
IEluIG90aGVyIHdvcmQsIHRoZSBjb2RlIGlzIG5vdCB5ZXQKPiBtYXRjaGluZyB0aGUgZXhwZWN0
YXRpb25zIG9mIHRoZSBtYWludGFpbmVycy4KPiAKPiBJIHBvaW50ZWQgeW91IHRvIHRoaXMgc2Vy
aWVzLCBiZWNhdXNlIEkgdGhpbmsgc29tZSBvZiB0aGUgaWRlYSBjb3VsZCBiZQo+IHJlLXVzZWQg
Zm9yIGltcGxlbWVudGluZyB0aGUgY3Jvc3NiYXIuCj4gCj4gSW4gdGhpcyBwYXJ0aWN1bGFyIGNh
c2UsIGl0IGhhcyBiZWVuIHN1Z2dlc3RlZCB0byB1c2UgYmxhY2tsaXN0X2Rldgo+IHJhdGhlciB0
aGFuIHVubWFwcGluZyAoc2VlIFsyXSkuCj4gCgpIbSwgSSB0aG91Z2h0IHRoYXQgaWRlYSBiZWhp
bmQgdGhlIHBhdGNoIHdhcyB0aGF0IHRoZXkgdW5tYXAgdGhlIGNvbnRyb2wKcmVnaXN0ZXIgYW5k
IGludGVyY2VwdCB0aGUgY2FsbHMgZnJvbSBMaW51eCB0byB0aGF0IGNvbnRyb2wgcmVnaXN0ZXIu
IEF0CnRoZSBzYW1lIHRpbWUgdGhleSBwcmVzZXJ2ZWQgdGhlIGNyb3NzYmFyIGluIHRoZSBkZXZp
Y2UgdHJlZS4gQW5kLCBJCnRob3VnaHQgdGhhdCB5b3Ugd2FudGVkIHRvIGRlbW9uc3RyYXRlIHRo
aXMgZXhhY3QgdGhpbmcuIENvdWxkIHlvdQpkZXNjcmliZSBob3cgaW4gZ2VuZXJhbCB0aGUgYXBw
cm9hY2ggd2l0aCBibGFja2xpc3Rpbmcgc2hvdWxkIHdvcms/CgotLSAKUmVnYXJkcywgRGVuaXMg
T2JyZXprb3YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
