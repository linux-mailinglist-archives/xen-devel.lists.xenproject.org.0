Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4092AF7D99
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 18:19:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032283.1405950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMet-0006Xu-1K; Thu, 03 Jul 2025 16:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032283.1405950; Thu, 03 Jul 2025 16:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXMes-0006VU-UO; Thu, 03 Jul 2025 16:19:34 +0000
Received: by outflank-mailman (input) for mailman id 1032283;
 Thu, 03 Jul 2025 16:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJsU=ZQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXMes-0006VO-FP
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 16:19:34 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80fa4064-5829-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 18:19:33 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-450cfb790f7so177325e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 09:19:33 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b16288b5sm2004765e9.9.2025.07.03.09.19.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 09:19:31 -0700 (PDT)
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
X-Inumbo-ID: 80fa4064-5829-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751559572; x=1752164372; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iLK4bNJw0NuA53YUqzQNdZvoQNJC37V4NJ4sGp20nXg=;
        b=D5CvaVcMzsLgmnffmDvh0barwH6PFuvkII09sSrY7XN/5EtfRAYGEVNAAgxUK9h40l
         QOHssugshFvLubrTabNLKiUPPmt4xlBL2Il8YHvW0BGP9I3u+YdEqPjDB3tYLTEJzsYf
         urCPQ5hXYLGu541hJaONC8LOIuCQVQ9Rn4DZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751559572; x=1752164372;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLK4bNJw0NuA53YUqzQNdZvoQNJC37V4NJ4sGp20nXg=;
        b=AITDZMZDP1XEOe1MYm8uezD0GZkwr+ljZk4B9TqLgi+91EZl/aFJvmdx8/7YFuEVCI
         WCHKsio1cBhl66/JooIjjYRrNkS6bJWbSczZin72kEtsiCm0ZORevqM3NoS69owEb5UH
         auLgUsPGd7L6sFGjm6hrbm6Lb6m91H4tRhQQapRM5WYzKbbwl3jpKNi652qKiOokKnmz
         xY2QgI/pWcG0iKEIIaIrCZ8yp6ejnkEL4zhshpV2plOOI5Utq5WL6G1kalEedd/01hou
         o02m5w2W0S+23cY9xkOr589OyU4b0RP/NGP/HSjzx4p67Sm/ghXPfj1DwZox+/PkJFFp
         pmsA==
X-Gm-Message-State: AOJu0Yx+cUhbBXAD72iaDe3pkljm7u/IEfO5QBEU4vmAlDEQGOYHJ+Iy
	zJrEUTbXfPPPzfueSjIcytep1MqgqXrPFgsc3mT1/L5edAu233DMnN6R6XXAcJ+GHpI=
X-Gm-Gg: ASbGncsf6I2mhjdBhcLP8wZBSoTVrLHsdyd4e3p76L8KRAIzu5zXHt8Ias9U4YE2PYI
	STpBkyAr/MkhEhtH6CqFr4k3leGk9M0ZNCGMo4ygcWapA8mO0GHZld/om3844wnA81VdMl/u99K
	z+jmVmiccCb+BgpP0bnQS/YmTEsjorrOjcM1osw2J54HAetwyDfg9eiV6Il7kv7QctGZiAJTr5i
	bYNZT+BOyR0o8MEPKWmziCq71c6tf44cLOkDQOz1FxoRFdeiaNkfBraoMfYIxjxme0E50oe9IOc
	uBISPH00F57GoK8QqWZWR2JFHNTV+kPr499MD0HWx8kLlQOELxSJFtbC4uw+dgg1z9ncZ8QcrrH
	TylloZf+jzam/7avlHR5g+xfdMGE=
X-Google-Smtp-Source: AGHT+IHVyiJDxZUd7w2VktN6I8LwbVKfoMJGT84d9LHOqbOQ7tu0+fMp0gXLlPfvb55pd/QBd+ALbw==
X-Received: by 2002:a05:600c:3b15:b0:453:608:a18b with SMTP id 5b1f17b1804b1-454a36e5a0fmr95361025e9.9.1751559572361;
        Thu, 03 Jul 2025 09:19:32 -0700 (PDT)
Message-ID: <834779ef-c83f-400c-a0b1-6c51f1cca777@citrix.com>
Date: Thu, 3 Jul 2025 17:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] x86/idle: Remove broken MWAIT implementation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20250702144121.1096448-1-andrew.cooper3@citrix.com>
 <20250702144121.1096448-2-andrew.cooper3@citrix.com>
 <aGapcEcSfZHURMrL@macbook.local>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <aGapcEcSfZHURMrL@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 5:01 pm, Roger Pau Monné wrote:
> On Wed, Jul 02, 2025 at 03:41:16PM +0100, Andrew Cooper wrote:
>> cpuidle_wakeup_mwait() is a TOCTOU race.  The cpumask_and() sampling
>> cpuidle_mwait_flags can take a arbitrary period of time, and there's no
>> guarantee that the target CPUs are still in MWAIT when writing into
>> mwait_wakeup(cpu).
>>
>> The consequence of the race is that we'll fail to IPI targets.  Also, there's
>> no guarantee that mwait_idle_with_hints() will raise a TIMER_SOFTIRQ on it's
>> way out.
>>
>> The fundamental bug is that the "in_mwait" variable needs to be in the
>> monitored line in order to do this in a race-free way.
> I assume in_mwait being in the same monitored line is required so that
> you can do an atomic exchange and ensure the remote CPU was either in
> the monitor state, or just getting out of it but before processing
> softirqs when the softirq is set?

Yes

> That means that a CPU getting out of mwait would also need to do an
> atomic exchange to clear in_mwait and fetch the pending softirqs?

Not quite.  It's probably better to see patch 4, than discuss it here.

>
>> Arranging for this while keeping the old implementation is prohibitive, so
>> strip it out in order to implement the new one cleanly.  In the interim, this
>> causes IPIs to be used unconditionally which is safe albeit suboptimal.
>>
>> Fixes: 3d521e933e1b ("cpuidle: mwait on softirq_pending & remove wakeup ipis")
>> Fixes: 1adb34ea846d ("CPUIDLE: re-implement mwait wakeup process")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks

~Andrew

