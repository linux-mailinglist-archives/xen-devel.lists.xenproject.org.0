Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C055A914D8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956963.1350181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JSj-00033r-2E; Thu, 17 Apr 2025 07:15:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956963.1350181; Thu, 17 Apr 2025 07:15:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JSi-00032P-Vj; Thu, 17 Apr 2025 07:15:04 +0000
Received: by outflank-mailman (input) for mailman id 956963;
 Thu, 17 Apr 2025 07:15:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5JSh-00032J-1R
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:15:03 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adaf6fff-1b5b-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 09:15:02 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c266c2dd5so472526f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 00:15:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22c33fe68b1sm26303075ad.219.2025.04.17.00.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 00:15:00 -0700 (PDT)
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
X-Inumbo-ID: adaf6fff-1b5b-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744874101; x=1745478901; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6rhCll4lCybbpUURku3rqmI7TKGmtQeLYbk1BG/TfS8=;
        b=cWNGj+xUzg/Pa9ez4fV6scpLBcse2ohRn2egj4cRgfV4AEXMM4wpVU0a0boSc+tiSu
         Jnlcn6YG0lGX2O6u5OzV/xje2w8ZJ8RER1JBZHTSMt++ZEAIkDdzSuGWJ7b8a9XDHAct
         CFDdNZZ9tRDIGAOFsxYydks+fCc7M+3e8nMtHUY5z1IvZVTpx0huxSZEA3Lzb3UoNDB6
         5ymV5uzT1/CxS+qy9bAt3aVE8zp5jXF5/gdbRlvZCXeV43djMy+tVRP7eeSn0i7BhIm5
         bQGSioAV/y4WV9WwK1V9Kb+w0ivOPnAUwEocNLsQXL0eqrNybpAUOoHlkvAkRL1DP7ol
         MgNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744874101; x=1745478901;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6rhCll4lCybbpUURku3rqmI7TKGmtQeLYbk1BG/TfS8=;
        b=rNSrtWiKYpKMT9H2wTJrTfa8FCj8stzbNlF4wvIbfdXcHP/BoWQvKscgqzhkFmlRPK
         6PopInw1UEUpBVqv/CF8DsazsYA11mCXI3GeoPEd2YAklQujjdPW8Pj70PoylxGDzGOb
         9igDmiVX4QUZdBsZaNbFpfPZ6f3hnLqVWhCkjZRCAK5UbivzbBd+oqLHBGbXLfFiX/3s
         E/Vm6f8TuAK4tpLeEZKTy7lKb3GlZvXi/V9FPRJh6/c5je1YlhEgCIc4JLqvuUlR6jsj
         bFtVViApN82bG6dOE0ocJVahFFkdWjRWtA6BOZH426jOQSBmITv5DRMIL878ExGIGnhk
         Bq3g==
X-Forwarded-Encrypted: i=1; AJvYcCUwuXp/yWoliegcG8xWj7lromqhYGIQun4FEadcyBeYe3GToJKhlbFJjZC05mxaG4d4Arl4apr+a+M=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFqC5lyLb1BweFWwkwLrKa0xXT61glvq9lx1+swl2ARE2j2p/n
	XZrDmlJO8bz/qFc4Rxnjdrelt+tSiOEe6LfVHcQsZCeRb3sRt1IXKvipJsBC3A==
X-Gm-Gg: ASbGnctFR5xXNlMMWIVZFb0W6pZM7EIlDsfn+7ycmh0xAsilyI6h+MxX35QNZrv/xVz
	liFcZwthnWxpUShZ58umC4r5BY3wZcOzNnvUwDH8AWEQdaZqamvwHEbc+c6UfL/RGZrjIZs5W8E
	3K6KDgEe8X/LMkx+xDDbCTVe0W/t3TWEYK2pz3VnbYPC/xYra3VaiUUi90rAQno3ICHzacawTQi
	7njJgZidB97mIUwfIDonLRynfX1wL8myk7dI2Ib9f5egd7PMUp/fKGak1YJU4onuG4LcRSVNhA/
	bzxvdbSv+hbCNA7XX6rBDcj4iLgVc4l0W5ARI4lFDkznjwDoThxHpaUifoFiAYbT8U+M57nWJTu
	lfRFJEjIVVUyeE2Rcir7FmyD/dQ==
