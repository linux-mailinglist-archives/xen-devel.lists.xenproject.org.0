Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C86996D776
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 13:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791054.1200827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smAxW-0001xe-IV; Thu, 05 Sep 2024 11:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791054.1200827; Thu, 05 Sep 2024 11:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smAxW-0001v1-FZ; Thu, 05 Sep 2024 11:47:30 +0000
Received: by outflank-mailman (input) for mailman id 791054;
 Thu, 05 Sep 2024 11:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smAxU-0001ut-Rm
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 11:47:28 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a00089ba-6b7c-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 13:47:27 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a86984e035aso107313066b.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 04:47:27 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a6236d04csm125190466b.122.2024.09.05.04.47.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:47:26 -0700 (PDT)
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
X-Inumbo-ID: a00089ba-6b7c-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725536847; x=1726141647; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SoauAPYcmSY2oUuE6sEM3/Ab11WdW5MOsZ8mFCiLBTE=;
        b=VIfhXvxSeqU0ngmSjUY+jVepkQ3zc/f+vtp74zcobuPIIBjkO7c0Ha0tbRqoO3gXub
         gNjU3IyS/o4yhgybrbQECTE7F2FQiVYV+meMS3YziDIDbbr2bRDW97gW6gedkpqRA8Js
         zm912OUhYySPE4VnhT4bWnNQctu0HojWOgD41arCvF1Xt1AZD6MqejwyP13vAu0+g8UR
         0CJjbfEUBcq6o61xPfcYhQEZ4IkEN/eaq9uXeFL93ycuPcea2GrMkcBNrimP22cOUvdk
         6RtyYVbz97I8A1BeRvF7TgMLu2bIONn35H63M6BvYiPCfRfDyKMUbkjb4HzESYLODy72
         xYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725536847; x=1726141647;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SoauAPYcmSY2oUuE6sEM3/Ab11WdW5MOsZ8mFCiLBTE=;
        b=bSm55MPMo2S09uiCXUGFO49tRwnEDs9oa/FxKvaTFMcShORZRev6dXky+12Pn4dCps
         38j7tn+sXulOEx9OVf7+s3A7H0WW0GO4jiWVJD/0QrIm5LWkAYfajQfTVrTZ9IKw8Ps8
         t70zGwWoTWEvxV/G/ovu3MMvzLNz3ALjiTZx261+4zqP7HZrtSQEmSEdnKGHhirjTY0E
         Fe2CW6rRHaZesnRR72XbTgnvaJ1/mpmaLWWHxZKbZmmeS4VPv9qQ76xx5DoW2deYg9nN
         m15JKF+j6JYlhqGOl7I+5Rwsk6FsfrCeHzf8bkrWP5b7KYtxKrchUWLMjgWG6TToRtyn
         NxNQ==
X-Gm-Message-State: AOJu0Yw/KojnLHedzE4IdHWJHGOF8bCbieB6zkLZ8ECLLZpaGYgEJEW1
	HQ6BwhVJPobds64GyRFvYe1iDV83YxvVFirZm0vv1pCDJH/yvjaDnSI1AOGxAK1Rtg6NPhruIug
	=
X-Google-Smtp-Source: AGHT+IEReSlc+eOf2asnNM8ddx49Q/QvTTcsktOA0ecfpcAhqFJKW7LTTh3uwo1+c4WLKpwD2thkdg==
X-Received: by 2002:a17:907:72d6:b0:a80:788e:176c with SMTP id a640c23a62f3a-a89a35ceef6mr1751670866b.23.1725536847050;
        Thu, 05 Sep 2024 04:47:27 -0700 (PDT)
Message-ID: <40f6c75a-7a1e-4303-8d11-59221e3507bc@suse.com>
Date: Thu, 5 Sep 2024 13:47:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] x86/HVM: stdvga caching mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <4ffb8702-d1b4-4e7d-986c-b03ace9e75ea@suse.com>
 <39f10864-3fc5-4637-bf2c-4db3f2eb28a7@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <39f10864-3fc5-4637-bf2c-4db3f2eb28a7@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.09.2024 12:41, Andrew Cooper wrote:
> On 05/09/2024 11:33 am, Jan Beulich wrote:
>> Hello,
>>
>> I happened to spot a ~14y old revert of the crucial hunk of the ~16y old
>> 551ceee97513 ("x86, hvm: stdvga cache always on") in our patch set,
>> supposedly to deal with text mode corruption when Linux is booted without
>> any "vga=" option, and when - after the GUI is up - the console is
>> switched back to one of the text mode ones.
>>
>> My immediate reaction was that we shouldn't be carrying such privately.
>> Yet after some playing with it I'm now at the point where I'm wondering
>> why we have that caching mode in the first place. It looks to hardly ever
>> come into use:
>> 1) As of 68e1183411be ("libxc: introduce a xc_dom_arch for hvm-3.0-x86_32
>>    guests") caching mode is disabled from start-of-day, due the disabling
>>    being unconditional in hvm/save.c:arch_hvm_load(). That can of course
>>    be worked around, but then 2).
>> 2) In the course of setting up VGA, REP STOS (maybe REP MOVS) are
>>    apparently used by both SeaBIOS and ROMBIOS, as can be derived from
>>    stdvga_mem_accept() always hitting the "if ( p->dir == IOREQ_WRITE &&
>>    p->count > 1 )" path while BIOS initializes.
>>
>> Further:
>> 3) 551ceee97513 ("x86, hvm: stdvga cache always on") bumped the maximum
>>    range of "mapped" VRAM from 64k to 128k, yet without growing vram_page[].
>>    Afaict in mode 0 (full 128k accessible at A0000-BFFFF) vram_get{b,l}()
>>    now misbehave.
>> 4) d1b531631515 ("x86/hvm: unconditionally buffer writes to VRAM") likely
>>    went too far (or not far enough) in bypassing write handling, yet then
>>    still allowing reads to be serviced from possibly stale cache, when
>>    ->stdvga goes first off and later back on, without ->cache changing
>>    state.
>> 5) 22a1fbb575df ("x86/hvm: make sure stdvga cache cannot be re-enabled")
>>    likely went too far. Surely there are cases (VRAM clearing at the very
>>    least) after which VRAM state is known again, and hence caching could
>>    in principle be re-enabled.
>>
>> Before I go and try to fix all of the above, I'd like to collect views
>> towards simply ripping out that caching mode, vastly simplifying the
>> source file in question.
> 
> STDVGA caching is primarily (exclusively?) an optimisation for Windows XP.
> 
> WinXP was written pre-virt, and wastes an awful lot of time rendering
> its boot animation with IN/OUT.

IN/OUT aren't accelerated at all; we merely intercept them to be able to
"snoop" values of OUTs. But I question that WinXP (or Win2K as Paul
suggested) did its actual rendering using IN/OUT, and this then having
been improved by the caching I'm talking about here (see below). IN/OUT
processing, as said, doesn't touch the MMIO cache at all.

> The "caching" (really, putting them in the bufioreq ring, rather than
> blocking for qemu on every access) made a good 10-20s improvement in VM
> boot performance if memory serves, not to mention dom0 load when booting
> multiple VMs in parallel.

Well, I'm talking about dropping caching, not the use of the bufioreq
ring. That is - we'd keep intercepting MMIO, merely directing writes the
bufioreq route, without any other internal processing / state recording.

Jan

