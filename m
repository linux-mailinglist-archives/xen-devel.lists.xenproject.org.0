Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626E7C69BCF
	for <lists+xen-devel@lfdr.de>; Tue, 18 Nov 2025 14:56:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1164840.1491707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLMBe-0005VU-4C; Tue, 18 Nov 2025 13:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1164840.1491707; Tue, 18 Nov 2025 13:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLMBe-0005Tr-1M; Tue, 18 Nov 2025 13:56:02 +0000
Received: by outflank-mailman (input) for mailman id 1164840;
 Tue, 18 Nov 2025 13:56:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=maYy=52=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vLMBc-0005Th-0I
 for xen-devel@lists.xenproject.org; Tue, 18 Nov 2025 13:56:00 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f4d7650-c486-11f0-9d18-b5c5bf9af7f9;
 Tue, 18 Nov 2025 14:55:58 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-640a503fbe8so9588845a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Nov 2025 05:55:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6433a2d746bsm12693461a12.0.2025.11.18.05.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 05:55:57 -0800 (PST)
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
X-Inumbo-ID: 4f4d7650-c486-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763474158; x=1764078958; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yXMmHKHF04iuPJ2Eitam8swpXNzENN911QwFNRlzvDI=;
        b=PGbqVuBLEnS1k+DE2aHh4RE4M+GfvKkalNZgrWLdZJMMz7Jz3iv2Ix7sNJ9z3eXvKg
         neW+2AExgV1oiWFtE+ts7ZndL7EG6rQUw2TdheoJQm3f/DP2a3i4hY8XqVe+iVi3NBty
         Ndsc7wqGR/52ZhC8WTMkLok70hz63Jg9eVJfnklkZ2+YfNnBtk5ES8lTf8fXSHz/YWtE
         D9a+WnWgAAcHydNHZz5p/hSJIwWYLlh3M5j4dr82ggy5X3lp0Gkv5WGDR2VKGew0sxjU
         kOXrWm82j72dltHqLCgGbXZQGc6o+P5tFTe3hd7qJKd3pdPUUAe0x9Db5Z4ndlLN2+tN
         ugeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474158; x=1764078958;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXMmHKHF04iuPJ2Eitam8swpXNzENN911QwFNRlzvDI=;
        b=lHiFtUXynwaqkXC3YYZYZLG/iLg8arRNTz95LCsrxonT5742zeIhNxRVfTdP3qz/GN
         fZ18ZWPvgGPJxzNELKoFbzzEiHqvwAjMFpzvVldNbG71Dk+vsb2BH+JKWo5G0JonYmyN
         dGQ09BziE+tImVfQ29MXKmZK3IyLjibPVgseAht2Nxs7ou2pEwFlo6V8mA/2E0HJdfn8
         jGMcJjOKP3lwzrfa37bMcQpY1n1tTc8TBaAeVC23+hpnxwFFF4EoCDUg+6Z7ql3iiptz
         65C0U7K9JKl55X05JCAbVOzIy1twbl0JrXkGsKutfwpPflwVYuPBRNYr2X5FodsOGPBo
         U4qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVextTHVY+dyd1OhcJgssqlHD6PqqDJeUZx19cVbuAzFh7yRftPk5EjlcDJIm9OurXi0VFV8AuvJ20=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx/3K+BLI1Vhw0kHvgRLzRcJOfR6csnpMLjZE065qNwUUlkWpfk
	iMC+do7uN9sHUOvWu2iUDRILAnmOEflKOLW/P4XrNBXsz90F8KT6ZjCoTLf1qBODIQ==
X-Gm-Gg: ASbGncst1BG77e7oamf1KgQxUnSB9QrS7xy44IJDF7Rv8dtFMP6XsdtbuRbOzTskeBn
	u1eKMItIIY8PbMJrTdRVg83xYbxfKOiHEuXvfsuUE0ZYLGLivDWnScbfwfmadPU9yULkz30jVN4
	SJTttaeVPaX9+IAYzbz2054/t7PKjGfhgUPmNieYVvDRkCZcqbmCvwf4K06rNDUHu2VCmCFPCbn
	n1fg3BW2+Ck5ZrFJ3mGxuoLFA1wAnZwNWZUHV+1dlYJVgUN+VQ842CSnBMAZFBM7xbSmZLorox1
	Wp5tp7ZwGsGtbLFHbJWRMqbwodlk6BrKlPoEm7/8bbVReYl11QEeBJvDvITSpWw6ZsgDlcIa2Uk
	o+IrOsvq1B1A7hG11uDobMtXc/wikPV2nC6KxZbW1Xmk79dAZyciOiIGSwVcFlWRgUvXamEPYeg
	72r1hyMrGADc8dtqey0rAW2uBJMyedvfEJh3cB6urfuV4P3y6TSiADFA6eo1ck8/9B
X-Google-Smtp-Source: AGHT+IEzId7fsXdsLrZWFFDDflKL+QBZhfp2aK5mIZNmuoUZsQvHScYF1kq0vv20sXDtNErbZ3zuKw==
X-Received: by 2002:a05:6402:1455:b0:640:b247:fede with SMTP id 4fb4d7f45d1cf-64350eaf223mr14404820a12.29.1763474157893;
        Tue, 18 Nov 2025 05:55:57 -0800 (PST)
Message-ID: <5e9ff734-6186-4635-8d06-884d97271a05@suse.com>
Date: Tue, 18 Nov 2025 14:55:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] xen/vpci: introduce has_vpci_bridge
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1763462211.git.mykyta_poturai@epam.com>
 <207b6aef763d12426385efb925beeebbbb56f6b3.1763462211.git.mykyta_poturai@epam.com>
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
In-Reply-To: <207b6aef763d12426385efb925beeebbbb56f6b3.1763462211.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.11.2025 14:36, Mykyta Poturai wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> With Dom0 now being able to use a virtual bridge we need a way to
> distinguish Dom0 using HW bridghe from Dom0 using virtual bridge.
> Introduce a new macro has_vpci_bridge that would determine if a domain
> should be treated as using HW bridge (only Dom0 with pci-scan disabled)
> or as using a virtual one (all DomUs and Dom0 with pci-scan enabled)

Where does the connection of "pci-scan {en,dis}abled" with "kind of bridges
in use" come from? There is a connection for what you're trying to achieve
right now, but this doesn't want setting in stone now, to avoid making it
harder to decouple the two again later.

> --- a/xen/drivers/vpci/header.c
> +++ b/xen/drivers/vpci/header.c
> @@ -230,7 +230,7 @@ bool vpci_process_pending(struct vcpu *v)
>  
>              read_unlock(&v->domain->pci_lock);
>  
> -            if ( !is_hardware_domain(v->domain) )
> +            if ( has_vpci_bridge(v->domain) )
>                  domain_crash(v->domain);

At this example (applies more or less similarly elsewhere as well, and needs
answering separately for every instance), and effectively re-iterating a
point made previously: Why is it the kind of bridges that are used which
determines whether to call domain_crash() here?

Jan

