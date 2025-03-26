Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AE7A717B7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 14:45:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927802.1330541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txR3l-0007rv-DU; Wed, 26 Mar 2025 13:44:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927802.1330541; Wed, 26 Mar 2025 13:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txR3l-0007pT-Ag; Wed, 26 Mar 2025 13:44:45 +0000
Received: by outflank-mailman (input) for mailman id 927802;
 Wed, 26 Mar 2025 13:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txR3k-0007pN-37
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 13:44:44 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 781abc57-0a48-11f0-9ffa-bf95429c2676;
 Wed, 26 Mar 2025 14:44:41 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-391342fc148so4769956f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 06:44:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d82f3235asm2478125e9.31.2025.03.26.06.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 06:44:40 -0700 (PDT)
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
X-Inumbo-ID: 781abc57-0a48-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742996681; x=1743601481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WEctQAVJ92zI9uGPDt2pFR4Cswu03XEpUN5mUbHVcRs=;
        b=DpL6qRFAhMhF8+0sEX2e3TYrSYn7KxvRpgBWOUas5H8iXzHO72kYp7hsBv2YOoxL2E
         Zkcehk9k+SpIgfuaBmUl2WeIqtvCyKOaY9wpbY/qJoH3UXw5Sc8Q3dHkPP/S14Q3FEdx
         9jOvo71Kpc0OQB9OWCeL4BAhwetgMS7NS3F/soiN4WE7/cUcSLMSGn/RPaSXwUnO3vxO
         K8g2gU5eXLGlvVc5Ax0ueKUhKewTiDC+OdyzxakElCBdHe8YH9i6+By4gCxBeoHmR+I+
         IZi76c1FP5wpQDYs8jZ6RiG+2WHmVUsi0dmcv9ZbKjQOTcDyoYl98yj4GIzc4NPaXD8J
         Vmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742996681; x=1743601481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WEctQAVJ92zI9uGPDt2pFR4Cswu03XEpUN5mUbHVcRs=;
        b=Jqz4ijWCcGATd8HYnTCpISy09ddwW/Zfr6vsqhVns119YNczFFCxzRovlp90uulsvL
         yfhFPNhBQkw/TSnjzi0Tva8xAuSW5npBMZwPZjOY7JvOCUr3N7UcsWxYZM9O6blKLTks
         GUEXnUeBXkNTvNXAKvvwiH8jdlMpKlntF2OsWiPoE1KKPVzKvUMk5umbYYUrQKFIdUvY
         lTOfZ30lyVhn/EkJQkakiJN6qNb1Fx8zU1gyuRtGPMyxfGXPsE/qdAWD5/NCgdziQd57
         z9LJXmNYBGR3jm5gsNPmIbOZxsOfi59TUmivP/5JUCFGUFeDTREXZU1ovvrcPJxg3lik
         PU1A==
X-Forwarded-Encrypted: i=1; AJvYcCV9GtAoGW376kIZA6alVNogZ6fzh1bdoUsNyWz8RwTw+5c3GksYFImNAg/T57HniBZug+7owP1Nebw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsCn2kh+FdTxdSfQpYCAOw9/w+svUaxArH5D7QBBm9XFjtDHjp
	ei1n7go4cDtycbCC9nHA1agX1d+JHZXO1hOioE2HGYNOVRvqemEsc0vlL5bryQ==
X-Gm-Gg: ASbGncvFrmBoCmMmhpEFZMvHNU8Cqyys2U1pGBYTBvWj4q0f3mST2GLEO93l6FOhn+F
	BiYSG1l30GiaWUYHLSOtkFLx1nKgDzCH3tS0bda8aee1fhlIT/m+jVYhaAFyfTv1163CrXfuiRi
	XlDAg4cpaHqDjth1k86ZZXLrYV9sD33dDV8cg+WLFMwlbE84WUI8wS1kELaGZyoXVgq+zI7eAyG
	b2jZp5wg+W1gTE8noLJbIfipPxD0bDtnI8NvklUD9o26cjYgAYSNXU1kgcIUfMKv+R/wiyy/UWB
	LRltqgyAzyxwbdxJaqBS153NtgAjtpVoQ1kzaEcjBDrh/YxLA5vzjlN77B+hf2CQaWAKoY5GKFQ
	mJ6jWbJUuAjtSaL0n1LVYIK0GD8KF+A==
X-Google-Smtp-Source: AGHT+IEZKqeAK7t3LZT7GysIn1XUCJdCYbP8/D18JG3rDyQVPnFRd5kV26oFvZNvxXe5J1qLyhEfuw==
X-Received: by 2002:a05:6000:4188:b0:391:4999:776c with SMTP id ffacd0b85a97d-3997f932c74mr16264807f8f.40.1742996681215;
        Wed, 26 Mar 2025 06:44:41 -0700 (PDT)
Message-ID: <7a2f80b3-5018-4f15-973c-fe950a574b11@suse.com>
Date: Wed, 26 Mar 2025 14:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/8] xen/console: introduce console input permission
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250318233617.849903-1-dmukhin@ford.com>
 <20250318233617.849903-3-dmukhin@ford.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250318233617.849903-3-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:36, dmkhn@proton.me wrote:
> @@ -564,10 +586,25 @@ static void __serial_rx(char c)
>          /* Deliver input to the PV shim console. */
>          rc = consoled_guest_tx(c);
>  
> -    if ( rc )
> +    switch ( rc )
> +    {
> +    case 0:
> +        break;
> +
> +    case -EBUSY:    /* Loopback mode */
> +    case -ENOSPC:   /* FIFO is full */
>          guest_printk(d,
>                       XENLOG_WARNING "failed to process console input: %d\n",
>                       rc);
> +        break;
> +
> +    default:
> +        d->console.input_allowed = false;

This aspect isn't mentioned / justified in the description, and I also
can't deduce why you would do so. Or to put it differently, why you'd
then not also take away input focus from this domain, for it no longer
being eligible to have focus.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -512,7 +512,7 @@ struct domain
>      bool             auto_node_affinity;
>      /* Is this guest fully privileged (aka dom0)? */
>      bool             is_privileged;
> -    /* Can this guest access the Xen console? */
> +    /* XSM: permission to use HYPERCALL_console_io hypercall */
>      bool             is_console;
>      /* Is this guest being debugged by dom0? */
>      bool             debugger_attached;
> @@ -651,6 +651,12 @@ struct domain
>      unsigned int num_llc_colors;
>      const unsigned int *llc_colors;
>  #endif
> +
> +    /* Console settings. */
> +    struct {
> +        /* Permission to own physical console input. */
> +        bool input_allowed;
> +    } console;

Are further fields going to be added to this sub-struct? If not, is having
a sub-struct here actually worth it?

Jan

