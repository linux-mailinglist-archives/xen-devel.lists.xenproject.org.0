Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCCE8AE847
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 15:34:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710634.1109951 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGHF-0000Od-9A; Tue, 23 Apr 2024 13:33:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710634.1109951; Tue, 23 Apr 2024 13:33:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzGHF-0000M9-6W; Tue, 23 Apr 2024 13:33:41 +0000
Received: by outflank-mailman (input) for mailman id 710634;
 Tue, 23 Apr 2024 13:33:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzGHE-0000M3-DP
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 13:33:40 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 175e3008-0176-11ef-b4bb-af5377834399;
 Tue, 23 Apr 2024 15:33:38 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-518931f8d23so6066316e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 06:33:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c468600b0041563096e15sm24281419wmo.5.2024.04.23.06.33.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 06:33:37 -0700 (PDT)
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
X-Inumbo-ID: 175e3008-0176-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713879218; x=1714484018; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j+VXxI/8vw32l+wOwfi23il+G0g27flqxPAR4o0gKkw=;
        b=alTpNI6lDaQXmolHwMWPeKIG/A7655PS4L3zJAgccJFsV4xw8pSb1HHe2nBSbex7wq
         VftxphypW3Y2AQ3VDk7qDk3H+rpY6o7jstQHkPNrD8jhzoaRlk6L64nv9CdIXXaT9zPt
         jbqGK+JtXwxiue4wBPvQtwOCBNNSODWUA6IsPKBOTRSUhXBMCNWuVHsFQJvgS4RtUW4G
         oWAvO86K25JNhVoKJm2x90tn2kb7srG2jD8Vjk2G2p9FXSBDpGaQVDgHPAxKbQeNxAeX
         kMMNlDBQuD/Bi/Yh1P4z+3uStZui2vWQnRB5/2rWHvm1O77gw+m5M4O6NP+I02oXiCKA
         EhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713879218; x=1714484018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+VXxI/8vw32l+wOwfi23il+G0g27flqxPAR4o0gKkw=;
        b=l4JexYC0v+E1EYNOjWu+s9EXvZayJumKbHwXsDtwBBaRl28+RufJGTxKG/QP8cO2Iz
         mCO95luDg3CUMDhfH0LOSQyH0k1kfUiIAa3pFihN4SSHsU5S0tzLxNRzvI4eE9MvbbLq
         DRxvQPwAuCGFhvJegqO3WMPG06GO48jeZK9K/OAd1LDYMsDDSSrkoactNW2e5qIB7lPK
         Thb7QuDsDyNO0ImMEzPq7YJo1JbfU6/gbJNK8+Gl7O509xPhJ4ESl5bkJWBNskKnKQj5
         6X/oJrJsPT/hvUlAjLi5Xb2DaeXH2ei9orF3NQHxNlbINyAJHa9ajvEQZ5Jt4Oj/65Ab
         STXw==
X-Forwarded-Encrypted: i=1; AJvYcCUiCObdKdYjkV6QbkwEI4k/xjqnIE1sfDfmf5SMgwa7/IfIdmm7uFHJcBq2nEdLf0gLCPlZm+Kdq9tIgJyonPgFGQMc4L6YcLoe/gr+SDY=
X-Gm-Message-State: AOJu0YxSQbwYyCsRXXFi1RvFASF9vpmf4nwEOaoNr+GPnWWxoEd5LZOl
	G/5pMSe/yjYB/C7Uu3FD2Iud+8y7HwdJZTbBt1Pso4BjJuuq8BUBKAqj0GRoKraku9CMpIoWG3M
	=
X-Google-Smtp-Source: AGHT+IFxegS5cwIrwq5HZygD8O8169/FHPUlrQw+dcOp0boltitFTI6KNueKUiwSy+iPkn5BEtfNYw==
X-Received: by 2002:a2e:87d5:0:b0:2da:7cac:a75e with SMTP id v21-20020a2e87d5000000b002da7caca75emr7858776ljj.22.1713879217671;
        Tue, 23 Apr 2024 06:33:37 -0700 (PDT)
Message-ID: <e685068a-6df7-4a70-b62a-43982b05d4d9@suse.com>
Date: Tue, 23 Apr 2024 15:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen-livepatch: fix parameter name parsing
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20240423131249.29825-1-roger.pau@citrix.com>
 <20240423131249.29825-2-roger.pau@citrix.com>
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
In-Reply-To: <20240423131249.29825-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.04.2024 15:12, Roger Pau Monne wrote:
> It's incorrect to restrict strncmp to the length of the command line input
> parameter, as then a user passing a rune like:
> 
> % xen-livepatch up foo.livepatch
> 
> Would match against the "upload" command, because the string comparison has
> been truncated to the length of the input argument.  Instead the truncation
> should be done based on the length of the command name stored in the internal
> array of actions.

But then "xen-livepatch upload-or-not foo.livepatch" would still wrongly
match. Why strncmp() at all, rather than strcmp()?

Jan

> Fixes: 05bb8afedede ('xen-xsplice: Tool to manipulate xsplice payloads')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v2:
>  - New in this version.
> ---
>  tools/misc/xen-livepatch.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/misc/xen-livepatch.c b/tools/misc/xen-livepatch.c
> index 5bf9d9a32b65..a246e5dfd38e 100644
> --- a/tools/misc/xen-livepatch.c
> +++ b/tools/misc/xen-livepatch.c
> @@ -572,13 +572,15 @@ int main(int argc, char *argv[])
>          return 0;
>      }
>      for ( i = 0; i < ARRAY_SIZE(main_options); i++ )
> -        if (!strncmp(main_options[i].name, argv[1], strlen(argv[1])))
> +        if (!strncmp(main_options[i].name, argv[1],
> +                     strlen(main_options[i].name)))
>              break;
>  
>      if ( i == ARRAY_SIZE(main_options) )
>      {
>          for ( j = 0; j < ARRAY_SIZE(action_options); j++ )
> -            if (!strncmp(action_options[j].name, argv[1], strlen(argv[1])))
> +            if (!strncmp(action_options[j].name, argv[1],
> +                         strlen(action_options[j].name)))
>                  break;
>  
>          if ( j == ARRAY_SIZE(action_options) )


