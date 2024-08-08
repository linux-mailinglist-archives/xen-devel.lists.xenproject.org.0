Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218794BE22
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:03:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774080.1184578 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2my-00086a-PE; Thu, 08 Aug 2024 13:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774080.1184578; Thu, 08 Aug 2024 13:02:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc2my-00083c-Lz; Thu, 08 Aug 2024 13:02:44 +0000
Received: by outflank-mailman (input) for mailman id 774080;
 Thu, 08 Aug 2024 13:02:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc2mx-00083W-4Y
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:02:43 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f32abff-5586-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 15:02:42 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a7a9185e1c0so95742966b.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:02:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9c12a79sm739979566b.60.2024.08.08.06.02.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 06:02:41 -0700 (PDT)
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
X-Inumbo-ID: 7f32abff-5586-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723122161; x=1723726961; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yeLKZbVnG5SDKU6VO1EAbGHOp3mpZRJIZ8cxuvHWISk=;
        b=AZ0EVs0RrZJ/6ubphNh3iVdpGtnl+lQKjPKmYcP78eCNT0dIVWVQz1mYreAs8ozehO
         K3Z6o7LXe0HU9qMwlr1iNdEZbqllcOJGZifQUh/eY0VXkxZs3DcLgdmzGhyzF2TpNUOv
         FSlJpaq4cjPoXRT/gLQ+7yFS+nrUIEmgxzvOdxS3PVATdNOzWYd2RNdPddgfetgMSh5R
         ComT6v7VaLiGevaoN3VqzHFGZV4MiK+Unco0Mi+mvllAYx6L+0AZ9k5Oy0RxU6vQhmLz
         UgG0Adhr3MYavkgMwAAqUJDE/Auath0xX0L5jMWtFrAu+OYOPlr0pCUShtQRVMSoinJo
         V/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723122161; x=1723726961;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeLKZbVnG5SDKU6VO1EAbGHOp3mpZRJIZ8cxuvHWISk=;
        b=vqTr0YkBbOQA6/gmTEaQfsk63FFvb47ZmIdUGwsqtHyC85S6ktJULMXj1Bl23UEkZn
         npu1UfuOG/GLQzM2jFwatJf6//n1X+20ce1VSE6biH0KxiwNvScLqU0ZyxX97zprDWjs
         X3O+qo4koQBYy9Ng7XcEtmwNDTUe16QMczQ60lgdU7E26kdtGdqNOcCPWl+ibhvGvXYZ
         JFskVGNcEbNjJK3I6QwP4v3DwljPE/V8xFgfAxq/JlIjBkO2CLAeipuuJs4z1h36LK2T
         JTIVESo77sLRRtqLI6pgK762TnTnOYG+mfBMR7zRW5HVSgG1Af8/Z9jacPWf0MqjrBZu
         B6kg==
X-Gm-Message-State: AOJu0YyrnR6MsatU7+YdnFE3LU3eKCFIlLrfaM29TWcq4dCcC037+w4T
	hsLQgbdlgHTxG4iW1KpvarlJhw9F5CLVtwt79AJY0FfltAwxbrO8/7P69oPkvbk+RzgSgcX+vx4
	=
X-Google-Smtp-Source: AGHT+IG1NGQ8ZXjJnRpiHJEqpvqVfxTubtTuQHwJ+awF8lrosGWRbm/O/czqn0lzzBqw9jYvOvZ4zw==
X-Received: by 2002:a17:907:f795:b0:a7a:8e0f:aaf0 with SMTP id a640c23a62f3a-a8090db212bmr140096066b.36.1723122161317;
        Thu, 08 Aug 2024 06:02:41 -0700 (PDT)
Message-ID: <c655dbd9-046a-451a-a7e8-670a1eaf4ab0@suse.com>
Date: Thu, 8 Aug 2024 15:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 08aacc39
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <66b4bd64b9733_2f15a5d3890299@gitlab-sidekiq-catchall-v2-754c69bc57-l5rxx.mail>
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
In-Reply-To: <66b4bd64b9733_2f15a5d3890299@gitlab-sidekiq-catchall-v2-754c69bc57-l5rxx.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2024 14:43, GitLab wrote:
> 
> 
> Pipeline #1405649318 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 08aacc39 ( https://gitlab.com/xen-project/hardware/xen/-/commit/08aacc392d86d4c7dbebdb5e664060ae2af72057 )
> Commit Message: x86/emul: Fix misaligned IO breakpoint behaviou...
> Commit Author: Matthew Barnes
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1405649318 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1405649318 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 4 failed jobs.
> 
> Job #7535428747 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535428747/raw )
> 
> Stage: build
> Name: qemu-system-aarch64-6.0.0-arm64-export
> Job #7535428873 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535428873/raw )
> 
> Stage: build
> Name: alpine-3.18-gcc-debug-arm64-static-shared-mem
> Job #7535428869 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535428869/raw )
> 
> Stage: build
> Name: alpine-3.18-gcc-debug-arm64-staticmem
> Job #7535429434 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/7535429434/raw )
> 
> Stage: test
> Name: qemu-smoke-dom0less-arm32-gcc

All Arm failures when the three commits under test only touch x86 code.
How can that be? And Stefano, note how this would needlessly have blocked
a merge request, if we were already using that model you're proposing to
switch to.

Jan

