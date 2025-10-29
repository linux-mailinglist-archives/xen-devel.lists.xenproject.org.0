Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2090EC1B385
	for <lists+xen-devel@lfdr.de>; Wed, 29 Oct 2025 15:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152791.1483299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7C7-0006q4-Tv; Wed, 29 Oct 2025 14:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152791.1483299; Wed, 29 Oct 2025 14:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vE7C7-0006ni-Qb; Wed, 29 Oct 2025 14:30:35 +0000
Received: by outflank-mailman (input) for mailman id 1152791;
 Wed, 29 Oct 2025 14:30:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=f6do=5G=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vE7C6-0006nb-Mh
 for xen-devel@lists.xenproject.org; Wed, 29 Oct 2025 14:30:34 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3318148-b4d3-11f0-9d16-b5c5bf9af7f9;
 Wed, 29 Oct 2025 15:30:32 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3ee12807d97so7039594f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 Oct 2025 07:30:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952b7b6fsm26801968f8f.1.2025.10.29.07.30.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Oct 2025 07:30:31 -0700 (PDT)
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
X-Inumbo-ID: d3318148-b4d3-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761748232; x=1762353032; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nuEh6rSoksdm6ivLtSxjsQaMePIxS0YYs6/184djObE=;
        b=ggXQNWc2EOOPAozEA1e5qRBjdTeGvrrekH4saYrDp5BSJFbzh/8shZcTcRSeeaj5hC
         Npu/rtS6cyR90P0HV+56fuHl4amo1N33FDBnXcJe/B5Zf1xZ5PX0tjeIGLW0N4+A2IHX
         OvMnCG5NeQ/lM8w6wsTcxV8JXG4awZiNNR33IMwftZ9YExmjCoDFu8sliMH9YzxkwVxc
         kkbkB34Z0LLkWqeKHQY0wqjpPPPMwkGxxZwwX8FEVP0pZEv/VUu92fWaCqEP1hdcQr4L
         PfuUKbd2WCuIhBGgNr+sKHlhwpPo8PeoqEQaHAB9ZLLvItrZnCE+WzDSZ9gaZ1MC5yOT
         r7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748232; x=1762353032;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuEh6rSoksdm6ivLtSxjsQaMePIxS0YYs6/184djObE=;
        b=KP3WDe1Q1x3iJn99vgCQiGlveFmHPgXoRQEfzMFIyNQ4DXMz/5W5lPzXq8IMQtdfEy
         EHq9VLH0Uu0PL3hCuDrnUbNapQB32PTW4+X3DM0yE205CNRsgDtYSuCQIMfV5z+jdyxN
         TZyeBu4rxIrjKe2EhVKqyyHIgglXLLZw7yX0k8nHbqjq2GO+TkcfUnF84p2JRQtuSORi
         CBZEy0izpj5OoHr4c89GlQFzFvlgaSKmzTBF8tJiUFJeK3SI7G1BWJ/K6gzwhjOeUfws
         n49PSmuJ3YsHJnw95Gd+EANuDu2ZQuHqLyxiLZgcpuLxRDu41M2ID7v4JVq5JwSDR3iZ
         pUtw==
X-Forwarded-Encrypted: i=1; AJvYcCW7m4kkvqxzuZ0AB5+tsCx13FylT6qT0iUQk+VdaWq0CniiAljvwkVvew3X+BmaoPvavSyAC+KyM2Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxf6Wn1DrRRJCKJh7tJb67AE+3fK6BVq7/0nv5rorECNVcsAYbT
	MMpj5yKgR8TB9l8dNPJIJy9g0BW8K19Qm3ubtfJLU1KpDURnpm6+HSZ/kN1Bw94Cvg==
X-Gm-Gg: ASbGncvZDVxP3rovrDiEt74kCWSmnksagMa2af4ajgGGv0zTH/dEyQq9rME/LbNy7i1
	Be8fG/tayJdWousxu13Oc7hqJ1QrvJXXVsvZ1/byfWdZ3w4+UiLE3njVUHSupPBEAj68vtz6Kd6
	kom2wUgf2xCk0mqLDePMJEVhu8MGuYIpX8e3V4p1IC5zb6kQBslQgSr63PMQxZpaWrM9TlzDE+J
	mbkU8xYa7QG0OtvidgnCQVW85ifa/HMnIRZQdPFdCk6LFgnU6cSL/DvNPMLpeD4BduUIzrLXea/
	moDVjnEs8/5+MmoK9/WMk6+Y/yApaGymtElHsKkCK30cVgl9boxt2vy8nf6cf70wW2ElN0wRiFX
	xRkQ2gWof3Nn/Tv8F59QRgtgE86H6+0W7kw7a3nCFOY20inmy0bSfLu7siGErtvfHrgqxjuPWvY
	Lm4u3Bxom/ezGCFOxUNfr2rHT+GJav5qdlFoU2jjn3KZsopSqdrVfyOlNVxm0iv9N1qdD7C90=
X-Google-Smtp-Source: AGHT+IFelraYl7++xRPACnzzCwqpGuVFVblwDMFoVdjAQP85B2au4khCg8N0dMcKpj6xspLUUtEzYA==
X-Received: by 2002:a05:6000:26ca:b0:429:8d0f:ebf with SMTP id ffacd0b85a97d-429aefcce70mr2777779f8f.42.1761748231946;
        Wed, 29 Oct 2025 07:30:31 -0700 (PDT)
Message-ID: <fc5af689-a46a-4f08-99d1-e568ee79a227@suse.com>
Date: Wed, 29 Oct 2025 15:30:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/28] xen/sysctl: replace CONFIG_SYSCTL with
 CONFIG_MGMT_DOMCTL
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, oleksii.kurochko@gmail.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Nathan Studer <nathan.studer@dornerworks.com>,
 Stewart Hildebrand <stewart@stew.dk>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, xen-devel@dornerworks.com
References: <20251013101540.3502842-1-Penny.Zheng@amd.com>
 <20251013101540.3502842-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20251013101540.3502842-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.10.2025 12:15, Penny Zheng wrote:
> Rename all the CONFIG_SYSCTL into CONFIG_MGMT_HYPERCALLS to help provide a
> single option to manage all unnecessary hypercalls, including
> sysctl, domctl, etc, in dom0less system and PV shim mode, which could also
> make it easier to support randconfigs.
> While doing the replacement, we fix some bugs on xsm system:
> - wrap the whole xsm function to avoid bringing unreachable codes when
> MGMT_DOMCTL=n
> - add missing wrapping in include/xsm/dummy.h
> 
> Suggested-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Acked-by: Jan Beulich <jbeulich@suse.com>

Quite a few more acks are going to be needed; please recall that it's on you to
collect them all.

Jan

