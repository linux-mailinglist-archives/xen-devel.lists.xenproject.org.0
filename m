Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDFF9F0E33
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 15:02:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856748.1269278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM6F4-0007Yj-RJ; Fri, 13 Dec 2024 14:02:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856748.1269278; Fri, 13 Dec 2024 14:02:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM6F4-0007Ww-OK; Fri, 13 Dec 2024 14:02:06 +0000
Received: by outflank-mailman (input) for mailman id 856748;
 Fri, 13 Dec 2024 14:02:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Llk3=TG=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1tM6F3-0007Wo-Bp
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 14:02:05 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3915868-b95a-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 15:02:02 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 3CB674EE073D;
 Fri, 13 Dec 2024 15:02:01 +0100 (CET)
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
X-Inumbo-ID: d3915868-b95a-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1734098521; bh=klRPZOqneBz5gfO7b441OlTKJoRMkxdw9PnJWpSOFvw=;
	h=Date:From:To:Cc:Subject:Reply-To:In-Reply-To:References:From;
	b=pwflzZJu6TyuBDRpkvpqxveBlgPqWUniEycepnJ/W4rq6jv8FMhoOoWT1tv1Eg44V
	 JpB/9cMU/jZnUrpgX9P0LbMSEwMcp39ha5mEtbcvwQDIXgbvz52tDyrMC9Ioc6em/H
	 k9FB3qEYCkWJ3cHk3QoPjM5WFyV//i+koqQE0crDbrg5q9BqhWVszBzN4nE+Ec8D7d
	 pDBEQUFjTywLvbMyls5ol1sMPYFJcpoxsx1/DlLFtGWZmBOX6HYCxHD0iWuPBRwEo2
	 4rkGCQKa2ecVby9QhbgTQreSL9ZVsx7/XswWPZuvGYMNWj9nIX9Z8ymX+5yGuc668Z
	 VYRm5SlHRAIWA==
MIME-Version: 1.0
Date: Fri, 13 Dec 2024 15:02:01 +0100
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: address violation of MISRA C Rule 11.1
Reply-To: alessandro.zucchelli@bugseng.com
Mail-Reply-To: alessandro.zucchelli@bugseng.com
In-Reply-To: <d4b988aa-48f8-4e35-bb7d-49c2a9d532e6@suse.com>
References: <7debd63f3900bad62bcbcc03081e4c04e6099135.1733914487.git.alessandro.zucchelli@bugseng.com>
 <bded3d90-0644-46c2-a43e-d6b06faa5650@suse.com>
 <alpine.DEB.2.22.394.2412111826440.463523@ubuntu-linux-20-04-desktop>
 <26600bb0-93af-45b5-a341-5771bad844a1@suse.com>
 <alpine.DEB.2.22.394.2412121647450.463523@ubuntu-linux-20-04-desktop>
 <d4b988aa-48f8-4e35-bb7d-49c2a9d532e6@suse.com>
Message-ID: <1ddb5bd7e8889da0e978bb1391072925@bugseng.com>
X-Sender: alessandro.zucchelli@bugseng.com
Organization: BUGSENG Srl
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2024-12-13 11:08, Jan Beulich wrote:
> On 13.12.2024 01:53, Stefano Stabellini wrote:
>> On Thu, 12 Dec 2024, Jan Beulich wrote:
>>> On 12.12.2024 03:27, Stefano Stabellini wrote:
>>>> On Wed, 11 Dec 2024, Jan Beulich wrote:
>>>>> On 11.12.2024 12:02, Alessandro Zucchelli wrote:
>>>>>> Rule 11.1 states as following: "Conversions shall not be performed
>>>>>> between a pointer to a function and any other type".
>>>>>> 
>>>>>> Functions "__machine_restart" and "__machine_halt" in 
>>>>>> "x86/shutdown.c"
>>>>>> and "halt_this_cpu" in "arm/shutdown.c" are defined as noreturn
>>>>>> functions and subsequently passed as parameters to function calls.
>>>>>> This violates the rule in Clang, where the "noreturn" attribute is
>>>>>> considered part of the function"s type.
>>>>> 
>>>>> I'm unaware of build issues with Clang, hence can you clarify how 
>>>>> Clang's
>>>>> view comes into play here? In principle various attributes ought to 
>>>>> be
>>>>> part of a function's type; iirc that's also the case for gcc. Yet 
>>>>> how
>>>>> that matters to Eclair is still entirely unclear to me.
>>>>> 
>>>>>> By removing the "noreturn"
>>>>>> attribbute and replacing it with uses of the ASSERT_UNREACHABLE 
>>>>>> macro,
>>>>>> these violations are addressed.
>>>>> 
>>>>> Papered over, I'd say. What about release builds, for example?
>>>>> 
>>>>> Deleting the attribute also has a clear downside 
>>>>> documentation-wise. If
>>>>> we really mean to remove them from what the compiler gets to see, I 
>>>>> think
>>>>> we ought to still retain them in commented-out shape.
>>>> 
>>>> Another option would be to #define noreturn to nothing for ECLAIR 
>>>> builds ?
>>> 
>>> That again would feel like papering over things. Plus I don't know if 
>>> that's
>>> an option at all.
>> 
>> What is "papering over" and what is a "nice solution" is often up to 
>> the
>> personal opinions.
>> 
>> From my point of view, Alessandro's patch doesn't make the code worse.
>> The ASSERT_UNREACHABLE solution is OK. I do agree with you that it
>> should not be required for us to remove "noreturn", but I don't think 
>> we
>> have used it consistently anyway across the Xen codebase.
>> ASSERT_UNREACHABLE is also a form of documentation that the function
>> does not return.
>> 
>> In conclusion, I think all three options are acceptable:
>> 1) this patch as is
>> 2) this patch plus /* noreturn */ as a comment
>> 3) #define noreturn to nothing just for ECLAIR builds
>> 
>> I don't mind either way, maybe option 2) is the best compromise.
> 
> The variant with least impact on what we currently have (generated code
> wise) is 3), though, which hence would be my preference (well, not 
> exactly
> a preference, but the least bad one).

Another option could be to encapsulate these function pointer casts as 
follows:
#define REMOVE_NORETURN(x) (void(*)(void*))(x)
This approach allows us to retain the noreturn attribute and the 
associated optimizations;
note that the encapsulating macro will need to be deviated then.

-- 
Alessandro Zucchelli, B.Sc.

Software Engineer, BUGSENG (https://bugseng.com)

