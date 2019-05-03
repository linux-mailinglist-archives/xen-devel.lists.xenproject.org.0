Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540BA131BB
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 18:02:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMaaQ-0007nr-Hk; Fri, 03 May 2019 15:58:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=COEE=TD=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hMaaP-0007nV-9G
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 15:58:57 +0000
X-Inumbo-ID: 5ab10a3d-6dbc-11e9-843c-bc764e045a96
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5ab10a3d-6dbc-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 15:58:56 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j20so4788712lfh.2
 for <xen-devel@lists.xenproject.org>; Fri, 03 May 2019 08:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x7pGYhhWPUQTwzqilP0vl7D7GSfDaj5iI2yGgD+Ic8o=;
 b=UlQ+qjJXy5A5unVo0DHz4Xuq+AD0nYLhUixok50JWIHTJC+Ej2Db6q3jyYRZkyRF6+
 9jDRpNtlkunjK8KfmhX9TfAD9M6RFIosrsR6aiZrfCDfFYXeJrX4Zwifgzz4a4FAkXhy
 YmY/iKkmcQNCMrc+PH6fgRQfDf7WUnJZStJk2BwF6Wj2yY5z1ip3/WhAsiVOQ+0y5PqW
 udzeC0UMm9PHRxtMvtSIqPnVkFyMtxoj4b5RdUDrc6ez04Xs1lC+z3nSr3QKEejNcQ9a
 tEpv7SxyOYGzKBZCWvjVc+5MCHp479Q9P1eTP6siSYnLP/8o/qQvVVy8HZv2JzaV0NP5
 sDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x7pGYhhWPUQTwzqilP0vl7D7GSfDaj5iI2yGgD+Ic8o=;
 b=jgGivbd5gXXc+L+WZR5yRMrU5HV6Eep5LxWTBCuoXRgORTjhYLmABgH/NtRSwl1/rd
 2L6bRIajS8A0tw6HC7lLB+je60md5kbohqAJ8gBsUmiTQ42sGzsX6u/aDHabKQ71Oc49
 DgBrwyAW2CdQPr/O/av02dvwjFwAqLUyUlpytthbI1oSjnselCzRYMRlEwpO3XqMHcxm
 LR4PToA8NKT509pRYjs/etHSQmx3IeZ5fLqfzRiKQpuKYvNx+ZxzLFrSwTUswx8mKi20
 Xfm41b6X5QQip9o1lwWFf0nMXMAjM9CJJFVnpD6NS35df/tNL5wixr2OKq8bGgNL3iDp
 pO9g==
X-Gm-Message-State: APjAAAUQ+BUufkWnTUqSOWtKRzj/jC/ObQy36PlrTp5cUtZg41YFt6I9
 X70tVZkFe7t8ueaVtS8L6fs=
X-Google-Smtp-Source: APXvYqw8bAqoLQ/g0Df33xXIFjZbxkoucJcKcMFvJ/LtUnblYKCQ+rleEaloM8q1Ws/5uwDi0bjOQA==
X-Received: by 2002:ac2:4192:: with SMTP id z18mr5477548lfh.96.1556899134945; 
 Fri, 03 May 2019 08:58:54 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 f1sm457621ljc.73.2019.05.03.08.58.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 03 May 2019 08:58:54 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-16-julien.grall@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <3cbd6b72-b1ec-4bf0-9ab1-48ec40c2acb0@gmail.com>
Date: Fri, 3 May 2019 18:58:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190422164937.21350-16-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH 15/20] xen/arm: mm: Use the shorter version
 __aligned(PAGE_SIZE) to align page-tables
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

CgpPbiAyMi4wNC4xOSAxOTo0OSwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IFdlIGN1cnJlbnRseSB1
c2UgdGhlIHZlcnkgbG9uZyB2ZXJzaW9uIF9fYXR0cmlidXRlX18oKF9fYWxpZ25lZCg0MDk2KSkp
Cj4gdG8gYWxpZ24gcGFnZS10YWJsZXMuIFRoYW5rZnVsbHkgdGhlcmUgaXMgYSBzaG9ydGVyIHZl
cnNpb24gdG8gbWFrZQoKSU1PIGl0IGlzIGJldHRlciB0byBjaGFuZ2UgYHZlcnNpb25gIHRvIGBt
YWNyb2AuIEluIG9yZGVyIHRvIHNwZWNpZnkgaXQgaXMgbm90IGEgY29tcGlsZXIgc3BlY2lmaWMg
YnV0IHNwZWNpZmljIHRvIFhFTi4KCj4gdGhlIGNvZGUgbW9yZSByZWFkYWJsZS4KPiAKPiBXaGls
ZSBtb2RpZnlpbmcgdGhlIGF0dHJpYnV0ZToKPiAgICAgIDEpIE1vdmUgaXQgYmVmb3JlIHRoZSB2
YXJpYWJsZSBuYW1lIGFzIHdlIGRvIGluIG90aGVyIHBhcnQgb2YgWGVuCj4gICAgICAyKSBTd2l0
Y2ggdG8gUEFHRV9TSVpFIGluc3RlYWQgb2YgNDA5NiB0byBtYWtlIG1vcmUgZnV0dXJlLXByb29m
Cj4gICAgICAzKSBNYXJrIHN0YXRpYyBwYWdlLXRhYmxlcyBub3QgdXNlZCBvdXRzaWRlIHRoZSBm
aWxlIChpLmUgYW55Cj4gICAgICAgICBwYWdlLXRhYmxlcyBvdGhlciB0aGFuIGJvb3RfKiBhbmQg
eGVuX2ZpeG1hcCkuCj4gCj4gTGFzdGx5LCBzb21lIG9mIHRoZSB2YXJpYWJsZXMgdXNlIF9fYXR0
cmlidXRlX18oX19hbGlnbmVkKFggKiA0MDk2KSkuCj4gSG93ZXZlciB0aGlzIGlzIG5vdCBuZWNl
c3NhcnkgYXMgcGFnZS10YWJsZXMgYXJlIG9ubHkgcmVxdWlyZWQgdG8gYmUKPiB0byBiZSBhbGln
bmVkIHRvIGEgcGFnZS1zaXplLiBTbyB1c2UgX19hbGlnbmVkKFBBR0VfU0laRSkuCj4gCj4gU2ln
bmVkLW9mZi1ieTogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4KVGhvdWdoOgoK
UmV2aWV3ZWQtYnk6IEFuZHJpaSBBbmlzb3YgPGFuZHJpaV9hbmlzb3ZAZXBhbS5jb20+CgotLSAK
U2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
