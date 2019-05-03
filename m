Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5296C131AB
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYL-0006jv-V7; Fri, 03 May 2019 15:56:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYK-0006jS-BZ
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:56:48 +0000
X-Inumbo-ID: 0d969715-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 0d969715-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:56:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id s7so224577ljh.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=55K2F/Nlw1WrjGj9aRFwz++pf1Np9wvmaPxGYxmJ7rU=;
 b=PGaOhYgsBMCAfoP8qrm6kHuH3bZAdnkNsbeEcnzvJz6/Jduj6XSvZSGvFAl/BxFMRC
 ocowE/g6Gez3ujLd1PP2h+V70tZf+8RbA5uTl5fsaEFgpK+/amQG112eLccZgkFoblP2
 kYQXwgAoUpV3GB7YiqQeTvI40o4VaXagjx9sKf/H2HatWwDyiDtJZOYRKwpuhErt6tjb
 pvfTIXDHFDABlT5+4VC44qoQ6D2g2HotyrxXxBDKGnREvctOatMt67V2TuChdOSTfyey
 EWLjG/kBgEWVzp2nXQkzoD1QCOOb+cULCbv7lsgTJdaC/ao9LJ2lr/UajNoLTMWsj6N+
 1F2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=55K2F/Nlw1WrjGj9aRFwz++pf1Np9wvmaPxGYxmJ7rU=;
 b=dr6qWqNdI9kSCHl/5KSKrVQS2A+wuPMb3zX0I3PFKczP0YCXgz/E0tMK7sDuYT8Q84
 BTJ7z0yjF2WcMml9g6r9Arh3cc9ow9D9Funf7HSfs9JlN8TPf+tS1xn8kNjR4KtIsEYZ
 DxneMAcxtip0DFRqT8GaSfuWUe7ACkZMvty4DGULPUiWDo6g7VGvVk8/7av2ou4fU5SB
 sTxaOKi4HK0QvnMerKSiqWaSbI66SxbHOa6kijDGWoRySCEMVsVDCt++xqIbVIzwIC9G
 rEO8QfHoQzOrK5cySsg6Ttt9PhYaKGnNlMQ/x2DINFmdamF4RTFkOQ3BfwBRGPop6Qy7
 bPJw==
X-Gm-Message-State: APjAAAU2XcyCeBreod99iBvOwUkWMsTnQlTHyz3+T34+UvbLAWACon/W
 kESWdqOTPx1d4AgcTfBGAl0=
X-Google-Smtp-Source: APXvYqzjUHIPe1S7fpkQZHE/6HgsJeeYXJs9tUoPnfghVYlnn8HwO0LlX7zyIeXMZehNCqtiUydEQQ==
X-Received: by 2002:a2e:1654:: with SMTP id 20mr280249ljw.53.1556899005604;
 Fri, 03 May 2019 08:56:45 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 123sm556568lfb.81.2019.05.03.08.56.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:56:44 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-6-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <41447e74-1dab-72d3-74b7-cf5d5fabf45d@gmail.com>
Date: Fri, 3 May 2019 18:56:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-6-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 05/20] xen/arm: Rework secondary_start
 prototype
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

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBO
b25lIG9mIHRoZSBwYXJhbWV0ZXJzIG9mIHNlY29uZGFyeV9zdGFydCBhcmUgYWN0dWFsbHkgdXNl
ZC4gU28gdHVybgo+IHNlY29uZGFyeV9zdGFydCB0byBhIGZ1bmN0aW9uIHdpdGggbm8gcGFyYW1l
dGVycy4KPiAKPiBBbHNvIG1vZGlmeSB0aGUgYXNzZW1ibHkgY29kZSB0byBhdm9pZCBzZXR0aW5n
LXVwIHRoZSByZWdpc3RlcnMgYmVmb3JlCj4gY2FsbGluZyBzZWNvbmRhcnlfc3RhcnQuCgpXaGF0
IGlzIG5vdCByZWFsbHkgbWFuZGF0b3J5LgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBKdWxpZW4gR3Jh
bGwgPGp1bGllbi5ncmFsbEBhcm0uY29tPgoKVGhvdWdoOgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBB
bmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
