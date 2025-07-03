Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7EAF744D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 14:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032112.1405869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJC6-00013c-GM; Thu, 03 Jul 2025 12:37:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032112.1405869; Thu, 03 Jul 2025 12:37:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXJC6-000115-DQ; Thu, 03 Jul 2025 12:37:38 +0000
Received: by outflank-mailman (input) for mailman id 1032112;
 Thu, 03 Jul 2025 12:37:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJsU=ZQ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uXJC5-00010g-HP
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 12:37:37 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ce919bf-580a-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 14:37:31 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so40269215e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 05:37:31 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454abed940csm19116315e9.0.2025.07.03.05.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 05:37:30 -0700 (PDT)
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
X-Inumbo-ID: 7ce919bf-580a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1751546251; x=1752151051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GPfixKj1neVEXNYcO6Z7r77rY5+7POKQ4MrksX0/9gw=;
        b=MYWsFTKPwQdVAlND6qtjJ9tBeWkBAmcebPMKhPqYcIRDM/n3ldQbk+Vbd8Kp3qm+C+
         Fa0b3fN0Y2nA1YstHO5n6EsW1THEBO3WO8wDKHNdd/BGwJnEnKWmSp8uGn5gRUPwbdr1
         qeVAvZY3fZa8r7ytdWWmwe+cz+XL2ywKLHfyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751546251; x=1752151051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GPfixKj1neVEXNYcO6Z7r77rY5+7POKQ4MrksX0/9gw=;
        b=aYH5PtQWJtMeRtAvmL1zGNcxBlBXzvlNwYT1TQLAuPxCrrHX9quitLN6Ntv8rJJT6p
         4AClRrtgyT4o7ECNoAm2wzn80lLPW3DDrBe3ay4Ip2tDpOXyqcPx3NRrw/ZnZY7Y6ThF
         3CFP/tOC2BzK6LtTthyIV+SCUwYtu9fK/PitbRn2a19EkOGOpYeGnei3Cz9CVGrHUKOz
         dRO7V48DSgBW/Rw3HPedcHkNUwLAQr79I89tLIpWWLFbQkOxekKBYfalpMIsTeAsUawz
         dkTZI7Z8ig9+p9z6IrocAu7e2M5qh7MZPDYeLyWgnJoaf4DWYhr55PgcVPCjQxxHfD5+
         ULuw==
X-Forwarded-Encrypted: i=1; AJvYcCXlTGaes2HCuZZJ6dZjKA3PrI9za8ueB5tcuY0D+M7P7tdXn/5gxV3tbwItaJH99gMd0KD5T4VOFlM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBntu9k8LPP61gUf28UWzJqPOhw3zCT9faM73Vixm6DKg3p85Q
	6PlEr2ViMJJRFE+YX6D9QoUfaUhH95YQaTSZyJsATZMVOsd+Dg5YYInPZuAXsgAi1Jk=
X-Gm-Gg: ASbGncuRrPw0tvtve+lo4L21tWiRQhqRMgYdVXXe4Cn/czuq61sbnDJxg4ureJJP8bi
	pVQ0Aw5ydnEaPOEntfwH57tRDZ84iZ4LB40hSH2p8/pnaMLKO5+pgZUiDIiHu9epKjNZINVHfQv
	WuDluxHP2ZnI3QOV7uAxPX/shI/qdevOMQ4wGK+D+fyKROHo8bynhJ01p+xWgozXcc+ij0lPV7j
	XWK8xPdnJJmx+PL+v2FYpoY4vR1RnWiIV0n93Uj23D2QY2A/3Avmts1em/7UGWQIecc99P+3vxW
	AkSMiGvrFVdR5uPXTxPcjukxnxz+U8F94gGciI8ObU9uYFEhlsxFCnG+uc0hXvQrT/WhLIZjMit
	pxU4GP6Ulo9Ejzfp2d48TOO9zk3o=
X-Google-Smtp-Source: AGHT+IGrpXT/m/01hhQero3iTPu6/9HmMfW8KYeWtDRj+tbi0jfGIAXpYOVIrUj3J2clvzgWxxRFjw==
X-Received: by 2002:a05:600c:c4ab:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-454a3728b01mr61524975e9.26.1751546251194;
        Thu, 03 Jul 2025 05:37:31 -0700 (PDT)
Message-ID: <f3af6bc7-c953-4b9e-95d2-6d28008a857b@citrix.com>
Date: Thu, 3 Jul 2025 13:37:29 +0100
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
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <9bcefc6b-fb76-4995-8a75-d90589384d1f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/07/2025 10:24 am, Jan Beulich wrote:
> On 02.07.2025 16:41, Andrew Cooper wrote:
>> With the recent simplifications, it becomes obvious that smp_mb() isn't the
>> right barrier; all we need is a compiler barrier.
>>
>> Include this in monitor() itself, along with an explantion.
> Ah, here we go. As per my comment on patch 4, would this perhaps better move
> ahead (which however would require a bit of an adjustment to the description)?

As said, it's not necessary in practice.

>
>> +     * monitored cacheline must not be hoisted over MONITOR.
>> +     */
>>      asm volatile ( "monitor"
>> -                   :: "a" (addr), "c" (ecx), "d" (edx) );
>> +                   :: "a" (addr), "c" (ecx), "d" (edx) : "memory" );
>>  }
> That's heavier than we need, though. Can't we simply have a fake output
> "+m" (irq_stat[cpu])?

No.  That would be wrong for one of the two callers.  Also we don't have
cpu available.

The correct value would be a round-down on addr and a cacheline-sized
sized type, but we can't do that because of -Wvla.

Nothing good can come of anything crossing the MONITOR, and ...

>  Downside being that the compiler may then set up
> addressing of that operand, when the operand isn't really referenced. (As
> long as __softirq_pending is the first field there, there may not be any
> extra overhead, though, as %rax then would also address the unused operand.)

... nothing good is going to come from trying to get clever at
optimising a constraint that doesn't actually improve code generation in
the first place.

>
> Yet then, is it really only reads from that cacheline that are of concern?
> Isn't it - strictly speaking - also necessary that any (hypothetical) reads
> done by the NOW() at the end of the function have to occur only afterwards
> (and independent of there being a LOCK-ed access in cpumask_clear_cpu())?

The NOW() and cpumask_clear_cpu() are gone, and not going to be returning.

I did put a compiler barrier in mwait() originally too, but dropped it
because I couldn't reason about it easily.

Nothing good can come of having any loads hoisted above MWAIT, but from
a programmers point of view, it's indistinguishable from e.g. taking an
SMI.  If there's a correctness issue, it's not MWAIT's fault.

~Andrew

