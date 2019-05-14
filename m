Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346031C6AB
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:10:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUM3-00021n-UG; Tue, 14 May 2019 10:08:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=b0nL=TO=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hQUM2-00021W-P4
 for xen-devel@lists.xen.org; Tue, 14 May 2019 10:08:14 +0000
X-Inumbo-ID: 2eca2887-7630-11e9-8980-bc764e045a96
Received: from mail-lf1-x144.google.com (unknown [2a00:1450:4864:20::144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2eca2887-7630-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 10:08:13 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id h13so11386044lfc.7
 for <xen-devel@lists.xen.org>; Tue, 14 May 2019 03:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kYLb04uJ5jbUzYu+RaCr8KShphMFY6+UI5r+0OW3k5A=;
 b=NRB+Bp9BUZC2spYR1357wbjunpX1A+v0T2Cxuv1YIKAPrJd1iiDGhmoTv4LJ/Ayywy
 xwTOqQJNRoA8dxx1L03qG+cZME5te1zZE6N9UFptvnKl9kOsAGFccjK8heyp0G9mUuhb
 V36QYJfhpsHIT9DEeIL+9eHZ/FMp0KLZcKiO/udyCANkpEv2XB0ic79OJ2b00H7H4iOr
 hDqL6JLaF7x5NIlcL6CEC9mzFEUBJzTPBRap7G5Wa7FEH2UayVgxmFvrRR/7n2EWupou
 6YN8lMnrwSOQ7faPo086ujoGoJIU1DRqXzO2Yi+bSeVxFYjjcienEqPdz+uG2tx9uzYI
 KNhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kYLb04uJ5jbUzYu+RaCr8KShphMFY6+UI5r+0OW3k5A=;
 b=h+e1ppcKKMekn6ggywVAcfSa12ysspMz7xWdn9ZRSpyHdk6ZMbVBiPJdSKV9RgsRpA
 oI4bn8awnZdVOyx47e1H8bHyLgiV2hK+Q4fewMiWTGt4F9vItbH90WF8m67+204R/4db
 U+QTkJ/7/TiacIg2xmK30ybAUJZkl8VajJZoT81yfeSxR8vcN1vsulzkRXg9LT/8oEJc
 rG8cS4k2skmaGJluus25CmLjyp/b5ul10CKKKoP6F+3+sUgyMYgkmkdzj1KrrpGI0y4o
 j+SjTTGYPJYtFV5PTkI3ktNIxsoT+5QbRDRzRhXGcAeBeOophOFkM70ghgtnKoHNXWUK
 yP3Q==
X-Gm-Message-State: APjAAAXkkhU4X6lYTISh2pw1GhZNGh/VM1DXkJEOy2UiT5BRTCMakPmc
 RIbiaxCZ0bNb2dAo79fb5uY=
X-Google-Smtp-Source: APXvYqx3mdvwGsfSyWMqxIHwUP0u9eSPyIm+dmaaKlDITp+SR5p8B5tv8hWu3JowrD4ClJZ8dB+FBQ==
X-Received: by 2002:a19:96:: with SMTP id 144mr15766604lfa.29.1557828492105;
 Tue, 14 May 2019 03:08:12 -0700 (PDT)
Received: from [10.17.180.71] (ll-74.141.223.85.sovam.net.ua. [85.223.141.74])
 by smtp.gmail.com with ESMTPSA id
 d5sm3578386lji.85.2019.05.14.03.08.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 03:08:11 -0700 (PDT)
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xen.org
References: <1556007026-31057-1-git-send-email-andrii.anisov@gmail.com>
 <1556007026-31057-3-git-send-email-andrii.anisov@gmail.com>
 <e248dae9-c91c-c735-ea16-9bcb70c65e9d@arm.com>
 <959c8975-ec44-a788-25b3-84ee17520abc@gmail.com>
 <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
From: Andrii Anisov <andrii.anisov@gmail.com>
Message-ID: <4ac886b5-ad15-f0cf-5af8-91aaf7d2460e@gmail.com>
Date: Tue, 14 May 2019 13:08:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <24f3e2b1-4889-1780-0e48-0c909f555997@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Jan Beulich <JBeulich@suse.com>, xen-devel@lists.xenproject.org,
 Wei Liu <wei.liu2@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuLAoKT24gMTQuMDUuMTkgMTI6NTgsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SSBndWVzcyB3ZSBzaG91bGQgYWdyZWUgd2hhdCB0byBpbXBsZW1lbnQgZmlyc3QuCj4gCj4gSSB0
aGluayB0aGVyZSBhcmUgYW4gYWdyZWVtZW50IHRoYXQgdGhlIHR3byBtZXRob2RzIHNob3VsZCBu
b3QgYmUgdXNlZCB0b2dldGhlci4KCkZvciBhIGRvbWFpbiBvciBmb3IgYSBwYXJ0aWN1bGFyIFZD
UFU/CkhvdyBzaG91bGQgd2UgcmVzcG9uc2Ugb24gdGhlIHJlcXVlc3QgdG8gcmVnaXN0ZXIgcGFk
ZHIgd2hlbiB3ZSBhbHJlYWR5IGhhdmUgcmVnaXN0ZXJlZCB2YWRkciBhbmQgdmljZSB2ZXJzYT8K
CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5pc292LgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
