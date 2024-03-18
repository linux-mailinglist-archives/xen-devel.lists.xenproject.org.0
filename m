Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6778487EA0E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:26:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694695.1083720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmD06-0000dV-Vo; Mon, 18 Mar 2024 13:26:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694695.1083720; Mon, 18 Mar 2024 13:26:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmD06-0000b0-TB; Mon, 18 Mar 2024 13:26:02 +0000
Received: by outflank-mailman (input) for mailman id 694695;
 Mon, 18 Mar 2024 13:26:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmD05-0000au-1j
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:26:01 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0edc4e3c-e52b-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 14:25:59 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a465ddc2c09so309194166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:25:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 t26-20020a056402241a00b005689f73704csm4609584eda.38.2024.03.18.06.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:25:58 -0700 (PDT)
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
X-Inumbo-ID: 0edc4e3c-e52b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710768359; x=1711373159; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SgnoUJb82+G01g/W7KbVHHnL69V6qQCv06GWruWVUI=;
        b=WPblPA2kKESCyhO4+S9YKo5mseBjiR40ZupzmXQq4gq/jJjDBBsMcZKaX9JwmDC2Ke
         kvb9pJrbY02mVIv46YmADBi4WPgICLjYAOGgCAu912TO88Eang4jAHRPgsYwj3x3m2UM
         9J7zyMAbfnaiPW0scaLTuWIRv/OgcWqbrnxsShnKT03sEyNJAdIKuOD7cguRGQBVq2iu
         f2u2njfz/ebQldmUoUC/QDCWkCK2c+sS4joRkwuS8yefyOnpqRZ0lrZz/lwNuF1tVHSs
         IKEWoLVkiZeePz3NwM2fKeJILYuUsyg54sykLiUMU+Rdo/iRm4gdxo6uVBqWrm8JYpNM
         9m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710768359; x=1711373159;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SgnoUJb82+G01g/W7KbVHHnL69V6qQCv06GWruWVUI=;
        b=FNHRV63HyJPZTvd1SyZGPzEgId57W6yzGBdEu/rGzg5b+CLycb3Jw/Fp4Exyc3bUIM
         riLjXXPU7aOLgC0oNPR85mHIRE9K7JOC7xOvh+wwrIYqLSZS2B2mGEdqw0lMlLODxg7/
         C7kWPFLDlYDsSsFDBuP22ewUjo3abbc6vIb2XzCvc+DqNkFdytaH8WVDw1RvfY0N1MQ9
         vbNa9gx0LzCcJL1D3r4P3CJ7pESC0SCTzDlgbnXaPtZaZum1urOXL6uzkYJdWyWDePlJ
         XVbzCJAfoPKOWZjrwMjdr5xcSpVLQlGZGhwsRp1msTZDh5QmwiasE2hrtio9fpkSUcq1
         comA==
X-Forwarded-Encrypted: i=1; AJvYcCWb/r/rLpmwMNgPvjKlbLh36tlyXYCCusPK6EmGBjJ4b0TYl0/mVHNiUzdvZYUTXwmTmDkyKN61+EehDusxvNFpIM0Tk1Ue18l5EG+eIPA=
X-Gm-Message-State: AOJu0YyAgay/oSWQOD+X3l5o29jeobTDCNfM+gjHIpNSEi8iC4fNoJFZ
	NCFli9qsIvPow9qxkd9mFkR9vKWLTUiEOBnjK98mDJq6OjgVmZMAI79fkSuLxg==
X-Google-Smtp-Source: AGHT+IG2w3qbN4dAXvZs17g+0MEjz15vX3dDpzTGniSSagXdozwaNTC8Bg2s9wJOgGAvsjKcIK0Peg==
X-Received: by 2002:a05:6402:2418:b0:568:d19e:7ab0 with SMTP id t24-20020a056402241800b00568d19e7ab0mr4073163eda.36.1710768358709;
        Mon, 18 Mar 2024 06:25:58 -0700 (PDT)
Message-ID: <94622e8d-e5b9-4306-bc61-d37cd8078338@suse.com>
Date: Mon, 18 Mar 2024 14:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] xen/virtual-region: Link the list build time
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-4-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240318110442.3653997-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.03.2024 12:04, Andrew Cooper wrote:
> Given 3 statically initialised objects, its easy to link the list at build
> time.  There's no need to do it during runtime at boot (and with IRQs-off,
> even).

Hmm, technically that's correct, but isn't the overall result more fragile,
in being more error prone if going forward someone found a need to alter
things? Kind of supporting that view is also ...

> ---
>  xen/common/virtual_region.c | 45 ++++++++++++++++++++++++-------------
>  1 file changed, 30 insertions(+), 15 deletions(-)

... the diffstat of the change. It's perhaps also for a reason that ...

> --- a/xen/common/virtual_region.c
> +++ b/xen/common/virtual_region.c
> @@ -15,8 +15,19 @@ extern const struct bug_frame
>      __start_bug_frames_2[], __stop_bug_frames_2[],
>      __start_bug_frames_3[], __stop_bug_frames_3[];
>  
> +/*
> + * For the built-in regions, the double linked list can be constructed at
> + * build time.  Forward-declare the elements.
> + */
> +static struct list_head virtual_region_list;
> +static struct virtual_region core, core_init;
> +
>  static struct virtual_region core = {
> -    .list = LIST_HEAD_INIT(core.list),
> +    .list = {
> +        .next = &core_init.list,
> +        .prev = &virtual_region_list,
> +    },
> +
>      .text_start = _stext,
>      .text_end = _etext,
>      .rodata_start = _srodata,
> @@ -32,7 +43,11 @@ static struct virtual_region core = {
>  
>  /* Becomes irrelevant when __init sections are cleared. */
>  static struct virtual_region core_init __initdata = {
> -    .list = LIST_HEAD_INIT(core_init.list),
> +    .list = {
> +        .next = &virtual_region_list,
> +        .prev = &core.list,
> +    },
> +
>      .text_start = _sinittext,
>      .text_end = _einittext,
>  
> @@ -50,7 +65,10 @@ static struct virtual_region core_init __initdata = {
>   *
>   * All readers of virtual_region_list MUST use list_for_each_entry_rcu.
>   */
> -static LIST_HEAD(virtual_region_list);
> +static struct list_head virtual_region_list = {
> +    .next = &core.list,
> +    .prev = &core_init.list,
> +};

... there's no pre-cooked construct to avoid any open-coding at least
here.

To clarify up front: I'm willing to be convinced otherwise, and I therefore
might subsequently provide an ack. I'm also specifically not meaning this
to be treated as "pending objection"; if another maintainer provides an ack,
that's okay(ish) with me.

Jan

