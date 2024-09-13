Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09F9978748
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 19:56:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798393.1208597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spAWq-0005mH-Ij; Fri, 13 Sep 2024 17:56:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798393.1208597; Fri, 13 Sep 2024 17:56:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spAWq-0005ka-FW; Fri, 13 Sep 2024 17:56:20 +0000
Received: by outflank-mailman (input) for mailman id 798393;
 Fri, 13 Sep 2024 17:56:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mG44=QL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1spAWp-0005kU-VN
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 17:56:19 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75b41271-71f9-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 19:56:10 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a8d100e9ce0so280158866b.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Sep 2024 10:56:10 -0700 (PDT)
Received: from [172.31.47.100] ([193.118.249.27])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25cecc21sm890766466b.166.2024.09.13.10.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Sep 2024 10:56:09 -0700 (PDT)
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
X-Inumbo-ID: 75b41271-71f9-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726250170; x=1726854970; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O2lrUk1fmnESgJITd451jLBk0SXVA7sLocOnyhdq6Nw=;
        b=Uxxxwb1EGcPhPGqjvg11ulteCkwIO5e2mIB4fhqYaxOiL3RMtN1zfp309Gw31Rxjn8
         0iCjqXuu1uExPYBiLWesCINA14CBCBWxZkR5FQc4DglQCKPKQH5KyZmZvR7WwpLLagjt
         YeHVm2MSnzfQi0l1h8ksW3kAtGxB/MMxPinqJASxJxr128AMmUArDbPxReUNxZM4V8hi
         cWmknt9imiiAaUs5+b77CglPQ0csYejsaaRYPNEZ3WEF7BLIG1r+iv+4QuQ+8JLN9FAR
         XMwEFj9gNYCrATFfoB4I3dbvgCbtBAwecFaHwkboxEuV8LsCDt/L9yKVAfpIjEpHrXpl
         9tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726250170; x=1726854970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O2lrUk1fmnESgJITd451jLBk0SXVA7sLocOnyhdq6Nw=;
        b=FLH+pJ/O3RhZo+Dc2it5g+Ao9zNSfsM7YVxM+BXejXPxZP1/u3fAFMQPKZMn+36LQM
         oy1gJOQbkEcPz6v1mhszD501koHrTO/H5zubOQwbpHP3iGlq1VJx85JOBboXaVCjPt2A
         6gCV8lzTpp/XqoyBzL7ZHMucG+ydC4T1CDYGk9f9e01V3ifWdkm9kSVCXcnA6/KqB6+R
         Kah26tRj6SZnoqIY/Sl3AYSphoTB9TGgk1a6et7+k6LSRJ9xsmnurYLuzzSm4376s8ci
         1sdz1PEHD/adgcVL2dg+ol4i++2pgoMm3Re+Uj5OfnFZrRgknj4ucJ8gxRb2f2+OvvjB
         zPOw==
X-Forwarded-Encrypted: i=1; AJvYcCWsPqUV8yn8nO8+apaw1x0zms1F7axqKfvCw5OxL0zSWYAyvLFoQUTVEurfFKlgbfTbEruJNCuynJM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtsvIgWg9HhsrTXmFy0qZdTmoEaacmuIxxB8ggp+Rs1Wpeb7Fa
	sk9xe0nSbqqUKKBi/RbqPoEDpXpfchXcPeQ15MGymr6EsayRXMQNZZW4FUkqvQ==
X-Google-Smtp-Source: AGHT+IF1TCE1W0ijuJTydv4GBylX3/5yGR/Uc7jDxxpNNVwtuxk9AziS7gMbQ7ajm3b8HyS3hYW+4A==
X-Received: by 2002:a17:907:d2a:b0:a8d:51d6:b3ef with SMTP id a640c23a62f3a-a9029668104mr748535266b.56.1726250170072;
        Fri, 13 Sep 2024 10:56:10 -0700 (PDT)
Message-ID: <8e3d28e4-1789-4fa9-8d9d-f2912cc28868@suse.com>
Date: Fri, 13 Sep 2024 19:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/ucode: Improve commentary for parsing AMD containers
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240913123954.1907305-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20240913123954.1907305-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.09.2024 14:39, Andrew Cooper wrote:
> Despite writing this code, it's not the easiest logic to follow.
> 
> Shorten the UCODE_EQUIV_TYPE name, and provide more of an explanation of
> what's going on.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

I'm okay with this as is, so
Acked-by: Jan Beulich <jbeulich@suse.com>
yet ...

> @@ -335,10 +335,10 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>          buf  += 4;
>          size -= 4;
>  
> -        if ( size < sizeof(*et) ||
> -             (et = buf)->type != UCODE_EQUIV_CPU_TABLE_TYPE ||
> -             size - sizeof(*et) < et->len ||
> -             et->len % sizeof(et->eq[0]) )
> +        if ( size < sizeof(*et) ||                   /* Insufficient space for header? */
> +             (et = buf)->type != UCODE_EQUIV_TYPE || /* Not an Equivalence Table? */
> +             size - sizeof(*et) < et->len ||         /* Insufficient space for table? */
> +             et->len % sizeof(et->eq[0]) )           /* Not a multiple of equiv_cpu_entry? */

... this of course goes quite a bit beyond 80 cols (yet worse for the
other block further down). How about


        if ( /* Insufficient space for header? */
             size < sizeof(*et) ||
             /* Not an Equivalence Table? */
             (et = buf)->type != UCODE_EQUIV_TYPE ||
             /* Insufficient space for table? */
             size - sizeof(*et) < et->len ||
             /* Not a multiple of equiv_cpu_entry? */
             et->len % sizeof(et->eq[0]) )

?

Jan

