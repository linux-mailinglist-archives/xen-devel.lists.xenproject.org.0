Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CDEAF0CA3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 09:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030356.1403991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrwT-00013Z-Dz; Wed, 02 Jul 2025 07:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030356.1403991; Wed, 02 Jul 2025 07:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWrwT-00010T-Ab; Wed, 02 Jul 2025 07:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1030356;
 Wed, 02 Jul 2025 07:31:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWrwR-0000zB-Re
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 07:31:39 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 96bab5f6-5716-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 09:31:38 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a528243636so4049545f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 00:31:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af54099b2sm13494463b3a.28.2025.07.02.00.31.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 00:31:36 -0700 (PDT)
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
X-Inumbo-ID: 96bab5f6-5716-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751441497; x=1752046297; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lNS4gJBEWEUPalkGv9qjNrUUGdEP7QBeYWe5FdzsiFc=;
        b=fXf43prlBgLTIl+1A1rzNn5NV8QNz3lbnkaYuZmpM/goCcrvNDYQNdD/AVMamppz08
         OaFpSX4svdGxIyg/7YmtBA40UFHGxRKlGLrTyent+tPiRocqebI07x2eHzQ5aOccyQZx
         ZVjd2g+imiI84w7/X0Anjy5/QRaRtsLSoIuH8Kyg7eOJXyeP9phHku/c9ytVSJmL4auo
         ZuatlGpwktXZL3i33C8RoEM+VXAFtO0wNtcg8XbC5xegNXmXwDToHqMgIrgGautUr+e5
         gZj+RAHc3O7Eufds1lkA4ojQxbofFNcPDZllVIm98WIykq7sHv9aY2iwmSGaEBnjy18d
         SeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751441497; x=1752046297;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lNS4gJBEWEUPalkGv9qjNrUUGdEP7QBeYWe5FdzsiFc=;
        b=iYWa89meNnY9SZera/lB9xefDuImBS0tXVRpOVCKkh5z7IBryEWUEASCoMa0fEc0+T
         PO7BhL+xxF35Jb+T1f1o7MoXZ0pDeOugwgzHz7tmLnGKwMQpkHFEFg1yiShti8pxduBu
         pmtrI7sxO7mTlh3wDdUD4+1PoyHz8W3riX5LeE70HQTvGsLeKIdf4VVWNU+qZXeNkTt4
         vk2dtxIR5W0WBaHCdsy34NFQAeqqf94sq8wfS5WUbtlVUCTMnd9+Yulc7OwbsrbwjBJe
         tqShDv9oXbFNEAwysA5slQotLmQyzurSwpsSGLgK4qAuWOYCoYaS4r/o8qfTuMDTz1Tb
         HkWw==
X-Forwarded-Encrypted: i=1; AJvYcCXamPCkpopW6FtrnqEyCkcnS7MFNzJN787p5kS59rI1XXX9bfP4mWu2UlJjVs5OGYGnnsXuZhRM6kE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFPogTjMhY8srdKJELpL4UaJRKC/Of6IPHU5KzAd+eSbuv8llB
	mvrOspMwPHEss5qN/RRReEeiTqZGVKCDhOXQfO8LkmHEKZqLF+qtFpfIyhkctIV5dw==
X-Gm-Gg: ASbGncvBqhySDnHwiyeTasobe7xsmcaRCgdWginBWaQ9wOA/frEataJz9kqmedLaBhR
	kyhgZ2ppbgdY6pOS+FgIyk/hXAwEJPxBGrvqcKI1MqPZnS0QM2mKu6KBcXiLClDM10tVgQLalxW
	Hp9NbI4g2acq4PCE50wqSyWzPqsH96yL/CIkh2WjFcFcl+hPj75vR6l8tJYflYf/P0ZhiD3oK05
	W4uQlKag7hDqo1gJPMaxLbvnAKLLQvHykMD2E3tU3gOqwYSUl9GcNFKfer/T1rP8i5P4reNA4i5
	Tsj3tQYV2EwyZCtrQ1pVjWX5kgM3O6kMP4KGKgrM5XAlpz7qv2tUBdBdHr4RIr6UWPEduyO3ttI
	kVgdD8AY1rpIpU2ejDh1epyXdY+0QGWccjeTD/JSYFkdp5+E=
X-Google-Smtp-Source: AGHT+IFNbt7Ta6oecizY4TqzHqv3DBLUukxguihSCitfb28xtweSrspumXpYQoraKH9E2qxTavz2/w==
X-Received: by 2002:a05:6000:2c12:b0:3a4:f663:acb9 with SMTP id ffacd0b85a97d-3b1fdc2054dmr1169292f8f.9.1751441497260;
        Wed, 02 Jul 2025 00:31:37 -0700 (PDT)
Message-ID: <3c1e7055-a107-4f44-ba6a-986d70ebae06@suse.com>
Date: Wed, 2 Jul 2025 09:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/7] x86: Make MAX_ALTP2M configurable
To: =?UTF-8?Q?Petr_Bene=C5=A1?= <w1benny@gmail.com>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Nick Rosbrook <enr0n@ubuntu.com>, George Dunlap <gwd@xenproject.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, xen-devel@lists.xenproject.org
References: <cover.1751397919.git.w1benny@gmail.com>
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
In-Reply-To: <cover.1751397919.git.w1benny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 21:54, Petr Beneš wrote:
> From: Petr Beneš <w1benny@gmail.com>
> 
> (This is continuation of the v6 series posted a year ago - apologies for the
> delay.)
> 
> This series introduces the ability to configure the maximum number of altp2m
> tables during domain creation. Previously, the limits were hardcoded to a
> maximum of 10. This change allows for greater flexibility in environments that
> require more or fewer altp2m views.
> 
> This enhancement is particularly relevant for users leveraging Xen's features
> for virtual machine introspection.
> 
> Changes since v6:
> - Rebased on top of staging
> - Added missing Acks/Reviewed-bys where appropriate.
> - No changes in patches since v6, with the exception of 0004: xen: Make the
>   maximum number of altp2m views configurable for x86... which was the only
>   patch that was left unacked/not reviewed

Not exactly: "unacked", unless further qualified, generally means "some
necessary ack(s) missing", not "there are no acks at all". Patch 2, for
example, is still lacking a Go ack. (I didn't go any further than that,
yet, so this may well be the only missing one.)

Jan

