Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 276ED38145E
	for <lists+xen-devel@lfdr.de>; Sat, 15 May 2021 01:54:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127633.239904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhdF-0001jm-Qu; Fri, 14 May 2021 23:54:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127633.239904; Fri, 14 May 2021 23:54:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhhdF-0001hQ-NW; Fri, 14 May 2021 23:54:13 +0000
Received: by outflank-mailman (input) for mailman id 127633;
 Fri, 14 May 2021 23:54:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CSkR=KJ=gmail.com=connojdavis@srs-us1.protection.inumbo.net>)
 id 1lhhdE-0001hK-Tl
 for xen-devel@lists.xenproject.org; Fri, 14 May 2021 23:54:13 +0000
Received: from mail-io1-xd2a.google.com (unknown [2607:f8b0:4864:20::d2a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9e5c1de-74d9-4c6f-bc3a-0c9d96b39fd1;
 Fri, 14 May 2021 23:54:12 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id k25so437573iob.6
 for <xen-devel@lists.xenproject.org>; Fri, 14 May 2021 16:54:12 -0700 (PDT)
Received: from [192.168.99.80] (142-79-211-230.starry-inc.net.
 [142.79.211.230])
 by smtp.gmail.com with ESMTPSA id o8sm3782827ils.46.2021.05.14.16.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 May 2021 16:54:11 -0700 (PDT)
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
X-Inumbo-ID: b9e5c1de-74d9-4c6f-bc3a-0c9d96b39fd1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=rqRMzyXq2dA6+ggS4z9IyFlWf00u8oA3SiuA2M/aiek=;
        b=Dcxle/7EJHO5rgaZ1WILwbV1l3hnRk7Qt6RSLlgjjcjjz7zW384yB3KIbmy9oUQOx6
         p6UBNHsKcR05q8DRbGTl1PwCUocXL6rDDQzU9ZnUziEE7oYhMXwVTZQwuCPtafSz0BDx
         WXdHzYmNbN0ONgPFQJgQOqTnCRzOMaVVXcWkMWyg3zCgE4PsWww5HpySyXAt2GQYPUhU
         jHrdY4oErzqIkoc/LssGn3C3fNEJALwPAwf5ddFBv1TN4vDtnmMt8ZuKBvJ3KTVsSaQy
         vgCEH8G7z6unQg8/Zq3z11a6Vyeti0n77IsjR491Ifx5ymLT7ixZ2r2bvLnbDj+Mdjhj
         zhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=rqRMzyXq2dA6+ggS4z9IyFlWf00u8oA3SiuA2M/aiek=;
        b=ZWRyvu3iuBRcihwUEsPC3v+nQcqWGDaPJ0+6s45pqFX+U0GgEK7pYP7usgbKCj9GPZ
         EOYyUqMFfR6uOGj1tncY7M6sApcjbPcJ0yZadgkPfeoYf4d2oxbNk1fahgUIldjaPB71
         emF65Z4UeAa/oqDR9tVUOPPcktTPUI9v8/SlwPWmrOBlaU3F2FsTFaV/MPqkRwEKSVTV
         sHt6KwsJx7nnNH2TY5UciD1gB1ytmT5RNgxfKg3fyho7sizW0mSYmHzJIsS7u9pfGAFt
         FG8jqU4GIWPHSHDlHu49VyWiSuxsA9UZ5gr/2ZN6ItW/f80t6WicrVR96jp683+/uYfC
         vIaA==
X-Gm-Message-State: AOAM531grGPb8OVvBrVWLHirx9RJaetI8aNWVHfPnn7ZvZz79OrwrwkH
	3igI8Nu8if1R38I3uzq60dI=
X-Google-Smtp-Source: ABdhPJxxu2K7aB9D2JD+utYCDQ3BL7M7OpXoF/Ojp7gSYTdp+KQyPkjnqUYFzMr33Ctt7iZ0y1iRww==
X-Received: by 2002:a02:5142:: with SMTP id s63mr44752697jaa.82.1621036451854;
        Fri, 14 May 2021 16:54:11 -0700 (PDT)
Subject: Re: [PATCH v3 5/5] automation: Add container for riscv64 builds
To: Bob Eshleman <bobbyeshleman@gmail.com>, xen-devel@lists.xenproject.org
Cc: Alistair Francis <alistair23@gmail.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <cover.1621017334.git.connojdavis@gmail.com>
 <5a78ff425e45588da5c97c68e94275b649346012.1621017334.git.connojdavis@gmail.com>
 <7efa3461-b8f0-c93b-95a2-c596a6dc2c1e@gmail.com>
From: Connor Davis <connojdavis@gmail.com>
Message-ID: <eed7d4e6-6efb-c166-b947-0163df864f8b@gmail.com>
Date: Fri, 14 May 2021 17:54:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <7efa3461-b8f0-c93b-95a2-c596a6dc2c1e@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/14/21 3:01 PM, Bob Eshleman wrote:
> On 5/14/21 11:53 AM, Connor Davis wrote:
>> +
>> +# There is a regression in GDB that causes an assertion error
>> +# when setting breakpoints, use this commit until it is fixed!
>> +RUN git clone --recursive -j$(nproc) --progress https://github.com/riscv/riscv-gnu-toolchain && \
>> +    cd riscv-gnu-toolchain/riscv-gdb && \
>> +    git checkout 1dd588507782591478882a891f64945af9e2b86c && \
>> +    cd  .. && \
>> +    ./configure --prefix=/opt/riscv && \
>> +    make linux -j$(nproc) && \
>> +    rm -R /riscv-gnu-toolchai
> What do you think about using the RISCV tool chain from the Arch
> repos now?
That sounds much better, will update
>
> I've also discovered that the sym table error avoided by the commit
> pin can be worked around by removing already loaded symbols with
> `file` (no args) prior to calling `file path/to/file` to load new
> ones.  So if people did still want to use the container for
> development, they could still use the gdb installed by pacman
> (with the symbols caveat).
>
Thanks,

Connor


