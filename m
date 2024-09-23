Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D597EA68
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2024 13:02:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801916.1211980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgpF-0005VE-Kl; Mon, 23 Sep 2024 11:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801916.1211980; Mon, 23 Sep 2024 11:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ssgpF-0005Si-HF; Mon, 23 Sep 2024 11:01:53 +0000
Received: by outflank-mailman (input) for mailman id 801916;
 Mon, 23 Sep 2024 11:01:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aZUN=QV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ssgpD-0005Sa-Vp
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2024 11:01:51 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ba1d078-799b-11ef-99a2-01e77a169b0f;
 Mon, 23 Sep 2024 13:01:50 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c5b9bf9d8bso1319241a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Sep 2024 04:01:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5c59dfa8csm416332a12.71.2024.09.23.04.01.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2024 04:01:49 -0700 (PDT)
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
X-Inumbo-ID: 3ba1d078-799b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727089309; x=1727694109; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=USQ/O9+YgBlbmtZSkQJ1N506cGMm65i0vsnKSS6bv4E=;
        b=AUoSV5RLuM5rUubFrt8sh0eP5ijPoy6W8orGbH6ba4RMw8b5dDblkD/EwZcQZVlp/w
         ip9E4kMNU53takkN/TJQn2EgLN2xo6oWLqNtQayL0vCrNCWcCUIVexX2feLevMArpROS
         DM7SSIxyx4xoYI7z7+aJp5QXePsiEmtC8CDUuWZ7k56eSyoLuIrC1GcUs81V3x8Kqz6A
         qavxEMF1TV7Jv5InViKt4XByhkzjQ/fhblz7/D/9kE03YUO/cp7riFdXg7acOQIz57ib
         wT0i40xI8c4wlfBmYREgtZAyVWWj5HPnVfo/mrCs9lOqRnvsGJdcY1dwq+b1/1FhAaSk
         wTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727089309; x=1727694109;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=USQ/O9+YgBlbmtZSkQJ1N506cGMm65i0vsnKSS6bv4E=;
        b=vs9QragciKT2QogLOOp3ETf1MuUS01CuZFN7O7dTPyGIzfjWeQbMS92VIpEqKGEx4s
         SNnmw2G8WTCsIHukrzv2fCKY7ny2Xj+DvY1hazT8xioN4n3jAU7GhppmmjEUbNsoNAdn
         Gwypsi++j1coC7tUXCe2eVNDyidubSEmshvHM4CGLXKIPFgWNq9d79L+zM53MgNg+r0s
         PDthmKN09G6eOm5nnSmEFSmajDYBAgWTmtTXRuYDF+gARPtB5XUQoQZsz19S18k6Zmnl
         xyydvoJqRI8HLMFew7Gd2dRSybL4LIbWfl+EhuiHItvpyKRa01Itchw9BtCUayFuqVHC
         IJ6A==
X-Forwarded-Encrypted: i=1; AJvYcCUKIjSUpsrSDY3jUILBfaD8S6AlTUKoGYs3TBHilxUtEJG9Yi16q2wfcgKa8FVq5d5fBTmDmYJWmxk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxvFgiSRUi8uPH/kDcqejb35wNd18qPjJ0s97k/DQaiNP2g4qcL
	C8pFaIZML1nqYGJ274JKh1rYHKrhSRt7yKRW8Lz2IuY5N3j4/BAy2juDfim7Qw==
X-Google-Smtp-Source: AGHT+IHiHzhwkkjgWic2gPDTW7GTlO2KE6SC/5+kl87u9Vfp7YcdPFd81mk+sLLl5aOc9OexgTkXQg==
X-Received: by 2002:a05:6402:234f:b0:5c5:c536:5fe0 with SMTP id 4fb4d7f45d1cf-5c5c5366037mr1138222a12.21.1727089309376;
        Mon, 23 Sep 2024 04:01:49 -0700 (PDT)
Message-ID: <83886b54-8687-4b4b-b356-7093758498d9@suse.com>
Date: Mon, 23 Sep 2024 13:01:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/livepatch: simplify and unify logic in
 prepare_payload()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240920093656.48879-1-roger.pau@citrix.com>
 <20240920093656.48879-2-roger.pau@citrix.com>
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
In-Reply-To: <20240920093656.48879-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.09.2024 11:36, Roger Pau Monne wrote:
> The following sections: .note.gnu.build-id, .livepatch.xen_depends and
> .livepatch.depends are mandatory and ensured to be present by
> check_special_sections() before prepare_payload() is called.
> 
> Simplify the logic in prepare_payload() by introducing a generic function to
> parse the sections that contain a buildid.  Note the function assumes the
> buildid related section to always be present.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/common/livepatch.c | 106 ++++++++++++++++++-----------------------
>  1 file changed, 46 insertions(+), 60 deletions(-)
> 
> diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
> index d93a556bcda2..cea47ffe4c84 100644
> --- a/xen/common/livepatch.c
> +++ b/xen/common/livepatch.c
> @@ -647,15 +647,37 @@ static inline int livepatch_check_expectations(const struct payload *payload)
>      nhooks = __sec->sec->sh_size / sizeof(*hook);                                         \
>  } while (0)
>  
> +static int fetch_buildid(const struct livepatch_elf_sec *sec,
> +                         struct livepatch_build_id *id)
> +{
> +    const Elf_Note *n = sec->load_addr;
> +    int rc;
> +
> +    ASSERT(sec);
> +
> +    if ( sec->sec->sh_size <= sizeof(*n) )
> +        return -EINVAL;

Oh, after my reply to Andrew's reply, now looking at the actual change -
is it perhaps ASSERT(sec->sec) that was meant?

Jan

