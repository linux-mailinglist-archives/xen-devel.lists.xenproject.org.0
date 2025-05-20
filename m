Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8904ABDDC4
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 16:50:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990860.1374788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOIA-0003cl-Gk; Tue, 20 May 2025 14:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990860.1374788; Tue, 20 May 2025 14:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHOIA-0003bA-Cm; Tue, 20 May 2025 14:50:06 +0000
Received: by outflank-mailman (input) for mailman id 990860;
 Tue, 20 May 2025 14:50:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PJhk=YE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uHOI8-0003K8-Tk
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 14:50:04 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5e3c749-3589-11f0-b892-0df219b8e170;
 Tue, 20 May 2025 16:50:02 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-601f1914993so3424553a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 May 2025 07:50:02 -0700 (PDT)
Received: from [10.1.248.227] ([80.188.125.198])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6004d4f1ca8sm7305830a12.6.2025.05.20.07.50.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 07:50:01 -0700 (PDT)
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
X-Inumbo-ID: b5e3c749-3589-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747752602; x=1748357402; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsD37B8v/4hF2NDy+8qnJjAIlwwXacx2ZFwooaBKCqQ=;
        b=H3Zu5tj3hHmiuXvDUOGdUd5xCra8V3rz+jP/cN0wAMFgiWmOC83pHNaEQfkyiVEYUu
         d7j3wIgwF6YZQqKfqD6kKfVpZ41ZT2Uz1d0Z+Wm0j13Uk5h7mrdCdXlhUC6EHlJrMKu1
         Bq5K4ctaE1EGIY+MIXkR4MmHKuKEXax82E1poOJ9/Txbzl7Jz71OCJDyELJiNLTasMGs
         79yDNwIDcXP6ApMNjYSfEVte5TyNnq6tftvgI9cmrZCylefEJQSIMvC6xjYhQVzvy2/b
         fiMmskSQ3EnORLxAcHu0EcyFQ8zN30AO085ILsOrdePSavTNA0dscjGjoPrAai6Qy6IO
         Qefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747752602; x=1748357402;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OsD37B8v/4hF2NDy+8qnJjAIlwwXacx2ZFwooaBKCqQ=;
        b=fft/GMahWatU9Sjl0Ixh35Syoh8g4Ucj9oSJTkp0J8hlr/6wXo0hrgr/HyvhMMW+Yw
         ccK/6/mHDMEqegfSPehRTcVBMHZ86Cr79R3alLYbrGYiQvgIGWvoVVO8uS4nfnGyebtB
         Tlae6kvXHldk+ljp/6kxY7B5vDVvAYTp93X/gQcH3kwFqXP9s+TIkoyEoHbAwvYf5FBI
         Gfb3iuEWk5/dCijrvgCC8wzvevkXcYoRt2RW4HM6T1n/AwGn/+Magk75RXxw0XcACfGM
         29yIu55p6WrOMBrA7PHRpVQGzt1an9nyZd/MslUGe4tGlqpm4TS332SzVOcPdzK6tmVw
         NmJA==
X-Forwarded-Encrypted: i=1; AJvYcCU3fpBQIjTB8CPZXHleA3a/yImcIVG5prUZ4xdGq5WLIazg9taU1UjKlGeXvBMxry62uf0xUomHOag=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwueighO0Xmv5aooRjYLN2UMfwfp55lEAJC0pFNhJqif7AKETGS
	xsxNHTGRpCHyABylMFpCJxVOh2Mff3s3GbkSlCWf1saQMLKxGIKIGkJq9hVNlHvqzw==
X-Gm-Gg: ASbGnctBoy/UoBZVTSAMU1ZUj3K6WCdqfHK6B5NI4hOOYluGbpO/b8EVuBjfoC85CSi
	YG3ROkfd+wdj6jG4Ep3o/V4kzst2rLlS9CoQ5K0eYapCq6TvE5VIQQPVWTOfKcUjVY1sBIWS6yK
	I8sii5y4haAT+h6alrKysjTdwqa0VQgfadBEhAt/4JzN0gJL9NFqxCvrAYZ3AniS4afeuLiCBrX
	yq8swBO8iHhWZS1xKsfzWmnwu5zQY8z3ZcU8WNRM0ZzViThP7RRqYi8YENpD/9AuaPsrF3dKTdh
	Aqnkd+YzrrlqjbPRMYLSc6DJF20Pp4CvMadkaK9MOzDasaXilnfMw7J2wJXxew==
X-Google-Smtp-Source: AGHT+IFg9o5sgnbz2y3cjjCxqkbb7WsYIjXM+F7+lLsSnae6wq4tnMkIvNtlboQdp+2I7DYlh9x7lQ==
X-Received: by 2002:a05:6402:35c5:b0:602:29e0:5e24 with SMTP id 4fb4d7f45d1cf-60229e06128mr264066a12.0.1747752602248;
        Tue, 20 May 2025 07:50:02 -0700 (PDT)
Message-ID: <c36c2433-7db4-498e-b3cb-23b2bdc3090a@suse.com>
Date: Tue, 20 May 2025 16:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] public/sysctl: Clarify usage of pm_{px,cx}_stat
To: Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250512144656.314925-1-ross.lagerwall@citrix.com>
 <20250512144656.314925-3-ross.lagerwall@citrix.com>
 <3128bda3-d655-43ae-81a7-df61928a27aa@suse.com>
 <CAG7k0Ep0PdNOO0YTkaPa-uBsuQ8Jw6DFTZGLipUs1HbPoCRkgA@mail.gmail.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CAG7k0Ep0PdNOO0YTkaPa-uBsuQ8Jw6DFTZGLipUs1HbPoCRkgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.05.2025 16:25, Ross Lagerwall wrote:
