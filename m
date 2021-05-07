Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3A2376194
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 09:59:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123789.233559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levOL-00042P-FY; Fri, 07 May 2021 07:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123789.233559; Fri, 07 May 2021 07:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1levOL-00040R-CH; Fri, 07 May 2021 07:59:21 +0000
Received: by outflank-mailman (input) for mailman id 123789;
 Fri, 07 May 2021 07:59:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7X5=KC=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1levOK-00040L-I4
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 07:59:20 +0000
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ebc3d453-9203-42e5-aa87-41626d0a2214;
 Fri, 07 May 2021 07:59:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id n2so8221477wrm.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 May 2021 00:59:19 -0700 (PDT)
Received: from [192.168.1.186]
 (host86-180-176-157.range86-180.btcentralplus.com. [86.180.176.157])
 by smtp.gmail.com with ESMTPSA id 6sm14742646wmg.9.2021.05.07.00.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 00:59:18 -0700 (PDT)
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
X-Inumbo-ID: ebc3d453-9203-42e5-aa87-41626d0a2214
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:reply-to:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=oIGKBYwFUgUlzXnGLZjKJAY4IuJYeR1zWo2ZVMftHfs=;
        b=tiaLtJERz+NvI77p/SE+0q8bdgH+AihgKM35FplYjfXLuVsjftg70P7dNjYSmZFoTj
         +3J9/Yy14ABGFBmGhXL3PzG7cRCEEm1ZkqX+qvywowK4nLPrZ2bo7ddr53eun8QrqDcb
         sw6O11kJWKjVZYL9Wcc8HZdxetxEVoRf9mNt7LlDzrBS4xHdOmjDYT46fgxdDt6P/P8C
         2lxd9hIQM0YlhYxTlipd6He4QRq8u1tCc6QRSetTjiLmJLXlatNYxTSLRa15PYIjuSaJ
         ze7OudKzb72ZP4SRgdHYrbgUjGS08UZ9bt3jZUgvhy8Augf0jloLdB2uEbcRewxv0oeN
         u06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:reply-to:subject:to:cc:references
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=oIGKBYwFUgUlzXnGLZjKJAY4IuJYeR1zWo2ZVMftHfs=;
        b=JC2O9yAc/wDR4Z3+oUVtWWGR/O3GCY0l7CvBl0wSK3IoBplvxhczkns7Q4qe/HTYqn
         y95eKxIN/tH7admU+o2R3MiZV+QuVnBolxxHr1OZTloqAURgOwZyiGlpAP3bhD/lo4wI
         l+YauVUL08l+jyQ1a+05lB/Sj+PAvahOSau/9kjNC/k/aYBSPwTQhvtwnRpLEYuKDEjl
         RbHqBr8IoxkgDTH95TzTAu0MfqUmVInRu8HboT7hs6GSBQWl4f+hQzVRif9ebiw1SCoj
         c4tNq7QgMyKmmOJc77UDUslZH8fqWiO7ZUeecUwjnBlWnpr9Awr0WTFxmOVRgJ3hpUaf
         LfnQ==
X-Gm-Message-State: AOAM5308+o3uLcXBqhNw//p8ucbJoIdb9Vw9owbTALbXCsQxo9wNbHyS
	Ur/4EpAwb6wT4pAEebWchj0=
X-Google-Smtp-Source: ABdhPJxMRjBTa2+pXlnxk6Ds39p0P6CSSRTbJTLadwC7WSyxk5ctNWVGygIBK0drnR8BKvzBVkX2Fg==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr10609326wrq.304.1620374358571;
        Fri, 07 May 2021 00:59:18 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Reply-To: paul@xen.org
Subject: Re: [PATCH RFC 2/2] xen/kexec: Reserve KEXEC_TYPE_LIVEUPDATE and
 KEXEC_RANGE_MA_LIVEUPDATE
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: dwmw2@infradead.org, hongyxia@amazon.com, raphning@amazon.com,
 maghul@amazon.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210506104259.16928-1-julien@xen.org>
 <20210506104259.16928-3-julien@xen.org>
Message-ID: <a2fcd673-2500-917e-16f2-d18e553fe2db@xen.org>
Date: Fri, 7 May 2021 08:59:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210506104259.16928-3-julien@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/05/2021 11:42, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Unfortunately, the code to support Live Update has already been merged in
> Kexec and shipped since 2.0.21. Reserve the IDs used by Kexec before they
> end up to be re-used for a different purpose.
> 
> This patch reserves two IDs:
>      * KEXEC_TYPE_LIVEUPDATE: New operation to request Live Update
>      * KEXEC_MA_RANGE_LIVEUPDATE: New range to query the Live Update
>        area below Xen
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Paul Durrant <paul@xen.org>

> ---
>   xen/include/public/kexec.h | 13 ++++++++++---
>   1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
> index 3f2a118381ba..650d2feb036f 100644
> --- a/xen/include/public/kexec.h
> +++ b/xen/include/public/kexec.h
> @@ -71,17 +71,22 @@
>    */
>   
>   /*
> - * Kexec supports two types of operation:
> + * Kexec supports three types of operation:
>    * - kexec into a regular kernel, very similar to a standard reboot
>    *   - KEXEC_TYPE_DEFAULT is used to specify this type
>    * - kexec into a special "crash kernel", aka kexec-on-panic
>    *   - KEXEC_TYPE_CRASH is used to specify this type
>    *   - parts of our system may be broken at kexec-on-panic time
>    *     - the code should be kept as simple and self-contained as possible
> + * - Live update into a new Xen, preserving all running domains
> + *   - KEXEC_TYPE_LIVE_UPDATE is used to specify this type
> + *   - Xen performs non-cooperative live migration and stores live
> + *     update state in memory, passing it to the new Xen.
>    */
>   
> -#define KEXEC_TYPE_DEFAULT 0
> -#define KEXEC_TYPE_CRASH   1
> +#define KEXEC_TYPE_DEFAULT      0
> +#define KEXEC_TYPE_CRASH        1
> +#define KEXEC_TYPE_LIVEUPDATE   2
>   
>   
>   /* The kexec implementation for Xen allows the user to load two
> @@ -150,6 +155,8 @@ typedef struct xen_kexec_load_v1 {
>   #define KEXEC_RANGE_MA_EFI_MEMMAP 5 /* machine address and size of
>                                        * of the EFI Memory Map */
>   #define KEXEC_RANGE_MA_VMCOREINFO 6 /* machine address and size of vmcoreinfo */
> +/* machine address and size of the Live Update area below Xen */
> +#define KEXEC_RANGE_MA_LIVEUPDATE 7
>   
>   /*
>    * Find the address and size of certain memory areas
> 


