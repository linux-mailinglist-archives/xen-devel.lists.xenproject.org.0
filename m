Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A68AA9047B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 15:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956124.1349623 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52yC-0000kj-Rh; Wed, 16 Apr 2025 13:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956124.1349623; Wed, 16 Apr 2025 13:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u52yC-0000ij-Ot; Wed, 16 Apr 2025 13:38:28 +0000
Received: by outflank-mailman (input) for mailman id 956124;
 Wed, 16 Apr 2025 13:38:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yQHX=XC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u52yB-0000id-Jv
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 13:38:27 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 132bac1d-1ac8-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 15:38:26 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3995ff6b066so3763031f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 06:38:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4c7ef9sm21646085e9.6.2025.04.16.06.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 06:38:25 -0700 (PDT)
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
X-Inumbo-ID: 132bac1d-1ac8-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744810706; x=1745415506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=O/yjlkL7pDSN8uTe6rckIItd7b8kB8Ksy8YfQQktLxI=;
        b=Bp/iQNEedg6VCcgkOVxg1/1F29UGNWo0M2hy+x475Rugl3fP+nJEgVQs71QTmKSsSC
         msJgZJ0Ct81tZqsZZtnwMXnLEjs45GGg49zf8JA3w4LuuZz1MOTURVYWuBJoK0j/+nGK
         9awLAeJQmxQgCcQEwfNR/cXinFfA1O6gqRXd+QdLBUeT9QvC7ld8C4sJV1wYChXbuDH+
         bqBTUbdrMOYPfbrqxjzg8atIJdu5B8ILRievjWXHNvitlW6NB7/3uBprcjPE0hxfex2r
         YenLi8EP4zzD+ySGJwPezAs0mOI6i4sEHcF8g4aUsgZ0oHXih9KV9OuIzIX/o4AHopBJ
         hX0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744810706; x=1745415506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O/yjlkL7pDSN8uTe6rckIItd7b8kB8Ksy8YfQQktLxI=;
        b=e2TaY0FBvW7rkpxWJ3pzB1li7u9BFtFaYNW1tTWg6nQE2/DqxOsdWOtSfS/4ZEjWag
         ZFpR3WWJulgqn4en9UH64kuvDxDDY1m5UMEDw5fnmZR6MhVU8D+ZLwepqA8ChZxombZs
         LWh6XnnByMFs6BCedxCAd3e9hJgPiIZfLEGKRReNcxqlm6beavHRWRbBpyaCOCHzy4Iq
         Zg2teh4BpEuol7yT4Zg3PEPMR7/dRQhZRluWC7Zks+1kbx/h6fAcJPpKtG7yAolaABRc
         CdldDWdc1WusHoUmSZml+HWC9sFe92N9LeLYdGyYLMsj1bfOUyWGO674xwz2kI2RzmaB
         IM6w==
X-Forwarded-Encrypted: i=1; AJvYcCVJDRvCZ0/riEYcQn1xOmXuSDG+S6KfVKurAsNBCTnKGglOb+MfprHsSeMiDC5ejvceXUtvG5LZxsc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx2sUE/1MACxm5Ho3l3pzvdek7VseVdk2t4IhnmwyjXeFG5gGLT
	TvvxY7uuuQUavqPtZ/Lr6xZEIFDujXgJnjot0KG65TMagiXvlUox6B3thp5iEg==
X-Gm-Gg: ASbGncvYGOv44wbH8y5/vTU7Ti3KljI0V9M5WvYYU426XP2WYBnfV90a1/Hl3Z++KTA
	8T5QodQsbSGRyZMRnG1BEdr8u8vrOh8YmPZ76JIlMkUqLMMvsYOogGM5h4ndQohMxFExQ1vfuN1
	5WDTBmBuKL+yjwjQlIvwvIozJ2KGJae1jkvPt1V8dvZEO7kr4Fst0VYmfT0ymvWnPE/YGjvbsMv
	oeAhMHEa9iiYG3+I1NDAUIVw+YBYzt/UdYjDwTr6EwDKgDktqwr9Dj9IAmMUPbMQi1G3retAPDg
	XnB2K9ydnim84dd+BsrfNYVy1rzP/xQYrkzLp5mlE1z7EXhGlZV2bzHMEAnKEYo+UH5N/Mt+OVR
	BLed6klXXxU9fA5Pj5zXwjk4/uA==
X-Google-Smtp-Source: AGHT+IGujm57Euq/jeOoRRZy9/sLzRzs5WaMEvmuhYVclfpveYWHli68XHTta9UB+X99WtjuXSn/Jg==
X-Received: by 2002:a5d:598e:0:b0:391:1222:b444 with SMTP id ffacd0b85a97d-39ee5b17cdbmr1883064f8f.20.1744810706096;
        Wed, 16 Apr 2025 06:38:26 -0700 (PDT)
Message-ID: <c9290102-d29d-4c54-9052-995e960e4ea0@suse.com>
Date: Wed, 16 Apr 2025 15:38:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device
 tree
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-14-agarciav@amd.com>
 <7a13e61b-8568-4852-bb46-974964e02d61@suse.com>
 <82fe6290-ea16-4e4f-8be4-76b9b624e398@apertussolutions.com>
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
In-Reply-To: <82fe6290-ea16-4e4f-8be4-76b9b624e398@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.04.2025 15:32, Daniel P. Smith wrote:
> On 4/10/25 07:57, Jan Beulich wrote:
>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>> --- a/xen/arch/x86/domain-builder/fdt.c
>>> +++ b/xen/arch/x86/domain-builder/fdt.c
>>> @@ -193,6 +193,25 @@ static int __init process_domain_node(
>>>               bd->domid = (domid_t)val;
>>>               printk("  domid: %d\n", bd->domid);
>>>           }
>>> +        else if ( strncmp(prop_name, "mode", name_len) == 0 )
>>> +        {
>>> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>>> +            {
>>> +                printk("  failed processing mode for domain %s\n", name);
>>> +                return -EINVAL;
>>> +            }
>>> +
>>> +            printk("  mode: ");
>>> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
>>> +            {
>>> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
>>> +                    printk("HVM\n");
>>> +                else
>>> +                    printk("PVH\n");
>>> +            }
>>> +            else
>>> +                printk("PV\n");
>>> +        }
>>
>> My prior questions here remain: What's the significance of
>> BUILD_MODE_ENABLE_DM when set alongside BUILD_MODE_PARAVIRT? What about
>> any of the other bits being set?
> 
>  From boot-domain.h:
>                                            /* On     | Off    */
> #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
> #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
> 
> The logic says, if BUILD_MODE_PARAVIRT bit is not set, thus an HVM 
> domain, check if BUILD_MODE_ENABLE_DM has been set. This is determin if 
> the domain is what the toolstack differentiates as either an HVM or PVH 
> domain. As you should know, there is no case of a PV domain requiring a 
> backing device mode (DM) domain. IOW, BUILD_MODE_ENABLE_DM is only 
> relevant to an HVM domain.

And hence should (my conclusion) never be set for a PV one.

Except - how wide or narrow do you mean "DM"? There are certainly cases
where a PV guest requires a qemu to serve as backend for one or more
devices. That's not what "DM" originally meant, but it goes in that
direction. Hence just to avoid such an ambiguity I think it's better to
properly reject any flags / flag combinations that we can't make sense
of.

Jan

