Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB47899DDE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 15:02:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701289.1095639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjCd-0007FC-9B; Fri, 05 Apr 2024 13:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701289.1095639; Fri, 05 Apr 2024 13:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsjCd-0007Df-6V; Fri, 05 Apr 2024 13:01:55 +0000
Received: by outflank-mailman (input) for mailman id 701289;
 Fri, 05 Apr 2024 13:01:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1z4c=LK=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rsjCc-0007C4-FZ
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 13:01:54 +0000
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [2607:f8b0:4864:20::72d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac4307e7-f34c-11ee-afe6-a90da7624cb6;
 Fri, 05 Apr 2024 15:01:53 +0200 (CEST)
Received: by mail-qk1-x72d.google.com with SMTP id
 af79cd13be357-789d76ad270so125756485a.0
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 06:01:53 -0700 (PDT)
Received: from [10.80.67.139] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 bi12-20020a05620a318c00b0078d48fdb52dsm565218qkb.76.2024.04.05.06.01.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 06:01:51 -0700 (PDT)
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
X-Inumbo-ID: ac4307e7-f34c-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1712322112; x=1712926912; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcsRZAjo7DinRVxcG0Ff/ptdGhlNYKHM6NfLwaa+PMk=;
        b=IGB9T+e/ZV+YUsodAh9XpMYIEH/ocd34ZURFRhsgGGi/8G4jCYoGT2JBIElWSuqfZT
         XKuNuqzueTWp0OnAMvUVqFiQIZoitcxYWLxzLM7YHGkwiUwfW/qNj8AOnVV4K6/8oET5
         73AJaJm0bLYiRckpcEBexmci9hvJ4N65B6LQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712322112; x=1712926912;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcsRZAjo7DinRVxcG0Ff/ptdGhlNYKHM6NfLwaa+PMk=;
        b=Lp1+FCq4bLnPw12yTdALeyVbZiVJ96Kj8/VddP6fijHaFpVmUJtqIrgs20y38RtiRA
         fdLNkyiCpQ6QMx2D0mlWfxIyVa5+7pJhKvah1HvCzQYaiYDdiGFoCuwv22j9oj9SBogx
         PIx+JPO+Ynt/1HRlJQiLJRHHTD2Xnd+9ZVDJM37xByUgR+jJboq9ZWD/Tbrlpml4jAy4
         ZkUKW8Mkhip/37JyewTU9Wd/uGlw9A1d4HVpr6Np7yci1OXA/13pi9LpGqJ8Bc+rTgp1
         Ncc9MHoA2rzcoCdP0pz7bcoRSbgBMMLe3nwSCzODRILhNCR/Yjasxn2WPZFpjtncUJk8
         IC2A==
X-Forwarded-Encrypted: i=1; AJvYcCV337LrIXmeEouaVyLOwA9F4nygmGZCuPcTxPBCifLYViW01vsFuH9/TIu2Sl0Q9HqLUzACGeyCXSReWyM3FbosKOmTQGQqW1hCACuyOTo=
X-Gm-Message-State: AOJu0YxLuc+Dm735ZPRNh1QhGk8r/mwupfH6my+oY4DHyLnKdgwfiJuQ
	ZMt21zFJkKTMcb5VYYHGTNALBu1AC7wW0XQJ/CHpLazdqQP9BchbhnvE9h0ZAGQ=
X-Google-Smtp-Source: AGHT+IErYqYSBmp6HLsWIjbmgo/dfMc/TXS9YKTEoL5uieNDNzSFXCm9dcg0d21TYHiCmX/LkNXnhw==
X-Received: by 2002:a05:620a:2b87:b0:78b:de95:a037 with SMTP id dz7-20020a05620a2b8700b0078bde95a037mr1764955qkb.45.1712322112085;
        Fri, 05 Apr 2024 06:01:52 -0700 (PDT)
Message-ID: <ea554cd5-8578-49ae-adb6-e2dfab6cb946@citrix.com>
Date: Fri, 5 Apr 2024 14:01:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <Zg1stUacaDBkyDOn@mail-itl>
 <20240404104122.2870129-1-andrew.cooper3@citrix.com>
 <6e99f73f-bf83-4c40-b97c-5cead300a781@suse.com>
 <7ebf879b-01d1-4a13-9464-199d08960213@citrix.com>
 <071e8a23-6a16-4a61-aa42-1f85a9c98203@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <071e8a23-6a16-4a61-aa42-1f85a9c98203@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2024 2:32 pm, Jan Beulich wrote:
> On 04.04.2024 15:22, Andrew Cooper wrote:
>> On 04/04/2024 1:45 pm, Jan Beulich wrote:
>>> For the write-discard property, how was that determined? Does it affect all
>>> writable bits?
>> Marek kindly ran a debugging patch for me last night to try and figure
>> out what was going on.
>>
>> Currently, Xen tries to set 0x2 (TSX_CPUID_CLEAR) and debugging showed
>> it being read back as 0.
>>
>> I didn't check anything else, but I have a strong suspicion that I know
>> exactly what's going wrong here.
> Hmm, at the risk of upsetting you: Is a suspicion really enough for a
> firm statement in a comment?

The statement is all demonstrable properties.

The suspicion is about *why* we've ended up with the properties we have,
and is based on my involvement in the original planning for this.

>> The property the if() condition is mainly looking for is !RTM &&
>> !(MSR_TFA.CPUID_CLEAR) because that's an illegal state in a
>>
>>>> +             * Spot this case, and treat it as if no TSX is available at all.
>>>> +             * This will prevent Xen from thinking it's safe to offer HLE/RTM
>>>> +             * to VMs.
>>>> +             */
>>>> +            if ( val == 0 && cpu_has_rtm_always_abort && !cpu_has_rtm )
>>>> +            {
>>>> +                printk(XENLOG_ERR
>>>> +                       "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",
>>> This isn't really firmware, is it? At least I wouldn't call microcode
>>> (assuming that's where the bad behavior is rooted) firmware.
>> Microcode is absolutely part of the system firmware.
> The ucode ahead of being loaded into CPUs is, sure. But once in the CPU
> (and there may not be any loading at least in theory), it's not anymore.

You appear to have a very singular impression of what does and does not
constitute firmware.

If you can change Intel and AMD's mind on this matter, feel free to
submit a patch changing the wording here.

~Andrew

