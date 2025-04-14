Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE1FA87C1C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 11:43:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949472.1345993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GLB-0003XZ-Ec; Mon, 14 Apr 2025 09:42:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949472.1345993; Mon, 14 Apr 2025 09:42:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4GLB-0003Uw-Bu; Mon, 14 Apr 2025 09:42:57 +0000
Received: by outflank-mailman (input) for mailman id 949472;
 Mon, 14 Apr 2025 09:42:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KxE1=XA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u4GLA-0003Uq-62
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 09:42:56 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d67f74cb-1914-11f0-9eae-5ba50f476ded;
 Mon, 14 Apr 2025 11:42:54 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso28393935e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 02:42:53 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae977513sm10323309f8f.42.2025.04.14.02.42.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Apr 2025 02:42:52 -0700 (PDT)
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
X-Inumbo-ID: d67f74cb-1914-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744623773; x=1745228573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DfgZ3HijqOJ/wxKjSR7JQ1hrcW4htWHECuAzSUmIyPU=;
        b=IRti0MNjAMX1ekttHuttkWm1Rz+CKa2sZWsTRiivchluCAkS9JPwxzOh6cOKokFjjG
         hFZcJqM5kvNVjPpI10CeLJJjskbWZ3Z2cBhaT2VB5E2dl8W9GxROdlgbz5LkI25EuEqw
         26a7TLLlGKoBfd5erPf/5X6AnwxzryS9jSX8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744623773; x=1745228573;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfgZ3HijqOJ/wxKjSR7JQ1hrcW4htWHECuAzSUmIyPU=;
        b=vna4e4kU4Ahzf3SRwTHd4Ygpv7vzabZzRCOCxhScLVR3w0zjuh48QldSbjDPd0WjZG
         kAkNmEsVF9VDtwjVmQhEKOhpN+CqumbC09IO+/0yAdva543+VP2gZOi1Cw2Tp5dpnpT0
         jH8ZBByddKAVg60G7RN3mx3/nTHiTgsfrAsQmg+a/gCRX/V8QbILF7t30PUTtVsxPeG0
         a5Kz7I7H1CNiv8SbxCwtF6do17aJLemsZ34IlJfJmOCVa7G71RgDWLX3gv8+ugUpZ708
         KFOUofhcd9Ym7hf9ZO0o5MuZElN+C4K+ykQZCSE3xYyPiYQgR/RSkMHazOKDPCpsn8fZ
         msmA==
X-Forwarded-Encrypted: i=1; AJvYcCU52wWkxCmizgeKNfO+eNcuT1vxIY6RENqeIAtOxklu9yB/D5hFNTb2z2SBNW7TnIeIGKbwLelICFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyPFBAZTx0fyhm1LVtwcnrmPbNu5XVYMr8iOP/dAU6R3ft7b5sn
	iKRqkVMBaSY3Q3+Bev3GSyGpSazmPM/Svhll+AeSHp9vyna691sdDtIf2pKE6cI=
X-Gm-Gg: ASbGnctYFAX7MyCZzusT9N5ITq5o0lQWe9X3XXC8MWrCs9giCMMv3woi0nVhw69tJzn
	hfbGcGxyyEG4D89lwU5xZ77goBvdfCsITSGpS00OYXUPm6FfBVEe5bIAV1KyuMIzm3p01KU93y7
	JssrnRXkLAlOW16o78RIbTcxj6VCf5uqHG0a2qvEezbktTmVOx77KBbZRR7huI3VCs5kzWLvWYd
	ezhqp8t3r/QsOMIgfsoEuUfcLrv8oT7uzgJ62z4IzpikCqwCDd+n+oyfW/v3/Bs94H8+p+Px0jk
	db1vQaWCsVErFjt0XexLTVN9IOMWotGGjfjX+Q5vD+yIupxilUhFgofz3P0VCf5ElQy0J1rciRM
	cTT7z/6SFhaKGAbFe
X-Google-Smtp-Source: AGHT+IFAOdrv1YOpqoo6ajfO8MlUUcZdb/MtRuAi9hVdNC8EU50jmyrH8tNayCyl02P8iK3i6pd2ew==
X-Received: by 2002:a5d:5c84:0:b0:391:4674:b136 with SMTP id ffacd0b85a97d-39ea5213d70mr7669029f8f.29.1744623773160;
        Mon, 14 Apr 2025 02:42:53 -0700 (PDT)
Message-ID: <fd8b6f0a-983d-4413-af73-422da9fad6a2@citrix.com>
Date: Mon, 14 Apr 2025 10:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] CI: fix waiting for final test message (again)
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250413134826.1366350-1-marmarek@invisiblethingslab.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <20250413134826.1366350-1-marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/04/2025 2:47 pm, Marek Marczykowski-Górecki wrote:
> The previous attempt has correct diagnosis, but added -notransfer flag
> in a wrong place - it should be used in the first (outer) match out of
> two, not the second (inner) one.
>
> Fixes: 1e12cbd6af2c ("CI: fix waiting for final test message")
> Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

> This actually fixes the issue described in the referenced commit. When
> that issue happens, it can be seen as a complete console output (up to
> Alpine login prompt), but test still failed.
> But that is not all the issues, sometimes it hangs really in the middle
> of dom0 boot, for example with last lines as:
>
>     [    1.816052] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
>     Poking KASLR using RDRAND RDTSC...
>     [    1.818089] Dynamic Preempt: voluntary
>     [    1.818251] rcu: Preemptible hierarchical RCU implementation.
>     [    1.818254] rcu: 	RCU event tracing is ena
>
> and sits there for over 120s.
>
> It's unclear to me yet whether it's a real dom0 hang, or an issue with
> grabbing console output. Debugging...

This is now the only failure I've been encountering, given the extensive
runs over the weekend.

~Andrew

