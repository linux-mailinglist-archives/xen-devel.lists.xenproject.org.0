Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0290B30019
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2019 18:21:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hWNlf-0005pf-1R; Thu, 30 May 2019 16:19:03 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dPnK=T6=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hWNld-0005pY-VM
 for xen-devel@lists.xenproject.org; Thu, 30 May 2019 16:19:02 +0000
X-Inumbo-ID: a1b4cc20-82f6-11e9-8980-bc764e045a96
Received: from mail-lf1-x142.google.com (unknown [2a00:1450:4864:20::142])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a1b4cc20-82f6-11e9-8980-bc764e045a96;
 Thu, 30 May 2019 16:19:00 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r15so5480725lfm.11
 for <xen-devel@lists.xenproject.org>; Thu, 30 May 2019 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1hddBm62Dc5fuSs1Ba1432nV2h3wqZzHmr6zqfBCCP0=;
 b=hVj5VMjNeeVvSICB0mfO2g1uwZ2HJF/pGfCQc2FXGT1oVVdehyEpjCKLUYXwZ6i6Ir
 q/qXe7CBo6hTW1h588pfmfMdT24N6FWCQWJ/RLoh925cdj0uoT8GUGcxoJjtlpmW6o46
 ZMhWup6InT+Ya+mhh/KFQdiR28keJ2snNspZN2SJQzFUABLFaTGGiQT6pXGSVGIMYfFU
 FA0S00Km645O1JlWMesrWPpJpoQEOZD3NcfFM/Y1+NicmnQyemBg28I8VTmc5di1R+ac
 Kdr0OnZ0rPzXtDtl4FjdkBetcH7r2tQRT18diQrJWHvZAZnB//oZlF2KOgLHAXSo+ED9
 KA3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1hddBm62Dc5fuSs1Ba1432nV2h3wqZzHmr6zqfBCCP0=;
 b=ce7JOrivmBO3OrBOirARDZx8h3Po578Fr3jlRrRCPw40Mk2KYuD7Kpd4mRqqpKuBM8
 2uDwYhNFymOu+GFdwg8SZqX5kq4nNNttrAAjNuGHRv+BjKvFrBMFYzG/E3zjUoRIeSv2
 JQf6gyMSqZKMhOCKNeR48sDBlyBIAaN2Ol0pv+FH6M22IxTDq4fORKGBxxVG72FSt+nO
 hZ8bqJIUM3v3jCo8R8mkZubI6GtUi0MWJad+A+JoAhsUsBDE2rQOU0a6MVMR5s46A4RK
 h6Aq1pKhDal1aIAEJYLUnGVWtPENXGn0/7Gyl4jHzWIKkpYdFGv63mZiTH5q904sqzwe
 g2Ng==
X-Gm-Message-State: APjAAAXb2HLxNojyQf2sRvonzZL1yGhon3oFgz4TQPmSXK2Pw9nsM0LV
 RC4w9T52Bcf1OKFXZ5Jg+CI=
X-Google-Smtp-Source: APXvYqwWyY34jZSc8zbr60uaAyj87UnzWGmh+LflJZMeFrGo0ZjTsbQNbcNkerdSDyqQ8EKqIfCICg==
X-Received: by 2002:a19:22d8:: with SMTP id i207mr2438265lfi.97.1559233139226; 
 Thu, 30 May 2019 09:18:59 -0700 (PDT)
Received: from [10.17.180.71] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 n18sm637929lji.63.2019.05.30.09.18.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 09:18:57 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20190514122456.28559-1-julien.grall@arm.com>
 <20190514122456.28559-7-julien.grall@arm.com>
 <alpine.DEB.2.21.1905201527460.16404@sstabellini-ThinkPad-T480s>
 <d91870a5-e8d5-2f6d-b8f5-839c9f206fab@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <1a24c6e0-d3be-ea0d-d848-565b2a1a3c55@gmail.com>
Date: Thu, 30 May 2019 19:18:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d91870a5-e8d5-2f6d-b8f5-839c9f206fab@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH MM-PART2 RESEND v2 06/19] xen/arm: Rework
 secondary_start prototype
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
Cc: xen-devel@lists.xenproject.org, Andrii_Anisov@epam.com,
 Oleksandr_Tyshchenko@epam.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

CgpPbiAyOS4wNS4xOSAyMDowNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IEhpLAo+IAo+IE9uIDIw
LzA1LzIwMTkgMjM6NTYsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90ZToKPj4gT24gVHVlLCAxNCBN
YXkgMjAxOSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+Pj4gTm9uZSBvZiB0aGUgcGFyYW1ldGVycyBv
ZiBzZWNvbmRhcnlfc3RhcnQgYXJlIGFjdHVhbGx5IHVzZWQuIFNvIHR1cm4KPj4+IHNlY29uZGFy
eV9zdGFydCB0byBhIGZ1bmN0aW9uIHdpdGggbm8gcGFyYW1ldGVycy4KPj4+Cj4+PiBBbHNvIG1v
ZGlmeSB0aGUgYXNzZW1ibHkgY29kZSB0byBhdm9pZCBzZXR0aW5nLXVwIHRoZSByZWdpc3RlcnMg
YmVmb3JlCj4+PiBjYWxsaW5nIHNlY29uZGFyeV9zdGFydC4KPj4KPj4gSXQgaXMgY2FsbGVkICJz
dGFydF9zZWNvbmRhcnkiIHJhdGhlciB0aGFuICJzZWNvbmRhcnlfc3RhcnQiLiBQbGVhc2UgZml4
Cj4+IHRoZSBjb21taXQgbWVzc2FnZS4gVGhlbiB5b3UgY2FuIGFkZAo+IAo+IFdob29wcywgSSB3
aWxsIHVwZGF0ZSBpdC4KPiAKPj4KPj4gUmV2aWV3ZWQtYnk6IFN0ZWZhbm8gU3RhYmVsbGluaSA8
c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4KPj4KPj4KPj4+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBH
cmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpGV0lXLCB3aXRoIHRoZSBuYW1lIGZpeGVkCgpS
ZXZpZXdlZC1ieTogQW5kcmlpIEFuaXNvdiA8YW5kcmlpX2FuaXNvdkBlcGFtLmNvbT4KCgotLSAK
U2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
