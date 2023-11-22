Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A697F4D1A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 17:46:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638919.995893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qMr-0005Hl-5c; Wed, 22 Nov 2023 16:46:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638919.995893; Wed, 22 Nov 2023 16:46:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5qMr-0005F8-2f; Wed, 22 Nov 2023 16:46:25 +0000
Received: by outflank-mailman (input) for mailman id 638919;
 Wed, 22 Nov 2023 16:46:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q+k4=HD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1r5qMp-0005F2-Jq
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 16:46:23 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa6bd8c8-8956-11ee-9b0e-b553b5be7939;
 Wed, 22 Nov 2023 17:46:21 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b2c9ee8ecso11088985e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Nov 2023 08:46:21 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-107-252.as13285.net. [92.26.107.252])
 by smtp.gmail.com with ESMTPSA id
 f18-20020adfdb52000000b00332cbda1970sm6997169wrj.30.2023.11.22.08.46.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Nov 2023 08:46:20 -0800 (PST)
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
X-Inumbo-ID: aa6bd8c8-8956-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700671581; x=1701276381; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0nBr/HxEZmBTuCjyQkeGq4JfG7qaAlLFHTaKsmjpPvw=;
        b=M+MJ5AeGKewnpPGCKZlIp43/lAMwmWe/udX+mOH51V4qU7WP5K1XudOUAgTyQKQhb0
         sMERoevENHRibx65OCiN8vfyX5JNiF4ZfoB6jDmr3nbfegdKwaY6rfvyHa0E06PcpDz3
         fbXQPFcdoYK3mEofpKamVgSdPhr3I6SFqyDRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671581; x=1701276381;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0nBr/HxEZmBTuCjyQkeGq4JfG7qaAlLFHTaKsmjpPvw=;
        b=cbxmEn3yT8sLECaP90NtL5dMPXpIvMGAwijQCKsNQhtgMykazP09FeKFW8GtKU8N+s
         ACe3lW97BwLsg8nw1bU9zdbJO+UFwVtqHfAHBUi8XGaFvlRciplMnBn82/wH+gG1tuo9
         5F82mqf5O3lZg3qpEg82Bptg6M0gbquw5WEateWrrIzbR1MiJKKmlJxIO6/SRuOQmdUy
         /CZ9WaJzg1uwEkiGpMD4WLJkIIgZ8KU/bgDeoBhfMphCJuHOhUdbROxm/q5HTH45DN+C
         kLhX2AuK+dk7adIic1QAqzh0zcf9vKX375QsGiQlTxqoaMmjeBzeD7f8ettwgG6KdayZ
         8NwA==
X-Gm-Message-State: AOJu0YyQf75q1aaMmQSthKzH7UcmFAT25eWXA7qk9p042bxZTPFmRhK7
	zjmI96a/vrc/RHCunR7x9shbxA==
X-Google-Smtp-Source: AGHT+IGMSlqm9ZwhEXCNxcdxWwKscVi2qoco7jDt+T9PYF1YgxIVFI3XdMLGiHTy6KwXtcWwwW+X8A==
X-Received: by 2002:a5d:64cb:0:b0:332:cbe4:8b0c with SMTP id f11-20020a5d64cb000000b00332cbe48b0cmr2303057wri.58.1700671581023;
        Wed, 22 Nov 2023 08:46:21 -0800 (PST)
Message-ID: <adaa6d55-266d-4df8-8967-9340080d17e4@citrix.com>
Date: Wed, 22 Nov 2023 16:46:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/MISRA: Remove nonstandard inline keywords
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>
References: <20231122142733.1818331-1-andrew.cooper3@citrix.com>
 <20231122142733.1818331-4-andrew.cooper3@citrix.com>
 <e5476808dbef67bea7ce3902d4d8b3c1@bugseng.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <e5476808dbef67bea7ce3902d4d8b3c1@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/11/2023 4:39 pm, Nicola Vetrini wrote:
> On 2023-11-22 15:27, Andrew Cooper wrote:
>> The differences between inline, __inline and __inline__ keywords are a
>> vestigial remnant of older C standards, and in Xen we use inline almost
>> exclusively.
>>
>> Replace __inline and __inline__ with regular inline, and remove their
>> exceptions from the MISRA configuration.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Wei Liu <wl@xen.org>
>> CC: Stefano Stabellini <sstabellini@kernel.org>
>> CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
>> CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
>> CC: Simone Ballarin <simone.ballarin@bugseng.com>
>>
>> I'm entirely guessing at the Eclair configuration.
>> ---
>
> The configuration changes are ok. One observation below.

Thanks.  Can I take that as an Ack/Reviewed-by ?

>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>> index 04b8bc18df0e..16d554f2a593 100644
>> --- a/xen/include/xen/compiler.h
>> +++ b/xen/include/xen/compiler.h
>> @@ -83,7 +82,7 @@
>>   * inline functions not expanded inline get placed in .init.text.
>>   */
>>  #include <xen/init.h>
>> -#define __inline__ __inline__ __init
>> +#define inline inline __init
>
> The violation of Rule 20.4 (A macro shall not be defined with the same
> name as a keyword) is still present due to this macro.

I was expecting this to come up.

There's a comment half out of context above, but to expand on it, we
have a feature in the build system where if you say obj-y += foo.init.o
then it gets compiled as normal and then all symbols checked for being
in the relevant .init sections.  It's a safeguard around init-only code
ending up in the runtime image (which is good for other goals of safety).

This particular define is necessary to cause out-of-lined static inlines
to end up in the right section, without having to invent a new
__inline_or_init macro and rewriting half the header files in the project.

I think it's going to need a local deviation.  It's deliberate, and all
we're doing is using the inline keyword to hook in an extra __section()
attribute.

~Andrew

