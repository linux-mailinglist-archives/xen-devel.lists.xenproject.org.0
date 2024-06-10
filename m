Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF749020BF
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jun 2024 13:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737241.1143462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdZ6-0007Vr-Bu; Mon, 10 Jun 2024 11:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737241.1143462; Mon, 10 Jun 2024 11:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGdZ6-0007Tp-8S; Mon, 10 Jun 2024 11:51:56 +0000
Received: by outflank-mailman (input) for mailman id 737241;
 Mon, 10 Jun 2024 11:51:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mjq2=NM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sGdZ4-0006af-Q6
 for xen-devel@lists.xenproject.org; Mon, 10 Jun 2024 11:51:54 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4efa8f6-271f-11ef-90a2-e314d9c70b13;
 Mon, 10 Jun 2024 13:51:54 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6ef46d25efso306023166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Jun 2024 04:51:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f2e231f73sm27785366b.63.2024.06.10.04.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jun 2024 04:51:53 -0700 (PDT)
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
X-Inumbo-ID: d4efa8f6-271f-11ef-90a2-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718020314; x=1718625114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WM7cbeVxrugWysXgWa3o9HPhZiHUZzLyXfDDvyvD6ig=;
        b=b9bgmzMoWdHgAA8dd9yQ/4XytKwCNZh9HMhlbyxU4CteKB2/YiG9bkYV+wXoVf3tW4
         J0SHoNgPjeGGxyDDUnS6fA6xXukV5VQnr3vcbqBMkGmBPL7kPx7/r3iJKiD4uF4rd+z6
         D4NugQC3W7DLbTR/D88tXFk12bPJtM12B9Tq5N8WFB2iMEQWeSprTSs5YOtuL7LdDOG9
         PAYr0TPUOO5GD2zGg4G89xl1RvGXNaTj8iQibFI1xmDoMJrnjh8ergb0TLzvEWAAVgKK
         7038lh0cX4XwYHajDmmDOGdgLOXWlZoprnPScCi37hbFCkADA5gpz/kVHGNlRe//zguj
         m82Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718020314; x=1718625114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WM7cbeVxrugWysXgWa3o9HPhZiHUZzLyXfDDvyvD6ig=;
        b=RKGkQ+UJaPj4si8ZSEWDp6et6aWxnfnO1rxYdRGjLUWdWePe3B8onrNCkWbOPkCJOf
         q8UNW3taDSrVwIeIqb3yQB2hIo9KTSn/uePMmCNs+osGtKT9p1dnyKE4YN+fHDY4t+97
         bW9j2qC3piECg3u+RCr7hIj8t/dGbjqtgjoh5LyDGmYApBMVDYC8RiP2ewkWv752Fv3R
         JdrkEdj8eUzY98oC2lkWYXyNOlC8/vZAXzTiQG8QoKvoDSaRK9+mj1l/xJOODt06xuoX
         7q6wKMOu3w6SittRdRdk/mWObAPNdGmmtcMLfLV/UQbRNRht0zeJbEXnl0SgxnrklMom
         t8hw==
X-Forwarded-Encrypted: i=1; AJvYcCWdc9laAA8ITHEuC4wlHcHSYkwYetyKXTuI7RE50tWhIYiKZBxU/q8kzltgk60H8jr6tLivTBVvPL4ZlNcQkiywcQ/Z4w5Hpu/kCubc7PA=
X-Gm-Message-State: AOJu0YwEjW/F2WsPcnU7XGtJlWVlXGMluUb4ku72UL6RfnUrxo1CTXhg
	xWpTFA+AURokDtd0WWmQyhss9KrN6GBUoluTP2at1gf69Lo8RZLEZXLdqDScUQ==
X-Google-Smtp-Source: AGHT+IHrOBEb4llKZ5J/HIzYgUbKjaF8ONdloK5PjgSgRfpM6vPu4rryJEWuzrlxC0EVn8U11u7yTA==
X-Received: by 2002:a17:906:ae4a:b0:a6e:46ab:9a9b with SMTP id a640c23a62f3a-a6e46ab9b22mr472769366b.31.1718020313805;
        Mon, 10 Jun 2024 04:51:53 -0700 (PDT)
Message-ID: <0a57be60-c8c6-4aba-9ef7-27725945a151@suse.com>
Date: Mon, 10 Jun 2024 13:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 09/16] x86/traps: guard vmx specific functions with
 usinc_vmx macro
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1717410850.git.Sergiy_Kibrik@epam.com>
 <63045d707485c818af5eafa45752e60405ecf887.1717410850.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <63045d707485c818af5eafa45752e60405ecf887.1717410850.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.06.2024 13:24, Sergiy Kibrik wrote:
> From: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Replace cpu_has_vmx check with using_vmx, so that not only VMX support in CPU
> gets checked, but also presence of functions vmx_vmcs_enter() & vmx_vmcs_exit()
> in the build checked as well.
> 
> Also since CONFIG_VMX is checked in using_vmx and it depends on CONFIG_HVM,
> we can drop #ifdef CONFIG_HVM lines around using_vmx.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



