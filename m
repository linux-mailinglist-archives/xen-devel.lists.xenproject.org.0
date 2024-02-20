Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC785BFAE
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 16:18:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683577.1063155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRsx-00008V-RC; Tue, 20 Feb 2024 15:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683577.1063155; Tue, 20 Feb 2024 15:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcRsx-00006f-O5; Tue, 20 Feb 2024 15:18:19 +0000
Received: by outflank-mailman (input) for mailman id 683577;
 Tue, 20 Feb 2024 15:18:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YSgb=J5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rcRsw-00006Z-O9
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 15:18:18 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 457c7aba-d003-11ee-98f5-efadbce2ee36;
 Tue, 20 Feb 2024 16:18:16 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563e330351dso4787254a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Feb 2024 07:18:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i16-20020a0564020f1000b0056411b3fc4bsm3731051eda.30.2024.02.20.07.18.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Feb 2024 07:18:15 -0800 (PST)
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
X-Inumbo-ID: 457c7aba-d003-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708442296; x=1709047096; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5hib8pgheuZH5W/3YrL7nsCGE8Fb2vhnUkezVvlGO6E=;
        b=fRT9wwCjoKSAz62MtP6zjuNsNxHCz+iMvcda0qGKsGVbWqVFt0V/DTuazOLH35VQVY
         NGFqS4Knr1klIT5ogMdVsa8zBpiL+D+oE1lIrmYunjIPt72si4umbA8m/IH7uqCkWE6K
         h5eMy/bvKssTBymI1zOATkWxQDCdwQ0fVzkn4zluu0nLPx7c0/VVO5RRjYE1AlB9UqiO
         nKNLHG9YD2Wnw28jizz9++scCFowYUrJNV2H8HZ8WJYCGdQmDdKQ7jqHwxioNwGIo7MS
         Ul7WCKgurWxyv/u7Ompn2aym4NR8sMyvRm4txE61HTyYoalQ6QTtelRfinmLgjqagVNU
         cM+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708442296; x=1709047096;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5hib8pgheuZH5W/3YrL7nsCGE8Fb2vhnUkezVvlGO6E=;
        b=VobUGRu+DhfjWnuYjfUPo9eMVb7CG/1cZVhFR2vJAY95OXiqbADFBLfQRAd0SYsdlw
         CxY6kiesVzN3xL+NxpQQsCUn+dmGD660eUZ/DuqgUG1EGdScBHlLskwENHLXUaHdmTih
         rB7xY2XZ4bl9u8idnWrz/GzXfQ84KDvGG/aTW5qq6xLAp0Iwig5pnTnFoNQ0ijDp7Kqw
         xQY/CXPMhpggS4fE8O9sJ6WwZDkWiRWNFUx6BtzFYcW6vueSMVNpuQBINTGaqkxljFcb
         7QOR6F5zjCnfdr7olh4alXqy6oLUZzLzJrLCeNW9OtSGKDFaTJZFbNe9gOyv8izFCrrf
         ZVIw==
X-Forwarded-Encrypted: i=1; AJvYcCWFyzuXPHEvjutjw92FHoy7soIFkSbC6wQF8L0YzCe+9j7Ss/6y9/S/+7msH97oILdf1ysu7QEPgUL6/QlfbefIkvt4EVmvXteRtCfb7cU=
X-Gm-Message-State: AOJu0YwNUxdefNupCk5RVOQX5aMkGdvBJIwsZ0I67T75FK0XrEdi0RYt
	vDw7/mbNNjZrCPiK09w8cpvozChV/vox0UjuacgMW/mYSYazZWVPXuVr7taTtA==
X-Google-Smtp-Source: AGHT+IF41Sl+oL0ivwp+lQ5LmNlH7AdQjVyUU295wIGDzZgHGrP02focl0uVOEIj1OJTfgmJxjR0vw==
X-Received: by 2002:aa7:c383:0:b0:564:1c4e:eb57 with SMTP id k3-20020aa7c383000000b005641c4eeb57mr6714101edq.17.1708442296083;
        Tue, 20 Feb 2024 07:18:16 -0800 (PST)
Message-ID: <d2c4d6e9-a776-4dd2-aff6-22081da2f9cf@suse.com>
Date: Tue, 20 Feb 2024 16:18:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/uaccess: add attribute noreturn to
 __{get,put}_user_bad()
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <1595eac56587d20c7f86128bc5652c31c3a72772.1708436010.git.federico.serafini@bugseng.com>
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
In-Reply-To: <1595eac56587d20c7f86128bc5652c31c3a72772.1708436010.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.02.2024 14:35, Federico Serafini wrote:
> __get_user_bad() and __put_user_bad() are undefined symbols used
> to assert the unreachability of a program point:
> a call to one of such functions is optimized away if it is considered
> unreachable by the compiler. Otherwise, a linker error is reported.
> 
> In accordance with the purpose of such constructs:
> 1) add the attribute noreturn to __get_user_bad() and __put_user_bad();
> 2) change return type of __get_user_bad() to void (returning long is a
>    leftover from the past).
> 
> Point (1) meets the requirements to deviate MISRA C:2012 Rule 16.3
> ("An unconditional break statement shall terminate every switch
> clause") since functions with noreturn attribute are considered
> as allowed terminals for switch clauses.
> 
> Point (2) addresses several violations of MISRA C:2012 Rule 17.7
> ("The value returned by a function having non-void return type
> shall be used").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably ...

> --- a/xen/arch/x86/include/asm/uaccess.h
> +++ b/xen/arch/x86/include/asm/uaccess.h
> @@ -21,8 +21,8 @@ unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int
>  unsigned int copy_to_unsafe_ll(void *to, const void *from, unsigned int n);
>  unsigned int copy_from_unsafe_ll(void *to, const void *from, unsigned int n);
>  
> -extern long __get_user_bad(void);
> -extern void __put_user_bad(void);
> +extern void noreturn __get_user_bad(void);
> +extern void noreturn __put_user_bad(void);

... with the "extern" dropped at the same time (see other function
decls in context). I'll try to remember to drop them while committing.

Jan

