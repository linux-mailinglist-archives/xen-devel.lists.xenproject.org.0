Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5236797372D
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 14:26:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795488.1204863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzx5-0007UL-Sd; Tue, 10 Sep 2024 12:26:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795488.1204863; Tue, 10 Sep 2024 12:26:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snzx5-0007Rh-Q3; Tue, 10 Sep 2024 12:26:35 +0000
Received: by outflank-mailman (input) for mailman id 795488;
 Tue, 10 Sep 2024 12:26:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snzx4-0007Rb-RX
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 12:26:34 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9e91ed9-6f6f-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 14:26:32 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5365c512b00so813544e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 05:26:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd4693fsm4236803a12.37.2024.09.10.05.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 05:26:31 -0700 (PDT)
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
X-Inumbo-ID: e9e91ed9-6f6f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725971192; x=1726575992; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HLastlZm256bbCZQCjTY97zdqMvYpiAMsKAziBcVGN8=;
        b=HdjOGWBme3yhQu9Mbg5vIu35qDkoztEOdXY3rF13352KyhHZ0tyE+KegPgtJnEr8GA
         DjZAVYqroFDC6cqajt6zxj65PLRBhPWYwUddO/JnIBr8UhLaJlDkJIGARpAwdXoFWcWX
         br0hB2CaOyACa38kM3W4PTH3EbQIFBl/oZ5W6ySe68j3OzmKIV8t/1dNDD46xliyGQpB
         eR8ZkNO758fuILUSlzVk9S/Y/tvvZCMqrYifcoNiMlL4vLMoOJvDHNonckJGV8t2selh
         4XwytDji/19goYoySREyYSvv1jPGKKUndHWfGdcDw8vy73szWunDWjPJ6pU4J9gTKobz
         em2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971192; x=1726575992;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLastlZm256bbCZQCjTY97zdqMvYpiAMsKAziBcVGN8=;
        b=Bhl8f5VQvnlokiGvNNtvo6rJkSALewUG1v+060L8QrXUEgxF3Xu75HZq5MVyaH3PPX
         N9G4uYc+U6qPhrt/ZhgfTejPtrW+tf/LQAjnMjeleIufzGvd8WG9CIrghc7flQRtAOY6
         bNWjJueh2Gf7B4braxCK0FuNmu0HUeSTa5xGkr2TrZAGQCUdiWurprg6A/lcRy9VRu9v
         VmfiSDEl6Cqc1IM0vY15B853rqwqkggPepb2txFUIzZzoyszP6Otv9wimGk6Fk0Nrle+
         XbUy3fkcxY1IcUHiCKW36BcftOrA6nNCwUwpl+zsM6G/OVAJ4G5IP/b65ht7znRQmIO/
         8Fcw==
X-Forwarded-Encrypted: i=1; AJvYcCW3HqVU7nz5+V3cjOTwfRQdsjLAk4In9F+oUbLygSnBTwI+VpWbQaALSvZgzvaOj7KZ1+ZAz09ySi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzpBc8oqdpc0M98MDJ/u3Lg0Bp6EwvRkjV6yNf2zIt3zlgcOGah
	fZcY5ks78U8WEPDyoykbvKXxy0BK1v8wGJJG5rOVj3Cm1IXIGZuXLkRZIlvc4g==
X-Google-Smtp-Source: AGHT+IFhgTOQxyg9vMrWdF2h+zK+lg3d57CQp2VozcEuS2bWCk9BKBBNyPFX9q8dkzE1YxK8YIsyJg==
X-Received: by 2002:a05:6512:3502:b0:52c:df3d:4e9d with SMTP id 2adb3069b0e04-536587ef33bmr8995012e87.37.1725971192129;
        Tue, 10 Sep 2024 05:26:32 -0700 (PDT)
Message-ID: <0c4f3e87-b138-407b-a271-7f86fef255f6@suse.com>
Date: Tue, 10 Sep 2024 14:26:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] xen: add capability to remap non-RAM pages to
 different PFNs
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, x86@kernel.org
References: <20240910103932.7634-1-jgross@suse.com>
 <20240910103932.7634-6-jgross@suse.com>
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
In-Reply-To: <20240910103932.7634-6-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:39, Juergen Gross wrote:
> When running as a Xen PV dom0 it can happen that the kernel is being
> loaded to a guest physical address conflicting with the host memory
> map.
> 
> In order to be able to resolve this conflict, add the capability to
> remap non-RAM areas to different guest PFNs. A function to use this
> remapping information for other purposes than doing the remap will be
> added when needed.
> 
> As the number of conflicts should be rather low (currently only
> machines with max. 1 conflict are known), save the remap data in a
> small statically allocated array.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two cosmetic remarks:

> @@ -792,6 +793,70 @@ int clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
>  	return ret;
>  }
>  
> +/* Remapped non-RAM areas */
> +#define NR_NONRAM_REMAP 4
> +static struct nonram_remap {
> +	phys_addr_t maddr;
> +	phys_addr_t paddr;
> +	size_t size;
> +} xen_nonram_remap[NR_NONRAM_REMAP] __ro_after_init;
> +static unsigned int nr_nonram_remap __ro_after_init;

I take it this is the canonical placement of section attributes in the
kernel? (In Xen I'd ask for the attributes to be moved ahead of the
identifiers being declared.)

> +/*
> + * Do the real remapping of non-RAM regions as specified in the
> + * xen_nonram_remap[] array.
> + * In case of an error just crash the system.
> + */
> +void __init xen_do_remap_nonram(void)
> +{
> +	unsigned int i;
> +	unsigned int remapped = 0;
> +	const struct nonram_remap *remap = xen_nonram_remap;
> +	unsigned long pfn, mfn, end_pfn;
> +
> +	for (i = 0; i < nr_nonram_remap; i++) {
> +		end_pfn = PFN_UP(remap->paddr + remap->size);
> +		pfn = PFN_DOWN(remap->paddr);
> +		mfn = PFN_DOWN(remap->maddr);
> +		while (pfn < end_pfn) {
> +			if (!set_phys_to_machine(pfn, mfn)) {
> +				pr_err("Failed to set p2m mapping for pfn=%lx mfn=%lx\n",
> +				       pfn, mfn);
> +				BUG();

Wouldn't panic() get you both in one operation? Or do you expect the call
trace / register state to be of immediate relevance for analysis?

Jan

