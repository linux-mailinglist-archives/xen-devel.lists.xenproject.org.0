Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6514F433C1
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2019 09:36:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbKFU-0005mn-T2; Thu, 13 Jun 2019 07:34:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=okag=UM=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hbKFS-0005mh-QM
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2019 07:34:14 +0000
X-Inumbo-ID: a3802ea5-8dad-11e9-8980-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a3802ea5-8dad-11e9-8980-bc764e045a96;
 Thu, 13 Jun 2019 07:34:13 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id r15so14246287lfm.11
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2019 00:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zO9xnGMFPyW8lzeKcsEZZEdLMi6H3Hfc9ERvKt6vs3Q=;
 b=NrfpaPPDN+at6MrBlyCkOpoiIvDEWWGkSpeeCz0l6umuOQE9NO1dcmVPAjXlpMKKQK
 rABRIVj9hcGLhW0uBCfsfp81kUHX1By126l9S7zVCtk9gdcru7zntY2uVtBEJ18LWryD
 QuUYSDtG9k3vrGRYkuw7HaiMNhL+w2v6ZHDft5on426Y3whAOEslHzCljjZqFw/+6Szd
 yp0DT+yT0Yz2yAMdgaUJmRlk7eXfwDc4RQaoyvr1kspGnLN99l4e4MnpbPglnrO2gMzY
 9eQjRYSmg0iyPPBJ1ErHNWDz+xyMTFS6o4SbSJRWnCcw6dYJ4lT4rTdQgPqiZpEqtNgV
 eePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zO9xnGMFPyW8lzeKcsEZZEdLMi6H3Hfc9ERvKt6vs3Q=;
 b=R2kKF+b8W7L1w9LnfLtT1FSPKdha0MEhlJ2tHBkLjWAilTvN/po6SbzBrdKpb3HZPJ
 K+ul52v+3wDCPC8aCbpokfN3DdLJuRmx9qLLXUifjvB53STZAnWoybUw4YU4Ao7J661B
 MXZ1XRQ6m2wip93qH7F22SIZt04cY+cuoW6vWI2D7xyDby01idJTrJaPoxDg27FbOVER
 GlC8PZC5CT41IRNOfKU4mGXHnmlQxNAk3T5P1mCv+8JksrI026Ry2uGmxz01IDgpY/BY
 totA9c2Danv25Qz2OFAiHy/zmuzJd52Xc1QXEz70CK1tTAVh/N896/1iKNuwahx8C9M3
 lcDw==
X-Gm-Message-State: APjAAAWprJo7sfpnqjLxMIIoUQDZzIoBBXMTFAyjR1iuMk/F0m78ei4I
 6NtiepjQ7g2xlc+gSYJrk7o=
X-Google-Smtp-Source: APXvYqwFqmmoZuMLzpp2CdgpqU/Y6PmbNq9mtsGeIFqMiCoOcPTwtwgQZprXIxGRneTPRd5urObD5Q==
X-Received: by 2002:ac2:455a:: with SMTP id j26mr260852lfm.18.1560411251831;
 Thu, 13 Jun 2019 00:34:11 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 g19sm467822lja.9.2019.06.13.00.34.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 00:34:11 -0700 (PDT)
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20190528103313.1343-1-jgross@suse.com>
 <20190528103313.1343-14-jgross@suse.com>
 <c2fcade8-8cad-9f02-0f1b-35e0b156ff72@gmail.com>
 <bdc2b540-3218-ffb2-04ce-ea1acdab25c2@suse.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e38e96d2-1de4-2ae0-e31a-adb96eaa07ce@gmail.com>
Date: Thu, 13 Jun 2019 10:34:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bdc2b540-3218-ffb2-04ce-ea1acdab25c2@suse.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 13/60] xen/sched: move some per-vcpu items
 to struct sched_unit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxMy4wNi4xOSAxMDoyOSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPiBUaGFua3MgZm9yIHRo
ZSBoZWFkcyB1cCwgYnV0IEkndmUgcmViYXNlZCBhbHJlYWR5LiA6LSkKCk9oLCBncmVhdC4gSSdt
IGp1c3Qgd29uZGVyaW5nIGlmIHlvdSBwdXQgaXQgYWxyZWFkeSBvbiB5b3VyIGdpdGh1Yj8KSSdt
IHBsYXlpbmcgd2l0aCBzY2hlZHVsaW5nIG9uIG15IHNpdGUsIGFuZCBJIGhhdmUgYSBzdHJvbmcg
ZmVlbGluZyBJIHNob3VsZCBiZSBiYXNlZCBvbiB5b3VyIHNlcmllcyA7KQoKLS0gClNpbmNlcmVs
eSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
