Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B438C6C88
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 21:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722586.1126694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Jqu-0007GB-VZ; Wed, 15 May 2024 18:59:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722586.1126694; Wed, 15 May 2024 18:59:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Jqu-0007DM-Sn; Wed, 15 May 2024 18:59:48 +0000
Received: by outflank-mailman (input) for mailman id 722586;
 Wed, 15 May 2024 18:59:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RHxB=MS=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7Jqs-000735-Mk
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 18:59:46 +0000
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [2607:f8b0:4864:20::f2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4aa57925-12ed-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 20:59:46 +0200 (CEST)
Received: by mail-qv1-xf2e.google.com with SMTP id
 6a1803df08f44-6a0f889877cso23932796d6.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 11:59:44 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a16068cee4sm65728846d6.8.2024.05.15.11.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 11:59:43 -0700 (PDT)
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
X-Inumbo-ID: 4aa57925-12ed-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715799583; x=1716404383; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V2/WvhCWtgZ5MsKAPwOX/iQz6ESjwDd7SAlTx3Kd59g=;
        b=OtJDf1Fa3pwa/gThi31JMkmomTsgXl05pSN8uGPuU4l/dLRr4VX90JFt2GLV7F9cgQ
         IQDuY33xR+xlMGqrwbXlXJXzHA/A6X3nqiLBT4KNeVxtOLW7S6fd9rW86kE/AZREdYLc
         Nz9chp5vIbcIE75SBjsh/in3AqE0bohXA0gnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715799583; x=1716404383;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2/WvhCWtgZ5MsKAPwOX/iQz6ESjwDd7SAlTx3Kd59g=;
        b=SZoTk8aM3vHEoQLE68VUjUQRZBAf7yIbnhSJHe7QNSfcn+WElsnRtHOQlf0+8RRovn
         bVYjjjnFe9hozyjoAG0Sne7NX/4U/qhzFYYZcBP9tpPgYraIgG68XXHRYap/qSbp6XbU
         z5QwCV8XlUfwrEfMUmLlQaVzY68zWLyzX1KCAhXmPL/QUKvhMHGcDMpqUYdUdxTT9KpM
         C29M1rAvJmx95NgRSlpu5X3QySjFxEtzzaEAP0E9TGiNPAv/m5FzXp6933D587RcIpdj
         BxYwKUtQAx6Jwbyl7VTjKeXjMl/g7oYxrezaGV37xJnZ1zWogf8wbEiKieGy+ZaE/bDa
         M+Pw==
X-Gm-Message-State: AOJu0Yw7dFpMxuEuGAI9BKmbcmi8GBkkBGYVlnA6hrmaEP8F6EHlAr0F
	WalWhpB6qDquxKNVQu0jHjsR6H+zPKPV+q22zkTmWvcUhWwI7CbbAgI/jF2zTy8=
X-Google-Smtp-Source: AGHT+IElJVgK7hN8t25dFARsWPG5ihF7do8FCY2B2M57YN4f+sc37waMpQX1mZXLpyWutEvwGiJ/IA==
X-Received: by 2002:a05:6214:5a13:b0:6a0:d220:861f with SMTP id 6a1803df08f44-6a168244e10mr162380586d6.59.1715799583460;
        Wed, 15 May 2024 11:59:43 -0700 (PDT)
Message-ID: <f679bb5c-d1d7-4b24-9025-17419255a1d2@citrix.com>
Date: Wed, 15 May 2024 19:59:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/mtrr: avoid system wide rendezvous when
 setting AP MTRRs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240513085925.59324-1-roger.pau@citrix.com>
 <2d245c04-3bf9-4b9d-ad02-e754dcbefa28@citrix.com>
 <dd689012-0554-43ae-b22b-035415ce3392@citrix.com> <ZkN4q6H591SeT6wH@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZkN4q6H591SeT6wH@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/05/2024 3:43 pm, Roger Pau Monné wrote:
> On Tue, May 14, 2024 at 02:50:18PM +0100, Andrew Cooper wrote:
>> On 14/05/2024 12:09 pm, Andrew Cooper wrote:
>>> On 13/05/2024 9:59 am, Roger Pau Monne wrote:
>>>> There's no point in forcing a system wide update of the MTRRs on all processors
>>>> when there are no changes to be propagated.  On AP startup it's only the AP
>>>> that needs to write the system wide MTRR values in order to match the rest of
>>>> the already online CPUs.
>>>>
>>>> We have occasionally seen the watchdog trigger during `xen-hptool cpu-online`
>>>> in one Intel Cascade Lake box with 448 CPUs due to the re-setting of the MTRRs
>>>> on all the CPUs in the system.
>>>>
>>>> While there adjust the comment to clarify why the system-wide resetting of the
>>>> MTRR registers is not needed for the purposes of mtrr_ap_init().
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>> For consideration for 4.19: it's a bugfix of a rare instance of the watchdog
>>>> triggering, but it's also a good performance improvement when performing
>>>> cpu-online.
>>>>
>>>> Hopefully runtime changes to MTRR will affect a single MSR at a time, lowering
>>>> the chance of the watchdog triggering due to the system-wide resetting of the
>>>> range.
>>> "Runtime" changes will only be during dom0 boot, if at all, but yes - it
>>> is restricted to a single MTRR at a time.
>>>
>>> It's XENPF_{add,del,read}_memtype, but it's only used by Classic Linux. 
>>> PVOps only issues read_memtype.
>>>
>>> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Actually no - this isn't safe in all cases.
>>
>> There are BIOSes which get MTRRs wrong, and with the APs having UC
>> covering a wider region than the BSP.
>>
>> In this case, creating consistency will alter the MTRRs on all CPUs
>> currently up, and we do need to perform the rendezvous in that case.
> I'm confused, the state that gets applied in mtrr_set_all() is not
> modified to match what's in the started AP registers.
>
> An AP starting with a different set of MTRR registers than the saved
> state will result in the MTRR state on the AP being changed, but not
> the Xen state stored in mtrr_state, and hence there will be no changes
> to synchronize.
>
>> There are 3 cases:
>>
>> 1) Nothing to do.  This is the overwhemlingly common case.
>> 2) Local changes only.  No broadcast, but we do need to enter CD mode.
>> 3) Remote changes needed.  Needs full broadcast.
> Please bear with me, but I don't think 3) is possible during AP
> bringup.  It's possible I'm missing a path where the differences in
> the started AP MTRR state are somehow reconciled with the cached MTRR
> state?

[Summarising a conversation on Matrix]

The problem case is when the BSP has an MTRR covering [$X, $X+2) and an
AP has has an MTRR covering [$X, $X+3).

This is a firmware bug (asymmetric settings), but it has been observed
in practice.  The resolution in this case ought to be to update all CPUs
to use [$X, $X+3), if that is the more UC direction.

However, it appears that Xen always resolves asymmetry like this by
choosing the BSP setting.  Therefore, (whether we should or not), we
don't have a case where observing an AP state results in a change of
state on other CPUs.

Therefore while case 3 exists in reality, we're not losing it as a side
effect of this patch.

So we'll take the improvement here and defer the other bugs to a future
juncture.

~Andrew

