Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B623E89647F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 08:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700303.1093228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rru32-0005MI-1C; Wed, 03 Apr 2024 06:24:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700303.1093228; Wed, 03 Apr 2024 06:24:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rru31-0005KC-Ut; Wed, 03 Apr 2024 06:24:35 +0000
Received: by outflank-mailman (input) for mailman id 700303;
 Wed, 03 Apr 2024 06:24:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rru30-0005Jy-85
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 06:24:34 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d54311a7-f182-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 08:24:32 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4161eb1aea7so7472985e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 23:24:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c4f8e00b0041493e21844sm23544947wmq.27.2024.04.02.23.24.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 23:24:31 -0700 (PDT)
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
X-Inumbo-ID: d54311a7-f182-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712125472; x=1712730272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eU4Kvxa6S2lNftq7OIqQb8wRacONrsh7tQKm0bDHwbE=;
        b=HVRlrO3N79X8l3L1NA8M4cQ4Z/agbYccavcwJyvKGuU4azIwP2GSYVt2bHkk+QmNX5
         +B8fmzE9vIII4TQESLHeOPqbCoqvPDCqdwxlcSaJxxJ5WiJYfLl/LjrEBOLS+3wfc2d0
         epU7RucEqs/WtDhE68XHvQfXjcjYC5aBrEMGzMHTkQU7fluBt6htc2J1L+HKJpmerMd9
         YPIHxWREgpjBT+9/Xc4tLhvSxyUHK1wWKlgWDO0E4YUxknpv0Fn+ui9M4CdFxvlqeyHy
         m6J/gN28bsUTwpRmVqJ2ANa8k49ftxD+Y9EsQ/cZv1I6ZJ3KZXq6J7MvEUuC14UP+Nmt
         xhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712125472; x=1712730272;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eU4Kvxa6S2lNftq7OIqQb8wRacONrsh7tQKm0bDHwbE=;
        b=ZAubwShLh7USJRmpDR/h/B0UoTssFctIxBVES1iER6sLESvbKY/AhwDCLkqmOeZ9I6
         lWxZdX6tP9zwglRs3MpnKorf020OjaoVj706GoyClC653rqS26vB0HtvmhRGVeyZvMtP
         G+hxk9cezZlAkZ2E++PGJAwmyNj40mKQ3lh+vJa2WkRK0t4VYdJiqeUVFaPDPn0dVzyM
         HRjPHU+O5UItAnSPOagrxFdf/CAHld+ExF3J5qYVKvkqmy6u/Wdjeurp9a4ucC9rhnkj
         vtPZxV1lsnw84hSy3hANYwabSH1ScbDzGBteKup45plpF9Jci9f3+e9ep4vuBidw56qW
         bxLw==
X-Forwarded-Encrypted: i=1; AJvYcCVaDngMM+SgkTKsxzHhQdPKzp2bMo4Lfj2LBlktLfQvur02KtF4t7iZleNYjm/0X+t47fHpx3Fjx8ihKXOcrwbDyr/SaWqna2v52eelXiM=
X-Gm-Message-State: AOJu0YwG3qxYOYN9fMJKIdYdzd+q/ymSfuZzKa71BW8ehsnvH2HGhhs8
	axS8RY59VXgmJiaROGyvk/i+DX4RIKsS1mDfOPQuBiFW7+cN4GZHBHJ15jV2hgfT2d8vPKF+3NI
	=
X-Google-Smtp-Source: AGHT+IHk3Bvj39nBCbfEToUPc+0SIJliAThkkQCc1C92nP+WtUzRw1knSc/6iRFQ9OcEcLXSwoQ2Jw==
X-Received: by 2002:a7b:cd96:0:b0:414:8870:9c1a with SMTP id y22-20020a7bcd96000000b0041488709c1amr1341950wmj.7.1712125471853;
        Tue, 02 Apr 2024 23:24:31 -0700 (PDT)
Message-ID: <efc51a75-b9ed-42f8-ba89-e4f39554a830@suse.com>
Date: Wed, 3 Apr 2024 08:24:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 2/7] console: address a violation of MISRA C:2012 Rule
 16.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1712042178.git.federico.serafini@bugseng.com>
 <c1dbd9f26ad88f667075926e85dc971c41c7d5d4.1712042178.git.federico.serafini@bugseng.com>
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
In-Reply-To: <c1dbd9f26ad88f667075926e85dc971c41c7d5d4.1712042178.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.04.2024 09:22, Federico Serafini wrote:
> Add break statement to address a violation of MISRA C:2012 Rule 16.3
> ("An unconditional `break' statement shall terminate every
> switch-clause ").
> 
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



