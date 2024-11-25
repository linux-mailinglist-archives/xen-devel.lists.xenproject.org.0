Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65E49D8541
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 13:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842478.1258004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFY28-0005RQ-7j; Mon, 25 Nov 2024 12:17:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842478.1258004; Mon, 25 Nov 2024 12:17:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFY28-0005Pu-4d; Mon, 25 Nov 2024 12:17:40 +0000
Received: by outflank-mailman (input) for mailman id 842478;
 Mon, 25 Nov 2024 12:17:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFY26-0005Po-Qd
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 12:17:38 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 411bc4da-ab27-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 13:17:36 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-382423f4082so3087366f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 04:17:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349ef99e7dsm41653405e9.2.2024.11.25.04.17.34
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 04:17:34 -0800 (PST)
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
X-Inumbo-ID: 411bc4da-ab27-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzUiLCJoZWxvIjoibWFpbC13cjEteDQzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQxMWJjNGRhLWFiMjctMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTM3MDU2LjA2MDIwMSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732537055; x=1733141855; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wj4oi9nBII6PLbwfcW4SNmieD45YE6m6L6T2OV8DT6E=;
        b=WC6HXFz/yU+RHz9gsNtfPzy3WzaETUL1LaQl8PZp7ZGXS5eahVNHnqFQ4q0+xMYdNJ
         TP2kRNAiQRU/66SzJdHpU3PkDlt0lgksCU8rKRl9C6nCTMEOgzEupvGnHbKfDBh3uyxU
         VmYjNq0mewsfysWobOymuZbriK1kKXTlKIHqyA4lZmUXkokaU/lfKP4YdIKpZpfdvhHR
         92XInIwzStRuiDDsb5WxA5YIzZxZ9H5XECTgLwC0gX5ckTQJowWGppoTa7Vhld5LajKg
         TJmK09L3LHpiNUR+dzq2iRO+LmPkRjvS/0OhkZKwskDByglEBuDK6jD5bTWHV73IC3jE
         SwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732537055; x=1733141855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wj4oi9nBII6PLbwfcW4SNmieD45YE6m6L6T2OV8DT6E=;
        b=GMXL2boe2PE6010BuvScFij/m37Ea37mrdRoSnpn/+ui0RJPNc4VGd25KTi9auT/3g
         YnfaXAPAhuNWjED8pmnzGp2q3o/LN7W9AOm9LD3A+RMAbaZ5MUz9tC8dV9O/pWTXkoC/
         15+cJ2uVGRoorWsCiwIWBBafDC5IrVb6MHzj7g0prkTYTqxIn1g3Sop8+GPqH77KUaBl
         jajH8/lrqxBpbiFOz54d5GhQNkK5/AcskSxpAQwjlpYsgbrQU1+n6FkSp/q271xfzwzh
         WT66AZAQz2cbTZuYRy6V/9DSPbH2iVhYKsP4d2lspyWafJN+qQhh+HdwYfv4gD203jRb
         PLTA==
X-Gm-Message-State: AOJu0Yx3LXUv6Vcmi+afrAG3IXVF/I7f+dGElLLUOemK/M3LVDtuneaF
	H5O9cphMtkQRBiflitnJfE/tvpJxbgyivy2uWgs76tShO4uge8JeqmqhgGq9+8z4UOOSp9fcFWg
	=
X-Gm-Gg: ASbGncteQmMoGM2OXgubwEGUIpG9rzvEPMx4wugABRnJNNP8HBJKAHIztc3K5w5DOzX
	CX4qsU+5MprMbNn8E78b2Cnl7XuNkBiVS+mLNE3ebTlxN6QIA2vv9YQ4OAYaFwWrYd9Op+wteU/
	rDcKSTlOe8EC1gAfxREKzrwTcXo5VKvl+zHjWk9dZtw4SWbtNNOq2tBiO7YMymAInLwvsmrbrjx
	5SqYfC1O/1CXpB2rvdWbx+wercOqzpdsXv31y84VzxlvqN1A8qZEllS84T67aD+jSYdAuB5y9Oe
	l37wPm/uBwXb58xSC2bExlshQSvu1LP4jmM=
X-Google-Smtp-Source: AGHT+IHsWy1DxN6dxHv1d703qvEHyPb/b8HbjVDgLgbhYwC4GuJr6q+n8tcImz51w+REd7r2qKl0Mg==
X-Received: by 2002:a5d:6483:0:b0:382:3c7b:9ae with SMTP id ffacd0b85a97d-38260b589d4mr10628018f8f.16.1732537055222;
        Mon, 25 Nov 2024 04:17:35 -0800 (PST)
Message-ID: <9ad17178-b6c9-4aec-8f67-7f1db1a85276@suse.com>
Date: Mon, 25 Nov 2024 13:17:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xen | Failed pipeline for staging | 2e853c19
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <67446a18cdb7b_2e311cddc121912@gitlab-sidekiq-catchall-v2-65d69c5784-4rjws.mail>
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
In-Reply-To: <67446a18cdb7b_2e311cddc121912@gitlab-sidekiq-catchall-v2-65d69c5784-4rjws.mail>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.11.2024 13:14, GitLab wrote:
> 
> 
> Pipeline #1558962580 has failed!
> 
> Project: xen ( https://gitlab.com/xen-project/hardware/xen )
> Branch: staging ( https://gitlab.com/xen-project/hardware/xen/-/commits/staging )
> 
> Commit: 2e853c19 ( https://gitlab.com/xen-project/hardware/xen/-/commit/2e853c19204e2d660a8becf4b377cc99216854dd )
> Commit Message: xen/common: Move gic_dt_preinit() to common cod...
> Commit Author: Oleksii Kurochko ( https://gitlab.com/olkur )
> Committed by: Jan Beulich ( https://gitlab.com/jbeulich )
> 
> 
> Pipeline #1558962580 ( https://gitlab.com/xen-project/hardware/xen/-/pipelines/1558962580 ) triggered by Jan Beulich ( https://gitlab.com/jbeulich )
> had 1 failed job.
> 
> Job #8461870351 ( https://gitlab.com/xen-project/hardware/xen/-/jobs/8461870351/raw )
> 
> Stage: build
> Name: debian-11-riscv64-gcc

ERROR: Job failed: failed to pull image "registry.gitlab.com/xen-project/xen/debian:11-riscv64" with specified policies [always]: Error response from daemon: Get "https://registry.gitlab.com/v2/": dial tcp: lookup registry.gitlab.com on 127.0.0.53:53: read udp 127.0.0.1:53667->127.0.0.53:53: read: connection refused (manager.go:251:0s)

i.e. nothing on the side of what's under test. I'm afraid I don't even know
what to do in such a case, to get things moving again.

Jan

