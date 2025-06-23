Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15278AE38A6
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 10:41:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022167.1397893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcjr-00013P-8i; Mon, 23 Jun 2025 08:41:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022167.1397893; Mon, 23 Jun 2025 08:41:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTcjr-00011V-60; Mon, 23 Jun 2025 08:41:15 +0000
Received: by outflank-mailman (input) for mailman id 1022167;
 Mon, 23 Jun 2025 08:41:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ZEs=ZG=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1uTcjp-000110-6w
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 08:41:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d07e5bc4-500d-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 10:41:11 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id 62D964EE3C25;
 Mon, 23 Jun 2025 10:41:10 +0200 (CEST)
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
X-Inumbo-ID: d07e5bc4-500d-11f0-b894-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1750668070;
	b=yyDuwEjhnt6FWDqwURyYe7SuaRiJ0ofqEBIeeV89l+PR9Ad3T6nHHtHgXG6ie8l/EafS
	 mUBjbOhygvrQiLDhnnrlbsXEbYjmy3QhqbubbmzGSOc5itTY/UHhBcEjySAY8u7s2VN8d
	 G2CGKGhSO14+ZIVRvNTIgjrCxCLyp64e/KXQCNJIHfmeS7mqmeJRvs+gZ7dQDrCVNn1er
	 NsEvv8l5/voVc3QmnuuUY5HDWqeO+xmbkQyUXhfhE0zshxc277nIKrQh1Y08007HBQ79t
	 8EUCfSc7LVXHRYrX2PWPp2jZa6fbFtNPhWgKwfcG1xMmgjLNwrv1P5p2XVhoEvV6DU8HE
	 kPDt0hixmIOTlfD6dyXqNb21/0rKEQyOSuRl46MZ28y3E3I6K5lyuO9qetyvmz7N2bBLz
	 AqDOJbFDk5K3DO0oFnSzNhWYbCe+NAQD8NzCRn1UldEmNkDJVftbvC9jljRnYkBYOxBH0
	 jD1so1dWKjSQVDz4D1mETtWi8tvFczeM/dtHkbHPiyMOt4JzASG+hZfP/dUAX5NHp1Chq
	 unYxo7u88rGA0LurZqSI6+5qOLQBqpAwafLMXLXR0WKQ2gmFv2vaxA/1HsUOH3xT/Dp7+
	 w6J03vQOhMkX831YK3DiSFeYGLjTRHsC3kJviBf0CqbRmjv4Nux4f0TmwJ8kjGg=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1750668070;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=Apxn1EwW5jUNFbwowZsf2yZNLKfqblG8Xvr0MqKrexM=;
	b=qGpfBxsjahKv7eXIbiswfat7AhKOcKHPQGYRl+jUJ3/Xjp3a3Phe4jh1oLz02d2/DCMK
	 9eXHTYMw4d7FPuDlg7fcQiml6QwD+hsUWLNbZ/OPM1D7dGSjlfJW+mAhzABpJ5qArbUBX
	 dGIve+SxBSM9tPaieaibx/DjZ/XIKFjUNJTwjW3pp+uVWbymkwD1Y6EXxlipkuSUWy+4d
	 GAUsTPZj57xHP409Sdh60zi+JB1V5otHMT3qwdEZrveQKLpmcrcBZV7Zci4RZfL9NKdQf
	 gOcIq7z2clQCUWrBV35kZwvyWV2Cub4SJnDqFIx5gnn0v2K74SQuTNTg1sO26U2PBRg3s
	 6nfTia28vcp7IUQyykbEoWYF8weFbNaxg7FTQad4ORpJ8hBJUH7t9bziWRcwOr20shuOe
	 Qco7o/1Ryg9zO60hul4LqBl7YiNXgnRAp0M9Co78ChSZDmWQD5lg+VinNd6AfIFaGQnsH
	 qmDOEowcinRHJqf4tVC1JJoqVrC6h9XmwhUickGjWuWa0i9J58Rd9txFyJTnnyAk1HqwR
	 9b/YfFTGJqXK22/pY/Sw25nNB1r0tYNc1+M3zdrDqNEovG4HMuK3v/spTpu9532O5CfSZ
	 6KfXJQ+22IiLD3h2FEzAj21nLlw2ANPEZ63gNUiuIA+tbNmZvjkPAGSCZH4jeEg=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1750668070; bh=9ZpZGRb7kJKM8VCPDfRcaOmkVU1+1v98pMqRVe4UENM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Od8P2yepdU5i87q4VuFxk1v53IIj/AnxWzjx/BEkOabQjKr2KE8sG/vEvJK3kFdCe
	 zB+YfpnlvNY/xMkCB0R7Z10K83SC2oVKM9JrEH+9tPxCFKME/gtdzeHmte1OTQLTyz
	 RIAUcJkUiuYRBQc1/aTa3RbxVMTx5f+io3yBog3buITvVWdxfydhJnAp9/ACifn1wL
	 rS9qbgZFoe57hUk9PGMghqAlG4l3LbvIXXBrOCdDNG/lT/ECfEL8CqrfivyGVqTHIF
	 PVrDA7jDZn1AgD+Dr4sV0kEwgFI/vb8hFAEqHoCeYXUqyhBD5BLM0yMwpNw6Fv751L
	 V2r9QsWuYN6lg==
