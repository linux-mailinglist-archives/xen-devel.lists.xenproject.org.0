Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759EE4B79B
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 14:05:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdZHp-0000U5-Dw; Wed, 19 Jun 2019 12:01:57 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=czgQ=US=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hdZHo-0000Tz-GI
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2019 12:01:56 +0000
X-Inumbo-ID: 07c3500d-928a-11e9-8980-bc764e045a96
Received: from mail-lj1-x230.google.com (unknown [2a00:1450:4864:20::230])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 07c3500d-928a-11e9-8980-bc764e045a96;
 Wed, 19 Jun 2019 12:01:55 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id 16so2944248ljv.10
 for <xen-devel@lists.xenproject.org>; Wed, 19 Jun 2019 05:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u0j6kBNHaLOH7c9+LVCYR8X9tk2KNPsw2lgGEjq6uAI=;
 b=mF3vGcWIQz4XfcVsSE7kFtLmj39m+lvn03qazF7H3wyoAB0EOtwP/sfrdDycjpqyzl
 t1qoOI7uc+AAI6pMR5E6k5zYJwgcEpeIHYHs0gqz9mmUd8BNHplN30dhw2EaqECWHIau
 WGLnu9Cw5UyjkUFKIH4fVs7ucv7DszrQyr6+WYUc3spZl+LrYmRVRA7tUYFnZoEgtVr+
 Q9ENC8bHlqATgXn0q1xQvy1iaERz54i5IlAKIrJtsODG59ixOgd7TnVufnRDazKC1Gho
 r++Lwbr8iJ4RYyBIkeMSJRoJ0/24bmG85MDBkjc2I/1sncro0WpWRf5Qh8Q3WWc2p5bh
 kHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u0j6kBNHaLOH7c9+LVCYR8X9tk2KNPsw2lgGEjq6uAI=;
 b=R+oF9EQK9zkbzZIb0k/WK9hkQRa3ySYyD27/foyCwtX8ILERpeSusM4tGDXgx7y/4A
 3ecnx/PY1D2EG23HdJxiET5RYAyb4k6mkZxoL6yryFZuwLsWFok8k0yiWGDo1fypK5kJ
 kg9GM6fF61xrhQJmR4oXFDKh82udOSRcGdagXwK+mHNoXJCVj6E6JzLkUn8lDKjY5COj
 2ADpeUXrJ47UEYwq1zDNaLux76KW+/iflcTdjLYeRRBstJOvlFR/jGhNNTuCeQMyqOd0
 fww5LhHNgwPf9alsxthG5qcX4FJdTWQlhjoaIoDa/KDExWoRkzuwXg7wNPsTlIVW8e+x
 bQ3g==
X-Gm-Message-State: APjAAAXsZ+ykoQGV/r0nOZ7Kj+NhVL4E4NL+641D/NLHw934QMvecvHl
 7vgGauFO+2AlDd9FqdPxgZfXJvPDew0=
X-Google-Smtp-Source: APXvYqyqVnnq8EXasEvEmrQsmmOY8YtTp2Tvs/imO4cANcHfOrAxg/DPZCwORfh0jr3sIxPthZETHQ==
X-Received: by 2002:a2e:9a49:: with SMTP id k9mr16796017ljj.78.1560945713295; 
 Wed, 19 Jun 2019 05:01:53 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t63sm59477lje.65.2019.06.19.05.01.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 05:01:52 -0700 (PDT)
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
 <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4a2ae4d4-493a-d5f6-64da-1da313db3962@gmail.com>
Date: Wed, 19 Jun 2019 15:01:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <2c0cced8-27ec-a3bb-b2bf-c037176a162a@arm.com>
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

CgpPbiAxOC4wNi4xOSAxOToxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IERlbmlzICh0aGUgYXV0
aG9yIG9mIHRoZSB0aHJlYWQpIGlzIGRvaW5nIGEgR1NPQyB0byBwb3J0IFhlbiBvbiB0aGUgQmVh
Z2xlQm9hcmQgWDE1LiBZb3UgZW5kZWQgdXAgQ0NlZCBiZWNhdXNlIHlvdSBjYW4gcHJvdmlkZSBm
ZWVkYmFjayBob3cgdG8gcHJvY2VlZC4gTm90IGJlY2F1c2Ugd2Ugd2FudGVkIHlvdSB0byBpbXBs
ZW1lbnQgaXQuLi4KCk9LIHRoZW4uCgpEZW5pcywKCkZlZWwgZnJlZSB0byBjb250YWN0IG1lIGlu
IGNhc2UgeW91IG5lZWQgY2xhcmlmaWNhdGlvbnMgYWJvdXQgdGhlIHN0dWZmLgoKLS0gClNpbmNl
cmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
