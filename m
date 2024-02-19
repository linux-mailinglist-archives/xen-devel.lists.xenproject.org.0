Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D26859EEF
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 09:58:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682719.1061841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzTE-0003la-Nf; Mon, 19 Feb 2024 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682719.1061841; Mon, 19 Feb 2024 08:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rbzTE-0003iz-Ka; Mon, 19 Feb 2024 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 682719;
 Mon, 19 Feb 2024 08:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rbzTC-0003ib-Uf
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 08:57:50 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4c197e1-cf04-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 09:57:49 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-33d118a181fso1903019f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 00:57:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 x11-20020a5d444b000000b0033b7ce8b496sm9769110wrr.108.2024.02.19.00.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 00:57:48 -0800 (PST)
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
X-Inumbo-ID: f4c197e1-cf04-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708333068; x=1708937868; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yn4H6aPiMGY16QdrMOmZtVckBaVP2SonOO8ojF14Kc=;
        b=UrdygiqG5HIU9z1kSIOhp6l2xSWr0mZb6U2HtJO5ZxuK05EODAJgZuYR6PweCPmK7y
         y6nCduRmrYgyXoupOfEhgxq4KAxwHH5niWHM6QRcNJjoLnRlw5lRCM7S5oVjRehJt1ha
         pI5OJ7N850PKCKeujeoPZnkSUumesGVvOp8efWY1oPxaFHMgxPMKSk30aYoVmwb4sy42
         tLbG8yuiS96knkKPFKk10LHmN2QOD7LxRZl2bGOx4QEXeeRDxEWSCUYgFehD9+FxnXkW
         14VsCYZNbYskASmx6RvnW97+fpEMC946IzjES7tJTJgdr81ArJWTKcuqn2CR5jdO18Wf
         tLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333068; x=1708937868;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yn4H6aPiMGY16QdrMOmZtVckBaVP2SonOO8ojF14Kc=;
        b=Xp9Bszqm/j7uKDdVjjdOv++1abaF9YzW9wScrLI5gjeMTDfy6Wq3G5VSPcENXi+z0P
         zKj5pW1p37XDsHxe09kQ2qlXaQPmeknq8HxIob2vi1WA8Rq7aWtvo2Pim2ZL43H8C67C
         +4qQ2PYoopI3P34y5le8XA2RYSu0J4+tLd4y+zhHjB47oIoDrrv/zri8BJv1leXNitBw
         f4rXTOqXf0wl2dk6YhS04FlTyUpk8oavurmene7IQaivaaTWTFqVJ0utGzl172BE7ijM
         VB+9A5CPkVYjCL00SOq5gZZJXBTflXa6UFVmg7uotNU+Harj9k1IrQ9r9pQNOsKgLnJK
         JTTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEOqCeybw5v4dg57n0cdyAS1+RZVAQAZcjLIBzkWpCBAvkHRFs8VEmjXya7r334kTH+PUULfUFA5e+dfIUqjKkOmFl4WCmknCY9r4GDu8=
X-Gm-Message-State: AOJu0YwbibfNtvs99SE3uOj9IZgNdHxXiveC+MoBJBjt3lXS8yx4GyP/
	ORBUE5+euAryyYmSC4Mj0Z19iWBpZILsmYHvvg359g6uQFENR+oFdoB3nogUuA==
X-Google-Smtp-Source: AGHT+IF8w6LgX6xYXh59rplpnMBlDS2InNxXbob7pjajh4m8/rFu/4FjSZINiW/vryNEAdSwCzrutw==
X-Received: by 2002:a5d:5608:0:b0:33d:513a:c7b2 with SMTP id l8-20020a5d5608000000b0033d513ac7b2mr955667wrv.47.1708333068493;
        Mon, 19 Feb 2024 00:57:48 -0800 (PST)
Message-ID: <7b60cf83-4d08-46ef-a937-911e42fd9e5d@suse.com>
Date: Mon, 19 Feb 2024 09:57:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ns16550: add Asix AX99100 serial card
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240218013431.274451-1-marmarek@invisiblethingslab.com>
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
In-Reply-To: <20240218013431.274451-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.02.2024 02:34, Marek Marczykowski-Górecki wrote:
> @@ -1170,6 +1177,11 @@ static const struct ns16550_config __initconst uart_config[] =
>          .dev_id = 0x7adc,
>          .param = param_intel_lpss
>      },
> +    {
> +        .vendor_id = PCI_VENDOR_ID_ASIX,
> +        .dev_id = 9100,

As per Linux this is 0x9100.

> +        .param = param_asix_ax99100
> +    },
>  };
>  
>  static int __init
> diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
> index e798477a7e23..2a19f4ab7872 100644
> --- a/xen/include/xen/pci_ids.h
> +++ b/xen/include/xen/pci_ids.h
> @@ -11,3 +11,5 @@
>  #define PCI_VENDOR_ID_BROADCOM           0x14e4
>  
>  #define PCI_VENDOR_ID_INTEL              0x8086
> +
> +#define PCI_VENDOR_ID_ASIX               0x125b

Please insert such that numeric sorting is retained.

Jan

