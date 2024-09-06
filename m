Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007E796F1D9
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:46:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791725.1201710 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWTm-0007Tl-AU; Fri, 06 Sep 2024 10:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791725.1201710; Fri, 06 Sep 2024 10:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smWTm-0007SG-7a; Fri, 06 Sep 2024 10:46:14 +0000
Received: by outflank-mailman (input) for mailman id 791725;
 Fri, 06 Sep 2024 10:46:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ayfn=QE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smWTl-0007S9-3c
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:46:13 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0e98c0-6c3d-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 12:46:11 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so1395888f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 06 Sep 2024 03:46:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a620525efsm259801366b.58.2024.09.06.03.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Sep 2024 03:46:09 -0700 (PDT)
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
X-Inumbo-ID: 3b0e98c0-6c3d-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725619571; x=1726224371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Ze66nJHiM1J9z3iNwQYsV02wjEz76KIkRFqN/BE9L0=;
        b=HeDwAASqSHjyUCLR6RR3FMw7S3T/e22RYGz7VXmks3ko9oy2nWUQ2i2ytPXcUgEbVc
         kDc9J6sXRZlJSPZCFeSRibKGCgKMvbro6qt/J47D4fyfxhg8w/tDhzz3Mqng2iZ0ruuy
         GMXDRRLFI4ByEcfDnHsBcjmrdcp+kNd1lFuaf5UUNy6JElVzsZ4j/yTfoNevN7kgmPuj
         595NveXNYiuUKWQhCP4qh4jXjMG1Fvozp6D62U7qTIhH3b+Cr3J0pxIBkWZjSI/Wg+rt
         dQg6PmNR55k54LayV0bxypPalQwvnAur18aodNE9dG9MTWIzPwihDAjHG3I5Yvx5EJzl
         HJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725619571; x=1726224371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Ze66nJHiM1J9z3iNwQYsV02wjEz76KIkRFqN/BE9L0=;
        b=jucb1pVftFTjrBpYA1w+1Z73W38oJb/VsW6WfND7pxR36zMH4gHm9WoxQPnk6Ok4s4
         2Qc7ys7b/kOa/P+hyWvAzafZ7Fd0DKrOgI9D4paeNiTiMfHbyIwxF57p7g0rCAt4sh25
         nGWg7zgx5HZHL1lHM36tdH1hIBc79+MVhrrva60HPztqUxnFnYQEbQFok5t77lGz5e2d
         vdga1LV+ekgKze1aTyzy0bHo4MbWGMklgIy7uJ6Cc+zgw10ZqkwPWn3Rqa9fNgzMyZZu
         0+HiOutqEkq68vnrqhlu4j8wLiLI1TW5G3QVAhql4IxYsLx64PGw5ISlLkB7SgWffJmO
         a3jA==
X-Forwarded-Encrypted: i=1; AJvYcCVHjEF3cbY0NuG/9YyvsPdthPVQtdCb8KzwCP2Zj09MAnQ2GPxxmDlTXrUkt7j0sy6Ez5dyjXOhKOY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeBlWPZuAxChtA4Mut6NeE3WI08Ys9U8GazudyPbCQ4FDPZGpl
	HsUxCR9Yq9pM0Jog8ykX7ehPMUTuCzbDGqO9NbkITsJkO8vLl5FrjPAL78skTw==
X-Google-Smtp-Source: AGHT+IGWlT7Kb1YE7HfF/WTWURqiWpIr6ZNiZk8vjo7oi+VZKbFw+6mnpcZ1EAx617Hi9xOPnBpviQ==
X-Received: by 2002:a5d:56d1:0:b0:374:bcdc:6257 with SMTP id ffacd0b85a97d-374bcdc639amr16870071f8f.54.1725619570468;
        Fri, 06 Sep 2024 03:46:10 -0700 (PDT)
Message-ID: <cd1049b1-e52a-4062-b106-e85bc8b56d76@suse.com>
Date: Fri, 6 Sep 2024 12:46:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [xen-unstable test] 187507: regressions - FAIL
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-187507-mainreport@xen.org>
 <ba5fb24b-52fd-4a7f-a3dd-3c83c2a97e8a@suse.com>
 <5ba7f4ea-4772-4bbf-9e9e-88d45c81b73a@citrix.com>
 <779f69aa-f1d3-4582-b08d-83f92d4614c2@citrix.com>
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
In-Reply-To: <779f69aa-f1d3-4582-b08d-83f92d4614c2@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.09.2024 12:07, Andrew Cooper wrote:
> On 06/09/2024 11:01 am, Andrew Cooper wrote:
>> On 06/09/2024 7:08 am, Jan Beulich wrote:
>>> On 06.09.2024 06:41, osstest service owner wrote:
>>>> flight 187507 xen-unstable real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/187507/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>  build-i386-xsm                6 xen-build                fail REGR. vs. 187498
>>>>  build-i386                    6 xen-build                fail REGR. vs. 187498
>>> This is a result of "x86emul: introduce a struct cpu_policy * local in
>>> x86_emulate()", and me not noticing the issue because in my tree (for
>>> AMX in particular) I have several more uses of the variable. I'd really
>>> like to avoid undoing the change, but adding __maybe_unused also seems
>>> bogus to me, as does adding a seemingly stray (void)cp somewhere. Good
>>> alternative ideas, anyone?
>> __maybe_unused as at least accurate, and its less fragile than a (void)cp;
> 
> Interestingly, Gitlab's x86_32 build test missed this.
> 
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/7762103169 passed.
> 
> I wonder if there's anything we should have done to get better coverage.

From the build log:

make -C x86_emulator install
make[6]: Entering directory '/builds/xen-project/people/andyhhp/xen/tools/tests/x86_emulator'
make[6]: Nothing to be done for 'install'.
make[6]: Leaving directory '/builds/xen-project/people/andyhhp/xen/tools/tests/x86_emulator'

Iirc one of your colleagues (Alejandro?) had a patch to actually install the
test harness binary. I didn't like this very much, but the above may be a
good reason to have it despite my slight dislike. And I think I had indicated
already that if everyone else thinks this wants installing, so be it.

Jan

