Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C724A2C9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 15:50:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdESt-0007i1-4E; Tue, 18 Jun 2019 13:47:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dFjn=UR=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hdESs-0007hw-Dw
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 13:47:58 +0000
X-Inumbo-ID: ada97778-91cf-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ada97778-91cf-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 13:47:57 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id p24so9343346lfo.6
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2019 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Rf9kXi9cjVVmKjDi8nah0GcJghG4jCCojMfOntrGXZE=;
 b=fCQzwUHA68vGMeP8kLv/NEk+AnY+lbn9OGRNgu9/udnQyZ+r9lyx00Zw0cKbC04RAX
 tJneS+fC1f2NWWsJcC3z0R3cqA7Lj1wCMYlPwZZpOKwkXgqkaR/ycUaj4bs3AJtGpJUr
 hkW8BlbXymOhYWrOYzfpQgL1yS+VXVoL4HeZnnfsABhlJXiEJwEHU+PmYboeoG8B1uu8
 owqH8XqtDWwdWBjNoDUV8+++6F2G/Y32l+EuhaI+RerBS+SjgCCB9IgkaQDWGGq3zSrv
 QOVI+yy4X7+O+1XLK/ANYLVLemNfY0HK9NfUIgIVh0kwF4VV2RtbprPwe7+6/i0/Y1G7
 jLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Rf9kXi9cjVVmKjDi8nah0GcJghG4jCCojMfOntrGXZE=;
 b=mGivubl31dI6bnA2fuKMb3NnL0Sh2Ogaz0iz9mZ8mWWdohJ6PJS97SXSwxUuHfWs3T
 1Rw7Ux5DhInupHAGsK7PSKRCMcJVV2+QdOus6mtP77dQRIAS1bOQej1ke149d0uih81y
 oSGPli8uoVbqZg/i2v/Pe3AzM6Sbzb4P5/USJU4v0vRnNJiTHGVgmABaymfeKScr6G05
 QMGbj/yBtv+X54hH2NTCCP2QBiWFURI2pZxsFdkedH3GWGullAYKFKcP9O0CdDR0uUNc
 SQ9UGMhSFPrHmyowo9TtAGsg0jM1HTjBsgfWuiyOJ0dajp0WIxmJhGzk2oz3sa3Oo+5l
 dh/Q==
X-Gm-Message-State: APjAAAWBQzgjxc5lqo5H3RicvqI9vTLXVh/Zcn+B3/RV5nDU11XT1FWL
 g+I9tCxGEB3lQQX8gwOMn9Smo1yevjk=
X-Google-Smtp-Source: APXvYqwNVWJiR5MMEI1fiPcYuDnpsqf1UpzFjH6+tMJA7AQ1ZmuZ63r0SoMkPI6nLzTZM9MNVe65bA==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr24229400lfq.136.1560865675903; 
 Tue, 18 Jun 2019 06:47:55 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 y2sm2191113lfc.35.2019.06.18.06.47.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 06:47:55 -0700 (PDT)
From: Andrii Anisov <andrii.anisov@gmail.com>
To: Julien Grall <julien.grall@arm.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
 <cd936ab7-df65-1615-a03a-bea30b5814f9@arm.com>
 <f3596bd5-ede3-7299-e28f-033ad32e6c99@gmail.com>
 <62194faf-0bf8-61b8-a69f-e41934fb5a43@arm.com>
 <0c900a15-14ab-9947-bffe-2fbeed176486@gmail.com>
 <CALC81-vaVKgZoi27MauGTxjda8mchy5GRLipu5z=v1vh9fyvAg@mail.gmail.com>
 <747dd124-3511-f010-dac7-b9b23d7b44ad@gmail.com>
 <CALC81-tewzAtaaH94U1nVc-UiacR_YvqhaYcPXtXcviTFHAG8A@mail.gmail.com>
 <ecb2cf41-51e5-2ff2-5e61-72be64399e40@arm.com>
 <AM6PR0302MB32215CD7FAED139C682D92A386EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <ef82a028-9e4e-9976-d205-42cbc4bfc8ac@arm.com>
 <AM6PR0302MB3221D649900B54C2FFA7003A86EA0@AM6PR0302MB3221.eurprd03.prod.outlook.com>
 <AM6PR03MB49190A0828A49569B64611B4E6EA0@AM6PR03MB4919.eurprd03.prod.outlook.com>
 <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
 <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
Message-ID: <0c84ca86-0cc0-2843-4d15-f1355ed14788@gmail.com>
Date: Tue, 18 Jun 2019 16:47:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
Content-Language: en-US
Subject: Re: [Xen-devel] Starting to port xen on beagleboard-x15 (GSoC 2019
 project)
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
Cc: Hunyue Yau <hy-gsoc@hy-research.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Denis Obrezkov <denisobrezkov@gmail.com>, Iain Hunter <drhunter95@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

ClNvcnJ5IEkndmUgcmUtcmVhZCB5b3VyIHN0YXRlbWVudCwgYW5kIGdvdCBhbm90aGVyIGlkZWEu
CgpPbiAxOC4wNi4xOSAxNjoyNywgQW5kcmlpIEFuaXNvdiB3cm90ZToKPiBPbiAxOC4wNi4xOSAx
NTo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+PiBTd2l0Y2ggdG8gaHlwLW1vZGUgaXMgZmFpcmx5
IGNvbXBsZXggYW5kIGRlcGVuZHMgb24geW91ciBwcm9jZXNzb3IuCgpTd2l0Y2ggdG8gaHlwLW1v
ZGUgZGVwZW5kcyBvbiB0aGUgcHJvY2Vzc29yLiBTbyBpdCBtYXkgYmUgY29tcGxleC4gT3Igbm90
LgoKPj4gSGVuY2Ugd2h5IGl0IHdhcyBkcm9wcGVkIGluIGJvdGggTGludXggYW5kIFhlbi4KCkFz
IHlvdSBjYW4gc2VlLCBmb3IgT01BUDUgTGludXgga2VybmVsIGRpZCBsZWF2ZSB0aGUgc3dpdGNo
IHRvIGh5cCBtb2RlLiBJIGd1ZXNzIHRoZSByZWFzb25pbmcgYmVoaW5kIHRoYXQgYWxzbyBhc3N1
bWVzIGEgY29tcGxleGl0eSBvZiBjaGFuZ2VzIHRvIGEgYm9vdGxvYWRlciwgbGlrZSBpbiB0aGUg
cGF0Y2ggeW91IG5vdGljZWQuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
