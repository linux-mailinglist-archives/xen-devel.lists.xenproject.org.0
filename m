Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C111C6D147
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 17:45:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho8YP-0005Sv-B6; Thu, 18 Jul 2019 15:42:45 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nWwS=VP=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1ho8YO-0005Sl-1I
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 15:42:44 +0000
X-Inumbo-ID: adea87a5-a972-11e9-8980-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id adea87a5-a972-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 15:42:43 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id d24so27820730ljg.8
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2019 08:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Wnh7LZKE8ujSsXr3CaCf5a8h5u0j2txAHrXFQ1aIVLo=;
 b=bX9ONb1+GNRoWFTl11/sS7o7EiyYCxb9swfWCP+jfVgpGVcbWDiTUn55N81EGFHVER
 kneeV5kywM307vNUeviEC+IKvgMDVbJ8VOrpfIGpmbH9R6TClxzhy3C2ybD2NSqV9HPf
 v3x46uiBVpj4awpWXCWrPiuibz8pOx1D7Y6moe4lvf8la+taq5LKi0tjwWhVNH/9Gyir
 uxtVg6NDqn7Pk1GiGnuBIZ8AxdktLXAif5OtDd93H4/6a0b/pwG8v6o+bsGPODUcquoS
 tA9yC9Fev5Cg8fk1PGicxcOGkh4HILbfyHga+K/xzzhKQYVodG/p6ReQs0jJLJL8Pj5J
 1Trw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Wnh7LZKE8ujSsXr3CaCf5a8h5u0j2txAHrXFQ1aIVLo=;
 b=U0hMGpYTHRN2IELHwJmsB3uiuKMn9wd7sxyyWBgBO6IIyXn7nTN/oAJckcbyIAY2mT
 hdJqUp0HxDzwIZNtNcB5B4zKpkWm1TJ7zdcJsOxoVf3iBphgiS/y7AUulD+43N6ojglJ
 eHmW/+80MMk6oYYZSvkSMEwNUjIDYCZGuFjXb9+JJ23TdqTQWK5I40cnr2x1cLef7hR3
 7jvU1h5Tx4NYXA9XSLi0uizPUZKayJNSNrqnm8da8lcofIb4Pdru0r1ieMJAgq5u1dCC
 NBt5FPJgwWvHQ75R4dLu2MrHStCSt82CT1z5wWOAFv/61bPxn5gxMqhEtud5Z02uaxTN
 Bqdg==
X-Gm-Message-State: APjAAAWv4fuKuBCTZ2gpgDjNaIvvI1J48uS/EVFlIApz4m7xkxWMkTYJ
 sYL4VD2TdIE/XZnTLqVqNI/9yrNE
X-Google-Smtp-Source: APXvYqzQzb3+C4H9HfMa+gl0qA60tVHreSIYm8sQQJ592jrJ1bpJni+7C0DwnmTkMzEePfH8seOboQ==
X-Received: by 2002:a2e:8602:: with SMTP id a2mr23496805lji.206.1563464560937; 
 Thu, 18 Jul 2019 08:42:40 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 q22sm5218841lje.75.2019.07.18.08.42.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 08:42:40 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <1563456140-12180-1-git-send-email-andrii.anisov@gmail.com>
 <c6f154b8-34a5-9b23-6761-1a10680dc486@citrix.com>
 <401358d0-38d3-a881-e020-01934f18b193@citrix.com>
 <e61ddba2-f6b9-b452-c22e-361bc3b8afed@arm.com>
 <40da96a0-1da9-0705-b1ea-58737f05be8f@gmail.com>
 <b3c46ea8-2201-fe21-f1a3-23334dbf3da8@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <e37c5fde-cc0c-4cc4-4f7f-f78af6a5e19f@gmail.com>
Date: Thu, 18 Jul 2019 18:42:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <b3c46ea8-2201-fe21-f1a3-23334dbf3da8@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm:cpuerrata: Align a virtual address
 before unmap
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
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>, xen-devel@lists.xenproject.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAxOC4wNy4xOSAxNzoyMCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEFzIEFuZHJldyBwb2lu
dGVkIG91dCwgdGhpcyBhbHNvIG1ha2VzIHRoZSBpbnRlcmZhY2UgbW9yZSBjb25zaXN0ZW50IHdp
dGggaG93IHssdW59bWFwX2RvbWFpbl9wYWdlKCkgY3VycmVudGx5IHdvcmtzLgoKT0ssIGdvdCBp
dC4KCkJUVywgaW4gdGhlIHg4NiBjb2RlIHRoZXkgZG8gYXBwbHkgUEFHRV9NQVNLIHRvIHZhIGJl
Zm9yZSBwYXNzaW5nIGl0IHRvIGB2dW5tYXAoKWAuIEkgd291bGQgY2xlYW51cCBhbGwgdGhvc2Ug
cGxhY2VzIGFzIHdlbGwuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
