Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C3880691C
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 09:09:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648969.1013116 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmy2-0007er-JX; Wed, 06 Dec 2023 08:09:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648969.1013116; Wed, 06 Dec 2023 08:09:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAmy2-0007bv-GQ; Wed, 06 Dec 2023 08:09:14 +0000
Received: by outflank-mailman (input) for mailman id 648969;
 Wed, 06 Dec 2023 08:09:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAmy1-0007aZ-0r
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 08:09:13 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc1c7c1f-940e-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 09:09:10 +0100 (CET)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40838915cecso68015595e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 00:09:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 r12-20020a5d52cc000000b00333590f3bf9sm3393072wrv.19.2023.12.06.00.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 00:09:09 -0800 (PST)
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
X-Inumbo-ID: bc1c7c1f-940e-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701850150; x=1702454950; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p7TnyMXqU6IH7auf8BzORYUSJaMA52YHFE2PZuqR20M=;
        b=Drlb/vlAs0C0hPks7Psz4Sb83K1zdSqfuEvhROnzl5ZRlR+bk01SB9J13NUT6JEnZK
         uWFvP7ZwoBWbNDiGwXDCWS6qFi5i2ZjkLa375h5mKpuGykQk+62oP8DaLFt7K36xt0Cs
         K3R/4vVyhjTrKqaMDdIUuRM3/kd+/EE+jNyDXIWT0nsKI8cvsqhzfQ/glDgs7S/bAEu8
         OUSg8t6bkBueN5lL8FBtUyJrHqaIPo6rO0yEEljZCFsdqrrD3KksiaXuHXgYJgOUxGqd
         008e9mdkzzI5CLNZfDiNohasnZ6MkX0EVNj/5nPl0M4R2taX0/qi08LY+6R5chFCD+MX
         2e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701850150; x=1702454950;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7TnyMXqU6IH7auf8BzORYUSJaMA52YHFE2PZuqR20M=;
        b=vAAR4zFfsTVN+aQ6cWni9oR+4TD2+OnstWM2QHBxCIkfwsROByBZmIwg5rslW0yZGC
         mTtlfjNU4UXpt/WXFdL7G1ySuxysqnougdegZ8zEkIDsofpQuBUvH5yeS2GwnFBy7NZl
         Gyh7UdaQyMmBezzSiJvCZOryIRciSFWL6fNKcxYSmTA96PXFg7Vt3xqErwWR4pqrA8jx
         wx0hMpYbizwhowIWVqDNFjA0m3ZaXbF2KD8+iSLz84P8xuoYlZk6GlJfiKXXt0gB61KR
         gnmac/MsYfI7dFTjCdeNBhCHkd9qRAQKs7+pPpFAG2Q0Zl80OWz5Kf6DFD2w5uBlAkig
         iymA==
X-Gm-Message-State: AOJu0YziVqT0ANDkqeWHrTwMtEwGLnsAQv4yMhg1+mIiSSvnSGTlm791
	SXNzAyNkr8cEpBR7KmTjT4GV
X-Google-Smtp-Source: AGHT+IHN1O5PRusFB2ac0y5+UWDP4O+2QZa0QD87n2luzbTGfdFSxy8DAtRss9+beWA37WR1Jy0A5w==
X-Received: by 2002:a05:600c:4a13:b0:40b:5e59:da6e with SMTP id c19-20020a05600c4a1300b0040b5e59da6emr271970wmp.129.1701850150221;
        Wed, 06 Dec 2023 00:09:10 -0800 (PST)
Message-ID: <dfa87030-f711-49ee-828e-de73f123c125@suse.com>
Date: Wed, 6 Dec 2023 09:09:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/6] x86/mm: address violations of MISRA C:2012 Rule
 8.2
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <cover.1701764980.git.federico.serafini@bugseng.com>
 <461a97a14a530286a8b8d0d30a1a8ed63690bc26.1701764980.git.federico.serafini@bugseng.com>
 <alpine.DEB.2.22.394.2312051908470.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312051908470.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 04:10, Stefano Stabellini wrote:
> On Tue, 5 Dec 2023, Federico Serafini wrote:
>> @@ -572,20 +572,20 @@ int __sync_local_execstate(void);
>>  /* Arch-specific portion of memory_op hypercall. */
>>  long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
>>  long subarch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
>> -int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void));
>> -int compat_subarch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void));
>> +int compat_arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg);
>> +int compat_subarch_memory_op(int op, XEN_GUEST_HANDLE_PARAM(void) arg);
> 
> Also for compat_subarch_memory_op I cannot find the definition

Looks like in b8a7efe8528a ("Enable compatibility mode operation for
HYPERVISOR_memory_op") I blindly added the declaration, without there
actually being a definition.

Jan

