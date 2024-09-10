Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757C7973077
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 12:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795216.1204427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxgh-000542-GX; Tue, 10 Sep 2024 10:01:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795216.1204427; Tue, 10 Sep 2024 10:01:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxgh-00051V-DE; Tue, 10 Sep 2024 10:01:31 +0000
Received: by outflank-mailman (input) for mailman id 795216;
 Tue, 10 Sep 2024 10:01:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snxgf-00051P-DK
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 10:01:29 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4f77b52-6f5b-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 12:01:27 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-53662965a05so664637e87.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 03:01:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25d65cf6sm455248466b.222.2024.09.10.03.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 03:01:26 -0700 (PDT)
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
X-Inumbo-ID: a4f77b52-6f5b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725962487; x=1726567287; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v9ZDdgUxmxFogqKbV0ZfBlBw9mutj3HsfhDx8HZJRh0=;
        b=HFb5EgmKiy3OnxEF97pCvnEsBG7iGrvYK/GT0bePVlhtxhBzLETWZcGMNiNcbBeZbv
         Oiv27AiTfiEXqqdCBxpdgCjZiJoBXax/tFWTjjkgjwyd1sFni//yZB939761XWvdfreY
         D+c1pcIwepaWUi1qIVwMSj5NBqxaH2kdvz9TfWM8i1Wu5IEJOqn2YZ/YN+yClXY9wwn0
         1N0eW9glk2p0FUj94oDExzgikEbRU1eolYZEmVRq5c2rJF81RIysdM5lIJuash+gdkvB
         zKvNj/IK4a6/1jDA7nXCqMZpdbfDMrLsvNeo2MXy1dSo6c9JKFD4pyrvpwpJW9YpTT3x
         wQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725962487; x=1726567287;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9ZDdgUxmxFogqKbV0ZfBlBw9mutj3HsfhDx8HZJRh0=;
        b=UfXNuTNArcE9n8DuqAH1Aoz3beTSMs2aXpHpdwCxrVojBn2sMkwmu7S8yB1nAcY2PO
         liWVJASL4xDCiFTvFOm5iMkHeRyO7pB+Eda8vgHAIvcBMwcacQdGxLpeVxv/+d6Xnc8F
         BXE9oJt/ljvR5NM8KyxCfgjQsPd9W2/pL1I5fDJTxC0j2j7mC587xOR0B82sq+L0mbvK
         UO6dp8dDmumOsMWs1jw346bsKNuMdWEel/6vLBcJ1/FXYDuvGpYAW66GQiZrbqvou9EU
         zZAas+ccWIrU0Ht/AjhRVZwoPJCurh6b5/vAo3RepXuA78zcqujVIw4uEJNMJs9eQSQf
         uh5Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0+Yu62ydDi7r6AZnrBdTekQ2P8N+VaCQSMnJAeWKR/ry8Sv4FHG85ve/qSXnwxgqGlVhwFcb67wg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzydbD3IkE5H2UkuEPq82nojRKNV02V3KsP9osO0O6+6ROw3sJQ
	es9jdE4NA1R/RN+uDR2fy35lnIeLqN211MQDcTZUs5y34WkUWW2JEUOsac3RUg==
X-Google-Smtp-Source: AGHT+IFCKGb3CfScAL0wqEzeWiXUuISWHcLUd9/YFrCqzzb9FmcmEPwZkFyXGA9kLCsHZTm5Wts9sA==
X-Received: by 2002:ac2:4c48:0:b0:52c:dfa7:9f43 with SMTP id 2adb3069b0e04-536587b4380mr10412137e87.34.1725962486513;
        Tue, 10 Sep 2024 03:01:26 -0700 (PDT)
Message-ID: <4d98b0fb-e797-4a4f-9edc-4894f85b357d@suse.com>
Date: Tue, 10 Sep 2024 12:01:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/9] xen/riscv: set up fixmap mappings
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1725295716.git.oleksii.kurochko@gmail.com>
 <a05babb0982a3a0709ed08c3eeb9a729421e1bd1.1725295716.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a05babb0982a3a0709ed08c3eeb9a729421e1bd1.1725295716.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.09.2024 19:01, Oleksii Kurochko wrote:
> Set up fixmap mappings and the L0 page table for fixmap support.
> 
> Modify the Page Table Entries (PTEs) directly in arch_pmap_map()
> instead of using set_fixmap() ( which relies on map_pages_to_xen() ).

What do you derive this from? There's no set_fixmap() here, and hence
it's unknown how it is going to be implemented. The most you can claim
is that it is expected that it will use map_pages_to_xen(), which in
turn ...

> This change is necessary because PMAP is used when the domain map
> page infrastructure is not yet initialized so map_pages_to_xen()
> called by set_fixmap() needs to map pages on demand, which then
> calls pmap() again, resulting in a loop.

... is only expected to use arch_pmap_map().

> @@ -81,6 +82,18 @@ static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
>      BUG_ON("unimplemented");
>  }
>  
> +/* Write a pagetable entry. */
> +static inline void write_pte(pte_t *p, pte_t pte)
> +{
> +    write_atomic(p, pte);
> +}
> +
> +/* Read a pagetable entry. */
> +static inline pte_t read_pte(pte_t *p)

const pte_t *?

Jan

