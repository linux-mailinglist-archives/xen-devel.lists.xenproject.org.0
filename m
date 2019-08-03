Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10343806D1
	for <lists+xen-devel@lfdr.de>; Sat,  3 Aug 2019 16:50:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htvKU-0002BN-Mo; Sat, 03 Aug 2019 14:48:18 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=LPa+=V7=cardoe.com=cardoe@srs-us1.protection.inumbo.net>)
 id 1htvKT-0002BH-ND
 for xen-devel@lists.xenproject.org; Sat, 03 Aug 2019 14:48:17 +0000
X-Inumbo-ID: ba516a08-b5fd-11e9-8980-bc764e045a96
Received: from mail-yb1-xb44.google.com (unknown [2607:f8b0:4864:20::b44])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ba516a08-b5fd-11e9-8980-bc764e045a96;
 Sat, 03 Aug 2019 14:48:17 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id s41so5664209ybe.12
 for <xen-devel@lists.xenproject.org>; Sat, 03 Aug 2019 07:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=EE1InBAIUG0zNXane42CfkjpNSFqcw9/H3jrStqlmkk=;
 b=OnqwPbfO2HmXqei2hUieXn4U84OB/W3S1NUt4o5hjcnY91LKfXZIBvxLAkcQ0S309k
 RvHvcqQRn/4OTcex5VKi/1TA1YjPn2LmMVisPlooIJNulVd1Yc5v9bL8g6ZdTpIDTFtq
 sIXCe+7/8aokod7n9DSXJsPZ4Xfr3el+luBik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=EE1InBAIUG0zNXane42CfkjpNSFqcw9/H3jrStqlmkk=;
 b=qu1j3aqjuTb9FiF22L+k+FggDEfgMTA+RbwioYyO0nuEaqTBjwORfDvAgEkqXizhC1
 an2U87MJeMTp0g/iZe8dMaoyzJS03T/Rjn8jObgShZWLurqol3yz3A9/X6tWHsh3j1xD
 13qOhDIloR8ZW/+ypJ1M7xGG7cZ3MKQBstEXxgh4povrCxVzYhP22dE2Z+gRU9zxzIfU
 Wk4yAUqpUM2Ex98SaWQBkJ+FHV0068JDYEU+gREdAT4mP3IXuXnDA2W8HYlw0XNruhEU
 08u2Fw/PoljyeJn/BDwvL2/LdjETLOZ3EWrFPdp9LWP9JKSKX06PeSLuHjQaHi71Ba8b
 keQA==
X-Gm-Message-State: APjAAAX+qBcljxfABRnQmKLjnxlfxgdL0vrrjZqo72bRwI/m51Qn/bzZ
 ss5vGx0lmYJ6nm/eADVM+BI=
X-Google-Smtp-Source: APXvYqyLrkW4OkaHdEQsd3tRZVMwXRodExU7QFSVkMfbzJhftjK+kFi6b2JDyf/FlLGBBJx0NR/brg==
X-Received: by 2002:a25:5c44:: with SMTP id q65mr93683313ybb.473.1564843696677; 
 Sat, 03 Aug 2019 07:48:16 -0700 (PDT)
Received: from MacBook-Pro.localdomain
 ([2600:1700:7b90:52f0:a01d:69c7:44ec:418c])
 by smtp.gmail.com with ESMTPSA id d204sm17940087ywe.33.2019.08.03.07.48.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 03 Aug 2019 07:48:16 -0700 (PDT)
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
 <156459232623.7075.3064492825922924284.stgit@Palanthas>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <f088dded-d916-1aeb-2131-626a7be33b03@cardoe.com>
Date: Sat, 3 Aug 2019 09:48:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156459232623.7075.3064492825922924284.stgit@Palanthas>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 2/3] automation: add openSUSE Tumbleweed CI
 image
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
Cc: Wei Liu <wl@xen.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gNy8zMS8xOSAxMTo1OCBBTSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cgo+IG9wZW5TVVNFIGNv
bWVzIGluIHR3byBmbGF2b3VyczogTGVhcCwgd2hpY2ggaXMgbm9uLXJvbGxpbmcsIGFuZCByZWxl
YXNlZAo+IGFubnVhbHksIGFuZCBUdW1ibGV3ZWVkLCB3aGljaCBpcyByb2xsaW5nLgo+Cj4gUmVh
c29ucyB3aHkgaXQgbWFrZXMgc2Vuc2UgdG8gaGF2ZSBib3RoIChkZXNwaXRlIGJvdGggYmVpbmcg
b3BlblNVU0UsCj4gcGFja2FnZSBsaXN0cyBpbiBkb2NrZXJmaWxlcyBiZWluZyBxdWl0ZSBzaW1p
bGFyLCBldGMpIGFyZToKPiAtIExlYXAgc2hhcmUgYSBsb3Qgd2l0aCBTVVNFIExpbnV4IEVudGVy
cHJpc2UuIFNvLCByZWdyZXNzaW9ucyBvbiBMZWFwLAo+ICAgIG5vdCBvbmx5IG1lYW5zIHJlZ3Jl
c3Npb25zIGZvciBhbGwgb3BlblNVU0UgTGVhcCB1c2VycywgYnV0IGFsc28gaGVscHMKPiAgICBw
cmV2ZW50L2NhdGNoIHJlZ3Jlc3Npb25zIG9uIFNMRTsKPiAtIFR1bWJsZXdlZWQgb2Z0ZW4gaGFz
IHRoZSBtb3N0IGJsZWVkaW5nLWVkZ2Ugc29mdHdhcmUsIHNvIGl0IHdpbGwgaGVscAo+ICAgIHVz
IHByZXZlbnQvY2F0Y2ggcmVncmVzc2lvbnMgd2l0aCBuZXdseSByZWxlYXNlZCB2ZXJzaW9ucyBv
Zgo+ICAgIGxpYnJhcmllcywgY29tcGlsZXJzLCBldGMgKGUuZy4sIGF0IHRoZSB0aW1lIG9mIHdy
aXRpbmcgdGhpcyBjb21taXQsCj4gICAgc29tZSBidWlsZCBpc3N1ZXMsIHdpdGggR0NDOSwgd2hl
cmUgZGlzY292ZXJlZCB3aGlsZSB0cnlpbmcgdG8gYnVpbGQKPiAgICBpbiBhIFR1bWJsZXdlZWQg
aW1hZ2UpLgo+Cj4gTm90ZSB0aGF0LCBjb25zaWRlcmluZyB0aGUgcm9sbGluZyBuYXR1cmUgb2Yg
VHVtYmxld2VlZCwgdGhlIGNvbnRhaW5lcgo+IHdvdWxkIG5lZWQgdG8gYmUgcmVidWlsdCAoZS5n
LiwgcGVyaW9kaWNhbGx5KSwgZXZlbiBpZiB0aGUgZG9ja2VyIGZpbGUKPiBkb2VzIG5vdCBjaGFu
Z2UuCj4KPiBTaWduZWQtb2ZmLWJ5OiBEYXJpbyBGYWdnaW9saSA8ZGZhZ2dpb2xpQHN1c2UuY29t
PgpBY2tlZC1ieTogRG91ZyBHb2xkc3RlaW4gPGNhcmRvZUBjYXJkb2UuY29tPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
