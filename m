Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61684B209E7
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 15:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077599.1438635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulSOW-0006jO-7s; Mon, 11 Aug 2025 13:16:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077599.1438635; Mon, 11 Aug 2025 13:16:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulSOW-0006h4-56; Mon, 11 Aug 2025 13:16:56 +0000
Received: by outflank-mailman (input) for mailman id 1077599;
 Mon, 11 Aug 2025 13:16:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=92re=2X=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ulSOU-0006gy-DS
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 13:16:54 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fd415fd-76b5-11f0-b898-0df219b8e170;
 Mon, 11 Aug 2025 15:16:48 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso27596425e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 06:16:48 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm40730669f8f.27.2025.08.11.06.16.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 06:16:47 -0700 (PDT)
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
X-Inumbo-ID: 6fd415fd-76b5-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1754918208; x=1755523008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5myF4aui7F/pjoMuI7/Jcxv0qY1yShjpcKQ694jxm5Q=;
        b=TVoklmKqQNm0ej3uWVOtWNdVrRdFR56Itz6AWGqwAergCkpJDPReKb3YVaLkzxK6JI
         iOEy2wYG9/plj4dchEKvwADjvjMJ4HO+IinGK0E0yqxZ9Ekey4g00OAMpkbkSGRju8nl
         Ylf0vMVq8MpUKL/dreyBMm3LaZYXXM/0KSWcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754918208; x=1755523008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5myF4aui7F/pjoMuI7/Jcxv0qY1yShjpcKQ694jxm5Q=;
        b=Qz/WFGhvsJMAfxfuClk7UcCluhqSfzkSkJewX/ZvBaowQlkNbCfuYh9NnPE05vxibS
         rWxpM9f6EJpeethXYeHtQ+Ka18HBecxcMfRI8pTUWihotxK9aTSordveOf+Ck7vXKFZM
         Ao7O6tNhntUUuloCoz8+EZxy5Vc3eVS67Zp2rBqDmBS5qacshyhF+EqjbdMmIE1t9ibt
         NgqyR8LQb+SZqN2A1ljscRbJYZfdigcxtQmJuKg573jPCcux8go4rteVacVNQe+I2ceO
         K4UO7cuH19RDV+QQirh1RXzAlVQO6wUuIWmwuirWV/BO785ZRxGfN45/vFQ6RqdQtx2P
         Aoow==
X-Gm-Message-State: AOJu0YyZHul7cLJzaBmxsOGnLBt+UAGWzZ+JAsLNdEcdiIG+dOFvUXb0
	a0McaWk6Z6ggoBUyr6p41CKqdEOiGdL6SCav3pN0S61Ah78XVM6NrMCHLJrpvIqaAy4=
X-Gm-Gg: ASbGncvukimz8qrRxvtzvmfmfipSNhPEDgxdV7qjZyNmj0dLhHSvSCPdNLU36ARI6wd
	6Dv4SzITV/RB7h5CK0PZNeHXPRrzP1Bhl0QMaaWxz5XWHY6gq9TOnoZmAOFd+/s4Iz5mTmVLYP5
	X+wPlOeBqiM+5XlkzZhApF7NhdrmgzPh6jDZ0EJdK6Hi0mFGxWrBpGozyzf1LW/JaTurJZ0rpOQ
	aVH2uP52aH6209Y/w69cVZYDaIvetz7GtWTzC0owOQy+lFpUswMcSNuJAaGiMzyecEOopR1oieH
	Z3g7ySW80OqeneccJujHXi9ZTkXZFjv6WdSpG5z9gV54HAhyr+AZmXHgDQjwR1pWNh0/sfyZ5E6
	1kv+wLxtKhQs1tlr0iVc7J5bCTYmviRn6c2N/cuqBnLv1vwYvzVMZ5juCifC3PUGYUyoM
X-Google-Smtp-Source: AGHT+IF8n0iu976Dai538Iar5sFYvijTM2LBx5PULRxNLxAmEJRIFjrQt07F6tXAuSms5aqALW4dVw==
X-Received: by 2002:a05:600c:5490:b0:459:d645:bff7 with SMTP id 5b1f17b1804b1-459f4f52999mr115874275e9.12.1754918208077;
        Mon, 11 Aug 2025 06:16:48 -0700 (PDT)
Message-ID: <4fb544d7-fede-46b8-950e-f9c4af1cb04f@citrix.com>
Date: Mon, 11 Aug 2025 14:16:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: S3 regression related to XSA-471 patches
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <aJMtPLNqQFbGg5cs@mail-itl>
 <f971f8a8-487e-4b9f-8c75-80ebfe70c3b6@suse.com> <aJMyjYfeTL5uPRtk@mail-itl>
 <aJTilUXpchmRq2Ng@mail-itl>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aJTilUXpchmRq2Ng@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/08/2025 6:29 pm, Marek Marczykowski-Górecki wrote:
> On Wed, Aug 06, 2025 at 12:46:36PM +0200, Marek Marczykowski-Górecki wrote:
>> On Wed, Aug 06, 2025 at 12:36:56PM +0200, Jan Beulich wrote:
>>> On 06.08.2025 12:23, Marek Marczykowski-Górecki wrote:
>>>> We've got several reports that S3 reliability recently regressed. We
>>>> identified it's definitely related to XSA-471 patches, and bisection
>>>> points at "x86/idle: Remove broken MWAIT implementation". I don't have
>>>> reliable reproduction steps, so I'm not 100% sure if it's really this
>>>> patch, or maybe an earlier one - but it's definitely already broken at
>>>> this point in the series. Most reports are about Xen 4.17 (as that's
>>>> what stable Qubes OS version currently use), but I think I've seen
>>>> somebody reporting the issue on 4.19 too (but I don't have clear
>>>> evidence, especially if it's the same issue).
>>> At the time we've been discussing the explicit raising of TIMER_SOFTIRQ
>>> in mwait_idle_with_hints() a lot. If it was now truly missing, that imo
>>> shouldn't cause problems only after resume, but then it may have covered
>>> for some omission during resume. As a far-fetched experiment, could you
>>> try putting that back (including the calculation of the "expires" local
>>> variable)?
>> Sure, I'll try.
> It appears this fixes the issue, at least in ~10 attempts so far
> (usually I could reproduce the issue after 2-3 attempts).
>

Can you show the exact code which seems to have made this stable?

We discussed this in the x86 maintainers meeting, and our best guess is
a timer that's not torn down or recreated properly on S3, but this is
largely speculation.

~Andrew

