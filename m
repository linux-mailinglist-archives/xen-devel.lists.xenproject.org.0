Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A394096DEB0
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791204.1201024 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEfa-0005WF-4B; Thu, 05 Sep 2024 15:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791204.1201024; Thu, 05 Sep 2024 15:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEfa-0005Ul-0m; Thu, 05 Sep 2024 15:45:14 +0000
Received: by outflank-mailman (input) for mailman id 791204;
 Thu, 05 Sep 2024 15:45:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJQt=QD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1smEfY-0005UO-HQ
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:45:12 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d58874b3-6b9d-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 17:45:10 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5bef295a429so1069126a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:45:10 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3cc6a51c6sm1351068a12.83.2024.09.05.08.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:45:09 -0700 (PDT)
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
X-Inumbo-ID: d58874b3-6b9d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725551110; x=1726155910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uWCGDciwIXxurz1VAhrx//fG4ENVUGnVtVhF19LlTjY=;
        b=uP5vk40M58kAxaxGByBekwl9R2YKAf04KTjPewjrIgEF2xcqyhaE3DP2iZS8OSlbo9
         Ds3uxKjvr2hRWjUMwAej1gBIGW3aqe2+Bd3CIImQnjoRie+8ZC5ReXqDGh73TGupzylp
         tfN5IBPzRJvOJzIXq9R64cEuQ9isHRK7ucHGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551110; x=1726155910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWCGDciwIXxurz1VAhrx//fG4ENVUGnVtVhF19LlTjY=;
        b=VoIW48e1FtK9rw+TIy/ZDu0VIPTjqDF0LpLIL2Ua1eTzkPrK0NnAx/wQ/j9vuvgBi6
         tiqKP5Cy5QtbU4QbKiTHpl8VZ4umi06iLyP4RzDYflD65nMlvCP3l4WQ31UeiQQo0tjZ
         lQexDavdprUPwCKnpetuCPU6Iq18I9xyRzyx4hWdWx6+qi2hRPE53gQ9B7LN8ZlKO+kD
         ZXy4OfNcivam231xhiTKL0qUMf4wb8LaKLcgwCsO2NN0koTlpU/AUYIwEjLqRiMHUg2j
         kEOkcGQkVBis8M8+7aaCKozon5CSPjIcRSJ24J7dk2dj0+dpBZWpTGbyvdG01HMDJNpJ
         Do+w==
X-Forwarded-Encrypted: i=1; AJvYcCWftRYc8UQqLxL8nLDqrIwcFP609qrttpqcmNkCgaxSWK9m1II7pat+ybm1cE3U8FURRmGvxXAcF5s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywh2wO32br/7cgMdUN9fa8vl48goLXKDGZk/9iAvElvnjy00+TX
	4N2CrNXFm0tJ6mVCPilmLSVXvDid/6j8xbUQURN36fJ6ssvdjoEULrdHzu5pVs4=
X-Google-Smtp-Source: AGHT+IGnzzNbUROLkuOpdS/75RnkdWs4gcwuEB9KaYafq0kR6Wfgi0zMzr8QOnQXtC031Z34bi3cNQ==
X-Received: by 2002:a05:6402:350b:b0:5c0:ab6f:652a with SMTP id 4fb4d7f45d1cf-5c2c28f8a63mr3420859a12.3.1725551109687;
        Thu, 05 Sep 2024 08:45:09 -0700 (PDT)
Message-ID: <d19f6581-98b0-4c24-bb87-33ef8c6cf804@citrix.com>
Date: Thu, 5 Sep 2024 16:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] x86/trampoline: Move the trampoline declarations out
 of <asm/config.h>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240905130657.4075906-1-andrew.cooper3@citrix.com>
 <20240905130657.4075906-3-andrew.cooper3@citrix.com>
 <e54436a9-10a9-4a43-a9aa-72e5e5ceb17e@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e54436a9-10a9-4a43-a9aa-72e5e5ceb17e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2024 4:35 pm, Jan Beulich wrote:
> On 05.09.2024 15:06, Andrew Cooper wrote:
>> asm/config.h is included in every translation unit (via xen/config.h), while
>> only a handful of functions actually interact with the trampoline.
>>
>> Move the infrastructure into its own header, and take the opportunity to
>> document everything.
>>
>> Also change trampoline_realmode_entry() and wakeup_start() to be nocall
>> functions, rather than char arrays.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> --- /dev/null
>> +++ b/xen/arch/x86/include/asm/trampoline.h
>> @@ -0,0 +1,98 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#ifndef XEN_ASM_TRAMPOLINE_H
>> +#define XEN_ASM_TRAMPOLINE_H
> Not exactly usual a guard name, but once the new naming scheme is finalized
> most will need renaming anyway.

What would you prefer?

>
>> +/*
>> + * Calculate the physical address of a symbol in the trampoline.
>> + *
>> + * Should only be used on symbols declared later in this header.  Specifying
>> + * other symbols will compile but malfunction when used, as will using this
>> + * helper before the trampoline is placed.
>> + */
> As to the last point made - we could of course overcome this by setting
> trampoline_phys to a suitable value initially, and only to its low-mem
> value once the trampoline was moved there.

Yes, but then we've got yet another variable needing to stay in sync
with xen_phys_start (for a while at least).

> As to compiling but malfunctioning - I'd kind of expect relocation
> overflows to be flagged by the linker.

What I meant by this is that things like bootsym(opt_cpu_info) will
compile but may #PF when used or corrupt data if not.

I couldn't think of any good way to bounds check sym between
trampoline_{start,end}[] at build time.

Doing it at runtime is possible, but some usage sites aren't
printk/panic friendly.

~Andrew

