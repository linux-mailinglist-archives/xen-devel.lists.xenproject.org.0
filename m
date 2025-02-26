Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE07A460CD
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:26:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896611.1305359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHQv-0004x6-6g; Wed, 26 Feb 2025 13:26:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896611.1305359; Wed, 26 Feb 2025 13:26:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHQv-0004vs-3O; Wed, 26 Feb 2025 13:26:41 +0000
Received: by outflank-mailman (input) for mailman id 896611;
 Wed, 26 Feb 2025 13:26:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnHQt-0004vm-Ek
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:26:39 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ebeb4e5-f445-11ef-9aae-95dc52dad729;
 Wed, 26 Feb 2025 14:26:38 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-390dd3403fdso389396f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:26:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd866ed2sm5640091f8f.16.2025.02.26.05.26.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:26:37 -0800 (PST)
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
X-Inumbo-ID: 4ebeb4e5-f445-11ef-9aae-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740576398; x=1741181198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W1SKnBAg5fbO0+VjyQE0cwaQfiGKVnzMTQwtr4cx7w8=;
        b=QZtl+SBqbbxnV1AC4DSohvPnlwPcXcRrxEZOZF2V+jrWNnYOTLKiqjIaWhAu9RLzQ6
         S4kYaAdP7wMtKfLkP7gElJACMdp6ekJLkuBKvTZcPAhqo02jvBBzN1DBewXfIQeebJ+f
         aMlozWGLHPQLG1cz2Dgy9xxeGU5TA800uVyNfSifBCxDfcIqiw5VZsMv5U7DmhSthZRt
         Qy8wmJXBud5y8LOcQXYDuWr3I00cI1n87TFpOm2/DoTw9uK9hyR1UwETkMrgY+l1DebW
         BlVrCzUt9qCr/jdIVpQazvsYKeV9oC1Wzjmpr7xPabq8hvUkv3KqQupgQ1N437GN97FQ
         HU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740576398; x=1741181198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W1SKnBAg5fbO0+VjyQE0cwaQfiGKVnzMTQwtr4cx7w8=;
        b=CWUU1TCZqJLpZj1pNvfkh2FUpVXUCfbin54HkHKsqtHH4xhYCpfRlj/vETNvM8fH4P
         J7WFrFFfJga3L9e1PuqZCng1Xg0duwTP/sqCYYg0vsz9gzAxRYUZG5L6E8LhZQey+hys
         tWlWKyFJ0A3tLW1NOZbivXAxK9n94UDF4XjkoVLKcy6q5gVwAEsiE8vJrXuD/pGF5mUo
         yOxAConASEMfyI6qcsKPzsSx8pG8rMhZ1BFGgOpHxIRWP2y2UQzlHlnqEdC/ywLPU7S3
         IBOvxoikxgRF8Dev+ivnuODt4sxmgOJDt3i5Its13WW1Hdq+8G0ZcjuJgTPeyJgMAr0y
         T8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCU27ly7Zl8Dgc7Vm9+pqJsK9uTFlOofymDZexTZRaT3xnPjewR/hDe2/spqMAm3XCEKQQCqouWRxfM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyywAojameUsdCyfVcOjfi59QbbIsIkFlfz4xaWLcIo7DuK+DNo
	ggUbHG7QJaCVB6jvoBla2lNdaFuyq01/e5IphZG10dbBggEocVpvYeNxJlKq/w==
X-Gm-Gg: ASbGncu/Kk84/MEoZa5Mtyvgt6Oms8OuSkN3ngB5rNiVRkfeg+VMTsLv9ASmk7YuGMT
	LWkUltKYcPSSn1r7R+Y4x015OBaO1fs/WAgDrk0uLBVUOCAf0+qxjvKeW26VgnUBQpCGzR0ow6o
	TY16hAyybCgux3E7Bf/yMbUUiz4YeKuPyDHu/XrFyNz1y5/AtZCE/ANmJseExfOsiO2OSdrSCv0
	Ilr0mw13N8YPvLHTCUUqYTPl9v1wG1CQh9Axce3lLH5N1rBbk5cSR6uYn9h6MZt1LWz7fXKZPWt
	pzWYscklOKI1OWNQgioJqgRNcuV40czU8gZqglwPTQ1Nz1K/eWj8HMgztviTevHP8clgtOPvCiN
	p+Qiru7gAu00=
X-Google-Smtp-Source: AGHT+IFT80Lf3S0e1C3cIK7giq+qLAg0zeru1xmksiRIVvbqA/a3FS90aitQmvUTk4ITWNHFmp+xxQ==
X-Received: by 2002:a5d:5304:0:b0:38f:2173:b7b7 with SMTP id ffacd0b85a97d-390d4f3cb49mr2301499f8f.18.1740576397809;
        Wed, 26 Feb 2025 05:26:37 -0800 (PST)
Message-ID: <396e663d-b8f1-42a5-acec-78ba78c0b67a@suse.com>
Date: Wed, 26 Feb 2025 14:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] xen/mm: Introduce per-arch pte_attr_t type for PTE
 flags
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <1d0826e88e95357979d74fb3702b35fdb0b75151.1739488487.git.sanastasio@raptorengineering.com>
 <ca31107923a8794f8752e65b5c3ad14bd2f326cf.1739488487.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <ca31107923a8794f8752e65b5c3ad14bd2f326cf.1739488487.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2025 21:10, Shawn Anastasio wrote:
> --- a/xen/include/xen/mm.h
> +++ b/xen/include/xen/mm.h
> @@ -69,6 +69,7 @@
>  #include <xen/spinlock.h>
>  #include <xen/perfc.h>
>  #include <public/memory.h>
> +#include <asm/mm-types.h>
> 
>  struct page_info;
> 
> @@ -113,9 +114,9 @@ int map_pages_to_xen(
>      unsigned long virt,
>      mfn_t mfn,
>      unsigned long nr_mfns,
> -    unsigned int flags);
> +    pte_attr_t flags);
>  /* Alter the permissions of a range of Xen virtual address space. */
> -int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf);
> +int modify_xen_mappings(unsigned long s, unsigned long e, pte_attr_t nf);

These declaration adjustments need to be carried through to all definitions,
not just PPC's. Without doing so there'll be new Misra violations (requiring
that declaration and definition agree not just in effective types, but also
in spelling), just like ...

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -8,8 +8,10 @@
>  #ifndef __XEN_VMAP_H__
>  #define __XEN_VMAP_H__
> 
> +#include <xen/mm.h>
>  #include <xen/mm-frame.h>
>  #include <xen/page-size.h>
> +#include <asm/mm-types.h>
> 
>  /* Identifiers for the linear ranges tracked by vmap */
>  enum vmap_region {
> @@ -57,7 +59,7 @@ void vm_init_type(enum vmap_region type, void *start, void *end);
>   * @return Pointer to the mapped area on success; NULL otherwise.
>   */
>  void *__vmap(const mfn_t *mfn, unsigned int granularity, unsigned int nr,
> -             unsigned int align, unsigned int flags, enum vmap_region type);
> +             unsigned int align, pte_attr_t flags, enum vmap_region type);

... you already do for __vmap().

Jan

