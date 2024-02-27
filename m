Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 609528689EF
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 08:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685882.1067313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rerzg-0000Tr-Io; Tue, 27 Feb 2024 07:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685882.1067313; Tue, 27 Feb 2024 07:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rerzg-0000S6-FE; Tue, 27 Feb 2024 07:35:16 +0000
Received: by outflank-mailman (input) for mailman id 685882;
 Tue, 27 Feb 2024 07:35:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HnYt=KE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rerzf-0000S0-33
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 07:35:15 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd644fb8-d542-11ee-98f5-efadbce2ee36;
 Tue, 27 Feb 2024 08:35:11 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a3e552eff09so425652266b.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 23:35:12 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c19-20020a170906695300b00a3d8a76a92esm488022ejs.175.2024.02.26.23.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 23:35:12 -0800 (PST)
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
X-Inumbo-ID: bd644fb8-d542-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709019312; x=1709624112; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Myf3nBv3rrva9CpYrxE4KlHrZZDdK1HrDwj1b+jGTRs=;
        b=dEdCgdO+8P4C7e1irqlblZBOQddW2ef6hbVo8NsR6K9E8EIOkjg7k2KdQ87lBVvFCN
         cfBS9sacIv+vI8OMb6h4+q+ml2oxe+cMVAWtMBczJ6IBrrUtGY2m6mRmUfhxGyLX+9/K
         bwZg/zFO7oDHwHYOLuJJmN2867X6Lhk73DX8d6kWskZaeB3SIQ1vtSB+MIu9/Bkztlq4
         eqspbqyDxXfc5fxNfQ7zF4EsjWaf02XPum26Mq1P3ypGn1d0izdqZBUc2lrM9XkRLJkq
         sctPjonC0EZz/MQp8H3H47zWjBHpyefdAmK6+GN2/yWcxm+owW342mfPrjJP4VLEAC+g
         61Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709019312; x=1709624112;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Myf3nBv3rrva9CpYrxE4KlHrZZDdK1HrDwj1b+jGTRs=;
        b=MTZhZDcc8b8iNpHLQJ8GnMFCy0qEldjyJwnmtRNvtSDA8lrmMjYcV181A+2ROvRUlF
         MAcEJDLkEMvziTIHdw7XyxT79UrpusvAxukp0USkjzo8yW6imBSxzwYd6ZBh9xVo3lZu
         mgza7/YwWUrIuTZLUptGdRIg6JK0baB27QTEy48jXZR2G0j0FH63/rt51Avw18ip6gtH
         KdmYCbLHnRRDpWaCQVqb67G9A8bJyRP/gZXwpdedJvRSGo05VFmXQq8scu/4Ejl1TgPI
         6Zpi1DJR+WLtHqmHIdJ7Q9iFvThYRz4bqCXraqPU3Mc9t86SPeXOo7p+XNdXYF5tICmU
         lgKA==
X-Forwarded-Encrypted: i=1; AJvYcCUBlPq2ox5rC9UOia7i2qOfeiYlaRFYwvlY59kMmRLVGi+LiDm7IPFwojYJerm6FZqwE6tbwKIZGD3t7dv37Ff/bzxFwOuaRPtlHmxoWn4=
X-Gm-Message-State: AOJu0Yz3kvrbO1SSd0Sd8OEjJIqwQSXYA67Vx76fBimasl4pZnCMBSVg
	+OpKV4ihPNWys75ub/cixfSiL2Eps2etT57gKas5xDfrT7aAyv78IEQUGISe8g==
X-Google-Smtp-Source: AGHT+IGR5NTsRPSvhjGb36rlS/1mETpMkxqrWaw/mFx5Mq/BSWcZ0AKgX70egt3bQcoH9Or9uQT9aQ==
X-Received: by 2002:a17:906:a142:b0:a41:315b:94d9 with SMTP id bu2-20020a170906a14200b00a41315b94d9mr5063818ejb.71.1709019312229;
        Mon, 26 Feb 2024 23:35:12 -0800 (PST)
Message-ID: <160f665e-0f06-45a0-bc29-80240306884a@suse.com>
Date: Tue, 27 Feb 2024 08:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/23] xen/riscv: use some asm-generic headers
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <e0bf8689422066f5fcdf9e063717f6c748ea3af7.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <e0bf8689422066f5fcdf9e063717f6c748ea3af7.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:38, Oleksii Kurochko wrote:
> The following headers end up the same as asm-generic's version:
> * altp2m.h
> * device.h
> * div64.h
> * hardirq.h
> * hypercall.h
> * iocap.h
> * paging.h
> * percpu.h
> * random.h
> * softirq.h
> * vm_event.h
> 
> RISC-V should utilize the asm-generic's version of the mentioned
> headers instead of introducing them in the arch-specific folder.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes in V5:
>  - Nothing changed. Only rebase.
>  - update the commit message.
>  - drop the message above revision log as there is no depenency for this patch
>    from other patch series.

Please can you make sure you submit patches against a sufficiently up-to-
date version of the staging branch? I committed v4 of this patch a couple
of days ago already, upon your own confirmation that it was okay to go in
ahead of others.

Jan

