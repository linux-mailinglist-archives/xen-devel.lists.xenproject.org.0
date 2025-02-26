Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B62BA4606C
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 14:12:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896567.1305308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHCD-00015D-0b; Wed, 26 Feb 2025 13:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896567.1305308; Wed, 26 Feb 2025 13:11:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnHCC-00012i-U9; Wed, 26 Feb 2025 13:11:28 +0000
Received: by outflank-mailman (input) for mailman id 896567;
 Wed, 26 Feb 2025 13:11:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnHCB-00012c-Cn
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 13:11:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2e900ce5-f443-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 14:11:25 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3911459f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 05:11:25 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fc1f9sm5420845f8f.88.2025.02.26.05.11.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 05:11:24 -0800 (PST)
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
X-Inumbo-ID: 2e900ce5-f443-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740575485; x=1741180285; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uzqk4o/9YPkyY62Ot6DQLVifHULUEJN97idJEjtKWEM=;
        b=dJdWSsF5WUsaNTiUcDAWRfCVfWUjahSnNYgSw6EAUtI4Msvfp1FRvOwStxJUVOKPaN
         1wyjE5RS8pzEeht0aJcviiNi8ZBcBwEFhlmhH1lkgWpSvgKnAmpNAqZeOz3WwJdM8Qdn
         vzrelcplMi7KJNJ89BFZC+L9pDySUqj8rVjDRmUtylsdzpJ1vLXZb1MRgWut9eQJQ+hX
         Pei7UtI6ZlxaiPpxsENHtB3gKzPt9jROPGSjjvJQ1Y8uCgsHvQpAZhITUJi95Cj0u3Uu
         wyBDaQ4Wutx0BSWC4RN69U+UPZyciS7SoJwZbh80OMptTtvvwPo+bn7a3eq/U7dENDUU
         xrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740575485; x=1741180285;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzqk4o/9YPkyY62Ot6DQLVifHULUEJN97idJEjtKWEM=;
        b=IzbcaUntQN2ch5YXc0hHOZwZb1Y/egMk0aOT72cdGkeEhcvOTbsmYMIwKhVcOEueh8
         jZlvWf0G7nR2BsVjCBp99ftyfPVAecPPjuXfqNsNDSVSqcSKdv/Xl+CdvvYuyAu78VnS
         jp4R+zK4yuSGNjHfVqQpsxKVGpNV/qPcCX8RSXh3Tw7oIvZiD7iYATjo9pLMA4r1SuXP
         vE67Z6czZKI2n3UINPUOcjZHi7JpTM5pbKq5QnRqoKX5vetm/NZVnV84qZXVHl+iwMR0
         lSfP5BPfrQWKzyYVAmT8vq0RtzhNF42wPnSVZ8bhld10jfVB8ghvH3FurDbH3YWm/oPl
         R5Wg==
X-Forwarded-Encrypted: i=1; AJvYcCXP2C1QnkcO0gvn3mvJI3RI0Tlm0k948+rHyoZ7BPnnKdAkG0uQVDBURYJdI33JhDQ2anUv8jj0Ql8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyhQsidAfJLbq5zlD1LTxaG5G/qok0ro1x4Vai8zGoGUjPWeO5G
	b2UyajzH7uLVmwaNoAdqFHMihwVJPCPVTifngMc+4xRFN9HqlZHoIh5JtCcGcA==
X-Gm-Gg: ASbGncs//YWH6UzbCRBbuMeGtD6kIp8kdctqol8NRnP1DuvmtGdpqi6FtQE27TTZ6sx
	BBTeTPwazCmcw/XdT8VeSLbdFwsA76NK6J2Xw4JomJ9TMGkYp2Nq6JVY2/oK5/R8M/zQ7Dt1K4C
	aRhjmwPoCaKQwdWeDIy9qsSybzHsL27UEdomOgqxvr/7h7xclvJ+pfPryuYt6fl120dI2yJiezz
	9L2PnTQ70Xyl2xBTFtUPt+jbWQ5uVc2Tkgr+bs2dVFET8SsuV9uYLuFhzhP5LQ/8UMj70OC/veg
	MK9JG6MB7OH09oSIYIiYwdqOz3KuiJaH2eSWQb4Awx23Y2gAhjtp9QS13NTKlMYKYljc/OpgL20
	Jd4tw0mUzWqQ=
X-Google-Smtp-Source: AGHT+IHOmNGw49NHY/o+3w6GaSaxWiGwnqKO6WwulpcufmcEot6esJxqSM5gVapMX6rxYdDYyBwNiw==
X-Received: by 2002:a05:6000:1a85:b0:38f:2403:8e98 with SMTP id ffacd0b85a97d-390d4f3c49cmr2689439f8f.20.1740575484796;
        Wed, 26 Feb 2025 05:11:24 -0800 (PST)
Message-ID: <1de43f95-5ed1-46c1-a157-094ceb84ac83@suse.com>
Date: Wed, 26 Feb 2025 14:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/hvm: Add APIC IDs to the per-vLAPIC save area
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250218142259.6697-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.02.2025 15:22, Alejandro Vallejo wrote:
> Today, Xen hardcodes apic_id = vcpu_id * 2, but this is unwise and
> interferes with providing accurate topology information to the guest.
> 
> Introduce a new x2apic_id field into hvm_hw_lapic.  This is immutable
> state from the guest's point of view, but it will allow the toolstack to
> eventually configure the value, and for the value to move on migrate.
> 
> For backwards compatibility, the patch rebuilds the old-style APIC IDs
> from migration streams lacking them when they aren't present.

Nit: "when they aren't present" looks to duplicate "lacking them"?

> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> I've split this one from the rest of the topology series as it's independent
> and entangled with another patch from Andrew.

Albeit I think meanwhile we've settled that the entangling isn't quite as
problematic.

> @@ -1621,6 +1624,14 @@ static int cf_check lapic_load_hidden(struct domain *d, hvm_domain_context_t *h)
>          return -EINVAL;
>      }
>  
> +    /*
> +     * Xen 4.20 and earlier had no x2APIC ID in the migration stream and
> +     * hard-coded "vcpu_id * 2". Default back to this if we have a
> +     * zero-extended record.
> +     */
> +    if ( h->size <= offsetof(struct hvm_hw_lapic, x2apic_id) )
> +        s->hw.x2apic_id = v->vcpu_id * 2;

While we better wouldn't get to see such input, it is in principle possible
to have an input stream with, say, half the field. Imo the condition ought
to be such that we'd make the adjustment when less than the full field is
available.

Jan

