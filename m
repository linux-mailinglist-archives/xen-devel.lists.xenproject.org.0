Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 130C18C581A
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:37:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721600.1125165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tGY-0007uD-Je; Tue, 14 May 2024 14:36:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721600.1125165; Tue, 14 May 2024 14:36:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tGY-0007sU-Ft; Tue, 14 May 2024 14:36:30 +0000
Received: by outflank-mailman (input) for mailman id 721600;
 Tue, 14 May 2024 14:36:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VieR=MR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s6tGX-0007sO-Va
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:36:29 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5959c2d7-11ff-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:36:28 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a5a88339780so27992066b.0
 for <xen-devel@lists.xenproject.org>; Tue, 14 May 2024 07:36:28 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b015f7sm742302166b.146.2024.05.14.07.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 May 2024 07:36:27 -0700 (PDT)
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
X-Inumbo-ID: 5959c2d7-11ff-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715697388; x=1716302188; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R74w2d5dyci9/kJ/yEsGNOwynJklK0T+h9hxLHHyfc4=;
        b=OauMrxLf1Zc+sU9HLoRQCKyD70zNokQHoPVVVUJHd4+IXjGjvGyMhVsR6zwD1hoDxF
         gDPesSTkY0Plc9s7yUe8kjOdUoJyOYkkk8IQltJ/YqiAlor3MFX5xJD5d5X8DjFhGAyF
         qwz1/JXKi/cpIU1t0B1KaIOn1+myHwtiKqRLzbv0w37fM7pXRKzBJ7DIGdAA3J/2xucr
         vi06Y9A2p80xdssVGAw3gHVQW7WA3st68A84Weky758es2Rbg3NDvIHIzD+rmzi3QFNX
         L0c8f+/NTueIhypUNkOWHji50LuRBZNtgdXm0hKXJjF3+MZdWoGMESwIR7PcOZMoGsHy
         8USw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715697388; x=1716302188;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R74w2d5dyci9/kJ/yEsGNOwynJklK0T+h9hxLHHyfc4=;
        b=nddVNhsYJCiggO/f7auQYoxcRry7o2C0VQBpg+9L4lA68n4EvSdg2jhfvy5g7vndOL
         ddzG1nzo0zHeK9VMu/exil8o2SYfoP/z4tu6N//vQKGhdN4gRGwA+YRkAAU9ZujmpWwD
         /YpG91hj+ts6CEPsJGZ5b0nYtC2U1/mDPq26Mmmoh0iiyep8wc4JUjY/QJD/omhYgXAp
         MQopQsP/AAZ9l36rx3kySbdB32xouClw0F83QSnqKPjbPwdjIMqeR9UzkoFOXdX1EV6e
         kz7AJ3StLQiyVdQcJBnW49EpJ35tIPrDRlT3FBvSRd8oC6WBTdFIZh3irP719uSACM02
         im3w==
X-Forwarded-Encrypted: i=1; AJvYcCWuLBopGNQYi5qDgSGmBJhwkKaSYtRznce6Myxv1brmsb/Bx301eMIXxbvo5yngTTTwbJgtVfW4Gvv/dAgCvbfmvHNpyGg4mNk+Ce+DdfU=
X-Gm-Message-State: AOJu0Yz8K9oGuFwtMYb/JIOVaEXMemojo6FgLW5Bplka4P8EVy6kWk2n
	2P+zKGJY5hHEW5+8xdxpb2+WT6AYpwsNqGMBqQxnZ6HLtbH/T1XBzuNFbzLzrQ==
X-Google-Smtp-Source: AGHT+IECD/gMxXe/ZZrDJC1Iapv1M6ue7FFistrCUcnDIGGRHXpvKSW6qNoIZB9hbH2DcZf0NxdZbw==
X-Received: by 2002:a17:906:7f8a:b0:a59:b6a8:4d7a with SMTP id a640c23a62f3a-a5a2d5d3d22mr854441066b.43.1715697388166;
        Tue, 14 May 2024 07:36:28 -0700 (PDT)
Message-ID: <05093548-7cd4-4969-825f-c40fee6d7879@suse.com>
Date: Tue, 14 May 2024 16:36:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2 3/3] xen/x86: remove foreign mappings from the
 p2m on teardown
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Community Manager <community.manager@xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
References: <20240508112323.38946-1-roger.pau@citrix.com>
 <20240508112323.38946-4-roger.pau@citrix.com>
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
In-Reply-To: <20240508112323.38946-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.05.2024 13:23, Roger Pau Monne wrote:
> @@ -1043,7 +1045,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
>          break;
>  
>      case p2m_map_foreign:
> -        if ( !mfn_valid(nfn) )
> +        if ( !mfn_valid(nfn) || p2m != p2m_get_hostp2m(p2m->domain) )
>          {
>              ASSERT_UNREACHABLE();
>              return -EINVAL;
> @@ -1068,7 +1070,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
>          break;
>  
>      case p2m_map_foreign:
> -        if ( !mfn_valid(ofn) )
> +        if ( !mfn_valid(ofn) || p2m != p2m_get_hostp2m(p2m->domain) )
>          {
>              ASSERT_UNREACHABLE();
>              return -EINVAL;

I wonder whether these two hunks wouldn't more logically be part of patch 1
or 2 (probably not 1, as at that point the assertion isn't quite correct
yet). Then again it may be as (seemingly) unrelated there as it is here.
Thus
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

