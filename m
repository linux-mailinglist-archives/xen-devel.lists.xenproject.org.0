Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3617498B4E7
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 08:52:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807744.1219370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWjZ-00012T-A6; Tue, 01 Oct 2024 06:51:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807744.1219370; Tue, 01 Oct 2024 06:51:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svWjZ-0000zK-7V; Tue, 01 Oct 2024 06:51:45 +0000
Received: by outflank-mailman (input) for mailman id 807744;
 Tue, 01 Oct 2024 06:51:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jjk+=Q5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1svWjX-0000zE-Jq
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2024 06:51:43 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9d977090-7fc1-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 08:51:42 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aa086b077so752785066b.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 23:51:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93c277723esm652918666b.7.2024.09.30.23.51.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 23:51:41 -0700 (PDT)
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
X-Inumbo-ID: 9d977090-7fc1-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727765502; x=1728370302; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8zGY+OJrdYmX0G9sEikgnWJLXAaxn5SiznBF4h7VZG4=;
        b=WWKFuN9ZufxlKwCvT2tvXkD1QBawc4kXm10JWYxUrtWkOe3yYX7AvDlDzqbCBrnyAx
         tCQu7lwzfI0jn+KTA10XUai8j7kZfYdNXHNexjt+jlmdzrbbShVJFHjqHgWvVFjlrPiK
         je9N9olGZCefgX9ACXnj/KxhffgxDPNRi25A9bbQ2p93oWSqDmPiLPTYooshFuMAZO2Z
         wroGBDwujEZI8m4tKH8JwsYvNzdeIKP7CRuPV5yaECBfKWn5Hmnx3NZcrzgXfly1OJl9
         T0EvMVtm6a21px7IU23AlGtbnm7FtL69cX2nPh+JINInBkpSr60YWCqFw16/dD9hDJNS
         jpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727765502; x=1728370302;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zGY+OJrdYmX0G9sEikgnWJLXAaxn5SiznBF4h7VZG4=;
        b=DTt4fHKEfPFpgJ8UG3PBdivMs/W1AnjHlG2oLf445XyZ8Ep4Vik2Tfwa2yYSU3i3gj
         ik3KxBDIf06/qj43Q4d814KgP6a5vEzhDP06mtLLwkHERmigJ4eUDpjhfYbr/ka1SSm9
         9MfEtzPAtchJ5hMV3Z5XMfLUhRAj1ShvAbwqtXy54zWXGVOp+agpsmDwBD8mbAQIFR06
         R5IbP5e5kcAekevweqtKOEzhskddRHODwYH6/BXIdRhbpHVA1J1nbo1+mSDLidGwNJOg
         AHgpP810mr87Gf+F+24fY5g8Ih0612u6LWAwe0m8KW4j7G3NdcX4JF1TFn3JbAvofRlX
         9Dig==
X-Forwarded-Encrypted: i=1; AJvYcCXoJJx7ZksmCbd/V3LMDxAVrZd1Fr77ozmi5dE4oMSye2vGLgVB3/W2EJkQnm/4LISWko6n4WkAVNA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQdu5D9BaH5yBAxGPAajxCnpAn87gvxyFgWRVfOSTLotbzy0ke
	VMa/e4Zfq7Jtpsa6QrvjKzRX1PyUrTIPNhZrL/o66yWFLy8O7jpzDp3Ium3T6w==
X-Google-Smtp-Source: AGHT+IE6MykuZp/13za5xckSxXeSQIN4HmiPcMGcWZ6OoDrJDNMjr1wls2EIzmhOTW7LbpSfZQVC5Q==
X-Received: by 2002:a17:907:9450:b0:a8a:8d81:97b2 with SMTP id a640c23a62f3a-a93c4946cebmr1495065566b.34.1727765501619;
        Mon, 30 Sep 2024 23:51:41 -0700 (PDT)
Message-ID: <60eb8a53-20b3-4b34-91f0-8d22332cf119@suse.com>
Date: Tue, 1 Oct 2024 08:51:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen: move per-cpu area management into common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <584dab4111041a660377f677cd829d4b2b4b8b2d.1727714022.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <584dab4111041a660377f677cd829d4b2b4b8b2d.1727714022.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.09.2024 18:39, Oleksii Kurochko wrote:
> Centralize per-cpu area management to reduce code duplication and
> enhance maintainability across architectures.
> 
> The per-cpu area management code, which is largely common among
> architectures, is moved to a shared implementation in
> xen/common/percpu.c. This change includes:
>  * Remove percpu.c from the X86 and Arm architectures.
>  * For x86, define INVALID_PERCPU_AREAS and PARK_OFFLINE_CPUS_VAR.
>  * Drop the declaration of __per_cpu_offset[] from stubs.c in
>    PPC and RISC-V to facilitate the build of the common per-cpu code.
> 
> No functional changes for x86.
> 
> For Arm add support of CPU_RESUME_FAILED, CPU_REMOVE and freeing of
> percpu in the case when system_state != SYS_STATE_suspend.
> 
> Move the asm-generic/percpu.h definitions to xen/percpu.h, except for
> __per_cpu_start[] and __per_cpu_data_end[], which are moved to
> common/percpu.c as they are only used in common/percpu.c.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



