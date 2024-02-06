Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF284B116
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 10:24:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676689.1052906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHgt-00025q-B2; Tue, 06 Feb 2024 09:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676689.1052906; Tue, 06 Feb 2024 09:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXHgt-00023i-7E; Tue, 06 Feb 2024 09:24:31 +0000
Received: by outflank-mailman (input) for mailman id 676689;
 Tue, 06 Feb 2024 09:24:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gccX=JP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXHgs-00023c-67
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 09:24:30 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 865991fa-c4d1-11ee-98f5-efadbce2ee36;
 Tue, 06 Feb 2024 10:24:27 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40fd55c7f93so5363375e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 06 Feb 2024 01:24:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bi24-20020a05600c3d9800b0040fed19162bsm357907wmb.28.2024.02.06.01.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:24:26 -0800 (PST)
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
X-Inumbo-ID: 865991fa-c4d1-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707211467; x=1707816267; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=laPJ5Nt1+Y0hCXDgUPaCxT0oID96i9h2VojfeyHBMFE=;
        b=Ob/AwHpdBCVhfIlCGhpUQ8HhEF5tqigvYHmGlLQn5bnKi87pqnqYMphdigsHoPzmz/
         ZCf7I2w1umJsK+vKw+dZlByHq8FM01PXmwT5uA3aycsyl4lr8O6adWFurw1VW5X2skDH
         KO7tarmDhuPxR+ih5WPp2mGEZcNcvxDVg4INQ4Rn0O5GlXBAYXJgW+Zo1Jla9xtDFJSc
         TQObElQyEYGjtaQvSWk/nld+rOmCQOvSdx2xyYBXHdxa8h3MvocbxMx1/RxE+IZcY6Oy
         eF5QbTwuRwGxgu6deWSSXiQcoyq1hTgL2ZyT1qJUChEeXmsaIPoDIzRuctTD6revifIv
         uVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707211467; x=1707816267;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=laPJ5Nt1+Y0hCXDgUPaCxT0oID96i9h2VojfeyHBMFE=;
        b=wejt9jBQ5hVFTiiaHPOYuenOdc1H3W16y0/KgriHUOPEgu7dOioiiVqMEkxQgYHH27
         WQpOZwICGklN8iC08vPjRB31X8ZTa+RF/juEWwt3vpkXeC/Y/VZciNrnOpAz0KF/gRi9
         HrmoUpjmH2AvpANulaFFEA5T5zWWL494pc2vVjop2YPg8P/2Fk4KxV6nu50BJMjFSKPC
         QRjcvR9AcWlSQ4TA5LW8t2zZDJMlK13EjtqXFd3U5NUiX/Se0u+WtRpFZnG4Wpt0FQ2s
         mLqZCpyEW9AvV6MimEvJp6fvnJaW+fiF/ehBb3F7a+hhm9wTyZ2uxUI3yTsGUaSH+3N2
         X1ug==
X-Gm-Message-State: AOJu0YyB1Yqm3IkPhIRl/tfDp9ynSwzHkFDo77E1XtX1DPUf1/TDOpt8
	KA+5dUrjxPQLiaRLae75DBXXMOgcrWD9y3B27sGnMFXe/Cat9D9ZphYJMDDnpA==
X-Google-Smtp-Source: AGHT+IG0d1F9cWnsObh6/1ZrVDtHJPPRl3PXXA4/mO8sltBu3Ec5SfmIKdFiNm6Wljdb9NTdKp2hCQ==
X-Received: by 2002:a05:600c:3ba2:b0:40f:86:fea with SMTP id n34-20020a05600c3ba200b0040f00860feamr1795403wms.13.1707211467199;
        Tue, 06 Feb 2024 01:24:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgAzG+UOupj0iGMqmRS2VtP3PNJmovj4ruwkTX/8RqMwr5RkGHfrXJ43bTvwZ3Woh1WcKVwYvSVkRX3Qwe4IaiRdTavDNHw6rmVV+yRov2QmP3bQZZIekQLAzN/2RaigjNp5wMfMXipaWXSBCWJULKt9mMtwsgEkQLGMPSemv0u4Q2gi9XoA==