> On Tue, May 13, 2025 at 3:43 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.05.2025 16:46, Ross Lagerwall wrote:
>>> --- a/xen/include/public/sysctl.h
>>> +++ b/xen/include/public/sysctl.h
>>> @@ -215,23 +215,51 @@ typedef struct pm_px_val pm_px_val_t;
>>>  DEFINE_XEN_GUEST_HANDLE(pm_px_val_t);
>>>
>>>  struct pm_px_stat {
>>> -    uint8_t total;        /* total Px states */
>>> -    uint8_t usable;       /* usable Px states */
>>> -    uint8_t last;         /* last Px state */
>>> -    uint8_t cur;          /* current Px state */
>>> -    XEN_GUEST_HANDLE_64(uint64) trans_pt;   /* Px transition table */
>>> +    /*
>>> +     * IN: Number of elements in pt, number of rows/columns in trans_pt
>>> +     *     (PMSTAT_get_pxstat)
>>> +     * OUT: total Px states (PMSTAT_get_max_px, PMSTAT_get_pxstat)
>>> +     */
>>> +    uint8_t total;
>>
>> The part for this field ought to go in patch 1, as already indicated there.
>>
>>> +    uint8_t usable;       /* OUT: usable Px states (PMSTAT_get_pxstat) */
>>> +    uint8_t last;         /* OUT: last Px state (PMSTAT_get_pxstat) */
>>> +    uint8_t cur;          /* OUT: current Px state (PMSTAT_get_pxstat) */
>>> +    /*
>>> +     * OUT: Px transition table. This should have total * total elements.
>>> +     *      This will not be copied if it is smaller than the hypervisor's
>>> +     *      Px transition table. (PMSTAT_get_pxstat)
>>> +     */
>>> +    XEN_GUEST_HANDLE_64(uint64) trans_pt;
>>> +    /* OUT: This should have total elements (PMSTAT_get_pxstat) */
>>>      XEN_GUEST_HANDLE_64(pm_px_val_t) pt;
>>
>> As also indicated there, the same constraint as for trans_pt applies to this
>> output buffer, just that it's having only one dimension.
>>
>>>  };
>>>
>>>  struct pm_cx_stat {
>>> -    uint32_t nr;    /* entry nr in triggers & residencies, including C0 */
>>> -    uint32_t last;  /* last Cx state */
>>> -    uint64_aligned_t idle_time;                 /* idle time from boot */
>>> -    XEN_GUEST_HANDLE_64(uint64) triggers;    /* Cx trigger counts */
>>> -    XEN_GUEST_HANDLE_64(uint64) residencies; /* Cx residencies */
>>> -    uint32_t nr_pc;                          /* entry nr in pc[] */
>>> -    uint32_t nr_cc;                          /* entry nr in cc[] */
>>>      /*
>>> +     * IN:  Number of elements in triggers, residencies (PMSTAT_get_cxstat)
>>> +     * OUT: entry nr in triggers & residencies, including C0
>>> +     *      (PMSTAT_get_cxstat, PMSTAT_get_max_cx)
>>> +     */
>>> +    uint32_t nr;
>>> +    uint32_t last;  /* OUT: last Cx state (PMSTAT_get_cxstat) */
>>> +    /* OUT: idle time from boot (PMSTAT_get_cxstat)*/
>>> +    uint64_aligned_t idle_time;
>>> +    /* OUT: Cx trigger counts, nr elements (PMSTAT_get_cxstat) */
>>> +    XEN_GUEST_HANDLE_64(uint64) triggers;
>>> +    /* OUT: Cx residencies, nr elements (PMSTAT_get_cxstat) */
>>> +    XEN_GUEST_HANDLE_64(uint64) residencies;
>>> +    /*
>>> +     * IN: entry nr in pc[] (PMSTAT_get_cxstat)
>>> +     * OUT: Index of highest non-zero entry set in pc[] (PMSTAT_get_cxstat)
>>> +     */
>>> +    uint32_t nr_pc;
>>> +    /*
>>> +     * IN: entry nr in cc[] (PMSTAT_get_cxstat)
>>> +     * OUT: Index of highest non-zero entry set in cc[] (PMSTAT_get_cxstat)
>>> +     */
>>
>> For both of these, it's not "highest non-zero" but, according to ...
>>
>>> +    uint32_t nr_cc;
>>> +    /*
>>> +     * OUT: (PMSTAT_get_cxstat)
>>>       * These two arrays may (and generally will) have unused slots; slots not
>>>       * having a corresponding hardware register will not be written by the
>>>       * hypervisor. It is therefore up to the caller to put a suitable sentinel
>>
>> ... this comment, "highest written by hypervisor". They're also not "index of",
>> but "one higher than the index of" (i.e. counts, not indexes).
>>
> 
> Looking at this again, I don't think that matches what Xen does (nor
> does my previous attempt). The code in question:
> 
> #define PUT_xC(what, n) do { \
>         if ( stat->nr_##what >= n && \
>              copy_to_guest_offset(stat->what, n - 1, &hw_res.what##n, 1) ) \
>             return -EFAULT; \
>         if ( hw_res.what##n ) \
>             nr_##what = n; \
>     } while ( 0 )

Right. I should have inserted "that could be" in my reply.

> Xen will copy all the hardware registers that it knows about (regardless
> of whether the hardware actually has them) and will return in nr_pc /
> nr_cc the index + 1 of the highest non-zero entry it _would_ have
> written if there is sufficient space.

Which is kind of bogus when the last (or more) of those would merely be
zero.

> I could describe it simply as "OUT: Required size of cc[]" ?

Maybe append something like "..., for all known to Xen entries to be
written"? Provided we don't want to change the behavior anyway.

Jan

