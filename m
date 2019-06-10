Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52A9F3B404
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2019 13:27:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1haIOS-0001d4-QC; Mon, 10 Jun 2019 11:23:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NKNi=UJ=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1haIOR-0001cz-SH
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2019 11:23:15 +0000
X-Inumbo-ID: 226349aa-8b72-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 226349aa-8b72-11e9-8980-bc764e045a96;
 Mon, 10 Jun 2019 11:23:14 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id k18so7546203ljc.11
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2019 04:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CUrtFnwAIhRqpeFRtQx3begz0xV9ge9AgEkmRxsiu80=;
 b=T5FCaleSkwpFLXoysidTyUbn3mBY06joCskzF0lnM9X+FNRShGca0FEXMHWT8k6VjX
 NYAdX0o6FER7+hqrKcgCZfDXZKoXeXFQjyHu3VQjmvhd8ntVHoskEHwtGvzFscn+DDsL
 lKAgTyc+JHnzwKVT4zp3m28DiDap3vED2X5F34HgFcPWZspf2OuVRBABoil23BVqFRDH
 KOOyy6sLZvLsB+vLbJHbn6tWb/7colr/85rHa3HY9y8ZY7CV2OtFyKMZovFcoQAEOXuU
 VxWSAXClFGmurZf/SftZ5JTzc8SZI30qQe/K8VTk7lxAdGQ/sCeKt7G4B/uqFEmOP5Lu
 wBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CUrtFnwAIhRqpeFRtQx3begz0xV9ge9AgEkmRxsiu80=;
 b=Y649ga3TOP2w5CvCezpJEi+e6VoLbX5tPmOHVPdr4nBqlytQpwZZxAhyWF0cfKOEkR
 1m+5FQYz9Ri3niqvUBMRr4aXkdJIMLQDwonzNhuzc2NoK50vFQ7AKGFaEnkVkEu1iQ5e
 fdZjJc6k62wyjxH4Wm74os94gVPQtkvaltBR1nvRfm+01Aep5iQN413vfYgI+f3OL7S1
 GBEpk4vfzikBvYCTcemCYEP6gJjaYdF/fcDOcXOq2lvrD2tJiPYhqiHUvLZFC8nCEkOj
 ZrL+BfdoQemnW6FmrppjDO/uxb4t5qN0fVchDU4NwCyz4yYUMjPfdhvB5yfJ+uqejc8U
 hBIQ==
X-Gm-Message-State: APjAAAX8Y0dDF7v16xonkunMfxancIMLLblqaSSDjpkMTe+70fhRF/BZ
 RvBA1Z8AwQg22B5aTnopqwc=
X-Google-Smtp-Source: APXvYqzwDc7SuS1O3A66rgsSmWRCrLym4jtvzs98Y7AaW6EwwNjY80D2+fQp31l9bfbLocHjg3IW/g==
X-Received: by 2002:a2e:2b9a:: with SMTP id r26mr20837083ljr.81.1560165792485; 
 Mon, 10 Jun 2019 04:23:12 -0700 (PDT)
Received: from [10.17.180.34] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 s20sm1929633lfb.95.2019.06.10.04.23.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Jun 2019 04:23:11 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190602102614.22640-1-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <d39a21d8-12b3-5bb9-9f09-16fba17d0857@gmail.com>
Date: Mon, 10 Jun 2019 14:23:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190602102614.22640-1-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2] xen/arm: irq: Don't use _IRQ_PENDING
 when handling host interrupt
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
Cc: andre.przywara@arm.com, sstabellini@kernel.org, andrii_anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKCk9uIDAyLjA2LjE5IDEzOjI2LCBKdWxpZW4gR3JhbGwgd3JvdGU6Cgo+
ICsgKiBUaGlzIHNob3VsZCBvbmx5IGJlIGNhbGxlZCB3aXRoIGludGVycnVwdCByb3V0ZWQgdG8g
Z3Vlc3QuIFRoZSBmbG93Cj4gKyAqIG9mIGludGVycnVwdCByb3V0ZWQgdG8gWGVuIGFueSBzb2Z0
d2FyZSBjaGFuZ2Ugb2YgdGhlIHN0YXRlLgoKU29ycnkgSSBjYW4ndCBwYXJzZSB0aGUgbGFzdCBz
ZW50ZW5jZS4gSXQgc2VlbXMgdG8gbWUgeW91IG1pc3NlZCBhIHdvcmQvd29yZHM/CgpGb3IgdGhl
IHJlc3Q6CgpSZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNv
bT4KCi0tIApTaW5jZXJlbHksCkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
