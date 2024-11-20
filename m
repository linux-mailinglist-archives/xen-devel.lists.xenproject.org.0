Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD43B9D3898
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 11:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841012.1256527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDiBv-0001YC-0r; Wed, 20 Nov 2024 10:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841012.1256527; Wed, 20 Nov 2024 10:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDiBu-0001WA-UR; Wed, 20 Nov 2024 10:44:10 +0000
Received: by outflank-mailman (input) for mailman id 841012;
 Wed, 20 Nov 2024 10:44:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Fky=SP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tDiBt-0001W4-5G
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 10:44:09 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cfca258-a72c-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 11:44:05 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso2373790e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Nov 2024 02:44:05 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b45d178esm14542145e9.8.2024.11.20.02.44.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2024 02:44:04 -0800 (PST)
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
X-Inumbo-ID: 5cfca258-a72c-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjVjZmNhMjU4LWE3MmMtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMDk5NDQ1LjM0NTk1Niwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732099445; x=1732704245; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AVb9RqPJ6u+aeso1HssXLb7aeoNWaj+KGHtJlU0nEpc=;
        b=AojjPxjpUmab8eQFjkDvlBlAot7fF7Mum/vYD8MMWWxelSgPBBLJsfdovXPF1+XmLL
         jm7Z7prIOSvvR9rFlsj95NT6YkmFMr5RMqkp1bD5YixMc58J+Vk9QM2CA+7EMD6BGB6t
         rfXd6dV9LBJho67duqqaOE0hOelviskB1cAJBDA4C3mHpajb3gnBYQwIorOtJBlSJ1i4
         HkNFxEQ4wkXfH1sOVU0QWEqTxO6DUc6AZ+28n8Glofbic1VW8mHmsoSTm2G+Pcjtfvvh
         ERsoDEUoxc+0KESmDLS4RFw0fiSM8Qxfd3Wz5fyRcdD+c30EEqbfPg8/10+5M/nFxBdl
         Lb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732099445; x=1732704245;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AVb9RqPJ6u+aeso1HssXLb7aeoNWaj+KGHtJlU0nEpc=;
        b=kCzfT0JNAtU/UXeHOWAD1vMelmH62JKjH/iKpLoAi1OpPhbMQk9BwtdnhwXwgkagcz
         GBr80pYbujQXnIpWFVz4XPww7HPFztX6CGrFMNSgLoqLvXBRxtdxkAj1FGrRue/B32W6
         PIrqkS8ZvVk0lU1qfkl8azB3zRwGGfrIuTQ1K9xpMI6qqFBB0eQKaKbbD+TorUZOqXzl
         wSt+EKIlzZ2HB484FZVEoqrhPjZK9wuTHoD6JIEVAjBTfMkBr8hN/hNE33TT0hC7TT6/
         PsFQmAA3zn5vWJ1e9S3z00lza6lf/kGIpMkGB40fkfqQND5s7yEAJGMbXdp5PVOrsAGd
         ezrg==
X-Forwarded-Encrypted: i=1; AJvYcCVkrcdOjDDKhl4QEmSALcEOrvAdvb1Th3jRryixr136KtsHfs8EqSj69scrE4OcWFZH+qH4+/ghIwI=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+13AGLo7vHFcySFiydMri63lsUwLhEDVnSN3QqqgRxVP4Pjb2
	IMf6sr9NTUxTu6/bFUJTNDdT5+/G4iQdeWrcSmuNCI+90JmTDVtfcZrowfcaZjFbJ0M7q9ataaA
	=
X-Google-Smtp-Source: AGHT+IEaq0iW3IZGrLgPpx0+AMedGpJ/Ax0lOFS2wMOi973frHxR/pIDQmnNeEhIkXp3EN01YGuLZA==
X-Received: by 2002:a05:6512:3d8f:b0:53d:ab15:1aee with SMTP id 2adb3069b0e04-53dc136dc37mr915879e87.49.1732099444582;
        Wed, 20 Nov 2024 02:44:04 -0800 (PST)
Message-ID: <7ffe1d78-188b-495b-914a-663181d9faa8@suse.com>
Date: Wed, 20 Nov 2024 11:44:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Load microcode much earlier on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241119215708.2890691-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241119215708.2890691-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.11.2024 22:57, Andrew Cooper wrote:
> Following commit cd7cc5320bb2 ("x86/boot: add start and size fields to struct
> boot_module"), bootstrap_map*() works as soon as boot_info is populated.

I'm struggling with following where this connection is coming from. Before
Daniel's work (e.g. in 4.19) we have

    if ( pvh_boot )
    {
        ASSERT(mbi_p == 0);
        pvh_init(&mbi, &mod);
    }
    else
    {
        mbi = __va(mbi_p);
        mod = __va(mbi->mods_addr);
    }

Leaving aside the issue with the PVH side, what would have stood in the way
of accessing any of the modules (e.g. ucode) right afterwards?

The question is also relevant when considering the potential need for
backporting this functionality (even if not directly this change, as the
dependency on Daniel's work would then need stripping off): There might
conceivably be a point where for security needs way may need to have this
as early as you now put it.

> Resolve the todo, and move microcode loading to be the eariest action after
> establishing a console.

So yes, this is merely strengthening a dependency we already have:
bootstrap_map_addr() arranging to avoid allocating any page table memory.
Yet don't we rather need to move away from this? We don't know what's in
the excess space we map, and hence we better wouldn't have any (cachable)
mappings thereof.

Jan

