Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CBAA790F5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 16:20:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935833.1337205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzywZ-0006Uh-9n; Wed, 02 Apr 2025 14:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935833.1337205; Wed, 02 Apr 2025 14:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzywZ-0006SA-6r; Wed, 02 Apr 2025 14:19:51 +0000
Received: by outflank-mailman (input) for mailman id 935833;
 Wed, 02 Apr 2025 14:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzywY-0006S4-2g
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 14:19:50 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86dfcb21-0fcd-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 16:19:45 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43d2d952eb1so47909855e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 07:19:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb60d3627sm22259175e9.24.2025.04.02.07.19.44
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 07:19:44 -0700 (PDT)
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
X-Inumbo-ID: 86dfcb21-0fcd-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743603585; x=1744208385; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wPL6ydlD5nnltGYjVB1l8J+yUg9LEsB7Y0op5fiX6XI=;
        b=ciSW/YQDqWneSnxq0lyKVP+HbI8W92Z+z4QdArQT5yyM1886VqWlOeKO6gfejRNeSW
         xzA2cxQLp4CYIUpx0z2oWrYKRZKmnZLf7U/otD3qelY2Xwzf7RypWeFYMdFgFxFwOB07
         S1JIAk+PuwWoqn1Q1Yr81gBB7NJ/XQv7Ffgoqc2FmGFGagCJX/2T7MObIZa1KsQZ6LEc
         3N85Vnoi9r4Vbu2Zq6CU5LHSWHLltzfzQVx8CYxUzxa0FTQ7c9N/jE+gNkZmcMGd7fFs
         Uwye3W9fhRTFW+vKPHLoY4q8IPmKfGaLAfJsuMO6qGih9Bs9x0VtUa5HHqC90ceVUa1Y
         aOsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743603585; x=1744208385;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPL6ydlD5nnltGYjVB1l8J+yUg9LEsB7Y0op5fiX6XI=;
        b=YDcH6zb8FOJFusAQnIW9cUJMvlAyLOexz+zVaFLWvMfF/693IHHWOEZhpGtBNebEG9
         uXI+PbFD2DDup255gRYIcIucWLxsfvp1stcvlGX29boh5WjyseNUYILjR/MHABYPX8Dd
         Os4GWXqHP++inJKWDnifRFUFHy33bRcAKBXPKPzCvOAtjEKE0s4C1c94eCCrMDPPrGyd
         tDYRjcccVjd5ShytZLb5Db63kKJP0Dh4cTv36LU8w1T3Ue4E2ptHMbIFguE0TifiDRjE
         pa4g4jSPbGIN3Dmr5ck4mfzCOCJV9kapeVM88xef9WNCXhohl1t2rjM9rK8D/RWhPcVP
         uBQg==
X-Gm-Message-State: AOJu0YxmSlE+6FYl66MNFqUal/YlBEthftzdfkIsElw6IFHGxkW52eYo
	p6WPsAwMHCZqQ2vBc9rItaiamX7hUEU7lKV1umwDgGrkETlazbKfqGi0BUe1z2zw/N5S2T6MfuA
	=
X-Gm-Gg: ASbGnctYUXDnAoj3kZxFTwTV27KFUDHiY7YaFSkU+iqUlWpPeKyFVMgP99V6HXyZwP4
	qLvRkejncodTF9y1z2A40EeqlDcorexH43C1cOKnvxfBbeTmNrdLUvQSUkTQ2hQQKbb4FgyY95w
	WErp9NlQ38yEolwiADL4QYCrwVCbojs0gOivmRrTo9YVPVvRmqYAqxtESnkJEtFQSPOJe0x6yeY
	EQLYyxJ4cDw0URfm2JN2VEBInG0mB9huFwWf7rwrkDR3A2JmMVPcchSphMgeCo8f3vc0ksPlKXL
	LGkIvPOWCblDem4OO3eDNgeoTD7VbuIIwyCydhW4ASR1qq2h+tYNOSSPxDq2XhH6wL1B6jcaxGW
	IE0kx8ZF+4vfpNSPkaUPYXc21oEC1yw==
X-Google-Smtp-Source: AGHT+IG088zWw2+yQN39YM6SOBc6PDqd2m3VsLWAxwfiEvvCfV4xMF6LdxKtK1J3qlhbREQbNPb8SQ==
X-Received: by 2002:a05:600c:4514:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43eb5c96d6emr24967195e9.30.1743603584986;
        Wed, 02 Apr 2025 07:19:44 -0700 (PDT)
Message-ID: <e9e139fb-c023-460d-9d84-632a5ca4374c@suse.com>
Date: Wed, 2 Apr 2025 16:19:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: New Defects reported by Coverity Scan for XenProject
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67ed34047fd3c_1209992cc92a0f99a0989e0@prd-scan-dashboard-0.mail>
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
In-Reply-To: <67ed34047fd3c_1209992cc92a0f99a0989e0@prd-scan-dashboard-0.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2025 14:56, scan-admin@coverity.com wrote:
> ** CID 1645573:  Null pointer dereferences  (FORWARD_NULL)
> 
> 
> ________________________________________________________________________________________________________
> *** CID 1645573:  Null pointer dereferences  (FORWARD_NULL)
> /xen/arch/x86/mm/p2m.c: 346 in get_page_from_mfn_and_type()
> 340     
> 341         if ( p2m_is_ram(t) )
> 342         {
> 343             if ( p2m_is_shared(t) )
> 344                 d = dom_cow;
> 345     
>>>>     CID 1645573:  Null pointer dereferences  (FORWARD_NULL)
>>>>     Passing null pointer "d" to "get_page", which dereferences it.
> 346             if ( get_page(page, d) )
> 347                 return page;
> 348         }

I wonder how the tool concludes d is NULL. The only vague guess I could come
up with is that it checks a MEM_SHARING=n build, where dom_cow is always
NULL. Yet in such a build p2m_shared() is also always false. Should we perhaps
help it by forcing P2M_SHARED_TYPES (maybe also P2M_SHARABLE_TYPES) to 0 when
MEM_SHARING=n? We do such already for MEM_PAGING=n ...

Jan

