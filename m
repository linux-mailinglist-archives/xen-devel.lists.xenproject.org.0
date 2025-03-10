Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ABBA59BCC
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 17:57:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906729.1314102 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trgQq-0007Di-6q; Mon, 10 Mar 2025 16:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906729.1314102; Mon, 10 Mar 2025 16:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trgQq-0007BN-3r; Mon, 10 Mar 2025 16:56:48 +0000
Received: by outflank-mailman (input) for mailman id 906729;
 Mon, 10 Mar 2025 16:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trgQo-0007BH-OK
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 16:56:46 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a29cf71f-fdd0-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 17:56:40 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ff087762bbso6623009a91.3
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 09:56:40 -0700 (PDT)
Received: from [192.168.1.67] ([38.39.164.180])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22410aa883asm80360745ad.239.2025.03.10.09.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 09:56:38 -0700 (PDT)
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
X-Inumbo-ID: a29cf71f-fdd0-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741625799; x=1742230599; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZkjkedmykN6Dnae+6hPjYb5eiAU0Rz5li5jIqpcMQ1w=;
        b=rMzXEY2xxM/cx5Z/HluG4sIXlkmIUOuH7SMMFiNp0yABPnoKbN0kEzyKG5DLm2GBtG
         /+GdYw+gs21QkQ5AAKZzbB4tQnx63KWYmR9a6X+WtoW6pWFhip2nSRm5ShI0TNVy2Xyk
         GBk9qKTqNKMG1Lm5Y/JPeEE0OI3eiJ7U/d9OqdxqH+S/TbxqHNFtPAQZ4IjMYzTdxOjP
         Eqn11n4EsfFXnxCgFfftDY9AIIBOYrarnwpfw7uLJ3h4G1uGyBP/6kF87MNph1hWnblO
         qyBfld3sGPSi7APz/C+XZ0AO6gJ24ExnahiF0Ahl8/lkPDEvMpuIAnTiOPLegNJFYsBP
         K5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741625799; x=1742230599;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZkjkedmykN6Dnae+6hPjYb5eiAU0Rz5li5jIqpcMQ1w=;
        b=Ylljc1hw2CXWUmm6nTNPZZn0Ey2J+f5Dts2Lh7hJo1+LZoCh4wkZuNIfqdyaNQU0eZ
         L9px4TpN6RZ3cI+XTLnmmWBi3r2tL4nMx9qL6DjNKXcGf5j8yIFQ57mScqGJjtzWl6jV
         55okc4WYSldCXXRFIm+y0YJgKdWty7MK2faAVQLogQvgu1cTeUfuIlQkC4x1uOszbTyo
         QCDSUPa+Ip7izIE1W9TDRujXlEylBUaO3qARfUobuAcnHFNK0QvEH+4tSCz32u2gDJvC
         203UuQdLOZbWWXkglptvOuol1oj3qUtCNi/qJIgV//P2qGm4sfFZGqHmXiTMSm88x66O
         pF0w==
X-Forwarded-Encrypted: i=1; AJvYcCX/6dm8NOfhdOs7hdn57inFu37KJpWz/YGTt49aWMJ3f9zxL+eBlz3NSDlvSnMF2ZYeDsF7fu9cfxA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt1GQUQKPPqsyFBW65MN1xHtT4n8AbiDVWTVU/GP30DHgzXKgG
	koUcKhYLPZ1bROW03tmO6RNkGezhWT1TnNIlTa+cZ5K2ZbyqK7SGaMIVmP5ByS0=
X-Gm-Gg: ASbGncuM5EzW7JtT1nCcHntNLfP+uFySMcupnpHecqjYw5ekWfdIYrOiBr2APXUhRHX
	c4D2SRw7i3xhEGTtg2984xquqpL4oc5O0BsJeMnBMZqJfuVhF9srjvhm7IGU9KePv3DkamOUDxD
	9QutXBwNSKltDAfmuLdRC32yDn1ZQLFtsrPljbMse0HtXM31yRvyz6AFkKObdZD5o+0Wwsi5nMb
	rXwuJg7vD3MLaHC0hJQfky/h33kbmjado9moWFy6TLtGrLywNl6MdxC45S4LMbjPom2s5YOhpNv
	onoAFShUxS2/Nqjwduf2S8CZggGoIrLTtLD5GXtpKx4Zd67BENIRKTSRSg==
