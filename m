Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5E9CF43CE
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 15:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195452.1513391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclv1-0004Bn-K0; Mon, 05 Jan 2026 14:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195452.1513391; Mon, 05 Jan 2026 14:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vclv1-00048g-Gs; Mon, 05 Jan 2026 14:50:51 +0000
Received: by outflank-mailman (input) for mailman id 1195452;
 Mon, 05 Jan 2026 14:50:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vclv0-00048a-4m
 for xen-devel@lists.xen.org; Mon, 05 Jan 2026 14:50:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebb183f3-ea45-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 15:50:47 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso126838635e9.2
 for <xen-devel@lists.xen.org>; Mon, 05 Jan 2026 06:50:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d452a3bsm153988995e9.11.2026.01.05.06.50.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 06:50:46 -0800 (PST)
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
X-Inumbo-ID: ebb183f3-ea45-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767624647; x=1768229447; darn=lists.xen.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AkszFi0SMt9EIcyN2EucawmenV3NU2J1E6gDS8B9vxY=;
        b=EqJB2ojlamIHBy+e8zziskz8Yj4stLjOIiDZodipKq62jB367Ql/3fdjm+EjngD5BY
         TbM+XCiAF2o+aH8lMnmpEAqAZCRPF2b1ILCyqRd+Ezh4LSQ4+YtTImLBbTNsRMJ8L7A4
         Djj2zzgY20Q+aXL98SrvPMXyi/mNMOfxDbutRIJx8169uF2DbaY1VMRUbzizTj4ofMBk
         J7I/kT6qUBhj6XcjE5I3D345crxAAQO5ZixdgKE3VT2gGs/PNy3y4ciPBDOLuTR89gVM
         kBVrC2/SqL4h+zy623iS821zoHwymUowv+3ZYiwUrk9hILwmOMfkvAUKDaF8SAMg8WS2
         P+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624647; x=1768229447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkszFi0SMt9EIcyN2EucawmenV3NU2J1E6gDS8B9vxY=;
        b=Q8g4FUP9Kmsi04aJw0CsN1iykGiR4Cgpana98ddYJkk9cSbLwBfXt5GhXio5qut+bD
         4Y8kkNEwGK/FPfYjnJfSxgqSVCpbxBRuXUuCKjPP6c77Qk8pC5U98TdSkX0+kaduC+dn
         yK9uJbD/Mbocngpw0HV7borv00LzYiyxZcgLrgZNMVB9LOPVunnbOjZTWOzQhU1fcqml
         IC9VQFe7KTUwgVyrx8Q0SHWCbMZYC4vng156ACVKL2VG5OLFC2QvnOXvnAnIbnW+uxOX
         wv2acCyQlVU+uTgPW5wy26St/2LL6KPI7sCZck6qx90eze4sL+r3yt4mxjE82Bnfx05q
         P0YQ==
X-Gm-Message-State: AOJu0YxcHbW3NQJ88/gtYoE5ylZBuEcGEoUCz5ayV8+rhFhjrKYiFvEK
	WciyJ56VA33UTqXdV05lWXESf6sIKGQYYaUW1mOAuH43HzbpTkNNXDnNiWakEsyDww==
X-Gm-Gg: AY/fxX5CJqi5vSoxYInFJHYkmMYyx2C9LLQf6zqd8MRFoMj3T+45HKtmja4+Cgk9l3O
	po7H0RhGjM4jCuEo09AsD5L1TV3GpejNkIizVvk9ZOjLmiyfXhMn7JIOytiZpTSJUjUedlxB8AP
	0YgTTFr6IJK/Xupbc8MeHuOcfIQnSZsPfoRhslmqH7Qk3IxPkoqcbV42gISh4LVvq+NvW89b+/y
	azPrLGp+ibPijjEo+J1hfOqVovHK+xg1sXV5voN+GvKuwQ460rLXCvJw72vSLSR1JfEhVR4LCTA
	bz2/e+BCZIURO6BFcXvpq9KSZQjillzlKA6ywRopulDXV2tdBjptnf229PSPCbBRQ37DewU6P/M
	AkXMIfs3ZdfiOk+LfziYaop/+xzaRrmH+utGBaAaoCHnAeSShnB++H4qxdOMBSHa6B+CGN7FQCX
	MKaKiBxOIJk6sdzZYahebA5hMho0A+oLqYjoPiOTVw1amORuBSE93rniCPddhpfFBezepH8WTfv
	3I=
