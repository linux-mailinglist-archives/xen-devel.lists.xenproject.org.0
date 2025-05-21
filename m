Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21485ABEBA8
	for <lists+xen-devel@lfdr.de>; Wed, 21 May 2025 08:05:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991465.1375314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHcZb-0008Ir-29; Wed, 21 May 2025 06:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991465.1375314; Wed, 21 May 2025 06:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHcZa-0008HQ-Vc; Wed, 21 May 2025 06:05:02 +0000
Received: by outflank-mailman (input) for mailman id 991465;
 Wed, 21 May 2025 06:05:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TwEK=YF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHcZZ-0008Gm-EP
 for xen-devel@lists.xenproject.org; Wed, 21 May 2025 06:05:01 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 872e3d27-3609-11f0-b892-0df219b8e170;
 Wed, 21 May 2025 08:05:00 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-601c5cd15ecso4879809a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 23:05:00 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad52d06cdccsm843600266b.49.2025.05.20.23.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 23:04:58 -0700 (PDT)
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
X-Inumbo-ID: 872e3d27-3609-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747807499; x=1748412299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9ewkitm98K2wNUZmIq0ZfhmbqJLXphXXgqlFxhxwGMc=;
        b=Y8LaYoWhth7/9Sft/Va6KtLhNwi3ui66jpmvrS6eXF1zAx2Mc2UFFCmPLvG8KCIE6z
         pDaTlk45YgqTZ8q4enn38z5lVXetbebaS/saUWRp0zOTVD7zrKIg9YgAKsmHKrllcvh1
         F/y1aXFGyyBP/9PHPznSJZ6GL7QWA4wNYWKHPhpTj6iYsAp3TrLXewDbrQc15URSFvmb
         XVxcMIExI0QdgnvUmySBv0U0TTjtmQa82Qfgn3MnAMyb71xM7mo84ZY3HAMwop5wvo2N
         GXKyZFM1ifZx0HWvYMpkmBte1KiBltR7OZOtQDUUaO2qz4yW1Bf4Usl1X/woHYs2PCmO
         IVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747807499; x=1748412299;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ewkitm98K2wNUZmIq0ZfhmbqJLXphXXgqlFxhxwGMc=;
        b=mlMc+5dYBjI0TyveUI3j0cZ3rRNkcGn6W/3k7Xb2zokkIWRl5XcoQecTiW92C7/jy0
         zO52dYzTlfisF3Donrs0hz8Os66Rs15jn8akfpCN020F+B91KJOur0tLXVwfWZzbWF9b
         QFXMRTQF2PF8uti0SVfp9zNf/E62yAW5Qk0vi8xwTJygfIm0lVt7NbsmgQmD/P9sJGDd
         uI+DwrE+/it2Rsim+1ainhpr6mBHuvfkz/Np/JcDovuwZqyqcCZ71tXfvy7BpgGkS3c+
         UGrHr0vyofPOMRdBcfqgQFJwzdfBqWbcbfGA4pmbXfB3gQ8pVsF7/Hy56p19vHrIEDEd
         EkfA==
X-Forwarded-Encrypted: i=1; AJvYcCWXgCSo09OfdlxI/SPLWx2dGVohazQnLG7YvbrpDSzvEsvPe2uVG9p0MwO++v9aaaJE39uUHPnyHv4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxlnT+BVG0cOQ2s1UwkGMc6ss/2qoIGwIL8tZUcUSgOGccfgXZZ
	qsMT/0MW1ZVvSK8UJH54RaLy4/bsL94SdQjefJkysYhbva00gGSnAiptCFwNDp4N5Q==
X-Gm-Gg: ASbGncsYTRn3F2PR4caj5arfis2SDgjxom/APi9feVcbalwLbJeJJpK2WNTfbmM4VeL
	kt4h9bs78N31D89D1+Yle60S6EjEwu1lzgFTWGLhJMEH0CL+lwIfAqVyEtdGS/Ro0jpVHUAOYA+
	pckHi1q8H6zHkvV9RWtq4W4Au1Clv87ohjjhR9yYWrUerexnIJ3z30Oi+3HGQtWZuhmziFYwsSw
	jXwoj0GVzMv0EGNF2oAaPthoXOQpTJa9uCn2c1Mc6LTX3vZVo2jUauC9n8VVdSzh0ddYD4KRxxz
	9nzrC4DOLI8SwEdmbp17D/wJ/AcbcmzhLMTvH/6pzlHkBuuCEeqzBAoPOzMQAA==
X-Google-Smtp-Source: AGHT+IERwyLfTkb05uKGZMTfyZODXRLkgUsgHh6Apll9eHLyl7NpTYk8hea9RAt820KGnLN+Uvr7oA==
X-Received: by 2002:a17:906:34d1:b0:ad5:1db5:6ec0 with SMTP id a640c23a62f3a-ad536b7c4c8mr1439908366b.20.1747807499480;
        Tue, 20 May 2025 23:04:59 -0700 (PDT)
Message-ID: <ef3fbec5-966b-4d29-8bb8-2ebd357b37bf@suse.com>
Date: Wed, 21 May 2025 08:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/domain: rewrite emulation_flags_ok()
To: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org,
 michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org,
 dmukhin@ford.com, xen-devel@lists.xenproject.org
References: <20250516022855.1146121-1-dmukhin@ford.com>
 <20250516022855.1146121-3-dmukhin@ford.com>
 <e13d061a-16ee-4b8d-8d4a-db1bba609bdf@suse.com> <aC0EYzZgzCfOovVL@kraken>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <aC0EYzZgzCfOovVL@kraken>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.05.2025 00:38, dmkhn@proton.me wrote:
> On Tue, May 20, 2025 at 05:24:33PM +0200, Jan Beulich wrote:
>> On 16.05.2025 04:29, dmkhn@proton.me wrote:
>>> --- a/xen/arch/x86/include/asm/domain.h
>>> +++ b/xen/arch/x86/include/asm/domain.h
>>> @@ -494,6 +494,12 @@ struct arch_domain
>>>                                   X86_EMU_PIT | X86_EMU_USE_PIRQ |       \
>>>                                   X86_EMU_VPCI)
>>>
>>> +/* User-selectable features. */
>>> +#define X86_EMU_OPTIONAL        (X86_EMU_USE_PIRQ)
>>> +
>>> +#define X86_EMU_BASELINE        (X86_EMU_ALL & ~(X86_EMU_VPCI | \
>>> +                                                 X86_EMU_OPTIONAL))
>>
>> That is, VPCI is neither baseline nor optional. Certainly at least strange.
> 
> IMO, X86_EMU_OPTIONAL should include both VPCI and PIRQ.
> 
> But that will be a behavior change: AFAIU, VPCI is injected implicitly for dom0
> case only, "default" xl toolstack currently excludes VPCI for HVM domains.
> 
> Do I understand it correctly that "BASELINE" in the symbol name is a concern?

It's not the word by itself. _If_ we want to have such symbols (which I had put
under question before), they need to be named to accurately reflect the purpose.
Imo with the names chosen an implication is that the two are non-overlapping,
while when combined yield the full set of flags.

Jan

