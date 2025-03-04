Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45770A4F1B8
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 00:44:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901580.1309540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpbur-0004Va-8f; Tue, 04 Mar 2025 23:43:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901580.1309540; Tue, 04 Mar 2025 23:43:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpbur-0004U8-5Z; Tue, 04 Mar 2025 23:43:13 +0000
Received: by outflank-mailman (input) for mailman id 901580;
 Tue, 04 Mar 2025 23:43:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Z5M=VX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tpbuq-0004U2-4B
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 23:43:12 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6dd9aade-f952-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 00:43:09 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-390dd35c78dso144887f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 15:43:09 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7b6asm19493014f8f.51.2025.03.04.15.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 15:43:08 -0800 (PST)
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
X-Inumbo-ID: 6dd9aade-f952-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741131789; x=1741736589; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BJwzpwNMYQFtwOmsHfKr1uwlmscdDTCKzODsd5j9Upw=;
        b=Xo1CqKI4H1VXiW3X14LsrPx3FdV0dU1c/JSVKXrM9onAuaZLBxRu+iyjRkJcrHy30G
         qguB3kTKOMzBvqkgtNPGDKTdhqdouhEl/hLRFHxIyNP54ip50iUgkmPDBet+4EYT6sbg
         e3I8ivpcwWrbbsTyGX8zLj2zHUITrb1/N01gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741131789; x=1741736589;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJwzpwNMYQFtwOmsHfKr1uwlmscdDTCKzODsd5j9Upw=;
        b=ROdmbZlVnXyotSyeenedKlJ6gc5x/gN7gCeomqnlFr6cW3zZ/14kro9V97XzxkxEXD
         N3s4XZJfuyijyl5eELejRKJZHBBFfhWliuK0mpV58umsdzh3q9OUYebe8SB6geRNi2r+
         RUGeDZO6LMqdvcKXQ8fxlte1nAn+dPkWrCwA2QO4POaqVF3YDRrdIpFHomljtUWRzFQR
         /XzieEb/gf126PpomLkoWQjrLguFWuWAHj1CIHdeS6C8gd5mf1E3EhICgTBhEHL+RyJh
         iB6Nyg+3rFleGsgu6BL71+hRgWLvCUNWjmGaXNgBhpvntO96kPZxBV2NGQZtug/SmahA
         sHvQ==
X-Gm-Message-State: AOJu0Yx/U8vrJdTLGl9rFCK9uehUKRvmobvwRcsE4+rksrnlDWyddx8X
	hxWBINzbF+SQHPRdD7HlIfOt2WBh61s+PdAE+bdSZh6V9RnY+2bCWfLnmnZy2B8=
X-Gm-Gg: ASbGncsQzOZICLb3DKj4s1g0GoK8YIPZQhoMBypDE/rIwTc6wE1HmgKt8NuWdzXGPwj
	qZ0TKb5qUHVpodfQAcwHxe0d4tUo62mHxpwpVdF8DeuaZfZdWSKa9XFkYC+Yn/gziZsEUTf64y1
	79WBljltq8haB7+NwCsuKNDnYXiLkqdorCtr6WZiuEv13Hpt3okNysPwF0DQE2lgCACw32CSbXx
	RfvXy92vHqidUarHLXUSngMg1eYnecbzqN7dF6BkaCewhj7I7cyCAqNJASshoXwzrSQEHTS0TVY
	h3E6xdghHEA6NsmF2+eUQmfJwfuNWgrtwbhP9q7EoLaYGKaqe8YhUgVZymSJ+NIkRa+p2sdxD3w
	WutJDO2p7
X-Google-Smtp-Source: AGHT+IGX1Sbut74l4A4ODylML50Dagv65fAzq9vRo6RZ9wSvyrr348s7mqrLF67DiP2umgLuUjNW7g==
X-Received: by 2002:a5d:47a5:0:b0:391:1218:d5f4 with SMTP id ffacd0b85a97d-3911ea411f0mr637835f8f.23.1741131789363;
        Tue, 04 Mar 2025 15:43:09 -0800 (PST)
Message-ID: <a4c19e0a-3545-499f-b33f-878b96b877fe@citrix.com>
Date: Tue, 4 Mar 2025 23:43:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] xen/watchdog: Identify which domain watchdog fired
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <gwd@xenproject.org>
References: <20250303232941.2641306-1-andrew.cooper3@citrix.com>
 <20250303232941.2641306-3-andrew.cooper3@citrix.com>
 <alpine.DEB.2.22.394.2503041445010.1303386@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2503041445010.1303386@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04/03/2025 10:47 pm, Stefano Stabellini wrote:
> On Mon, 3 Mar 2025, Andrew Cooper wrote:
>> When a watchdog fires, the domain is crashed and can't dump any state.
>>
>> Xen allows a domain to have two separate watchdogs.  Therefore, for a
>> domain running multiple watchdogs (e.g. one based around network, one
>> for disk), it is important for diagnostics to know which watchdog
>> fired.
>>
>> As the printk() is in a timer callback, this is a bit awkward to
>> arrange, but there are 12 spare bits in the bottom of the domain
>> pointer owing to its alignment.
>>
>> Reuse these bits to encode the watchdog id too, so the one which fired
>> is identified when the domain is crashed.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> The code looks like it would work as intended.

It's already deployed into production[1].  (Guess /why/ we need to
distinguish the two watchdogs.)

> I checked with the MISRA rules and it looks like it would fall under the
> allowed exception. Please have a run through ECLAIR to make sure it
> doesn't cause regressions (especially R11.2).

Eclair is happy:

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1700050949

~Andrew

[1] Actually, the version that took me 2 minute to write one evening
over beer after work when the initial request for help came in. 
Followed shortly by an explanation of how alignment works.

