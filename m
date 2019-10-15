Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7798D74F1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Oct 2019 13:29:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iKKxA-0002Dd-Cq; Tue, 15 Oct 2019 11:25:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wbPI=YI=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1iKKx8-0002Ct-No
 for xen-devel@lists.xenproject.org; Tue, 15 Oct 2019 11:25:22 +0000
X-Inumbo-ID: 791e6774-ef3e-11e9-bbab-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 791e6774-ef3e-11e9-bbab-bc764e2007e4;
 Tue, 15 Oct 2019 11:25:21 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id w67so14188547lff.4
 for <xen-devel@lists.xenproject.org>; Tue, 15 Oct 2019 04:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=v8jSXlddlDr/LN2j7SkX3MiB4JF1gGmH/gPfVwWEXFQ=;
 b=TX2ISSh17NTj6p+jeH8x7y3uDdG5lKQvrpmAI7OSE4AavDpl35fBPCg58OujAe+48b
 12YqRJ/FR1XvFtiHa/5dCinlp4rr8HxPA9f1+aHPaKtwrm+L5WiiJQoFJultZ1wHHGT4
 YPWcz559kvSf/kb4qVg+rAG3+e24WV2vxjrp1BIEmaJqCFPthMWKmGWCfnq1I58b2ZLR
 MOUbaazia6IF6fSnXKPHhcTe5tnZ7phgXv47PENugDXK6xqg0anZpjUUmOjOXXDI56kF
 1yGt06U0hBtlRh8WQR9+SF92LjaQg8hNQ0azGsOJAZditJCM/yvmM0NU8cydvBo3HtQU
 RMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=v8jSXlddlDr/LN2j7SkX3MiB4JF1gGmH/gPfVwWEXFQ=;
 b=pma7dLsMq1Kg6aOLYM7Sof1F9BcyNW9Oe19HT9g8DudI5xAvAdcJDmKroEsvAEyJlZ
 a+nCERey48nVVv9xzG8lKjqV0igaAkBtjfN0C+O8pgj38VpsGSrVn/TIyx1R8jBqJD1B
 PMFfiHqQbkY6v1pZ5slBwYKIjaZKjeuosFSff9Jf5RZdFLjIlmgHYrA3IMgsL+53J338
 wiZfcQTTTnmsCu/v5GrQsIlQlywmnFH9qPYAgpO9wXTj9H938o+fh/P9NosJdki14pd4
 sz0ohilDzulFe5ixgjfIQQJ/LAW9hLEAzDi/qD657obyZkEZuozb/3bf93ffBL5OWXL5
 lyfA==
X-Gm-Message-State: APjAAAU+wT9gbqhlYb4Sh73R6S4xX6Qsc6yutMzuy6+LkT4f0VLa54wU
 ia4BHRC+kFHUCmTR7Mf3Sxc=
X-Google-Smtp-Source: APXvYqzQhl6DrJ9Onoj4VpwY3UnoqoZpbtRemM2mgcbAlAQFvhBWNzK8nVgsUWhjyrqYNfizhvV42Q==
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr20878423lfn.16.1571138720425; 
 Tue, 15 Oct 2019 04:25:20 -0700 (PDT)
Received: from [10.17.180.84] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 x17sm4847092lji.62.2019.10.15.04.25.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Oct 2019 04:25:19 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1571133668-5875-1-git-send-email-andrii.anisov@gmail.com>
 <3392506d-aa99-0f71-8780-0b9fc3cce29d@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <98e5aa09-dfa1-51b4-fea0-4cca0e62a179@gmail.com>
Date: Tue, 15 Oct 2019 14:25:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3392506d-aa99-0f71-8780-0b9fc3cce29d@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] arm/gic: Make sense of assertions
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
Cc: Andrii Anisov <andrii_anisov@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8sCgpPbiAxNS4xMC4xOSAxNDowOCwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFRvIGJlIGhv
bmVzdCwgdGhvc2UgQVNTRVJUSU9OcyBhcmUgcG9pbnRsZXNzLgoKSSdkIHByZWZlciB0byBkcm9w
IHRoZW0uCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
