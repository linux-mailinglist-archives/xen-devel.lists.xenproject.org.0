Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4D9C3DCF
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 12:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833626.1248803 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAT2c-0006BL-G9; Mon, 11 Nov 2024 11:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833626.1248803; Mon, 11 Nov 2024 11:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAT2c-00068a-Cj; Mon, 11 Nov 2024 11:57:10 +0000
Received: by outflank-mailman (input) for mailman id 833626;
 Mon, 11 Nov 2024 11:57:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mW2F=SG=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tAT2b-00068U-Lc
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 11:57:09 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ff5ed8a-a024-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 12:57:02 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so6525205a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 03:57:02 -0800 (PST)
Received: from [10.125.226.166] ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cf03b7f0f9sm5067106a12.27.2024.11.11.03.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 03:57:00 -0800 (PST)
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
X-Inumbo-ID: 0ff5ed8a-a024-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzAiLCJoZWxvIjoibWFpbC1lZDEteDUzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjBmZjVlZDhhLWEwMjQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzI2MjIyLjEwNzg0OSwic2VuZGVyIjoiYW5kcmV3LmNvb3BlckBjbG91ZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1731326221; x=1731931021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e1hwumH4XvsSOFed5nuM2KmwymIIeNNj8efL7i247R0=;
        b=lNWkDIr5jEJw6LXCyrvJKlNFrjmsck4T6L4vxtqAYDmMJEjyVM10Iz466ttWS8Zqn5
         vxgoRtmKHLEsLXJCn6Uk+0Uhv9P2uA3Q16d8wX1rxI44u4hnhyuyeQ3xFmYKEiP5Vle9
         I/znXBybDamey+HNtAGm8r3/XQawAHfH3A5Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731326221; x=1731931021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1hwumH4XvsSOFed5nuM2KmwymIIeNNj8efL7i247R0=;
        b=fa6MaGLRFVnWcymnKygtYbxJO3FPIX9HMrJQHaGP/dxOwFakLfvotU4s4Cli5SuVWb
         ezSN7xt11OoBEWTlffwZhAWWX85l3UO8YpgIUXc1Jrca4wpphxJE64cMJg4lbyHsUI6U
         03ksnHiJcRl7WkKuEj6EFJ3gBms1J+d55wKajGFgOI3OIDd2zxElMzeNlHilhvNjBEG/
         VTklXga3c/CGJQKrOZWpUY0mMuNz1OY4B8rC4dxgiMn4n3cv6QtMsVSfXNaDopNVAuWy
         +MIiyu6XYSGjdS7Lex/29wmiEG8qTVmGRlyXVQGBiMVV7fHQ4lM76e9yZkPqjJ92Mg7T
         qaeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1Wuxn7MDtaNi1HStIE/u+zB4HMZaPcmadEi/rktsppXKEjNRo3RKiPrG/pyLnn/9ynv36BUgnOjQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzQl7rfGvi8776yBRhwDBITXS4r/8Kv/JzxPTbMty+xlNcyI3Ht
	8EB/OX9rmrkS40T8mV6AJXjH4z/VEluwTOK7jYF9e1Xx4KWGSpsxA64VtCtq5dOEmXEiDIsYnK1
	f
X-Google-Smtp-Source: AGHT+IEkxm6SQSC/eaHL33Bd/pWoriVeGypDXqDUnwWjlW+2Csp+nP3XqREZbLfI8RTT/fYcBxgC5A==
X-Received: by 2002:a50:8ac9:0:b0:5cf:9f6:1bbd with SMTP id 4fb4d7f45d1cf-5cf0a45ca4bmr6228695a12.29.1731326221464;
        Mon, 11 Nov 2024 03:57:01 -0800 (PST)
Message-ID: <be9a3ac5-c144-47ad-8e9b-6e1d17526680@citrix.com>
Date: Mon, 11 Nov 2024 11:56:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] x86: Delete mach_apic.h
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241108195820.789716-1-andrew.cooper3@citrix.com>
 <20241108195820.789716-11-andrew.cooper3@citrix.com>
 <aab4e7e6-1dce-4f6d-a135-f79dc5a3f2b9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aab4e7e6-1dce-4f6d-a135-f79dc5a3f2b9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/11/2024 9:13 am, Jan Beulich wrote:
> On 08.11.2024 20:58, Andrew Cooper wrote:
>> All useful content has been moved elsewhere.
>>
>> Clean up the dregs, and remove the entire mach-generic include path.
> What's "dregs" here?

Oh.  "The leftovers".

Surprisingly (to me at least), it's not slang.  It is most common used
to refer to what remains in the cup when you've drunk a coffee/tea/etc.

>
>> --- a/xen/arch/x86/include/asm/mach-generic/mach_apic.h
>> +++ /dev/null
>> @@ -1,24 +0,0 @@
>> -#ifndef __ASM_MACH_APIC_H
>> -#define __ASM_MACH_APIC_H
>> -
>> -#include <asm/apic.h>
>> -#include <asm/io_apic.h>
>> -#include <asm/genapic.h>
>> -#include <asm/smp.h>
>> -
>> -static inline void enable_apic_mode(void)
>> -{
>> -	/* Not needed for modern ES7000 which boot in Virtual Wire mode. */
>> -	/*es7000_sw_apic();*/
>> -}
>> -
>> -#define apicid_to_node(apicid) ((int)apicid_to_node[(u32)apicid])
>> -
>> -extern u32 bios_cpu_apicid[];
> For these two, isn't there some Misra aspect? They're both unused, and Misra
> generally dislikes unused stuff.

Eclair won't complain about either, I don't think.

The macro will just disappear after preprocessing, whereas we've
explicitly deviated Rule 8.6 because of how we use dead-code-elimination
to reduce ifdefary.

>  Whereas ...
>
>> -static inline int multi_timer_check(int apic, int irq)
>> -{
>> -	return 0;
>> -}
> ... this and the other inline function further up clearly have their sole
> users removed here, so are fine without any further text in the description.
>
> Preferably with the description amended / clarified:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Lemme have another go.

~Andrew

