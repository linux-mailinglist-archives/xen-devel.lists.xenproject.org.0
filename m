Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 245D98C555F
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 13:57:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721445.1124854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qmM-0004dI-Ll; Tue, 14 May 2024 11:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721445.1124854; Tue, 14 May 2024 11:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6qmM-0004bW-It; Tue, 14 May 2024 11:57:10 +0000
Received: by outflank-mailman (input) for mailman id 721445;
 Tue, 14 May 2024 11:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6qmK-0004bQ-UC
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 11:57:08 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1606b68c-11e9-11ef-b4bb-af5377834399;
 Tue, 14 May 2024 13:57:06 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59ae3efbb3so8664066b.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 04:57:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5733bea65edsm7490971a12.7.2024.05.14.04.57.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 04:57:06 -0700 (PDT)
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
X-Inumbo-ID: 1606b68c-11e9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715687826; x=1716292626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5t9oaiq0kcWuDwcVYP4BqAuLPAYeAqcFt76hLCI4xk=;
        b=O11loO6mwHj5obczyqrYCor9PmfiOEOYRfLRyZ1bo8UMQBOsFQ1Gx6STTpK/4DWpWP
         LNlCE+j+ItQj6SpD6ev4um3HQBKKOgTTqekY7wWydvkZC9kGxzLtQCr3UxsaaIngoecR
         4uLvbUn+PgzP1tOl61PO7WO6KTM1/PcpWJaCEIAO+2uPGDoFA76TA6S7gfVR/bHeYx+4
         K8s7QeeMAbAJnKoQnlcG7s1uDeDWljDeiRiinh/DTdcWaZC2vfmTF5gz4k2pOOrpV2zr
         i/rqbGwMw3TdxCp+gD6uZFLh9OQU0hERa6fHeptDvktdlmPgchBG9dCzoh5fNsm/wYb6
         4Z6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715687826; x=1716292626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P5t9oaiq0kcWuDwcVYP4BqAuLPAYeAqcFt76hLCI4xk=;
        b=MNGQJzslrERbw2iCXP4niiVBBp4ovEekSBGQRys7y3y3KB6Me03lfdwcSecxSey4Gy
         I5G/7G5Q/w1iskrKn2TxYtuvvITnTzC944b+Tq9q6d4rdP3jGAjgt1qf1sRzmUDcGiZY
         jt5uwCmQUitObJgyO+XxEDV23qKxwKQ5IhwOMXCdxPvTKg11zPW+0leSlACYkirxBuaD
         hoxmkbXN+gF6i2tAPf0/Mo2POEf/EcAqLDzqNaKtPv4968I5mM5iL/dLxzs3hMPd0jnh
         9GvGurst+kuMlDvNSQJSMHBOGQlQqzHOo89U2VFB9lEFBE8dGZoLoihbSPBdvjzsWmPy
         cxHA==
X-Forwarded-Encrypted: i=1; AJvYcCWEiGyQO9LvuNjhHFlYeRgq8Aq6UPvrL3LKfwH+UT9k8nyHMmIIS43dF6fsXKbdKk5C8pNVZDUnVANztXOtDDeLbpChWeV+t846b5LWB2A=
X-Gm-Message-State: AOJu0YxHXZ4XUknuKR6bNz9bG8FKaKhL65HiOd+yrBaauK48u+V+TXXR
	73b6GcCMRT2yR3QTsikOPqZhQBKEVk/qdqvaTcC0StlhrW02zum4NJzmCEzWgQ==
X-Google-Smtp-Source: AGHT+IFkuva0e2NmdrS9VMZl0F6D938sa4MPV3j8Nk5XFoxtVhDK/RLGuKssZo0k4x+7Bq0uX2qFnQ==
X-Received: by 2002:a50:ccc8:0:b0:572:795a:b913 with SMTP id 4fb4d7f45d1cf-5734d67fd75mr10041045a12.34.1715687826216;
        Tue, 14 May 2024 04:57:06 -0700 (PDT)
Message-ID: <435ccfc3-d4e3-4da4-838f-4fb0e8987eab@suse.com>
Date: Tue, 14 May 2024 13:57:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
References: <20240513085925.59324-1-roger.pau@citrix.com>
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
In-Reply-To: <20240513085925.59324-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 10:59, Roger Pau Monne wrote:
> --- a/xen/arch/x86/cpu/mtrr/main.c
> +++ b/xen/arch/x86/cpu/mtrr/main.c
> @@ -573,14 +573,15 @@ void mtrr_ap_init(void)
>  	if (!mtrr_if || hold_mtrr_updates_on_aps)
>  		return;
>  	/*
> -	 * Ideally we should hold mtrr_mutex here to avoid mtrr entries changed,
> -	 * but this routine will be called in cpu boot time, holding the lock
> -	 * breaks it. This routine is called in two cases: 1.very earily time
> -	 * of software resume, when there absolutely isn't mtrr entry changes;
> -	 * 2.cpu hotadd time. We let mtrr_add/del_page hold cpuhotplug lock to
> -	 * prevent mtrr entry changes
> +	 * hold_mtrr_updates_on_aps takes care of preventing unnecessary MTRR
> +	 * updates when batch starting the CPUs (see
> +	 * mtrr_aps_sync_{begin,end}()).
> +	 *
> +	 * Otherwise just apply the current system wide MTRR values to this AP.
> +	 * Note this doesn't require synchronization with the other CPUs, as
> +	 * there are strictly no modifications of the current MTRR values.
>  	 */
> -	set_mtrr(~0U, 0, 0, 0);
> +	mtrr_set_all();
>  }

While I agree with the change here, it doesn't go quite far enough. Originally
I meant to ask that, with this (supposedly) sole use of ~0U gone, you please
also drop the handling of that special case from set_mtrr(). But another
similar call exist in mtrr_aps_sync_end(). Yet while that's "fine" for the
boot case (watchdog being started only slightly later), it doesn't look to be
for the S3 resume one: The watchdog is re-enabled quite a bit earlier there.
I actually wonder whether mtrr_aps_sync_{begin,end}() wouldn't better
themselves invoke watchdog_{dis,en}able(), thus also making the boot case
explicitly safe, not just safe because of ordering.

Jan

