Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A4A81D73
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:48:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943426.1342232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PEk-0000WF-Rh; Wed, 09 Apr 2025 06:48:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943426.1342232; Wed, 09 Apr 2025 06:48:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2PEk-0000Tn-Og; Wed, 09 Apr 2025 06:48:38 +0000
Received: by outflank-mailman (input) for mailman id 943426;
 Wed, 09 Apr 2025 06:48:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2PEj-0000TU-HK
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:48:37 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8b6d9a5-150e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:48:35 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cfe574976so43597115e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 23:48:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2066d92csm9850385e9.24.2025.04.08.23.48.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 23:48:22 -0700 (PDT)
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
X-Inumbo-ID: a8b6d9a5-150e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744181315; x=1744786115; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WvYHZ2ohepgi0c0hKQInC4JLDSkuPsQaO80VHvx7THs=;
        b=EDjv7XDlzkDxOG/9ywtB5PNrri83a01/NVt0NCsWo1thRfKuojBiY2fUzr05EzY/MX
         5nZOdmgi0XQ0wpNrbFiIEbTdaG5rujDAmP38qQuxDAwpNhKf6IeTwPTEOWOEvIobWyHu
         2F92lPUlUvDQtIN8nwiRHQWiKS2A0ILsXl42GJDiWyogDDOcpdMll4HzHzvczq0ybDrj
         nrLTqCgXO2YebfbO7Aj7LegvdLAzckCrp4/kNQQQ2MSI+DAMz4Kjqjo4mL2KXauPx/NN
         72VekEhBa5fgpSIvkwit4vfLlfoXgq+iv8Xr2j1HLzIub5E1TAfn/46S3A3kid/2gwFG
         oyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744181315; x=1744786115;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvYHZ2ohepgi0c0hKQInC4JLDSkuPsQaO80VHvx7THs=;
        b=tXtYjhagjV4VjU7w2RaGDFGYJ6eAiFGCf1TVryVSNcr2EGBrTU6mvPVkGxXhraGziR
         oxFj2dxdh5aLFOl6JEErhmFpKCD5c9ATs14xNt4U0RrcUq+c0XpZO+zGSAIvUk/QlurV
         ODJsdIfgaLDJL/N1PJydp2Vu6L3dmSSpcFJJrbQU+Rc19tjlIYRsfoSK74ws1fOBzxDA
         7H/f3ijxjqXhiQnzGfebVGomjidAY+j2zTupNawp9kScfFp67/I3UCj2i5anEl73SUoy
         qLdIZRHv7UbRyE5B55X+RI4n+h6QsslRCLXMhqFa6DrXV8cVqWMokwepPHroM83/s1rR
         Qwpg==
X-Forwarded-Encrypted: i=1; AJvYcCVxDtcJp/EgDL2B/HTGhW5K+dTw0CJ5MAGFU1UHHRYvYerOLrWnJ7YeCl0WbdEbDS5eOPJNfQa8wwE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YygNurHXsQhC9jTCJYrUDTS2KgrgrXIOIRdCnge2l80ZkFRcyRG
	pc+NxxZ2SLqAQLrVpynMVawKqxNm+R/RolOXEN7ThLdo4+GmWWPOYSPD8H2JEg==
X-Gm-Gg: ASbGncvxugVbtyLMSpeMWtCfyJCo0WvBV5jdZyZWMbQ08swwjmZxfoihjuiBf0AoZcf
	FRdH6O3B/rZik4h00dsZKlYf9aUDfe+n05RjnRkM4XPQMQOrn5ZilP1QuI7839Ay5YVJGsovXO7
	urDJIj01TD3H7YsiC6EXr60wU2FvqEnvmW/kgsM8kJKSl2c4NJMC3etLbjlcQMTrNryZCg90fCw
	9tPz+Fb/DQCmRgXtXYcLLUIIX6gW4tDI/WoeJg0au+xRG12+f0+Io4VIPQoeleoRPOe5pODdmZB
	b/Zq3BBf3vNh0f7RzsjuztrlYAcpz23c0F76VzKfIlW2iyopOACPvx9f501XVfVjj0eawR76O8U
	hrLSGbCpcjPoWvjrTcrb1KsfUMkWfV1F6W6RZ
X-Google-Smtp-Source: AGHT+IEWVL0PB4RWdW7R1dRQiA52jMMvZtAo7x2u6d5Az80ULjeCT5JrJVuR2Ge7vCd6Rs8G34VgEw==
X-Received: by 2002:a05:600c:1d86:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-43f1ed671d7mr15313805e9.31.1744181303150;
        Tue, 08 Apr 2025 23:48:23 -0700 (PDT)
