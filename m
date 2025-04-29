Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB39AA1122
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 18:03:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972882.1361158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9nPg-0003ao-Gh; Tue, 29 Apr 2025 16:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972882.1361158; Tue, 29 Apr 2025 16:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9nPg-0003YO-D3; Tue, 29 Apr 2025 16:02:28 +0000
Received: by outflank-mailman (input) for mailman id 972882;
 Tue, 29 Apr 2025 16:02:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yPhw=XP=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u9nPf-0003YI-Pd
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 16:02:27 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 54c49e7e-2513-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 18:02:20 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39129fc51f8so4175102f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 09:02:20 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e46a54sm14584945f8f.67.2025.04.29.09.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 09:02:19 -0700 (PDT)
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
X-Inumbo-ID: 54c49e7e-2513-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745942540; x=1746547340; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YXTiwudkhNYnpikHxED5t+JgvSi8b1EgQ9TieD7W0x4=;
        b=buZNPiJJGK1ZRZIIrhRb+uRuTlR0a7DoPZfAFGWmZwMmXoMIFYbF52sy4g628m+TqW
         sdoRXFCY/c/CcFtahGjtG6wh+6II3jHQs9bCMq46TPocB5sf+nmgPoAf0kQq46WQTF7A
         TUn9/5tnvTO2JzgyD4G/pTYvzKtp0JGe9KCKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942540; x=1746547340;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YXTiwudkhNYnpikHxED5t+JgvSi8b1EgQ9TieD7W0x4=;
        b=a2+SoYUB1XA36HDwLgmBPWzBO59Z09/Hib1mioaqtc0JXMRhI6paBuGOFcanlySyPi
         3iVp/0VYRD/vufbY/qAf4khw5i1ZiZ/2tb/6jiiMVOHq4pZNTItI8aGv705wbVOzZdXa
         jDM95e5h4PAU1wUceOlt/P4GE3UebiNrauvoqd/oB2FvoMTRDK8cD8FazW+PVXAA3YlT
         1qPV4V8Bz8n6O1T/lsTfRuxlnkcF1j7G5SqzIEnPmACe61oLpx39l5UmkNnBaiNJT8Zy
         IT1dmF1PbK2sY/wpTjO3vKkRJvWgubI1wgR65Ymm6O8e2Cm3A/XhysjYISioS7Ll645g
         Kp7w==
X-Forwarded-Encrypted: i=1; AJvYcCViUIuDfYB3jgKR2pLm3gx5ESKgU6PJqeVb25e9wQoGQ7KfBUo7h5xgNHd8e4HelczsJOt2yWNkUW4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxHntAwAcAPX98vmYCQ/fVzB0SdpmbQjG5s8Nofdzn/hnQlrThB
	le/kMsUjENQePfadwg8sGuchGOaUZGHHfvCMqsLP+8pHJghwGAGIOCO4WROE1ZY=
X-Gm-Gg: ASbGncsGedn7XjLK9lbxbDjco7yh9Fgz3rw8cttrsY6QBnDo17OwFxKw7byEXxzHkh8
	IQKRf0u34s9xtRAopYZzFSxBtyL6mAzcjbxs5+FyPzz1lLPbILXStKIemJ14cdjknaTmHNoAduV
	p6HQBmzc3c8stv3kuklS9BHWo0oPaL4NjnI1f03/EPIXYny5JLwH5gigmDxrOHcrYXvJH6E1dMF
	y4VOM5SR4R0BDUTsJV4N22ZlUAn54seZSwl6mr+ljsWmZXnPfRA5lL9D21OC8oP6w/lgsdgZAnx
	TLA0zdtnPtYdnutKk6hm4NcSP31J90KnugLOSMc5Hfa3hcivykPf5vbJ7ER4fD47HxQ5Q+WT8lD
	avl56uQ==
X-Google-Smtp-Source: AGHT+IG+99DhsLtfLQOkrS6cGlOJdhxFS+MoUo9aQHWJieZ1YP2Hh+cqOr1NgzWXq8DSlkin7PSEiA==
X-Received: by 2002:a5d:588b:0:b0:3a0:7ed2:4681 with SMTP id ffacd0b85a97d-3a0894b0b16mr3852205f8f.49.1745942539833;
        Tue, 29 Apr 2025 09:02:19 -0700 (PDT)
Message-ID: <8d4451ee-7de7-4fc1-a231-b51871d145db@citrix.com>
Date: Tue, 29 Apr 2025 17:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] {hyper,multi}call: further limit arguments to just 5
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <5020c491-2037-4955-99ce-e6ba02b44aef@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <5020c491-2037-4955-99ce-e6ba02b44aef@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/04/2025 9:16 am, Jan Beulich wrote:
> Multicall compat translation and hypercall continuation handling can
> also be shrunk to the processing of just (up to) 5 arguments.
>
> Take the opportunity to
> - make exceeding the limit noisy in hypercall_create_continuation(),
> - use speculation-safe array access in hypercall_create_continuation(),
> - avoid a Misra C:2012 Rule 19.1 violation in xlat_multicall_entry(),
> - further tidy xlat_multicall_entry() and __trace_multicall_call()
>   style-wise.
>
> Amends: 2f531c122e95 ("x86: limit number of hypercall parameters to 5")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> hypercall_xlat_continuation() uses BUG() when encountering too large an
> argument count in release builds, but I think that's too harsh. Hence in
> hypercall_create_continuation() I'm re-using the existing error path.
> Interestingly the multicall part of hypercall_xlat_continuation() has no
> check at all which would cover release builds.

This has never been the best of code.  All we can do is improve it
moving forward.

>
> With gcc14 code size grows according to my observation, due to the loops
> in xlat_multicall_entry() and __trace_multicall_call() both being
> unrolled now.

With GCC-12, it gets marginally smaller.  The loops are unrolled and the
instruction scheduling is rather odd.

mov    0x208(%r15),%rax
mov    0x228(%r15),%rdx
mov    %eax,0x1c(%rsp)
mov    0x210(%r15),%rax
mov    %edx,0x2c(%rsp)
mov    %eax,0x20(%rsp)
mov    0x218(%r15),%rax
mov    0x1c(%rsp),%rsi
mov    %edx,0x210(%r15)
mov    %eax,0x24(%rsp)
mov    0x220(%r15),%rax
mov    %rsi,0x200(%r15)
mov    %eax,0x28(%rsp)
mov    0x24(%rsp),%rsi
mov    %rsi,0x208(%r15)

This is the interleaved copy onto the stack, and back off.

Weirdly, we're doing 8 byte loads and 4 byte stores to copy on to the
stack.  It's not wrong per say, but it's also not necessary.

Then, for the copy-off, there is an overlapping store:

mov    %edx,0x210(%r15)

and

mov    %rsi,0x208(%r15)

not to mention this:

mov    %eax,0x28(%rsp)
mov    0x24(%rsp),%rsi

using an overlapping store and wider load for the copy-off.

Anyway - it looks to function correctly, but I don't exactly feel as if
the optimiser has done a great job.

~Andrew

