Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B1814A31
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2019 14:50:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hNd2u-0007Tx-Oh; Mon, 06 May 2019 12:48:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNd2t-0007Tf-K7
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 12:48:39 +0000
X-Inumbo-ID: 441820ad-6ffd-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 441820ad-6ffd-11e9-843c-bc764e045a96;
 Mon, 06 May 2019 12:48:38 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id u27so8769807lfg.10
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 05:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3YwvNDa/xI92TXGskeWmGlpqnAMnaKZt8EaUN/Iluqc=;
 b=Ug8vDhWYMgZkOeIJdvPTWCqKcMJiDjo9M8c+yaapIUmm4/CERfef9eaRyI8t/cQhiY
 wRcqPrmXyUlBZvTk3jMcLqsPQauD4vHaFEGBk5ilqXOvsGjdy0PmC2Ccypq+d59sArsE
 JPtW86b4ftHFv3e7CiuLpnSYhkSeSovmEJEJDoIHdYly486ucTRBvLkAb/bgtqgrFb63
 TAIhX0E3KjNxpaSed94/gdO6+/lbnv8t54iMqyB6LOYYSLMowRGd0bPFLdJqbBk51bKQ
 oQJbylyoP3lbMXK1tGf7zZEVx6D2eR2zFXDDv6sxymeMWtJlhZrDA+NW7/G5kivMWJOL
 yYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3YwvNDa/xI92TXGskeWmGlpqnAMnaKZt8EaUN/Iluqc=;
 b=TAzv8CR0qxCRa6mi8c3arOsg1GQIdpcrFu/feaZ+cghf5AS5Dq1fleQQR1g/a5LWJQ
 vlN+WR9kCrgANBktgK8POc4z5YUzsQIg8s0gLN7EgHeWB53+qcfg8nZJ8dSCBr2zcZQJ
 KmNokf7d16AJxGHq+5sL7A8F81zZTjlQPfVKfpMqI2JKGdeE6/sYnDUOqHPJ+8gKd6RO
 L4cWnuQsi+5EXGuSB6mh686+wf/4O5xDeuG+Su7xC1I2urQznyNrBCv+LzyJd7GOtNx4
 uF3WhTuQX4WuetYDTtCNn2STpAHxjFd8F44XZgSobUUkbWBAlo5qIDF2Xxu7AL87kJxJ
 3o2A==
X-Gm-Message-State: APjAAAUKcbny3cbwtMfvQFQHoheZqzdjmOKjFTZIg69fM5qJK5kPeuYO
 OP4WVGCOyj3oXWm+bIEOVIQ=
X-Google-Smtp-Source: APXvYqwGDHkrXi5FPJ5KUq098A9ROGHVtk8uB3WSOw5Ee516AqWgNIY+bJ9eViAe9kqmTtIXLew4mA==
X-Received: by 2002:a19:2d1a:: with SMTP id k26mr11676270lfj.104.1557146916668; 
 Mon, 06 May 2019 05:48:36 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 t17sm2389639lfp.82.2019.05.06.05.48.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 May 2019 05:48:35 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190424165955.23718-1-julien.grall@arm.com>
 <20190424165955.23718-8-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <f895a2cf-fb8c-6a3a-e10b-8696123b452c@gmail.com>
Date: Mon, 6 May 2019 15:48:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424165955.23718-8-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 07/12] xen/arm: mm: Rework
 xen_pt_update_entry to avoid use xenmap_operation
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org,
 Andrii_Anisov@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyNC4wNC4xOSAxOTo1OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdpdGggdGhlIG5ld2x5
IGludHJvZHVjZWQgZmxhZ3MsIGl0IGlzIG5vdyBwb3NzaWJsZSB0byBrbm93IGhvdyB0aGUgcGFn
ZQo+IHdpbGwgYmUgdXBkYXRlZCB0aHJvdWdoIHRoZSBmbGFncy4KPiAKPiBBbGwgdGhlIHVzZSBv
ZiB4ZW5tYXBfb3BlcmF0aW9uIGFyZSBub3QgcmVwbGFjZWQgd2l0aCB0aGUgZmxhZ3MuIEF0IHRo
ZQoKSSBzdXBwb3NlIGl0IHNob3VsZCBiZSAiYXJlIG5vVyByZXBsYWNlZCB3aXRoIHRoZSBmbGFn
cyIuCgo+IHNhbWUgdGltZSwgdmFsaWRpdHkgY2hlY2sgYXJlIG5vdyByZW1vdmVkIGFzIHRoZXkg
YXJlIGdhdGhlcmVkIGluCj4geGVuX3B0X2NoZWNrX2VudHJ5KCkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KPiAtLS0KCgpSZXZpZXdlZC1i
eTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCi0tIApTaW5jZXJlbHks
CkFuZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
