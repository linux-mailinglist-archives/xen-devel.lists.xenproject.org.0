Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4792093AF3C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 11:46:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764043.1174336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYYt-00067E-Qr; Wed, 24 Jul 2024 09:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764043.1174336; Wed, 24 Jul 2024 09:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWYYt-00065j-OC; Wed, 24 Jul 2024 09:45:31 +0000
Received: by outflank-mailman (input) for mailman id 764043;
 Wed, 24 Jul 2024 09:45:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWYYs-00065d-Un
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 09:45:30 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 76720d2f-49a1-11ef-bbfe-fd08da9f4363;
 Wed, 24 Jul 2024 11:45:30 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5a1fcb611d9so5474432a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 02:45:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a879f155asm202671966b.53.2024.07.24.02.45.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 02:45:28 -0700 (PDT)
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
X-Inumbo-ID: 76720d2f-49a1-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721814329; x=1722419129; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IC53NO0ncPSMZUJ19G1EiDgyEEM4QYwAlx7R5gn3y80=;
        b=RLeiGKNLA/jxmzyc36chUkukAzoajDhgIot6wh9nz21iVjEvfbsi/XRJUIKJvUolax
         SmYvlTqfW9GwxuTGLw+TdQ5PrNlyJBlzkWo/fnW+gb6faWEJWxNPb1j1Ma30osknon02
         eM2GEtbmMz/0+3TgODtN+qNZHR1S59npNntil21licUOMR0keNazQJ3cZBDRljj5JKT5
         OEyFsaE3bn4XPv0XIckN8bW5PqiAVNj6d2m7k2WCSDV9YddjetBskFhIABtq3fRpnyKz
         ZLJZwzWsEzQjlveEgxmNA8FBHL1K/xdpaPfewphTSQEjpX8OV4CAHyGWyNrLqEykVOky
         3aCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721814329; x=1722419129;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC53NO0ncPSMZUJ19G1EiDgyEEM4QYwAlx7R5gn3y80=;
        b=EOQautFZHeOHcrSYDDf0Co0JflX89ROunZixFFaFK7doTA5zxP6afWQFeWDfTeID4R
         HAL6wUl5nzj0RnwEyYq9jFPLwhjw+uNsmXAc62XDQinh4JkByMnCPFTGPnKCzLxXZlIf
         J0V+ZuM+nPe5XxfFilLqGqC6BO0GVl4dZQ6dzyaH/GWGkxoF1S2FJFJfAbqy6c4qAzHQ
         w+GuJk5JU7oX57wWabesdcrqooKiUUZS6C+c9e+rl6IX8Xxe+lrdf75mTwjjrzNj4u1j
         O79yHk2WMyrstFwTjFSYg1iJhe7F7j8Ltdn2Ee/9XQrR339KSitKiPp+/9dyVGw7a7ff
         1feg==
X-Forwarded-Encrypted: i=1; AJvYcCWsy2YGEA2lxh7zMuPPHZYao0MA7HbbEC4DtoEBVJoKWwHjjj5xQkRaEfazjeVHOaRQHwvgFhqTOLVhiGpJT0+L9tT3z0DxHkulYVnkBkk=
X-Gm-Message-State: AOJu0Yw1SyBS72SK9Boxg6/9lpzu5brshN0IqMom9eMn/9RWL3JXkvrT
	olG0tjs58bl9X5pQPJ+8Frce7WZQeAYotvpvZ9aQcG/pqyspvbwgoivyNttWkQ==
X-Google-Smtp-Source: AGHT+IGYi7oC0l3FVpweQIrX1Mirn6dsd2X9doPhUD73+Ejd9JOQhoGKe/zQS+8jazqXIafdsU70sA==
X-Received: by 2002:a17:907:7f86:b0:a72:883f:f3dd with SMTP id a640c23a62f3a-a7ab101b5d3mr104810266b.56.1721814329218;
        Wed, 24 Jul 2024 02:45:29 -0700 (PDT)
Message-ID: <d39e4fd8-ce54-48b2-8b20-b22b5c70fe73@suse.com>
Date: Wed, 24 Jul 2024 11:45:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/9] automation/eclair: fix deviation of MISRA C
 Rule 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1721050709.git.federico.serafini@bugseng.com>
 <490e1a84b1b4b8d983dc41af147191f79506cdbd.1721050709.git.federico.serafini@bugseng.com>
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
In-Reply-To: <490e1a84b1b4b8d983dc41af147191f79506cdbd.1721050709.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.07.2024 18:48, Federico Serafini wrote:
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -499,7 +499,7 @@ safe."
>  -doc_end
>  
>  -doc_begin="Switch clauses ending with an explicit comment indicating the fallthrough intention are safe."
> --config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
> +-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through\\.? \\*/.*$,0..2))))"}
>  -doc_end
>  
>  -doc_begin="Switch statements having a controlling expression of enum type deliberately do not have a default case: gcc -Wall enables -Wswitch which warns (and breaks the build as we use -Werror) if one of the enum labels is missing from the switch."

This patch doesn't apply. There's a somewhat similar entry, but its doc_begin
line is sufficiently different. I have no idea what's going on here; there's
no dependency stated anywhere.

Jan

