Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C448C9B8123
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 18:25:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828860.1243894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Yuo-0008T7-KA; Thu, 31 Oct 2024 17:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828860.1243894; Thu, 31 Oct 2024 17:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6Yuo-0008R1-H4; Thu, 31 Oct 2024 17:24:58 +0000
Received: by outflank-mailman (input) for mailman id 828860;
 Thu, 31 Oct 2024 17:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7hTS=R3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1t6Yun-0008Qv-0z
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 17:24:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 09b6f107-97ad-11ef-a0c3-8be0dac302b0;
 Thu, 31 Oct 2024 18:24:52 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a9a68480164so158515166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 10:24:52 -0700 (PDT)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9e56684374sm86982966b.209.2024.10.31.10.24.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 10:24:50 -0700 (PDT)
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
X-Inumbo-ID: 09b6f107-97ad-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmUiLCJoZWxvIjoibWFpbC1lajEteDYyZS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA5YjZmMTA3LTk3YWQtMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMzk1NDkyLjEzNzQ3Nywic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1730395492; x=1731000292; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cXE1d9PP0AYAvCI+10bUqLyytpIjhrWXmekLrQ60Am8=;
        b=emxYRe+e3XlHy1pWvxgiTxhMNz5knjkLkQ6SSiQT55wrBa1b6a74PJqCcB1sSiXXrf
         QzuxRlPrY2JGP9hlQKIOaxuIdr4QjRF4VGP3QvNDfIo/B9UD3FJNSUOPv8w/X7UBK8iA
         2NP+nn1mGDw8TsfQHkjFw4T+Ps49GVtnSj/78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730395492; x=1731000292;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXE1d9PP0AYAvCI+10bUqLyytpIjhrWXmekLrQ60Am8=;
        b=weMKmBADDeEiAHlRurfnvsoPvgSUWCky2QwHchSg7T8nKdur50a6zw0uHq2UrdkZtL
         gpKSH7gAyVdc/RoTEbBv2pd/oJ4d+gVfauG7luXCB0b4RYqDEzHoWeCWRX5ZaMsh1ywO
         Qo4SFO9wDWlTZNBaYS5jorH6Kk06VoL94DYLd81z0Dymv9wfAbxOaAkSnGP9ozL1jSZj
         3TuU6gT6gbURn6hAbYuGWwHzhh5yHKgy4X72lf5P3WZepQQ1ETPJH3Ts1LjirLburDw7
         DL7+Wd0TCCHkcRY6N5IVZwFLhvi//eRoJPkG2SZxad4+WlmdhaN9lBxD9rLCE3s3/ElT
         bdqw==
X-Gm-Message-State: AOJu0Yy/Ze/Uvfb5SpOSZwyzMFu4rmMDTnur6Tapr5PyRqYJX5U77yfI
	3+2HXAwor96khvUilqTlUlWaVyb/ONHLR6pNed0jtqo5pQGisMtq2osQ9HsyGrQ=
X-Google-Smtp-Source: AGHT+IGcxeRtcidIzkUcA7yIPO6c+Jz3bItngEHalJwBNR35TFHNKRNTULFmQ0WegtJbilY6RewSLA==
X-Received: by 2002:a17:907:1b84:b0:a9a:bbcc:508c with SMTP id a640c23a62f3a-a9de5c91a6emr1334942566b.2.1730395491812;
        Thu, 31 Oct 2024 10:24:51 -0700 (PDT)
Message-ID: <52ddb738-7cff-4929-8ffd-3f288f87e373@citrix.com>
Date: Thu, 31 Oct 2024 17:24:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: Fix cppcheck parallel build more
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20241031165505.3007713-1-andrew.cooper3@citrix.com>
 <D33A8FE6-B6D7-4E6A-82C2-1DB3E24FE97F@arm.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <D33A8FE6-B6D7-4E6A-82C2-1DB3E24FE97F@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 31/10/2024 5:11 pm, Luca Fancellu wrote:
> Hi Andrew,
>
>> On 31 Oct 2024, at 16:55, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> A recent cppcheck run was found to fail:
>>
>>  https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/8237167472
>>
>> with:
>>
>>  "type mismatch! call is<type>() before get<type>()" && is<std::string>()
>>  make[3]: *** [arch/x86/boot/Makefile:28: arch/x86/boot/reloc-trampoline.32.o] Error 1
>>
>> This turns out to be a parallel build issue, combined with a recent change to
>> x86.  Notably, we now have a case where we build both:
>>
>>  CC      arch/x86/boot/reloc-trampoline.32.o
>>  CC      arch/x86/boot/reloc-trampoline.o
>>
>> from the same original C file, and cppcheck uses the source C file as the key
>> for generating it's intermediate files.
>>
>> Switch cppcheck to use the object file as the unique key instead.
>>
>> Fixes: 45bfff651173 ("xen/misra: xen-analysis.py: fix parallel analysis Cppcheck errors")
>> Fixes: db8acf31f96b ("x86/boot: Reuse code to relocate trampoline")
>> Suggested-by: Luca Fancellu <luca.fancellu@arm.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> —
> Looks good to me!
> I’ve also checked with and without the patch and I can’t see any regression in terms of cppcheck
> issues report.
>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Tested-by: Luca Fancellu <luca.fancellu@arm.com>
>

Thanks.  I'll get this committed right away.

~Andrew

