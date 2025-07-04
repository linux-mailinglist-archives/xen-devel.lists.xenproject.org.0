Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB7AF973F
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 17:45:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1033461.1406828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXibV-0004nU-Uf; Fri, 04 Jul 2025 15:45:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1033461.1406828; Fri, 04 Jul 2025 15:45:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXibV-0004lL-S0; Fri, 04 Jul 2025 15:45:33 +0000
Received: by outflank-mailman (input) for mailman id 1033461;
 Fri, 04 Jul 2025 15:45:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7FCR=ZR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXibU-0004lF-HK
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 15:45:32 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9f63565-58ed-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 17:45:30 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-451dbe494d6so11864295e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jul 2025 08:45:30 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b471b9736bsm2815301f8f.60.2025.07.04.08.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 08:45:29 -0700 (PDT)
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
X-Inumbo-ID: e9f63565-58ed-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751643930; x=1752248730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iChYFgv0/SbUs96OcHbpYXD6tqtYb8tRYGyw12KTKOM=;
        b=QJ8RuTgxWbcqY/p4quOzv91+aSiB6k1DEN1GfTAjA/N1fbVWOwdoy8pwB80m3JE5QB
         WIANmEOADh7HBxQLZhFUlytKMZCLIwxxvnjim1IOO8gFZtBBnGNhFsJNQoeDYmUj45IG
         DKDYG+Eu/3WZo39ol0EvaiVJGiccCYR6ES1BI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643930; x=1752248730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iChYFgv0/SbUs96OcHbpYXD6tqtYb8tRYGyw12KTKOM=;
        b=c+KP8He1ET/C4VpiG52/uQyhK8N9w+RkzLk97698gvfMfyTU408ThSNHTJN3hGc5ZW
         L37p6jsa4ZE6FEnR9dLLvG7QjLCi4MFKkKIm1DRLjFXA49RwyXGmZCsEvCvtmEJEqOjH
         ZbPpLDyqqVyee+U6bWo0SLY0tQ1yFflmmjANDcn6dgJByh4cwvSoEukaYeHSHsE++nUr
         iWX09MqKjkpe2vK8e4lmHZL2WC444V65HdyjkdHG9gI9oc9DQMv6ha0wqXHMKZ82BHit
         AqAEMaJZ3Q58qAKbwRvBiZZetcygDZsjBi9sCcQQvwZTXElugLKt+YmIOkr57W+se0vG
         3IiA==
X-Forwarded-Encrypted: i=1; AJvYcCWZtpcHI3f2mtqQnUbepQh1Pgd9kgf+Prkrvevkpzv4ni0b+eNfCCRQmlbBgxv53CmhUC4EY72L/IY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIzRPn8ct8ftmIGAcA5atFc5Y1O/0rZzeKVyWGQ6PmRpztne92
	NOBfExuD7JoCY7Z+GTP5eF4o9eNQ+ZManojhn/AiSn0j5P8ImE1tEmNdESDVcRfwlVU=
X-Gm-Gg: ASbGnctY7kt3VbtSaAKyPbm6rFxh9PKAa7VSwnQQSEIqXvGiNdyV9rLzSNj8/rVEAsO
	/L41jPp21oOC/9wAk+R2ERarZ2INchHxEDZvs0C+s2Q2bSswqTctcMIgHBlr+yU/Bt5yB+nZ2MZ
	iGkeSwCs/DAvo+hY4OneeCDCaEYSb+BymJwTmEEZRtUGz+P2nGWEqmrtX235ooU0A0pdCgtYvbF
	UFTz2k5QVqjAUXgFTgMayk1OsIYYOXmCmX3If2dg4q9wKKi1B57qOSduKSMJuWE4SUWgDXFkP9/
	B7sFESZfef0gBJc6W0lMaTng94/8bFuTysL3F2qJvshoj4l/seuusMiHCC6dx2lWBMYzF5Fsa9H
	RzaMFrQMJrNvnHYDtM8Pye8cWFaU=
X-Google-Smtp-Source: AGHT+IGSj9OZYd9wfzD2j7vEaQhSrkDkid84O+TNzTyQQwpdm/OBRBwTF38HEsfP3TI7xfUe0kJGwQ==
X-Received: by 2002:a05:600c:c4a6:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-454b8ea84eemr10033315e9.18.1751643929895;
        Fri, 04 Jul 2025 08:45:29 -0700 (PDT)
Message-ID: <bb7dfbfd-34e5-4b58-941f-4d7fbf0e564c@citrix.com>
Date: Fri, 4 Jul 2025 16:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] x86/idle: Drop incorrect smp_mb() in
 mwait_idle_with_hints()
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-6-andrew.cooper3@citrix.com>
 <9bcefc6b-fb76-4995-8a75-d90589384d1f@suse.com>
 <f3af6bc7-c953-4b9e-95d2-6d28008a857b@citrix.com>
 <6fa07d3a-fa63-456a-a801-edf7db54cd32@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <6fa07d3a-fa63-456a-a801-edf7db54cd32@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 2:30 pm, Jan Beulich wrote:
> On 03.07.2025 14:37, Andrew Cooper wrote:
>> On 03/07/2025 10:24 am, Jan Beulich wrote:
>>> On 02.07.2025 16:41, Andrew Cooper wrote:
>>>> With the recent simplifications, it becomes obvious that smp_mb() isn't the
>>>> right barrier; all we need is a compiler barrier.
>>>>
>>>> Include this in monitor() itself, along with an explantion.
>>> Ah, here we go. As per my comment on patch 4, would this perhaps better move
>>> ahead (which however would require a bit of an adjustment to the description)?
>> As said, it's not necessary in practice.
> As said where? All you say here is that a memory barrier is needed. Perhaps
> my use of "ahead" was ambiguous? I meant "move ahead in the series", not
> "move ahead in code". Apart from this as a possibility I fear I don't
> understand.

I did take it to mean "ahead in the series".

Your comment in patch 4 talks about alternative(), alternative_io() and
barriers.  I stated (admittedly without reference) that the barrier
between two alternatives() doesn't matter because of their volatileness.

It can move in the series, because it is genuinely independent and
unrelated to patch 4 AFAICT.


>> Nothing good can come of having any loads hoisted above MWAIT, but from
>> a programmers point of view, it's indistinguishable from e.g. taking an
>> SMI.  If there's a correctness issue, it's not MWAIT's fault.
> Well, yes, but what in the code is it that tells the compiler not to? Up
> to and including LTO, should we ever get that to work again. This
> specifically may be why mwait() may need to gain one, despite not itself
> dealing with any memory (operands).

In practice, mwait() is surrounded by spec_ctrl_{enter,exit}_idle() and
nothing is crossing those.  I'm going to leave the mwait side of things
alone for now.

But even with LTO, if hoisting a read causes a problem, that's a bug in
whatever got hoisted, not in MWAIT.

~Andrew

