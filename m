Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED18B0168
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 07:58:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711110.1110808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVe1-0005i0-JX; Wed, 24 Apr 2024 05:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711110.1110808; Wed, 24 Apr 2024 05:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzVe1-0005gX-FV; Wed, 24 Apr 2024 05:58:13 +0000
Received: by outflank-mailman (input) for mailman id 711110;
 Wed, 24 Apr 2024 05:58:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzVe0-0005gR-8N
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 05:58:12 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0ffc3e4-01ff-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 07:58:10 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-41aa15ae26dso15741785e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 22:58:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc19-20020a05600c525300b00418981b59d4sm26446427wmb.10.2024.04.23.22.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 22:58:09 -0700 (PDT)
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
X-Inumbo-ID: a0ffc3e4-01ff-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713938290; x=1714543090; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6NFqir/0y6lb16rOITMVcMyo8mh42R+P942bXo2UJ04=;
        b=OO4J/ZtqAv4iUBZlmu5KFM4Y3/hZ3ejB8B7p+CKZfzllu0AbeGOlKopCvHtY/Bb92+
         Z9XlxP5w70hZm+dHRQZ/8CQ96Rg2JAGTAR4PuEs5OAaI+grylB2EOst4R+OlmnlwnIbb
         ZKRKXVzLjMFEcuSRomRgcCJhTjWuWl33QQ9CYTfTJwVWXz+2jnoEOt8Ebzt+FVwwyApM
         ImDV321KCb9LQ33Y/PlGJw1zrTMYwxUHLMY8Me+nvTI9kyLJkGE3a09c+35N7JxCsxCU
         DHW1KmOTqaqP+5kZHdRdZScyd4TroN9YAwZ59Bp6dmt8fGIxlvaOX6/CQG/e+th/PNIk
         Tilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713938290; x=1714543090;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NFqir/0y6lb16rOITMVcMyo8mh42R+P942bXo2UJ04=;
        b=W6eJDTJobauhsHgC49+RHnL056AA4lqccjRjkSCBiZcqt1coWpSGUkzW9Op0c/CrFx
         AJsEV4p9g5wD2IUym6p2WBiD38aBWMGPnz7cPNKeZzNdZkHr9yvJuUkF1ltVxPj8M9T+
         /eA8pH+DOv8MN43D7oDEtbg927oBd/z56SSG903f1iZCQxBh8g2JkCvFwN5NS69Ahlk2
         OagQZ7NRQqfkkmE982RtOTbwWUC8xPYwcJMcTNl3A4lqTY23eid04ttZXXHW4VtNoeJc
         DJvnljdvG08RmIr8C/AMrH+JcgIAEUzcHWfX26ZDdBpcgkcjr6JdxLrtLOFUCpI8DRg+
         3wmw==
X-Forwarded-Encrypted: i=1; AJvYcCX2lttAICc8q7ja0PoeX6FjKoTe0UlQsOrHUwtfUlpdlNITt6IdJuE7Or5VqXNImxx9mo1/vgqEFAlCPZ1bD4oVmndOPDtY4cw1+jhgSRk=
X-Gm-Message-State: AOJu0Yz1BG7W32CIwaC+3WV4/BNaHIL3NxbDt+OiJU0qIJA7LqjqoYtk
	d6eSMlUhZSLCpS3F4NS04BHXNTOd0UOuDP+wnEfxT5O0IbMfwpgQh11lX8BNbLykueljIAJj7XY
	=
X-Google-Smtp-Source: AGHT+IHdfU/BawBTr3iT0VVseTxYXnxbVRmB8mxVpEJE+s/zDacyvl2j/mB7XZhkwv2U1QIzz8woZA==
X-Received: by 2002:a05:600c:3585:b0:418:dd73:b0a1 with SMTP id p5-20020a05600c358500b00418dd73b0a1mr998352wmq.39.1713938289744;
        Tue, 23 Apr 2024 22:58:09 -0700 (PDT)
Message-ID: <6cba6a94-8bc3-4302-846e-0eae03e77306@suse.com>
Date: Wed, 24 Apr 2024 07:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] xen/commom/dt-overlay: Fix missing lock when remove
 the device
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-2-xin.wang2@amd.com>
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
In-Reply-To: <20240424033449.168398-2-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 05:34, Henry Wang wrote:
> --- a/xen/common/dt-overlay.c
> +++ b/xen/common/dt-overlay.c
> @@ -381,9 +381,14 @@ static int remove_node_resources(struct dt_device_node *device_node)
>      {
>          if ( dt_device_is_protected(device_node) )
>          {
> +            write_lock(&dt_host_lock);
>              rc = iommu_remove_dt_device(device_node);

Any particular reason you add two call sites to the unlock function,
instead of putting it here?

Jan

>              if ( rc < 0 )
> +            {
> +                write_unlock(&dt_host_lock);
>                  return rc;
> +            }
> +            write_unlock(&dt_host_lock);
>          }
>      }
>  


