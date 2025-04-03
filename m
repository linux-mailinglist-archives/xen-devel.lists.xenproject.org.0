Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CE2A7A777
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 18:04:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936916.1338038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0N23-0004n0-B6; Thu, 03 Apr 2025 16:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936916.1338038; Thu, 03 Apr 2025 16:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0N23-0004kb-8N; Thu, 03 Apr 2025 16:03:07 +0000
Received: by outflank-mailman (input) for mailman id 936916;
 Thu, 03 Apr 2025 16:03:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0N21-0004kV-S4
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 16:03:05 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1dd54551-10a5-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 18:03:00 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-39c1efc457bso686953f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 09:03:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a0a90sm2149351f8f.21.2025.04.03.09.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 09:02:58 -0700 (PDT)
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
X-Inumbo-ID: 1dd54551-10a5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743696180; x=1744300980; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c5US3FgL+WnT5I1EmpBYGVjw3dvn8CZK924fJjLYUfQ=;
        b=Qbi87lFHVEYBtG787EOZnUPADQMng+efyiBNEiTBDx2HxN8riE+5B/X5zcqpHbpu+c
         shkIXfs/wlp7N/nguvSF8P9+GY20IN9Mkq6qjz32XIKUVDmAho5QZx05pnmY2xLQQmc3
         ht3/16u8cN3VZjBf7mo+EOHeBwusvq2cDT9JqAc0SJfM0/uVJs55jD80Ro/+6/o4ZPNr
         0lAsqX6WQH/oUsRpvsIK8ylsGqMiasiAjozLCGec1avfs5Q3vKAFktXd/1KgESUmHMXp
         7exlfddaJgYYrIK5jPVUdUdjGDicYaToHqAMzTYMJQy31aDZSVj29A/CIv/FZUXWCszs
         bUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743696180; x=1744300980;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5US3FgL+WnT5I1EmpBYGVjw3dvn8CZK924fJjLYUfQ=;
        b=cu2frcUFvx44NP6czG/MclT0Oe3UERmOCaSox2NYIl7plqVogn2Kx1OZ6/KmeEg38b
         3L4ndhmsxw88Q/5+QaZrCS2kswkVJaOQ3ya5O2qaEvEKe4wuX43dqbIZW/6TAb0L6Yz7
         KSVtt0XK/X4WitlTxF0TSR4Bqae1uGIR1SaskR/astpJGGgFs7DZWUWNX3WZgwDmm1WR
         k43Ib7GN1RSSJHd2Tb191muf7CynWlExFtr2vE9IQePkEG1wMHtThGHrtcRa0GyzXTgg
         HaYFyFxG9Bzm7WYFM+VMXKCVq1hFYMEr0e/CAiMw11R80WMBEZVp72O/RYDAatIhUqWl
         6wAA==
X-Forwarded-Encrypted: i=1; AJvYcCW8sk3xj/rk97AjlF9ifDxHLupsZsS3D5aSjZ+xc+TWQK5BpnbQtB3BnkIROTxKDfWyCUgd5KzHGa4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzzcmu6WbY0M5h3JD2IdCNLAC7l/QSe20k2JEBPL61n0NX6nyQm
	NIcmHZ5ESkd6//KCOkRgLvSiDAAoZ/10bL5JlvDDgsBTVhoJ5B7Ku129rPW7bw==
X-Gm-Gg: ASbGncsbkBCmnvwa0ALa6FAdjcNCr5IwY8kyUO4uxVPcSKoV3bcSc7B8X9ing9VwrRM
	ZT7UML7Bi3t7m5M+0A2GkImtkBbxlqAnAjRCK6TUt6p6QgMAEJJ2augmxQynr9/X91mXWWnscxy
	HibNSIIENbg3g52aBeoqPLpI7H3sNEQ/k/T85yCQW9C4Ijn+ooWy6XqzNFtEJHDt3O5Tsa6Dz9m
	WdaT7kqd9cYyGEVbx4Wte3RR5m1JUgKHlZnq9rFP7FDXR+B8m4ab48E+jIeghwGHA/EnGP2RZQf
	twqNPKcyipw5YXksaiAfpBe10lLSGBHvP65O1BikvtgQZFOQ0wx4wVCUqDiBYbaDMH7J1yVcpSl
	BOzK5UzhA826TzULBKnmF2ITHNLtb5g==
X-Google-Smtp-Source: AGHT+IH3kFf3Zm2jflzuBv3P0V4X+DDf3UIY+wZnztn5dvluIHTB4AemB45+fYgBm6pQarNMzrFVTQ==
X-Received: by 2002:a05:6000:188e:b0:390:e158:a1b8 with SMTP id ffacd0b85a97d-39c2f9510dfmr2534036f8f.43.1743696179448;
        Thu, 03 Apr 2025 09:02:59 -0700 (PDT)
Message-ID: <ef5ef0a7-9eb9-43fc-a869-167904c95da6@suse.com>
Date: Thu, 3 Apr 2025 18:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] x86/domain: revisit logging in arch_domain_create()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250402214406.115578-1-dmukhin@ford.com>
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
In-Reply-To: <20250402214406.115578-1-dmukhin@ford.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 23:44, dmkhn@proton.me wrote:
> From: Denis Mukhin <dmukhin@ford.com>
> 
> Use %pd in all logs issued from arch_domain_create().
> 
> Also, expand error message in arch_domain_create() under
> !emulation_flags_ok() case to help debugging.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

A few nits:

> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -791,13 +791,12 @@ int arch_domain_create(struct domain *d,
>      {
>          if ( !opt_allow_unsafe )
>          {
> -            printk(XENLOG_G_ERR "Xen does not allow DomU creation on this CPU"
> -                   " for security reasons.\n");
> +            printk(XENLOG_G_ERR "%pd: Xen does not allow DomU creation on this CPU"
> +                   " for security reasons\n", d);

If this is touched, I think it would better become

            printk(XENLOG_G_ERR
                   "%pd: Xen does not allow DomU creation on this CPU for security reasons\n"
                   d);

to follow our "don't wrap format strings" principle.

>              return -EPERM;
>          }
>          printk(XENLOG_G_WARNING
> -               "Dom%d may compromise security on this CPU.\n",
> -               d->domain_id);
> +               "%pd: domain may compromise security on this CPU\n", d);

Personally I don't think the word "domain" needs adding here.

> @@ -807,16 +806,19 @@ int arch_domain_create(struct domain *d,
>  
>      if ( emflags & ~XEN_X86_EMU_ALL )
>      {
> -        printk(XENLOG_G_ERR "d%d: Invalid emulation bitmap: %#x\n",
> -               d->domain_id, emflags);
> +        printk(XENLOG_G_ERR "%pd: Invalid emulation bitmap: %#x\n",

Please switch to using a lower case 'i' on "invalid".

> +               d, emflags);
>          return -EINVAL;
>      }
>  
>      if ( !emulation_flags_ok(d, emflags) )
>      {
> -        printk(XENLOG_G_ERR "d%d: Xen does not allow %s domain creation "
> +        printk(XENLOG_G_ERR "%pd: Xen does not allow %s %sdomain creation "
>                 "with the current selection of emulators: %#x\n",

Here wrapping of the format string would also be nice to avoid. That
may call for an attempt to shorten the text a little. Maybe "with
this set of emulators:" would already help some.

Jan

