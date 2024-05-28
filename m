Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 158EC8D1DEC
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 16:08:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731167.1136526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBxTO-0006NQ-CD; Tue, 28 May 2024 14:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731167.1136526; Tue, 28 May 2024 14:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBxTO-0006Lr-9c; Tue, 28 May 2024 14:06:42 +0000
Received: by outflank-mailman (input) for mailman id 731167;
 Tue, 28 May 2024 14:06:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+/BF=M7=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sBxTN-0006Ll-Ll
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 14:06:41 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8020c10a-1cfb-11ef-b4bb-af5377834399;
 Tue, 28 May 2024 16:06:38 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-57864327f6eso1474494a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 07:06:38 -0700 (PDT)
Received: from [10.125.230.17] ([217.156.233.157])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-578638009b1sm5719158a12.17.2024.05.28.07.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 07:06:37 -0700 (PDT)
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
X-Inumbo-ID: 8020c10a-1cfb-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716905198; x=1717509998; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bhn2iLHzD8RvektTs6H45lIDox1xDUH0MHd7mOG3ujU=;
        b=D6wCgbxEQ/OaTRyNeyEAyzP0/UJYVaM9WkgcDmI0K4/gVN+d2eIQHr0I0Jlroq6GLo
         dfF3xraTxcHTZ2rZiYrpDJdokCBC+Q2IiUWsFEAJ7xl1GEXdxua6QcSl+l+8dxD4IZ+v
         mqW8Wy3F/x0/iTYNTVbBAr947NTOzmITJWI4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716905198; x=1717509998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bhn2iLHzD8RvektTs6H45lIDox1xDUH0MHd7mOG3ujU=;
        b=V9cIoA8U3Y7aKnRPFcO5oaFvyVNTWRHVZtWgaJWW6ioeTDmUWDYYqoxx/YRcyytEQj
         rzhXPRD0S9OTV+R0BZy1LilAuidFVKP6pBwU4s0srY2tpA38kTq0EAwjuNK16sWeZQtI
         N5cIGE4eAUIv94ePI5J3zcjTP8Zy4Rm2QoiyR8G42inrqhCUWa+a8pyQLXRoLnkAPkoq
         30tZN07NVtpp828sOBjeE3aA0l/lwYkVKdzByPaCRymM3k/YtPDn8QvzVrgKM5/rGYKA
         hpKfuMb3mEyz9dJ4txO3xp1Acpnx/MQY/gQKh9fxh9+zkfURwXBzWO8VR3oHsrvqwXX9
         8tAA==
X-Gm-Message-State: AOJu0YyvKA35EiQCMaEhgsrIHM+dF8zbQ7EgAw7OCsMeqKtMb9bTfmMK
	jhRXhLEv0n1LBKtOFi9MCaFGMIj2Cm3+3tSmdaJzMKO3J6lp7PIhBYRlFPRTuIXbwPok37oGqAv
	Cr68=
X-Google-Smtp-Source: AGHT+IFxxosmwm5fJLRksdu5GoaFebftUhqfuKMLz9fQvz5jhSkuIx/ZWMEW47zD7NnhNranfn4A9w==
X-Received: by 2002:a50:cd01:0:b0:578:6019:265a with SMTP id 4fb4d7f45d1cf-578601927e8mr9871190a12.8.1716905197814;
        Tue, 28 May 2024 07:06:37 -0700 (PDT)
Message-ID: <5d00435f-510e-463e-ae1a-d7b3bce31151@cloud.com>
Date: Tue, 28 May 2024 15:06:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] xen/x86: Synthesise domain topologies
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <f51b54328a09c510c9320f1317c2da371ef16eb5.1715102098.git.alejandro.vallejo@cloud.com>
 <ZlBWtXkpkqzh1EWC@macbook> <6e1c52a3-98d2-42e9-96b7-91010806cdf5@cloud.com>
 <ZlRCXmjhsM5o4tVw@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZlRCXmjhsM5o4tVw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/05/2024 09:20, Roger Pau Monné wrote:
> On Fri, May 24, 2024 at 06:16:01PM +0100, Alejandro Vallejo wrote:
>> On 24/05/2024 09:58, Roger Pau Monné wrote:
>>> On Wed, May 08, 2024 at 01:39:27PM +0100, Alejandro Vallejo wrote:
>>>
>>>> +        rc = x86_topo_from_parts(&p->policy, threads_per_core, cores_per_pkg);
>>>
>>> I assume this generates the same topology as the current code, or will
>>> the population of the leaves be different in some way?
>>>
>>
>> The current code does not populate 0xb. This generates a topology
>> consistent with the existing INTENDED topology. The actual APIC IDs will
>> be different though (because there's no skipping of odd values).
>>
>> All the dance in patch 1 was to make this migrate-safe. The x2apic ID is
>> stored in the lapic hidden regs so differences with previous behaviour
>> don't matter.
> 
> What about systems without CPU policy in the migration stream, will
> those also get restored as expected?
> 
> I think you likely need to check whether 'restore' is set and keep the
> old logic in that case?
> 
> As otherwise migrated systems without a CPU policy will get the new
> topology information instead of the old one?

Bah. I hoped the x2apic ID restoration would mean I could get away with
removing all that junk, but migrations from Xen v.StoneAge do cause
mayhem. And it'd be very bizarre because the new topology leaves would
not reflect the existing x2apic IDs either.

I'll condense that blob of nonsense with the old scheme into a separate
function so we can easily deprecate it in the future.

> 
>> IOW, The differences are:
>>   * 0xb is exposed, whereas previously it wasn't
>>   * APIC IDs are compacted such that new_apicid=old_apicid/2
>>   * There's also a cleanup of the murkier paths to put the right core
>>     counts in the right leaves (whereas previously it was bonkers)
> 
> This needs to be in the commit message IMO.
> 

Sure.

>>>
>>> Note that currently the host policy also gets the topology leaves
>>> cleared, is it intended to not clear them anymore after this change?
>>>
>>> (as you only clear the leaves for the guest {max,def} policies)
>>>
>>> Thanks, Roger.
>>
>> It was like that originally in v1, I changed in v2 as part of feedback
>> from Jan.
> 
> I think that's fine, but this divergence from current behavior of
> cleaning the topology for the host policy needs to be mentioned in
> the commit message.
> 
> Thanks, Roger.

Sure.

Cheers,
Alejandro

