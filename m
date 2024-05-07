Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9F8BE1E6
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2024 14:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718045.1120545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Jnh-0007LE-Gg; Tue, 07 May 2024 12:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718045.1120545; Tue, 07 May 2024 12:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4Jnh-0007IA-E6; Tue, 07 May 2024 12:20:05 +0000
Received: by outflank-mailman (input) for mailman id 718045;
 Tue, 07 May 2024 12:20:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mcW=MK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s4Jng-0006yi-3S
 for xen-devel@lists.xenproject.org; Tue, 07 May 2024 12:20:04 +0000
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [2607:f8b0:4864:20::732])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fc869c9-0c6c-11ef-b4bb-af5377834399;
 Tue, 07 May 2024 14:20:00 +0200 (CEST)
Received: by mail-qk1-x732.google.com with SMTP id
 af79cd13be357-7928c5cb63fso215047585a.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 May 2024 05:20:01 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 n22-20020ae9c316000000b007925fc27b1bsm4839542qkg.124.2024.05.07.05.19.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 May 2024 05:20:00 -0700 (PDT)
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
X-Inumbo-ID: 1fc869c9-0c6c-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715084400; x=1715689200; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YRLVjkv17D9aBha14p2zSizQpD/IHwVWplpoCtaVJyk=;
        b=lbtJLP9NOOAhnd9uPi5BBvje7I7omfk4HJcUV0z782deJfW3xFaUthiLT0ZGVq0g6n
         p5rduN94SKYGpdpsYxHhOsNn/eOLJw4IRNfsDYOtGUHQrr5hvxhXDZFg6n1BXBpKtJz0
         s8hzlzHe79ymk/jDevdYVK8GxR/Dxxu5hmEcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715084400; x=1715689200;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YRLVjkv17D9aBha14p2zSizQpD/IHwVWplpoCtaVJyk=;
        b=RM0Ogq5+CoTwyGnKgtkwwC91pw6kZ6OKT5yS+qPcQauJnuyAIAnnebCPyxSFMkF/zY
         Ses8S0GG+8QrIKCgLsgGWVdMV8dX39Ol6limi1piEcBJAQ8TvILhmnGaBgurUPbq4XPp
         xNOFlFw+fmREOj5lUSMkdqqznykTQ/ldKfAbdzZazD1Cb+U+uL4V5RQeF1lCT7pKSUW3
         UQ2OpKmw3gkWJeiVFPyrqHN+Qyvb2bvF6U0ArQdWAHzopYePaDqGKDl91je+W4brZi6d
         1KxnTepZfgLrPzfDPpRqyXevHveATjGA5U5V/lFrZ0wh4w1IZFcj2HlXFAcHECvZzNdE
         7knA==
X-Gm-Message-State: AOJu0Yway3Uqi47uNBUoCClB1oop66DI7kQVhT8X18gukaO9bURKiXOT
	DbIQkljUcdVEvrLF/AUx+DblPTmUo2AkkdKwq8eF79MdmEOWmbXukXRaB0w1/H4=
X-Google-Smtp-Source: AGHT+IEwdWF+ybwuXBQaBxCgzcQ7qQ0nOFVlTuEbMZ5zt0GyuDSonTxlr0DQrl2WmENPxRrGy9dfkA==
X-Received: by 2002:a05:620a:2490:b0:78d:5d86:ee3a with SMTP id i16-20020a05620a249000b0078d5d86ee3amr4862746qkn.27.1715084400641;
        Tue, 07 May 2024 05:20:00 -0700 (PDT)
Message-ID: <dd15568e-c987-4636-810b-ca81d86f6867@citrix.com>
Date: Tue, 7 May 2024 13:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Fix migration from Ice Lake to Cascade
 Lake
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>
References: <20240507112957.1701824-1-andrew.cooper3@citrix.com>
 <ZjoVk6JMjHGAB-EB@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZjoVk6JMjHGAB-EB@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/05/2024 12:50 pm, Roger Pau Monné wrote:
> On Tue, May 07, 2024 at 12:29:57PM +0100, Andrew Cooper wrote:
>> Ever since Xen 4.14, there has been a latent bug with migration.
>>
>> While some toolstacks can level the features properly, they don't shink
>> feat.max_subleaf when all features have been dropped.  This is because
>> we *still* have not completed the toolstack side work for full CPU Policy
>> objects.
>>
>> As a consequence, even when properly feature levelled, VMs can't migrate
>> "backwards" across hardware which reduces feat.max_subleaf.  One such example
>> is Ice Lake (max_subleaf=2 for INTEL_PSFD) to Cascade Lake (max_subleaf=0).
>>
>> Extend the host policy's feat.max_subleaf to the hightest number Xen knows
>> about, similarly to how we extend extd.max_leaf for LFENCE_DISPATCH.  This
>> will allow VMs with a higher feat.max_subleaf than strictly necessary to
>> migrate in.
> Seeing what we do for max_extd_leaf, shouldn't we switch to doing what
> you propose for feat.max_subleaf to max_extd_leaf also?
>
> To allow migration between hosts that have 0x80000021.eax and hosts
> that don't have such extended leaf.
>
> cpu_has_lfence_dispatch kind of does that, but if lfence cannot be
> made serializing then the max extended leaf is not expanded.  And we
> should also likely account for more feature leafs possibly appearing
> after 0x80000021?

On second thoughts, this adjustment ought to be in the max policies only.

It's slightly different to LFENCE_DISPATCH, in that we don't actually
have any set bits in those leaves.

I'll do a different patch.

~Andrew

