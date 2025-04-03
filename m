Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F0A7A4A6
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 16:08:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936865.1338003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0LFE-0000Gw-91; Thu, 03 Apr 2025 14:08:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936865.1338003; Thu, 03 Apr 2025 14:08:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0LFE-0000Eq-4a; Thu, 03 Apr 2025 14:08:36 +0000
Received: by outflank-mailman (input) for mailman id 936865;
 Thu, 03 Apr 2025 14:08:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JbNy=WV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u0LFC-0008BZ-Qc
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 14:08:34 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 210fd271-1095-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 16:08:34 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so827276f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 07:08:34 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a7064sm1966451f8f.34.2025.04.03.07.08.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 07:08:33 -0700 (PDT)
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
X-Inumbo-ID: 210fd271-1095-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743689313; x=1744294113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nPGKjI/9owz/1bmJghTFym+xVl/jvsn3w2NTC9wCCXE=;
        b=RV5WHOI7whdJHHu0Q8J8s6tyjxAcEaR75c1W45F4CG+DYqnzD1RbETGx3u+joT8tMp
         0XxWx55uwdipC1z9ANPsDb+wYpKUjArBHD0U7ZEE2UM4YzM0iPxTDkJkDJhFQUailbab
         kNnqvbitzgdjBw+maC9w729NoZqSKR7iH5Dws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743689313; x=1744294113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nPGKjI/9owz/1bmJghTFym+xVl/jvsn3w2NTC9wCCXE=;
        b=GXrIBOyy5M7BfH6BLj8aHwDbrp11YnzPHZwixNUnH9pQodszXYk0/zdYeTyOK4Bfth
         SqYDI4k2XYaGp/ww9ySef8G5/qiKW2+3XRVu66Yo0VFifJkl6lgUlcKw1kVormSvoqnx
         CpBpnycevu/HzDxLMeUlDvFwHHe+LZHEctYTkPujJkqA48Xp+YTl+aqNjwL3ceVUchw8
         sdYxsg1rPQrMjWKMW3v80hL5shNE5s3LKjpaMvfgxy2anx3bi539L3Z7oIhjFFWkgvhO
         NN9gK5x+oOdgjc77abxVw8FPrWxShdJKtdn2pIV+vs7iUyEOiHmThSzsJBNtrxsphqo5
         H67w==
X-Forwarded-Encrypted: i=1; AJvYcCU5HmEU6byfbYPZyh4DYXZvM5pW/+aL3A3IOdGsOTWaQxZWCY+ijI+3gGWUAdjJ+1757GI8vhW4Wu8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1khrGJPEt+renYAwjqLstbR4LdEG53UNDQLdzngz+UNF/Ozks
	mVyMcDdqchaxGFshTCsjbKgkD1svTLvmNIXWeT7+nI/RmUJ7bZfzs8COKioLOnw=
X-Gm-Gg: ASbGncu+df2wZwl8vgjuKVzvmpcXcpAAxPK1ppwQ8iZ8yE4sh1M11Y97InkPHVaHsGq
	4Sk716r9ujz3se3pEpMaNRn1qnrPcTagpw31997d8cyEy4nLrBEPmmnwt3M7C/3B930ww2yzDbg
	S6j50/BFp7TWbcPMSyKzG2ktipD3lpNdq1ISUeGBsRrYZdZie54ePcC8lRep8xLqvnsoYZd3muy
	lKLSVbwBHt2oDpRSncKOf2VoPZlVE5OnXzbxWb+huDqgvXZGo287lFybLm1/8L/lPrlEtoxT+8V
	2r3csLcZHyQlC8VQlCsp9V/Jrkd8OX9uhBvml+OrXP4AsX/zqzG/rDBFC80e+/BbSV7auKk6lZB
	dA2uKGpjbeg==
X-Google-Smtp-Source: AGHT+IHg/urLNUQ48QfES1BXMWxCFXZ/+TasPJIqR1JIlyodljduolBdOSAiSmIWOPL8CIFqSDRYJg==
X-Received: by 2002:a05:6000:1acf:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-39c29752f9cmr6005648f8f.15.1743689313407;
        Thu, 03 Apr 2025 07:08:33 -0700 (PDT)
Message-ID: <463eca2f-9e2a-474c-ae5a-4ed6cfe01ff8@citrix.com>
Date: Thu, 3 Apr 2025 15:08:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/amd: Add support for AMD TCE
To: Jan Beulich <jbeulich@suse.com>, Teddy Astie <teddy.astie@vates.tech>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <6b751a400df49217defc89a19b3ac2ca33ab7690.1743683787.git.teddy.astie@vates.tech>
 <73b1dd32-c15e-46c4-982c-9b7a33c8785b@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <73b1dd32-c15e-46c4-982c-9b7a33c8785b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/04/2025 1:58 pm, Jan Beulich wrote:
> On 03.04.2025 14:44, Teddy Astie wrote:
>> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
>> ---
>> RFC:
>>  - is this change actually safe ?
> Well, before getting here with reading I was already about to ask this very
> question. It's really you who needs to prove it.
>
>>  - should we add a tce/no-tce option to opt-in/out this feature ?
> Unless we're entirely certain we got this right and didn't overlook any
> corner case, perhaps better to do so.

To bring across a quote of mine from Mattermost:

"I'm reasonably sure our TLB handling algorithm is safe for it,
following the PCID work we did for Meltdown"

But, proving this is hard.

Some history: INVLPG flushing the entire paging structure cache
(non-leaf mappings) was a last-minute "fix" to keep Windows working on
the Pentium(?), where it had started using INVLPG from the 486(?) but
with a logical error.

AMD's TCE feature is "that's a hefty hit to keep around, so here's an
option for the behaviour one would more reasonably expect from INVLPG".

Anyway.  I have a suspicion that Intel's INVPCID no longer followed the
INVLPG behaviour anyway, and that we were forced to account for that. 
However, I'm struggling to find confirmation one way or another in the SDM.

Another mitigating factor is that, because we use recursive pagetables,
we have to upgrade an INVLPG into a full flush anyway if we edited
non-leaf entries.


As to a cmdline option, there's cpuid=no-tce if we really really need
it, but I don't think we want a dedicated TCE option.


>> --- a/xen/arch/x86/smpboot.c
>> +++ b/xen/arch/x86/smpboot.c
>> @@ -372,6 +372,9 @@ void asmlinkage start_secondary(void *unused)
>>  
>>      microcode_update_one();
>>  
>> +    if ( boot_cpu_has(X86_FEATURE_TCE) )
>> +        write_efer(read_efer() | EFER_TCE);
> Same here. But I wonder if you couldn't set the bit in trampoline_efer.

Yes, do set it in trampoline_efer, and drop this hunk.

~Andrew

