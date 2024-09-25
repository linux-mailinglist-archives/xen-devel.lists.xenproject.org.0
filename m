Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEED98571F
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2024 12:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.803811.1214626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPD7-0006RO-5i; Wed, 25 Sep 2024 10:25:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 803811.1214626; Wed, 25 Sep 2024 10:25:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stPD7-0006PV-2w; Wed, 25 Sep 2024 10:25:29 +0000
Received: by outflank-mailman (input) for mailman id 803811;
 Wed, 25 Sep 2024 10:25:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFoA=QX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1stPD6-0006PP-Ed
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2024 10:25:28 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ac1e32a-7b28-11ef-99a2-01e77a169b0f;
 Wed, 25 Sep 2024 12:25:26 +0200 (CEST)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c24ebaa427so1311330a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 25 Sep 2024 03:25:26 -0700 (PDT)
Received: from ?IPV6:2a00:23ee:19c8:3368:2340:cc04:33fd:b83a?
 ([2a00:23ee:19c8:3368:2340:cc04:33fd:b83a])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cb0afsm193363566b.138.2024.09.25.03.25.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Sep 2024 03:25:25 -0700 (PDT)
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
X-Inumbo-ID: 7ac1e32a-7b28-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1727259925; x=1727864725; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e9sPicUzZHkXQmTLP4F5KJcMA2Qv6Gf6fwKHiuQ5BL0=;
        b=XJhLvR2GOQJ0HSaRd5vY128eVBNfbsWDwWiLP0MLkwy0u4oXZdECMSY3KMvCiIBGA1
         YruRf8Pc0hrbdYaU1MHK1xtPBE5lq2ReYyvrsahGV1k1H1vKtezIovTkKCpWRAdF/p0L
         xmB2HnZ3ubSv8Z4IPenmTLFaQrXotMNJwnT70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727259925; x=1727864725;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9sPicUzZHkXQmTLP4F5KJcMA2Qv6Gf6fwKHiuQ5BL0=;
        b=gXcfVF1vHSFZQtRNnzyjQVRRL2XNyg8RJmjpyi6le32BKRZgdnjaMD2jjnUhEK6Kno
         WXJm1lrOqVHQO1vSsDRYUouYxm4t1DYwHN4uoRhYGzCye4WKbXzSq7AtRgl5JgcaRNDQ
         rmx846n5lQuJIn4ZMfWmkV6/sI4961/84rZ5tVEOPB6jnf7URg8aNSX0c5x4am1SuNQR
         UxhoXxzEyLMYUKb1TGhgl+dSq3wjOzwIcS6/wCe9+nkI9tG8RZxZfM3FneKDRj0+IUH5
         6b68/zSJ5hn6bnxFVRl/iVWGc9TBweGAIUI5pFSea0tmNbNxCk7hCp2GLRnp34LdgP9o
         vSJw==
X-Forwarded-Encrypted: i=1; AJvYcCUhD0YwBPpDdtJ5uBpmAltgen2m5wkShvQlGZt936u5EVydrK7QdBxwo35ioqGO1JWp7Zki6E29PgE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxrlf3FjjbLU6QuV3+VeUn7sXd8dB3jLYTR7bL9wjzccPYge3kO
	55MdM3WsewRJ0pzQE62MkFmrJ1Rlqb2qFXruwA91G1BXA+85deBBez8sZPqlbbk=
X-Google-Smtp-Source: AGHT+IG1XyL2LyVdPCJYeNuPpiPx3mdQ1NMp2plrBaY3oPDEVoOKW/0w694nK3+6tLxv8PDsT3UrUA==
X-Received: by 2002:a17:907:e8d:b0:a91:161d:7e7a with SMTP id a640c23a62f3a-a93a16854bdmr229616966b.3.1727259925571;
        Wed, 25 Sep 2024 03:25:25 -0700 (PDT)
Message-ID: <cf996644-cfe3-4a93-a13a-175925f498bf@citrix.com>
Date: Wed, 25 Sep 2024 11:25:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/alternatives: do not BUG during apply
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
References: <20240925084239.85649-1-roger.pau@citrix.com>
 <20240925084239.85649-6-roger.pau@citrix.com>
 <5a22e8a0-da9d-415f-85a5-42d2a372a08e@suse.com>
 <ZvPX1jFl7DLyXHk8@macbook.local>
 <d7fc6937-e384-4340-b946-2774ceec373d@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <d7fc6937-e384-4340-b946-2774ceec373d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/09/2024 11:02 am, Jan Beulich wrote:
> On 25.09.2024 11:28, Roger Pau Monné wrote:
>> On Wed, Sep 25, 2024 at 11:01:08AM +0200, Jan Beulich wrote:
>>> On 25.09.2024 10:42, Roger Pau Monne wrote:
>>>> alternatives is used both at boot time, and when loading livepatch payloads.
>>>> While for the former it makes sense to panic, it's not useful for the later, as
>>>> for livepatches it's possible to fail to load the livepatch if alternatives
>>>> cannot be resolved and continue operating normally.
>>>>
>>>> Relax the BUGs in _apply_alternatives() to instead return an error code.  The
>>>> caller will figure out whether the failures are fatal and panic.
>>>>
>>>> Print an error message to provide some user-readable information about what
>>>> went wrong.
>>>>
>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Albeit ...
>>>
>>>> @@ -394,8 +418,10 @@ static int __init cf_check nmi_apply_alternatives(
>>>>                                   PAGE_HYPERVISOR_RWX);
>>>>          flush_local(FLUSH_TLB_GLOBAL);
>>>>  
>>>> -        _apply_alternatives(__alt_instructions, __alt_instructions_end,
>>>> -                            alt_done);
>>>> +        rc = _apply_alternatives(__alt_instructions, __alt_instructions_end,
>>>> +                                 alt_done);
>>>> +        if ( rc )
>>>> +            panic("Unable to apply alternatives: %d\n", rc);
>>> ... I see little value in logging rc here - the other log message will
>>> provide better detail anyway.
>> Current log messages do indeed provide better detail, but maybe we end
>> up adding new return error paths to _apply_alternatives() in the
>> future.
> I'd expect such error paths to then also have dedicated logging.
>
>>  I see no harm in printing the error code if there's one.
> Well, it's not much harm indeed, yet imo extra data logged also normally
> wants to have a reason for the logging. After if you look at the log,
> you'd expect every detail to tell you something (useful; in some certain
> cases at least). Anyway - I don't mean to insist on the removal, it just
> looked pretty useless to me.

People reading the logs can ignore bits they don't think are useful.

What they cannot do is read data which should have been there but wasn't.

~Andrew

