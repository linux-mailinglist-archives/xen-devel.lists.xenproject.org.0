Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FDF8B1E8D
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 11:56:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711974.1112334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvpN-0004hr-KO; Thu, 25 Apr 2024 09:55:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711974.1112334; Thu, 25 Apr 2024 09:55:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzvpN-0004g4-HM; Thu, 25 Apr 2024 09:55:41 +0000
Received: by outflank-mailman (input) for mailman id 711974;
 Thu, 25 Apr 2024 09:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hfi/=L6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzvpM-0004fy-98
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 09:55:40 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7e1f83c-02e9-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 11:55:38 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2def8e5ae60so3863201fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 02:55:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a05600c4fcc00b00418a6d62ad0sm30713845wmq.34.2024.04.25.02.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 02:55:37 -0700 (PDT)
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
X-Inumbo-ID: f7e1f83c-02e9-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714038937; x=1714643737; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2D/762vZr9G5mJsuzf6YUG3HLnJNaathPwEm+iHlOu0=;
        b=PZTpW27ZAfIc2I1fLVVqpTRrER2uTKAtZMBePRgYV7Ox+5JoHe8ZqcZK5XibVoHN+q
         No7g6+IfuMMG73OKLW+bxgJEVLCyafDY5psycYAJH2TsOJaBw38NKE/dKrewKbwV16Tv
         kuuuBEYadm5lKp5+pJfmI3fUbKYd5hIIVf476+crWUwjiYZaaMrNKPj/iafDe3Vm40co
         3qs2++EidKFTwfkOcaxJaEd9GjMphg76dKD0ggBGqUU16WfgZVkekPktLBw3J0sF/LsU
         bMxt7NUp5Dr4j/yE6+MZvg8WetY3vQQz/KPRMWU5Cs++jJiiKY+pNwfEQB0/yfY4j4Dc
         dN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714038937; x=1714643737;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2D/762vZr9G5mJsuzf6YUG3HLnJNaathPwEm+iHlOu0=;
        b=XFnilzr/stsDj6lMitR+DD9EqYiFgpVuqc2ns1ufmi/Znl9CQ0oGD835WLfucTfXbp
         /Nn2c0Wr+MF2r0Pg5au/YC5sCE/panHkp76/4V3ZZkVxu9Hoh7IUgFfzhzadvARZjNGr
         dlBwkXk6mhqF8HLh7H4pnSw221Kmz2m6HwrTDV3wSkuZvQWmK2o4OGCOSdRJT8k5At9h
         UU/bexnVPzCRnGo71cBMqaSdnWQ3SVlUQUEJC14tJ2J6VSEFs8gZmEnTUhPHiP6gNg4R
         9fHghfNF3AyhYsxnSy/F+FltuVB0EY9y+dcFJPFFqFe05zeWtLlqU8EXsG1uqm6C38nl
         cZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaOq6GA1j+oitHq2FIIBrgGpmxQintKUZb5eTYM1UwgXkntno6QJXjOoT9Oe9gETsM4heq35NRfMeSEnOyEVZYEeyw6MasCdAfSO1NUnA=
X-Gm-Message-State: AOJu0YxeXInE8up2Vzsv5i1WM5pthgg6hbzh98rd9NDBNC93maoWcuVL
	KoaeI8VGddK/VKLrUBKe+YNYG8mb3RlWqNUS+aTackgQO4exLqDncrD24T/xhw==
X-Google-Smtp-Source: AGHT+IH3CctDgGczeJc+ddlV3/GYRyXiWMUq172SPWHD+FAjIDdvMQBuFO9KQzUzXDmGBfhjRMcY/A==
X-Received: by 2002:a2e:8611:0:b0:2d4:7292:92c0 with SMTP id a17-20020a2e8611000000b002d4729292c0mr3184556lji.20.1714038937597;
        Thu, 25 Apr 2024 02:55:37 -0700 (PDT)
Message-ID: <0c24ae5e-3912-4396-bf0c-6b60a3ffaa36@suse.com>
Date: Thu, 25 Apr 2024 11:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] svm: Fix MISRA 8.2 violation
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@cloud.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>, xen-devel@lists.xenproject.org
References: <20240425091249.2639809-1-george.dunlap@cloud.com>
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
In-Reply-To: <20240425091249.2639809-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.2024 11:12, George Dunlap wrote:
> Misra 8.2 requires named parameters in prototypes.  Use the name from
> the implementaiton.
> 
> Fixes 0d19d3aab0 ("svm/nestedsvm: Introduce nested capabilities bit").
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



