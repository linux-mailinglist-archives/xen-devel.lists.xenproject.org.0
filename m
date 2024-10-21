Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73179A70CB
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 19:16:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823866.1237946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2w0Z-0007tX-Gq; Mon, 21 Oct 2024 17:15:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823866.1237946; Mon, 21 Oct 2024 17:15:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2w0Z-0007rX-EB; Mon, 21 Oct 2024 17:15:55 +0000
Received: by outflank-mailman (input) for mailman id 823866;
 Mon, 21 Oct 2024 17:15:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euus=RR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t2w0Y-0007rR-8Z
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 17:15:54 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e18811c-8fd0-11ef-99a3-01e77a169b0f;
 Mon, 21 Oct 2024 19:15:49 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539f4d8ef84so4833034e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2024 10:15:51 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a91370e91sm225973366b.123.2024.10.21.10.15.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Oct 2024 10:15:50 -0700 (PDT)
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
X-Inumbo-ID: 1e18811c-8fd0-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1729530951; x=1730135751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c0cXqLRwe3iym/6jLCN0Oy99JZZMOf7h4GoFd86Hcbo=;
        b=OHZdzuRewp+0a/nbWleZJAwlZcA7vPB3EhfY7AQYKQVaDa3+wW71Y3rqUSWe2PNBAn
         yDv430Tn+tsjvrS4GBAHl7qswyaTmEnHPWtKsXdqt2nMKn8l4t/i1yeC4uJXi0lSXho/
         mQtpjEEBQ8cvwTKxK1PcPgJvYYj/CywaYLIp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729530951; x=1730135751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0cXqLRwe3iym/6jLCN0Oy99JZZMOf7h4GoFd86Hcbo=;
        b=KZ2Xc6Pq73v86XsOJNN6sIcf7QSFyUYkBp5f2wvD0y+m2MPHTyqvU+tSTd0OPFGk5z
         UAPXozBcXDeBvVPEcPGG0cL7zZFWUd2Jkee4gCmVQpH0+yyteXc2nJBX/MDslRmjpv7b
         0rhnIMbj20F3SmU14IDp0iiVUMKDIau5ZeeavRtnlwkuRSt1E2YV4ONsuABuhUlVZVRF
         kzSovP8KsuoesPLP1HbB08DKC1oNOiXGO8PeQBKnumD33O/mzzsevs+Jx9wfwe0T+S0P
         QIga0OWB5ljsyM9CbisyadDFWMitQ6U1M6yZHaTuEdFjhxR+hXcduODexh5uvThErh0L
         b9Lg==
X-Forwarded-Encrypted: i=1; AJvYcCUpdBNi7L0LA9oUzhaIhdPkvGG/Yfg8o/Z97PEtzYlqMxhvyLZxslFu30RZW2Ibd5okFf2V8ixHIyE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8gWq2CqP3Qcqxe/AscoZWGX7jUk2/kGb8xJFTxg+Yy2Ly3s48
	lSSzDhrKU4KsZVJv6M1+qyyn1mAz1WwC9kWF+q8Cn0yCTVp523tTFFXK4vKsWoE=
X-Google-Smtp-Source: AGHT+IGpJk3m6yOKHHmrgbNGEx4tr6J99WQbuYOtItfqz5hbojFDmfC8M+J1wgIuHLkcSX6uaVpF2A==
X-Received: by 2002:a05:6512:3d29:b0:539:e94d:2d3d with SMTP id 2adb3069b0e04-53a1544140bmr6307934e87.7.1729530951174;
        Mon, 21 Oct 2024 10:15:51 -0700 (PDT)
Message-ID: <208d469c-d86d-417b-a2cc-2e06337d15ba@citrix.com>
Date: Mon, 21 Oct 2024 18:15:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/38] x86/boot: move headroom to boot modules
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241021004613.18793-1-dpsmith@apertussolutions.com>
 <20241021004613.18793-4-dpsmith@apertussolutions.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241021004613.18793-4-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/10/2024 1:45 am, Daniel P. Smith wrote:
> The purpose of struct boot_module is to encapsulate the state of boot module as
> it is processed by Xen. Locating boot module state struct boot_module reduces
> the number of global variables as well as the number of state variables that
> must be passed around. It also lays the groundwork for hyperlaunch mult-domain
> construction, where multiple instances of state variables like headroom will be
> needed.
>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> Changes since v6:
> - add blank line to separate comment from line above it
>
> Changes since v5:
> - reword and expand comment on headroom
> - consolidated declaration and assignment
> ---
>  xen/arch/x86/include/asm/bootinfo.h | 14 ++++++++++++++
>  xen/arch/x86/setup.c                | 21 ++++++++++++---------
>  2 files changed, 26 insertions(+), 9 deletions(-)
>
> diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
> index ffa443406747..59e6696f9671 100644
> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -17,6 +17,20 @@
>  struct boot_module {
>      /* Transitionary only */
>      module_t *mod;
> +
> +    /*
> +     * A boot module may contain a compressed kernel that will require
> +     * additional space, before the module data, into which the kernel will be
> +     * decompressed.

The grammar is a bit awkward.  Space beforehand is an implementation
choice of Xen, not a requirement.

Can I suggest:

---%<---
A boot module may need decompressing by Xen.  Headroom is an estimate of
the additional space required to decompress the module.

Headroom is accounted for at the start of the module.  Decompressing is
done in-place with input=start, output=start-headroom, expecting the
pointers to become equal (give or take some rounding) when decompression
is complete.
---%<---


> +     *
> +     * Memory layout at boot:
> +     *     [ compressed kernel ]
> +     * After boot module relocation:
> +     *     [ estimated headroom + PAGE_SIZE rounding ][ compressed kernel ]
> +     * After kernel decompression:
> +     *     [ decompressed kernel ][ unused rounding ]
> +     */

I'm not sure how helpful this is.  If anything, I'd say it ought to be:

                       start + size --+
          start --+                   |
                  v                   v
                  +-------------------+
                  | Compressed Module |
 +----------------+-------------------+
 |         Decompressed Module        |
 +----------------+-------------------+
 ^
 +-- start - headroom


~Andrew

