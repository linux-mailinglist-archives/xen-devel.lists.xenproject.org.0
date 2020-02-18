Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CE162D3E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 18:43:40 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j46qh-0003fn-Qp; Tue, 18 Feb 2020 17:39:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6oMY=4G=linaro.org=richard.henderson@srs-us1.protection.inumbo.net>)
 id 1j46qg-0003fi-68
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 17:39:54 +0000
X-Inumbo-ID: aba445de-5275-11ea-bc8e-bc764e2007e4
Received: from mail-pj1-x1044.google.com (unknown [2607:f8b0:4864:20::1044])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aba445de-5275-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 17:39:53 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id m7so826450pjs.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2020 09:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=njsTuUEpaWvTTSk1tiT4WBz4P0CJRsdNPQsRYS7w/8I=;
 b=SRerFzyW0KXsHFEhD1lYBPGwVw7d70igPoEXQNKuB4tPQ4Zz9bcPlkxfoTOGHbD4rP
 VV3giuBWdtaBLmaiMGNvO/fLN0mlMHtYmYNRWlyIT2rV0YcH6vScBHjtvA0/DsdTIBQo
 HXI8o/1NOgU+341xEOjHg9rWBy7NPdFh/+6Bxge3XkNOSxJaJh3sSODY1pEQexAN9i8k
 hDGJzA8eAKO3nDWvoH3Z4mbFBdDfVE+4lheXDU4UwHc6RgIYtwYYnVTdKaTXw4ryQYWc
 AduoIuVYMZzDw3ARRT7IsWhXfA3LqApLV+x3iKzza+meFJoZwWT+Gb5fL+9Q+5dSLA39
 Nqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=njsTuUEpaWvTTSk1tiT4WBz4P0CJRsdNPQsRYS7w/8I=;
 b=BgSRgE7AiA7quPV/L3nKjFoxuhH8Qn5UeIuKz6mZuNYVGPczLjmpo2A77G3nx7VKiP
 SloG9i+2+xw1AfK1hjb9ZW1opnR040GY6ocgAqB2ivocF38lx8qTUcjpnbdlwq2sOMzv
 71Zy4lCH0lA0q/yurc/bw2bvVZM/49CbH6A62ZEWq8rPqTcYoytW4YmVDOfG3x2orWJI
 xJVJ3NI8n185jY2Y7gQwxrKbnmrAsSuGJ7bqO+iP0bNC8YEBISL3Iou8PZWECBLHAxO0
 hwxqlnAUVeBL1MiHbLOHWPye8tOPhQi7RD28daJfxv2NONCOW4wsTh9e5WtD8HrU5fOB
 o/ig==
X-Gm-Message-State: APjAAAWIMMgcLqFjq9gxmXXdwHkaqH2FUbT5Xl9AldpbdQFzUzqWMT3j
 083zV4v/xwUPBLxx3x765POWGw==
X-Google-Smtp-Source: APXvYqy2Jax9UiCl1s8hOzBtnVMhLoUEyfUaJZYKra7be3MHKeXarNdIx7MNc84vy4szk++ZV1qGmw==
X-Received: by 2002:a17:90a:1e63:: with SMTP id
 w90mr3953276pjw.36.1582047592779; 
 Tue, 18 Feb 2020 09:39:52 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 ep2sm3951243pjb.31.2020.02.18.09.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2020 09:39:52 -0800 (PST)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200218132023.22936-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d668ee65-ffbc-0305-8256-b84751d209bd@linaro.org>
Date: Tue, 18 Feb 2020 09:39:49 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200218132023.22936-1-philmd@redhat.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] Avoid cpu_physical_memory_rw() with a
 constant is_write argument
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMi8xOC8yMCA1OjIwIEFNLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSB3cm90ZToKPiBUaGlz
IGNvbW1pdCB3YXMgcHJvZHVjZWQgd2l0aCB0aGUgaW5jbHVkZWQgQ29jY2luZWxsZSBzY3JpcHQK
PiBzY3JpcHRzL2NvY2NpbmVsbGUvYXMtcnctY29uc3QucGF0Y2guCj4gCj4gSW5zcGlyZWQtYnk6
IFBldGVyIE1heWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4KPiBTaWduZWQtb2ZmLWJ5
OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhhdC5jb20+Cj4gLS0tCj4gQmFz
ZWQtb246IDwyMDIwMDIxODExMjQ1Ny4yMjcxMi0xLXBldGVyLm1heWRlbGxAbGluYXJvLm9yZz4K
ClJldmlld2VkLWJ5OiBSaWNoYXJkIEhlbmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJv
Lm9yZz4KCgpyfgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
