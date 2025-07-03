Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CADAF7EA4
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032326.1405980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNcf-0007q3-Ob; Thu, 03 Jul 2025 17:21:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032326.1405980; Thu, 03 Jul 2025 17:21:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNcf-0007nt-Lp; Thu, 03 Jul 2025 17:21:21 +0000
Received: by outflank-mailman (input) for mailman id 1032326;
 Thu, 03 Jul 2025 17:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R624=ZQ=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1uXNce-0007nn-Ga
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:21:20 +0000
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [2001:4860:4864:20::2f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ccab722-5832-11f0-a315-13f23c93f187;
 Thu, 03 Jul 2025 19:21:11 +0200 (CEST)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-2ea58f008e9so191807fac.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:21:11 -0700 (PDT)
Received: from [10.25.6.71] ([187.210.107.185])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2f790209b9fsm4002fac.37.2025.07.03.10.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 10:21:07 -0700 (PDT)
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
X-Inumbo-ID: 1ccab722-5832-11f0-a315-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751563270; x=1752168070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqrAfLoSpXy32SZjGkLSj0+5pbZu4fxfsJ4Y6XSk3jc=;
        b=TE5lB1ncLUifghTmi2YDMtt9SUZyjUiTSllY+uw6uQBjbx1KUmUZFb/s0sX1ZMJjBR
         5O0zuq8m9jtFNa4yeLi8JCIiHrbZpJ8dXnEuVwlIHeXQWqMJRq8Q88sZ1UkqaB45KHU4
         JM7ZkMO8JHS61Rpdm8Vj+j8PK0bbBex3Ajxc3T86kaMKUcuYhHzrH+TgK3+84hiRZDLQ
         BHU3KJnGLyhSru910qDcqu46FC1YXx2S+idC4d02lj/Dn7+lIjChv2UVz2Ou5GCQVCDn
         5qozhYAI2wkKwvV2JNK0bp7Xw6ImqLWO4OgmH7xLcbD/DaJOCQdcXgsYERQs/UNdjTjF
         Kaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751563270; x=1752168070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqrAfLoSpXy32SZjGkLSj0+5pbZu4fxfsJ4Y6XSk3jc=;
        b=h/Y6j3X9jjcLe3sDAWRg9XVk4nmEVtiiRFHBIb5CBF9ZSkddmW/eULbIg2Txx3zwwM
         Cq0wRJR0QyskK3iFxsgfIedmHnJoJCShbgcyeZGQCKnpsGTvnjBNW/AtoCZKLXv9M2Sp
         0YfomEZs2h8Qkg83jhlSX5QOQNeOckQS7r0RT0hadI3/5VXaCtaL4aWFQcbqmm94ahQF
         HwZh9uRYk6vAExhym4Q/noaf14kl1PTbAexbmIgMrq6HoVHQvAd1ZLyhEmJyYV/kxXIL
         IgGVtf/DBseaY5PV06x7jWb6jg4OYotdSSEchqh5Zm+KVi1d60FHLzRH7fuETTogkMeu
         LC7g==
X-Forwarded-Encrypted: i=1; AJvYcCV9ADt96mFnlqUXADNsxKgmHD0mnn6gregJWJNhXjRm+Ea5jz3Npg1U5/OlcFAU0DcnUDQTWlBfCHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyTIQ6n03WylYV05jCTr5Ypf3cr2oV3C5takHvhmqDCq+LqgJYz
	c85Wu3obl/7Wi4NCzq1R78BPkxINcfE7uvuIBR4sZaxKtt9PyKnwm++h7W/IFHyLQqo=
X-Gm-Gg: ASbGncuiYszKTGBYz7RWtbyHG9f05LoM4N59+j9CdEGzCIjoPMW02SB1UME6hlxrHxW
	pZHIJ7Y0biz1sLJL08nMQgjoVpIVK/9q6P4e1xXdiA1u4TftNWoG4MSsey6OgLMtFIaAERwbUFN
	yUlmgmi3Ik579Z6kOC9EYff0/Z5urVjhUVVp5opezPNg/DC9UqLOn3Ula1B5ZC2rc4J3nzkCon4
	/iEIYxYHyczqjmkCXEHf9DKjv1gL0SE5u1iQRSNwCCGZRn1isIJ2ajyNdz9acejZD/sS99AqrNG
	rUCwfbfOEdSFLYSC22i2tzoUDb6w7TdqTDmzvsmb8Ju+mrLpwf3fJz6peuxS3emG0GtKmlRwvv4
	i
X-Google-Smtp-Source: AGHT+IHVZ7jMsIA9AwgqIo9DR90LBVuf615gjC3zVyIg0CTl3+dcwQRj3+3jhUsv+YqHMjpEXeChDA==
X-Received: by 2002:a05:6870:6f12:b0:2e9:fd62:9061 with SMTP id 586e51a60fabf-2f5a8c83c06mr6205946fac.32.1751563267853;
        Thu, 03 Jul 2025 10:21:07 -0700 (PDT)
Message-ID: <613a2591-d26e-4698-bbc6-38f5719c59b7@linaro.org>
Date: Thu, 3 Jul 2025 11:21:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 61/69] accel: Expose and register
 generic_handle_interrupt()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, kvm@vger.kernel.org,
 Zhao Liu <zhao1.liu@intel.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Phil Dennis-Jordan
 <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, xen-devel@lists.xenproject.org
References: <20250703105540.67664-1-philmd@linaro.org>
 <20250703105540.67664-62-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250703105540.67664-62-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/3/25 04:55, Philippe Mathieu-Daudé wrote:
> In order to dispatch overAccelOpsClass::handle_interrupt(),
> we need it always defined, not calling a hidden handler under
> the hood. MakeAccelOpsClass::handle_interrupt() mandatory.
> Expose generic_handle_interrupt() prototype and register it
> for each accelerator.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Reviewed-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> Reviewed-by: Zhao Liu<zhao1.liu@intel.com>
> ---
>   include/system/accel-ops.h        | 3 +++
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-accel-ops.c         | 1 +
>   accel/qtest/qtest.c               | 1 +
>   accel/xen/xen-all.c               | 1 +
>   system/cpus.c                     | 9 +++------
>   target/i386/nvmm/nvmm-accel-ops.c | 1 +
>   target/i386/whpx/whpx-accel-ops.c | 1 +
>   8 files changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