X-Google-Smtp-Source: AGHT+IHIbgCn3Exn+AALN657KIom6PGObNAGMKxJbf0VIqQkDogxhfDXJch+Uz3paJ/iK/pOhThzrA==
X-Received: by 2002:a17:90b:4a51:b0:2fa:e9b:33b8 with SMTP id 98e67ed59e1d1-300ff10caacmr851943a91.18.1741625798731;
        Mon, 10 Mar 2025 09:56:38 -0700 (PDT)
Message-ID: <a57faa36-2e66-4438-accc-0cbfdeebf100@linaro.org>
Date: Mon, 10 Mar 2025 09:56:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] make system memory API available for common code
Content-Language: en-US
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, alex.bennee@linaro.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, kvm@vger.kernel.org,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Paul Durrant <paul@xen.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony PERARD <anthony@xenproject.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, manos.pitsidianakis@linaro.org,
 qemu-riscv@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
 <f231b3be-b308-56cf-53ff-1a6a7fb4da5c@eik.bme.hu>
 <c5b9eea9-c412-461d-b79b-0fa2f72128ee@linaro.org>
In-Reply-To: <c5b9eea9-c412-461d-b79b-0fa2f72128ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/10/25 09:28, Pierrick Bouvier wrote:
> Hi Zoltan,
> 
> On 3/10/25 06:23, BALATON Zoltan wrote:
>> On Sun, 9 Mar 2025, Pierrick Bouvier wrote:
>>> The main goal of this series is to be able to call any memory ld/st function
>>> from code that is *not* target dependent.
>>
>> Why is that needed?
>>
> 
> this series belongs to the "single binary" topic, where we are trying to
> build a single QEMU binary with all architectures embedded.
> 
> To achieve that, we need to have every single compilation unit compiled
> only once, to be able to link a binary without any symbol conflict.
> 
> A consequence of that is target specific code (in terms of code relying
> of target specific macros) needs to be converted to common code,
> checking at runtime properties of the target we run. We are tackling
> various places in QEMU codebase at the same time, which can be confusing
> for the community members.
> 
> This series take care of system memory related functions and associated
> compilation units in system/.
> 
>>> As a positive side effect, we can
>>> turn related system compilation units into common code.
>>
>> Are there any negative side effects? In particular have you done any
>> performance benchmarking to see if this causes a measurable slow down?
>> Such as with the STREAM benchmark:
>> https://stackoverflow.com/questions/56086993/what-does-stream-memory-bandwidth-benchmark-really-measure
>>
>> Maybe it would be good to have some performance tests similiar to
>> functional tests that could be run like the CI tests to detect such
>> performance changes. People report that QEMU is getting slower and slower
>> with each release. Maybe it could be a GSoC project to make such tests but
>> maybe we're too late for that.
>>
> 
> I agree with you, and it's something we have mentioned during our
> "internal" conversations. Testing performance with existing functional
> tests would already be a first good step. However, given the poor
> reliability we have on our CI runners, I think it's a bit doomed.
> 
> Ideally, every QEMU release cycle should have a performance measurement
> window to detect potential sources of regressions.
> 
> To answer to your specific question, I am trying first to get a review
> on the approach taken. We can always optimize in next series version, in
> case we identify it's a big deal to introduce a branch for every memory
> related function call.
> 
> In all cases, transforming code relying on compile time
> optimization/dead code elimination through defines to runtime checks
> will *always* have an impact, even though it should be minimal in most
> of cases. But the maintenance and compilation time benefits, as well as
> the perspectives it opens (single binary, heterogeneous emulation, use
> QEMU as a library) are worth it IMHO.
> 
>> Regards,
>> BALATON Zoltan
> 
> Regards,
> Pierrick
> 

As a side note, we recently did some work around performance analysis 
(for aarch64), as you can see here [1]. In the end, QEMU performance 
depends (roughly in this order) on:
1. quality of code generated by TCG
2. helper code to implement instructions
3. mmu emulation

Other state of the art translators that exist are faster (fex, box64) 
mainly by enhancing 1, and relying on various tricks to avoid 
translating some libraries calls. But those translators are host/target 
specific, and the ratio of instructions generated (vs target ones read) 
is much lower than QEMU. In the experimentation listed in the blog, I 
observed that for qemu-system-aarch64, we have an average expansion 
factor of around 18 (1 guest insn translates to 18 host ones).

For users seeing performance decreases, beyond the QEMU code changes, 
adding new target instructions may add new helpers, which may be called 
by the stack people use, and they can sometimes observe a slower behaviour.

There are probably some other low hanging fruits for other target 
architectures.

[1] https://www.linaro.org/blog/qemu-a-tale-of-performance-analysis/

