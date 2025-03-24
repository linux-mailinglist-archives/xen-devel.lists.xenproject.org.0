Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F5EA6DED7
	for <lists+xen-devel@lfdr.de>; Mon, 24 Mar 2025 16:34:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.925825.1328705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjoo-0001h1-TA; Mon, 24 Mar 2025 15:34:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 925825.1328705; Mon, 24 Mar 2025 15:34:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1twjoo-0001en-Po; Mon, 24 Mar 2025 15:34:26 +0000
Received: by outflank-mailman (input) for mailman id 925825;
 Mon, 24 Mar 2025 15:34:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sMR0=WL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1twjon-0001eh-3H
 for xen-devel@lists.xenproject.org; Mon, 24 Mar 2025 15:34:25 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76a539c3-08c5-11f0-9ea2-5ba50f476ded;
 Mon, 24 Mar 2025 16:34:24 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3913fdd0120so2476401f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 24 Mar 2025 08:34:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9e65e0sm11479271f8f.61.2025.03.24.08.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Mar 2025 08:34:23 -0700 (PDT)
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
X-Inumbo-ID: 76a539c3-08c5-11f0-9ea2-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742830464; x=1743435264; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ePWSLeEN01vnuZ+IMz0CBTfg0gV9ne5BLu4pu0tExEY=;
        b=LIPwEaG0/ZKuprAryjhxRGM1eJy0eYy2uqZb/hD6B+PfkeCmwr9bGzdgjVrjWY3bNg
         yctPzyVIESNZq69ZSNPHeeik43tN+yDRjw6hb4VkJj1VTZBorSVsQJ1HddrPU8KPkohj
         xjs4yjwL23qIlzQ/hxB1JthSWBbmohJliOECS30qzk/SnhwGYgwCGNi/IFAzhjy/SSFq
         oyrrYsf99xthJ6NsWjttug4ltt++rzCqJn7eJaYg4DrEdBqHlzIXvx+lLGR2fbtMaP7S
         cq58SpWGETmymXrJWuKfFpmRishSusOXiOc7Ls4+LvuAvFJt6cuu1/m6WhAZD8V8L/+L
         1KqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742830464; x=1743435264;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ePWSLeEN01vnuZ+IMz0CBTfg0gV9ne5BLu4pu0tExEY=;
        b=Gb/LO7kK6nVEUlOjuxR2Mjtz3FDsRnZwdp2XhGZTqwzl5pMQra4YHGs1625TY0IDpl
         JDQkEUXE1hj2+jc6IELdu7DUuQax5yClG40FN0w9OTPlVHJesetLmCsF+9Ytz40Xr5tQ
         rpEJFVN+CegYYRiHDJ8y1xUdtmv8aWrLpCMwLr/uloi5k/EZUWWfh+OZQLLOQMN3XNT4
         86moZz1YvItMeJhdzgnzJ+dXQVU1oYMqfIJVOIx0oQaDezsl+H3W9Y7ir3mhoINVHqTR
         Cl1/JfQoxTkSlKBBU0/7M+4m4gMlDgSAyozkq0Fhj9g+fOyHbhfoQG3BG1X6mFZLygnN
         iKiA==
X-Forwarded-Encrypted: i=1; AJvYcCWuigO8ToJ8EdFaLD58E19y8s0SCc1nWLBXAvj820Ptmx+63h4n3DhcOWw237CpZTd66wLdeQLpga4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwSqO7I2PVz4ZYwr+tVPM9Apqq6umOUAzM7uiRwvADSsNQ9QYrK
	uooYb9HjU6jRvDi3rfD0oPTfBowSa8Ps6B4sASCtpzVJOnAZorXhssxJj+GyhsedT3bHp7hcMQU
	=
X-Gm-Gg: ASbGncs9WwR8BGA5Tb0MbOPc5P7mgKPfmN/vTlKyvNMsnUcPiKRbTiKzUkB0iMj3jqO
	skFNSNVCAavdf25AheY2c12U2SfxiBiBrBz8LxYA0I8ti8biybx8dwIe6CbJkrIiuqk4QMOt+si
	RTy7gS1JfujRCTxlYi3oDbSy0tecQpRgFditz4pNiOglTUfGHr4t4ahfpo1a0fA5QuPIdB2ZwpR
	Cid+Osn61QPSCRK031xx+zWCabqMDF/aiKFfzmIQolseiwBfX0Ew2eCw8F+YEMEfu0gnraM9wi+
	5bqnc20C/y5BToTReKwmGbT1UXuhwYdn7Hh7OyOBwdk1jGZr1iEIgmzUr6lD3cF9d6UY3oTddco
	5RFRhnKv597qKAqq7TkWqgeJcbPnoQQ==
X-Google-Smtp-Source: AGHT+IHzRJNH2B8AOqO9NOuJEfdLjgcLATIF8Okg8eL7JqZNzgD3aMD+4ICEv922TSwY+8jyJCym2g==
X-Received: by 2002:adf:e19c:0:b0:391:2e97:5788 with SMTP id ffacd0b85a97d-3997f94041fmr12161909f8f.55.1742830463531;
        Mon, 24 Mar 2025 08:34:23 -0700 (PDT)
Message-ID: <fecc74d5-3111-4cfd-9c3d-07dbb6a98ac6@suse.com>
Date: Mon, 24 Mar 2025 16:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] xen/cpufreq: disable px statistic info in
 amd-cppc mode
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, xen-devel@lists.xenproject.org
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-7-Penny.Zheng@amd.com>
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
In-Reply-To: <20250306083949.1503385-7-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 09:39, Penny Zheng wrote:
> Bypass cnstruction and deconstruction for px statistic info(
> cpufreq_statistic_init and cpufreq_statistic_exit) in cpufreq
> CPPC mode.

You say what you do, but not why.

> --- a/xen/drivers/cpufreq/utility.c
> +++ b/xen/drivers/cpufreq/utility.c
> @@ -98,6 +98,9 @@ int cpufreq_statistic_init(unsigned int cpu)
>      if ( !pmpt )
>          return -EINVAL;
>  
> +    if ( !(pmpt->init & XEN_PX_INIT) )
> +        return 0;

I understand this is needed if statistics really are of no interest for this
driver (which needs to be clarified in the description). However, ...

> @@ -147,8 +150,12 @@ int cpufreq_statistic_init(unsigned int cpu)
>  void cpufreq_statistic_exit(unsigned int cpu)
>  {
>      struct pm_px *pxpt;
> +    const struct processor_pminfo *pmpt = processor_pminfo[cpu];
>      spinlock_t *cpufreq_statistic_lock = &per_cpu(cpufreq_statistic_lock, cpu);
>  
> +    if ( !(pmpt->init & XEN_PX_INIT) )
> +        return;
> +
>      spin_lock(cpufreq_statistic_lock);
>  
>      pxpt = per_cpu(cpufreq_statistic_data, cpu);

... why's this needed, when below here there already is:

    if (!pxpt) {
        spin_unlock(cpufreq_statistic_lock);
        return;
    }

?

Jan

