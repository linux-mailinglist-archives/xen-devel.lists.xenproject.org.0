Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE20AE804E
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 12:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024703.1400540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNmV-00043h-81; Wed, 25 Jun 2025 10:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024703.1400540; Wed, 25 Jun 2025 10:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUNmV-00041w-5H; Wed, 25 Jun 2025 10:55:07 +0000
Received: by outflank-mailman (input) for mailman id 1024703;
 Wed, 25 Jun 2025 10:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P8rF=ZI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uUNmT-00041q-LL
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 10:55:05 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d90136c0-51b2-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 12:55:03 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-450ce671a08so40876635e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 03:55:03 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a6e80ff799sm4386288f8f.69.2025.06.25.03.55.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 03:55:02 -0700 (PDT)
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
X-Inumbo-ID: d90136c0-51b2-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1750848903; x=1751453703; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ3CvkfRigZNUSteX+mfrw6ugifN4FJ4HOdXg4r1jW4=;
        b=uX15ET4/dpzb56IsN9pE9nMxvZUrjmPBTdWX/WJQ4SOM0FACoM0LhE3I32b679FZDT
         mGOzHG9uI9OZvohDgH/m9qmC0Hd9GG1yWhxOXbVSkOC5dKR2cai5Wo90i74My2oHvguT
         K0tOdhqs4SEadB9sXmNHucgZnUOx5WspsXU28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750848903; x=1751453703;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aZ3CvkfRigZNUSteX+mfrw6ugifN4FJ4HOdXg4r1jW4=;
        b=Ur+gL3s4FvYKoxL6ZdUPCwKCBJe+NVH7hgWPMhT51mYD82BLwKHy2Em958umrID3RZ
         2C/iGIzEQ71isC9DL4rXszhq7g1u4KFhmhQ6BVJavU6ZZnWG7MrhkKbGHvaMmTjAwXGg
         1Lg6vTapWqXd23MWEiJNZX07SIsexUMxGguQ0i3a7mwhDCHSD0VxAaM4LSGVdiaJgRxr
         ihUj8qn2O9rHoXSkEXxHG6k446vAZVQe2uAbpvBc0nWOo6sYJRIoBmOZY0uUwOEXoPDs
         7OsRQQ6MSq0lj4ijlcSDteO6cMiAnv0NjAHrCPpsytMCQnDX1GPbpp7pbOC3xnmcM6Qx
         7trg==
X-Forwarded-Encrypted: i=1; AJvYcCUdIibGa+iPf+d674xeTxdZCIzgdNzmKmWGRIjOFxhAgaksQ6Gc99DujPEpXCeE5ZfagkdH+6JkyME=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyFc3+yOsUQNQdOxLO+fSj00K8Gy0siGZk5LFqP/cky7TdKW8qB
	2C3nPd/3iMPGWStcyek9tfNri8R2c2v1rgCvxyFgYOPcqOZIREJMJv/Ockw2qWTugLE=
X-Gm-Gg: ASbGncvRMCSNIUQT1JwynkyuQfCZgcJXjFCziuxyU0Jbxt4KK1cToKKjwy57WPOO7Nk
	yQpls5MeUkHAmlh4wObb2O3rrhcinJeHO0sBkE0ybnN+bK9tj9SyVc+Czdc2j1jXgu3fQOxzTSf
	dcRKTPBisqNpwy/Zyv4mPuTC7ubHadLSiMKksoUAgAtQzrCuuBa6E9oP5d1/vCFYccpr89C3gMz
	+dHS90rNlNDozvx/NUrLKrY5zSdAbpxDkrpd0m3efx+n1umtqOkdtBxI0qN/5Hao+3tG7mifEf8
	ySFbjXarAbGI5epm2TzXPcNrrKxOn6wqBLIDEoB4dOij6Z0aYyWf+aTtg+zl4UVK/LgIWTYPVBm
	rVfl3zBmTosP17zBt+B7gI/rbQv0=
X-Google-Smtp-Source: AGHT+IHB28VOsXxGhXQAnKHgpbuV35MKGFbrNdDQrygQ/HYfplzxagAoRdV3DTcjlxlGj9MDu2H54g==
X-Received: by 2002:a05:6000:2308:b0:3a5:2c18:b181 with SMTP id ffacd0b85a97d-3a6ed6769camr1820789f8f.53.1750848903030;
        Wed, 25 Jun 2025 03:55:03 -0700 (PDT)
Message-ID: <889b4c70-076d-4499-b290-f74c34b6c9aa@citrix.com>
Date: Wed, 25 Jun 2025 11:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] x86/idle: Move monitor()/mwait() wrappers into
 cpu-idle.c
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250624163951.301743-1-andrew.cooper3@citrix.com>
 <20250624163951.301743-2-andrew.cooper3@citrix.com>
 <ae257f63-c8a6-4f02-a19c-5b3f3a63b620@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ae257f63-c8a6-4f02-a19c-5b3f3a63b620@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 10:19 am, Jan Beulich wrote:
> On 24.06.2025 18:39, Andrew Cooper wrote:
>> They're not used by any other translation unit, so shouldn't live in
>> asm/processor.h, which is included almost everywhere.
>>
>> Our new toolchain baseline knows the MONITOR/MWAIT instructions, so use them
>> directly rather than using raw hex.
>>
>> Change the hint/extention parameters from long to int.  They're specified to
>> remain 32bit operands even 64-bit mode.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> We may need to undo this though if we ever meant to use mwait elsewhere, like
> for spinlocks. Many years ago that idea was entertained some, but it may well
> be that it was given up altogether by now.

If they need to move back into a header, that's fine, but it will be
something new.

That said, I'm not sure how useful it would be to mwait on a spinlock. 
You'd need the spinlock in its own cacheline or you'll get false wakeups
triggered by CPU which has the has the lock writing adjacent to the
lock.  Transitions in and out of idle like this are almost certainly
more expensive than a pause loop.

~Andrew

