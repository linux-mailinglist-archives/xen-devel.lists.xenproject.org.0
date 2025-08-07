Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D736B1DC53
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 19:12:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073375.1436216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk49G-0001kz-1y; Thu, 07 Aug 2025 17:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073375.1436216; Thu, 07 Aug 2025 17:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk49F-0001iu-To; Thu, 07 Aug 2025 17:11:25 +0000
Received: by outflank-mailman (input) for mailman id 1073375;
 Thu, 07 Aug 2025 17:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LYnK=2T=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uk49E-0001io-DV
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 17:11:24 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 885f481e-73b1-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 19:11:18 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-458bdde7dedso9422025e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 10:11:18 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459de91ea4csm155204845e9.10.2025.08.07.10.11.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 10:11:17 -0700 (PDT)
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
X-Inumbo-ID: 885f481e-73b1-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754586678; x=1755191478; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4OP4xaE8pWnEnRqJ3aAsJLupQAdLmaGfhr4isia3Qz0=;
        b=kfBZiJkzvK+JYzvnZPpeInJp0jZ6Xitnvig+SHpoV+FGp0X6yV79yV+rfrljyCC4tR
         nLPiyHtXZKQHk24ueFkMCoBkGacZ20ZMUkyznNUsfcCYXwLUVJB9J7+jR9VSl1tT/xSM
         glyFUk2ux/ZFyhS8r6ikz7T+9yjhglkiJBKpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754586678; x=1755191478;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4OP4xaE8pWnEnRqJ3aAsJLupQAdLmaGfhr4isia3Qz0=;
        b=ZO+j5iIWMvFU9/ffE74PP5fwXxjaUJ4OYR3eAoBa0xQgNzhQHrSE9FGX6v2/u4nZuo
         AtV231KqMhXa5Tca8w6sT96NrrTpJaiNZXAnxqmLq48sxeNac9NXZdE94t058ruG/1ku
         YAe7kCg8xAx1QjQw7wmJsauoPatE63HajGUgH6pG2ctZeCVfqMMln4xRSP9AaUbJpJhd
         jcJvX9Ga8iv5NxvRjtsCdiziKaMg+fuyQ3pKgcXJBhMtkvNuUT6AEpdIdqT0NfMER2ui
         EYklnK6O9csBcv9kGzdCVGGVltmWtP88bEoQQZl68a6B8O+6Z8vpEEksmF74ijOxkmYu
         t2Dg==
X-Forwarded-Encrypted: i=1; AJvYcCX1aAmte3WUkyEXh69DYoH6+d0/M1LjC4aeAU1Y3SocmJ52JsW9qjZr3SPf2TtBLcAW4dcsuT4bypY=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywz67nWNzoRK8o4vu4Snla+4DdKMEd2NGqGAY5amC8ZjGKTsQXA
	le44E8PjkBOxht+WvEAX0vb6A/3JrP19fzZrM31WGq6zRhwty97fGpXgqo+4LypP8mo=
X-Gm-Gg: ASbGncvKBLWai73p6vOa7EfMNxr5M/LJO48m0oYKyFOJk1LypjEU/ghnMfXvmtiPUoP
	aWnj7Jg7IW6L0ZG9dQU/CaT2StBgGryuGt0E5Ai63CKgSCxfPWl1hBWKl+k/xK9OBZuHXuo7VJW
	aw/0tbs5Q59FxBvSP5tvkfx7h+mm3NMjDvKPocLaB3TyvRXyTFy12RtcyPFf3RQWaLLR4Zx23wW
	p+9/svvaJ9cB34BEVYEBCxtWJoCCIJZSPZkgiN0i8LSUjux1nFyCROf/rjh2JOSbNP3gtRJmJ0R
	Pkreaw8wo03zkE906c4rnZyNj+S/oMGB8Jf7ClRcs1ZxfrzdnFdFNr5rEJscss01skMdFO72uKQ
	vvKtQ8wIbzZYjBxX8AZofSH54RKVzeVa5ofjLCzw6tda7j5Lcye/DR6ZmQXn6d+ptBbAyvjqhqt
	Uf63w=
X-Google-Smtp-Source: AGHT+IEZPh43FidO1yNL2Q2uUuwwl2jQnV0BpEKn/o44jLPU92K1IxRmbLPWw1fhS84c4fFQq5ymBg==
X-Received: by 2002:a05:600c:19cf:b0:458:bfe1:4a82 with SMTP id 5b1f17b1804b1-459f43a3fcdmr3767005e9.16.1754586677648;
        Thu, 07 Aug 2025 10:11:17 -0700 (PDT)
Message-ID: <a0b6abb8-02d6-4748-9382-bea1b590dc6f@citrix.com>
Date: Thu, 7 Aug 2025 18:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/mm: correct PG_log_dirty definition
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini
 <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Penny Zheng <Penny.Zheng@amd.com>
References: <c506f225-0993-4ef3-9e7e-60b8f17c872e@suse.com>
 <65e27b35-9256-4ab0-966a-c50a18900ba5@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <65e27b35-9256-4ab0-966a-c50a18900ba5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05/08/2025 8:59 am, Jan Beulich wrote:
> While it is correct that in shim-exclusive mode log-dirty handling is
> all unreachable code, the present conditional still isn't correct: In a
> HVM=n and SHADOW_PAGING=n configuration log-dirty code also is all
> unreachable (and hence violating Misra rule 2.1).
>
> As we're aiming at moving away from special casing PV_SHIM_EXCLUSIVE=y,
> don't retain that part of the conditional.
>
> Because of hypercall-defs.c we need to carry out the dependency by
> introducing a new auxiliary PAGING control.
>
> Since compiling out mm/paging.c altogether would entail further changes,
> merely conditionalize the one function in there (paging_enable()) which
> would otherwise remain unreachable (Misra rule 2.1 again) when PAGING=n.
>
> Fixes: 23d4e0d17b76 ("x86/shim: fix build with PV_SHIM_EXCLUSIVE and SHADOW_PAGING")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> ---
> Of course PAGING is at risk of being confused with MEM_PAGING. It not
> having a prompt, I hope that's tolerable, as I can't really think of a
> better name.

Honestly, PAGING is a bad name start with.  While it is to do with the
handling of pages, it is specifically not what people think of when
using the term paging.

Hence why we've got MEM_PAGING too, which is referring to what most
people think of when told the name paging.

I don't have a better suggestion, given the current codebase, but I'm
open to suggestions.

~Andrew

