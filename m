Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C98984C1
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 12:09:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700783.1094454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsK20-0000fh-1M; Thu, 04 Apr 2024 10:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700783.1094454; Thu, 04 Apr 2024 10:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsK1z-0000eA-Ui; Thu, 04 Apr 2024 10:09:15 +0000
Received: by outflank-mailman (input) for mailman id 700783;
 Thu, 04 Apr 2024 10:09:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsK1x-0000cX-SW
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 10:09:13 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62aede14-f26b-11ee-afe5-a90da7624cb6;
 Thu, 04 Apr 2024 12:09:12 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-516ab4b3251so974752e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 03:09:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a12-20020a170906670c00b00a46d6e51a6fsm8877682ejp.63.2024.04.04.03.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 03:09:11 -0700 (PDT)
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
X-Inumbo-ID: 62aede14-f26b-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712225352; x=1712830152; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9LgB48Rekx0+HXOSOJzXRkx+a1Ze0DrnzJLgXs7a6j4=;
        b=YHNAOHXYb/yjLTLPddY9eNPaOjRLduZ/8YvCD15cqRMrD/tbpHV5k4epw3Vvyd0GMP
         0jqQcr4GKhw2lND68B1iSq8/yOBXzwsLHM3EEwWcjVM6yZp3f1/02rpZfsQds9O+amj1
         iBtunwbWRGYn+F1oC4bY5ulOZaB3luLnFj3pXukm2u2nz4xrqwNUTjxka+VQwEJMoGY/
         LMm/8zlpvkgMJpwXcTYfav0OopYmagMbuGHdq2H9J2wV6Hxiw9VCIRc/bVlPMavSHgBk
         YBLwWsA5jGhQv9ggzSO6hLuctmO+lrN5IqnD3+jnEFvxen6xnPz372tzr0gecrsWpM0c
         dhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712225352; x=1712830152;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LgB48Rekx0+HXOSOJzXRkx+a1Ze0DrnzJLgXs7a6j4=;
        b=Nr6PjiUPITNtL/OrDBvg/lmfn4q9I1kcorop+1NWwkOYDsSdAcrTgMwpgNxMwVwQFc
         v4Y1FptQspNttjZEC81G2ueqWN53d3wvMdQV1Xg+FGX7zF+1TXUAMtYzM+oLvBFfFbRQ
         xjBUQR0DtYmutfgxk8msFPUVfGjZ9yZK1NnQQMFQuV88t5BByS6Du7j5ZOQd0y7ZXVNC
         hx1K2Z6F4xISGaXdU4orXO2Jirh6NxX36dQPRolAFu87edUCfUWpwFtrYh+H+7NcGeLJ
         c0XwxqNb2/8tTcyTqQcXtr80GQo6QvwoCtKALdi0Qc88cW+Qa595X9e6ClcW97E5OBFY
         z4uw==
X-Forwarded-Encrypted: i=1; AJvYcCWWL6oLwSv81CtH7oz9YEt6Up7MYzY3FIzzz9RdwR9cNBn/pq+Se5W6Jait+11SOTw/MoMgvDHuvW9s68r0H95kBi2h2w21IgWXZZAjuIE=
X-Gm-Message-State: AOJu0YwsDXCEL/qPuue0hfJMknYO3Vi7bJCzUoImfKCDd+AXDnOaxmIH
	hgTPFfKX/CEL0R4BPv3yDa7zSNsUvBvzrc+c+EoTrBLSpGW9DgWFHK6JBh9kvA==
X-Google-Smtp-Source: AGHT+IF+ykWYxUdOpvyjT8nGQ9R5KVOkCp0iDy1ws0BBzpQS//4+e7P7oqDsyXQr6hEJkxIk6lmXxA==
X-Received: by 2002:a05:6512:3713:b0:516:c08a:12ff with SMTP id z19-20020a056512371300b00516c08a12ffmr1665560lfr.51.1712225352067;
        Thu, 04 Apr 2024 03:09:12 -0700 (PDT)
Message-ID: <759cb3a3-3eb2-48a4-ab85-36005378ade1@suse.com>
Date: Thu, 4 Apr 2024 12:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] tools/init-xenstore-domain: Replace variable MB()
 usage
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20240327215102.136001-1-jason.andryuk@amd.com>
 <20240327215102.136001-2-jason.andryuk@amd.com>
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
In-Reply-To: <20240327215102.136001-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.03.2024 22:50, Jason Andryuk wrote:
> @@ -36,6 +35,11 @@ static xc_evtchn_port_or_error_t console_evtchn;
>  static xentoollog_level minmsglevel = XTL_PROGRESS;
>  static void *logger;
>  
> +static inline uint64_t mb_to_bytes(int mem)
> +{
> +	return (uint64_t)mem << 20;
> +}

While committing I noticed tab indentation here, which looked to be in
conflict with ...

>  static struct option options[] = {
>      { "kernel", 1, NULL, 'k' },
>      { "memory", 1, NULL, 'm' },
> @@ -76,8 +80,8 @@ static int build(xc_interface *xch)
>      int rv, xs_fd;
>      struct xc_dom_image *dom = NULL;
>      int limit_kb = (maxmem ? : memory) * 1024 + X86_HVM_NR_SPECIAL_PAGES * 4;
> -    uint64_t mem_size = MB(memory);
> -    uint64_t max_size = MB(maxmem ? : memory);
> +    uint64_t mem_size = mb_to_bytes(memory);
> +    uint64_t max_size = mb_to_bytes(maxmem ? : memory);
>      struct e820entry e820[3];
>      struct xen_domctl_createdomain config = {
>          .ssidref = SECINITSID_DOMU,

... everything else in the file. Hence I took the liberty to adjust this.

Jan

