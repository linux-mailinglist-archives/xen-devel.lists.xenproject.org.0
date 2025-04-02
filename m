Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E5FA78CB5
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935634.1337004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvm0-0003rc-1o; Wed, 02 Apr 2025 10:56:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935634.1337004; Wed, 02 Apr 2025 10:56:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvlz-0003p6-V1; Wed, 02 Apr 2025 10:56:43 +0000
Received: by outflank-mailman (input) for mailman id 935634;
 Wed, 02 Apr 2025 10:56:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qYE3=WU=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tzvlz-0003oy-3J
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:56:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 273714d0-0fb1-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 12:56:39 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4394a823036so61313205e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 03:56:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb60caac5sm16715325e9.17.2025.04.02.03.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:56:38 -0700 (PDT)
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
X-Inumbo-ID: 273714d0-0fb1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743591398; x=1744196198; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHMP4jQJgTEjkBcZQU32rbc29wrMeZkXUiaTKmXw1bU=;
        b=g7fvOXsboVlyFqLk15DeapDZYha3ZAFmjCjy3zl2XgccLcsfmmH8FiEkvVTnNm9BtK
         TGjACX25UpnaXk2qQs1RxWMK/oUGBX5ptS8j5kSnuTSZSkrIDBEjjOPvm0kGvUMDRo/d
         afxlxXnt5wGwlrqgUxbPJnYtm9aDaCA8Yodbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591398; x=1744196198;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHMP4jQJgTEjkBcZQU32rbc29wrMeZkXUiaTKmXw1bU=;
        b=PSHL6qEe500TsOP+tXBrI7psySFAOEDUAdhuX/FLA2ML28Y+UEY+rHNpRbJz7VM/AK
         rPwPUsItst7Xch8YL/LQ2Kj5VDX1YANCfhp0TbbIQqb+MT9PBUIdjOgCDPPTbX4HpiHZ
         yi/6yA8F+Rt7X6SHvcCskXXDKmQwr66wOb3aiRm1pQNQzwWLGlSmZt+KDNcK3gmuFFPe
         gYzEagvT/Zo7n4NEd9inVoqbBoWaKSwY+ApsftvZRpNJDJ4yyDC7CJAJK32LFLHNa/yj
         +Z1Yn9JhUeUOfrQy853STa+hA3bOEDnpSzq/nLjfyxOfVdo6FvvKZKyGrJ6iJ+66BNVl
         byNg==
X-Forwarded-Encrypted: i=1; AJvYcCWEgwC/BNeYPt+8d10gwnq6YsyIMBaeB7SW4mLNO3C2wMlQkabXiviABCWLRLhQVC1E1BW91vWCb2Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwQCqtkUhgPK7pZJcGI8CZP94x/jWUqMEEwqDyZqqFXFKGOO0dE
	/is9FTwM/fOmsdtyWr9xVLDGLl61LstrRqT04YLj5w2z3wv9TApuvZMMbEzYtsY=
X-Gm-Gg: ASbGncs9uve5N6H5B/HulbYIYNaDSnUsBSAYS2w0hp2JWPEVB+YBjMfBncJYHRxOTBn
	buyGU68GyvVc3dWFAsCRC86Hzav6R3YSqJjQV8EVRJ46NleCjCPqyzb3dRp8V/dXp90EKmWdWpL
	3hOQxqeWVfCEgf0N3hPNAjmIfCG/U41AFqfGVQlyTve6DbHHDHk2x4fQTru9/LiDoX1zZo40N9H
	+Td493+PRD2nTjZEu0DTUU5xUQynbAwtLJWvn3tURqnJoQ2Z6suZPr//Bzm6zJxjx6Z5Zeov8c4
	ZIfY/UBH4RBuE7x0XboI9324lKIvcl5ll9qrI+MLvdCmGoP+MEyV2X5s1Sr+u6jUlSfSC+9tXZs
	lYDGZ09XcFw==
X-Google-Smtp-Source: AGHT+IGk9BP+BW2j4ms1SJW13ys0tAHFkgbMQwXylJRzz+B1gfhuXzU+IjFbEWToQlkrVR+xjpyqrA==
X-Received: by 2002:a05:600c:34d5:b0:43c:eec7:eab7 with SMTP id 5b1f17b1804b1-43eb5c20fd3mr22669475e9.11.1743591398536;
        Wed, 02 Apr 2025 03:56:38 -0700 (PDT)
Message-ID: <ed1ea3a2-d438-46ec-a59c-7e63c4d794bd@citrix.com>
Date: Wed, 2 Apr 2025 11:56:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/vmx: Use asm goto() in _vmx_cpu_up()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmkhn@proton.me,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250401233444.1181076-1-andrew.cooper3@citrix.com>
 <20250402095621.1278093-1-andrew.cooper3@citrix.com>
 <1d73f823-aab3-4648-a5b9-4d0eedc33fc2@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <1d73f823-aab3-4648-a5b9-4d0eedc33fc2@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/04/2025 11:03 am, Jan Beulich wrote:
> On 02.04.2025 11:56, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
>> @@ -559,25 +559,6 @@ static inline void __vmxoff(void)
>>          : : : "memory" );
>>  }
>>  
>> -static inline int __vmxon(u64 addr)
>> -{
>> -    int rc;
>> -
>> -    asm volatile ( 
>> -        "1: " VMXON_OPCODE MODRM_EAX_06 "\n"
>> -        "   setna %b0 ; neg %0\n" /* CF==1 or ZF==1 --> rc = -1 */
>> -        "2:\n"
>> -        ".section .fixup,\"ax\"\n"
>> -        "3: sub $2,%0 ; jmp 2b\n"    /* #UD or #GP --> rc = -2 */
>> -        ".previous\n"
>> -        _ASM_EXTABLE(1b, 3b)
>> -        : "=q" (rc)
>> -        : "0" (0), "a" (&addr)
>> -        : "memory");
> ... the memory barrier here. I will admit I'm not sure I see why it's
> there, but if the removal was deliberate, then a sentence wants saying
> about this in the description.

Hmm.  (Honestly, I wrote the asm goto from scratch, rather than copying it).

The VMXON instruction itself will modify the 4k vmxon_region.  It's an
opaque region, and it might (implementation specific) become
non-coherent with main memory.

However, we don't have a 4k object we could pass as a faux memory
operand, nor can we use asm goto with outputs (That requires a newer
toolchain, and some compiler errata workarounds, but we can do it
conditionally I think).

Lets put the memory clobber back in.

>  With that or with it re-added:
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

