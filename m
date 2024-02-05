Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FC849FFC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 17:54:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676402.1052561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2Ez-0000Pa-N1; Mon, 05 Feb 2024 16:54:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676402.1052561; Mon, 05 Feb 2024 16:54:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX2Ez-0000O1-K2; Mon, 05 Feb 2024 16:54:41 +0000
Received: by outflank-mailman (input) for mailman id 676402;
 Mon, 05 Feb 2024 16:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Sh=JO=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rX2Ex-0000Np-IM
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 16:54:39 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f19a4e6-c447-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 17:54:37 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5112a04c7acso7448402e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 08:54:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-3-248-192.as13285.net. [92.3.248.192])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a5d4f88000000b0033ae50e2c6asm16490wru.83.2024.02.05.08.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 08:54:36 -0800 (PST)
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
X-Inumbo-ID: 3f19a4e6-c447-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707152077; x=1707756877; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BKfBRmbXv56Vn3QaN3CNW3o0CXzD4Qv3mgebMPPj7Oo=;
        b=ae0unsS+SiDATPUK5iAPMcHvKDi9pd+9dBi8N/+L4yy+fjC6DSoz+JGw6Eq9yyp7wz
         odWutN7CldY9sIABBNZosd3ZIAk1cNyNQgRky2YG8zXYg3X6swFV8FY17r/lCuSks+9h
         J4+QKt1ZhdLdRdjbXickovIo16AkjTJuUMfUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707152077; x=1707756877;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BKfBRmbXv56Vn3QaN3CNW3o0CXzD4Qv3mgebMPPj7Oo=;
        b=cB5Zl5ikwHzaovRiH/tSGb5c32yuqKnH4RD+H7mFq5TnLm9GRbjsKP6NmmorLF0hDm
         T+wrg+zEnRv48ub1MnPy2a+y8Ufpqgnwnd8FcRQiu1D59PGrtaq+eZ5JNudEpoZIbdOZ
         lquN0irXI/yXeMp4pDhi4l5ZKTks+J//r3JmfwRlnxLlvqUOYIiUM4ozNcZTI3+2oRQJ
         vxK9FXZm9Wa9l5i5AW+9LQQ7fXBUZASd/W4oaKPJYRbov9QYhrUPksmLAvGY6uScfLib
         bQBuGptRHPq17JWZKTiF5M2agGFSbSfddPb/nQgzLKhukXjWZrEJV+EUgp6ASbAr/dry
         swMA==
X-Gm-Message-State: AOJu0YyOM3BPZgj0HRBywXWayZsBCAKvZmwJGJuz6xJyITvkLRghklGj
	DMKaKUptaHlZFXpBEzRP65g8LpgoeCNoybde9XJMxsOMyK4Qc1sOUc70agiA8EU=
X-Google-Smtp-Source: AGHT+IGHieaEAPxp1ksOtGx0ekAWhDqlQJ2A0Tmv1KTVCerwzFX2qm5L0dDDbCJsChFSz+a0KR00ng==
X-Received: by 2002:ac2:5968:0:b0:511:4aa7:b5c2 with SMTP id h8-20020ac25968000000b005114aa7b5c2mr121413lfp.26.1707152076993;
        Mon, 05 Feb 2024 08:54:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUBB7FLeRZAwP9jaPEhOKVxuy0nbPf4WI951CpeKKFRXSZewC0WpQSZc/MczCBPeF+A2MXvRsLY/0ZkiNLZVcDdV1HO4Ch7CdupdOJwsMs40mPw9mPMEmRmQLJ/yzble1bzdzkIHJw5+2dM1+48abGZxO+tE00jRqmZxDYmNFrtbaojVq9c5sJEP+tGhDeoOpGDCb5FoYY2BlFVYlAKmDRFaJr/iwUPx7iMFApw3/+UN6Abw7f2u1eyntTcz8YABDh9SA==
Message-ID: <3fc56b77-9b8c-402f-a338-5f415e5ab603@citrix.com>
Date: Mon, 5 Feb 2024 16:54:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4] xen/arm: ffa: reclaim shared memory on guest
 destroy
Content-Language: en-GB
To: Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org
Cc: patches@linaro.org, Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240205154909.2392231-1-jens.wiklander@linaro.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20240205154909.2392231-1-jens.wiklander@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/02/2024 3:49 pm, Jens Wiklander wrote:
> diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
> index 0793c1c7585d..bbb6b819ee2b 100644
> --- a/xen/arch/arm/tee/ffa.c
> +++ b/xen/arch/arm/tee/ffa.c
> @@ -992,53 +1008,75 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
>      }
>  }
>  
> -static bool inc_ctx_shm_count(struct ffa_ctx *ctx)
> +static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
>  {
>      bool ret = true;
>  
>      spin_lock(&ctx->lock);
> +
> +    /*
> +     * If this is the first shm added, increase the domain reference
> +     * counter as we need to keep domain around a bit longer to reclaim the
> +     * shared memory in the teardown path.
> +     */
> +    if ( !ctx->shm_count )
> +        get_knownalive_domain(d);
> +
>      if (ctx->shm_count >= FFA_MAX_SHM_COUNT)
>          ret = false;
>      else
>          ctx->shm_count++;
> +
>      spin_unlock(&ctx->lock);

This is subtle.  It reads as if there is a reference leak.  There really
will be one if FFA_MAX_SHM_COUNT happens to be 0.

You could add a BUILD_BUG_ON(), but IMO it would be far clearer to
follow if you moved the get_knownalive_domain() into the else clause.

>  
>      return ret;
>  }
>  
> -static void dec_ctx_shm_count(struct ffa_ctx *ctx)
> +static void dec_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
>  {
>      spin_lock(&ctx->lock);
> +
>      ASSERT(ctx->shm_count > 0);
>      ctx->shm_count--;
> +
> +    /*
> +     * If this was the last shm removed, let go of the domain reference we
> +     * took in inc_ctx_shm_count() above.
> +     */
> +    if ( !ctx->shm_count )
> +        put_domain(d);
> +
>      spin_unlock(&ctx->lock);

You want a local bool called drop_ref, set within the lock, and move the
put_domain() down here.  put_domain() is potentially a large operation.

~Andrew