Message-ID: <cdf00f8c-2143-48d6-abdc-8f56dafcc84c@suse.com>
Date: Wed, 9 Apr 2025 08:48:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/16] x86/boot: add cmdline to struct boot_domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-4-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-4-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> 
> Add a container for the "cooked" command line for a domain. This
> provides for the backing memory to be directly associated with the
> domain being constructed.  This is done in anticipation that the domain
> construction path may need to be invoked multiple times, thus ensuring
> each instance had a distinct memory allocation.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
> ---
> No changes on ACPI cmdline handling on PVH, as it's orthogonal to the
> purpose of this patch.
> 
> v3:
>   * s/xfree/XFREE/ on failed construct_dom0() to avoid a dangling
> cmdline ptr.
>   * Re-flow hvm_copy_to_guest_phys() into a multi-line call.
>   * s/bd->cmdline != NULL/b->cmdline/ (to homogenise with the previous
>     cmdline pointer check)
> ---
>  xen/arch/x86/hvm/dom0_build.c          | 12 +++----
>  xen/arch/x86/include/asm/boot-domain.h |  1 +
>  xen/arch/x86/pv/dom0_build.c           |  4 +--
>  xen/arch/x86/setup.c                   | 50 +++++++++++++++++++-------
>  4 files changed, 47 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
> index 2a094b3145..ebad5a49b8 100644
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -653,7 +653,6 @@ static int __init pvh_load_kernel(
>      void *image_start = image_base + image->headroom;
>      unsigned long image_len = image->size;
>      unsigned long initrd_len = initrd ? initrd->size : 0;
> -    const char *cmdline = image->cmdline_pa ? __va(image->cmdline_pa) : NULL;
>      const char *initrd_cmdline = NULL;
>      struct elf_binary elf;
>      struct elf_dom_parms parms;
> @@ -736,8 +735,8 @@ static int __init pvh_load_kernel(
>              initrd = NULL;
>      }
>  
> -    if ( cmdline )
> -        extra_space += elf_round_up(&elf, strlen(cmdline) + 1);
> +    if ( bd->cmdline )
> +        extra_space += elf_round_up(&elf, strlen(bd->cmdline) + 1);
>  
>      last_addr = find_memory(d, &elf, extra_space);
>      if ( last_addr == INVALID_PADDR )
> @@ -778,9 +777,10 @@ static int __init pvh_load_kernel(
>      /* Free temporary buffers. */
>      free_boot_modules();
>  
> -    if ( cmdline != NULL )
> +    if ( bd->cmdline )
>      {
> -        rc = hvm_copy_to_guest_phys(last_addr, cmdline, strlen(cmdline) + 1, v);
> +        rc = hvm_copy_to_guest_phys(last_addr, bd->cmdline,
> +                                    strlen(bd->cmdline) + 1, v);
>          if ( rc )
>          {
>              printk("Unable to copy guest command line\n");
> @@ -791,7 +791,7 @@ static int __init pvh_load_kernel(
>           * Round up to 32/64 bits (depending on the guest kernel bitness) so
>           * the modlist/start_info is aligned.
>           */
> -        last_addr += elf_round_up(&elf, strlen(cmdline) + 1);
> +        last_addr += elf_round_up(&elf, strlen(bd->cmdline) + 1);
>      }
>      if ( initrd != NULL )
>      {

Perhaps better introduce a local variable cmdline_len? That would allow the first
if() to go away (but of course not its body).

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -978,10 +978,30 @@ static unsigned int __init copy_bios_e820(struct e820entry *map, unsigned int li
>      return n;
>  }
>  
> -static struct domain *__init create_dom0(struct boot_info *bi)
> +static size_t __init domain_cmdline_size(
> +    struct boot_info *bi, struct boot_domain *bd)

const for both? And perhaps s/domain/dom0/ in the function name?

>  {
> -    static char __initdata cmdline[MAX_GUEST_CMDLINE];
> +    size_t s = bi->kextra ? strlen(bi->kextra) : 0;
> +
> +    s += bd->kernel->cmdline_pa ? strlen(__va(bd->kernel->cmdline_pa)) : 0;
>  
> +    if ( s == 0 )
> +        return s;

While this retains prior behavior, that prior behavior was certainly odd (and
pretty likely not meant to be like that).

> @@ -1043,17 +1067,19 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>  
>          if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
>          {
> -            safe_strcat(cmdline, " acpi=");
> -            safe_strcat(cmdline, acpi_param);
> +            strlcat(cmdline, " acpi=", cmdline_size);
> +            strlcat(cmdline, acpi_param, cmdline_size);
>          }
> -
> -        bd->kernel->cmdline_pa = __pa(cmdline);
> +        bd->kernel->cmdline_pa = 0;
> +        bd->cmdline = cmdline;
>      }
>  
>      bd->d = d;
>      if ( construct_dom0(bd) != 0 )
>          panic("Could not construct domain 0\n");
>  
> +    XFREE(cmdline);

While this tidies the local variable, what about bd->cmdline? As it stands this
gives the impression that you're freeing a pointer here which may still be used
through passing bd elsewhere.

Jan

