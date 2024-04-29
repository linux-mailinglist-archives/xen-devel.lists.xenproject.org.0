Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6324F8B546F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 11:45:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.713947.1114861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1NY8-000367-RH; Mon, 29 Apr 2024 09:43:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 713947.1114861; Mon, 29 Apr 2024 09:43:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1NY8-00033V-Md; Mon, 29 Apr 2024 09:43:52 +0000
Received: by outflank-mailman (input) for mailman id 713947;
 Mon, 29 Apr 2024 09:43:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yZQG=MC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s1NY7-000334-Da
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 09:43:51 +0000
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [2607:f8b0:4864:20::f2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa8bd098-060c-11ef-b4bb-af5377834399;
 Mon, 29 Apr 2024 11:43:49 +0200 (CEST)
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-69b6d36b71cso21526756d6.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 02:43:49 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 o5-20020ad443c5000000b0069b61f8c0a1sm1955965qvs.42.2024.04.29.02.43.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 02:43:47 -0700 (PDT)
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
X-Inumbo-ID: fa8bd098-060c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714383828; x=1714988628; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=i0btClj9AhSw+QYLxonv0rYymIZDyFD0Gqw3b1+H33s=;
        b=YpvbD2q/0TLyFGf8KL2rCku3le892gcPffY+vLAnB5DHN1QotNIlRpEUXDG+Hw4Zx2
         z6NV3g1v8AGXMr/MnAL8Crvh7HWR5z2aVht3pbfV8bmEcUILfmXiWITITdczqUl5ZgeR
         dF8pp91yqbc7h0QDMbkKj8SiXs/kF1NavFE7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714383828; x=1714988628;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i0btClj9AhSw+QYLxonv0rYymIZDyFD0Gqw3b1+H33s=;
        b=gyBWmVK/DLli4fRALSBwSyk1A8VWp1QNvkbmxVj8zWTHwGyZ5pxMGdTu+EZp/J+KGz
         2tC0sW5sFp2JvG0TVOJgDbzWZk5JHaYKQU4u68PZV3TH+F62wGuGE5YtA5Bw6B3+MqRi
         F2gKX++Ih1WCcdaiuhZOzL7JKdpWrXfpxfe9o5EihALmXudN31+Y63KJHl9Eg6QLpYf9
         J992cokHF5TH2PMVFfwCv1flJaiibffPYBAmZBtfsAWaNHj0+RbgJcuvoUzyQwJ3fMg3
         R5y5ARHc89ctv43gUrTkEC4F2E5WYqLHFmV2BWUnbsLmswIAeC1pdbvWSARXU6Ab8zd2
         GPkw==
X-Forwarded-Encrypted: i=1; AJvYcCWEWtRNuIbMnxS4tp9bf85Z/3mt/As/0FlQxGIBfSipqh/cm4Y4AYcr07i2eEuCq0mBjiAp6GkJcQbAMZ1EEx9c+3XEinosFYMoNVjlTGo=
X-Gm-Message-State: AOJu0YwLci3sn7NdcY7TVeOb6uifKyL1kbN1+SWhnImf7CHr1gl+jWBo
	mMrD3SRfRkE+z8YK4ylo7ie7JBBG2wiMTntZLG1TyGvshQxE5PAhWEskRqFQflM=
X-Google-Smtp-Source: AGHT+IFwktSf3cZBIDwb8GyCMtMBCMxMoTls/TpPdXAbMiu2pYSXUXQ0EiB4Jf58S3wHrNUJrjPsBQ==
X-Received: by 2002:a05:6214:19e2:b0:6a0:9360:1e7a with SMTP id q2-20020a05621419e200b006a093601e7amr14520262qvc.42.1714383827863;
        Mon, 29 Apr 2024 02:43:47 -0700 (PDT)
Message-ID: <9ead9ea1-8661-4532-82d7-4bef1e592975@citrix.com>
Date: Mon, 29 Apr 2024 10:43:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/cpu-policy: Annotate the accumulated features
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240426160859.565438-1-andrew.cooper3@citrix.com>
 <e7810e1a-f688-48ea-bfdf-dfc22582f06e@suse.com>
Content-Language: en-GB
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e7810e1a-f688-48ea-bfdf-dfc22582f06e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/04/2024 8:49 am, Jan Beulich wrote:
> On 26.04.2024 18:08, Andrew Cooper wrote:
>> Some features need accumulating rather than intersecting to make migration
>> safe.  Introduce the new '|' attribute for this purpose.
>>
>> Right now, it's only used by the Xapi toolstack, but it will be used by
>> xl/libxl when the full policy-object work is complete, and until then it's
>> still a useful hint for hand-crafted cpuid= lines in vm.cfg files.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> The one feature you don't annotate such that I'm not entirely sure about is
> NO_FPU_SEL: On one hand it tells code not to rely on / use the selector
> fields in FPU state.

It's sadly far more complicated than this.

This feature, and it's AMD partner RSTR_FP_ERR_PTRS, where introduced to
stop windows BSOD-ing under virt, and came with an accidental breakage
of x86emul/DoSBox/etc which Intel and AMD have declined to fix.

If you recall, prior to these features, the hypervisor needs to divine
the operand size of Window's {F,}X{SAVE,RESTORE} instructions, as it
blindly does a memcmp() across the region to confirm that the interrupt
handler didn't corrupt any state.


Both features are discontinuities across which is is not safe to migrate.

Advertising "reliably store as 0" on older systems will still cause
windows to BSOD on occasion, whereas not advertising it on newer systems
will suggest that legacy emulators will work, when they don't.


I don't have any good idea of how to make this work nicely, other than
having some admin booleans in the xl.cfg file saying "I certify I'm not
using a legacy emulator in my VM" to override the safety check.

Other discontinuities I'm aware of are the introduction of DAZ (changing
MXCSR_MASK), and any migration which changes LBR_FORMAT.

~Andrew

