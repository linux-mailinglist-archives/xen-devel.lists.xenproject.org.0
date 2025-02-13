Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10286A341F4
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 15:28:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887690.1297158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaCm-0007iL-Vj; Thu, 13 Feb 2025 14:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887690.1297158; Thu, 13 Feb 2025 14:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiaCm-0007cU-S2; Thu, 13 Feb 2025 14:28:40 +0000
Received: by outflank-mailman (input) for mailman id 887690;
 Thu, 13 Feb 2025 14:28:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiaCl-0007Zw-Ev
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 14:28:39 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0d7cc72-ea16-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 15:28:38 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7d583d2afso381929766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 06:28:38 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53257694sm141667966b.49.2025.02.13.06.28.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 06:28:37 -0800 (PST)
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
X-Inumbo-ID: d0d7cc72-ea16-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739456918; x=1740061718; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=upo9G1oAKXT11pLqifh/sKlayg9aSBoAcvrDZi7IqNw=;
        b=CqINZylvjXclHJ1TBt6ViV96BXlco2QB4DLdwEFEaQlidDmQ/Ob+yve0w5OZTlpXO+
         Zv5zM3m5gIPDCU3g92y5JLcz3kUovcSWQdfZjMko8vt8D0pJMQ/Gmowqfbs5Z6FUjcE2
         HnIQWqCfnjQh+1OI/AUb89qzuNzFI2QAD9gA8FqMy5hWJyD0v5de+5O5Rkrvct4efmp7
         nY2QCkwUmlRlGnxc+dLtHQMRC/rNojq2ElRJvXqjmaHZCTD8ZkxppucwPEr/g8dygLBA
         sIB9AoN4HdOxZww1lSeA+BU40L9ofTb7WcKpiqDbj31prkBGGqAp6PKcJVm986ceGV7q
         vFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456918; x=1740061718;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upo9G1oAKXT11pLqifh/sKlayg9aSBoAcvrDZi7IqNw=;
        b=IDOV0I9XK92CVndNXyn8Q7fZ3aYvLAqk/tCluGbclBHs4+NEmM6zGLXwgqtGwlNjZP
         eqzeEbRydSCFYi8yXhWpXfwTBjPfEmWx08BdZlBDAlc19QmAJx6TqKgi7f1rzyk8iCIj
         4/LYfB8xVqEvO6Dvi3ZNgcPKePdIv9ZmU+I0JEqkEFNGTEl/tqWNjJK0ctQlCGWPw1vf
         rgx76kyMc26q/ALBiFvG2EMkqtkuBxBsyA678tznt7JbGf7boefzWVgZ5TBbcELLebc1
         mH4Y0GpCEsW+IOkGDiPlrwP53ZwLYK+eu00cZNiAUx2fjool5yhrusKBzmATa3YViEh8
         Ob+w==
X-Gm-Message-State: AOJu0YxDH+GYfBZWACAhyKFdmULM1Qpjb1ibVvD4BgoccDjfL/kYOG2/
	VRDGNCeBqvy/xQIWdoDa52Tg9iPWmJD6fLA9sSu+OeHmMljidWb2HuA8DF2/ezi5Fk/pBlYy5EY
	=
X-Gm-Gg: ASbGncvHG4JWkAOd9zz9k7/K6Pl2PQbPDq29tk0sBRnMZLCeq5SkhxjYESWZWX83Ag9
	23pXHkCAWdkZ+RzslH21xVJfjTpfK88J9VlXS2OhfOFjPgHYrxXXCCxRfPToKN0oP0thBpdyTcm
	f9t0UvG89ZIiFlJ4HxmVvIX9+HknvHIdI9ki3N9+d7ebSrw+FymKWa/YXFkiLW1rhve2TMQdlB0
	MtQMzk5cbHrmPYgFLBxuueF5uVzbCrJAl+6eDZrrHcfnGgpQ7sa+dvTv0G65dv9eRgQqjnrugI+
	lIJQeyhca98visYLhMw/4nGzxGooFFzyQyvKX0DVF++jgrdk/iXEO3HEL9VuiPPo7c8KjgwS5UR
	+
X-Google-Smtp-Source: AGHT+IH3/MLcEWwqh8YhUQkL+jQCF+G567XYAn6t+vEA50WJHl2wdl8WdaZ+oQdmizNGBhm/xlr/yg==
X-Received: by 2002:a17:907:3f1f:b0:ab7:bba7:b758 with SMTP id a640c23a62f3a-aba510aedd3mr240166766b.20.1739456918039;
        Thu, 13 Feb 2025 06:28:38 -0800 (PST)
Message-ID: <35e47b81-7a87-4e8e-b8de-ec37a5ea984a@suse.com>
Date: Thu, 13 Feb 2025 15:28:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | b5b2f987
To: Stefano Stabellini <sstabellini@kernel.org>
References: <67adff3bd57c7_2ec97344998c@gitlab-sidekiq-catchall-v2-74bbd94c4d-5p8wh.mail>
Content-Language: en-US
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
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
In-Reply-To: <67adff3bd57c7_2ec97344998c@gitlab-sidekiq-catchall-v2-74bbd94c4d-5p8wh.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.02.2025 15:18, GitLab wrote:
> 
> 
> Pipeline #1669696445 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: b5b2f987 ( https://gitlab.com/xen-project/hardware/xen/-/commit/b5b2f9877a8777af6b78944407527e0a450389a2 )
> Commit Message: x86/HVM: use XVFREE() in hvmemul_cache_destroy(...
> Commit Author: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1669696445 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1669696445 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 1 failed job.
> 
> Job #9129817480 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/9129817480/raw )
> 
> Stage: test
> Name: xilinx-smoke-dom0less-arm64-gcc-debug-gem-passthrough

From the log I can't spot what it is that failed. Stefano, given it's a
Xilinx test, any idea or hint?

Jan

