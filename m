Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E89049E531E
	for <lists+xen-devel@lfdr.de>; Thu,  5 Dec 2024 11:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849031.1263752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ9WW-0002hy-NR; Thu, 05 Dec 2024 10:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849031.1263752; Thu, 05 Dec 2024 10:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJ9WW-0002fs-Ku; Thu, 05 Dec 2024 10:55:56 +0000
Received: by outflank-mailman (input) for mailman id 849031;
 Thu, 05 Dec 2024 10:55:55 +0000
Received: from [94.247.172.50] (helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OAf2=S6=cloud.com=bernhard.kaindl@srs-se1.protection.inumbo.net>)
 id 1tJ9WV-0002fg-3u
 for xen-devel@lists.xenproject.org; Thu, 05 Dec 2024 10:55:55 +0000
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [2a00:1450:4864:20::543])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 790ce410-b2f7-11ef-99a3-01e77a169b0f;
 Thu, 05 Dec 2024 11:55:43 +0100 (CET)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-5d0bf6ac35aso1007611a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Dec 2024 02:55:43 -0800 (PST)
Received: from ?IPV6:2a02:1748:f7df:8cb1:b126:7c76:ed31:81e6?
 ([2a02:1748:f7df:8cb1:b126:7c76:ed31:81e6])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa62608d3bdsm74204466b.148.2024.12.05.02.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 02:55:41 -0800 (PST)
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
X-Inumbo-ID: 790ce410-b2f7-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1733396142; x=1734000942; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYkIntcAJdP3iY1JitxN1xpkQ3Q2ZauFSEVV36awBKc=;
        b=QI6ifW5TW/uidWMUN3SsxRv3ROthYInAIxqveINiU8iWNPbv5IbpfNSUJXuci+97UW
         QZ5wIcorqupncFdQhTsDA1aE5LlHmG3elYu+FytNE1wsvr72nZUQ0eUZl95CP9qKBeZo
         nz+lfoMcZDft26yLdNtLOCgF9v1c8gOpqMaao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733396142; x=1734000942;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYkIntcAJdP3iY1JitxN1xpkQ3Q2ZauFSEVV36awBKc=;
        b=u17qZW0syTQibmNc677ssbM3rgcIV9hgg2UqTnTLErSXCuthS3ex3TBm1K8v0ULlKh
         WtU+s5wat/aXkaYgHIhrIzNujFvGoMWF0sP0O9rJhdfdZOeL9mslXSbRz3r+QijksUUO
         QrJkhgNRJa6N+ZoLTqa+ul9/mmq2qFwduj91oUZ5Q+iFAzRjOFR9u9TZ0eEUkTTXd1Gw
         M9Px707tbSgtzi+NzjJ+jhxcwqcvV7vBAM/G0vyC6gAtqV7BNAjgPQ1Is0MnQArK38P6
         /3sabMnFXwYEAL9Wd3/fh63wwEStiykf0Cn2l2ih72VXxR5ifPRB3MAxQY/haYyJA6oa
         IgbA==
X-Forwarded-Encrypted: i=1; AJvYcCXl1UQD+VEzGdXqXIoPqu3JKwwWINpGboxnx6uyq9t2YHSlBXWQgD5pZJho/aHtYp+KB4xGBfLnppU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzbZ7J35GBUmf09cLhpmgn37yuvkbcEqZ3iIBrhjttHjBFRcR08
	78PKQYR5qTlwCzW7Hy9S/81pYIiuUnqByXZ9nWfrsSONO3FCOz9QgXVLgf3MQEU=
X-Gm-Gg: ASbGncufrcMyX5vkE/WTfPlAIhss756njtVvPN5Ca76PFEjqgOAbmVdQ4j/LkgqNGEs
	ATX6UrggxA/xJljv9KgGnk8oq/etPTGTtizj5W/UTvgc4ypW0xazDi+06rl07+YWIn9xpBkH2t0
	OdK5/5Z4vsUk8TDTUVdNMVRx3C1pz+4EjTItckk1SpYtWTeZFwAyFm/D+ZhDBot928MrM4Z6R5q
	uEmHfqH/FCayinvjXxFI6UFAPCiK+V0QXlmR06gKWjAy25Q+2aGfUtQIZTPDpAdqdoFKnSgNcWg
	qtRQ4W9lZBsmii2CXrbdBufBTCsc5sIfxZdR+SM=
