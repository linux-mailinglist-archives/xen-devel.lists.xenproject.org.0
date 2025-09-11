Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FF4B52ED2
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 12:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119914.1465060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwelD-00057H-Vr; Thu, 11 Sep 2025 10:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119914.1465060; Thu, 11 Sep 2025 10:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwelD-00054c-TC; Thu, 11 Sep 2025 10:42:39 +0000
Received: by outflank-mailman (input) for mailman id 1119914;
 Thu, 11 Sep 2025 10:42:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uwelC-00054W-8E
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 10:42:38 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 076d0391-8efc-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 12:42:35 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6188b5ad681so781724a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Sep 2025 03:42:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b07b30da289sm103895266b.17.2025.09.11.03.42.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Sep 2025 03:42:32 -0700 (PDT)
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
X-Inumbo-ID: 076d0391-8efc-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757587355; x=1758192155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KKV7CufMZ9DOV2XuiV7SNMDgZvcY2sS7LvVboG84b4U=;
        b=I4iauHolos4FDE8Ny/P8QrWiMR59X6g1gUSgQFk0Ks7gxOmWGXCPU3V/0gtRM0iyEp
         VhVDHBrxYtxZp9Z2sLNrYBjB31Bkq06MPNRggDvFlAHaHntSNLMXjYWsUAjj/2vJsl0D
         NKObN8wf6dO6bqTHk7ZQrAnWLgJSiARFHhsXrLFXpbFSXZvVgdLpi3BIr21d9x9NQzQa
         E5rQCFeOF0fwVkf+JZAbvbWD5E4C1+17wrs/ajwD39L+/ocuVrER/LY7AyfGPS4i5DBp
         eT27tIR2rxOEZIwlMjR8LDXX+eWFHKM36Kv4xXgraD6WvEfppwlnnYGH8qw6rFheAYtH
         ULnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757587355; x=1758192155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKV7CufMZ9DOV2XuiV7SNMDgZvcY2sS7LvVboG84b4U=;
        b=SQBFzL+ngnHuIEdYi6APZqJ/6bEg+XiBOPpTzrHJBDYu1s6JYU4c8A23Emz54XAGwS
         5sIfOTWNwNwDT+xsOQmGIZoSz1dm5fEW+N+FYw0lxbjvT4WCyozUrIUVgCkNkaM9rEGn
         toR7WDhmmq4JfAcpiL0OOMbrAO256shg0G4ketMXLHbLiQ+eQKqXWdVSdIendTPUEstn
         /AKFd11iH0W05Nd6G4yqmOgO1Vnj7JHe+MB9WIbPvLVWxfvmB1fQhg+k3AXYkEgaet/B
         cM0tyaxAdK4OEJusW7jW8qQ36pcgFR028Ua2AmlVfl56gUubAV18O3cywBos3QhBrqWm
         OL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXuRrt1HGGW2hMYq+WYuaOClA+Nkphmg7FLYMMFLMO/QAMgcb/EIxwBOVfNBon11nTYVAGcJBZQ1J8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYhNwzu1LDuncmXNYOjkLquHWM7g/wYKSCuNK0RLWzmObr20J+
	JLFisEWqhQm1bk+Xpj+c2hdhOKfB0AEmo4PHcyLttgTHKk1riOUahHJ6lddooxMH7Q==
X-Gm-Gg: ASbGnctc5nmjXH7g4Sou01uOWaXZPMLUcyqjgjQaUj915zjjqlBkUvOiXU6F9yKGH9g
	F+b9HFWyJAxug40/kFhvhW+Mz+SsNqsxlDGbDKkU+zx1tKRuho4t5NY+DmDHYcJ8832aGa5c6m0
	+9r8HlQ1KufDdGlleBtPPG9raSho/tJwHeReHcWuhtZMbupjyj7i7myBVwfT2YEbTTb5HAGMtSc
	K4Mh2rjbbkgN/srb+X75vqloR68t58biszxlAZz6Ie2VqzcfgmJ2UJrf8doWNdV5qRpd9FLS+PA
	ChTDcdprSeQK2QwolhuwGYYqaO/QTkXYI/E1E6r+h2vLUEKdiillPyrUOCddJSrJaMt0kQ+MWsh
	Doxs8TiNUKrkmvSdkpbR83QQ176WClWIRarSbqatYT+ErUw94/S1hqNv3tzFM7o+c7KLPays+s2
	u/St3Bc2DA9b9dq9HLAg==
X-Google-Smtp-Source: AGHT+IHBzE1uckw4rF1TBD4T+H0Qopzs26WImiSNm0xzEVbIUfiP4txYvWirEm25U4TQvWmN5L/gjA==
X-Received: by 2002:a17:907:2d91:b0:b04:3302:d7a8 with SMTP id a640c23a62f3a-b04b16d300dmr1811696566b.58.1757587353024;
        Thu, 11 Sep 2025 03:42:33 -0700 (PDT)
Message-ID: <ebf43b03-2cee-49d1-acca-6a8e0944d2cd@suse.com>
Date: Thu, 11 Sep 2025 12:42:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/26] xen/domctl: wrap sched_adjust() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 Meng Xu <mengxu@cis.upenn.edu>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, xen-devel@dornerworks.com
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
 <20250910073827.3622177-14-Penny.Zheng@amd.com>
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
In-Reply-To: <20250910073827.3622177-14-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2025 09:38, Penny Zheng wrote:
> --- a/xen/common/sched/arinc653.c
> +++ b/xen/common/sched/arinc653.c
> @@ -735,8 +735,8 @@ static const struct scheduler sched_arinc653_def = {
>  
>      .switch_sched   = a653_switch_sched,
>  
> -    .adjust         = NULL,

This line can just be dropped, can't it? It doesn't need ...

>  #ifdef CONFIG_MGMT_HYPERCALLS
> +    .adjust         = NULL,

... re-adding here.

> @@ -2288,7 +2290,9 @@ static const struct scheduler sched_credit_def = {
>      .wake           = csched_unit_wake,
>      .yield          = csched_unit_yield,
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .adjust         = csched_dom_cntl,
> +#endif
>      .adjust_affinity= csched_aff_cntl,
>  #ifdef CONFIG_MGMT_HYPERCALLS
>      .adjust_global  = csched_sys_cntl,

Again better to get away with just a single #ifdef, I suppose.

> @@ -4246,7 +4248,9 @@ static const struct scheduler sched_credit2_def = {
>      .wake           = csched2_unit_wake,
>      .yield          = csched2_unit_yield,
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      .adjust         = csched2_dom_cntl,
> +#endif
>      .adjust_affinity= csched2_aff_cntl,
>  #ifdef CONFIG_MGMT_HYPERCALLS
>      .adjust_global  = csched2_sys_cntl,

Same here.

> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -349,9 +349,11 @@ struct scheduler {
>      void         (*migrate)        (const struct scheduler *ops,
>                                      struct sched_unit *unit,
>                                      unsigned int new_cpu);
> +#ifdef CONFIG_MGMT_HYPERCALLS
>      int          (*adjust)         (const struct scheduler *ops,
>                                      struct domain *d,
>                                      struct xen_domctl_scheduler_op *op);
> +#endif
>      void         (*adjust_affinity)(const struct scheduler *ops,
>                                      struct sched_unit *unit,
>                                      const struct cpumask *hard,

And here, even if the other #ifdef is (just) out of context.

Jan