X-Google-Smtp-Source: AGHT+IH834zrfxvSmCr6PVozZr/FLYnJYgdr/rIN1vX7Ny8/6fzxjZ0ECnE1bgHHyRCHkB8tqCROfA==
X-Received: by 2002:a5d:47ab:0:b0:391:4889:5045 with SMTP id ffacd0b85a97d-39ee5b8b916mr4375448f8f.36.1744874101423;
        Thu, 17 Apr 2025 00:15:01 -0700 (PDT)
Message-ID: <910868c1-fc90-49ec-bd06-3ff638ff0c1d@suse.com>
Date: Thu, 17 Apr 2025 09:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86 emulation bug
To: Fabian Specht <f.specht@tum.de>
Cc: manuel.andreas@tum.de, xen-devel@lists.xenproject.org
References: <jfgrmlid6fhbptebr22ccqimqhys3pchcoyuoepjz2iwoillei@xxaicsktj2pl>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <jfgrmlid6fhbptebr22ccqimqhys3pchcoyuoepjz2iwoillei@xxaicsktj2pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 00:52, Fabian Specht wrote:
> Dear all,
> 
> we discovered a bug in hvm64 x86 Xen. Using the attached xtf test we are
> able to trigger an assert in arch/x86/hvm/emulate.c:
> 
> 
> if ( (hvmemul_ctxt->ctxt.regs->eflags & X86_EFLAGS_DF) && (reps > 1) )
> {
> 	/*
> 	 * x86_emulate() clips the repetition count to ensure we don't wrap
> 	 * the effective-address index register. Hence this assertion holds.
> 	 */
> 	ASSERT(offset >= ((reps - 1) * bytes_per_rep));
> 	okay = hvm_virtual_to_linear_addr(
> 		seg, reg, offset - (reps - 1) * bytes_per_rep,
> 		reps * bytes_per_rep, access_type,
> 		hvmemul_get_seg_reg(x86_seg_cs, hvmemul_ctxt), linear);
> 	*linear += (reps - 1) * bytes_per_rep;
> 	if ( hvmemul_ctxt->ctxt.addr_size != 64 )
> 		*linear = (uint32_t)*linear;
> }
> 
> 
> If debug mode is not enabled, this will later on result in an integer
> underflow, however we were not able to find any severe problems.
> 
> The test below will not work with vanilla xtf.

Thanks for the report. However, already on Andreas' report on the day before
yesterday I was heavily inclined to ask about details you certainly have
figured out already. I find it odd that you leave to us all re-figuring out.
In this case, for example: Is the specific value you set %eax to relevant?
(Probably not.) Is the specific value you set %rcx to relevant? (Probably
not, but likely some part of it is.) Is the specific value you set %rdi to
relevant? (Probably not, but likely some part of it is. Probably you
setting it to 0 is also why the adjustment below is needed, and using a
different value might permit avoiding that adjustment.) Is it relevant
that you set EFLAGS.DF? (Quite likely.)

Any other investigation results you may have collected would likely also
make our job easier.

Jan

> To get it working,
> we have to edit 'pae_l1_identmap' in arch/x86/hvm/pagetables.S in xtf
> from
> 
> 
> PAGETABLE_START(pae_l1_identmap)
>         .long 0, 0
>         .rept PAE_L1_PT_ENTRIES - 1
>         .long (PAE_IDX(pae_l1_identmap) << PAE_L1_PT_SHIFT) + _PAGE_LEAF
>         .long 0
>         .endr
> PAGETABLE_END(pae_l1_identmap)
> 
> 
> to the following value:
> 
> 
> PAGETABLE_START(pae_l1_identmap)
>         .quad (0x5564000000) + _PAGE_LEAF
>         .rept PAE_L1_PT_ENTRIES - 1
>         .long (PAE_IDX(pae_l1_identmap) << PAE_L1_PT_SHIFT) + _PAGE_LEAF
>         .long 0
>         .endr
> PAGETABLE_END(pae_l1_identmap)
> 
> 
> 
> We were able to reproduce this bug in several versions including the
> most current one at the time of writing this.
> 
> 
> Best,
> Fabian


