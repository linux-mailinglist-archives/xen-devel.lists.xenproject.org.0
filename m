Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A20A880B43
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 07:36:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695691.1085595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmpY2-0006Ss-1H; Wed, 20 Mar 2024 06:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695691.1085595; Wed, 20 Mar 2024 06:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmpY1-0006Qr-US; Wed, 20 Mar 2024 06:35:37 +0000
Received: by outflank-mailman (input) for mailman id 695691;
 Wed, 20 Mar 2024 06:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9RIb=K2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rmpY0-0006Ql-Lz
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 06:35:36 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0da2afef-e684-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 07:35:34 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56b8248e2d8so3366577a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 23:35:33 -0700 (PDT)
Received: from ?IPV6:2003:e5:873a:400:704b:6dbb:e7c0:786e?
 (p200300e5873a0400704b6dbbe7c0786e.dip0.t-ipconnect.de.
 [2003:e5:873a:400:704b:6dbb:e7c0:786e])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a056402094700b00568abb329a3sm5555856edz.88.2024.03.19.23.35.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 23:35:32 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 0da2afef-e684-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710916533; x=1711521333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+lDzr2w02rVl5i39iHJOGsPh/Br7Dg/rii9eZpfwt1M=;
        b=EP60K0yNx+v9KEsT1x0SWrmKY97eQz0QDeB1QC0+X1VzcSdn61Ipn+cdzcQ4IZRGai
         qS9B7z8s47oRIggCm8NoXTxGyp2Wcdi8TFLbLPaAYmO3KxbSzYt73gv2dt6dSAesN27N
         gGoIWPzWDHMendGF4RtcJUC9vXi5OCx18+xNZ/VpzMDyfA+Vv47/2QmyBCMmZbO8bVUj
         4yYwNBArRcayTzGXgYl2NLr6K5i+fBTB1XjP8Mi3K0Bc7y2TTYnKpc5bxyQrN/DF0MYY
         AaYEvx/SqoXxvHsrDzly/TOLclqDQggMXZYLDzHm3EIaEqiYBJFUEQNg6L3Kml8xLiPV
         3kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710916533; x=1711521333;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+lDzr2w02rVl5i39iHJOGsPh/Br7Dg/rii9eZpfwt1M=;
        b=e/8KLsKiKWf+knx0j7ypJnGfk0qnx9gbwb5OjnPUAcjPYkL9dPcAvRLXEztBAK8aJg
         gMpUBM8rJMjKVTIypERBrpdQzsaNu/8QXvL48GdaPxdyjuBjLq3KvNME55wKmcKQFB5h
         M+YUQH/lLEE+PwOlUqCpK8rIUFP9n96JsGj2dxKtk/G8enhZ7D0hHwNP0os3Ce8CIToo
         CEd0aMWDdG8QMrqFKsYRXnS/ew5YN99T343g20sXt1K/0Rf3VGakyuobTSoWtHeFjuhE
         rE/NiqWGXL+rQSGxxB3lv5y0wu3SHrO5Na45vVsrIyLtjZOR8xNfsAgGBoeAjWdFrVjy
         2W3g==
X-Forwarded-Encrypted: i=1; AJvYcCXTUX4gL8GF1lLE/N95TnWOcSJf2jm1FmwMPGrSvshenGxFmkMaQTKfUkRLUEpELJax94iA/ETDO8s+uBnbFL8XMC62kz8CStOWXgorNRE=
X-Gm-Message-State: AOJu0Yz7YS9UTiLUa4ubTuKtHSKAWuer43lcedWxW1TurpLWTQub/U/5
	4Nz4NvBbjRMYWmrbqODBEAtjPTK/uOwNKyk/HpywfKZBEFjGchbmV75qHVyro/Q=
X-Google-Smtp-Source: AGHT+IETFzu+HFRx/soYUPuG6RGaeJvJMFpY5Cqy84nbvtlZhn5eXhYPgU4OZja5Xyjy4WHVr2r9DQ==
X-Received: by 2002:a05:6402:5384:b0:568:ae7:bc0 with SMTP id ew4-20020a056402538400b005680ae70bc0mr12089603edb.34.1710916533023;
        Tue, 19 Mar 2024 23:35:33 -0700 (PDT)
Message-ID: <553a8bfb-94f3-4c3a-b1ae-17d0cb185737@suse.com>
Date: Wed, 20 Mar 2024 07:35:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/rwlock: Don't perpeuatite broken API in new logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>
References: <20240319113020.3843309-1-andrew.cooper3@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <20240319113020.3843309-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.03.24 12:30, Andrew Cooper wrote:
> The single user wants this the sane way around.  Write it as a normal static
> inline just like rspin_lock().
> 
> Fixes: cc3e8df542ed ("xen/spinlock: add rspin_[un]lock_irq[save|restore]()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Juergen Gross <jgross@suse.com>

Maybe with the subject fixed (s/rwlock/spinlock/).


Juergen


