Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55F8A745A5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 09:46:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930304.1332948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5LD-0000F1-56; Fri, 28 Mar 2025 08:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930304.1332948; Fri, 28 Mar 2025 08:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5LD-0000DZ-2L; Fri, 28 Mar 2025 08:45:27 +0000
Received: by outflank-mailman (input) for mailman id 930304;
 Fri, 28 Mar 2025 08:45:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZL4=WP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ty5LB-0000D7-Ee
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 08:45:25 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd1f1060-0bb0-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 09:45:23 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39133f709f5so1102053f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 01:45:23 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b66d56csm1962048f8f.59.2025.03.28.01.45.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Mar 2025 01:45:22 -0700 (PDT)
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
X-Inumbo-ID: fd1f1060-0bb0-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743151523; x=1743756323; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=s9bnBJLGZaOlMiSliapgB998fctt5acJBm0Cdjo5nYU=;
        b=YuO+d0B/xHMmBqMU1tTfVSAxB1r86n0q3Ov6nUJa2L0eswYBLqAhCGbl/mbcibrLT2
         U5JEW8Mg0rzZaDqsA5aPuA9IS6JuZSywlZU2o2MWuGE27I9nHut0KjhaQgfaeNvLSh4M
         pFWY7/Cdd2YA80PQQBf+6OGV8e6anruirbP+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743151523; x=1743756323;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9bnBJLGZaOlMiSliapgB998fctt5acJBm0Cdjo5nYU=;
        b=a/yljqtywxyNRUvzVW9t2lWsIQJi2MzJMVNKdsHSxT6Y4joQK3fA6vMRXQ7cyhF/Yh
         q0BtcNf2lgbExNV5PAfzE27JA4x9xBJgqFkL+hRfgfDofRfp3bHt7Pyi52a4X2593vjf
         powiLCLe7tLSRkSuTQNyBNc3H58l32cTqjLZoTPNaqGiubsPQaW3QRBFclCwFVzn5c02
         jOiETW0XcBy2/Arq0F6m/QngNOvDmPOCzPnpVThStVSr2G7+c7DTpjDHF/zNUseA6whU
         kewPSfi9h7dBlzXatdvLr0K912lqfFEcmc+njQc9Z6SQF/8jXHEy81cYqJK07sWzFCm9
         1FoA==
X-Forwarded-Encrypted: i=1; AJvYcCX6q+1pEV91XH0pMmqQZrD81jip3yC2QYgHLdFtoudrONa5wYOkVOpXwOaEI/x3QHi+sF13vQGgHDQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwDVlBr0sfXqNF3r7YsTBpPOR1par95U3chbhA2Yi6sLT1pNat3
	8HSoIjh7m85iFlsjBBtqShJOEMlP0poPRR3N9lzb2Y79LYyanTNtiy/oPXaji0g=
X-Gm-Gg: ASbGncuD0Fck62I7NolxiPgRSuszCZgNyz34MgCIP31XFZynt21peHcmlo1htPLL59h
	kSy+zMHhfKltUmz27QQm78u84yEn1o5PwmD8I1XeTU9UcL4QIZGZuzcP3i/kBcvt8Nuvhw9SmGa
	64GzQPhrLH21tVzstFUs1/e8KlXHU0+QIGuRXQw04E7TFvOfp96cUX8+4xHsBHQy02Y1iGF2Fmo
	9q/PChb9t+r+oQx6LgK6qVEW7BUOjxyV3vWCUmSR+DhCuDwjSi9Em1gy/jA+0nvaOuSLxVCiwgw
	RAebuxpVn5OOhwMavEZVLBe/TqOI7gq1vOUS1nH0JtY28TBBHzSaNa/VyKY27Ek4uPpiI0xmVQf
	iSb1N/pI0vh+TD5cPqwOQ
X-Google-Smtp-Source: AGHT+IFr6nQb4fF35vQm2vV/SqMxhN690uDx622+UczksvHOg/m9NBNpknc8uCDxTqe93cZXpJC85A==
X-Received: by 2002:a5d:64e4:0:b0:391:253b:4046 with SMTP id ffacd0b85a97d-39ad1746c76mr7120909f8f.16.1743151523236;
        Fri, 28 Mar 2025 01:45:23 -0700 (PDT)
Message-ID: <c5db9bd2-ffc1-49fe-9421-b7f6b61aacaf@citrix.com>
Date: Fri, 28 Mar 2025 08:45:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/config.h: Move BITS_PER_* definitions from
 asm/config.h to xen/config.h
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <6b21fb046cf1c8ca760f5ad72fa3cc13b59c4069.1743092485.git.oleksii.kurochko@gmail.com>
 <404e86cf-740b-4613-8534-a18b3654f874@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <404e86cf-740b-4613-8534-a18b3654f874@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28/03/2025 7:49 am, Jan Beulich wrote:
> On 27.03.2025 18:33, Oleksii Kurochko wrote:
>> BITS_PER_* values can be defined in a common way using compiler-provided macros.
>> Thus, these definitions are moved to xen/config.h to reduce duplication across
>> architectures.
>>
>> Additionally, *_BYTEORDER macros are removed, as BITS_PER_* values now come
>> directly from the compiler environment.
>>
>> The arch_fls() implementation for Arm and PPC is updated to use BITS_PER_INT
>> instead of a hardcoded value of 32.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
>
>> --- a/xen/include/xen/config.h
>> +++ b/xen/include/xen/config.h
>> @@ -98,4 +98,14 @@
>>  #define ZERO_BLOCK_PTR ((void *)-1L)
>>  #endif
>>  
>> +#define BYTES_PER_LONG  __SIZEOF_LONG__
> ... I remain unconvinced that we actually need this (yet then not its sibling
> for int). All uses I can spot could be replaced by sizeof(long).

Perhaps, but that's orthogonal to centralising the definition.  It can
be deferred.

>  This (and its
> sibling) would be needed only for #if uses, and there I would then wonder why
> we couldn't use __SIZEOF_LONG__ directly, now that we assume its universally
> available.

Looking at the usages, sizeof(long) would be best, and shortest.

While we do have a whole bunch of constants which are universally
available now, I still want to use the more normal terms where
possible.  e.g. the difference between __BYTE_ORDER__ and BYTE_ORDER is
relevant for the code shared with userspace, and using BYTE_ORDER across
Xen is the cleaner option.

~Andrew