Message-ID: <7799755f-fad2-4f73-a2c1-de97bcce95fa@suse.com>
Date: Tue, 6 Feb 2024 10:24:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.19 release status tracking list
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: committers@xenproject.org, community.manager@xenproject.org,
 Kelly Choi <kelly.choi@cloud.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
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
In-Reply-To: <CAMacjJzio2EDwudCUHoL6psKYztkHZOWwLNDknATvpN6Y0im=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.02.2024 20:23, Oleksii Kurochko wrote:
> Hello everyone,
> 
> I would like to share with you a list for status tracking based on Xen ML:
> 
> Arm:
>   * [PATCH v5 00/13] Arm cache coloring [
> https://lore.kernel.org/xen-devel/20240102095138.17933-1-carlo.nonato@minervasys.tech/
> ]
>   * [PATCH v1 repost 0/4] xen/arm64: Rework the MMU-off code (idmap)
> so it is self-contained [
> https://lore.kernel.org/xen-devel/20240116143709.86584-1-julien@xen.org/
> ]
>   * [PATCH v13 00/14] PCI devices passthrough on Arm, part 3 [
> https://lore.kernel.org/xen-devel/20240202213321.1920347-1-stewart.hildebrand@amd.com/
> ]
> 
> PPC:
>   *  [PATCH v2 0/7] Early Boot Allocation on Power [
> https://lore.kernel.org/xen-devel/cover.1702607884.git.sanastasio@raptorengineering.com/
> ]
> 
> RISC-V:
>   *  [PATCH v4 00/30]  Enable build of full Xen for RISC-V [
> https://lore.kernel.org/xen-devel/cover.1707146506.git.oleksii.kurochko@gmail.com/
> ]
> 
> x86:
>   * [PATCH 0/4] iommu/x86: fixes/improvements for unity range checks [
> https://lore.kernel.org/xen-devel/20240201170159.66330-1-roger.pau@citrix.com/
> ]
>   * [PATCH 0/8] x86: support AVX10.1 [
> https://lore.kernel.org/xen-devel/298db76f-d0ee-4d47-931f-1baa1a7546cf@suse.com/
> ]
>   * [PATCH v13 00/35] x86: enable FRED for x86-64 [
> https://lore.kernel.org/xen-devel/20231205105030.8698-1-xin3.li@intel.com/
> ]

This is a kernel series. I don't expect FRED support is in scope for
4.19.

>   * [PATCH v4 0/8] x86emul: misc additions
> https://lore.kernel.org/xen-devel/9dd23064-c79e-4a50-9c71-c0e73b189944@suse.com/
>   * [PATCH 0/7] VT-d: SATC handling and ATS tidying [
> https://lore.kernel.org/xen-devel/25506838-b818-4686-8c16-3a198338af44@suse.com/
> ]
>   * [XEN PATCH 0/9] x86: parallelize AP bring-up during boot [
> https://lore.kernel.org/xen-devel/cover.1699982111.git.krystian.hebel@3mdeb.com/
> ]
>   * [PATCH v2 00/12] x86: memcpy() / memset() (non-)ERMS flavors plus
> fallout [ https://lore.kernel.org/xen-devel/8f56a8f4-0482-932f-96a9-c791bebb4610@suse.com/
> ]
> 
> common:
>   * annotate entry points with type and size" series [
> https://lore.kernel.org/xen-devel/5e74a501-2824-42af-804b-47b515aa9bcf@suse.com/
> ]

The bulk of this has gone in, but there'll want to be follow-ups.

>   * [PATCH v2 0/8] limit passing around of cpu_user_regs [
> https://lore.kernel.org/xen-devel/33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com/
> ]
>   * [PATCH v2 (resend) 00/27] Remove the directmap [
> https://lore.kernel.org/xen-devel/20240116192611.41112-1-eliasely@amazon.com/
> ]
>   * [PATCH v4 00/32] tools: enable xenstore-stubdom to use 9pfs [
> https://lore.kernel.org/xen-devel/20240205105001.24171-1-jgross@suse.com/
> ]
>   * [PATCH v7 0/7] Introduce generic headers [
> https://lore.kernel.org/xen-devel/cover.1706281994.git.oleksii.kurochko@gmail.com/
> ]
>   * [PATCH] move __read_mostly to xen/cache.h
> [https://lore.kernel.org/xen-devel/f25eb5c9-7c14-6e23-8535-2c66772b333e@suse.com/]
>   * [PATCH v2] NUMA: no need for asm/numa.h when !NUMA [
> https://lore.kernel.org/xen-devel/94cffa48-5e31-4557-827d-c6dec6031d05@suse.com/
> ]

This went in already.

>   * [XEN PATCH v2 1/3] xen: introduce STATIC_ASSERT_UNREACHABLE() [
> https://lore.kernel.org/xen-devel/42fc6ae8d3eb802429d29c774502ff232340dc84.1706259490.git.federico.serafini@bugseng.com/
> ]
>   * [PATCH] xen: move BUG_ON(), WARN_ON(), ASSERT(),
> ASSERT_UNREACHABLE() to xen/bug.h [
> https://lore.kernel.org/xen-devel/4887b2d91a4bf2e8b4b66f03964259651981403b.1706897023.git.oleksii.kurochko@gmail.com/
> ]
>   * [PATCH] xen/lib: introduce generic find next bit operations [
> https://lore.kernel.org/xen-devel/52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com/
> ]
> 
> Please reply with items you would like to see in 4.19 so that people
> know what is happening and prioritize accordingly.

Beyond (on x86) AVX10 I'd like to see whether we can also make some
progress towards supporting APX. That'll be quite a bit of work, though,
including quite a bit of reviews that are likely to end up on the
backburner (as has been commonly happening for, especially, more
involved emulator changes).

Jan

