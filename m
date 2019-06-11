Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B30103D1FC
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2019 18:15:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hajOZ-0001FX-Sa; Tue, 11 Jun 2019 16:13:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XVUa=UK=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hajOY-0001FQ-5a
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2019 16:13:10 +0000
X-Inumbo-ID: cd030bd0-8c63-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id cd030bd0-8c63-11e9-8980-bc764e045a96;
 Tue, 11 Jun 2019 16:13:08 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y198so9769665lfa.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Jun 2019 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OAPrQ0MmMhyDhkuS2BwvdvKA0MKxf24Zw9LU1jqsmdg=;
 b=TLPzTf5uN1+WjABRurFCAq5TFbyHMsQBH0Z0fc4Ayh3TW72LAlW6wREXMWZ3gn8bl5
 dXLTkt3GKgTWmH0KLT0VMUJw/xBCiPyxQRSyBQ0PAQF5l2KWsKTNTEVSRluCRkUcTKnb
 IuXp/i+AM3hH/pjASBPhHa4gnkEkZSY082SoPgwvTzfk8//nMwegbyYDsDnkfSyhbD9X
 SX7aMel5EP5UFSWMTRNEwhI3zPmTAPGC9MpStsCNc6ltpJiWHSTsrdVCaKcmJDUR13Wy
 47kb1R8yML01pSClshjD+PvMz/qdWPPVgJo9ZrwSlzrgYiMjUFrx3PC4Y8aXT+p3vEJn
 koxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OAPrQ0MmMhyDhkuS2BwvdvKA0MKxf24Zw9LU1jqsmdg=;
 b=a4ZjUfWleqp33fQ56lV53GWFJwGjGaSBPG744ydX2uLEGPkDfREe+UCY17UmzAyeHJ
 8ZdsWmgvlNvlf5Lkhn7nnuLJTScwr0a99uUYLfEUWXwfjuGkYRR+Hom6CvbeMmyHKhEk
 +F5gVSYsicYWY5ysNo+rA9r5y/gJWnO6qzerKlVxgsqVmJSAWcj9T8aEMeb9t+JHtdug
 TWYEllAbfVH3s0BUs19736oRwarSB3vaqQxmYTKWn+uITmIiG5+M8uisIYlbwPY+P6Gs
 40akCrcyl3oRx29SBfLSD6WDikRGRu0lJjIKFzglT10jH3QhxY8sC9TQ7NSfNc41UExk
 iGBg==
X-Gm-Message-State: APjAAAWeU8FlqArLue7L8y+aodEoV/mGN6vZQHm/3ZxXd/EL6hc2LW66
 gtnEBdjwd2rLpl70FzaneIvjf4vX56FP2A==
X-Google-Smtp-Source: APXvYqyOc4CjNTqBpUNrgn2S+Kr7j2GiFRkz76xARjJJietFExmYimyU9AI5u53NKXPs5E6o/kSZrA==
X-Received: by 2002:ac2:5b0c:: with SMTP id v12mr24868663lfn.184.1560269587585; 
 Tue, 11 Jun 2019 09:13:07 -0700 (PDT)
Received: from [10.17.180.34] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 s20sm2575716lfb.95.2019.06.11.09.13.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 09:13:06 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1558721577-13958-1-git-send-email-andrii.anisov@gmail.com>
 <1558721577-13958-3-git-send-email-andrii.anisov@gmail.com>
 <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <75fd0757-47cf-6599-48e1-41f698524464@gmail.com>
Date: Tue, 11 Jun 2019 19:13:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <5CFA734902000078002364C0@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v3] xen: introduce
 VCPUOP_register_runstate_phys_memory_area hypercall
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 "andrii_anisov@epam.com" <andrii_anisov@epam.com>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

U29ycnksCgpNaXNzZWQgb25lIGNvbW1lbnQKCk9uIDA3LjA2LjE5IDE3OjIzLCBKYW4gQmV1bGlj
aCB3cm90ZToKPj4gK3N0YXRpYyB2b2lkIHVwZGF0ZV9ydW5zdGF0ZV9ieV9ncGFkZHIoc3RydWN0
IHZjcHUgKnYpCj4+ICt7Cj4+ICsgICAgc3RydWN0IHZjcHVfcnVuc3RhdGVfaW5mbyAqcnVuc3Rh
dGUgPQo+PiArICAgICAgICAgICAgKHN0cnVjdCB2Y3B1X3J1bnN0YXRlX2luZm8gKil2LT5ydW5z
dGF0ZV9ndWVzdC5waHlzOwo+IAo+IFdoYXQncyB0aGUgY2FzdCBmb3IgaGVyZT8KClNlZW1zIHRv
IGJlIG5vdCBuZWVkZWQuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
