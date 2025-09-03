Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBABB4260B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 17:57:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108679.1458739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utprP-0003MG-Q3; Wed, 03 Sep 2025 15:57:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108679.1458739; Wed, 03 Sep 2025 15:57:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utprP-0003Jq-My; Wed, 03 Sep 2025 15:57:23 +0000
Received: by outflank-mailman (input) for mailman id 1108679;
 Wed, 03 Sep 2025 15:57:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utprN-0003Jk-Vx
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 15:57:21 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abe004a9-88de-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 17:57:19 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b04271cfc3eso2873766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 08:57:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047041dddasm117554866b.72.2025.09.03.08.57.18
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 08:57:18 -0700 (PDT)
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
X-Inumbo-ID: abe004a9-88de-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756915039; x=1757519839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+PObKb1FnC4BE7oEyeS20MPHFCGs0tmF52fixtQUq4I=;
        b=X5sajX6gwaQGYCHYgpsfz6+JPpp5A2KsoRd5Uztfr+bpfrDFa/eDhhCGTAhp5Pulh/
         PzUsp3gc2vfknX4sHcBQlT8NsfOC3ITSMI59hfEdalAG8lI+Ofautrc9Q/mFCHziPJKb
         p6HRD9dIgCjucXSs2XYA7xTnPbH4FXEaDiF84t9iogC083dAEY8LGW0Ix/6x5vknjMIP
         RYqAygx51+tlywfU6sYHtONOHaHnLyL+iaJcvGcia0ECGp9uv9C7ZQzla0DglUBMRpvN
         pXYjAeI8632oXRNV23PfIf5/YLER57YvmlBe9oPtt7OX0Zdc3Grwr7RgSxdPNP4ImZiA
         USNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756915039; x=1757519839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PObKb1FnC4BE7oEyeS20MPHFCGs0tmF52fixtQUq4I=;
        b=JrvDNMyZElKKNH5aOO++nkgvdSpizoXN0G/iB6ZnircccMqCXdeBxXUIKDTC66XHW/
         LDPk7hg05WYqy9/faHQS1PC++1UaMDmRZARur8mVU4M84SEZH2Hp6efqfh442agJk7yy
         x3IcZdiIqfKDYDZ0RBwIPnUNmUDBQgdGInlElOsAqplTKJaure2g5DfIAiGZIMv6teSu
         iFphipam0q7Op1PWRrxxpnl/Ikzt20dm2qnN4unW70jVEKR7+1KiKhG6N+Wkb/RTGmRH
         f+wGpePWu5sX8rpaX22cDuCLAK0daIJPgOi5swV4gIF/O1EnQIH4rF+5YJOzE1F6r8GY
         jd6w==
X-Gm-Message-State: AOJu0Yy3g1RBiS6sq4WyTMWs/isu8XViw8Ux8jbNu+RpxdJIKnlFS8mm
	S9btRRCFNo9e4OQE6rHruNoyR1z0xXnIhf94+62KxoZ8k662/RcAVkB9sd6XscEvMnshPUQJ4q3
	Paxc=
X-Gm-Gg: ASbGnctG18oPsw3uJQkrdntVlkEymyXRA3Ev3kzhVNFRki87u/TDdJxenmZXuvXVGaq
	NX48hDQIkslhA+Tt7djSwnlgqh8jB6QYUdB3OxQvH0976SRn4HmJ7pNQhgY7r+LhDA4rB0jMLHM
	6UbdYoEHt/5AeF05afVE/GNzvxVDQbUyqoDz0VjMZEa9JvNtAf3LA84xlg8JwOy4E+61DuCbkoU
	g/eTDj1GPAK8prBPmvrF2MsaQQmy5oIB8fd2mVxc5CnLnQZffpj5Q+r/7HJhniyp3JBukYy0f6e
	pRv9c6aPCVVjBcdsbvuqP9s3rYTW5bw+kqzgtFUVgjvZfYwquWJVyUGa44+GU4D/HGnD65lRkf7
	CiOGx1ALf/gHNskGXtonfSTlPB/Nm/gRyX/PYBC6/GdFZ6S2jgiRg+MZWAiRPdIlVsxp1ZbLhTE
	/XkbkFxWM=
X-Google-Smtp-Source: AGHT+IG7y4UydNtACL/2wsLnjvEhpHg/k9mPG70wHgfhNT8ZiHTOchCiSw9RkMoWGaerURFpFxbJ7w==
X-Received: by 2002:a17:907:3e11:b0:b04:65b4:711 with SMTP id a640c23a62f3a-b0465b40a87mr400583566b.57.1756915039128;
        Wed, 03 Sep 2025 08:57:19 -0700 (PDT)
Message-ID: <e817c472-5c62-457c-9635-7aef6fadbee2@suse.com>
Date: Wed, 3 Sep 2025 17:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging-4.19 | dabd7193
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <68b85acabf772_2ce5982c10997@gitlab-sidekiq-catchall-v2-5996545549-5wvcj.mail>
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
In-Reply-To: <68b85acabf772_2ce5982c10997@gitlab-sidekiq-catchall-v2-5996545549-5wvcj.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.09.2025 17:12, GitLab wrote:
> 
> 
> Pipeline #2019389649 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging-4.19 ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging-4.19 )
> 
> Commit: dabd7193 ( https://gitlab.com/xen-project/hardware/xen/-/commit/dabd719321b652286b9d0b0c23e29c8427eb7da5 )
> Commit Message: x86/gen-cpuid: Fix debugging for cycle detectio...
> Commit Author: Andrew Cooper ( https://gitlab.com/andyhhp )
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #2019389649 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/2019389649 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 1 failed job.
> 
> Job #11232025215 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/11232025215/raw )
> 
> Stage: test
> Name: qemu-alpine-x86_64-gcc

I cannot make sense of the failure, and hence I have no idea what to do. Is
the perhaps another root container issue?

Jan

