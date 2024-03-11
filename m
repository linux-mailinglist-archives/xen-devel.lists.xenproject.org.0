Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A59877DF2
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 11:16:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691367.1077284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjch6-0004Jx-PU; Mon, 11 Mar 2024 10:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691367.1077284; Mon, 11 Mar 2024 10:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjch6-0004I3-MD; Mon, 11 Mar 2024 10:15:44 +0000
Received: by outflank-mailman (input) for mailman id 691367;
 Mon, 11 Mar 2024 10:15:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZVPQ=KR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjch5-0004Hx-3u
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 10:15:43 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4eb46285-df90-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 11:15:38 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a4627a7233aso117115566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Mar 2024 03:15:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s13-20020a170906168d00b00a462bd5ddcdsm628573ejd.144.2024.03.11.03.15.37
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Mar 2024 03:15:37 -0700 (PDT)
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
X-Inumbo-ID: 4eb46285-df90-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710152138; x=1710756938; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bk9VSZLSe3R6ckTqwWmyIGqBXh5+oRT91UuzhN+BqNw=;
        b=esbu3LBnCO3geLd53IzVwjm3mnmZ0BielgG8zmt4wHrIVxs583ovdlxrvB8+zZI1bF
         iUg915JAFYcv17gRCX9Pj+nf0TR58K4JgkEmMEHRA9NKB9Lm3dtDiquUBPFCdi+lLP20
         277FeWfgt1oHHlkYk8nucRtNOuuHgvv3Vst2v6XpMd97LeW/EcytFO1nR5KHmsqNLzNE
         FR5IZ6QXVwV0dYNXVTqJ/06uziTBZ+Zje4fjr+0xY1F2HGbamSGXXKtT0be+RVwJueUk
         piz0y060OsAkuZzB9QbSWq5Ia9LwxcKS5MSx84E7hVgkzBgBIzIsDytanxhnsFrAFoBk
         SS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710152138; x=1710756938;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bk9VSZLSe3R6ckTqwWmyIGqBXh5+oRT91UuzhN+BqNw=;
        b=p4C717GpbYb9r02tNHX7l8F44itTFxbB1gF10SQknM4lU70yT73Yi0/iKLUIllkEkw
         ZgYo1uvc41umOl/IMEdpiV+1oXmSM1Rft+d15OgPW/zsKkEoqamQiPc4NBMPBBMiSyMf
         uGv37EnQANiv3WyyQPcmruNoEzpnUnRxOFj/vxUYKUzHiX/1Jbo/D1A5jhpTRgkBVX/z
         PIcmnbvXtpB9GdNJFroKP85xOxAmhQfR3MxCqh2PA7mUspgZdFouu1bxH6vydJ5JPFo2
         xfdQi1DALoLO5Pgh9PNwcyKYYWixeibGPdCIBiBfmjQ/1pLLZVYLWPjQVXofCILRzF3t
         sTKA==
X-Gm-Message-State: AOJu0Yx3Of36z/annkXGgIHJ532zgMUdkoBnD6NgZ3Er+rF/FlA7JlwA
	u7Z/aCDUU7rfzhGqRl9OpSc1pcFDMQNk/vJMw9e8JOlWKvACDptw9Og+Q0ZstMauRAK9O7geZcs
	=
X-Google-Smtp-Source: AGHT+IHUGlC6fFcoD0e/UZ+V0xepMb/URTdzXiC4Vvv4hMauGPxqDfa6pVD2QssNXhVAtRE4rxucsw==
X-Received: by 2002:a17:906:c290:b0:a46:1f8f:a0b0 with SMTP id r16-20020a170906c29000b00a461f8fa0b0mr3087757ejz.13.1710152138023;
        Mon, 11 Mar 2024 03:15:38 -0700 (PDT)
Message-ID: <55f7b5f5-0f0d-4c80-aeeb-a2e8f22f1197@suse.com>
Date: Mon, 11 Mar 2024 11:15:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | e90089db
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65eed65856f57_2c8a520124653@gitlab-sidekiq-catchall-v2-df9f7d5b4-ts6r7.mail>
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
In-Reply-To: <65eed65856f57_2c8a520124653@gitlab-sidekiq-catchall-v2-df9f7d5b4-ts6r7.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.03.2024 11:00, GitLab wrote:
> 
> 
> Pipeline #1208433952 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: e90089db ( https://gitlab.com/xen-project/hardware/xen/-/commit/e90089db3fab06dc8947fcd64f1ed54569e708a6 )
> Commit Message: arm/smmu: address some violations of MISRA C Ru...
> Commit Author: Nicola Vetrini
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1208433952 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1208433952 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 2 failed jobs.
> 
> Job #6362049499 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362049499/raw )
> 
> Stage: build
> Name: ubuntu-trusty-gcc

I'm afraid I can't make sense of this supposed failure.

> Job #6362049553 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/6362049553/raw )
> 
> Stage: test
> Name: build-each-commit-gcc

This one simply timed out once again, for it taking too long to build a
dozen commits in non-incremental fashion.

Jan

