Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C664B131A7
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 17:59:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaZA-0007BU-4r; Fri, 03 May 2019 15:57:40 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaZ9-0007Aq-2z
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:57:39 +0000
X-Inumbo-ID: 2c239a80-6dbc-11e9-843c-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2c239a80-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:57:38 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z26so831745ljj.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kFoa9dfxgaMOprS6/k2DwKVS5WyYzTKNRIP9Kb4NulU=;
 b=YN4sLjynmN90ffLAezSS40nQCH+dnLZdkbKYPPdfuEzIdjKT94ohmOWfg1JjszUJxu
 42/W1MQQyac2uHTGX8xX2+Q/ELm0zJ8dwHSRjGLHec5WNMUNvltkEgLjfEJ14VjRu9u4
 W3O17M0i37ZYliq0CsGUWCgHuSVN6+Ixj9RpUa1HWmsqwmmY79nEzzRjIvP+tCRnNogw
 U+JIEeQ2ogt/Bv8eugj+udt0YJa7eYLvxZewiY2nhfCRS57/maWn3nBoAvuJZYYeAcxp
 5IFsOSMXg0ilV+haLmpqC0Op8vsCIo3enoXbpXYRihlfs3ZO4yve5rRv9NEmiW+SrhyR
 q7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kFoa9dfxgaMOprS6/k2DwKVS5WyYzTKNRIP9Kb4NulU=;
 b=pAb5crX2QyIuMbDL/P0ARFmNe+sV4+iROcWubdWjXTle7Us+DbiJ82XwF2aEhOleTy
 bXKmSWJSrFa6Rix+IRxOWTMb1UaSq+BE+sDIJn+OiPmlwVjP/MLaYaE9vjDN1AQU1sXy
 fNqECamLfbpIkd9tuUn/YWzDR9IGEnyUdggAQ3a2am5zy/5G4oPlofKbGvED8MTcg/WT
 rqocFONi670dRJLBuH2RwcksYznh6H9yRU9vMcn94+KP9jt2AE0hlEnnp1agiUg2LqGo
 d0XIhP9C+Cdy0a4Bd8EfXUvut86xPN5RSYhBwobSQzlsqv6WXioDupH9WhVdje/yWTQ6
 KJaw==
X-Gm-Message-State: APjAAAWZOJpmcRT8215hxhuqDcmHimwMplIth5jRzfKXpYTlFbpVtyj5
 Z++SHfWVaXzox9vkE+tFEMc=
X-Google-Smtp-Source: APXvYqyODoG920RZtsOF64CLCPkMuZztu0RJnzwI70wfz3FLRIeFeMpxFW8EOFX82Pblx+nEj/ZBpg==
X-Received: by 2002:a2e:984d:: with SMTP id e13mr4745461ljj.61.1556899056822; 
 Fri, 03 May 2019 08:57:36 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 f15sm499308lfm.43.2019.05.03.08.57.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:57:35 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-15-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <a3a0dd62-d4e8-1acd-43ac-6e9ba1563515@gmail.com>
Date: Fri, 3 May 2019 18:57:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-15-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 14/20] xen/arm32: mm: Avoid cleaning the
 cache for secondary CPUs page-tables
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRoZSBwYWdlLXRhYmxl
IHdhbGtlciBpcyBjb25maWd1cmVkIHRvIHVzZSB0aGUgc2FtZSBzaGFyZWFiaWxpdHkgYW5kCj4g
Y2FjaGVhYmlsaXR5IGFzIHRoZSBhY2Nlc3MgcGVyZm9ybWVkIHdoZW4gdXBkYXRpbmcgdGhlIHBh
Z2UtdGFibGVzLiBUaGlzCj4gbWVhbnMgY2xlYW5pbmcgdGhlIGNhY2hlIGZvciBzZWNvbmRhcnkg
Q1BVcyBydW50aW1lIHBhZ2UtdGFibGVzIGlzCj4gdW5uZWNlc3NhcnkuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KClJldmlld2VkLWJ5OiBB
bmRyaWkgQW5pc292IDxhbmRyaWlfYW5pc292QGVwYW0uY29tPgoKCi0tIApTaW5jZXJlbHksCkFu
ZHJpaSBBbmlzb3YuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
