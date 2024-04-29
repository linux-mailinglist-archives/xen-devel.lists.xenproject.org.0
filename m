Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6B28B597C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 15:10:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714058.1115040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Qla-0008GX-Qx; Mon, 29 Apr 2024 13:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714058.1115040; Mon, 29 Apr 2024 13:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Qla-0008Eg-Mv; Mon, 29 Apr 2024 13:09:58 +0000
Received: by outflank-mailman (input) for mailman id 714058;
 Mon, 29 Apr 2024 13:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1QlY-0008Ea-Tv
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 13:09:56 +0000
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [2607:f8b0:4864:20::f2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a83398-0629-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 15:09:55 +0200 (CEST)
Received: by mail-qv1-xf2c.google.com with SMTP id
 6a1803df08f44-69b514d3cf4so48767656d6.0
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 06:09:55 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 g18-20020ad45152000000b006a0af6e25c2sm3003624qvq.94.2024.04.29.06.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 06:09:54 -0700 (PDT)
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
X-Inumbo-ID: c5a83398-0629-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714396194; x=1715000994; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d3EsT56vkk4edFwK/PLV7i6rn4R84QNYBR07evfQ58I=;
        b=Zxw7LEnXTJw9RQ4Bt8URLMHmRouGiPY0aLt6rByw6kMzNnRiUsr4ONYihIVHNH7WjU
         vWvXqugBwnquB7ncd+iq0isSBPfovdLb2xklpnfmHuR3nbG+kH9alI48XJobH/xADVr/
         UPd57Yi2xEdo/+XHryBMdGPpNIdynKcyRRT1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714396194; x=1715000994;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3EsT56vkk4edFwK/PLV7i6rn4R84QNYBR07evfQ58I=;
        b=Q8SbuHi+nPYLHtTcZTxVRcOscxNoGQsJeeAiwfVNXzSHbSDzwRxCivdDebVNQWvVz9
         u4t89Sd0i1Q2Qzw0AcuKJSo1/DCsn+j3Mc/Zljk2DGKz3qakQlYs0XzIcKfaQegANle0
         8U8wnwipIrLi3Amx5h8VlNgjgtTINT9djjnOYdN+CiP96h+GL0LhWtBwbdIQJBeAs2da
         R5HGeniRbJjxU7MYMWikJ82F3hOCG19AleEYgsksGYmVz9C0zDl7Is6mQ8CF1bxNtJ0r
         nBrtVtkFqpy8I/aewDPiCkdHbKOFH8JQze3HCdadE7Qg80ZgNXMILUK5Fexu6t1C11bm
         jUBA==
X-Forwarded-Encrypted: i=1; AJvYcCV7XYjhO7VWexGCLr2ixeMr7tzvK+jBt4p4VcEMwhIrOYUGw4nRF/ZQZ6zk0CyjSWv2RwwCLlvgvnuTUSqa6+JjjejNaVxxgJM0vOCCRNg=
X-Gm-Message-State: AOJu0Yx2pqN6fepLY8SbXNhJ4WgRlxPB3XAD49mrTTWJSDem5KKizxu2
	0wOAnIOWfj6D1mKRdtA3zD51LomOazGFNkNei1HULFtr+j4X+t4no5EL5HCHAJevYyCCo5hYmSi
	r
X-Google-Smtp-Source: AGHT+IHo0ejIW7TXMBeahBUErP0VNnlJDtFEm42/zDSr70tZfSGtSFUOMLLMULouxHF12AFq6cWtCw==
X-Received: by 2002:a05:6214:2385:b0:699:221e:789c with SMTP id fw5-20020a056214238500b00699221e789cmr10692658qvb.62.1714396194640;
        Mon, 29 Apr 2024 06:09:54 -0700 (PDT)
Message-ID: <62c1cb1b-ad62-477f-b851-552bbf27672b@citrix.com>
Date: Mon, 29 Apr 2024 14:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] revert "x86/mm: re-implement get_page_light() using an
 atomic increment"
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@cloud.com>
References: <f54c05d4-b61d-4e26-8e93-6e1bdc22a1d4@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <f54c05d4-b61d-4e26-8e93-6e1bdc22a1d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2024 2:01 pm, Jan Beulich wrote:
> revert "x86/mm: re-implement get_page_light() using an atomic increment"
>
> This reverts commit c40bc0576dcc5acd4d7e22ef628eb4642f568533.
>
> That change aimed at eliminating an open-coded lock-like construct,
> which really isn't all that similar to, in particular, get_page(). The
> function always succeeds. Any remaining concern would want taking care
> of by placing block_lock_speculation() at the end of the function.
> Since the function is called only during page (de)validation, any
> possible performance concerns over such extra serialization could
> likely be addressed by pre-validating (e.g. via pinning) page tables.
>
> The fundamental issue with the change being reverted is that it detects
> bad state only after already having caused possible corruption. While
> the system is going to be halted in such an event, there is a time
> window during which the resulting incorrect state could be leveraged by
> a clever (in particular: fast enough) attacker.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

