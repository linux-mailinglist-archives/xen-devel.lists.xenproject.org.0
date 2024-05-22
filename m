Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D1A8CC42C
	for <lists+xen-devel@lfdr.de>; Wed, 22 May 2024 17:35:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.727782.1132455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9nzK-0000oS-OX; Wed, 22 May 2024 15:34:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 727782.1132455; Wed, 22 May 2024 15:34:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9nzK-0000lp-LM; Wed, 22 May 2024 15:34:46 +0000
Received: by outflank-mailman (input) for mailman id 727782;
 Wed, 22 May 2024 15:34:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eEN6=MZ=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s9nzJ-0000lj-S0
 for xen-devel@lists.xenproject.org; Wed, 22 May 2024 15:34:45 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf411ce6-1850-11ef-b4bb-af5377834399;
 Wed, 22 May 2024 17:34:42 +0200 (CEST)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so78526081fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 May 2024 08:34:42 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm505463745e9.11.2024.05.22.08.34.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 May 2024 08:34:41 -0700 (PDT)
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
X-Inumbo-ID: cf411ce6-1850-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716392082; x=1716996882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hmR4Bg5ThxDHXEMpbzWp/r8/uiTssBYthxCmdU0/VQQ=;
        b=e9Ie3xOwBUkAhuuO30lFd9stKOCNutf16eduO67YxGQcTVNGR4Z5onqc+hP2F2Tz9W
         zOM/VoTQ65uKTspMKN8UZH8Vi1D0R3wFn+eTtwT8T9r9Tzp7PEN5p+scdxxaQW6B6POu
         RPPekst+pyQqXLzekjPEv4KoSJCT1nhALuMpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716392082; x=1716996882;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hmR4Bg5ThxDHXEMpbzWp/r8/uiTssBYthxCmdU0/VQQ=;
        b=ESUPWzgp1HYupy+VPvvREdCiumckbyhhjqupMTYHn/ISfIyFW4Muiy6gBoB6EZPpau
         oDuVbgmdUrNt1j8DXyz1Yj33EbaDSVN994CeIvuMMoilpA/0RWrCOso1xo9vLzyzMXIG
         +dDG9dmraNDCSpkbl4KG7oJ+cuzR54l3qtxeyOPjUCbcHzzaEFO0TzplhIwj9BC2obxC
         aXQwFfg6olYLkKEmkIXTWCqCmroOl4EhpM1tuDXzeS2xoLD4rYRY07HKQOcZHPKQkRLF
         Ri45FG4mbPLk5v7+fSByCK2cVONuD9UMDwDtKNN6JIraQsHx+Xxmxu+Wxfj5i8H6lawI
         DPZQ==
X-Gm-Message-State: AOJu0YxwQHfKWua1vcv6FKVy4S7vhrKHztmSWkzXMeVhM+QVHBpWFvAt
	RLQbZl5t7/O2yQIJI25qDVuWhSqWb/n9aRiRTcfao75sC0vuvKZ5QaD+sfr8i28=
X-Google-Smtp-Source: AGHT+IE6Pzj4pRgo9ZEsm6G/fs7U33sy8gDSLZeTFJJtdCLxrfXNJaayQiGkITVzjyYksqdzkmqWcw==
X-Received: by 2002:a2e:9b54:0:b0:2de:d48a:953b with SMTP id 38308e7fff4ca-2e9494942f0mr15652851fa.23.1716392082110;
        Wed, 22 May 2024 08:34:42 -0700 (PDT)
Message-ID: <9641be72-76e4-4960-9e45-19c9d329d6cf@cloud.com>
Date: Wed, 22 May 2024 16:34:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Clean the policy manipulation path in domain
 creation
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1715954111.git.alejandro.vallejo@cloud.com>
 <ZktGBkfwxEzrbojw@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZktGBkfwxEzrbojw@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20/05/2024 13:45, Roger Pau Monné wrote:
> On Fri, May 17, 2024 at 05:08:33PM +0100, Alejandro Vallejo wrote:
>> v2:
>>   * Removed xc_cpu_policy from xenguest.h
>>   * Added accessors for xc_cpu_policy so the serialised form can be extracted.
>>   * Modified xen-cpuid to use accessors.
>>
>> ==== Original cover letter ====
>>
>> In the context of creating a domain, we currently issue a lot of hypercalls
>> redundantly while populating its CPU policy; likely a side effect of
>> organic growth more than anything else.
>>
>> However, the worst part is not the overhead (this is a glacially cold
>> path), but the insane amounts of boilerplate that make it really hard to
>> pick apart what's going on. One major contributor to this situation is the
>> fact that what's effectively "setup" and "teardown" phases in policy
>> manipulation are not factored out from the functions that perform said
>> manipulations, leading to the same getters and setter being invoked many
>> times, when once each would do.
>>
>> Another big contributor is the code being unaware of when a policy is
>> serialised and when it's not.
>>
>> This patch attempts to alleviate this situation, yielding over 200 LoC
>> reduction.
>>
>> Patch 1: Mechanical change. Makes xc_cpu_policy_t public so it's usable
>>          from clients of libxc/libxg.
>> Patch 2: Changes the (de)serialization wrappers in xenguest so they always
>>          serialise to/from the internal buffers of xc_cpu_policy_t. The
>>          struct is suitably expanded to hold extra information required.
>> Patch 3: Performs the refactor of the policy manipulation code so that it
>>          follows a strict: PULL_POLICIES, MUTATE_POLICY (n times), PUSH_POLICY.
> 
> I think patch 3 is no longer part of the set?  I don't see anything
> in the review of v1 that suggests patch 3 was not going to be part of
> the next submission?
> 
> Thanks, Roger.

It's there, there was just a shift. The implication of the first line of
the changelog is that v1/patch1 was dropped. Sorry, should've been clearer.

    v1/patch1 => dropped
    v1/patch2 => v2/patch1
    v1/patch3 => v2/patch2

Cheers,
Alejandro

