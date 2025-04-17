Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E83C6A91604
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 10:01:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957043.1350242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KBT-00067x-Pc; Thu, 17 Apr 2025 08:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957043.1350242; Thu, 17 Apr 2025 08:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5KBT-00066L-Lr; Thu, 17 Apr 2025 08:01:19 +0000
Received: by outflank-mailman (input) for mailman id 957043;
 Thu, 17 Apr 2025 08:01:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CA5y=XD=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u5KBS-00063O-Vq
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 08:01:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 241c6664-1b62-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 10:01:17 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so2324365e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 01:01:17 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b4f2cfesm43806765e9.19.2025.04.17.01.01.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 01:01:16 -0700 (PDT)
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
X-Inumbo-ID: 241c6664-1b62-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744876877; x=1745481677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qZVLkKCCz4l+vu11At93kZ9cWFmJJ7Q5Fbun+gFSwmI=;
        b=HMo739Vqk9U7dB5wo+FkMd3vqbf380W6eI+hr2+4SMNs7e8L1V1qRh7Q2aWQ34YbjN
         qHJAeCY2W/dBCSF4udYLLMzrLhy2U1c0+cgDDnH7S9AXsh4MbpTnZu72PdCJtl2UjwX4
         svb9gzqR7Q4e7TuB4O9gc/5J5fS5cICnz1/C8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876877; x=1745481677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZVLkKCCz4l+vu11At93kZ9cWFmJJ7Q5Fbun+gFSwmI=;
        b=ouYj4x54GADMDFldmaxspl3fV2kigBWlnccZNJYEgLYw1TYZpTsIm71Od4tQlK6vpM
         Cw1WknY2vR7CkrsEi6Q7nYbodgmWI+5Azw1+l/OLIWCyGZaprc+RElqdFKIIikScymqy
         J0SLFxvAfwMpvgNLiT0ghKCL2BxVPi5qDQCy0NUR58ESH13VR+7q/At7YtjnRqam6SjR
         mifjcHKev2fo6ZmmOlWW6OYDTAy8OH2/FfFJjSuqeaySaGHwfe6sh9WlZocVa0MRLNoi
         0MBraW6N6hTHT/3mIyGr91c6A8/K8ujTDDIJ6m5wNVKtvcmR/GigfpvEPqrzubsCcLgb
         wjiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe2fhI4Vens8D4wg6tVz8+YVPKJVtdij6gUMUO/eSB272gkaOjEgtStKHI9CWHyaa3DtvJe4zkqGw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwunQGaht8cil/fQ1AqMC6lX67HKppN+7wztp75bu43JYoF5iMj
	qFDYH3ZMmb8dwh+v2J5AfqWuLxg3KY0GOioG+IKG8ayrNn5tz1uxJRfZLtytbGA=
X-Gm-Gg: ASbGnct20z7lG2FnnY9QHC2j10vke2liJpGJhsGgdKZrOMpGOb/We542qEAPFs2rswV
	h4JiVXPq1DbGSg/mGytsuNihIk2YPMmh/D6O/Wah1QL3G6kP/OHFJooeFbFnB08dQhDUcMJA2BD
	IIgNBeSwkcGtUKRVq9OO3aFZTY121OkF+QRZHupvRHDkkMXwl9B/SIJ3r65cYshlKfFOlTImZ2m
	ZD1P+sQdHi0P4CtQtGD4aRvLmMADebA1mS68n0NzW60BzZ+N1EPsPTMuaGGn7lJwkvJ3rEPF0vf
	3dB45/dnmioEuKsPPt/ebpxVMDWdHbL2xEgrn1yILpd57mMoj/uTaZxbSp7ulG+s/UIf/behtH5
	4j4xotA==
X-Google-Smtp-Source: AGHT+IGoIAAOH+vZNXH21KzZF/hebGPMJjA2bZR+nQLdiu/JOKRQEXfGQ0irPjTsh9v3lhcioV0J1A==
X-Received: by 2002:a5d:5987:0:b0:390:f6aa:4e80 with SMTP id ffacd0b85a97d-39ee5ba0566mr4510746f8f.53.1744876877046;
        Thu, 17 Apr 2025 01:01:17 -0700 (PDT)
Message-ID: <ecfce9c8-6c69-422d-bb2a-867c94502f9b@citrix.com>
Date: Thu, 17 Apr 2025 09:01:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86 emulation bug
To: Jan Beulich <jbeulich@suse.com>, Fabian Specht <f.specht@tum.de>
Cc: manuel.andreas@tum.de, xen-devel@lists.xenproject.org
References: <jfgrmlid6fhbptebr22ccqimqhys3pchcoyuoepjz2iwoillei@xxaicsktj2pl>
 <910868c1-fc90-49ec-bd06-3ff638ff0c1d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <910868c1-fc90-49ec-bd06-3ff638ff0c1d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2025 8:14 am, Jan Beulich wrote:
> On 17.04.2025 00:52, Fabian Specht wrote:
>> Dear all,
>>
>> we discovered a bug in hvm64 x86 Xen. Using the attached xtf test we are
>> able to trigger an assert in arch/x86/hvm/emulate.c:
>>
>>
>> if ( (hvmemul_ctxt->ctxt.regs->eflags & X86_EFLAGS_DF) && (reps > 1) )
>> {
>> 	/*
>> 	 * x86_emulate() clips the repetition count to ensure we don't wrap
>> 	 * the effective-address index register. Hence this assertion holds.
>> 	 */
>> 	ASSERT(offset >= ((reps - 1) * bytes_per_rep));
>> 	okay = hvm_virtual_to_linear_addr(
>> 		seg, reg, offset - (reps - 1) * bytes_per_rep,
>> 		reps * bytes_per_rep, access_type,
>> 		hvmemul_get_seg_reg(x86_seg_cs, hvmemul_ctxt), linear);
>> 	*linear += (reps - 1) * bytes_per_rep;
>> 	if ( hvmemul_ctxt->ctxt.addr_size != 64 )
>> 		*linear = (uint32_t)*linear;
>> }
>>
>>
>> If debug mode is not enabled, this will later on result in an integer
>> underflow, however we were not able to find any severe problems.
>>
>> The test below will not work with vanilla xtf.
> Thanks for the report. However, already on Andreas' report on the day before
> yesterday I was heavily inclined to ask about details you certainly have
> figured out already. I find it odd that you leave to us all re-figuring out.
> In this case, for example: Is the specific value you set %eax to relevant?
> (Probably not.) Is the specific value you set %rcx to relevant? (Probably
> not, but likely some part of it is.) Is the specific value you set %rdi to
> relevant? (Probably not, but likely some part of it is. Probably you
> setting it to 0 is also why the adjustment below is needed, and using a
> different value might permit avoiding that adjustment.) Is it relevant
> that you set EFLAGS.DF? (Quite likely.)
>
> Any other investigation results you may have collected would likely also
> make our job easier.

To add to this, the amount of RAM you create the XTF guest with is very
relevant too, because it changes the behaviour.

E.g. when the guest has 6G of RAM, 0x5564000000 becomes normal RAM.

~Andrew

