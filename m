Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB454245944
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 21:27:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7OIp-0008Hz-49; Sun, 16 Aug 2020 19:26:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ehYN=B2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k7OIn-0008Hu-1g
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 19:26:45 +0000
X-Inumbo-ID: 11b3f3cd-43aa-41d8-85a1-bd2406004c03
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11b3f3cd-43aa-41d8-85a1-bd2406004c03;
 Sun, 16 Aug 2020 19:26:43 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 185so15127796ljj.7
 for <xen-devel@lists.xenproject.org>; Sun, 16 Aug 2020 12:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=IfaWM6cbh1R6sU631oDIMXW/dlgywxw9xrY1l4klwqQ=;
 b=B1f4/swoxIQPR26dfLlTPbusUOY/AzzEwxNadyU/nTdfP5P1091cWJdDa9rW5GzWOh
 H8YfW3wEW/Pmr67In4BhQF56NzvNzNNOMAlV2a2WfjRcXF0E1t+7GxRkk5gowXKXAU+g
 xpThJHGQjJrLp2MnZvON5fzU9kYK7c3/mNIk5+TcE4eonoTVYQJdIScYTIunVHvsTF7J
 mWysmOS3oh+TuJfbPrWgjyIovRGLLs1WzEQ0VZhYq9WhzklAFyGKWZMlZyvpgPyuH2Vt
 vvL0upvK2yr0+KTm+OHnlLSGUzEIU6WNP4hu7bFCswzFN0X79gJ3WlteTlSrfHzkoZ5c
 gJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=IfaWM6cbh1R6sU631oDIMXW/dlgywxw9xrY1l4klwqQ=;
 b=f5pzLMWyrKwfRVc4n3Bvuhhe25sYnTuo9uIB4P1+utubdyl12ttL8fsYfyNtfEj1sO
 9MX2Hw5vMvlac/qdjNgQjKXtmn4XK/znxMfjbEHsQFY77KsUWWESarDpNQl9Z++ve8Gb
 mUTUPyYf1jdG3dmk7pwbjHFPKp3uW7AxBnA7RmcNtNwkJXSeIsjKfqhcODJLErhrKSfJ
 oLs5o1b+0317dxTBk7ER6AUr2YJlrQsIbBx84YAFiaYU7CXCn4yVmdZYs8Y2z1Cjl4GF
 1iutgLqBhEB8TE13NZBghgL5orCVu91IsHdo3Cdj4M5n4sei9b/M/FjJ5V+NcHCCpIKC
 g9oQ==
X-Gm-Message-State: AOAM532HENA10lTbNwJalsOhlTfra1ALQDPH5lXGsMDadsBBFN2UqDk9
 Y4EVH/5V1dGl6sBbuJR4D4s=
X-Google-Smtp-Source: ABdhPJyEecuB/QKde1W+x86GQx0D7qTXPDrFbNOQv9rZfSym3NDQU+g6rLEXeUf6eelY8DjsjVjT2g==
X-Received: by 2002:a05:651c:1194:: with SMTP id
 w20mr6204249ljo.362.1597606002425; 
 Sun, 16 Aug 2020 12:26:42 -0700 (PDT)
Received: from [192.168.1.2] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 14sm4387692lfr.17.2020.08.16.12.26.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 16 Aug 2020 12:26:41 -0700 (PDT)
Subject: Re: [PATCH] xen: Introduce cmpxchg64() and guest_cmpxchg64()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20200815172143.1327-1-julien@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <bd4449ad-46a2-4345-4682-cb068756ff6e@gmail.com>
Date: Sun, 16 Aug 2020 22:26:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815172143.1327-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 15.08.20 20:21, Julien Grall wrote:

Hi Julien

> From: Julien Grall <jgrall@amazon.com>
>
> The IOREQ code is using cmpxchg() with 64-bit value. At the moment, this
> is x86 code, but there is plan to make it common.
>
> To cater 32-bit arch, introduce two new helpers to deal with 64-bit
> cmpxchg.
>
> The Arm 32-bit implementation of cmpxchg64() is based on the __cmpxchg64
> in Linux v5.8 (arch/arm/include/asm/cmpxchg.h).
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>   xen/include/asm-arm/arm32/cmpxchg.h | 68 +++++++++++++++++++++++++++++
>   xen/include/asm-arm/arm64/cmpxchg.h |  5 +++
>   xen/include/asm-arm/guest_atomics.h | 22 ++++++++++
>   xen/include/asm-x86/guest_atomics.h |  2 +
>   xen/include/asm-x86/x86_64/system.h |  2 +
>   5 files changed, 99 insertions(+)

Thank you for doing this. I have successfully build-tested your patch 
with IOREQ series on Arm32/Arm64 (of course before that I had changed 
cmpxchg to guest_cmpxchg64 in hvm_send_buffered_ioreq()).


-- 
Regards,

Oleksandr Tyshchenko


