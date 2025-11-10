Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC14CC47EBD
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 17:25:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158570.1486906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUhg-0004Th-8y; Mon, 10 Nov 2025 16:25:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158570.1486906; Mon, 10 Nov 2025 16:25:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIUhg-0004Re-6T; Mon, 10 Nov 2025 16:25:16 +0000
Received: by outflank-mailman (input) for mailman id 1158570;
 Mon, 10 Nov 2025 16:25:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vIUhf-0004RY-4K
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 16:25:15 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d614250f-be51-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 17:25:14 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-64162c04f90so3811189a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 10 Nov 2025 08:25:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6416001a4a8sm6815258a12.15.2025.11.10.08.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Nov 2025 08:25:13 -0800 (PST)
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
X-Inumbo-ID: d614250f-be51-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762791914; x=1763396714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VkfMhLjkH8+zTRoFSW8oQV/xNcY16zj+gjbST8LvTac=;
        b=Ea+bMyq+HpczUCfF2B7b8hMxxOneUcI4iU/gfPQGU8rmlOXJPYOTWS+gkkxMt++wsY
         d1JgKdW+wg2pnNexLexXMANceOPSzWblyElF1AaAkuGhWTNbDXBS/XSlpaGIt8XsU+H9
         ip/tonaoY5/g7MsmYsd8CpBfvsuAiD0g9KZ4IQCe1XFMZb51DsY63qRpA5WsMIclB2/D
         zj+E3RaxbIbpqEDVIrH1rXCKUmoeUnZBgGAB/s+HYDj3VzAU5zO/oarzr1BmZMjflPcm
         cSwwNc83H3vGlzRtQXk3tNxzpPN3yP+BReF8shLR5XkESq4580ACf1I0eugZKwBXf64o
         0zfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762791914; x=1763396714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkfMhLjkH8+zTRoFSW8oQV/xNcY16zj+gjbST8LvTac=;
        b=uM9A6lxMv3KAB5RcEgiTeiGHVffUh2S73Y7Osv7rkWCt50UPCKWkLNN43fhrGpM8FH
         mjlqed6SKCzAK+GAAmMeaQ1ccJ6tHutp/3fCTCGM7twOKP/6HwxsGwo+YmK99TEamrFs
         tZbANpcmYW6x38IzJuYEPEk8ZXBFWJlrRDLQYhqIr/2RyQDtVeMscqIIcrG3vdGFtUFf
         49OozuNhITuMTc7pGgEJ/ItbYtEgjvGiXz/Jbm3wRQOAW8mpMkcNasBMX8tgqRklIsPe
         H2N+yE1/fhpN8qkDq+2lpdR6unYcKnn+gov78qb1amXR8gwOUPBcJFYxfy7v1Amej2RK
         JUsg==
X-Forwarded-Encrypted: i=1; AJvYcCUhsKgJCD5q2U4hcJOYWexNo4VpAvY/SSp/JAiwkhARjnluKF5Ez38oMgKYEiQTWecEmPjQqj8HwEw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxLffcO6/+bQSe/Qy1e4rdvkYUUbFeu5UP1fK433W22+NuhovRX
	208qwVAhKCAkkPsO5aIjSwPlRD3y3+NlCo8Dx8tKyVTDbRScedxJieiJfgAU6VO2Ug==
X-Gm-Gg: ASbGncsf+KqxQrCIPzQ23UXI16CCiVoYYHGDEQ1qAQWW8m+p6dZMRMOK84a/vpxHe84
	F1QN74AeQ0n6PxDihxjwwqNSbkRy+ObWk3DFRg51ZCVZAVmSsxgH5nWaog8Mg0HXcKOUZvixT+U
	mu7EHGNCmzw1CO4I0nK6Wmvnhe+TES5gENkOlXKsMoZ2IjZs+PysXbAfpfCU/U7CD42hQFJtGeG
	GgXEjzK6VNQVuDGRJ98OXYX/qDFDAmEybZu7dosnHiubnbZZgf6tk3MrNy4VMYFiIkFlltqaMLo
	aGM2B9vQn8njZrskC5BNB+ZWkExnRLFIAmm9cqpAZrJz1hv34Lljtbv8FlNZdAHoemj/a8hHbEH
	Z89wUXHNNSHnx+cEmBOClT29/ju2SKQZM/VLIOVkgDOmd6sz56gBu36+W+6zQQssLEjI/t0oI+A
	jyzFrMHj7XP50XdUjhUlRLiZpQzOq+U0DsdzybFI3jtXLa0lf/vWz7UObJYzrXgDk3lQUFadcSb
	lM=
X-Google-Smtp-Source: AGHT+IGzYAym/8Kw0UG18mb8pzv4p/av00m7lWZ6faI9slAiC/Qxtvr8bnk0jvswVz/oci2u0/uFYg==
X-Received: by 2002:a05:6402:d0d:b0:641:8d6b:88cb with SMTP id 4fb4d7f45d1cf-6418d6b8affmr3196460a12.28.1762791913711;
        Mon, 10 Nov 2025 08:25:13 -0800 (PST)
Message-ID: <28920d5e-6672-41b5-8927-e24aedc7f694@suse.com>
Date: Mon, 10 Nov 2025 17:25:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for 4.22 v5 13/18] xen/riscv: implement p2m_next_level()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1760974017.git.oleksii.kurochko@gmail.com>
 <cfcec559252a365368d1ce19ea75ea41e8e8ee7b.1760974017.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <cfcec559252a365368d1ce19ea75ea41e8e8ee7b.1760974017.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 17:57, Oleksii Kurochko wrote:
> Implement the p2m_next_level() function, which enables traversal and dynamic
> allocation of intermediate levels (if necessary) in the RISC-V
> p2m (physical-to-machine) page table hierarchy.
> 
> To support this, the following helpers are introduced:
> - page_to_p2m_table(): Constructs non-leaf PTEs pointing to next-level page
>   tables with correct attributes.
> - p2m_alloc_page(): Allocates page table pages, supporting both hardware and
>   guest domains.
> - p2m_create_table(): Allocates and initializes a new page table page and
>   installs it into the hierarchy.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>
Just one further nit:

> @@ -490,6 +503,33 @@ static pte_t p2m_pte_from_mfn(mfn_t mfn, p2m_type_t t, bool is_table)
>      return e;
>  }
>  
> +/* Generate table entry with correct attributes. */
> +static pte_t page_to_p2m_table(const struct page_info *page)
> +{
> +    /*
> +     * p2m_invalid will be ignored inside p2m_pte_from_mfn() as is_table is
> +     * set to true and p2m_type_t shouldn't be applied for PTEs which
> +     * describe an intermidiate table.

intermediate

Jan

