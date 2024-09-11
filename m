Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA949752EA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 14:53:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796617.1206348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMqj-0001QG-MD; Wed, 11 Sep 2024 12:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796617.1206348; Wed, 11 Sep 2024 12:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soMqj-0001Nm-JX; Wed, 11 Sep 2024 12:53:33 +0000
Received: by outflank-mailman (input) for mailman id 796617;
 Wed, 11 Sep 2024 12:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z7kF=QJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soMqh-0001Ng-WE
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 12:53:32 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d812378e-703c-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 14:53:29 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3770320574aso4255949f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2024 05:53:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd467desm5329858a12.40.2024.09.11.05.53.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 05:53:28 -0700 (PDT)
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
X-Inumbo-ID: d812378e-703c-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726059209; x=1726664009; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SoWglAh5x7gICMi4PD1iSKjRjwqGRfa+nSn29tUz9A0=;
        b=cwlfc8Q5+vFmHhlHhgO96egzFwAq6ctTJ7Q36li48XApAhkMrbxgd5qd9vuAwzsVHa
         tVvHKtsrFsImkPRjObgSDf6csR2mhOBzlmmWoYvqcvflrTaS8dIas+y0t6wMozrJg8NT
         ef4AQw/7jD/O6L+5vnUO6P4q0nkmRL98yWmgFl5FrDkoxQ/RXtAMzF+ObADE+BRdpUXF
         jI9mNayknJbWfGByhCIXdoKZtHztGRpp3z8mfCXXd3+GK40AhEffDpOVEv2o5G04IgFN
         1KhM5Jizdpy1zDodXA5ti5bZjqlDc7Dbt94Qf5RqBrVFgqlusi1V7VqOGfzD5hHQtiRC
         AKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726059209; x=1726664009;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoWglAh5x7gICMi4PD1iSKjRjwqGRfa+nSn29tUz9A0=;
        b=Z5yecgES3dh7Z7RZ0i4S+MxhJ0PvBfXUAR9DyDT68BlvzHyDl1seI5mLlcPCYcFzMB
         FjqI7PhHoTJKlGUun4cE/NJfYIgujjGkTg+PbyUVamYArXbk4uBRVJOQXgrB87HIWWgy
         SyZ6zplIAVKMiOubaFncohimogmrxScfnIHdn9i82Kl9eijH5Je3BL3FCxDmg/5P4jB6
         tPZvICMqikMa3GQMbmFBSt9CAOe/h3Ibu0aOls0y1eNZks42UOG9KvFdwrqAPR1OPyLw
         72IWlfZyiyw+8HwntyfSYr/uWPEUFdNC1hCk1J9hdEVipYmcfVgBlDQTdSVJju4fG67j
         LVYA==
X-Forwarded-Encrypted: i=1; AJvYcCURnWeOCRM0qD0vV2+JQgWFTZEE32WNFATGwUiaRK+FPwsd61q13Vz7MCOshbsoLqok0lfhhvy7GG8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyggTqm9YVD4tSuuXegTgZO1j1dY0zj/ot1CWTX6QWgBKpf7Jaf
	NZXuzrsiLwhuBHbjDzXIx+TmjxvrnqAMuxiHqvX7jj6meKoLlZyvU964ujOtWgaidVNHdKkoazo
	=
X-Google-Smtp-Source: AGHT+IHWLfEYRgn6s49Gibb4wUD0EN47Wl/DXHnLbOEHUGkclWxg6G8ltY89GtU84B+1jrip/zdFQg==
X-Received: by 2002:a5d:6608:0:b0:374:cbe8:6f43 with SMTP id ffacd0b85a97d-37889600838mr10373117f8f.33.1726059209090;
        Wed, 11 Sep 2024 05:53:29 -0700 (PDT)
Message-ID: <647cf7c8-7917-4f60-8a59-c7eb2e3977a5@suse.com>
Date: Wed, 11 Sep 2024 14:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/3] xen/gnttab: address violations of MISRA C Rule
 13.6
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725994633.git.federico.serafini@bugseng.com>
 <6dd66745505bea8f8730da297d521e842026d40b.1725994633.git.federico.serafini@bugseng.com>
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
In-Reply-To: <6dd66745505bea8f8730da297d521e842026d40b.1725994633.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 21:06, Federico Serafini wrote:
> --- a/xen/common/compat/grant_table.c
> +++ b/xen/common/compat/grant_table.c
> @@ -78,12 +78,15 @@ int compat_grant_table_op(
>          cmd_op = cmd;
>      switch ( cmd_op )
>      {
> -#define CASE(name) \
> -    case GNTTABOP_##name: \
> -        if ( unlikely(!guest_handle_okay(guest_handle_cast(uop, \
> -                                                           gnttab_##name##_compat_t), \
> -                                         count)) ) \
> -            rc = -EFAULT; \
> +#define CASE(name)                                                      \
> +        case GNTTABOP_ ## name:                                         \

Why the re-indentation? The earlier way was pretty intentional, to match
what a non-macroized case label would look like in this switch.

> +        {                                                               \
> +            XEN_GUEST_HANDLE_PARAM(gnttab_ ## name ## _compat_t) h =    \
> +                guest_handle_cast(uop, gnttab_ ## name ## _compat_t);   \
> +                                                                        \
> +            if ( unlikely(!guest_handle_okay(h, count)) )               \
> +                rc = -EFAULT;                                           \

Same question as for the earlier patch - where's the potential side
effect?

Jan

