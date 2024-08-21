Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C33959CB4
	for <lists+xen-devel@lfdr.de>; Wed, 21 Aug 2024 15:03:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781129.1190687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkyI-0006i4-Tu; Wed, 21 Aug 2024 13:01:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781129.1190687; Wed, 21 Aug 2024 13:01:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgkyI-0006gH-QU; Wed, 21 Aug 2024 13:01:54 +0000
Received: by outflank-mailman (input) for mailman id 781129;
 Wed, 21 Aug 2024 13:01:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YIGS=PU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgkyG-0006gB-Vr
 for xen-devel@lists.xenproject.org; Wed, 21 Aug 2024 13:01:52 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 880f306e-5fbd-11ef-8776-851b0ebba9a2;
 Wed, 21 Aug 2024 15:01:50 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5bed05c0a2fso5934438a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Aug 2024 06:01:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebc0817a8sm8039087a12.84.2024.08.21.06.01.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Aug 2024 06:01:49 -0700 (PDT)
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
X-Inumbo-ID: 880f306e-5fbd-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724245310; x=1724850110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0AplvF0ppKoObOqwGnY3FZwe6CCQm8OCyHkH7ScmqPc=;
        b=Fn0uTESsUYxF8x6byxzOimxGkaAX/QKp4bZimxirZXuxWU4J6aFJ6yybMZb0TcTpYM
         dtKF5n59R13icDfSJ8XcEmQNTqAWuFq9rMVQzwPg3Vsf5avPZ2Y9eDcv2ZyYuPg6hnT4
         +/NQ6EQ49aMJ/oiSApn0tQyU8lSZ/z83jWSXPSZKNZk7HXjXW8qT6J5ZXoGNTJVNMo6+
         TfZ0ooyGOLvbLJibfQXl2SRbzpva6geYH3f/nq95dul9zd+HWSq1mRKQBHuvS71Vp1R9
         3rKvsx08C09H00YKy3woNqOygO04RF4WsfNePWjEpvbngATu2fht61PY3BOKPEgtWD8i
         ayrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724245310; x=1724850110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0AplvF0ppKoObOqwGnY3FZwe6CCQm8OCyHkH7ScmqPc=;
        b=BA/wfONE2BKBl7QVSulk/vqAGVjxX6TLoBPKtW+Z38Qo8t/b2iQH8g6YbtQ6m42k4c
         USbg0m2ZxVDkznUqSDXg4mwnYMr4G9fUUtiO7jNtMJT7bBaN4O4FQydKYuJCxyApljRG
         OjprrcamRrBFMRbCB3Nl41cPkma5yx4PTUaKMLDK+KP0jSYj05ScReIdUq9ZVIbJ4sLY
         vCOs55L2dG/yqpZQYh8EMmDbtQI7kGLfzg2WP8ZnZBeTDbSLU0jCaMJgzWXLPfSHVnJ0
         gOABzjI4QiR3oJpq698MTpSONXdKzV/3iFkTHeNxB0BU+ooMoXuLADswNd3pFlfo2Bgz
         /CCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvC/1c0z4w+EZ+n/a2Yoqne8E/XXGDL3T599RRlSmfwB7AbR3f10sMJiK/R93YfpNfHM29aN2W6+Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YztFthtM7qfSsO44sv2Q88L2lKYU46eqqExLA0hgGgJ46AZHxH6
	1GdpH44ordseHc9fTNesDqR0Ep34nCeV8rs4S6mFi+ubBxlJbTa+YGtuGDcqDA==
X-Google-Smtp-Source: AGHT+IHFyIxjviEv4J+FIf5OJPWzJrlasPdQ/fiXUrA5pikEKRe6JC5+5d+eZE+Pp86KnGYr55SkEw==
X-Received: by 2002:a05:6402:c4c:b0:5be:9d95:3910 with SMTP id 4fb4d7f45d1cf-5bf1f1d7509mr1703576a12.22.1724245310093;
        Wed, 21 Aug 2024 06:01:50 -0700 (PDT)
Message-ID: <7689a4dd-77af-405d-bee8-b0c03e8416ef@suse.com>
Date: Wed, 21 Aug 2024 15:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make VMAP support in MMU system only
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>,
 xen-devel@lists.xenproject.org
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
 <20240821122503.2315844-5-ayan.kumar.halder@amd.com>
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
In-Reply-To: <20240821122503.2315844-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2024 14:25, Ayan Kumar Halder wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> Introduce CONFIG_VMAP which is selected by the architectures that use
> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
> 
> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
> with new memory attributes. Since this is highly dependent on virtual
> address translation, we choose to fold VMAP in MMU system.
> 
> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
> only support in MMU system on ARM architecture. And ALTERNATIVE now
> depends on VMAP.

There is a mix of VMAP and HAS_VMAP throughout here. Once that's sorted
I think there'll be redundancy in what is being said, which likely will
want consolidating then, too.

> HARDEN_BRANCH_PREDICTOR is now gated on MMU as speculative
> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
> See https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.

I think that increasingly this wants to be a separate change. It's
entirely unrelated to what the patch's purpose is (or else the
connection isn't clear to me, and also isn't being made in the
description).

Apart from this the code changes look okay to me now.

Jan

