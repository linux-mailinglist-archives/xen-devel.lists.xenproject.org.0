Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC18581AFFA
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 09:04:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658552.1027759 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE2t-00014L-4Z; Thu, 21 Dec 2023 08:04:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658552.1027759; Thu, 21 Dec 2023 08:04:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGE2t-00011X-0p; Thu, 21 Dec 2023 08:04:43 +0000
Received: by outflank-mailman (input) for mailman id 658552;
 Thu, 21 Dec 2023 08:04:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rGE2r-00011P-AM
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 08:04:41 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9633d3bc-9fd7-11ee-98eb-6d05b1d4d9a1;
 Thu, 21 Dec 2023 09:04:38 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so6215685e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Dec 2023 00:04:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bl13-20020adfe24d000000b003365fcc1846sm1401555wrb.52.2023.12.21.00.04.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Dec 2023 00:04:37 -0800 (PST)
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
X-Inumbo-ID: 9633d3bc-9fd7-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703145878; x=1703750678; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DqtT/WY/Ly1y83oE/06BHEIzw3GUxg+ZWhjWOkGSgOg=;
        b=O3LjuikJ7hcniJr6xFKvIhKwzxWAG98U6/73EZ3GNvpgi5noDY5WtJSKVzTcUHAedO
         4ylQtnkT7Fk3OLwOXNcc5J7eCa0NZszyXaA1A0e1JbHIKh4lN/PqIWpqraY7oPHfyc6s
         DCLh8GxIH0SN2VApuNxdygYyzr4DjwU/BkEi10nzr2lRs+5mnx/2f/kPE2PNAMiu+Bnl
         r2I+PR8qW1NtOSBxGgFj/xJqly/jyDRal+1hK6mI02UYON0MlNcIRG50KNVgAV7CVy3l
         vGgegUQau1KFZa4lft8qcmBs4UmKoJlGQPVUARqmuoMu7hGyhNGvERuyexaJurrleAbm
         Xlew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703145878; x=1703750678;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DqtT/WY/Ly1y83oE/06BHEIzw3GUxg+ZWhjWOkGSgOg=;
        b=rJ3eQLzYG/E0pwuhz5o4nVtQBlpByCp11MwDnKUIB/nDHA6eFy4OT/CJ3PaNZHIAa1
         Or6+LLdAJgHCW2aAZ1u2x6THqNPzTzvg/e46DKGZdueubVrpWy+mL8grthikg4PVnCjO
         T/sDMU1VhEPWlATy8TzreqTRNHag1AKTWlDwBkMVubg9eeXFTta3HWLdD6wU2o3bYrDj
         sflswbkQu1XRcMKW/lAhYYoMipa/ZzcXZiv25NwXSUSJajb77cypPaYnXlndaFHAlbPd
         jy6GQUauC09viHDPGSM1WdxymZ3AaCZxYeb8qjeTlRjaz24hA8CkRFjYdn9OFBeuZ8Dp
         2I5Q==
X-Gm-Message-State: AOJu0Yx8RyIb68Ctd4Rv05LuvbZVFcZ2YCB5Uh2EvmFNRK8N5YqPLe6M
	YhKWjPyTRBbZtyVA7YtIKRzH
X-Google-Smtp-Source: AGHT+IHzDp6OvtMoV5YTYCzd2MKcZTPrvBABBnCjsMSYCAkVmgWgFQRbunUnE+fsGoTK9SfZ20FtBA==
X-Received: by 2002:a05:600c:511d:b0:3fe:1232:93fa with SMTP id o29-20020a05600c511d00b003fe123293famr579240wms.22.1703145877777;
        Thu, 21 Dec 2023 00:04:37 -0800 (PST)
Message-ID: <7483df1c-34f8-4e0e-aad4-c78f219c3d67@suse.com>
Date: Thu, 21 Dec 2023 09:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 5/7] xen/arm: v{cp,sys}reg: address violations of
 MISRA C:2012 Rule 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: consulting@bugseng.com, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <cover.1703066935.git.federico.serafini@bugseng.com>
 <541bc4fd47d26b12ea131590bf0c49f7c92d9368.1703066935.git.federico.serafini@bugseng.com>
 <0200354e-08b9-4136-b6e9-3220a51256af@xen.org>
 <9e9e3086-6311-4a76-8624-a06d52e7ec0b@suse.com>
 <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com>
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
In-Reply-To: <c3a128d9-dea8-4e05-b292-1a6a04fb0daf@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.12.2023 13:15, Federico Serafini wrote:
> On 20/12/23 12:55, Jan Beulich wrote:
>> On 20.12.2023 12:48, Julien Grall wrote:
>>> On 20/12/2023 11:03, Federico Serafini wrote:
>>>> --- a/xen/arch/arm/arm64/vsysreg.c
>>>> +++ b/xen/arch/arm/arm64/vsysreg.c
>>>> @@ -210,8 +210,8 @@ void do_sysreg(struct cpu_user_regs *regs,
>>>>            /* RO at EL0. RAZ/WI at EL1 */
>>>>            if ( regs_mode_is_user(regs) )
>>>>                return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
>>>> -        else
>>>> -            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>> +
>>>> +        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
>>>
>>> I don't 100% like this change (mostly because I find if/else clearer
>>> here).
>>
>> While (it doesn't matter here) my view on this is different, I'm still
>> puzzled why the tool would complain / why a change here is necessary.
>> It is not _one_ return statement, but there's still (and obviously) no
>> way of falling through.
> 
> The tool is configurable:
> if you prefer deviate these cases instead of refactoring the code
> I can update the configuration.

I guess this then needs to be discussed on the first call in the new year.
Stefano - can you take note of that, please?

Jan

