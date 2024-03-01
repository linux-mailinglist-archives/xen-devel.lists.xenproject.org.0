Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D81E186DCCB
	for <lists+xen-devel@lfdr.de>; Fri,  1 Mar 2024 09:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687559.1071187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfy1B-0000W2-85; Fri, 01 Mar 2024 08:13:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687559.1071187; Fri, 01 Mar 2024 08:13:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfy1B-0000Tu-4T; Fri, 01 Mar 2024 08:13:21 +0000
Received: by outflank-mailman (input) for mailman id 687559;
 Fri, 01 Mar 2024 08:13:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KgAT=KH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfy19-0000To-Gp
 for xen-devel@lists.xenproject.org; Fri, 01 Mar 2024 08:13:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ef67c4c-d7a3-11ee-a1ee-f123f15fe8a2;
 Fri, 01 Mar 2024 09:13:17 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56533e30887so3228405a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Mar 2024 00:13:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k23-20020a1709063e1700b00a42f6d48c72sm1482682eji.145.2024.03.01.00.13.16
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Mar 2024 00:13:16 -0800 (PST)
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
X-Inumbo-ID: 8ef67c4c-d7a3-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709280797; x=1709885597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qj2TOtP0QaYk201sneMG79nt/9riutl94IDNtJJc4nQ=;
        b=ZNOb5Ya/5ax2Hl1xrsYslcbfdbOSi8OW638ZJYDCWddZLzfRhKRyAbdr2eCEt+OMNN
         nuYk0cOwYWGxFXDHmHaUv1CXP1LxStEyoHOcA2MzWV1UqsZInUIl8CRTcmIBhoBugSPt
         u+Svqxn3h2S+k0+XJiz6UvCktURqIHa4m1+x0LMYUedkMne2cWyRGkB4CPpmqRzEvS9i
         JaRExPFKP00hs51wzV+HtXeIcZdM13J/nGdhQqdFT20fele8M1C545fMTbTuJddWqZpP
         hGsHf4o0QxrIIusAmEHi0a41u7lri13qGmNMQHMakDpHZl//bW+9eY8nmz+wj8cxEUpI
         7EhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709280797; x=1709885597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qj2TOtP0QaYk201sneMG79nt/9riutl94IDNtJJc4nQ=;
        b=SATha1n1l490zZFtalMQhZg+30ly0+AKnkXRwxb5zV8TNFqJoaBKpm+aaMNMqbFRxI
         Nj8IjJL2OTbSCewbLw24gz6QhPIFwMQ5qCK3FVzlLwU3zRxfqiBsoUjxLIn7hNflfm43
         5NIHvLA/lmKEQtojcmcf6k7lTe/0CM+09WvjKvctPaeWfC6KUkIkUQ7JI74YelHaaF4Y
         eiLmaRzzFkg+Hj0DDVi3F6ok3erXaCIeW9KU/w0KmaoAPhpbHc8aswinBppEyZ+W/MSo
         OD5aq9zTkt/nJuO092aj+G8iVxGEEdNlntT+JGVYyBIElDDp+jQjFOWWREKhiaAwfJ/C
         1W1w==
X-Gm-Message-State: AOJu0YzHXCTIjTPNAt8gI2u4euB9162edYq2VT19X+0jzCqBPdeTDBAs
	WIWK0G3oy68RLiLot2XSfAUPey2MdL426plVYKPjQkfKU5osD9KFHGLb6+9Cr8A1x+fhAf17zlo
	=
X-Google-Smtp-Source: AGHT+IGRxsuXTZGLZcW43DrY/+D4D8AM/yfIPrQq8SeOINeKQz2+ZIbnPyBtPblM7xGP172VQke7rQ==
X-Received: by 2002:a17:906:f2cc:b0:a43:e1aa:5f99 with SMTP id gz12-20020a170906f2cc00b00a43e1aa5f99mr739627ejb.52.1709280796887;
        Fri, 01 Mar 2024 00:13:16 -0800 (PST)
Message-ID: <a8cdfd40-8e61-4b94-8563-a5bd2a55c100@suse.com>
Date: Fri, 1 Mar 2024 09:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 4cac80e2
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <65e12b62687a2_2c2cb9e3423456e@gitlab-sidekiq-catchall-v2-55cc6d75b7-k4whf.mail>
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
In-Reply-To: <65e12b62687a2_2c2cb9e3423456e@gitlab-sidekiq-catchall-v2-55cc6d75b7-k4whf.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 02:12, GitLab wrote:
> 
> 
> Pipeline #1196428827 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/xen )
> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
> 
> Commit: 4cac80e2 ( https://gitlab.com/xen-project/xen/-/commit/4cac80e22600d5a38d77c65e9a6507c752efc155 )
> Commit Message: docs/misra/rules.rst: add rule 16.6 and 20.12
> 
> ...
> Commit Author: Stefano Stabellini
> 
> 
> Pipeline #1196428827 ( https://gitlab.com/xen-project/xen/-/pipelines/1196428827 ) triggered by Ganis ( https://gitlab.com/ganis )
> had 4 failed jobs.
> 
> Job #6293018467 ( https://gitlab.com/xen-project/xen/-/jobs/6293018467/raw )
> 
> Stage: test
> Name: zen3p-pci-hvm-x86-64-gcc-debug

Considering

(domU) + fgrep 'MSI-X: Enable+'
(domU) + lspci -vs 0000:00:04.0
(domU) 	Capabilities: [70] MSI-X: Enable+ Count=5 Masked-
(domU) + echo 'pci test passed'
(domU) pci test passed
(domU)  [ ok ]
(domU)  [ ok ]

I don't understand the subsequent

[0Ksection_start:1709252523:upload_artifacts_on_failure
[0K[0K[36;1mUploading artifacts for failed job[0;m[0;m
...
[0K[31;1mERROR: Job failed: exit code 1

Any clarification towards what's going on here appreciated.

Jan

