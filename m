Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C157A38C61
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 20:29:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890801.1299936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk6nO-0002ro-Sr; Mon, 17 Feb 2025 19:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890801.1299936; Mon, 17 Feb 2025 19:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk6nO-0002of-Pb; Mon, 17 Feb 2025 19:28:46 +0000
Received: by outflank-mailman (input) for mailman id 890801;
 Mon, 17 Feb 2025 19:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Ii7=VI=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tk6nN-0002oZ-3B
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 19:28:45 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65e047e6-ed65-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 20:28:43 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-220c8eb195aso96692625ad.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 11:28:43 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73242568a0dsm8436448b3a.43.2025.02.17.11.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 11:28:41 -0800 (PST)
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
X-Inumbo-ID: 65e047e6-ed65-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739820522; x=1740425322; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VEJ/B3GBCyQg1NZ8srPFvpNFWpxr50mPaKhI69Ppxgo=;
        b=ZiKvDAlU+QZ1yN7LlSZ8nP/2bOLZlfLkSBi7nXMXnIc3ykViV6QzaaGyRhfG0tvuSy
         H02iLXmPJdp8Wb5bRiDRoqWpO/NboJW7iQZaxs6y0F+gnNu+2jQjE8HPJMmcS+I4s0Sb
         HJRox+zjF4RpE/U3g1Qdj9jW2i87QWLWPakjv+lr2Y5uBt3DRplZjlr3KjDFiWDcvAK/
         en5g18XXeyojV7Pm3JnLKuojywNgYDEq3bW1pFVLv32w8W2jvc2mN41m4dPBhXZz5Kps
         4JNF6IbsH84LsGouNtXI1PnrttfdcBV993yACuwY69awaTf7ZltJcmSSOPpCt6p/0lIA
         allA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739820522; x=1740425322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VEJ/B3GBCyQg1NZ8srPFvpNFWpxr50mPaKhI69Ppxgo=;
        b=FuRBPUNyw8+SkAv1ciEtrlibsrOmdR6/rhshiDra4awOB49WhoRW7AdEkWfPKhrKWW
         ZQnFTSl31LqSTMDTlKy4z+m/gnMiwoPD3biF/fR2AqYsg6EIGB4xvcDs61yEIxavPa/N
         69MKYoh//6Dk43c4GJ7JVz3cCxd7VKW/sjKRVW4jalvYrys8hYwfacDqkTUG6A4GBREJ
         ZXbammeAgSUOne6NF4rT2RFHfP4V0QjvWZ7a+NHo/Bg6h7tbwgRBZfRWt2sTxl18iqzF
         SZGCKJdC48Si33EpA2YcOzj7OWXumSNd9d2G6wfXm5bfBXG+Yo1jlsfWUV0/JCup7WUF
         koNw==
X-Forwarded-Encrypted: i=1; AJvYcCVpJ7QCVbkXFziJrLGN+m+RVjNmV0VZPjxY3U8A/qWdGibNgMVBre7Qk0BTmEyDw9AU3JRkyC17Vbc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yytq+L1E4MzXhPSbUrwF0LDZdj23uRIcr8nAVgzMMkKETwOCqjX
	qZMvKBQ2B2WbcDYedyDBS6slWo0GY9DrZeq1XII3fAp8pNQbsjr0mm+MawH614c=
X-Gm-Gg: ASbGncvLmUYdiA8j14MHP3qQmjnjd2e1NtZ+sDtCmt5jJ55Lk/MUdOSAxEyQZtgx5JP
	giriwsrVdf0hm/qv6jSALIxsT0p0AiSflGyOBHL7/mgfoWeMhdqMM0sewXgOJsE3ylcTfUNApvg
	BNwzJM+rwLOq/8H9qflSiYP9S8+hjGgKokeQH0z+ZgLp+Ta+VVmOjMJayX4BTnR/bN2MEe28hTa
	q5Js3yYrOq/ByMmz+6+JIUL3RfOOElOZunSav2rfJtqAsBSLUwZUCKdil/2c9Ls9hu9NosbjWNZ
	rkRgiwGEvLuZel8lMIRB9WUVZ3oPtEyrNvaDl/katSIiOaTOKae6ve4=
X-Google-Smtp-Source: AGHT+IFw9x3ddCLNhBbl16dPCQzotblc4ykNeeWquQsvMRT1NjsLlII2PlFLuCRaJQswwJsL3MPGMA==
X-Received: by 2002:a05:6a00:2e08:b0:730:74f8:25c1 with SMTP id d2e1a72fcca58-732618c0351mr14386201b3a.15.1739820521870;
        Mon, 17 Feb 2025 11:28:41 -0800 (PST)
Message-ID: <3cf6d45b-0d0e-4669-954f-a545f3ec1a37@linaro.org>
Date: Mon, 17 Feb 2025 11:28:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] cpus: Restrict cpu_common_post_load() code to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-17-philmd@linaro.org>
 <e52485c5-122a-4a95-928f-08fcd17cd772@linaro.org>
 <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <a8be34a4-c157-4a5f-99bc-50c87c1330b1@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/17/25 09:19, Philippe Mathieu-Daudé wrote:
> On 26/1/25 22:16, Richard Henderson wrote:
>> On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
>>> CPU_INTERRUPT_EXIT was removed in commit 3098dba01c7
>>> ("Use a dedicated function to request exit from execution
>>> loop"), tlb_flush() and tb_flush() are related to TCG
>>> accelerator.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>>> ---
>>>   cpu-target.c | 33 +++++++++++++++++++--------------
>>>   1 file changed, 19 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/cpu-target.c b/cpu-target.c
>>> index a2999e7c3c0..c05ef1ff096 100644
>>> --- a/cpu-target.c
>>> +++ b/cpu-target.c
>>> @@ -45,22 +45,27 @@
>>>   #ifndef CONFIG_USER_ONLY
>>>   static int cpu_common_post_load(void *opaque, int version_id)
>>>   {
>>> -    CPUState *cpu = opaque;
>>> +#ifdef CONFIG_TCG
>>> +    if (tcg_enabled()) {
>>
>> Why do you need both ifdef and tcg_enabled()?  I would have thought just tcg_enabled().
>>
>> Are there declarations that are (unnecessarily?) protected?
> 
> No, you are right, tcg_enabled() is sufficient, I don't remember why
> I added the #ifdef.
> 
> Could I include your R-b tag without the #ifdef lines?

Yes.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

