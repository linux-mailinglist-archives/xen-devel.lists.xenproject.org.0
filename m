Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C0F508
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 13:05:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLQVE-0006B8-LC; Tue, 30 Apr 2019 11:00:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SUxV=TA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1hLQVC-0006B3-KZ
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2019 11:00:46 +0000
X-Inumbo-ID: 33924af7-6b37-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 33924af7-6b37-11e9-843c-bc764e045a96;
 Tue, 30 Apr 2019 11:00:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id c6so5846546lji.11
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2019 04:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=A8gCpjLptoQNgrVL7t2bv2Mf0mzfGSEPBZ9MAe3AT7I=;
 b=aoPv1dEH9pfHySxJ87llfRfKsNRF8+IfSvsdl4TzwNXeAZu0Ytc3CzuL9SqNZhDPnL
 It1lUhEUPAdGOyhx2/Sfpr/UBZqK7qwQSkHU62AK2i06NniEW5CsiIIRetFb9GPsk5N4
 /AIJgAQWidAnoEZH9rwkHeudc9OSlKWHP0AXvdHGz1kf8aQ/WAxPcw8FJ8ikI+Hkg3LU
 16wvOExV8MhlSkD2lbM0deEs5xdUpne2Q3JKVc64I9D3L3H1XefJsoZAFWN56xG0bPtc
 Ss6XMpsDwJ6AiYvVGRUDy/4dM0QHyvVi9GvbiDxy432Q/ZzpQJdUp3+ii3qNGTbcBmnC
 YEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=A8gCpjLptoQNgrVL7t2bv2Mf0mzfGSEPBZ9MAe3AT7I=;
 b=BscFdcC31KsWqMEPogexzpTbGA+MYSgdD2FaDtI07Ascr4RgwV1P77GJpvldsoItv2
 TK03/Kk8JWifqMXJL9Tf/zePawgu/inmdGf2CmpN2GCDqZNNg3M08zfThUumlxyTqY4p
 Th9YaEhbVDbuB9c4Y84AiZ6K3gRyArklsAp1FnwlmbyxWJdfIiV6Jd4ItPp4Lct7aXdc
 FzbK2OmA2JEXwlSMXAZbfGBbNUkFE7gkQDHoBDppPHy0hpOBMDdqI2/RQTcTusmi4Ja5
 MCic89OIcXduiGrzdWp6n64jrq0kP+bVFsJcwHdetHFOTMGy9y3P24YAueWlPOJ6R2wZ
 Eo1Q==
X-Gm-Message-State: APjAAAXnxfo0OWVybAIc2fMfhrGyTv0ID1VpxMKOqxW4bUet/xIDJRIq
 lBrycJ3A4upLDkrigiog+Tw=
X-Google-Smtp-Source: APXvYqyZh4J6YRSk3FxpYbDNbrgMVIok/6wG359QEgNXGI0nZNYeNtWV0MFFR51Qe3G/u1qg1oNMhA==
X-Received: by 2002:a2e:3e0e:: with SMTP id l14mr35393777lja.125.1556622043941; 
 Tue, 30 Apr 2019 04:00:43 -0700 (PDT)
Received: from [10.17.182.120] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id v4sm7427987ljv.4.2019.04.30.04.00.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Apr 2019 04:00:43 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1555513175-7596-1-git-send-email-olekstysh@gmail.com>
 <1555513175-7596-5-git-send-email-olekstysh@gmail.com>
 <0ca6089f-da23-a3a6-3b88-df2e99c0d5eb@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <30269399-069c-617f-991f-a37899ed2008@gmail.com>
Date: Tue, 30 Apr 2019 14:00:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0ca6089f-da23-a3a6-3b88-df2e99c0d5eb@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH V4 4/5] xen/arm: Extend SCIF early prink
 code to handle other interfaces
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

