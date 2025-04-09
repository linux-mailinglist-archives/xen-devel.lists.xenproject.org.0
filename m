Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C112CA81D1F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 08:34:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.943364.1342132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2P11-0001Cy-5u; Wed, 09 Apr 2025 06:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 943364.1342132; Wed, 09 Apr 2025 06:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2P11-0001Am-2J; Wed, 09 Apr 2025 06:34:27 +0000
Received: by outflank-mailman (input) for mailman id 943364;
 Wed, 09 Apr 2025 06:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5vFf=W3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2P0z-0001Ae-9Y
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 06:34:25 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acd8696a-150c-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 08:34:23 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f2f391864so3495615f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 08 Apr 2025 23:34:23 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d893f0a11sm661965f8f.73.2025.04.08.23.34.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Apr 2025 23:34:22 -0700 (PDT)
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
X-Inumbo-ID: acd8696a-150c-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744180463; x=1744785263; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fub2I+MB9rjQEklAxX3M3dotSRNT6oFTUvZX+JJ++lo=;
        b=JifMBAKCAaiq2jOA0WxcQYCR3lRfrtD6R7KIitKNaT+UK4yVXgLDE4xUXrHjnjzyro
         yj6fKrF0/a7OuKmp8nH/UN/VElj2kjcY9QAVlWvzhirKayJR2dchXy5HFtCjmtFv383j
         3vqIBeZjVlOde4rPAe3w+M3vEoi/nGm3DHCC6QD4NcMVXO0mb0HHGpdkFmLqSCnmOT5L
         l/ewIvs0jajcHbH6k3f900/62/nLjCmW0epDcsHzxLjBcOX22rEUXIklgGVPSIUKxT6Z
         WfOZ/zAZPScI5B5dq70gARFf3L9s60toTfEEaLd/3BMYBBoQ7l5uacVvM2nJg9S3Uabm
         tx4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744180463; x=1744785263;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fub2I+MB9rjQEklAxX3M3dotSRNT6oFTUvZX+JJ++lo=;
        b=UgiUXJiru31joO6DKco852685ETYtv0rTA4g7Bk4M8CKJnFjINpVxRIfp6eqDBY0YO
         U9zjL2chJP1qgHIF3vJFe9lGIoK5gXphUp1ZDDzb29tC4Nvf5hM3P6hxtCtW4ZspiBQP
         Inb25Ft69VPf1XWUrcKozz5yQHMwzQ0s3n5tuTGj/CIjOB1vmPddR6t4jgstlTRYagW0
         I6HJI3OX4WFy8GeA+bkoRUynaS0FSgkH4ewLpoavchm4KCjSnDbBY4TaKJfXa8naG3hl
         4wkAGV/0tCmmWXsGE1i0MpysG54nNxvBK6z9TrxVL+WW9pzDGyrOwh6xVJTv+DysZj4n
         hNvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCWxMOW1jcmqMEqRWeHRO7o2ROQbqSLk5vmYQd3fzXiIbR55f9JjcVD4u3K5cpLR7EPbtIRgg6xrY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7zNI/8iu5khPtES0KIKushnbWiGiq5v9y/ZCY9TAx5ysC49GH
	O0lgW/FAEhu+iqgX357VAeaubs6eH00hbfGNmbhN7DOz6nCahJDCgoDkpwHGyQ==
X-Gm-Gg: ASbGncvjdR6eFOHNRIp2Vzia8xcqxx+eSoYtdav1BPBjgH+/dv/jgrmRVSxQr3rkIf2
	RsQNbFQmqRLVdjTs/0sDREtMTBgUlDZ6L8gOG/9FULA49NXOLM5/nA12MENSRXiySFjwM6YFnS8
	ovyBmtfW82VNVWF2PBVJZy35GYnOzL2vHNhNMqP6q+jwQYItzUSXY+EYbC7Ivep6rOY1J/MqgSS
	Q8070QU8k+Jrt5ZGMF0oEFJlEyT6WOrL/rKAbYQdtu6AalooS2zi0gEE6OghcoqjmZaY0Zo2ul6
	984Vh2782o40Rx9OOHyK4JYUlXaDBqCllE0SuRWwjkVa2cbgSvrKB1Jb9pl1OlXWs+bpxlL0+sR
	Ztjmoavr3AP9F+irfa9DWalmSug==
X-Google-Smtp-Source: AGHT+IELu10ufk/rhmFmS+gUlu1Q85URWDpbnHmksPLRb6U0HupailBwoS7tISTluv/aDt7KHxgUPA==
X-Received: by 2002:a5d:5f52:0:b0:391:29f:4f87 with SMTP id ffacd0b85a97d-39d87cdbd26mr1425418f8f.49.1744180462783;
        Tue, 08 Apr 2025 23:34:22 -0700 (PDT)
Message-ID: <8089dab8-d94d-4eca-ad75-fec972386c80@suse.com>
Date: Wed, 9 Apr 2025 08:34:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/16] x86/boot: introduce domid field to struct
 boot_domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-3-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-3-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> @@ -1010,15 +1010,15 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
>      /* Create initial domain.  Not d0 for pvshim. */
> -    domid = get_initial_domain_id();
> -    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
> +    bd->domid = get_initial_domain_id();
> +    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>      if ( IS_ERR(d) )
> -        panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
> +        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>  
>      init_dom0_cpuid_policy(d);
>  
>      if ( alloc_dom0_vcpu0(d) == NULL )
> -        panic("Error creating d%uv0\n", domid);
> +        panic("Error creating %pd vcpu 0\n", d);

And why exactly is this not %pdv0? That's what would be possible to catch by
grep-ing for what vsnprintf() would emit for %pv. Preferably with that adjusted
(which can be done while committing):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

