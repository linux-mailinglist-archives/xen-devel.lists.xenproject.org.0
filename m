Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EDC4BCD7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 17:30:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdcUm-00029u-Ez; Wed, 19 Jun 2019 15:27:32 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=czgQ=US=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hdcUk-00029p-JZ
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 15:27:30 +0000
X-Inumbo-ID: bf214556-92a6-11e9-8980-bc764e045a96
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bf214556-92a6-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 15:27:28 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r9so3696858ljg.5
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 08:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OglYSSPfL9RWfsAXLzLfYH+/f5uTaA3a6Yxdc055DLU=;
 b=Z6uo73btyzkklsII0pagjVttxDLtLwiR/nPvXgOa3JDC2XiN5+8/IBArxF3eNt60Q/
 EczzXN5oNlnQqstbuzQcMlxS07P1/b0bIiR7dpwFQzxvX8u7bfpQMwoc1Qsgvtj0X0GK
 piEG2sWGTLVwWI0DAssfO4kn6jLbsSfYetuXJ0wjwNvAEDRhGODmrO+UWAwFb+I4XEXE
 aqqsEK99T6+slw/YDAHJGoSm5f+dO2sTizgcsz1B7OL3Vil+rfB2ImWedSVy4vN/lkq9
 dFLJIa4orCXA4o42E1JppzDXGOvlICgdPeyeh6g1wNHMCuLkyVNOfQ/wbfEDmXNKF6/q
 iLDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OglYSSPfL9RWfsAXLzLfYH+/f5uTaA3a6Yxdc055DLU=;
 b=KPCWL8P4j811yPDkWHHr4hGVFgoSiKjOaYG8/1tm9UfhEYDFcjTaB4cOQg4k8d9UXI
 hFXyHpVbYlPG726wv2ZqtNiVZZNB7qiw9gu98OxV7yDMSM6pNNyjpvbg2xIh6Bqp8LHF
 OonZsW/tpsqAeVBj2R8Zw6UYuf69gBQhPkgi7d4BcFNzj3OeN0zA/zqzdW0SKxvU+8er
 DeXYStFiqqGn78YFnZC23s4VrEPnyUFny3ZjZJXpTtxSERoCPcAaY0bhm1HFnYueicyN
 IPAnGcr2+rp090BSl1418y118KWwNYNZsgxOBIoxT40GvAvNcvC3KQSa3ElSlkUBNtTC
 TfzQ==
X-Gm-Message-State: APjAAAVwpVNLjmzc8j1C/zmt7B3wpc5c0aalKlhcPhKIpjUi6YdoeUG0
 BELnpr6VQHYN3Jpx0qwf6jvio7Cke4c=
X-Google-Smtp-Source: APXvYqxXPZ2V4OrO+nEYl8Ml9QClPHaRj/1Yure50NG9c+sjHPfeD2ISFQu6TqWAuDdRhRwPTqJApQ==
X-Received: by 2002:a2e:9950:: with SMTP id r16mr33389690ljj.173.1560958047031; 
 Wed, 19 Jun 2019 08:27:27 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 m4sm3125008ljc.56.2019.06.19.08.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 08:27:26 -0700 (PDT)
To: Denis Obrezkov <denisobrezkov@gmail.com>
References: <287117b9-952c-1a92-26e0-9597df936c27@gmail.com>
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
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
 <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
 <CAGPpAzUpeFEmFX9FMkQDn+2gWnL1GmyEsL49DPLxWKBQ=_W0Eg@mail.gmail.com>
 <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <45406dbd-4aa1-8852-475e-1c37c93a7fa3@gmail.com>
Date: Wed, 19 Jun 2019 18:27:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8f6fafd5-6cab-b57c-b68b-ceb0ec88cfb2@arm.com>
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
 Iain Hunter <drhunter95@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOS4wNi4xOSAxODowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IExhc3RseSwgcGxlYXNl
IGNsZWFuLXVwIHRoZSBjb2RlIGFuZCBzZW5kIHRoZSBwYXRjaCBvbiB4ZW4tZGV2ZWwuIEkgd2ls
bCBoYXZlIGEgY2xvc2VyIGxvb2sgYXQgdGhhdCB0aW1lLiBGZWVsIGZyZWUgdG8gcGluZyBtZSBv
biBJUkMgaWYgeW91IGhhdmUgYW55IGRvdWJ0IGhvdyB0byBwcm9jZWVkLgoKQWJvdXQgdGhlIGNv
ZGU6IEkgdGhpbmsgb21hcDVfaW5pdF9zZWNvbmRhcnkoKSBtdXN0IGJlIG1vdmVkIHRvIHRoZSBw
bGF0Zm9ybSBjb2RlIChvbWFwNS5jKS4KCkkndmUgbm90aGluZyB0byBhZGQgYWJvdXQgdGhlIGxv
Zy4gUGFzdGViaW4gaXMgYmFubmVkIGluIG91ciBuZXR3b3JrLgoKLS0gClNpbmNlcmVseSwKQW5k
cmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