X-Google-Smtp-Source: AGHT+IFWOXrKpXO0AzGK4GY5IibfyG3pyDn9QAJKNg5ULkz0pnXCQB/TlOLggKIq4M7ml8ZJJVFvtw==
X-Received: by 2002:a05:600c:4686:b0:47a:80f8:82ac with SMTP id 5b1f17b1804b1-47d195a08c8mr661239935e9.26.1767624647094;
        Mon, 05 Jan 2026 06:50:47 -0800 (PST)
Message-ID: <4f49c839-39c1-4562-87b7-69ee9d8b6aef@suse.com>
Date: Mon, 5 Jan 2026 15:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] Potential Integer Underflow in Time Calibration Logic and
 Live Snapshot Revert causing DWM crashes in Windows Guests
To: =?UTF-8?B?0JDQvdGC0L7QvSDQnNCw0YDQutC+0LI=?= <akmarkov45@gmail.com>
References: <3ef6bcd6-2936-46f8-a7d0-54cd965a6861@gmail.com>
Content-Language: en-US
Cc: xen-devel@lists.xen.org
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
In-Reply-To: <3ef6bcd6-2936-46f8-a7d0-54cd965a6861@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.01.2026 18:29, Антон Марков wrote:
> Component: Xen Hypervisor (x86 / time.c)
> Versions affected: Potential in 4.17-4.21 and unstable (tested on 4.18 
> with high vCPU density)
> Description:
> In high-load scenarios (24+ cores, heavy Dom0 load, and frequent VM 
> pauses via DRAKVUF/VMI), Windows guests experience Desktop Window 
> Manager (DWM.exe) crashes with error 0x8898009b.
> The root cause is an integer memory overflow in the time scaling logic, 
> in case if the time calibration occurs simultaneously with a snapshot 
> reversion or RDTSC(P) instruction emulation.
> Technical Analysis:
> The get_s_time_fixed function in (xen/arch/x86/time.c) accepts at_tsc as 
> an argument. If it is less than local_tsc, a negative delta will be 
> produced, which will be incorrectly handled in scale_delta (Or, if 
> at_tsc is zero, a race condition may occur after receiving ticks via 
> rdtsc_ordered, time calibration will occur, and local_tsc may become 
> larger than the tick values). This will result in an extremely large 
> number instead of a backward offset. This is guaranteed to be 
> reproducible in hvm_load_cpu_ctxt (xen/arch/x86/hvm/hvm.c), as sync_tsc 
> will be less than local_tsc after time calibration.

Indeed, this will need fixing.

> This can also 
> potentially occur during RDTSC(P) emulation simultaneously with 
> time_calibration_rendezvous_tail (xen/arch/x86/time.c).
> Windows DWM, sensitive to QueryPerformanceCounter jumps, fails 
> catastrophically when it receives an essentially infinite timestamp delta.
> 
> Steps to Reproduce:
> 
>        Setup a host with a high core count (e.g., 24+ cores).
> 
>        Run a high density of Windows 10 DomUs (20 domains with 4 vcpus 
> each).
> 
>        Apply heavy load on Dom0 (e.g., DRAKVUF monitoring).
> 
>        Frequently pause/resume or revert snapshots of the DomUs.
> 
>        Observe dwm.exe crashes in Guests with 
> MILERR_QPC_TIME_WENT_BACKWARD (0x8898009b).
> 
> Currently, the lack of sign-awareness in the delta scaling path allows a 
> nanosecond-scale race condition to turn into a multi-millennium time jump.

Just to mention: I think scale_delta() was never intended to be called
with negative delta values. Hence my plan is to deal with those call sites
which may encounter negative deltas. I hope to get to this tomorrow.

Thanks for the report, Jan

