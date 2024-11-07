Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FD99C0142
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 10:36:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831563.1246894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ywG-0007Lk-0t; Thu, 07 Nov 2024 09:36:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831563.1246894; Thu, 07 Nov 2024 09:36:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8ywF-0007Je-TS; Thu, 07 Nov 2024 09:36:27 +0000
Received: by outflank-mailman (input) for mailman id 831563;
 Thu, 07 Nov 2024 09:36:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8ywD-00074T-Ro
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 09:36:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c007e870-9ceb-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 10:36:22 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43169902057so6162475e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 01:36:22 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa5b5e56sm55465715e9.2.2024.11.07.01.36.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 01:36:21 -0800 (PST)
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
X-Inumbo-ID: c007e870-9ceb-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzUiLCJoZWxvIjoibWFpbC13bTEteDMzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImMwMDdlODcwLTljZWItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTcyMTgyLjY3MDQ2LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730972182; x=1731576982; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DKQRtuORBujOIxBp4MUElYOGxn68m7mfgGkP1ICiRgA=;
        b=Zuz24OUs2m0ptwhAJX+Opbog5mmTmsjWFrULM3zj95/2Oj4S86EXBbrWDG4mJwYWpm
         39qgzqZn/XUnEBeqsEqi+9KijE3sjptR3vjR+e4xtkmOqeC+kcDquMRhttnJdC9NKNbv
         hEdDrJVADI+ndQYLg587UCI/1RXH1/5CIhGtpVJdHCRuLPEc5lTBVF5+lQ8gXNB5ZaAD
         pbuK+99RBly6D35AI5dPbE53KWyKwklzS5GHNpTLa9ZqNOX/kW0y8at9+Bp6Yxl2c5P1
         W2Kv9XbBrAszIkFjjdwC7wF8NeCh6CYGzSMbGaBSF9rp2D3bdfPCu552R/CEMiaZ2rXW
         vweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730972182; x=1731576982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKQRtuORBujOIxBp4MUElYOGxn68m7mfgGkP1ICiRgA=;
        b=ZyYCOVdcuDB/W4HX/2eyI0BFxpHVqLr8H0uPfMJMJhYGCwjic/4alRcgs5a2qR5orL
         n0q2+VOnSgka3sqXUdm5BWaymZhWq1Mbk7MLQA3x0XBD64BvSm7bej5lTG9yjwtmzqGl
         za6ZhhfM5XE0pJbQzNZc2Ikeg/OSDZaqucPPqe5qGbq/9R1Fs3AG1hftXeWt4LmQybRP
         M9demIbDQfVkCL1S9r77irWubBDiMqYtW93BUh6Gz5SHaAV+AH9huPChlsgE5w8GYP2I
         m+nwWquPjMSCdtgVYdMYh9qQ1b7zuL2o3EyKm8F5Ga2Ipg+chmbn7yMRcuYqN8hsrT6A
         jiGQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+hEQnQqTa8q9AxMYi2cmUL1r/q5keGC0M9DoHr4zvozeQ554Tk4qpNavY4ySw0HE5uhpAHy6F5aw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwdxHM5IHQyJwxNrYldSINJCAmkmK8FjHKlSe9YonBPRv5C2OBB
	awq+8CWeWn9Tn9/bnJ9hzH0bDtTKLDIGVJQ56MWYkScVdkWNq5V16mQX24LgVg==
X-Google-Smtp-Source: AGHT+IHw5g8FnF1aaTZyz8nWa8rX2wktOL82P2IFxLdaC5CWOhZl91J1C1T3zifkhlimH27eH57Obw==
X-Received: by 2002:a05:600c:190e:b0:42c:a905:9384 with SMTP id 5b1f17b1804b1-432b308d52cmr5211375e9.20.1730972182034;
        Thu, 07 Nov 2024 01:36:22 -0800 (PST)
Message-ID: <b633d472-6668-491b-82cb-2814c8aa5dbe@suse.com>
Date: Thu, 7 Nov 2024 10:36:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/boot: Fix build with LLVM toolchain
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>, xen-devel@lists.xenproject.org
References: <20241106114150.1432512-1-frediano.ziglio@cloud.com>
 <20241106114150.1432512-4-frediano.ziglio@cloud.com>
 <8f87849c-916f-4532-a150-3205795c9e43@citrix.com>
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
In-Reply-To: <8f87849c-916f-4532-a150-3205795c9e43@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.11.2024 13:23, Andrew Cooper wrote:
> On 06/11/2024 11:41 am, Frediano Ziglio wrote:
>> This toolchain generates different object files.
>> Object have 3 additional sections which must be handled by the
>> linker script.
>> Added sections need to have special type so we put them in
>> separate sections as linker will copy type from input sections.
>>
>> Fixes: aa9045e77130 ('x86/boot: Rework how 32bit C is linked/included for early boot')
>>
>> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> 
> The patch itself is fine, but the commit message is quite stale now
> you've split the fix into 3 bits.  I'd recommend:
> 
> ---%<---
> x86/boot: Explicitly list .{sym,shstr,str}tab in build32.lds.S
> 
> Currently, building with LLVM's LLD fails:
> 
>     ld -melf_i386_fbsd  --orphan-handling=error -N -T ...
>     ld: error: <internal>:(.symtab) is being placed in '.symtab'
>     ld: error: <internal>:(.shstrtab) is being placed in '.shstrtab'
>     ld: error: <internal>:(.strtab) is being placed in '.strtab'
>     gmake[11]: *** [arch/x86/boot/Makefile:69:
> arch/x86/boot/built-in-32.base.bin] Error 1
> 
> This is a consequence of --orphan-handling, and it appears that Binutils
> doesn't diagnose some orphaned sections even explicitly asked to do so.

With my binutils hat on, I'd like to express that I don't view this as a
fair statement. GNU ld simply doesn't extend the concept of orphaned
sections to purely control ones, which need processing / transforming in
one way or another anyway. Instead I'm puzzled by lld's behavior
requiring such sections to be named explicitly.

Jan

