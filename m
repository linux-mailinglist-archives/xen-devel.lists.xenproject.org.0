Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC643818C28
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:25:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657027.1025644 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcue-0004UN-O0; Tue, 19 Dec 2023 16:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657027.1025644; Tue, 19 Dec 2023 16:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcue-0004R2-LD; Tue, 19 Dec 2023 16:25:44 +0000
Received: by outflank-mailman (input) for mailman id 657027;
 Tue, 19 Dec 2023 16:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFcud-0004Qw-7B
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:25:43 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40e4f26f-9e8b-11ee-98eb-6d05b1d4d9a1;
 Tue, 19 Dec 2023 17:25:42 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3365f1326e4so3432620f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:25:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f10-20020adff8ca000000b003365951cef9sm11406140wrq.55.2023.12.19.08.25.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:25:41 -0800 (PST)
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
X-Inumbo-ID: 40e4f26f-9e8b-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703003142; x=1703607942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tdhlgde800NZLfZzsrYjg63B35CFCzShpO3xhfVbq0=;
        b=HUU67EdCaG3A8Up4CxAeJ6oRPiXq7TQkZ3GKg1SqHs3YrWeGxeiZyEbIbds68ceKBL
         ohFUxjfYl3M+s84KIyoC2eMEijCJ5//hkKXK3LFBOR9As++ptmB2lIbxpDgV0d42FsDH
         NbirrpPg+3GPbPv/Wt98qJ/XKwJU1G8oT/LrXfenwv3NsIWPAK4O3V37YcQfiJndsFZq
         6es6cmDTjgA5upSGx2JUpXEtM5BW4YzVW6Uvo/gklGNcU4rLTBgxQcRQRdZV4oKN1q8C
         RtiHFUwyGCWSX9Wd99vCvIy9M5gYGjOvTdAtUdPaJFWkUuM6Dv+6COa3dzXcd7r9nH3N
         ezzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703003142; x=1703607942;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3tdhlgde800NZLfZzsrYjg63B35CFCzShpO3xhfVbq0=;
        b=lGv/yc9xsSNeExXQedeYyP9Li+t8IMhHhDcxme6D6M4Kykt1QWVSVFTuIJhV6QA+Lp
         /wzqkhHIRmiQMVCytl98zBDcXw/MdkpIHISCF2JqdbIXXErybqaQ3jH6lfA3KorqXBs7
         cPdTxP2suKKBHlLvxk5ZTZ/q3Hnno95KvUTcsyezRcgD1nq34Axosg3mYiDxZnMaO0yK
         93W1Adn9wfzo89WjNs/H+fk701JC/gxqj7NJeFWbRHmexifhNtZ0yPbl9Mm6gDGPB4vx
         hSQHRRabmw0dejoF3J/YCD57UDxYkBk8+uCp1PP1bc1g8tWPSf/WdffAiHW67FzmZX5Q
         cIrQ==
X-Gm-Message-State: AOJu0YxYvoB3qYhaSiIaBFuYi6jYBNJ0em8CB3WrhJ46NI6vJ1tplUjS
	/AftivFOZGOQ2VqbGknDxANK
X-Google-Smtp-Source: AGHT+IHlnzcpoS7Qs5ZumHvRrWQJ5MoPu5VSeI92nYQk+5Hh3xj1qRW/c2NSsVkNlL6FyU8j8BPvZw==
X-Received: by 2002:adf:fa45:0:b0:336:6690:6d0 with SMTP id y5-20020adffa45000000b00336669006d0mr2139318wrr.76.1703003141757;
        Tue, 19 Dec 2023 08:25:41 -0800 (PST)
Message-ID: <8005ecca-0ffc-4933-8d8f-03829fc67a3a@suse.com>
Date: Tue, 19 Dec 2023 17:25:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/6] xen/common: address violations of MISRA C:2012
 Rule 11.8
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1702982442.git.maria.celeste.cesario@bugseng.com>
 <df682e995b726b5f7ba8af0f69bb888c398eac96.1702982442.git.maria.celeste.cesario@bugseng.com>
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
In-Reply-To: <df682e995b726b5f7ba8af0f69bb888c398eac96.1702982442.git.maria.celeste.cesario@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.12.2023 12:05, Simone Ballarin wrote:
> From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
> 
> The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
> headline states:
> "A conversion shall not remove any const, volatile or _Atomic qualification
> from the type pointed to by a pointer".
> 
> Change cast type from void* to uintptr_t.
> void* type cast resulted in violation of the Rule, a cast to type uintptr_t
> is more appropriate type-wise.
> 
> Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
> Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



