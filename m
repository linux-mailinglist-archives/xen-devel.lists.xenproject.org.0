Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0ED0C2011C
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 13:44:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153634.1483924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vES0J-00060d-6E; Thu, 30 Oct 2025 12:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153634.1483924; Thu, 30 Oct 2025 12:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vES0J-0005xj-3Z; Thu, 30 Oct 2025 12:43:47 +0000
Received: by outflank-mailman (input) for mailman id 1153634;
 Thu, 30 Oct 2025 12:43:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vES0H-0005xd-O9
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 12:43:45 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 123ada3c-b58e-11f0-9d16-b5c5bf9af7f9;
 Thu, 30 Oct 2025 13:43:44 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47112a73785so7722125e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 05:43:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477289a5932sm42646835e9.6.2025.10.30.05.43.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 05:43:43 -0700 (PDT)
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
X-Inumbo-ID: 123ada3c-b58e-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761828224; x=1762433024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8Bk2Rb2RlWj4yl4MApAo+BtOeqrQyHLKyejfv8+iA8Q=;
        b=ULu6cClwVicPt3d477zusoJCz1LWqr7CiXJCMuT0nSF2cogPy4BeYclaDjwpxS9CxB
         7p4ubm43MPw4kJ80bBqkuCzoDmeU8ULhyL360eLIUhOxc9IVyGpBsvhNS8N9dfzyMNY+
         Z7K0xFAY4jAc1dGZ/NGyR5iCuN3WgORDV25I+eSs/JGrLoUM328xZM5CkM+lbV5Iy7ri
         fg9o9/JrYUD/MbKwHheVFW51mkc8DaKAT8+FeVbB7sTbCoL+2ki4IeoHTVxbDuumXAYE
         /KQhRYZxHrDNn8JKpNzcA4yKLKVOO8DbA+cLyzzVmG0+FMLCBnqyJnL7zRCL4aFE2mou
         olOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761828224; x=1762433024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Bk2Rb2RlWj4yl4MApAo+BtOeqrQyHLKyejfv8+iA8Q=;
        b=S04uN/Xpt5srPqBs+/cyqcEEpNFGtP/3iVs3OAZnLiI3RBNTKh9PE6+fYghD4F6F1y
         oswreP0ZqZLa/hCO94928UApzA1cMUkYT1Bu9Vs0WIQuTD8OtVX27vf59lb3N5xz2Tgf
         MSr76qMK3/9a+Zvixponl08gNVcaK4nZMNkukZK7A/6V+kBLkVFBc6+Ii+nKK8pTEdTI
         i4W3S7/+XQ3VVGw2VePx3Iw6PDVXnJQAerVt5T6G5dnGNxu6d8tjepYxChFfTGJQLX6I
         BUcqlmRgo4d8CrbcIO8fnX5dJmo72f7Tf2lhpjQkZIu61Ap4tzLyKiGRkG7Aml/vNu/E
         8JJA==
X-Forwarded-Encrypted: i=1; AJvYcCURv4xBnQStJY90sRVu6BdnMbywtXpPipEtTPBPUNoSjTrVBTGPvUSizmXhb3L6yNM0T+lCK1PqcAM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw4zJaozfBB3IzA3qCw6nAcUPpGeMne0RAcl4EHk1RgW4XkN5Tb
	F+N8VBqLMHx7HNQlWW6JmCIp/Nf/mzeXe2WckCX00wuGi6ObyIcvfEDSLfrl/MZpAw==
X-Gm-Gg: ASbGncuh5hxzQjhuwwB9fwDAyj06ury9I9nj5r/SfDThygn/sgcSNb9nppyFho6BqQY
	nyW95V090QwaB6x+q+9HNsgeLgVXJEYyKvozgLIjD/HHP8DSdrb6abIL0RMlzfsj4cdFV6qT6yg
	ijIvePtxVUTAVGWTwxal91TgFlK8eHuaqc0i1ch6niOWYjnHN6M2SiNYZTKAzfZ10qtjU0WeiMi
	ZIK9ABXm18LRPAcQyNRVfe22EJKC4Mm8bXnmFsW1hFA0sO00p1xj24YzgIexGCz1HB8cOeO84mc
	9erj8FM2X4gvNkL5kpBogHC84u0UMapiVW4D66mfBGEWIujD92Yy74K3ql9BNMiuenLnnmQ4hG4
	L2w5IfH38Jw9rmryRriAc3yY6yWgmRyFfVCWXCWMBHqc9Rx26q/zQ7KXflZaHR3lCLs9s6HpVHL
	rBcnNaX/tPub3KreV+GW+fbJj/KLdTC7lQMfE03tfQNZYwsaQaFIEqHmmQr3FWc5ymk/3wmLY=
X-Google-Smtp-Source: AGHT+IHUa+C7gp6xczr4iM+NVn54F1xvwqzSbez2Mrpd/IXT5+e5RZtI6pViNv3upNzvHRbso/H79w==
X-Received: by 2002:a05:600c:314b:b0:46e:32f7:98fc with SMTP id 5b1f17b1804b1-4771e3937fbmr57628405e9.21.1761828223905;
        Thu, 30 Oct 2025 05:43:43 -0700 (PDT)
Message-ID: <8c74774a-458b-4918-8d65-fcb3eacfe98b@suse.com>
Date: Thu, 30 Oct 2025 13:43:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/28] xen/domctl: wrap domain_kill() with
 CONFIG_MGMT_HYPERCALLS
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 xen-devel@lists.xenproject.org
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1396,6 +1396,7 @@ int __mem_sharing_unshare_page(struct domain *d,
>      return rc;
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  int relinquish_shared_pages(struct domain *d)
>  {
>      int rc = 0;
> @@ -1452,6 +1453,7 @@ int relinquish_shared_pages(struct domain *d)
>      p2m_unlock(p2m);
>      return rc;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  static int range_share(struct domain *d, struct domain *cd,
>                         struct mem_sharing_op_range *range)

Is this necessary? Shouldn't MEM_SHARING as a whole become dependent upon
MGMT_HYPERCALLS, then also covering XENMEM_sharing_op? (The same will already
implicitly happen for MEM_PAGING, due to its VM_EVENT dependency.)

> --- a/xen/arch/x86/mm/paging.c
> +++ b/xen/arch/x86/mm/paging.c
> @@ -768,6 +768,7 @@ void paging_vcpu_teardown(struct vcpu *v)
>          shadow_vcpu_teardown(v);
>  }
>  
> +#ifdef CONFIG_MGMT_HYPERCALLS
>  /* Call when destroying a domain */
>  int paging_teardown(struct domain *d)
>  {
> @@ -794,6 +795,7 @@ int paging_teardown(struct domain *d)
>  
>      return rc;
>  }
> +#endif /* CONFIG_MGMT_HYPERCALLS */
>  
>  /* Call once all of the references to the domain have gone away */
>  void paging_final_teardown(struct domain *d)

This is irritating, and could hence have done with some clarification in the
description (to aid review, if nothing else): On the surface, why would
paging_teardown() need excluding, but paging_vcpu_teardown() and
paging_final_teardown() would (need to) stay? Yes, the latter two are used
on failure paths of certain functions. (Same e.g. for domain_teardown() and
hence arch_domain_teardown().)

Jan

