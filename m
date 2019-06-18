Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF844A22F
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jun 2019 15:31:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdE8x-0005M4-Sv; Tue, 18 Jun 2019 13:27:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dFjn=UR=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hdE8w-0005Lz-Ci
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 13:27:22 +0000
X-Inumbo-ID: cca763c8-91cc-11e9-8980-bc764e045a96
Received: from mail-lj1-x242.google.com (unknown [2a00:1450:4864:20::242])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cca763c8-91cc-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 13:27:21 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v24so13099320ljg.13
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2019 06:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=APM3+jZv6o/WSOuFdEf6fFXbefS5XbnXxGGWF7xVJIo=;
 b=JX89yquVf2asvOW38gh1rf4DIWYH+IU5WoYfh3rFP3HXhUEY4Kc6TIbxFU8wIMdbWf
 cOqyI4z8JSIxHn4nJ/cJMDLlWnTcajMxpXr5Ykc0qY8/ml69nT70Z/YdTRsZSbbtKsCj
 X2wJh+3+M/gNAdaL+71rbmCbMPXwoYxTr+hkO3J/rGo56Xg2kWQ0OfvPUMxn+fg1QBMy
 lJkwLkyDFVdUF3ePZoRLrYsjUAV/uk+aOIVrjV+/SWUgoCcPxwCbVVLgCIa/2qaZR0Yk
 GyD0aTSuGxRzS8+23cGzqTtX8yr7uUOohY5At2qClsMlorTjaJlA5NLd4Rt8XdDJQnfL
 /2jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=APM3+jZv6o/WSOuFdEf6fFXbefS5XbnXxGGWF7xVJIo=;
 b=bX4rcHTylpqxVgSUZswtacyEhM1K1vN4cDUJC23IoAxC3dWIhgzdPlHnj/1Lkays4y
 JsfUSLH/cpc33Kqf0pi25dqvamjO3SHAlF8MewFrjO4aowUhDFvzSNsAGlpbt+MppQxb
 bU9WrMXUK96oD94l6jErI6cvAolujvYV5H1WPD2cwjad+qabUkEeFHfINbIpL4La31P5
 sLAnz0HRoffGHb56olMNSGJFN6pFqDpT+eTPkVPt995vj8zQcYUu4ZKmKsXF2J+9dnUb
 7pNQAl7vH1uGM9etpP9yOFPiipkMjb4cwRLElcUblCpc5CycH352OkIilDc2tISm7GKb
 ZjLw==
X-Gm-Message-State: APjAAAXsfPIhtMBWbWiqGszc+zaRhBwln5WWUM7SzVoRqhGHkOJ6wnIM
 QfIl5EboLuIvJ1QdhJcS9vxeeuaxiF8=
X-Google-Smtp-Source: APXvYqx/ezO+v3e823nBjrbKx0DG1zNTmakJTGELglA76hGhNlHbyM/Xu/p5p9VMUOAbwjzlZ+wsJg==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr3372666ljg.33.1560864439463;
 Tue, 18 Jun 2019 06:27:19 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 d4sm2203196lfi.91.2019.06.18.06.27.16
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 18 Jun 2019 06:27:18 -0700 (PDT)
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
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <666fc807-af6a-231c-9d7e-48ecabb07371@gmail.com>
Date: Tue, 18 Jun 2019 16:27:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <07a7084a-b798-0cc7-cca4-3fe58ea95835@arm.com>
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

CgpPbiAxOC4wNi4xOSAxNTo1NCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFN3aXRjaCB0byBoeXAt
bW9kZSBpcyBmYWlybHkgY29tcGxleCBhbmQgZGVwZW5kcyBvbiB5b3VyIHByb2Nlc3Nvci4gSGVu
Y2Ugd2h5IGl0IHdhcyBkcm9wcGVkIGluIGJvdGggTGludXggYW5kIFhlbi4KCkp1bGllbiwgSSBr
bm93IGl0LiBXZSBhbHJlYWR5IGRpc2N1c3NlZCB0aGF0IGZldyB5ZWFycyBhZ28uCgo+IEhvd2V2
ZXIsIGNhbGxpbmcgYW4gU01DIHdvdWxkIGJlIGFjY2VwdGFibGUgdG8gbWUuIFN0ZWZhbm8sIGFu
eSBvcGluaW9uPwoKVGhhdCBwYXRjaCAoZm9yIHUtYm9vdCkgaXMgNSsgeWVhcnMgb2xkLiBJIGRv
IG5vdCB3b3JrIHdpdGggVEkncyBzdHVmZiBmb3IgYWxtb3N0IDMgeWVhcnMuIFNvIEknZCBub3Qg
Ym90aGVyIG15c2VsZiB0byBwbGF5IHdpdGggdGhlIHN0dWZmIGFnYWluLgpJZiB0aGUgdG9waWMg
YXV0aG9yKHMpIGhhdmUgZW5vdWdoIHRpbWUgYW5kIGluc3BpcmF0aW9uLCB0aGV5IGFyZSB3ZWxj
b21lIHRvIGltcHJvdmUgT01BUDUtbGlrZSBTb0NzIHN1cHBvcnQuCgo+IFBsZWFzZSBjb25maWd1
cmUgeW91ciBlLW1haWwgY2xpZW50IHRvIGRyb3AgdGhlIGZvb3Rlci4KCkkgdGhpbmsgaXQgaXMg
aW1wb3NzaWJsZSwgaXQgaXMgYSBjb3Jwb3JhdGUgcGllY2Ugb2YgLi4uZW1haWwuCkkndmUgbWlz
c2VkIG1hbnVhbCByZW1vdmFsIG9mIHRoZSBmb290ZXIsIHlldCBJIGRvIG5vdCB1c2UgdGhhdCBl
bWFpbCBmb3IgZGlzY3Vzc2lvbnMgbm9ybWFsbHkuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
