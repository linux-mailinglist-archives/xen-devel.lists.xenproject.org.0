Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F28E88A691
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 16:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697789.1088907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romGp-0005rF-7J; Mon, 25 Mar 2024 15:29:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697789.1088907; Mon, 25 Mar 2024 15:29:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1romGp-0005pR-4X; Mon, 25 Mar 2024 15:29:55 +0000
Received: by outflank-mailman (input) for mailman id 697789;
 Mon, 25 Mar 2024 15:29:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1romGn-0005pL-L0
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 15:29:53 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 866ec6bb-eabc-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 16:29:52 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a467d8efe78so533079866b.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 08:29:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s10-20020a170906354a00b00a47a33b3aa2sm1634987eja.157.2024.03.25.08.29.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 08:29:51 -0700 (PDT)
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
X-Inumbo-ID: 866ec6bb-eabc-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711380592; x=1711985392; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hseUhSsmJKVNraENiB+Z6BqcV/Ua5vxGM6CtyHtBBS4=;
        b=HxV0y+adbH/CWMFm8zIA7SPt8TcCF/2mDhzaBH/9YReruLxLkE8HgJ82fak+FNBbZ9
         2Z7aMDhaQEsPTrXwKoGRj2fNtGtLoGrWDSUzR4Kf7P/rw956HeEnjya5node1sa6Vzhz
         iCOmRNSWKMEZBAW+1sojr8LvINbzm8cA9w78t1RgPtW4DgTwcVswnYtyllaxoqX7TeYB
         NVkUu5J3cvvz1c7Na5Oj02lgeMBlEbRGNV2ifZ08svnshMTaVqW4yrOTLIjV245fgR/j
         TnHZWA1HVtnbNwPuOqi8kJ82AJlW81OoQaI2F4wYp4ni4wotlmokoBHRnDtOd5jkFU44
         6SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711380592; x=1711985392;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hseUhSsmJKVNraENiB+Z6BqcV/Ua5vxGM6CtyHtBBS4=;
        b=rG4YIfshhpVuEBw3afcHJhOKkRUYpQZKtZKbRu6cfv1i4NRofYYu7hi2IMDCpfY5mN
         mno/RnYitoZEvJNBe+fd/paxBfyyyCl4KIMLHD1AI/mz3ZSIHagcZT8Hg1T4eF/2wp7V
         k2+eDboYBOBkYTDYF+eaX0Dz6HndBwS3QhI0VVQgCwCgiyzugxKPi1BFlY/BU9Pf357V
         9tynSdHB6dFGvZuMNj9TStO6x7tXatquqyqP98stPXLr5m8Dmz9dPsT74W4qfaJRbESq
         NxuFnmEXmmlJKQKDaTQ2a1sp64UXtUxS4IMT9wPI3jPfkv4opnvTp5IkEd2/OPl4gsYd
         GKxw==
X-Forwarded-Encrypted: i=1; AJvYcCUxUFo+gWlftub0j0txjQPr7qf3cNXg4NSVDYirqK4kA9Wi5YBo7Uw/ckcKKRhLuCA8wMQSpNh/Eoeuwks41jHyQ8Db1Y4+9TbrBgl9G9w=
X-Gm-Message-State: AOJu0Yzd80aSgTK8kOXPrn/OncJReVi2JMqE6Mrh5Nj4x0AgnD22B7CY
	4BF41KrZVVLC65oJC0DreINZYfuTrfaKE+kvwytA3P2Ukfxkbru+L/uyIcUmdQ==
X-Google-Smtp-Source: AGHT+IE+CC1m0t0JPKIcrcUtfVL1KYYF1qeX3Bx6PJ9O1BMMFf800uv4FwzOPwZtjdFE5ruEOWAOdA==
X-Received: by 2002:a17:906:c190:b0:a46:22a3:479f with SMTP id g16-20020a170906c19000b00a4622a3479fmr5794928ejz.21.1711380592182;
        Mon, 25 Mar 2024 08:29:52 -0700 (PDT)
Message-ID: <9d62ae85-87e2-4645-a43d-1a978c8083fc@suse.com>
Date: Mon, 25 Mar 2024 16:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] xen/ppc: mm-radix: Replace debug printing code
 with printk
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <c96e022413f73a531d078db5540a90113e138241.1710443965.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <c96e022413f73a531d078db5540a90113e138241.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:15, Shawn Anastasio wrote:
> Now that we have common code building, there's no need to keep the old
> itoa64+debug print function in mm-radix.c
> 
> Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Just to clarify: Is this dependent upon any of the earlier patches in this
series? If not, it could be committed right away.

Jan

