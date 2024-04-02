Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1633895697
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 16:28:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700158.1092818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrf6N-00035B-31; Tue, 02 Apr 2024 14:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700158.1092818; Tue, 02 Apr 2024 14:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrf6M-00032W-VO; Tue, 02 Apr 2024 14:27:02 +0000
Received: by outflank-mailman (input) for mailman id 700158;
 Tue, 02 Apr 2024 14:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrf6L-00032Q-Au
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 14:27:01 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 102196d3-f0fd-11ee-a1ef-f123f15fe8a2;
 Tue, 02 Apr 2024 16:26:58 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41551639550so23736175e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 07:26:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c3b0400b004161b8a0310sm2033817wms.1.2024.04.02.07.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 07:26:57 -0700 (PDT)
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
X-Inumbo-ID: 102196d3-f0fd-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712068018; x=1712672818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wzxpG2Ya5qQeR15yEUxgi6nrHt/+Xq+Oi+qPIO5Dgog=;
        b=bYlzPQkni7Eq3pFhgjWhKiILP7XZY/Yvkl38E7OXw8jCA+q+or2tos5jG2uFUoHosk
         N9v/QC0c6a/dGC5cQVE/8cJq1ImeTwPJKNhFX/Y++MeyOaYSHlXqVbZHHBPUONwts8NX
         xoMRduaANAYQR5He3S9ntYXOp88xKYRl04+KtdlbH4sFb9UYhZ22/chMXD6W/R32Wfri
         dXnqIIPT+ZVbVf6/eBE0oJU4KLg5p4mk3Sl7xBuhYS3xiawsUuTmQAqRTNyEvr3ctV6d
         8qquAQ/8BEbH0NYsAA9dApKNFcaCWzCXy/q+hzBgwNzvhOtRTTDRKRntCkkOLBlNMVqP
         tSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712068018; x=1712672818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wzxpG2Ya5qQeR15yEUxgi6nrHt/+Xq+Oi+qPIO5Dgog=;
        b=T/p0tSu/Y4jBPeC5l7Lco0bZT+6kMmKOARJ5NDnVW5JOHE9SFj1UotuGkvvRvjRhHP
         IStLEXAILhvJaCbyKBVRtfOCrDWG1VapvcAyL9E99TVruSpzDZB2DyNkZGA1Zky/pBxG
         QgSIRvuoHSvvo9EHiA302ER/7cJeoknLEohohbaBBqFVMoIeT7+6lDggcqo10H/Jhol4
         Ppv5n67fgKnsliGfjs1pJPstMmlRYPX38hPh8sWaePIM3Rmv/19lWC72pxfze4FR1+6a
         618y8mUV4RZ+3Q+dVrp1Ksl9QscnBDsAekiDvTzHOHapB3GHQqmmhxPBbaEkcccIO9Wb
         d1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYY6GU545rZCrcZHY6jtlgZ158T1K3j9S8ebHVnx85G9GYk8wiWjzh2z7MCnXo2yNuYUk+IEy8vibsCsnIkt4RGRT+nJ9PTyDPrZbtxl0=
X-Gm-Message-State: AOJu0YxBFyixncnXk1TBZXwUpU7rlpr/WQx3OLg7rnS8PyM4frpEr3i9
	99DVCzEWMauIw1oG7KVuvD9xuuvMiFqtPGjd16rFkXbK0CFWAuDLiqfx48uLQQ==
X-Google-Smtp-Source: AGHT+IFo50HgriDw0bLwAotDWVXiiOhMwczpWRUiMXC10HqViFJs07SlpQ5SsdaGF2QZOXCAXMlXkQ==
X-Received: by 2002:a05:600c:1c99:b0:414:8a28:6c89 with SMTP id k25-20020a05600c1c9900b004148a286c89mr10739677wms.31.1712068017862;
        Tue, 02 Apr 2024 07:26:57 -0700 (PDT)
Message-ID: <f3ef0c54-e3e0-416c-953d-00c4df0c5d82@suse.com>
Date: Tue, 2 Apr 2024 16:26:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: preparations for 4.17.4
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Julien Grall <julien@xen.org>,
 Kelly Choi <kelly.choi@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <b726b105-9204-4a72-8fbc-ceaa8e74f3ec@suse.com>
 <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
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
In-Reply-To: <6feb56fe-769d-4809-b16f-6fc4d5477747@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.03.2024 13:33, Andrew Cooper wrote:
> 1) livepatching of .rodata:
> 
> 989556c6f8ca - xen/virtual-region: Rename the start/end fields
> ef969144a425 - xen/virtual-region: Include rodata pointers
> b083b1c393dc - x86/livepatch: Relax permissions on rodata too
> 
> And technically "x86/mm: fix detection of last L1 entry in
> modify_xen_mappings_lite()" too but you've already backported this one.
> 
> Patching .rodata worked before Xen 4.17, and was broken (left as a TODO)
> when I adjusted Xen to stop using CR0.WP=0 for patching.
> 
> 
> 2) Policy fixes:
> 
> e2d8a6522516 - x86/cpu-policy: Fix visibility of HTT/CMP_LEGACY in max
> policies
> 
> This is a real bugfix for a real regression we found updating from Xen
> 4.13 -> 4.17.  It has a dependency on
> 
> 5420aa165dfa - x86/cpu-policy: Hide x2APIC from PV guests
> 
> which I know you had more concern with.  FWIW, I'm certain its a good
> fix, and should be backported.
> 
> 
> 3) Test fixes:
> 
> 0263dc9069dd - tests/resource: Fix HVM guest in !SHADOW builds
> 
> It's minor, but does make a difference for those of us who run these
> tests regularly.
> 
> 
> 4) Watchdog fixes:
> 
> 9e18f339830c - x86/boot: Improve the boot watchdog determination of
> stuck cpus
> 131892e0dcc1 - x86/boot: Support the watchdog on newer AMD systems
> 
> You took "x86/boot: Fix setup_apic_nmi_watchdog() to fail more cleanly"
> and the first of the two patches is in the same category IMO.  The
> second I also feel ok to take for the in-support releases, particularly
> as all it is doing is dropping a family list.

I've pushed all of the above.

> 5) Ucode scan stability  (For 4.18 only)
> 
> Xen 4.18 had "x86/ucode: Refresh raw CPU policy after microcode load" in
> it's .0 release, so should also gain:
> 
> cf7fe8b72dea - x86/ucode: Fix stability of the raw CPU Policy rescan

This already is in 4.18.1, ...

> I've only noticed because I've got them both backported to 4.17 in
> XenServer, but I don't think upstream wants to take that route.

... while, as you suggest, not (and not intended to be) in 4.17.

Jan

