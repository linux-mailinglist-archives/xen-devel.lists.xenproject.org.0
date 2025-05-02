Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B053BAA71B2
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 14:25:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974656.1362452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uApRf-0003dj-Ma; Fri, 02 May 2025 12:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974656.1362452; Fri, 02 May 2025 12:24:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uApRf-0003bc-Jp; Fri, 02 May 2025 12:24:47 +0000
Received: by outflank-mailman (input) for mailman id 974656;
 Fri, 02 May 2025 12:24:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+YV=XS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uApRe-0003bW-7i
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 12:24:46 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad75cc8-2750-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 14:24:39 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so2038817f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 05:24:39 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a099b0ff8esm2027366f8f.79.2025.05.02.05.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 May 2025 05:24:38 -0700 (PDT)
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
X-Inumbo-ID: 6ad75cc8-2750-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746188679; x=1746793479; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=58mBo+tgccnPMmtKhvfl3xIuF/MtwOIQVl3jnF9O/YM=;
        b=saI90l39YVyhyPgBYr0kQ0zHSLhB/mvz1rbTm0y4dtqHcNR5lnEj/lHg4kwFMppBWi
         63N+kfLX2IChr5uyBMaP6aRLkZ9l/fhf1aGrK0mCN3Q9UEPMY7x29YaKn2rIhWDmFoN0
         WDY4eb3pWXDcW6VC6GTvYkdwhh/crGOBgx8Fo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746188679; x=1746793479;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=58mBo+tgccnPMmtKhvfl3xIuF/MtwOIQVl3jnF9O/YM=;
        b=TYJyYwqYxz/4kZ8M/8aEk+ae09iq2FwwqGOKi9f0fxQLfqQZ5VIOgtAIZIViGpZPEC
         mHfZl12I+2SBnoYf51GqRWwS4DPRe3dnDZTqW1omshb6Z/DSdZHx04GE215Zx+XBakwN
         sCQ0FEfgDoFa8UeOHd6nHnRGG+2OKWrROvAOXBr7lm7FBQ796kc5Ou8fU+MNw8wWnoM3
         jzfjzdQ7f4pHkKpYLTwjle6EpDmUsryNn6ahT9p2AGy018vzatwyuYD+eVMZXAcczeQ5
         7NjsXBaCjj+LcNu+UPzE2LftgTDwo8q9oGS6Mx8Bu7ta1GOJBx5IGAfd0mtfwIgxMs4W
         cyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXguuDkgWlr6qUheqS366XOvjQhoN6AQ2UaVzJVEudhtExk1LlXp9F5bDxEhYBtfuf8+HB6RmNo4W4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzuJZNfO5ukTJq7SiL5e74WNMvid57dP5H9Xhkyy9pLY/doHmKJ
	K6Zq9m5Q9/uJokgNRdnx+i0ZwdnAh+dCVgajRQangObJunpFD2/puIsihddjfxU=
X-Gm-Gg: ASbGncswJtMYXbo6EQmUTAmZQr+vKzLZAXyoplWX2ahYtKR5aKQpAnorFx6Bddw8KTQ
	fHpyWo0/FW3clAyH+Fvldx0aZXLmDlT7pMqwl/dySrXXYCsv8NDXIKV451LQZXgrXT/Ubr4vFQ+
	PT4LkAcxjJECZoaRf5mcn9tfcRAXyXqSdtUHZdNovzNhIHhaOXoKkRPBeKyfbbQ1byxMnrwl19z
	g0CIrDcnGIwa3orvOvklmTCe+ijhGa1Ty5xqeeFyaEzAVnmlVJ6SY88gDDQjFsCQb4VMEYxBGJh
	W34whCPTXZ4v2DRCuRu768oPmUCDcLr0H4qA0IgP0yEaXmQO5MOEtH+KvtgbICGJnl+pzvZg9nf
	l4Iel6A==
X-Google-Smtp-Source: AGHT+IHBEH9VvRM6uc4kTAjJIqWeGWcegsfx/Lgxob5vRWvQyMSNiifsMySmu6b9hCifSMaC/zFemA==
X-Received: by 2002:a05:6000:4592:b0:391:386d:5971 with SMTP id ffacd0b85a97d-3a094038f0dmr4295851f8f.14.1746188678776;
        Fri, 02 May 2025 05:24:38 -0700 (PDT)
Message-ID: <a361dc64-1693-4740-85d7-f4eb1159c541@citrix.com>
Date: Fri, 2 May 2025 13:24:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vpic: Improve bitops usage
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250501233042.762295-1-andrew.cooper3@citrix.com>
 <beb23522-cd39-4846-a9ef-a420be557f11@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <beb23522-cd39-4846-a9ef-a420be557f11@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/05/2025 9:04 am, Jan Beulich wrote:
> On 02.05.2025 01:30, Andrew Cooper wrote:
>>  * For vpic_get_priority(), introduce a common ror8() helper in plain C.  One
>>    thing that I can't persuade the compiler to realise is that a non-zero
>>    value rotated is still non-zero, so use __builtin_clz() to help the
>>    optimiser out.
>>
>>  * vpic_ioport_write() can be simplified to just for_each_set_bit(), which
>>    avoids spilling pending to the stack each loop iteration.  Changing pending
>>    from unsigned int to uint8_t isn't even strictly necessary given the
>>    underlying types of vpic->isr and vpic->irr, but done so clarity.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>
>> One thing I can't seem to avoid is GCC zero extending the result of ror8()
>> before passing it to BSF/TZCNT.  Then again, that's very specific to uint8_t,
>> and x86's preserving behaviour on byte writes.
> It can't know that the upper bits are "don't care" here, related to the aspect
> above (it not inferring non-zero of the result of the rotate when the input is
> non-zero).

Hmm, I suppose so.

> And I expect it would be too much of a special case to warrant
> getting all of this accounted for, just to remove the zero-ext.
>
> For this specific case we might be able to cheat, but I'm unsure that's worth
> it either (and I also haven't tried whether it actually has the intended
> effect):
>
>     val8 = ror8(mask, vpic->priority_add);
>     asm ( "" : "=r" (val32) : "0" (val8) );
>     return __builtin_ctz(val32);

It's one zero-extend.  I was only curious because I was looking in
detail at the code generation, but it's not something I'm losing sleep over.

~Andrew

