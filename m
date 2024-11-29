Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C469DC2AC
	for <lists+xen-devel@lfdr.de>; Fri, 29 Nov 2024 12:17:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845940.1261255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGyzl-0000Ho-Rh; Fri, 29 Nov 2024 11:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845940.1261255; Fri, 29 Nov 2024 11:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGyzl-0000FA-Nl; Fri, 29 Nov 2024 11:17:09 +0000
Received: by outflank-mailman (input) for mailman id 845940;
 Fri, 29 Nov 2024 11:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGyzk-0000F4-5U
 for xen-devel@lists.xenproject.org; Fri, 29 Nov 2024 11:17:08 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76c90290-ae43-11ef-a0cf-8be0dac302b0;
 Fri, 29 Nov 2024 12:17:05 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ffa974b2b0so19038621fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 29 Nov 2024 03:17:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5d097e8db03sm1711480a12.56.2024.11.29.03.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 03:17:04 -0800 (PST)
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
X-Inumbo-ID: 76c90290-ae43-11ef-a0cf-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoyMzUiLCJoZWxvIjoibWFpbC1sajEteDIzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc2YzkwMjkwLWFlNDMtMTFlZi1hMGNmLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyODc5MDI1LjE0NTIzMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732879024; x=1733483824; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rDu2tsNS+XK9rKpCqZLepS6OsSIEoZbg7fk9R3nnpUM=;
        b=Bx+s0Hz/Ebs64Dwmsbomf3YRubj18w1Y5uT8Tm4oBpcVJW+uZywyOL2lvv+OfILOGV
         +hYPcQx9qSuk3zuDc/fXeczT9s+ToxkMPdXp1/bPSQckuCG5xNz49dtDL8F3KmzlQ+KN
         D24aUc5zv65wl0mlXsMtsvwh2vpj9FpWFp5nC4oTv+Dkdt1NXTnc1EaA4C2kcYY/xujw
         dFso9aZwLx7bffon5nzJ1lS7JgdBJS0gEyaZCoLIFDvVCxf0VXcdSmbKpj5wJcfTDAar
         +igd/guh/Yvolp52WsQ0tqMm4+bNJ/qE9xpIc9hJNZdN4MhWPxHXGcDjgTKsUZdndk6p
         hHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732879024; x=1733483824;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDu2tsNS+XK9rKpCqZLepS6OsSIEoZbg7fk9R3nnpUM=;
        b=sI8GmH84OXDl+e0mfbIQzeqSr+mVDoTwUsK32PmXCaGZyTQx0j8JzzA4mOx3RbG0IE
         mdHrCfiz+VBXGBSs+qAD63UFA2OY2dXsW9btFIxID5Hgt3yvyLi48khC3/AzCppBDtiS
         lStZVgOF9EF1x7o8LuxDO7LA45dYEC+xY9VWu7uVaeOOQa4/sBNGiWv7nCLtrpOvYjeC
         Q1Md+iPW8pF7xezVWiqSjQOqJ2kPC7q1tGOG8glngRPp3Sgk0REDi6atjrgDyqKTPxoc
         bNiuREomZ7KpvL1Rxf3sYLSKcfysV9vLRw66g3Y6rplZKamjRcwqlQmX55wnyf5ithmS
         UrNw==
X-Forwarded-Encrypted: i=1; AJvYcCWVUPJuQ8gyQTWOju424O2CUUNa/tXkgi2TQdlu4qkIPJhBwskhsXciLUloHbyiRS46vTUJHDvVpaM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxd2f/m3BVaRx4/1cMOr2GtnMmGP0ZtiDnUBxtnuts8sH0Ioy6a
	KcnN4iK6xb9GyXlBC2vmM7QVxELow8+XXgE3IgvqghiRoZvJG5sWVvFO7UoLig==
X-Gm-Gg: ASbGncsqm+UiKtj1UaSa8ejTILm/bfT/nQU7RSaBxetKWb7uZsHnpr57bospfDHPkYA
	wVCqrpNuHCy/9r79OTk1EP4T5E3HJv5FMl3tEPTTdShr0s0T7dN7bTDS91dZKOUfSsyGAEWc6Pc
	NFd8/9/r49FBnJJ1f6joTQLAkEsEKrqQEOZHM8ZnPTOVP8e9aqBy8zYne4CE2LmWv7IfNu+59OT
	YwAydy6ZD1UKsAezyNxigaZ18lLFoIRK+ayGEvdBcV56Nib82RhPwDhvPa33NZlNfvHUNzFcdH5
	kdOlrYg225sCeqwScNoy+B/bc2p8chvI29o=
