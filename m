Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B811319E
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaYg-0006sq-UD; Fri, 03 May 2019 15:57:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaYf-0006sV-Te
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:09 +0000
X-Inumbo-ID: 1a936f56-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a936f56-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:08 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id j20so4784956lfh.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b1TRdge7u80rvJzognMcXVBaxvcdtwy4Y2Rs7iLgINQ=;
 b=NngrdctPyienY+4YBmPG2kKXDSp5TRznGnLZeJFlqEUuTeerqDqSaDGxn4G7R08I+7
 8aTNanHB3wLKOeBosAvL/R1+OZp9OpVO7pLTUvBLaLgNampTS9JCY44Wngor1o1QQ8V/
 NuHQbI7PPXTnoRtuuQcVofsFGcinDMdLHyu6q4aqXGF1L7pplIBiMPs3aoSe/1zzSAud
 R2HOYuxSVkav1tqY2eAjDws0OXrzsjiHtFBe1UUgUBZBHDnnLJNDKjI7rCKNXQbGFuRc
 r/UJJNbDYnCswBfPfE3Jhay/ngGl6N+ZSzfswQ6bdAM2I4S9XcdGpnuZZjypPh+9Vt/e
 JlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b1TRdge7u80rvJzognMcXVBaxvcdtwy4Y2Rs7iLgINQ=;
 b=Y/wscYbzsn7C8+A/YjdGm57O8Z3w5+CZI48sY3NYP+Fzsu/7lSW88KsiLpFqw53U85
 UZcK58SK494ZthIqc1FOPyxoa2FdFgPVGi4Z+ILut3pww9ObEoElcQxIN1NFnSQAWnEt
 MjDaMi1Xl3VtdMDTJorMch3X+ZoZz56caCZ/mf2vtIuG7Sv6ywOal3pbpSE6seHU2OdP
 kJ8RwdMZZ4g1HJqxHQCahZwGhmxBtQpa+trryzBGDdMTP6zv8E1TxQbDfuJPp9k1oqMC
 AShFNDt1A5IgahQU/kJNYRy4Gol0bugA5kXEOIf6jdANQGXjYit2KqmB+ViaOsUoJrOL
 TdYw==
X-Gm-Message-State: APjAAAVeNOcIxM5dDvkQy0XCWvrWvQUTYRKzD0H1axf4/yPGwBryj2kU
 md8aApxKCJ1aaeSL4mv7Qh8=
X-Google-Smtp-Source: APXvYqzSfoIf0vEwpqB+x8WbJbbjWIqlUGfc38Kvxqkk7JVeMBABSWM9Z9U5nASA21JYOhHnzYE92w==
X-Received: by 2002:ac2:4567:: with SMTP id k7mr5622252lfm.166.1556899027403; 
 Fri, 03 May 2019 08:57:07 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 j13sm495955lfb.34.2019.05.03.08.57.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:06 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-9-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <3ba51ec0-50d9-adff-f8a9-15b6e704f875@gmail.com>
Date: Fri, 3 May 2019 18:57:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-9-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 08/20] xen/arm64: head: Move earlyprintk
 messages in .rodata.str
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

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDQuMTkgMTk6NDksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBB
dCB0aGUgbW9tZW50LCB0aGUgZWFybHlwcmludGsgbWVzc2FnZXMgYXJlIGludGVybGVhdmVkIHdp
dGggdGhlCj4gaW5zdHJ1Y3Rpb25zLiBUaGlzIG1ha2VzIG1vcmUgZGlmZmljdWx0IHRvIHJlYWQg
dGhlIG9iamR1bXAgb3V0cHV0Lgo+IAo+IEludHJvZHVjZSBhIG5ldyBtYWNybyB0byBhZGQgYSBz
dHJpbmcgaW4gLnJvZGF0YS5zdHIgYW5kIHVzZSBpdCBmb3IgYWxsCj4gdGhlIGVhcmx5cHJpbnRr
IG1lc3NhZ2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBHcmFsbCA8anVsaWVuLmdyYWxs
QGFybS5jb20+CgoKUmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBh
bS5jb20+CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
