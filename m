Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3F854D65
	for <lists+xen-devel@lfdr.de>; Wed, 14 Feb 2024 16:53:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681041.1059573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHZe-00069f-Uw; Wed, 14 Feb 2024 15:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681041.1059573; Wed, 14 Feb 2024 15:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raHZe-00067g-SI; Wed, 14 Feb 2024 15:53:26 +0000
Received: by outflank-mailman (input) for mailman id 681041;
 Wed, 14 Feb 2024 15:53:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Sn1=JX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1raHZd-00067a-W4
 for xen-devel@lists.xenproject.org; Wed, 14 Feb 2024 15:53:25 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fe1fe1d-cb51-11ee-8a4d-1f161083a0e0;
 Wed, 14 Feb 2024 16:53:25 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d0a4e1789cso66924841fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Feb 2024 07:53:25 -0800 (PST)
Received: from [10.80.67.149] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056402044200b0056200715130sm1428241edw.54.2024.02.14.07.53.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:53:24 -0800 (PST)
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
X-Inumbo-ID: 2fe1fe1d-cb51-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1707926005; x=1708530805; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bD9rKCpEMpxhCq5S1MQTvrpi48yycMfbflB2M7btCJ4=;
        b=XOr1zU+NULIKGhXKOp54VwTsIM28/4FH5tzLXOvr/JtuaEUMheUjI10eV6wFvSKkdr
         s305CMpbzvR1Vx7ksnjjK1IKIDAWInDDgbxD4GwC36dlet37G8Gu7jyn1wFAXcw3Dp8d
         189gfVmZcEHNWk3bTGXfLbK/dSkZbgVmbWsaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707926005; x=1708530805;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bD9rKCpEMpxhCq5S1MQTvrpi48yycMfbflB2M7btCJ4=;
        b=wpxGxe8MSLHcX1ww92y3Nl7e9W4CvsZqf0Y4gli9W9HyyH7MurzSM1+TM4KHW5mxt8
         1/bkfgMFPCrhK75Pp5IybuZiDhVs8R1LtiBFw60Uy8uf6/2Kj2clAv8af+QUtsM5SajF
         4/CsptMe+znuCD+rPI32jvr0SPxtLcINx1FOtoYqRR0pLEDOGH0O6E8J1l1fA+B4+GLy
         NwPsZ3f+BD0ndAesozrnWvuKb3Pwh9J3KZHfx+mlQaPxWvJscO8qTiJUs555edyYil54
         fz2JtPOsQn93riE2cw1sjePTxsKRrP8kXirQNdZ7ZE7CGgBc0kWFU50PB38AASLeO3FH
         bWaA==
X-Gm-Message-State: AOJu0YwWDBVOFrRwrHqzeTj0Cl0nLRjYGE1Il+3gr8tHJTyo9xrbcHYa
	kATriLsbc+VQEDN5TPDdwMbx3DqVz7UFfb43LWp1gPGh55dQkW3VSPYjBPz9IOA=
X-Google-Smtp-Source: AGHT+IHF1vaPf0hF5WCQth0xAJj+9SA8dKAbXKqoYWt91IqshkJUxmycF3u7z4/QLZJVsNghR/B09w==
X-Received: by 2002:a2e:b0cb:0:b0:2d0:9bcb:6248 with SMTP id g11-20020a2eb0cb000000b002d09bcb6248mr2193963ljl.39.1707926004685;
        Wed, 14 Feb 2024 07:53:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4Uv1Nrz0eQnERdJ83gzeXaQq8Lqy9hCB8Mqt8H2jKph1nnnpmUWTE/4/J6znao81F8tS4C6Z2Sh+hr8Aqsa1sRU5lwIx+jpGdKWOcOGo38LHioCGWgJxs+kRN3lPUGnkryR4zAtORsA==
Message-ID: <7f92673f-fa33-478f-ab27-bbec2ead5c40@citrix.com>
Date: Wed, 14 Feb 2024 15:53:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Reduce assembly code size of exception entry points
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
References: <20240214103558.13655-1-frediano.ziglio@cloud.com>
 <ZczWAg-zmoLXiWAr@macbook> <ce3ae020-92b2-44fd-8055-694e374f68a9@suse.com>
 <ZczcPhpcWuAO7OYh@macbook>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <ZczcPhpcWuAO7OYh@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/02/2024 3:29 pm, Roger Pau Monné wrote:
> On Wed, Feb 14, 2024 at 04:08:12PM +0100, Jan Beulich wrote:
>> On 14.02.2024 16:02, Roger Pau Monné wrote:
>>> On Wed, Feb 14, 2024 at 10:35:58AM +0000, Frediano Ziglio wrote:
>>>> We just pushed a 8-bytes zero and exception constants are
>>>> small so we can just write a single byte saving 3 bytes for
>>>> instruction.
>>>> With ENDBR64 this reduces the size of many entry points from 32 to
>>>> 16 bytes (due to alignment).
>>>> Similar code is already used in autogen_stubs.
>>> Will using movb instead of movl have any performance impact?  I don't
>>> think we should trade speed for code size, so this needs to be
>>> mentioned in the commit message.
>> That's really what the last sentence is about (it could have been said
>> more explicitly though): If doing so on interrupt paths is fine, it
>> ought to be fine on exception paths as well.
> I might view it the other way around: maybe it's autogen_stubs that
> needs changing to use movl instead of movb for performance reasons?
>
> I think this needs to be clearly stated, and ideally some kind of
> benchmarks should be provided to demonstrate no performance change if
> there are doubts whether movl and movb might perform differently.

The push and the mov are overlapping stores either way.  Swapping
between movl and movb will make no difference at all.

However, the shorter instruction ends up halving the size of the entry
stub when alignment is considered, and that will make a marginal
difference.  Fewer cache misses (to a first approximation, even #PF will
be L1-cold), and better utilisation of branch prediction resource (~>
less likely to be BP-cold).

I doubt you'll be able to see a difference without perf counters
(whatever difference is covered here will be dwarfed by the speculation
workarounds), but a marginal win is still a win.

~Andrew