X-Google-Smtp-Source: AGHT+IGgjQNBUVrMpim7RRBQYHZLwGCdypmRALaEhY3Tg0nw3FncTXP/4IIdZZINLFr2vK30SrkqpQ==
X-Received: by 2002:a2e:9e4b:0:b0:2ff:e1ec:e6c7 with SMTP id 38308e7fff4ca-2ffe1ece72emr24625141fa.39.1732879024487;
        Fri, 29 Nov 2024 03:17:04 -0800 (PST)
Message-ID: <78ba5afd-43ab-4a3c-b9bf-384f1d61b2a8@suse.com>
Date: Fri, 29 Nov 2024 12:17:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/12] xen: add cache coloring allocator for domains
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
 <20241119141329.44221-10-carlo.nonato@minervasys.tech>
 <5f876671-4624-4ec6-957e-d4a7802fb46a@suse.com>
 <CAG+AhRWAwkwd6w8+TOp8k+9pxj9=JvEjwNode_HrgdwMZHE5Qg@mail.gmail.com>
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
In-Reply-To: <CAG+AhRWAwkwd6w8+TOp8k+9pxj9=JvEjwNode_HrgdwMZHE5Qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29.11.2024 10:37, Carlo Nonato wrote:
> On Thu, Nov 28, 2024 at 12:43 PM Jan Beulich <jbeulich@suse.com> wrote:
>> On 19.11.2024 15:13, Carlo Nonato wrote:
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -537,4 +537,12 @@ config LLC_COLORS_ORDER
>>>         The default value corresponds to an 8 MiB 16-ways LLC, which should be
>>>         more than what's needed in the general case.
>>>
>>> +config BUDDY_ALLOCATOR_SIZE
>>> +     int "Buddy allocator reserved memory size (MiB)" if LLC_COLORING
>>> +     default "0" if !LLC_COLORING
>>> +     default "64"
>>> +     help
>>> +       Amount of memory reserved for the buddy allocator to serve Xen heap,
>>> +       working alongside the colored one.
>>
>> As the description has nothing in this regard: Why again is it that this
>> can't simply have "depends on LLC_COLORING"? Even if it ends up with a
>> value of 0, in an LLC_COLORING=n (or LLC_COLORING entirely absent) .config
>> I'd find it at least irritating to see this setting to be there.
> 
> Quoting you from v8 (6 months ago, a lot of time ago I know, link here
> https://patchew.org/Xen/20240502165533.319988-1-carlo.nonato@minervasys.tech/20240502165533.319988-10-carlo.nonato@minervasys.tech/#5c16f53f-3bb0-49d6-b174-b0e8c6ceff4c@suse.com):
>>> +/* Memory required for buddy allocator to work with colored one */
>>> +#ifdef CONFIG_LLC_COLORING
>>> +static unsigned long __initdata buddy_alloc_size =
>>> +    MB(CONFIG_BUDDY_ALLOCATOR_SIZE);
>>
>> I think it would be quite nice if this and ...
>>
>>> +size_param("buddy-alloc-size", buddy_alloc_size);
>>> +
>>> +#define domain_num_llc_colors(d) (d)->num_llc_colors
>>> +#define domain_llc_color(d, i)   (d)->llc_colors[i]
>>> +#else
>>> +static unsigned long __initdata buddy_alloc_size;
>>
>> ... this were folded. Which I think would be possible if the Kconfig
>> addition went like this:
>>
>> config BUDDY_ALLOCATOR_SIZE
>> int "Buddy allocator reserved memory size (MiB)" if LLC_COLORING
>> default "0" if !LLC_COLORING
>> default "64"

Hmm, I see. I didn't consider the negative effect back at the time, it seems.
The main goal was anyway to get rid of the multiple instances of
buddy_alloc_size. I'm sure that can be easily achieved also when going back
to the original form of the Kconfig option (at least partly by following what
I said in the initial reply to this v10 patch, I think).

Jan

