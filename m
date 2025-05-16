Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E5AAB9952
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 11:49:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986733.1372289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrgS-0000ED-HW; Fri, 16 May 2025 09:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986733.1372289; Fri, 16 May 2025 09:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFrgS-0000Bl-Er; Fri, 16 May 2025 09:48:52 +0000
Received: by outflank-mailman (input) for mailman id 986733;
 Fri, 16 May 2025 09:48:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=C2cV=YA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFrgR-0000BY-Gp
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 09:48:51 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8662931-323a-11f0-9eb6-5ba50f476ded;
 Fri, 16 May 2025 11:48:50 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ad510c259b9so333827166b.1
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 02:48:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d498544sm128200666b.143.2025.05.16.02.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 May 2025 02:48:49 -0700 (PDT)
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
X-Inumbo-ID: f8662931-323a-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747388930; x=1747993730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RIF5zmO/6Lv+zyNKBNr/m5cj94Xq3FU9LAsp43XNSlI=;
        b=KxUWru7VVMD/u5ShddgMlgPNXLUf91sDlUUf0u/bl+Ygdjkhd8vWMrmX2NogIf7fqu
         KkTbJqa8VNv3NSQVMJb25tMulxxUcORa1gpOmwbP6iTd8og5Z0KtN80dxXiqoLjQRAGD
         tDm7TDhwhUQDMZqVJ+NZ97twQwhYVG8PrVuCJDOdNg0ab7AtU2zE1lbfWQ2a/+wE8ctH
         zfBOMgmGMWkLirdPxgWtracbb4nb6JOG1GGmsuFSChgVk/8ZxEIQl10ZEy/NifeZw43N
         amiIm+SV/Et/bSm7/6Ct9NsJHdZwposf/J0GvJzl4ZwezmcKid6lRD9zDKwcD0Oqi+aC
         J7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747388930; x=1747993730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIF5zmO/6Lv+zyNKBNr/m5cj94Xq3FU9LAsp43XNSlI=;
        b=m3IxQh4B2W+jXqT6R1SjO65ZxmMlnJrREdCIqLWZTfrWbLX8jnCsEmDg3J+Ni1Q/gG
         tzTMrpnZNpzZfkMdeuZyafMsAx23GYpskT0uLEi2mzlXsTUKzecFEgufs1fwMAlugOPX
         lI9f/DCWXXcu+fNH8odZAJBYuApVcgvnAVzDBhpH2shV4N4N6vgMQA8NO4Y9V0QVscVh
         Bxq2WTlJjoyXedFUm3GD0+ET7u/f3JigtzL8jPvpOFpl++a55+3Cog3DFqy3u1q+H1/N
         QfjSQ4g+1tatJsb33IoO5Ls5Rxha/CRUDLj6YkRvcEqwdr0skzcM/ui4J9+27KJCi3WZ
         lOxA==
X-Forwarded-Encrypted: i=1; AJvYcCVqd+ZwbBw5YF7kOlih+sgOHq9JJaS7Y7sYVisH9q96bM/w//DmjGsEUn5dwBFAR3qB6fFcf/Sv/qY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztXQg0/y9ySm04a2qeNp1pk73p/w+zY6WldQoUgytbFLrocu+E
	s6RY3cLKAAe9T4o8mEkFkVTyaA2oHhZ1vv9OQiBjPPiKGWip7h2rVy4Ey7/w2SBqMA==
X-Gm-Gg: ASbGncskE4zA2e01gYaGV2yiAwUfAh1Q5610bqjhG/3imkXflc+fRmyGr4SaK0bm6jN
	/Q1/pVY+tnlrslZ6iRB8KootAEjY/NURWbrJrE0m8dfYO7mTpS6Cpnk35rB9UYp1yibE65/P08q
	NZqj9GHRwHnDXX5COqhlQpNW+WKzl8b4JZc1vEUgHUx1SSekcID/ZwgFqyssJXq5UKgAzg1QdMS
	pydTIAoFEpY1v1TPpZ5kvG6ZfHohZQZi1phhcKy77SEwdohW6iGnesvd55VRb0oZpXzOe873tCR
	uYT6hd1ywHHxi/lMjCJKFoyOBoMeNnldCMrwjQqwP1QtABnGyU8K8btI3GLt6dVQrYL5CLGPHh2
	HfcApI8noWxHzrkqPUMa23VbgLiHQEoFWrr25
X-Google-Smtp-Source: AGHT+IES3eLQZohr7RxXZdbCm4IWzcs8c3/ANyi26ELE69C62z0NjD1AMTkHvBI/JxpL8HlpYVv+vw==
X-Received: by 2002:a17:907:a08a:b0:ad4:f91d:bfc2 with SMTP id a640c23a62f3a-ad52d43826emr259203766b.11.1747388929989;
        Fri, 16 May 2025 02:48:49 -0700 (PDT)
Message-ID: <b7d2f338-6918-4052-99e1-733dbb0aac7d@suse.com>
Date: Fri, 16 May 2025 11:48:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] x86/gnttab: do not implement GNTTABOP_cache_flush
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250516094535.63472-1-roger.pau@citrix.com>
 <20250516094535.63472-3-roger.pau@citrix.com>
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
In-Reply-To: <20250516094535.63472-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.05.2025 11:45, Roger Pau Monne wrote:
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -35,6 +35,11 @@ config GRANT_TABLE
>  
>  	  If unsure, say Y.
>  
> +config HAS_GRANT_CACHE_FLUSH
> +	bool
> +	depends on GRANT_TABLE
> +	default ARM

To keep arch stuff out of common file as much as possible, I think this instead
wants to be a "select ..." from ARM. Then:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

