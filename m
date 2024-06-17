Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A145F90B06A
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 15:55:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742324.1149100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCou-0001eU-J1; Mon, 17 Jun 2024 13:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742324.1149100; Mon, 17 Jun 2024 13:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJCou-0001d0-GI; Mon, 17 Jun 2024 13:54:52 +0000
Received: by outflank-mailman (input) for mailman id 742324;
 Mon, 17 Jun 2024 13:54:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJCot-0001cu-Fz
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 13:54:51 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29ac6007-2cb1-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 15:54:49 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6f253a06caso519600266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 06:54:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f99774sm518419066b.203.2024.06.17.06.54.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 06:54:48 -0700 (PDT)
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
X-Inumbo-ID: 29ac6007-2cb1-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718632489; x=1719237289; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k930QoTtYQ0UG35AdGJNKynRKWLkbZDpAZ2hemTOnVg=;
        b=OMbwaGer30UuNMbkXw6ovLA1DzaGyyK+wQ51xLHgFom4vyt0tEQ/Ld/j52/rxRYM/w
         oR6Iq/GwJgME9LT7nQ2jzvTVdyHY1v3JkqJvHFz5jsolzJtoyC0Xi0Wzvas2eMMPTNq8
         MM2tnnK7cvxDcDCjyZx5MOzVkyHDBMwFr9OKCk4Ni3tMnAKGnqtL6V+OhiXPhP95cJ/J
         L8xdGe+WAL1m0j0AW0pZYCvmSBtdF50D3ciFIDudiaOZfb8zXOTsmdzfOFdiJJOZL+Wf
         /TrLVvEmcszQw383PBNRInDCkflhEkbjXToUfu72cURHGM8SrkBSNmiw08aexY6PKEHu
         RqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718632489; x=1719237289;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k930QoTtYQ0UG35AdGJNKynRKWLkbZDpAZ2hemTOnVg=;
        b=vQqwTTZEhcJeDgvF7j4filb1RzTapAMpFuAG3DbDP36w2Lg6+mXIQIMbNPb4/D1aL8
         IFmoFSIRxBERMjfY+vR1c+cct9/ddIFdQRKXlGXdvuVsIelCUx6h7UwIPlTFl+wpmoym
         +kz+gzqJNswq0/nk0tIcUrsyofmx8FCudA/ItqelZUDg1Jhc2a8QHqEDNmO/hEKD2Ny9
         +iGqPLhKJ3rWdj8jMuCQrP1PlNKfFaXn8pC8Wekbt8vcmckGDb+tZ5f2r5liMChoYJkJ
         rzIzHwOUMiQjPm9gObaHSeLofzJauoEWsO7gukgSD0M7nQ2S0RlI7VnT30PqqC0l0arp
         BUog==
X-Forwarded-Encrypted: i=1; AJvYcCXHagEqWhohxsSW6MUxQDsKUA4Bq2VQ/YP12gvXQVxOTACQMPhw5hECMiuuC1fS/2u+TV88cwyZ+lVd+L3TAd9MFDDy0JZse39Eun98jvM=
X-Gm-Message-State: AOJu0Yy1K+DtvR5dPn9W/IAsJU0OIaXYuu/tPj6j8NniQuk/Zg0gJli3
	WRDt0drX2n0eicJrnVHp24NB+2GJEfCIFbqvAPHZi3pOO4kIedsCafoaAS0Wcw==
X-Google-Smtp-Source: AGHT+IFTEy9iULiT3ZDAYfFjjClER6MqGNwkFuqib/y0OY+n0yDlALd0L5BKvMoYEFZQfhXyJLUblw==
X-Received: by 2002:a17:906:ae5a:b0:a6f:21e8:ad06 with SMTP id a640c23a62f3a-a6f60d3780amr856627666b.20.1718632488640;
        Mon, 17 Jun 2024 06:54:48 -0700 (PDT)
Message-ID: <b9848aab-dd12-49f4-a1e0-a1d622359c8d@suse.com>
Date: Mon, 17 Jun 2024 15:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/mm address violations of MISRA C:2012 Rule 5.3
To: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1718380780.git.alessandro.zucchelli@bugseng.com>
 <80cb7054b82f55f11159faf5f10bfacf44758be0.1718380780.git.alessandro.zucchelli@bugseng.com>
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
In-Reply-To: <80cb7054b82f55f11159faf5f10bfacf44758be0.1718380780.git.alessandro.zucchelli@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.06.2024 18:12, Alessandro Zucchelli wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4703,7 +4703,7 @@ long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      {
>          struct xen_foreign_memory_map fmap;
>          struct domain *d;
> -        struct e820entry *map;
> +        struct e820entry *e;

What version of the tree is this against? The variable in my copy is named
"e820", and it is only then that I could see what the conflict actually is.
I can't see any conflict with anything named "map". Saying what the actual
conflict is imo also ought to be part if the description.

Jan

