Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346921C931
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 15:09:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQX7N-0000kL-U8; Tue, 14 May 2019 13:05:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b0nL=TO=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQX7M-0000kG-Ku
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 13:05:16 +0000
X-Inumbo-ID: e9c76f85-7648-11e9-8980-bc764e045a96
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e9c76f85-7648-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 13:05:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id z1so14248142ljb.3
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2019 06:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K+nSBd1QbKF/W9HoNSWnuc1iZLJLbjmpxXyZQ8sGiN0=;
 b=knVz9M+O5Sp42thU8YjVxSUA9iWXbA8U3dL+fiJOWFbehyEEdVH70HRDZGVvYjVwxK
 1hHdI81ayqttEcTLnt2ODEjeBDSvFIa9DIX4o8aUdPhLMI9VO6HGLzoiA9r9qio+kjT0
 0TLSv+oBV+lZbp4u9kxLhbBfhf2xAY1K92i1SaYkeBsVCQJwt50vuyO506snLIa806d5
 RsIpXbTaKYAlzc87uHBbKz0SsjbHzsWePSL0IjHGLbdkDKn9Ldo9cCYvV9FQI5YqoHnr
 iCsZ9JnMuYGqS0bFafoHVgP1H/n+Ca1g/tcWR07FZXix1if+ud/aE47Ks2V1j5f3eMha
 fDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K+nSBd1QbKF/W9HoNSWnuc1iZLJLbjmpxXyZQ8sGiN0=;
 b=j29SsMJ77dyW0HJMki63TK8DC9BdJHIQRsE2m/aB29ZoOIy6po4YkAvQAShzetr+ib
 JY9yFgagryuupPwroJu05JZpd2l+oNO77dtLHulKzKRwv1QppIKy2gKS8IOnFm5xWcuL
 Jivb4rxXzKFKNLXx5e8nS3RrzM1vGq4Labbxja8dsLHWKDuSDkTBhQRUG9ScQ1DXaVwS
 nFp7o//vkJXPhrpyBGdG158CGyZdPL89ps2Tu4kGrOy8Lt/uNrAuBh16+m+FfVLqwOK/
 qpIXqe+r4+hZmr/z/fjwOkUY5z7mSpdt9OOyKOt0k2s6Trbvxe8i0vSwAXcbK3/OqRHL
 fD2g==
X-Gm-Message-State: APjAAAVQoA7DcBUiNpswxrpid+dFwXv1XJ28S4VgH66xtZgLohkVBvGy
 dhpekawiQj3OQGYl4Tfn5Nk=
X-Google-Smtp-Source: APXvYqw7DSK/KdiO+NN1l/6KhIBMXobirLUEpqxIX2jr28w0exA7GyM8yUm+uXGhEIcc7VQxoska5A==
X-Received: by 2002:a2e:3a17:: with SMTP id h23mr12815427lja.155.1557839113701; 
 Tue, 14 May 2019 06:05:13 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 v11sm3839313lfb.68.2019.05.14.06.05.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 06:05:11 -0700 (PDT)
To: Jan Beulich <JBeulich@suse.com>
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
 <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
 <7bbea412-f4af-4dc8-199a-1c02ac02a7af@arm.com>
 <f71bdb25-ebd3-31fc-f5fc-b8d591c3cc28@gmail.com>
 <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <945c7543-7c49-f278-0b0d-5b6492ce93ca@gmail.com>
Date: Tue, 14 May 2019 16:05:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5CDAAE4F020000780022E941@prv1-mh.provo.novell.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen: implement
 VCPUOP_register_runstate_phys_memory_area
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

CgpPbiAxNC4wNS4xOSAxNTowMiwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gV2VsbCwgSSB0aGluayBK
dWxpYW4ncyBpbXBsaWNhdGlvbiB3YXMgdGhhdCB3ZSBjYW4ndCBzdXBwb3J0IGluIHBhcnRpY3Vs
YXIKPiB0aGUgYm9vdCBsb2FkZXIgLT4ga2VybmVsIGhhbmRvdmVyIGNhc2Ugd2l0aG91dCBleHRy
YSBtZWFzdXJlcyAoaWYKPiBhdCBhbGwpLCBhbmQgaGVuY2UgaGUgYWRkZWQgdGhpbmdzIHRvZ2V0
aGVyIGFuZCBzYWlkIHdoYXQgcmVzdWx0cwo+IGZyb20gdGhpcy4gT2YgY291cnNlIGlkZWFsbHkg
d2UnZCByZWplY3QgbWl4ZWQgcmVxdWVzdHMsIGJ1dCB1bmxlc3MKPiBzb21lb25lIGNhbiBjb21l
IHVwIHdpdGggYSBjbGV2ZXIgbWVhbnMgb2YgaG93IHRvIGRldGVybWluZSBlbnRpdHkKPiBib3Vu
ZGFyaWVzIEknbSBhZnJhaWQgdGhpcyBpcyBub3QgZ29pbmcgdG8gYmUgcG9zc2libGUgd2l0aG91
dCBicmVha2luZwo+IGNlcnRhaW4gc2V0dXBzLgoKIEZyb20gbXkgdW5kZXJzdGFuZGluZywgaWYg
d2UgYXJlIHNwZWFraW5nIG9mIGRpZmZlcmVudCBlbnRpdGllcyBpbiBhIGRvbWFpbiBhbmQgdGhl
aXIgYm91bmRhcmllcywgd2UgaGF2ZSB0byBkZWZpbmUgdW5yZWdpc3RlciBpbnRlcmZhY2UgYXMg
d2VsbC4gU28gdGhhdCB0aG9zZSBlbnRpdGllcyB3b3VsZCBiZSBhYmxlIHRvIHRha2UgY2FyZSBv
ZiB0aGVtc2VsdmVzIGV4cGxpY2l0bHkuCgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
