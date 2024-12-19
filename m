Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA19F7904
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 10:54:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861028.1273028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tODDq-0001sh-Qe; Thu, 19 Dec 2024 09:53:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861028.1273028; Thu, 19 Dec 2024 09:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tODDq-0001qH-Nq; Thu, 19 Dec 2024 09:53:34 +0000
Received: by outflank-mailman (input) for mailman id 861028;
 Thu, 19 Dec 2024 09:53:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tODDp-0001qB-81
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 09:53:33 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1aeec5b7-bdef-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 10:53:32 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436345cc17bso4155905e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 01:53:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611ea423sm13386275e9.2.2024.12.19.01.53.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 01:53:31 -0800 (PST)
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
X-Inumbo-ID: 1aeec5b7-bdef-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734602011; x=1735206811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xnBj7g9EXA4Fi6c25soyyCh5M+GQH2hIk0HxhqA68PU=;
        b=gbxkqlVPWwVfqvEPBv1U3rJx6vWSqypkmJ+oo7o0NQ6RFPZcDueqZQ4Lp7pIQFUYlc
         6u9XK6FW8Hu9GBud+Fr/gJbfK8iabjkvMZyVy93c7moe+C0rUJQzOFb3xtPapN+tRoIx
         ZZwjYkECj5GCpwvsNp0JFcVbSVMWp8FmN3knffWDaBOt3dny+6HgjhXC7lQI75jQL+qB
         +WiEvOxJwGyQ90VdgTUxQWL8bb/i/r+HG611zu+1dVH9NbT99Yw8V2qLZ8AJGlyXEx5z
         8wubgiiShter4/nJlhdlD5xIjLk5ZE3T27XUPOoipGc3UMvvLLxaHh4xWSbGK5tBhX3J
         jVNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734602011; x=1735206811;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnBj7g9EXA4Fi6c25soyyCh5M+GQH2hIk0HxhqA68PU=;
        b=X750d1PP8Zd7Mq56KUGWNUABxuQx4UN2RcQCIN++xHoCdR94AmkLXRE8VsnvqvQscV
         2d+Mk1kr9hHcNWNnfN1EvkFOY+5nCQXpJX945fec+WqoUWur0aj4W2QVBIWHJA7sY3GC
         fmn9f3nH4Fo+HA5OZ0MKX2jVDayWxP+Rj86Ew1TWorQrorrsJS1sKtMsKYU+gMSWCKwj
         Om5bSF8ixi0/3cM4G3vGKJib35Ol7WoNbpjo1Q7uhU8Mon+giI7ybHgE+yZdkwaC2mni
         3W1PMThN2045Ai25/N8HN9xOvdKdcZYxzI1ub8yYRMIqCzPn3vTuAjHdk25VKdFf4Gc3
         DfVA==
X-Forwarded-Encrypted: i=1; AJvYcCVqM4QCCvCWRmFJSCcZx/zeULt8ObiA1T58Z6PxeAASIflAsXm3LSrL+WpJne978dkPJ6w94/vIizE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxF15Dq6dBiS7ISBbkLvaQTgRSFOYQpg/dXlyrqMVJBaRtS1VGz
	lfE6IwhWf7LjzAGG26rEyD3nCYqqowaqr89+Wvzy5J0UCicsoxvad4WcLqiXJg==
X-Gm-Gg: ASbGncueR2wqyChIHjof8OSMuO2i95Q6GIFniggzcHgz2RkJM++McN1QPwes7wAzoN8
	gEjRMEfD0O3PUZT4UbAxZI4CuPXUikdPQfsbT2d9ELK1OvlW2BPxWRycSUDHIdIiydONQqOf/eS
	c0on4xpOk1/23qndY9oYHvpS5ns61MF8lUGWVOlB+3p9axus2L+IsIh6GgFNoiQznWYyard8xn6
	aEXsK1sxZFwH249ma90zo8kBSK6p+oV8J6g5n8ktFjLPOZWQK0Cfxru6QXQ8A1DPLjqSzPk++xa
	RzbdvO1m8G3XjrE7eIyrZhzXjsLqLoz/oimKPLgsVQ==
X-Google-Smtp-Source: AGHT+IE4F1fMGI8LtO6gmgYDobrcMURYTh+L4zIDduP3WXSy6cIk07stKiGr5KPYYkCZbYse2H1fXA==
X-Received: by 2002:a05:600c:1549:b0:435:194:3cdf with SMTP id 5b1f17b1804b1-4365536fab4mr52308955e9.19.1734602011369;
        Thu, 19 Dec 2024 01:53:31 -0800 (PST)
Message-ID: <11dd98bf-c32f-43ce-9161-5dee68821ba1@suse.com>
Date: Thu, 19 Dec 2024 10:53:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.20 Development Update [November]
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, kelly.choi@cloud.com,
 xen-devel@lists.xenproject.org
References: <20241204102035.22505-1-oleksii.kurochko@gmail.com>
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
In-Reply-To: <20241204102035.22505-1-oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2024 11:20, Oleksii Kurochko wrote:
> This email only tracks big items for xen.git tree. Please reply for items you
> would like to see in 4.20 so that people have an idea what is going on and
> prioritise accordingly.
> 
> You're welcome to provide description and use cases of the feature you're
> working on.
> 
> = Timeline =
> 
> * Last posting date: Nov 29, 2024
> ---> We are here
> * Feature freeze date: Dec 20, 2024
> * Hard code freeze: Jan 17, 2025
> * RC1: TBD
> * Release: Feb 21, 2025
> ( current release schedule: https://wiki.xenproject.org/wiki/Xen_Project_X.YY_Release_Notes )
> 
> All patches that wish to go into 4.20 must be posted no later than the last posting
> date. All patches posted after that date will be automatically queued
> into next release.
> If you would like your features included in this release, please ensure
> they are committed by the deadline.
> 
> RCs will be arranged immediately after freeze.
> 
> The following items ( the links for them could be found int the list below )
> were moved to completed:
> - Hypervisor:
>   * drivers/char: rename arm-uart.c to uart-init.c
>   * Move gic_preinit() to common code
>   * stubdom: reduce xenstore library dependencies
>   * xen/trace: Treewide API cleanup
> - x86:
>   * x86/HVM: drop stdvga caching mode
>   * Fix module-handling use-after-free's
>   * Reuse 32 bit C code more safely
>   * xen: address violations of MISRA C Rule 13.6
>   * x86/ucode: Simplify/fix loading paths further
>   * x86: address violations of MISRA C Rule 16.3
>   * iommu/x86: fixes/improvements for unity range checks
>   * x86/pvh: Support relocating dom0 kernel
> - Arm:
>   * xen/arm: Add emulation of Debug Data Transfer Registers
> - RISC-V:
>   * Setup memory management
> 
> 
> * Full list of items : *

While only a small single patch, what I think you may want to also keep an eye
on is "drop setting XEN_QEMU_CONSOLE_LIMIT in the environment".

Jan

