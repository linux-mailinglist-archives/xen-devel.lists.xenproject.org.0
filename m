Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C063A7E7201
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 20:11:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629813.982296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1AQZ-00012c-H2; Thu, 09 Nov 2023 19:10:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629813.982296; Thu, 09 Nov 2023 19:10:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1AQZ-00010c-D8; Thu, 09 Nov 2023 19:10:55 +0000
Received: by outflank-mailman (input) for mailman id 629813;
 Thu, 09 Nov 2023 19:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OVYC=GW=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1r1AQX-00010W-Oy
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 19:10:53 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2d9f22e-7f33-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 20:10:51 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-53f9af41444so2067884a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 09 Nov 2023 11:10:51 -0800 (PST)
Received: from [192.168.69.115] ([176.187.199.161])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a056402516400b0052febc781bfsm166756ede.36.2023.11.09.11.10.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Nov 2023 11:10:50 -0800 (PST)
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
X-Inumbo-ID: b2d9f22e-7f33-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699557051; x=1700161851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdoA4bCOHV2xbFNH5vfe2cP2TsA1ItA50LkkszW2hqI=;
        b=af7ey8rB68S9o8NbiLrXnVkvOdU12nfPscn4YhvwHpyWUru3mOjyO4JPoxS4nv/Vpu
         kqdvnjUwOpquY6wD7hABdto9s47rbhCDeTohI9mrWq796hZuGOhKYih7FihKCsweGO0j
         3kDXz7hu3O0gfs1Fommfd23PSn0NwJTS/CusLagIdUYR5lea3CsoAO8yGV4nateoxUrY
         2RjaCelBQg374hUl0FnI/OQWg1KWfRoKNFVW18c8+78CSUn10viWyCWTNtwTovAdUatQ
         1NnWWnpwoVeK4qInyd+0oy9JXUdIqmcjmdjxCCVVtJYT19vrPUDEa4xx3D5MoyfMG+3h
         IDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699557051; x=1700161851;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdoA4bCOHV2xbFNH5vfe2cP2TsA1ItA50LkkszW2hqI=;
        b=ftsgCvLWLQ5Mevs09XYbL5LUHTroxoBt7vxBPU5648zl4njYxvu9CS4/IL+Key3SUc
         gq2FM31SIjV53EP2jgpB1rLUiGicy4OTntKbB73O59zzzHYwGHDeG6eQV9sjOJObYMNo
         8UQvWjchAoNisLmZV65PPWmUqFzFCmDYIT6oSpXhHp93DWiv3djKXzzJcpg87QbRFCqn
         61s4OXWafua97+EB9ScuTl0Sy5SeUmq2iIOvzXMs9tZ2B+iOFQwLoJ7CnL+ew5R+rvUh
         3oitEC23rXvoO75/2mhKSNM90gyfwWXoD/OyLzGXPVv2RyoritBfln5ZFysPGScGfAar
         x/ig==
X-Gm-Message-State: AOJu0YwuBtmMHn0DlHLZOeicaZ7QM0mRqVAW7Ui2dwPZbssPV0S3FbxB
	mZGKwtHDkgRpVLTBSW4q7EX5HA==
X-Google-Smtp-Source: AGHT+IGQWLbS6fjT5uskXK5uqeX2dyiUo9uxOjYP+c47qUmCU1v4YNvZ6Y3IS8TXn8wbpntUm+aJhg==
X-Received: by 2002:a50:9508:0:b0:543:8391:a19a with SMTP id u8-20020a509508000000b005438391a19amr4551354eda.40.1699557051247;
        Thu, 09 Nov 2023 11:10:51 -0800 (PST)
Message-ID: <d66214c1-fea9-418d-8497-4a3f2da1e734@linaro.org>
Date: Thu, 9 Nov 2023 20:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] include/hw/xen: Use more inclusive language in comment
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, qemu-trivial@nongnu.org
References: <20231109174034.375392-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231109174034.375392-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/23 18:40, Thomas Huth wrote:
> Let's improve the wording here.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   include/hw/xen/interface/hvm/params.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



