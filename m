Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0334914F8B
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 16:07:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746674.1153804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkLY-0006WD-W9; Mon, 24 Jun 2024 14:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746674.1153804; Mon, 24 Jun 2024 14:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLkLY-0006UB-TQ; Mon, 24 Jun 2024 14:07:04 +0000
Received: by outflank-mailman (input) for mailman id 746674;
 Mon, 24 Jun 2024 14:07:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IpOW=N2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1sLkLX-0006Sp-LL
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 14:07:03 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 077703b6-3233-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 16:07:02 +0200 (CEST)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ec1ac1aed2so53337871fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jun 2024 07:07:02 -0700 (PDT)
Received: from ?IPV6:2003:e5:8729:4000:29eb:6d9d:3214:39d2?
 (p200300e58729400029eb6d9d321439d2.dip0.t-ipconnect.de.
 [2003:e5:8729:4000:29eb:6d9d:3214:39d2])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d305616dfsm4772996a12.79.2024.06.24.07.07.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 07:07:01 -0700 (PDT)
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
X-Inumbo-ID: 077703b6-3233-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719238022; x=1719842822; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0barnV27hwc5UKQU4XJM1KtyxYMRXyRpHupRJPqEnIQ=;
        b=CtqCJaicL94lLwhKbR64BdSnc2mDMrtmgB5nOlPMpW4HtA5gwESyd+Kgv4VTs32rdX
         b0mSdW8goE9BxdouwoSoLqvw+a1boh8fdHG3Y4Eefj38zci9LyhQukPaRrpOR+Nn7pwR
         R2VZHoy8YmMyZ7b4DEoq7uuwURr08Rn4RvRbMnH7GXpsz+bYacswyH9ATbnS/DRO+dpf
         Ir4gdq05sYArvY6EofbdqCyxMu5lScT07uAtHywKin/tI5QRDlAw39wfwnuyiNGYw11U
         jgQoAa2B5zUC6/Fq7ckvMc/APKlDv/rDn/LfmX44WXVkCsPsnGBUOXlqFwU5qOE09L9t
         DHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719238022; x=1719842822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0barnV27hwc5UKQU4XJM1KtyxYMRXyRpHupRJPqEnIQ=;
        b=ttECZd/DNlGb1bPapRcSJhuUZoFO3Awfl/i/0uSFgZ/nzDqQ0J0N7Pdy5dv+JWTT66
         kCfZyw4fP8RLSIhhCUR7Yi7mtR4mFhfuX7cR4dw7N43Q517HQ9gW9Pw3xznTDeHQfoKP
         CNKOZitpdSz0VJoq4bogjPsL06enRYn8yP9IbNNhNcm6mAJnOcdV8bLIo4oGivekZWtw
         /QwIcw4fuB8hJj+FN/1/i/7I7W60/1YanxX2OZtXxEz+W75cO8gvFxB4GBcWh9Ib2nB3
         i+9mk1JL7AEgUBdgaWHPvjYnQ+oawyjz8qTEpslcShgdZ6BhmPVNFYfbRvPa1ZGsSnO7
         TFpg==
X-Gm-Message-State: AOJu0YxS8urny5lgfDJz0KvC1whjIE3s0U0C90yJeApvYl/xyIxyii+E
	PLTT8NXjJc4Ihjz/GJc+IsavYnaALfrgYjybphaeEtsDknQM50LMq7gpcKxIbMqUfh3HAGrCWTu
	B
X-Google-Smtp-Source: AGHT+IEE50wp9VgUOoKh1JacFeWQ/XJli9PtBBP8RLQC0+E/sms7PNusypFEsXwyRLvWSpkS2ZkdmQ==
X-Received: by 2002:a2e:9d86:0:b0:2ec:5a0d:b2dd with SMTP id 38308e7fff4ca-2ec5b2f0373mr27918991fa.39.1719238021688;
        Mon, 24 Jun 2024 07:07:01 -0700 (PDT)
Message-ID: <d280b6ec-8de2-4917-a453-7b519aa67cfd@suse.com>
Date: Mon, 24 Jun 2024 16:07:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ACPI NVS range conflicting with Dom0 page tables (or kernel
 image)
To: Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a5a8a016-2107-46fb-896b-2baaf66566d4@suse.com>
 <ZnBCFgHltVqj2FDh@mail-itl> <bd2eb947-7fca-4f1a-bf43-addccdda35a0@suse.com>
Content-Language: en-US
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
In-Reply-To: <bd2eb947-7fca-4f1a-bf43-addccdda35a0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.06.24 16:25, Jan Beulich wrote:
> On 17.06.2024 16:03, Marek Marczykowski-Górecki wrote:
>> On Mon, Jun 17, 2024 at 01:22:37PM +0200, Jan Beulich wrote:
>>> Hello,
>>>
>>> while it feels like we had a similar situation before, I can't seem to be
>>> able to find traces thereof, or associated (Linux) commits.
>>
>> Is it some AMD Threadripper system by a chance?
> 
> It's an AMD system in any event, yes. I don't have all the details on it.
> 
>> Previous thread on this issue:
>> https://lore.kernel.org/xen-devel/CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com/
> 
> Ah yes, that's probably the one I was vaguely remembering. There it was the
> kernel image E820 conflicted with. Yet ...
> 
>>> With
>>>
>>> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
>>> ...
>>> (XEN)  Dom0 alloc.:   0000000440000000->0000000448000000 (619175 pages to be allocated)
>>> ...
>>> (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
>>>
>>> the kernel occupies the space from 16Mb to 64Mb in the initial allocation.
>>> Page tables come (almost) directly above:
>>>
>>> (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
>>>
>>> I.e. they're just above the 64Mb boundary. Yet sadly in the host E820 map
>>> there is
>>>
>>> (XEN)  [0000000004000000, 0000000004009fff] (ACPI NVS)
>>>
>>> i.e. a non-RAM range starting at 64Mb. The kernel (currently) won't tolerate
>>> such an overlap (also if it was overlapping the kernel image, e.g. if on the
>>> machine in question s sufficiently much larger kernel was used). Yet with its
>>> fundamental goal of making its E820 match the host one I'm also in trouble
>>> thinking of possible solutions / workarounds. I certainly do not see Xen
>>> trying to cover for this, as the E820 map re-arrangement is purely a kernel
>>> side decision (forward ported kernels got away without, and what e.g. the
>>> BSDs do is entirely unknown to me).
>>
>> In Qubes we have worked around the issue by moving the kernel lower
>> (CONFIG_PHYSICAL_START=0x200000):
>> https://github.com/QubesOS/qubes-linux-kernel/commit/3e8be4ac1682370977d4d0dc1d782c428d860282
>>
>> Far from ideal, but gets it bootable...
> 
> ... as you say, it's a workaround for particular systems, but not generally
> dealing with the underlying issue. This explains why I couldn't find any
> patch(es), though.

Today the PV dom0 boot only supports to relocate the initrd or the p2m
map in case of E820 conflicts.

Relocating the start_info data or the initial page tables should be rather
simple, but doing the same with the kernel is problematic.

I need to look into this in more detail, maybe I can come up with a solution.


Juergen

