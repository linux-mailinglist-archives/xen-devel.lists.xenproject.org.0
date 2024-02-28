Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A271586A9E8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 09:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686418.1068406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFIB-0007Wh-AR; Wed, 28 Feb 2024 08:27:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686418.1068406; Wed, 28 Feb 2024 08:27:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfFIB-0007TX-7E; Wed, 28 Feb 2024 08:27:55 +0000
Received: by outflank-mailman (input) for mailman id 686418;
 Wed, 28 Feb 2024 08:27:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfFIA-0007TR-0J
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 08:27:54 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 432007f3-d613-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 09:27:51 +0100 (CET)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5643ae47cd3so6728543a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 00:27:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 oy29-20020a170907105d00b00a42fb41e108sm1592011ejb.90.2024.02.28.00.27.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 00:27:50 -0800 (PST)
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
X-Inumbo-ID: 432007f3-d613-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709108871; x=1709713671; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tRJIBNBk85fUEukKDpIzLWxzV99t0JunP9xFi8z07Sk=;
        b=I+Vi8nzqicydyHvdAvq8iMllQtxk7Eu1WUd1fW+ir4ZR4oL90RQXASwzzlpMjZPKSf
         myjKnmcdG2J0+syunwksqe1krxtqv4FVCRgg6VqzMeoEb5BKr/2BwOLSuEUI1LeFFJWv
         voZBmbkSnyzqp4nrSZtuPlmrf68nfcrzGs3v0+AG0MqOquowMbxw37KkjPKDS/anUzN8
         WWIj6B6jeZlb/BpiDMp+aJTGluQAFn3cur0NxoWcD9GxbjuxEjtQw9gkNhUROHUwkRV4
         MXkyV4Gy3ieliyUYn7Vd20YZ9j9ukvu2JhePngEkWXNCaSCg75K7+yK+PEqXTU6FfD5q
         0WFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709108871; x=1709713671;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tRJIBNBk85fUEukKDpIzLWxzV99t0JunP9xFi8z07Sk=;
        b=akL9WpRc8a5biL6V4TmBCzrz3UYtcluqfNf07Tj4X4/JR9cJR64AVFzg2WhhrBAEPs
         Vi+PPEW2JIqC0/yItv2/iA42zDs+c5PwsgvrBddiVh355ml65/5On3l64bASdomMirwN
         /GcKa7NtYoMVqgS2QZ8MTnP8mZ0CxMhl+hh8Q+EiA6kie0Vuk96F18lfWxztOJ1vHcxy
         y1Jqp/oPJvi099RQrmuRCiBUaxyJSWbZAV5M1sd6qoBPQ1xR49EDbLvQo4LR4hjpteYw
         MBCZQKBJTbFameFAFebyD4XWTxLlev6jbxduBLks3OdcB9NkYLJ8bKnemjB1dIq0uwsn
         DM3A==
X-Forwarded-Encrypted: i=1; AJvYcCW7eqHu5sGP8pQ33R6DI41sllABZSC6VSEl9+1tvR05rt0u4+HErbeXI+b7ooP+WUn5xhCNkgRLnI+un3JamYxEtX5CVpHcBRS/VfSAxOQ=
X-Gm-Message-State: AOJu0YzB1fWoDz60a7mkq+iZcjayRdKaL/ABeqD4aZpg3DXL1oaX25br
	zGP+JrDI/j1LjkMmFRaLf5FhUgVZWnkecV1NnEdhWJEmVt64WeF/CRz91RasoQ==
X-Google-Smtp-Source: AGHT+IEjjhlehty8AlkfLKG31jBEbHvsivHHTTIfpVZadeN6yxSlIoco9e1fVfd9s16S1vJZONQTww==
X-Received: by 2002:a17:906:7c44:b0:a3e:90ec:2287 with SMTP id g4-20020a1709067c4400b00a3e90ec2287mr7915808ejp.26.1709108871060;
        Wed, 28 Feb 2024 00:27:51 -0800 (PST)
Message-ID: <3e131a4d-652a-4759-bf8a-2564b6c3859e@suse.com>
Date: Wed, 28 Feb 2024 09:27:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.18.1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott <dave@recoil.org>
References: <7dc621a0-924c-499c-86c1-c35ec1f34ec2@suse.com>
 <ca4fe67a-3efd-4ce5-b37d-e68b1bf4c1a7@citrix.com>
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
In-Reply-To: <ca4fe67a-3efd-4ce5-b37d-e68b1bf4c1a7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.02.2024 15:57, Andrew Cooper wrote:
> Looking at the XenServer patchqueue, a couple to consider but nothing
> jumps out as critically urgent.
> 
> b6cf604207fd and 098d868e52ac as oxenstored perf fixes, although there's
> one incremental (non-functional) fix I'm still waiting on an ack on. 
> The backport to 4.18 is trivial.  The backport to 4.17 is miserable but
> I've already done it.

I wouldn't normally consider such for backport, but I'm not opposed if the
oxenstore maintainers agree (now Cc-ed) and if I can leave putting in these
two backports to you.

> ae6d4fd87676 which is a UBSAN fix, guest reachable but we believe not an
> issue in non-UBSAN builds.

Hmm, yes - no idea why I missed this one.

> cf7fe8b72dea which is the CPUID rescan on microcode load.

This is already there on the 4.18 branch, and it isn't applicable to the
upstream 4.17 one (I assume you did backport the commit referenced in the
Fixes: tag to your XenServer tree).

Jan

