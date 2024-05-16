Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C93E8C7664
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 14:30:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723275.1127977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aFd-0002Bq-RK; Thu, 16 May 2024 12:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723275.1127977; Thu, 16 May 2024 12:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7aFd-00029O-Nj; Thu, 16 May 2024 12:30:25 +0000
Received: by outflank-mailman (input) for mailman id 723275;
 Thu, 16 May 2024 12:30:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lir8=MT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s7aFb-00010i-Ok
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 12:30:23 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10bf3634-1380-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 14:30:23 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a59c5c9c6aeso308664666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 05:30:23 -0700 (PDT)
Received: from [10.80.67.140] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17894d6dsm980953966b.71.2024.05.16.05.30.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 05:30:22 -0700 (PDT)
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
X-Inumbo-ID: 10bf3634-1380-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715862622; x=1716467422; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JdK0drs0oIPnJU9lfAwWPoE+YMXHxQGT1xqLV4ohw2k=;
        b=PjTyCQ6NzberdIr17Ppenq+bbA4IBcPA361TOsq/T83xE/yKa4hOLXay2js/rO+OHY
         njEylUBdqdf0sGKiWPQGSvMRvJ9Ix+5mKIL0x60JuP5VDZsrE2N7uc1JugaFH8WxPNlB
         aOXggOmrPX27Lvrv7i0SJz08Tanjx5AAGhU7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715862622; x=1716467422;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JdK0drs0oIPnJU9lfAwWPoE+YMXHxQGT1xqLV4ohw2k=;
        b=IpcJbjNBMUhPTCHxBd6baMMbSW/pkqfllexhdrXa/rmLZtXNvW1rHMbE+bBmDSvLvC
         07kob10q6OtRetdrYNv/Ocmb/gRyN8Ndnt+ZK++Z7zsNX6OQGnyLEmP4zgreFpn+Uc1v
         f+xptHzeFmp+a1iiIGGvwGGP6OS82OhvxhLQCayhIkfHtkPlcjffaK5T0K1hYsQIy2iG
         2D6EEkJ2dIWGYvvcx/n2enC1EjiE0FVSj/UoKt970bZvXtw/SecOF+ShQGBrzcGBNYL5
         6biJ2+JTMNvIo2f70lKuqXmokDYQ/qU78s3AZWOCMAxVx82bZXzinoGgVJwWe9OWbBqK
         Tw+Q==
X-Gm-Message-State: AOJu0YzLy5PuxZeeUYi3gr3VxHdSkpAWcCepGpA+wECUudmTOiosa9rc
	9KNlCyvSxnBBXVm/KBaRDW10YKt8TlUom1yWpNuQyeMa1hY6POSJ/5VPXIKFAfM=
X-Google-Smtp-Source: AGHT+IFC8scBM6GPoDJ5CrF/425mQ4aCv1Lon2Rw/uSwLOWMtvf/VoOxuxEwtzpva2aiQQ8U863ERQ==
X-Received: by 2002:a17:907:7da3:b0:a58:e3d9:e2d6 with SMTP id a640c23a62f3a-a5a2d672f76mr1592713266b.56.1715862622490;
        Thu, 16 May 2024 05:30:22 -0700 (PDT)
Message-ID: <4bc4f2f5-6914-445a-a9a1-a609c0c3cf1f@citrix.com>
Date: Thu, 16 May 2024 13:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/ucode: Further fixes to identify "ucode already up to
 date"
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Fouad Hilly <fouad.hilly@cloud.com>
References: <20240516113103.3018940-1-andrew.cooper3@citrix.com>
 <ZkXzFwbYfFI6DeP8@macbook>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZkXzFwbYfFI6DeP8@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16/05/2024 12:50 pm, Roger Pau Monné wrote:
> On Thu, May 16, 2024 at 12:31:03PM +0100, Andrew Cooper wrote:
>> When the revision in hardware is newer than anything Xen has to hand,
>> 'microcode_cache' isn't set up.  Then, `xen-ucode` initiates the update
>> because it doesn't know whether the revisions across the system are symmetric
>> or not.  This involves the patch getting all the way into the
>> apply_microcode() hooks before being found to be too old.
>>
>> This is all a giant mess and needs an overhaul, but in the short term simply
>> adjust the apply_microcode() to return -EEXIST.
>>
>> Also, unconditionally print the preexisting microcode revision on boot.  It's
>> relevant information which is otherwise unavailable if Xen doesn't find new
>> microcode to use.
>>
>> Fixes: 648db37a155a ("x86/ucode: Distinguish "ucode already up to date"")
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> CC: Fouad Hilly <fouad.hilly@cloud.com>
>>
>> Sorry Fouad, but this collides with your `--force` series once again.
>> Hopefully it might make things fractionally easier.
>>
>> Background: For 06-55-04 (Skylake server, stepping 4 specifically), there's a
>> recent production firmware update which has a newer microcode revision than
>> exists in the Intel public microcode repository.  It's causing a mess in our
>> automated testing, although it is finding good bugs...
>> ---
>>  xen/arch/x86/cpu/microcode/amd.c   | 7 +++++--
>>  xen/arch/x86/cpu/microcode/core.c  | 2 ++
>>  xen/arch/x86/cpu/microcode/intel.c | 7 +++++--
>>  3 files changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
>> index 17e68697d5bf..f76a563c8b84 100644
>> --- a/xen/arch/x86/cpu/microcode/amd.c
>> +++ b/xen/arch/x86/cpu/microcode/amd.c
>> @@ -222,12 +222,15 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
>>      uint32_t rev, old_rev = sig->rev;
>>      enum microcode_match_result result = microcode_fits(patch);
>>  
>> +    if ( result == MIS_UCODE )
>> +        return -EINVAL;
>> +
>>      /*
>>       * Allow application of the same revision to pick up SMT-specific changes
>>       * even if the revision of the other SMT thread is already up-to-date.
>>       */
>> -    if ( result != NEW_UCODE && result != SAME_UCODE )
>> -        return -EINVAL;
>> +    if ( result == OLD_UCODE )
>> +        return -EEXIST;
> Won't it be simpler to just add this check ahead of the existing one,
> so that you can leave the code as-is, iow:
>
>     if ( result == OLD_UCODE )
>         return -EEXIST;
>
>     /*
>      * Allow application of the same revision to pick up SMT-specific changes
>      * even if the revision of the other SMT thread is already up-to-date.
>      */
>     if ( result != NEW_UCODE && result != SAME_UCODE )
>         return -EINVAL;
>
> Thanks, Roger.

Not really, no.  That still leaves this piece of logic which is
misleading IMO.

MIS_UCODE is the only -EINVAL worthy case.

Every other *_UCODE constant needs to be 0 or -EEXIST, depending on
allow-same/--force.

~Andrew