X-Google-Smtp-Source: AGHT+IHDXSQi5DDGJN4cP2T3KVRLw6370SQqMBJuH5twFQLA6BsGe5yD/3ZvUudcnT44HadlTl/HyA==
X-Received: by 2002:a05:6402:3511:b0:5d0:ccce:34b2 with SMTP id 4fb4d7f45d1cf-5d10cb99fcfmr14087068a12.29.1733396142480;
        Thu, 05 Dec 2024 02:55:42 -0800 (PST)
Message-ID: <3f527685-e1bf-4a87-8986-2b9620d14646@cloud.com>
Date: Thu, 5 Dec 2024 11:55:39 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [RFC PATCH] SYSCTL_numainfo.memsize: Switch spanned to present
 memory
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <10466e8c29b5f69774915bcf6562985c75e98bb7.1733224306.git.bernhard.kaindl@cloud.com>
 <0299582c-7261-4947-a2ac-bf3d62ccac14@suse.com>
From: Bernhard Kaindl <bernhard.kaindl@cloud.com>
In-Reply-To: <0299582c-7261-4947-a2ac-bf3d62ccac14@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2024 12:37, Jan Beulich wrote:
> On 03.12.2024 12:12, Bernhard Kaindl wrote:
>> This the 2nd part of my submission to fix the NUMA node memsize
>> retured in xen_sysctl_meminfo[].memsize by the XEN_SYSCTL_numainfo
>> hypercall to not count MMIO memory holes etc but only memory pages.
>>
>> For this, we introduced NODE_DATA->node_present_pages as a prereq.
>> With the prereq merged in master, I send this 2nd part for review:
>>
>> This RFC is for changing the value of xen_sysctl_meminfo[]->memsize
>> from NODE_DATA->node_spanned_pages << PAGE_SHIFT
>>    to NODE_DATA->node_present_pages << PAGE_SHIFT
>> for returing total present NUMA node memory instead of spanned range.
>>
>> Sample of struct xen_sysctl_meminfo[].* as presented by in xl info -n:
>>
>> xl info -n:
>> [...]
>> node:    memsize    memfree    distances
>>     0:  -> 67584 <-   60672      10,21
>>     1:     65536      60958      21,10
>>
>> The -> memsize <- marked here is the value that we'd like to fix:
>> The current value based node_spanned_pages is often 2TB too large.
>>
>> We're currently not using these often false memsize values in XenServer
>> according to my code review and and Andrew seemed to confirm this as well.
>>
>> I think that the same is likely true for other Xen toolstacks, but of course
>> to review this change or propose an alternaive is the purpose of this RFC.
>>
>> Thanks,
>> Bernhard
> 
> All of the above reads like a cover letter. What's missing is a patch
> description, part of which would be to clarify whether the field is
> indeed unused except for display purposes, or why respective users would
> at least not regress from this change. What's also unclear is what
> comments you're actually after (i.e. what question(s) you want to have
> answered), seeing this is tagged RFC.
[...]
> Jan

Hi Jan!

The answer I'm looking for is which users to check, or to check with.

For example, I know that Xapi can use xen_sysctl_meminfo[].memfree to
get a preference about the NUMA node use use when creating a domain
(when the new mode `numa_affinity_policy.best_effort` is enabled):
https://xapi-project.github.io/new-docs/toolstack/features/NUMA/

A potential use of xen_sysctl_meminfo.memsize in Xen toolstacks is
less clear to me:

The only potential use would be if some Xen toolstack would not like
to solely rely on [nid].memfree for NUMA placement.

The question is if there are other NUMA aware toolstacks besides Xapi,
that would try to use it for e.g. planning the placement of domains.

My in the Xapi and Xen repos only turned up a debug printf() in
xen-api's xen-api/xenopsd and in xen only the output of xl info -n.

It seems questionable to me that any other toolstacks would rely on it,
especially as the value it returns currently is offset even 2GB on some
machines. I'd expect that this bug would have affected code using it.

The answers I am looking for are acknowledgements of that or references 
which users might use .memsize currently (that could be affected).

Alternatively, I'd hope to get an idea what would be the method to 
create a new revision of the numainfo hypercall:

I guess it would be to add a new #define XEN_SYSCTL_numainfo_v2,
and if v2 is called, return [].memsize using [nid].node_present_pages 
instead?

Kind regards,
Bernhard

