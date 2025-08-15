Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F44B27ADA
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 10:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082952.1442630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpis-0003Gf-8l; Fri, 15 Aug 2025 08:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082952.1442630; Fri, 15 Aug 2025 08:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umpis-0003F4-5h; Fri, 15 Aug 2025 08:23:38 +0000
Received: by outflank-mailman (input) for mailman id 1082952;
 Fri, 15 Aug 2025 08:23:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umpiq-0003Ew-7x
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 08:23:36 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22526d4d-79b1-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 10:23:34 +0200 (CEST)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3b9e413a219so1444141f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 01:23:34 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c748a9esm49585255e9.19.2025.08.15.01.23.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 01:23:33 -0700 (PDT)
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
X-Inumbo-ID: 22526d4d-79b1-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755246213; x=1755851013; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1KbG4WpTRqhtC6im1pjbQasRJ4zCXOuj0sRVv8P1oe4=;
        b=Z1lV2MbYTThlfqx0tPjJyepcN5j88SIYceYfiikoMMO3D+19VpLgB+fbLK7ffwiJsy
         wMrB5GabtUbgX7bVGy6Qyk2AHsxowGAe2CXy09/2n0E4rawr+I2Rh7TPstrDUAN5UrQB
         ylaIx3NvcN4uhRxTESQr+W0w8javZJm9hiKj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755246213; x=1755851013;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KbG4WpTRqhtC6im1pjbQasRJ4zCXOuj0sRVv8P1oe4=;
        b=AliNHldveT1a+aVAv+CqzLgGaVgC1yXLWmRYFv2OBGix/0ajniNEDsi6+e/e1NG2yo
         BHTh1Euj5Qr3IO1mUMVpvHknAKSSnZ9UtBCp0TVxzWk8G6VxHG+zeYS2/hGfCAEEQeQs
         uqqHWTaGnR4cOJcZxGjXxlplCb6HI1EIM0aVlzQzHTDYzBbsfWOeOEcwY/R71M1bslHE
         G02JHuEsXYGwTXCmQdgpQfgRpO59rBYodRVQQO0pO92o1ConAyjkjkHN66M6B1Nr5dj6
         bjm3KlEAvmsxqzQMpCwU36DFSmDZgxak/M8amZoGru/8/LUUYuDcKEuIILm9hbQTjSLr
         9HUg==
X-Gm-Message-State: AOJu0YziYN8mESFxeG9WRLUN+1xKdSX6y1P18LjwjcUwXemArr4ZUH5A
	MtSbqE71j3fb6Om7GKkG8pwBOEAQWB0quZHrShumUTYFh+owl47NYQUfUk77gp6qkNY=
X-Gm-Gg: ASbGncvlyM0fwC+q9Mv0dbqjVuod5b6NAC1MU4lv52Lp18w5bT3fOxVfrNekgyaDMvJ
	nPmIP8tEeQb72oD1fysnrgJsSSDoLmP2MmzACfkDTVkOvS9bLLTdk2a1aNfJouBWQUDjmIRY3Gz
	MAA5laOIpMzmYEKJ8294iQtFFi62aOwed5m1nDJUbYbjCJVdfGtcPT0KkIJUhGrfzvqS3/oqfn3
	HxBtXCddfFzUEbJt63S8ALy8WeRNw1YKzD5PLjwlZImPtSq122WC9qB1B2t04oXjpPiGme390yV
	WBZA9hYt9QErDyhYpaRpQLcmmSGIFxFxrFmo3zQSpnoiwXKwZaWEVTGg9Y66Yrg1fVeqLYAP+R1
	oQe1choyRLK7aa1IYr+YjBGRL0F2P1givl8RlGXxZuDhNs9DevEHWX74UnoZQglGsrhkc
X-Google-Smtp-Source: AGHT+IGxm0RZ6o1a/9yLO+N7zXkYQMf3GJmBb3oyOL0vnFlNCIxKIAmjWvdV/3zGR3qqY6MoJ7CxJQ==
X-Received: by 2002:a5d:5f53:0:b0:3b8:d3ae:26e with SMTP id ffacd0b85a97d-3bb69b7d31emr661059f8f.53.1755246213536;
        Fri, 15 Aug 2025 01:23:33 -0700 (PDT)
Message-ID: <0a6576e2-183c-4411-8920-3930eb4ff6c9@citrix.com>
Date: Fri, 15 Aug 2025 09:23:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: fix sphinx-build issues
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <fb809a94e8a50bd3a59aa47ee1832c61af8a9f40.1755241166.git.dmytro_prokopchuk1@epam.com>
 <c7d9513dfc7201c5d3c6e6cbd99db481@bugseng.com>
 <77912fca-8bf2-43f5-8049-de4cdc3ec82d@epam.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <77912fca-8bf2-43f5-8049-de4cdc3ec82d@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/08/2025 8:28 am, Dmytro Prokopchuk1 wrote:
>
> On 8/15/25 10:09, Nicola Vetrini wrote:
>> On 2025-08-15 09:00, Dmytro Prokopchuk1 wrote:
>>> Fix the following issues:
>>> 1. xen/docs/misra/deviations.rst:90: WARNING: Inline interpreted text or
>>> phrase reference start-string without end-string. [docutils]
>>> 2. xen/docs/misra/deviations.rst:54: ERROR: Error parsing content block
>>> for the "list-table" directive: uniform two-level bullet list expected,
>>> but row 6 does not contain the same number of items as row 1 (2 vs 3).
>>> * - R2.1
>>>   - Calls to the `__builtin_unreachable()` function inside the 
>>> expansion of
>>>     the `ASSERT_UNREACHABLE()` macro may cause a function to be marked as
>>>     non-returning. This behavior occurs only in configurations where
>>>     assertions are enabled. To address this, the `noreturn` property for
>>>     `__builtin_unreachable()` is overridden in these contexts, 
>>> resulting in
>>>     the absence of reports that do not have an impact on safety, despite
>>>     being true positives.
>>>     Xen expects developers to ensure code remains safe and reliable in 
>>> builds,
>>>     even when debug-only assertions like `ASSERT_UNREACHABLE() are 
>>> removed.
>>> 3. xen/docs/misra/rules.rst:127: WARNING: Inline interpreted text or 
>>> phrase
>>> reference start-string without end-string. [docutils]
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

>>
>> I recall that Andrew wanted to add a doc build test to avoid introducing 
>> warnings.

Yes I do, but sadly still on my TODO list.

>>  On that front, with my Sphinx version I also see this build 
>> warning:
>>
>> Running Sphinx v8.1.3
>> WARNING: Calling get_html_theme_path is deprecated. If you are calling 
>> it to define html_theme_path, you are safe to remove that code.
>>
> Yes, I see the same warning on my end.
> Need to address that in docs/conf.py as well.

IIRC, this needs ignoring for now.  It is still required in the minimum
Sphinx version we support.

~Andrew