Ck9uIDI5LjA0LjE5IDE3OjI5LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cj4gSGkgT2xla3NhbmRyLAoK
SGkgSnVsaWVuCgoKPgo+PiAtLS0KPj4gwqAgZG9jcy9taXNjL2FybS9lYXJseS1wcmludGsudHh0
wqDCoMKgIHzCoCA2ICsrKysrKwo+PiDCoCB4ZW4vYXJjaC9hcm0vUnVsZXMubWvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDcgKysrKysrKwo+PiDCoCB4ZW4vYXJjaC9hcm0vYXJtMzIvZGVi
dWctc2NpZi5pbmMgfCAxMyArKysrKysrKystLS0tCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgMjIg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RvY3MvbWlz
Yy9hcm0vZWFybHktcHJpbnRrLnR4dCAKPj4gYi9kb2NzL21pc2MvYXJtL2Vhcmx5LXByaW50ay50
eHQKPj4gaW5kZXggYjIzYzU0Zi4uYzA1NDY3NCAxMDA2NDQKPj4gLS0tIGEvZG9jcy9taXNjL2Fy
bS9lYXJseS1wcmludGsudHh0Cj4+ICsrKyBiL2RvY3MvbWlzYy9hcm0vZWFybHktcHJpbnRrLnR4
dAo+PiBAQCAtMjcsNiArMjcsMTIgQEAgCj4+IENPTkZJR19FQVJMWV9QUklOVEs9PElOQz4sPEJB
U0VfQUREUkVTUz4sPE9USEVSX09QVElPTlM+Cj4+IMKgwqDCoMKgwqDCoMKgIElmIDxCQVVEX1JB
VEU+IGlzIG5vdCBnaXZlbiB0aGVuIHRoZSBjb2RlIHdpbGwgbm90IHRyeSB0bwo+PiDCoMKgwqDC
oMKgwqDCoCBpbml0aWFsaXplIHRoZSBVQVJULCBzbyB0aGF0IGJvb3Rsb2FkZXIgb3IgZmlybXdh
cmUgc2V0dGluZ3MgY2FuCj4+IMKgwqDCoMKgwqDCoCBiZSB1c2VkIGZvciBtYXhpbXVtIGNvbXBh
dGliaWxpdHkuCj4+ICvCoCAtIHNjaWYsPEJBU0VfQUREUkVTUz4sPFZFUlNJT04+Cj4+ICvCoMKg
wqAgLSA8VkVSU0lPTj4gaXMgYSBvcHRpb24gdG8gY2hvb3NlIHdoaWNoIGludGVyZmFjZSB2ZXJz
aW9uIHNob3VsZCAKPj4gYmUgdXNlZAo+Cj4gQnkgImEgb3B0aW9uIiBkaWQgeW91IGludGVuZCB0
byBtZWFuIGl0IGlzIGFuIG9wdGlvbmFsIHBhcmFtZXRlcj8KPgo+IElmIHNvLCBob3cgYWJvdXQ6
Cj4KPiAiU0NJRjxWRVJTSU9OPiBpcywgb3B0aW9uYWxseSwgdGhlIGludGVyZmFjZSB2ZXJzaW9u
IG9mIHRoZSBVQVJULiIKCmFncmVlLiB3aWxsIGNoYW5nZS4KCgo+Cj4gU28geW91IHdvdWxkIGFs
c28gcHJvdmlkZSBhIHdheSBmb3IgdGhlIHVzZXIgdG8ga25vdyBob3cgdG8gc3BlY2lmeSAKPiBp
dC4gU3RlZmFubyBhbnkgb3Bpbmlvbj8KCkkgYW0gZ29pbmcgdG8gdXBkYXRlIFdpa2kgcGFnZSBy
ZWdhcmRpbmcgaG93IHRvIHJ1biBTdG91dCBib2FyZCBvbiBYZW4gCmFuZCBob3cgdG8gcHJvcGVy
bHkgZW5hYmxlIGVhcmx5cHJpbnRrIHN1cHBvcnQgb24gdGhhdCBib2FyZC4KCldvdWxkIGl0IGJl
IGVub3VnaD8gQWxzbyBJIGNhbiBhZGQgYSBub3RlIHRvIHBhdGNoIGRlc2NyaXB0aW9uLgoKSW4g
VjEgSSBhZGRlZCBjb252ZW5pZW50IGFsaWFzIEVBUkxZX1BSSU5US19zdG91dCwgYnV0IEFGQUlS
IGl0IHdhcyAKZGVjaWRlZCB0byBhdm9pZCBhZGRpbmcgbmV3IGFsaWFzZXMuCgoKPgo+PiArwqDC
oMKgwqDCoCBJZiA8VkVSU0lPTj4gaXMgbm90IGdpdmVuIHRoZW4gYSBkZWZhdWx0IGludGVyZmFj
ZSB2ZXJzaW9uIChTQ0lGKQo+Cj4gcy9hL3RoZS8KCm9rCgoKCi0tIApSZWdhcmRzLAoKT2xla3Nh
bmRyIFR5c2hjaGVua28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
