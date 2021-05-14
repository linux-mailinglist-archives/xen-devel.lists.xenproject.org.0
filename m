Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3838126A
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 23:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127577.239796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhewZ-0006vC-FW; Fri, 14 May 2021 21:01:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127577.239796; Fri, 14 May 2021 21:01:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhewZ-0006tL-BI; Fri, 14 May 2021 21:01:59 +0000
Received: by outflank-mailman (input) for mailman id 127577;
 Fri, 14 May 2021 21:01:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZhtO=KJ=gmail.com=bobbyeshleman@srs-us1.protection.inumbo.net>)
 id 1lhewX-0006tF-Rs
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 21:01:57 +0000
Received: from mail-pj1-x1030.google.com (unknown [2607:f8b0:4864:20::1030])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8370a17f-116b-4cff-990f-3a063f56c7d2;
 Fri, 14 May 2021 21:01:57 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 gb21-20020a17090b0615b029015d1a863a91so2279522pjb.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 14:01:57 -0700 (PDT)
Received: from ?IPv6:2601:1c2:4f80:d230::1? ([2601:1c2:4f80:d230::1])
 by smtp.gmail.com with ESMTPSA id m6sm1756204pfc.133.2021.05.14.14.01.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 14:01:55 -0700 (PDT)
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
X-Inumbo-ID: 8370a17f-116b-4cff-990f-3a063f56c7d2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=guhBn2/qVoLPjSGAw62plNUlRR+xAO3c6yC3ikgOGR4=;
        b=py0NTGeU8RfAmLSjOaEaSNeFMX0CPSIpN+e3/gLMOdsGpiC5PItDhnoR5r/ozPQG8E
         z2E5BEIDf00q2GBewtAOwVVcYT7fo+Km7eig/FhGhh53eO11A+rRCNDU4B8G5apBM58w
         LHz0lhI3KZMXeTemVGt4JIKojv09u9PcK1s3rM17oKXbYImchEdkqYIlrfzOxL6ZfxUY
         3cuAZRgsOrsJ91vMi2zhgSFwUPwP7fov7MvhIqFha/1+ZtvlYat9sSXpxVoTLkrEvLhT
         wT3useWR/tKkpV+IvMrXW1Cfo/hkr7Gumkfel0vKWFTzZnS9BlKb6ssM5EvzuYzdfiZC
         LuPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=guhBn2/qVoLPjSGAw62plNUlRR+xAO3c6yC3ikgOGR4=;
        b=XUPsCjeQiko/BapUu4P22Ep2lKhEt78KzNJGHp4VV3iBtMqOA32+HlDvZNq+R2lQ7Q
         JEmn+JJncK/7yzG4/YK8FWWPUvMhxOi3uPE3Ogn5eo42978V5CWJCPSxcVMq5C+NRH1R
         SJU4YGQ54Ef0clAOK5AgFOvCu0xksinxYv4jibOMue5n2Y3V7Ya3hpGBXQTboC/tlfXu
         rRt6N6pPtGbZuF5x6IuBZ8rKs1XNrSLj7FzPaOo2g+jzIv989DrXACgPcOoDro0+5xDt
         Qn2A1NXNrnxWRcSkeYkQ1FfSqD5zEYqMStNVTFG8tpgEBxkw3ZvbqE+mPTROXcLvw5R7
         N7bA==
X-Gm-Message-State: AOAM531TPRnsEVCzw1C6bB63RUfnB7epbtAflSo8BoB6Roa9oTLlF4TN
	UWdmeOnh6ZKdwtyxBxBPvxQ=
X-Google-Smtp-Source: ABdhPJzbCjhnbZSLvb8Dp9TsmWzt/xNcrSfLZDD3tozX3wzncMpjyO8hmlzKv2u9cDhy3yCb5Ri/gA==
X-Received: by 2002:a17:90a:4493:: with SMTP id t19mr7188635pjg.217.1621026116323;
        Fri, 14 May 2021 14:01:56 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] automation: Add container for riscv64 builds
To: Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair23@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1621017334.git.connojdavis@gmail.com>
 <5a78ff425e45588da5c97c68e94275b649346012.1621017334.git.connojdavis@gmail.com>
From: Bob Eshleman <bobbyeshleman@gmail.com>
Organization: Vates SAS
Message-ID: <7efa3461-b8f0-c93b-95a2-c596a6dc2c1e@gmail.com>
Date: Fri, 14 May 2021 14:01:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <5a78ff425e45588da5c97c68e94275b649346012.1621017334.git.connojdavis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/14/21 11:53 AM, Connor Davis wrote:
> +
> +# There is a regression in GDB that causes an assertion error
> +# when setting breakpoints, use this commit until it is fixed!
> +RUN git clone --recursive -j$(nproc) --progress https://github.com/riscv/riscv-gnu-toolchain && \
> +    cd riscv-gnu-toolchain/riscv-gdb && \
> +    git checkout 1dd588507782591478882a891f64945af9e2b86c && \
> +    cd  .. && \
> +    ./configure --prefix=/opt/riscv && \
> +    make linux -j$(nproc) && \
> +    rm -R /riscv-gnu-toolchai

What do you think about using the RISCV tool chain from the Arch
repos now?

I've also discovered that the sym table error avoided by the commit
pin can be worked around by removing already loaded symbols with
`file` (no args) prior to calling `file path/to/file` to load new
ones.  So if people did still want to use the container for
development, they could still use the gdb installed by pacman
(with the symbols caveat).

-- 
Bobby Eshleman
SE at Vates SAS