MIME-Version: 1.0
Date: Mon, 23 Jun 2025 10:41:10 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Julien Grall <julien@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH] xen: fix header guard generation for asm-generic
 headers
In-Reply-To: <28e3a8bf-79c4-42d4-a0e6-9458ee31f24f@suse.com>
References: <f07133fa226df11624883fafa1cb455a4e7670ba.1750499076.git.nicola.vetrini@bugseng.com>
 <45b33975-be79-40eb-a860-ca3eb71443b0@suse.com>
 <28e3a8bf-79c4-42d4-a0e6-9458ee31f24f@suse.com>
Message-ID: <9ef5220c5a3bcb8957cef2a9ccbc3e7b@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2025-06-23 10:20, Jan Beulich wrote:
> On 23.06.2025 09:51, Jan Beulich wrote:
>> On 21.06.2025 11:58, Nicola Vetrini wrote:
>>> Dashes were wrongly not translated into underscores, thus generating
>>> an unexpected guard identifier.
>>> 
>>> Fixes: ee79f378311b ("xen: add header guards to generated asm generic 
>>> headers")
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>>  xen/scripts/Makefile.asm-generic | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/xen/scripts/Makefile.asm-generic 
>>> b/xen/scripts/Makefile.asm-generic
>>> index b0828018080d..f6850758c54b 100644
>>> --- a/xen/scripts/Makefile.asm-generic
>>> +++ b/xen/scripts/Makefile.asm-generic
>>> @@ -34,7 +34,7 @@ unwanted    := $(filter-out $(generic-y) 
>>> $(generated-y),$(old-headers))
>>>  quiet_cmd_wrap = WRAP    $@
>>>        cmd_wrap = \
>>>  	arch=$$(echo $@ | sed -n 's:.*arch/\([^/]*\)/.*:\1:p' | tr a-z 
>>> A-Z); \
>>> -	upper=$$(echo $*.h | tr a-z A-Z | tr '/.' '__'); \
>>> +	upper=$$(echo $*.h | tr a-z A-Z | tr '/.-' '__'); \
>> 
>> Aiui the other argument also needs to change, to '___'. While some tr 
>> implementations
>> may cope, the spec is quite clear:
>> 
>> "When the -d option is not specified:
>> 
>>     Each input character found in the array specified by string1 shall 
>> be replaced by the character in the same relative position in the 
>> array specified by string2. When the array specified by string2 is 
>> shorter that the one specified by string1, the results are 
>> unspecified."
>> 
>> Easy enough to adjust while committing, I suppose.
> 
> Except that I notice that this was committed already. Will require 
> another
> fixup then, I expect.
> 
> Jan

My bad, GNU tr seems to cope just fine (i tested running on all Xen 
headers) but another fixup is in order.

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

