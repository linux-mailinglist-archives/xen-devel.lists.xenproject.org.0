Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4933C973AAE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 16:56:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795764.1205262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2HX-0003YR-Lt; Tue, 10 Sep 2024 14:55:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795764.1205262; Tue, 10 Sep 2024 14:55:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1so2HX-0003WA-JC; Tue, 10 Sep 2024 14:55:51 +0000
Received: by outflank-mailman (input) for mailman id 795764;
 Tue, 10 Sep 2024 14:55:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1so2HW-00034w-Ih
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 14:55:50 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4e976a8-6f84-11ef-a0b5-8be0dac302b0;
 Tue, 10 Sep 2024 16:55:50 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a8d51a7d6f5so296617966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 07:55:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25835d31sm494496666b.10.2024.09.10.07.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 07:55:49 -0700 (PDT)
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
X-Inumbo-ID: c4e976a8-6f84-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725980149; x=1726584949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+vyt4sM+WhrPDkxvMNF2iWGvWqUQZvwbGu3XicQ/3cY=;
        b=DDDbxdKxCcBnX21UHGLpfxDZd6nwc64QtSa+aR/6vKXpEfScDiZ9KSsdeq+5vzuaCu
         UcadJxcgbAQEjf5jrHPmPL/e8xs1svgPnfNa405pjAcKf+ODLGY7fVWvvI7o1/EYw0bX
         kdjOHLP3wPLiS9F4Ca7ptCX4LoIdr4BUmS16CFU5Lfrecw9lkqNLWfJYT/nyYrjG12Er
         qmb1Q1AlX5ovB81GLoJor1R0B4+6TzG+3byKr/cKi8FdsWN+LBVLgZ+295272O/M70Dm
         Rf5FHYpijIU5dePajwXUDh1Z1i0tZLl8/0HqypxEPssMfP+IpvGWddcGhiyJxGvfinCh
         qXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725980149; x=1726584949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vyt4sM+WhrPDkxvMNF2iWGvWqUQZvwbGu3XicQ/3cY=;
        b=sHfJHyrqly3tNYdFgtIvgRnvYCC3nLpTGMO22FZSLQRerA/6yosvyssJrciLC5+zUG
         iOt9cq/b/qJK+ZCp7MsZMapmOvM5GfUQ6WAgRb92hYDCCrb7HVMDh8qM4ORzocXofc1m
         2GC+4zbWgmphXMf4azTVADRxt+yI4W38TiDTteaczRLor2YigVwa48OE1wLCUcWKRLeP
         O2eUqlekSjgd05phRP0nOLAZqs13xqfa6J37tLfdBCrKTa4Oe7wsz3j/JIMMrBhoL7Md
         2eHkOhiYIKCbOr3uia4jdtIsWOJzUxwpmoXuUOstoeoOILL53izNiXVbR6CUKYvHmfOn
         UH7A==
X-Forwarded-Encrypted: i=1; AJvYcCX6SNpXjRm/OfurpB+z/v5Lbmh7Mqpa2UVTDYhuKAR2H3Mx2g/ox6qjtEi7s818bmS6tfBxeW+vagw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlJyYRr1CttaJU6xjgxaT1GpURMGL/EeIZXLh3uS0IMEomdIHE
	MII/mLVxScYL+x6h2dNN/CmdJITxp6E6jd5wq3pghywtdPESeBsK1zx5bCXYSQ==
X-Google-Smtp-Source: AGHT+IFTeGz8j5lBJO+y3jcKmAgarkc00jGgU3IESapRIDKu2mLxGoe2MnnWaU3I7xzSNpY5KMYabw==
X-Received: by 2002:a17:907:7251:b0:a7a:acae:3415 with SMTP id a640c23a62f3a-a8ffaa979c2mr94147266b.10.1725980149557;
        Tue, 10 Sep 2024 07:55:49 -0700 (PDT)
Message-ID: <e4c2e4a1-5ece-4d40-a462-d7ffb365b80d@suse.com>
Date: Tue, 10 Sep 2024 16:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 07/12] x86/mmcfg: address violation of MISRA C Rule
 16.3
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1725958416.git.federico.serafini@bugseng.com>
 <daefd5159c38431e2a48b8a94a255f74d07261c4.1725958416.git.federico.serafini@bugseng.com>
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
In-Reply-To: <daefd5159c38431e2a48b8a94a255f74d07261c4.1725958416.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.09.2024 12:08, Federico Serafini wrote:
> Address a violation of MISRA C:2012 Rule 16.3:
> "An unconditional `break' statement shall terminate every
> switch-clause".
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>


