Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88471A34E8C
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 20:40:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887996.1297415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tif3k-00050m-T5; Thu, 13 Feb 2025 19:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887996.1297415; Thu, 13 Feb 2025 19:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tif3k-0004zG-Pf; Thu, 13 Feb 2025 19:39:40 +0000
Received: by outflank-mailman (input) for mailman id 887996;
 Thu, 13 Feb 2025 19:39:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q8TG=VE=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tif3j-0004zA-EZ
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 19:39:39 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 429b46b3-ea42-11ef-88c1-8ba37f82fa57;
 Thu, 13 Feb 2025 20:39:38 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-38dc1dfd9f2so1019921f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 11:39:37 -0800 (PST)
Received: from [192.168.1.10] (host-92-26-98-202.as13285.net. [92.26.98.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7987sm2611209f8f.87.2025.02.13.11.39.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 11:39:36 -0800 (PST)
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
X-Inumbo-ID: 429b46b3-ea42-11ef-88c1-8ba37f82fa57
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739475577; x=1740080377; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YYF7Jyt9Ey1Bxb1C+UjORD65Q/sJVkHvvabnw5sjRyU=;
        b=ibhA8u7Qck2rbAOIlTmb205e69sQOp+gn3DEysIp8e8E6w0lZn40k+25nr+vwNGrS3
         HjiWoUdJF4f9vDr1lAQi0Zck9s6ik+NXM40Gdn53V5pYdJQtEWFO32G+LAQQyHvJad1f
         qgeddk1pcKMFuN+d80SnInxKtJkmp2GMwZv/Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739475577; x=1740080377;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYF7Jyt9Ey1Bxb1C+UjORD65Q/sJVkHvvabnw5sjRyU=;
        b=NGCZQxsJl98nIwbs6LUUmqBASY/Gb8UcnUhspfIEoNUME6cUU4M2ysymZHCkltsw3e
         bllY33zx+bG3C1q42a3TVPKcF6V9fdTTbjIGdd8B1WmkSVmiD5W1eUpUr+RSfdF8q/Ep
         XMacOQ3fJFDqzXHMfUk+/1FbsT2Az97icupgK1xITI4lQIjCH9RNsPX/ZEUat9VznVU1
         Ryz3EOj62jCqL0OjN8UFtfqTD+ltVoE5sUAHMgH6/cqQ4Pm44xbZWzGEAKETfC1yMSLU
         km/i2hUfEDIjEgwOQajHofF1SqC+QbJ0oYXl/vgYBDiiAM1j1DNopnw7ZAEfq2qK59jw
         xLvg==
X-Forwarded-Encrypted: i=1; AJvYcCUca9G74WxH6ezprYvnJpiKYPRcDJgxjO9Ag74zKxpZk9J7E+fP3GudHGi9kXZR3JSLVwmn2c2kFjo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy5F9sfDh8ihFSjy+ljAq5b1PIC0o4KlAGGg9LuSkxZfDaINpwc
	gBt/yjgRoccCM2CyY2AzmHbxwxt5rmBH7cyklKsk74f+oZi6fF4tGTYp7nakZIU=
X-Gm-Gg: ASbGncsjfsKdEgUxh0fxnQAnCUcTt9+RRBl1A72J36STjWqSAem2V9HAzCLqHF1zSB3
	N+W+e+p4U+3LG3GSrgZGT190VtgksT7UpM6enJVTYr4Sy5g9E8cR3VSFpXIi8J5ty2G1xFAHkvQ
	2+U/5s5LnaSOTqAdOu7Hi5ikY3t2DU6ZM09A+UUNlvu4FLKo0Bayu9nWVmP0pyOhYFdjTqUHQ/V
	O35xKr6rcVVzZUxFfPY1k56KUKN/8JB8/bn1g7ut+HSQqjnZvjk8eWRbcU6VB3BUeQHneAUGy0S
	EQwWco1DfhQ1Q+RNMuNSX7VrheqQjb7iaAnF4MEGJMoqGj6eNk5egH4=
X-Google-Smtp-Source: AGHT+IHtYCfQyeQb1XtCUOYP2Nh4Ayq+h1mS88oZcI5F4j/Vcwom0gWFWTG+n5Q/ZQHAdTnp/8f/9Q==
X-Received: by 2002:a05:6000:2a6:b0:38d:da11:df19 with SMTP id ffacd0b85a97d-38dea2eb362mr10221097f8f.41.1739475576921;
        Thu, 13 Feb 2025 11:39:36 -0800 (PST)
Message-ID: <1dc1773f-891e-40d8-97a6-5adaa0613ffe@citrix.com>
Date: Thu, 13 Feb 2025 19:39:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] radix-tree: don't left-shift negative values
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Teddy Astie <teddy.astie@vates.tech>
References: <70ebba90-59a8-4224-b67c-b9eb373684b4@suse.com>
 <0de3a7e8c55af172e7260f8bb22949b4@bugseng.com>
 <2118904d-3a33-47f3-af68-7303bc17186c@suse.com>
 <e34113912d9886a876fd5f3bd094abb2@bugseng.com>
 <8ca92f7360385a5b4033cf22ef843775@bugseng.com>
 <A7FE0F28-A75E-4CE1-B649-1D92BE334852@arm.com>
 <alpine.DEB.2.22.394.2502131120430.619090@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <alpine.DEB.2.22.394.2502131120430.619090@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/02/2025 7:26 pm, Stefano Stabellini wrote:
> On Thu, 13 Feb 2025, Luca Fancellu wrote:
>>> On 13 Feb 2025, at 15:42, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>> On 2025-02-13 16:32, Nicola Vetrini wrote:
>>>> On 2025-02-13 16:01, Jan Beulich wrote:
>>>>> On 13.02.2025 15:52, Nicola Vetrini wrote:
>>>>>> On 2025-02-13 15:22, Jan Beulich wrote:
>>>>>>> Any (signed) integer is okay to pass into radix_tree_int_to_ptr(), yet
>>>>>>> left shifting negative values is UB. Use an unsigned intermediate type,
>>>>>>> reducing the impact to implementation defined behavior (for the
>>>>>>> unsigned->signed conversion).
>>>>>>> Also please Misra C:2012 rule 7.3 by dropping the lower case numeric
>>>>>>> 'l'
>>>>>>> tag.
>>>>>>> No difference in generated code, at least on x86.
>>>>>>> Fixes: b004883e29bb ("Simplify and build-fix (for some gcc versions)
>>>>>>> radix_tree_int_to_ptr()")
>>>>>>> Reported-by: Teddy Astie <teddy.astie@vates.tech>
>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>> ---
>>>>>>> Bugseng: Why was the 7.3 violation not spotted by Eclair? According to
>>>>>>>         tagging.ecl the codebase is clean for this rule, aiui.
>>>>>> radix-tree.{c,h} is out of scope:
>>>>>> automation/eclair_analysis/ECLAIR/out_of_scope.ecl:32:-file_tag+={out_of_scope,"^xen/include/xen/radix-tree\\.h$"}
>>>>>> docs/misra/exclude-list.json:153:            "rel_path":
>>>>>> "common/radix-tree.c",
>>>>> Is there a record of why they are excluded? Is it further explainable
>>>>> why exclude-list.json mentions only the .c file and out_of_scope.ecl
>>>>> mentions only the .h one? Shouldn't different parts be in sync?
>>>> exclude-list.json is used to generate a configuration file for ECLAIR just before the analysis starts, so effectively both are excluded. It's a good point however to have only one file to handle exclusions, and use that file to generate the exclusion list dynamically, but then someone might want to exclude certain files only in some analyses and not others, which is not a good fit for exclude-list.json as it is now.
>>>> @Stefano, thoughts?
>>> I forgot to address the first question: the (vague) reasons are listed in exclude-list.json as the "comment" field; in most cases, it's because the files have been imported from Linux, but the full rationale is something that should be asked to the original author, which is Luca Fancellu.
>> So IIRC the full rationale is that since some files are imported from Linux, we would like to maintain them as they are
>> in order to ease backports. Misra fixes can be done, but they need to be upstreamed to Linux and backported to Xen.
>>
>> Probably a re-evaluation could be done by the maintainers to see if some of these files could be removed from the exclusion
>> list.
> Yes, it is as Luca said. At the beginning of the project, we reviewed
> the codebase to define what was in scope and what was out of scope. One
> area of contention was the files imported from Linux. Many of these
> files were declared out of scope because we wanted to retain the ability
> to easily synchronize them with their corresponding files in Linux.  
>
> Now, years have passed, and we have gained significant experience from
> running this project. It is completely acceptable to redefine the scope,
> including making changes to exclude-list.json.
>
> However, we do not necessarily need to modify exclude-list.json to
> accept a single, clearly beneficial fix like this one. So, Jan, feel
> free to proceed and commit it.  
>
> I just wanted to provide some background. If you believe that removing
> common/radix-tree.c from docs/misra/exclude-list.json, and thereby
> including it in ECLAIR's regular scanning, would be the best approach, I
> am also fine with that.

I agree with Jan that it's important that we have a single source of truth.

Furthermore, it is critical that the justification of why things are in
certain categories are identified.  It only needs to be a single
sentence in a comment, but a developer needs to be able to look at the
file and figure out *why* a decision was taken...

... because as Stefano says, decisions change over time, opinions and
scope change, etc.


As to the specifics of radix-tree, I personally think is rather
disingenuous to say "here's a data-structure fundamental to the
operation of Xen, but because the code is written in Linux style we
chose to ignore problems in it."   A certifier would be well with their
rights to tell you where to go if you tried to argue that point.

It is code in Xen, and critical to Xen's behaviour.  It doesn't matter
if you want to do a Linux-first or Xen-first approach to fixing issues;
the issues need fixing.

~Andrew

