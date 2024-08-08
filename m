Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB33994BE85
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 15:29:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.774125.1184618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Cj-0006bA-FJ; Thu, 08 Aug 2024 13:29:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 774125.1184618; Thu, 08 Aug 2024 13:29:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc3Cj-0006Yv-Ap; Thu, 08 Aug 2024 13:29:21 +0000
Received: by outflank-mailman (input) for mailman id 774125;
 Thu, 08 Aug 2024 13:29:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc3Ci-0006Yp-5D
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 13:29:20 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 368055b2-558a-11ef-8776-851b0ebba9a2;
 Thu, 08 Aug 2024 15:29:18 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-52efd08e6d9so1189284e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 06:29:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7de4e7f336sm609405266b.131.2024.08.08.06.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 06:29:16 -0700 (PDT)
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
X-Inumbo-ID: 368055b2-558a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723123757; x=1723728557; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HlAgrS6XdkKBhn/O0Oh1VoxKIe8ryyMfJFqLOqG0LXU=;
        b=bV77sNeP+S/DclyBqhVXKfhX+IeZUJcQVfBBbEM+DGE2EyRCJBkNEztw5hoZqHu3Mf
         MpKCCxh8TTCsyAk/csOY/9q43EJdrizF+iT+wllhyLl+8f16V/1H1/WmnRy3fBgUK8rz
         UCryUgyY9iR4oWXzTT/swEcU77mhrtSNCHLq3K4tnI1xpVTjJQ+f6hfvWA5AX25cyHI8
         eL4ZAB/Sy2WLCmxoyr27TLsXCitM/DZpgQu75Klwo2NTbVRC2TaKwFWO6tMNbCiCg6FA
         HjqXanzz+6LSGHIOCi6/tYNJ91rDqM0eJ9TEPcDlbp/Y7g9CXZecaf4/8FoFI4OsuwQ2
         Qyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723123757; x=1723728557;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlAgrS6XdkKBhn/O0Oh1VoxKIe8ryyMfJFqLOqG0LXU=;
        b=ZdGWTDvPdrqZbN7Fvoc2aYqWrPbO7KscwB2+/ir4zD/BCnuzdjiJlwlTTdhh/P5Kgh
         +owETtDmDK+y6OVq2eIrgQqmJfUfgzeR91pFPMRIEx9hIP1xrkP1KK98m91IN1tD7HCb
         fgGsMkuygoxclQmfdyeSYLfPYZzGK1T97qEFayxLCD9tuzCCwOfmeQro1D7XuS3xXiek
         bKKhjNXeczIr7M2vm5OxZYpiDJirolklPzfVKntp6vY6IdpHgqjvGRjq2PmOpvgElfEj
         gzFZgqwZixO8S7jt97JJNFCtGPinZ7mjak/bEwGg1qnuYwBht72gr/0baMWjgTphv/9r
         GDHA==
X-Gm-Message-State: AOJu0Yy4fWXrBaBDcxTM2RbhEmJCfeuCFYwYy76sb5pvX6n+6a2koTCK
	weexeX+olFAIdqWOr1EnIkUQ3AAWWknkULylSJ+i/WNel0j+6acRB/wRpykvPA==
X-Google-Smtp-Source: AGHT+IGA12STyTFuj7v6wsPygh6br1wB6Ny2tmHCWM6nFYbC3E5UpPFpICrnw6JsB07ZzLPF3DHwmw==
X-Received: by 2002:a05:6512:400c:b0:52e:9b74:120 with SMTP id 2adb3069b0e04-530e5829a5fmr1308543e87.19.1723123757227;
        Thu, 08 Aug 2024 06:29:17 -0700 (PDT)
Message-ID: <3779cadd-7d86-4c30-b73b-ef5a9e00f03f@suse.com>
Date: Thu, 8 Aug 2024 15:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Assertion failed at arch/x86/genapic/x2apic.c:38 on S3 resume
 nested in KVM on AMD
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <Zp--KHAFuDVnH1Oq@mail-itl>
 <579fd84d-0a31-43b3-8ce1-f826134cd8a2@suse.com> <ZrTF_28uPHjPabn2@mail-itl>
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
In-Reply-To: <ZrTF_28uPHjPabn2@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2024 15:19, Marek Marczykowski-Górecki wrote:
> On Thu, Aug 08, 2024 at 01:22:30PM +0200, Jan Beulich wrote:
>> x86/x2APIC: correct cluster tracking upon CPUs going down for S3
>>
>> Downing CPUs for S3 is somewhat special: Since we can expect the system
>> to come back up in exactly the same hardware configuration, per-CPU data
>> for the secondary CPUs isn't de-allocated (and then cleared upon re-
>> allocation when the CPUs are being brought back up). Therefore the
>> cluster_cpus per-CPU pointer will retain its value for all CPUs other
>> than the final one in a cluster (i.e. in particular for all CPUs in the
>> same cluster as CPU0). That, however, is in conflict with the assertion
>> early in init_apic_ldr_x2apic_cluster().
>>
>> Note that the issue is avoided on Intel hardware, where we park CPUs
>> instead of bringing them down.
> 
> I wonder why I don't hit this issue on baremetal AMD, only on nested.

Different clustering arrangements?

> Anyway,
> 
> Tested-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Great, thanks.

Jan

