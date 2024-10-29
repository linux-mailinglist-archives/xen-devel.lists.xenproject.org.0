Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194909B4D12
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 16:09:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827514.1242154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nqe-0002OG-8H; Tue, 29 Oct 2024 15:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827514.1242154; Tue, 29 Oct 2024 15:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5nqe-0002LO-3x; Tue, 29 Oct 2024 15:09:32 +0000
Received: by outflank-mailman (input) for mailman id 827514;
 Tue, 29 Oct 2024 15:09:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YGhd=RZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t5nqd-0002LI-F4
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 15:09:31 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c998158b-9607-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 16:09:26 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a9a6b4ca29bso683518866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 29 Oct 2024 08:09:26 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9b1f297a9csm471885766b.126.2024.10.29.08.09.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 08:09:25 -0700 (PDT)
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
X-Inumbo-ID: c998158b-9607-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzUiLCJoZWxvIjoibWFpbC1lajEteDYzNS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImM5OTgxNThiLTk2MDctMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjE0NTY2LjUzNjk0Miwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730214566; x=1730819366; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oP+f6i+CiBQzM8DiQE4z9NV7bqJbDZmS2vB0G6ewxeg=;
        b=HZnYqMf7yP2IWESF1ZIgdSiaZLmgGmnDWFyZBOPGeThcK9V+pDkbMwyl1DawJkDcwD
         xkhbAQBAq6oUHg0Ql1b5Pxkn4xrf+IWMK5xPEqLIo/DYkRuANZNSjMjlgdRTKNcZbvUS
         0Z+SGlXegSXpIRecPlbVP2ECDGCTyF6DYfa2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730214566; x=1730819366;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oP+f6i+CiBQzM8DiQE4z9NV7bqJbDZmS2vB0G6ewxeg=;
        b=iCGP+U3RrbKoK2oLA3T387w1aypkqR/it2jLpxzFmk0+fmexeVRq3kV9kUevbINwyd
         S191qcXU9//DarMYUxTEVv9ucejHqeniCAr8RaKX+y6dz13n+vUFLVMx1T6O7/ypYXef
         5NVHLrHLgAcCep2ROtxKFhtKiGh2TAAcegehUwj+4uTebFOzodOSIAk1tdtI9m7TKni4
         w+rI3JByOuSt275FrnEWmxMT1tGBf5964m8NouGGvHOoGiz88NapWQLrkvF8++FvUVpb
         Vk4G6D1CQictlgCO9u9I/3Lu8SB/J5FC2bKviwPCRnNOYzN6Y380EIvPWey8URfTh9c0
         2l/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW//rki2OGkVliVcShSCvH6Afjw5suPblOLWUNwTawwNTyGyQbg0VmAWSbuNWBDVR9RsSX/IiaEqXU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxWahdq/ia5a6ky5ArlkgxQ8sxukynaLc6NE9CFvLWqpb3nJoUZ
	T6cnDYs3NUfeubQ32J88xOfch71LDpUTgszmQ4qNdHfLfhLyGd1SE3nskYCim50=
X-Google-Smtp-Source: AGHT+IFQyAfe4VcuzRBKzDf3RvzDjdCIN/JVY5KA0hmrikio3IhdfPZ1TuGaq6F46X5YB7HhWPyNPw==
X-Received: by 2002:a17:907:940f:b0:a9a:597:8cca with SMTP id a640c23a62f3a-a9de615f959mr1257000866b.45.1730214565871;
        Tue, 29 Oct 2024 08:09:25 -0700 (PDT)
Message-ID: <6fed0353-d9eb-4e48-af49-15841bbfaacf@citrix.com>
Date: Tue, 29 Oct 2024 15:09:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] x86/boot: Rework how 32bit C is linked/included
 for early boot
To: Frediano Ziglio <frediano.ziglio@cloud.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <20241029102942.162912-1-frediano.ziglio@cloud.com>
 <20241029102942.162912-2-frediano.ziglio@cloud.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20241029102942.162912-2-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2024 10:29 am, Frediano Ziglio wrote:
> Right now, the two functions which were really too complicated to write
> in asm are compiled as 32bit PIC, linked to a blob and included
> directly, using global asm() to arrange for them to have function semantics.
>
> This is limiting and fragile; the use of data relocations will compile
> fine but malfunction when used, creating hard-to-debug bugs.
>
> Furthermore, we would like to increase the amount of C, to
> deduplicate/unify Xen's boot logic, as well as making it easier to
> follow.  Therefore, rework how the 32bit objects are included.
>
> Link all 32bit objects together first.  This allows for sharing of logic
> between translation units.  Use differential linking and explicit
> imports/exports to confirm that we only have the expected relocations,
> and write the object back out as an assembly file so it can be linked
> again as if it were 64bit, to integrate with the rest of Xen.
>
> This allows for the use of external references (e.g. access to global
> variables) with reasonable assurance of doing so safely.
>
> No functional change.
>
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

