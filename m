Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C2187EA62
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 14:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694722.1083770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDNK-0007E4-Ph; Mon, 18 Mar 2024 13:50:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694722.1083770; Mon, 18 Mar 2024 13:50:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDNK-0007Ax-Mj; Mon, 18 Mar 2024 13:50:02 +0000
Received: by outflank-mailman (input) for mailman id 694722;
 Mon, 18 Mar 2024 13:50:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=we9v=KY=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rmDNI-0006xz-S3
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 13:50:00 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69404b7d-e52e-11ee-afdd-a90da7624cb6;
 Mon, 18 Mar 2024 14:49:59 +0100 (CET)
Received: by mail-yb1-xb33.google.com with SMTP id
 3f1490d57ef6-dcbc00f6c04so3712625276.3
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 06:49:59 -0700 (PDT)
Received: from [10.80.67.23] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 fk13-20020a05622a558d00b00430b59c37acsm3442625qtb.13.2024.03.18.06.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 06:49:58 -0700 (PDT)
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
X-Inumbo-ID: 69404b7d-e52e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710769799; x=1711374599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGI563ovUKf9CtxDtAQ3CoJsPfD3toO3vX1R2ObYPCg=;
        b=Ios6ERztea6ijIukT0d9m6zLHXsED20UGdO0RQEyUmyknzY1sIICUCNmrBivZjb08O
         1ZU+TZ/jIJItk+xohtC2btqoEUy+u77LsM2lw1fqRvwt2VczFkLZq5FFt4Ofpz4sXyTN
         r3oS56X0kFd8Inq2U0J7Kb4/IIP2dxxHHcUaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710769799; x=1711374599;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jGI563ovUKf9CtxDtAQ3CoJsPfD3toO3vX1R2ObYPCg=;
        b=AvQyzbOnpc009rAAGtmNFdWljBFOB8Tc97l+X+BNsqQYcnInG0I1utFV5/UmJ64bpQ
         L22c8pVEHqNPR/UvgvqRUQMTNk9ehBJY/LDscYHATFJpeykC9YNmaa+RMQw1FLpgDTK+
         SdlmfuZN6+a6Zh1fcNlbWtRAD0MUghAjneUV+K5fd/+Y6ZtKgV2TUGCJsc9nztqx2pEm
         ZkHWmJGsDyJUeFsL+J95v8PM4ejYWKwfp1FTuv6fEd+aMRxNC2AMgFXqmzkqbiXbSpDQ
         7fTTY96HbupiI05biy8o5Ym/eagcedLeUdJBErfuOK9UN4DUudXADhq13mjohkhc51HW
         42+g==
X-Forwarded-Encrypted: i=1; AJvYcCVlVsyN+Ek8rY7EzSf/GlY9E38PUOD7gCYiZbcfeh39zOCTI286KzsOwazqQKz6M/fF2h3gG3/eg+HtIjVjo6qNGND6p/O52f1Nx0284QQ=
X-Gm-Message-State: AOJu0Yym+f0lGBg7rrxhxe9dd5xIEyHZ6T2UPniCy2y791oZTCk3/tN7
	azebxhlHmAaitpU+jfFdaE99jcWNmwhHYxUB5cbibri+QawUX7fe0UJu4AY2Qjk=
X-Google-Smtp-Source: AGHT+IG0FxvqvMUoLFE/nBLua3BfXo+u0XNYkVAAzBs35HqXyjaTizG6HnlvJV2r/Oxe2VX/bWRbyg==
X-Received: by 2002:a25:6a83:0:b0:dcb:ba75:bde7 with SMTP id f125-20020a256a83000000b00dcbba75bde7mr6562385ybc.7.1710769798711;
        Mon, 18 Mar 2024 06:49:58 -0700 (PDT)
Message-ID: <14accd85-d549-4551-a95c-6c8bcee92db5@citrix.com>
Date: Mon, 18 Mar 2024 13:49:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] xen/virtual-region: Drop setup_virtual_regions()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240318110442.3653997-1-andrew.cooper3@citrix.com>
 <20240318110442.3653997-5-andrew.cooper3@citrix.com>
 <047ecaf2-66c6-4d07-ab14-9c50acfc1f9a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <047ecaf2-66c6-4d07-ab14-9c50acfc1f9a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/03/2024 1:29 pm, Jan Beulich wrote:
> On 18.03.2024 12:04, Andrew Cooper wrote:
>> --- a/xen/common/virtual_region.c
>> +++ b/xen/common/virtual_region.c
>> @@ -39,6 +39,11 @@ static struct virtual_region core = {
>>          { __start_bug_frames_2, __stop_bug_frames_2 },
>>          { __start_bug_frames_3, __stop_bug_frames_3 },
>>      },
>> +
>> +#ifdef CONFIG_X86
>> +    .ex = __start___ex_table,
>> +    .ex_end = __stop___ex_table,
>> +#endif
>>  };
>>  
>>  /* Becomes irrelevant when __init sections are cleared. */
>> @@ -57,6 +62,11 @@ static struct virtual_region core_init __initdata = {
>>          { __start_bug_frames_2, __stop_bug_frames_2 },
>>          { __start_bug_frames_3, __stop_bug_frames_3 },
>>      },
>> +
>> +#ifdef CONFIG_X86
>> +    .ex = __start___ex_table,
>> +    .ex_end = __stop___ex_table,
>> +#endif
>>  };
> My main reservation here is this x86-specific code in a common file.
> Are we certain both RISC-V and PPC will get away without needing to
> touch this? If so, I might consider ack-ing. But really I'd prefer if
> this could be minimally abstracted, via e.g. CONFIG_HAS_EXTABLE
> (selected by x86 only for now).

This isn't the first bit of CONFIG_X86 in this file.  However, I'd not
spotted that we have CONFIG_HAS_EX_TABLE already.  I can swap.

As to extable on other architectures, that's not something I can answer,
although it's not something I can see in Oleksii's or Shawn's series so far.

~Andrew

