Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78480976C2A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 16:31:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797566.1207554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokqA-0001Wh-Nt; Thu, 12 Sep 2024 14:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797566.1207554; Thu, 12 Sep 2024 14:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokqA-0001Te-Ke; Thu, 12 Sep 2024 14:30:34 +0000
Received: by outflank-mailman (input) for mailman id 797566;
 Thu, 12 Sep 2024 14:30:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sokq9-0001TY-7h
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 14:30:33 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 904bbbb4-7113-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 16:30:31 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-536748c7e9aso1332060e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 07:30:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25950a7fsm758485966b.57.2024.09.12.07.30.29
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 07:30:30 -0700 (PDT)
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
X-Inumbo-ID: 904bbbb4-7113-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726151430; x=1726756230; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VtrI0oyL4v/gGMfAwM4vnYP97ofw88+v/9odoc9RMbI=;
        b=GZqN5H+h5ZU+5hZLa5f4bZjA6c3ZlZfK5hHcUo/AOceWSl3IGQeTmM8aU1H7mNnUXP
         zZxx3h3pvAgTm2iVBGXT7j67H9CCFLmcAXggITLUTqM8zk2UKGYwipaQbL3S0d2o8lxd
         u+Z8u7Bu1pnWrgHFPzKBV0B3Ur3ilH0zg8BL0GVR0Qa4lcVqMc+R2Wdm+ruSXfUDha6c
         fHQH+BdCVoPSsuRClzg9WAYw2t2cCAc4dj8vJWw7JruImMu4DHJdYeAgMSglfQa9WTxJ
         vLiRbxdYcHhq1levBkAWTxs9FpQdhi8kS6ktgfTaYxJ0D8NiQPvwUzy8SUutJOnjrVRA
         cNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726151430; x=1726756230;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtrI0oyL4v/gGMfAwM4vnYP97ofw88+v/9odoc9RMbI=;
        b=YaEvBw+bCIVewSxBTO5pFUVDw8U4TjLTKe033AU+z2Dvnp1Y8xTSFVi5QSqigv+Sw+
         t9KMhkRPQbREeWO5YkyUnIJHMoeAZPc/phA01xpXGUmp0zaIizHbIGpd+m3DsZ/SsVVt
         BIGmpHLpUoLaKqpV9nuoML3qqHnUZu/hyga21w9Q+51iThcewnJXv9AWXStoO8W8rOHS
         r49/pYWYpERLtbsEPREUZaoZQveJ937Wos3eWQ5wqCH+PmI12uYlb9BUzAX9lusLMc4H
         xkXhVjmUEHMYFHREdCdSGEgQj7QLhmRjqURyFitgoqW3Qbq0ttnn7l1XilfDcU9KV9ZW
         lIdw==
X-Gm-Message-State: AOJu0YyWXRuOMBA1Na6NH/1+EtvhmJ3f2ZBAZ8KK5XVJ5Vc5qyW2EqBt
	rjScY1BKgtxrwAv3NwkFqxWWDtF+spnrM9VJx8em0ZN37UVOiyrX3vUHkUkUG0y8PpngtyYNdTU
	=
X-Google-Smtp-Source: AGHT+IGtCQe4CWACU9YpX6h1beQiG08bUeQK6Pe66KM+fzkhyNASmRlVvcNo9CidOIotqMC+Qy0qxQ==
X-Received: by 2002:a05:6512:10d4:b0:52e:9b68:d2da with SMTP id 2adb3069b0e04-53678fb4635mr1942503e87.9.1726151430291;
        Thu, 12 Sep 2024 07:30:30 -0700 (PDT)
Message-ID: <efdda482-3fea-476b-b911-15a63a188e50@suse.com>
Date: Thu, 12 Sep 2024 16:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 221f2748
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <66e2e41b9f8da_2ec0c1018481a@gitlab-sidekiq-catchall-v2-85fcd868d7-x8qhw.mail>
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
In-Reply-To: <66e2e41b9f8da_2ec0c1018481a@gitlab-sidekiq-catchall-v2-85fcd868d7-x8qhw.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.09.2024 14:52, GitLab wrote:
> 
> 
> Pipeline #1450753094 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 221f2748 ( https://gitlab.com/xen-project/hardware/xen/-/commit/221f2748e8dabe8361b8cdfcffbeab9102c4c899 )
> Commit Message: blkif: reconcile protocol specification with in...
> Commit Author: Roger Pau Monné
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1450753094 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1450753094 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 13 failed jobs.
> 
> Job #7809027717 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027717/raw )
> 
> Stage: build
> Name: ubuntu-24.04-x86_64-clang
> Job #7809027747 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027747/raw )
> 
> Stage: build
> Name: opensuse-tumbleweed-clang
> Job #7809027539 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7809027539/raw )
> 
> Stage: build
> Name: debian-bookworm-clang-debug

I picked this one as example - Clang dislikes the switch to bool in

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -286,8 +286,8 @@ struct page_info
         struct {
             u16 nr_validated_ptes:PAGETABLE_ORDER + 1;
             u16 :16 - PAGETABLE_ORDER - 1 - 1;
-            u16 partial_flags:1;
-            s16 linear_pt_count;
+            bool partial_flags:1;
+            int16_t linear_pt_count;
         };
 
         /*

for places where that field's set using PTF_partial_set:

arch/x86/mm.c:1582:35: error: converting the result of '<<' to a boolean always evaluates to true [-Werror,-Wtautological-constant-compare]
            page->partial_flags = PTF_partial_set;
                                  ^
I wonder why we're not using plain "true" there. Alternatively the change to
bool would need undoing.

Jan

