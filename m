Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD0A84E530
	for <lists+xen-devel@lfdr.de>; Thu,  8 Feb 2024 17:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.678344.1055513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7UI-0003Cg-Fg; Thu, 08 Feb 2024 16:42:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 678344.1055513; Thu, 08 Feb 2024 16:42:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rY7UI-0003AM-Cv; Thu, 08 Feb 2024 16:42:58 +0000
Received: by outflank-mailman (input) for mailman id 678344;
 Thu, 08 Feb 2024 16:42:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rY7UH-0003AG-AE
 for xen-devel@lists.xenproject.org; Thu, 08 Feb 2024 16:42:57 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c0085aa-c6a1-11ee-8a4a-1f161083a0e0;
 Thu, 08 Feb 2024 17:42:55 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33b5b6236afso432331f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Feb 2024 08:42:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h16-20020adff4d0000000b0033af3a43e91sm3966233wrp.46.2024.02.08.08.42.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Feb 2024 08:42:55 -0800 (PST)
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
X-Inumbo-ID: 1c0085aa-c6a1-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707410575; x=1708015375; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cGp8YxNLTClF4yl5BUibCCne27gUKs9JcvoLO4RVgmk=;
        b=RsF8/VkF7E8i1MrYQl3OFdTCULyooUcoKImaYSB98TjFcP1qggvaNeIoaNSi+FC6Ch
         9Lwaj7dEYeJKfJx5tY1m3t5u7jcnFb5M+lxyliSchXjdZXyjK2BTKKygij2eEXANTnv4
         W3aiFk5td7iEFIj1h8Ir0Urko8fa+o+tLnRY6MikZ8W/lQ+q7lKGlvRKhGLEtsT1JUgy
         OnI422e9hEKGCGPM0T/1P25nz75I+6xBl9RktkLKJUCh4dJOFhoXLVN4zQeQxcN5JYt6
         GKS1fBNbRc+O5fVmlRYDsKXdtbirBXcx8Ss+XlqU5+1iYDgMojZemvUB74JUyCAk8e1c
         ZaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707410575; x=1708015375;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cGp8YxNLTClF4yl5BUibCCne27gUKs9JcvoLO4RVgmk=;
        b=ChBpcWg8VQTdd8ypwC8dsYQtcRlP1uHY6k4TDhIRWiCF5psyjltgg5bEPge4GHFOfU
         O1SFfV+3CUYfpW+MX5SHG0r4/PIU36xeaxdq/76xBPXYwOFzHlGfB2JoBYMqubbS8G2Q
         smMZq2w0oOh61Gkq2hZ6empvyj0GKhYIGhqjd6J5ycxFrQMohrFSjvW/1+zLHm4ohAYu
         4riGvCzmd1C67I0/pOs49Dxjlbr1zuSN0e2vdsZMLmA3C4wxAyaq5J7dD2NZ3TFaLV6P
         2HpOmGzxH1krMAAWaFdJ6IsaasinzNQWc9MG5fk3zpsBhlJM3RPraDUAgFk1UF47oT5+
         c5Fg==
X-Forwarded-Encrypted: i=1; AJvYcCUC/qRv7369hxi8V+SKePofpldycdS0nX2HeqMXFOygH4zRjmsAjIl4epuH1NzxW0j6L4hrHbU7Msy6QmTdxmxXS0hA/QBg+9bQScvHcjE=
X-Gm-Message-State: AOJu0YyAh6ZHheFnfuBmbb+bVFDjRVOm5NMQnMk8vXTbqT+cENBjYcOt
	h745Z/nT3I8JfcAQ8qC9z25+fSURj04M0hyX3dgCo2cGyLpDkKKHfX1P5Fnz2g==
X-Google-Smtp-Source: AGHT+IEI4Fjilf81VGgEHBoyzxWBfpgn/p+uWt2LI60tH+S12zn4hmHQ/4Hk7A2kR93VX+Uyuy9Hog==
X-Received: by 2002:adf:a299:0:b0:33b:180d:edc7 with SMTP id s25-20020adfa299000000b0033b180dedc7mr2246wra.17.1707410575316;
        Thu, 08 Feb 2024 08:42:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfyPAeWm4/aQiOxjc0Q0R7lp/NpvNvB2ofwcMhFnix3tVKGQaGsHkzeTfQoBU6KJ2aGclg09O15s7xSPAtF6bStt397p9LoRtwSFqZtbUGqYlD0S/0whsocK/vXUSK7SlgY7UnFAqYAfBuX8jlGbS1czYu4uxhBNK+eMFi18mmnSe/d0+f/73OUfAGsXOOxG88duDdDANV+A8wYyxjCeSRm1EOYxh5hbSjwJlbGIVDgv7pJgsgS9XFoIpP7OypAaxGl3puPrL5cO7rfsjvXzlVBsgZimn+3MpKkQQhKQYgd/UFfE/++sq2zPXat+Xb+dx/TiPsguqstPptkbcoP/K+wzPZuZrPi441tYuEJaK8lVK8ep7tn0AQ0fp/NEhstswyjeaVEEpUFBAlYOFxS9v+473d7uArLeuip6cE2Cz6D80h0MFUaaGsQKc1vShhnmrYzsKtmY1JotDE5Na+FfA7gyG5RFG4n5jYwVCGFgYtqD/oQ4s=
Message-ID: <91e58646-5420-4e1c-a8c5-b6ff7a417d13@suse.com>
Date: Thu, 8 Feb 2024 17:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
 ASSERT_UNREACHABLE() to xen/bug.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.02.2024 19:03, Oleksii Kurochko wrote:
> Move the macros mentioned in the commit subject to their appropriate
> locations.
> Additionally, eliminate the dependency of xen/lib.h from xen/bug.h and
> include "xen/bug.h" in files where xen/bug.h macros are utilized.
> 
> Most of the changes were made because a file requires macros from xen/bug.h,
> except for some files for Arm which require definitions of BUG_OPCODE,
> BUG_INSTR, BUG_FN_REG.
> 
> xen/lib.h was added to list-sort.c ( otherwise compilation errors related
> to {d}printk occur during compilation of list-sort.c. ) as xen/lib.h was
> removed from xen/list.h. Since nothing in xen/list.h depends on xen/lib.h
> functionality and only xen/bug.h is needed.
> 
> cpufeature.h requires the inclusion of <xen/cache.h>;
> otherwise, the following error will occur:
> ld: common/monitor.o:/build/xen/./arch/x86/include/asm/cpufeature.h:41:
> multiple definitions of `__cacheline_aligned';
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
with one nit:

> --- a/xen/include/xen/cpumask.h
> +++ b/xen/include/xen/cpumask.h
> @@ -55,6 +55,7 @@
>   * for_each_present_cpu(cpu)		for-loop cpu over cpu_present_map
>   */
>  
> +#include <xen/bug.h>
>  #include <xen/bitmap.h>
>  #include <xen/kernel.h>
>  #include <xen/random.h>

I think everywhere else you nicely inserted new #include-s so respect
alphabetical ordering, just here the insertion would want to move one
line down. Likely easy to do while committing, if no other reason for
a v2 arises ...

Jan

