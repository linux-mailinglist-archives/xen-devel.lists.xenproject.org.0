Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7CCA9AABA
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 12:45:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966158.1356469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7u50-0003K2-0l; Thu, 24 Apr 2025 10:45:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966158.1356469; Thu, 24 Apr 2025 10:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7u4z-0003Hr-UA; Thu, 24 Apr 2025 10:45:17 +0000
Received: by outflank-mailman (input) for mailman id 966158;
 Thu, 24 Apr 2025 10:45:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KF8R=XK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7u4y-0003HS-H0
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 10:45:16 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34844efd-20f9-11f0-9eb1-5ba50f476ded;
 Thu, 24 Apr 2025 12:45:15 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso556092f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 24 Apr 2025 03:45:15 -0700 (PDT)
Received: from [192.168.1.23] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a06d4a8003sm1660652f8f.1.2025.04.24.03.45.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Apr 2025 03:45:14 -0700 (PDT)
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
X-Inumbo-ID: 34844efd-20f9-11f0-9eb1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745491514; x=1746096314; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KJjanCZpdIaaHAm0lUoTBlWZKHzYIPOwZSAG43K0TtY=;
        b=V+uGlGwbPw40GFCaBBYfxDtePRQLIGDB058eHWtMs+7XrnA3JI2FOain6Ur9mHh20i
         Ng36a+OEcaTypMLGD84dfKLJ8BJO72a+J0eLle+huV2ChbgO3qjb3MNeHUEIdMWff69+
         PAHLbjR74oA2lpUckJNQYaW/xdTFK1+tdJCEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745491514; x=1746096314;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJjanCZpdIaaHAm0lUoTBlWZKHzYIPOwZSAG43K0TtY=;
        b=wMrrFXfe3+WQyoP562GofmqGDTlcbvvegtNI+u0mXZWAGv+jFytS2A/EyjasDYYqOE
         1I3/oXrYuf4XJJLDWDw/e7PFoJJPzD0MdeWYoHOqkNZOavjVlNhCMt62fyPik3Yja4hm
         Oeicmk5SXBkSxF0fWW6ZJh3j8QoqP3EmppZoBbAJcg98ylocdR2vc47g7Dc18pFEB92S
         zjxTgm/Qx2Re1xKqFpe1SToqCpO6uYjuUFe8O26zmPAHAJ6kNcI3KXa0FmNNhKXNesxL
         M+vmJ8RjPRnrmO+5XJKilSL1jUuRkirgr0hwWZiHfvQxOttTmreCsmujEXtVxSkFj2by
         gZOw==
X-Forwarded-Encrypted: i=1; AJvYcCVlUs3t7Ng5vH2NvhRDp4iTzN/ZK0cQV82wDCD+sd9KyBJe5SlaXh/OD0TwyGTmXNOSkxmUbjxUyMc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzEV8V2BjUsrcFAFgIyqx92DBo9A7JpUyxWLhnRZNqLbqu+CmOn
	SdBnZ5xhPjFuzIH26IrQv2sy0xkj45yp5+k/+A54jYLasIOHpU2dfx/vStROwBs=
X-Gm-Gg: ASbGncskbuPUegTyb/bjw50kzxBYG8DvZA0TmhnhleidmQfpzus+Z79gG9MwlorXBdn
	hprhB25HlLjmYeLUR01vtCgjq+XkO8OjGFV3suI432Wyj5FkPt5mxXIENaa6z3OwP4oMI5KLid2
	PtmHa3iZRfMY/I7tnCuWwLflpUjjHtM8KQaEDKNZX0+mOY+e3UStBA+jgrdYu/y3Zn44lQkG0zG
	O276KAyjYJyE1Wy6B4pR3v9vecbEYOJFJJqcBxRLn2tmLzhDSwGm988PIR4kP0rBUOpuYVcBulF
	Nd/l4mwai6/xhlcM1F+bw6bj6p6nZpBviKXMqd60I/36T+u7W+JaJdgU2CtY8gxQvlcy+q3MZ0R
	LlvgE
X-Google-Smtp-Source: AGHT+IE5j6r8MA55JyzUApuSbXrDe25WEdXSt7msrZhCfIK7yxjLS5yKu3Yb9qQZYWRLmw7TSETOEA==
X-Received: by 2002:a05:6000:4285:b0:38d:e0a9:7e5e with SMTP id ffacd0b85a97d-3a06d641ee8mr1729191f8f.6.1745491514435;
        Thu, 24 Apr 2025 03:45:14 -0700 (PDT)
Message-ID: <7e3b941d-ec4e-4158-8844-a3cf236c8d4d@citrix.com>
Date: Thu, 24 Apr 2025 11:45:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: UBSan bug in real mode fpu emulation
To: Fabian Specht <f.specht@tum.de>, xen-devel@lists.xenproject.org
Cc: manuel.andreas@tum.de
References: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <l2jnq5cxgkzcdkndp3mjf76nd7wdp2pbstkqo7llaarmbfqdge@bxdydela4rcf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/04/2025 2:08 am, Fabian Specht wrote:
> Dear Xen-Devel team,
>
> we discovered a bug regarding undefined behaviour in the FPU emulation
> unit.
>
> if ( !s->rex_prefix )
> {
> 	/* Convert 32-bit real/vm86 to 32-bit prot format. */
> 	unsigned int fip = fpstate.env.mode.real.fip_lo +
> 					   (fpstate.env.mode.real.fip_hi << 16);
> 	unsigned int fdp = fpstate.env.mode.real.fdp_lo +
> 					   (fpstate.env.mode.real.fdp_hi << 16);
> 	unsigned int fop = fpstate.env.mode.real.fop;
>
> 	fpstate.env.mode.prot.fip = fip & 0xf;
> 	fpstate.env.mode.prot.fcs = fip >> 4;
> 	fpstate.env.mode.prot.fop = fop;
> 	fpstate.env.mode.prot.fdp = fdp & 0xf;
> 	fpstate.env.mode.prot.fds = fdp >> 4;
> }
>
> It occurs at arch/x86/arch/x86/x86_emulate/blk.c:85 of the v4.20.0
> release during the bit shift and can be triggered using the attached xtf
> test. We are not aware of any security consequences.
> Simply shifting by 4 should do the trick in my opinion.
>
> Similar code resides in the same file in lines 87, 125 and 127.
> The attached xtf test is run for hvm32.

Several things.  First, please always the UBSAN analysis from the crash.

There are several different ways that shifts go wrong, and I suspect
this is a shift into a sign bit, which is notable given the unsigned
underlying type.

Also, are you aware that the test isn't properly in Real Mode?  It's in
so-called unreal mode (not actually a real mode, but a consequence of
how the segment registers work), which is relevant to how you manage to
re-enter the emulator for FLDENV.

~Andrew

