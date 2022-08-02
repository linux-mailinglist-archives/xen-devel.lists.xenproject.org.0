Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F973587C8E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 14:40:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379297.612629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrCC-0005N4-D1; Tue, 02 Aug 2022 12:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379297.612629; Tue, 02 Aug 2022 12:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIrCC-0005KT-AD; Tue, 02 Aug 2022 12:40:24 +0000
Received: by outflank-mailman (input) for mailman id 379297;
 Tue, 02 Aug 2022 12:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dd5r=YG=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1oIrCA-0005KN-7B
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 12:40:22 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45818ab2-1260-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 14:40:21 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id j15so9661117wrr.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Aug 2022 05:40:21 -0700 (PDT)
Received: from ?IPV6:2a02:587:ac1d:6c00:6613:8422:cc8a:dbae?
 ([2a02:587:ac1d:6c00:6613:8422:cc8a:dbae])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a05600c145700b003a35ec4bf4fsm18731048wmi.20.2022.08.02.05.40.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 05:40:19 -0700 (PDT)
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
X-Inumbo-ID: 45818ab2-1260-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=TGIsEWb6MTvgxvH/NdeK+Er6OfyqdxfebsAbGX5twdE=;
        b=W1sf+N9iTFKHWveVRp8+n66s69/aMzoG+jc3skLdP3/Ymh+YQtuQrR+4wUZeY8SKEW
         QckwsrhZi6mqZFH+JbXIms6Wah/2qGXcUNF03G/HB/IS/j247XFPTu15bHaoT2Rf6SFK
         xswXycF+zIBGaSRy3sRXbPuNZMPRrFcYD5RzQVzsa9XDoT2A1XW9/08gDB4dTYBp/9ME
         Aza/XzqavaO4fGPdiMOpRBzzDgsVbR/8Zj7irPQe/JE8yQjtU+uSmpDsjVAY9Pxi8yyP
         b8o5BYFT9fmJfCZNgC/rjrg4bu0LsNg8ciuNXruilLPF2m60AM/uCjTLAHCj7STw1AUR
         iXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=TGIsEWb6MTvgxvH/NdeK+Er6OfyqdxfebsAbGX5twdE=;
        b=1sbR7DEkm7EovdQj9my6mqh6gAyS5dhT5cKBqy0g/NXN79pN4UcyMt9p+8ItY8A9Q1
         +mTQs2T9OPJvT3Gi5g6GktjnzKYbWVDO3Hqmc6VINTR8UJghiWEetlCa+mqItOSamxgM
         nQ3AjicUXB5OGTTlLaMc8fDsE58D7aUb7tbhYh4b13t+ker3oF2lmeKEUik4bRM4wU4f
         ZfMYqMs0aKj9QZJC1tQeHeHDA3svd6N36k+U3u9Lu73Y9XRkJc9tW7RNS6r4XbsJWIaH
         wZM73ZO3iI92CjGqfFadosx5ikOQRD73Dff9ad3ixQ916OitpB1BaXe+1e5e+5C3aycp
         ElMQ==
X-Gm-Message-State: ACgBeo1w4Uh0VlNDkwGNx2UWobrKvzQ3L5lhYP7aHZKartOiloov16+q
	k4vRp5/9cgJ7gA0Ie5tOhVs=
X-Google-Smtp-Source: AA6agR5TY7535b8YiaepMMNgcHh6v1pesKF3eOp7AW5jdouoEp35Jm8XEFRNdbZRvRQ9kpKpMBNR7g==
X-Received: by 2002:a05:6000:15c8:b0:220:6362:e578 with SMTP id y8-20020a05600015c800b002206362e578mr5699236wry.68.1659444020688;
        Tue, 02 Aug 2022 05:40:20 -0700 (PDT)
Message-ID: <3b0fd31a-c847-f5ff-2365-5fca5becb051@gmail.com>
Date: Tue, 2 Aug 2022 15:40:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] xen/char: imx-lpuart: Fix MISRA C 2012 Rule 20.7
 violation
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220802075433.1748035-1-burzalodowa@gmail.com>
 <7e78d64a-c700-5846-f046-a1b0f2c98ea3@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <7e78d64a-c700-5846-f046-a1b0f2c98ea3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 8/2/22 14:58, Jan Beulich wrote:
> On 02.08.2022 09:54, Xenia Ragiadakou wrote:
>> --- a/xen/drivers/char/imx-lpuart.c
>> +++ b/xen/drivers/char/imx-lpuart.c
>> @@ -26,8 +26,8 @@
>>   #include <asm/imx-lpuart.h>
>>   #include <asm/io.h>
>>   
>> -#define imx_lpuart_read(uart, off)       readl((uart)->regs + off)
>> -#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + off)
>> +#define imx_lpuart_read(uart, off)       readl((uart)->regs + (off))
>> +#define imx_lpuart_write(uart, off, val) writel((val), (uart)->regs + (off))
> 
> As elsewhere before I think at the same time you want to drop the
> parentheses from the single use of "val".
> 

In general I do not want to include irrelevant changes in my patches.
Also, here, I do not want to drop the parentheses from val because the 
removal of the parentheses
- consists a violation of the rule 20.7
- would allow the following to compile
#define VAL x, y, z);(
imx_lpuart_write(uart, off, VAL)
- is not justifiable (i.e does not fix a bug, does not result in more 
readable code etc)

I understand that the rest of the community does not agree with adding 
parentheses around macro parameters used as function arguments and as 
the right-side operand of the assignment operator, but I consider them 
useful and I do not want to remove them myself. Maybe somebody else from 
the community could do that.

Also, these exceptions would be good to be mentioned in the rules.rst. 
So, that other contributors do not try to fix relevant warnings.

-- 
Xenia

