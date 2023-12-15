Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDD08144FF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 10:59:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655003.1022622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4yH-000426-5f; Fri, 15 Dec 2023 09:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655003.1022622; Fri, 15 Dec 2023 09:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE4yH-0003zn-30; Fri, 15 Dec 2023 09:59:05 +0000
Received: by outflank-mailman (input) for mailman id 655003;
 Fri, 15 Dec 2023 09:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqNh=H2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rE4yG-0003zh-7u
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 09:59:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9387f046-9b30-11ee-98ea-6d05b1d4d9a1;
 Fri, 15 Dec 2023 10:59:03 +0100 (CET)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 by support.bugseng.com (Postfix) with ESMTPA id 8186F4EE073C;
 Fri, 15 Dec 2023 10:59:02 +0100 (CET)
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
X-Inumbo-ID: 9387f046-9b30-11ee-98ea-6d05b1d4d9a1
MIME-Version: 1.0
Date: Fri, 15 Dec 2023 10:59:02 +0100
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Julien Grall <julien@xen.org>, Jbeulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
 <michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Shawn
 Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org, George Dunlap <george.dunlap@cloud.com>
Subject: Re: [XEN PATCH v3 3/3] xen/mm: add declaration for first_valid_mfn
In-Reply-To: <2879189b-eea3-48c4-86e4-baed69e6a8f0@xen.org>
References: <cover.1702285639.git.nicola.vetrini@bugseng.com>
 <d80309f31fea24ea75c4994e924da069472811fc.1702285639.git.nicola.vetrini@bugseng.com>
 <6c717bd4-db1b-4e19-9b98-0776a8359085@suse.com>
 <alpine.DEB.2.22.394.2312131803150.3175268@ubuntu-linux-20-04-desktop>
 <2a7f0d03-1cab-4824-86ae-fb7a26ff8adc@suse.com>
 <9fcc73f0-fc9c-4f4f-a431-f1f3b0df1b6a@xen.org>
 <4a1f86c7-6643-4fd1-ba1c-a4f86abb63f3@suse.com>
 <CA+zSX=YHW3kGFroNDzwQg=EhEe3F_fw3gCd_9W+P2UxC7+g+0A@mail.gmail.com>
 <0166dd5b-c12e-40d8-88a6-1f3c97bcf2e0@xen.org>
 <3b2f1699-d58c-40d8-af36-caef70064601@suse.com>
 <2879189b-eea3-48c4-86e4-baed69e6a8f0@xen.org>
Message-ID: <9c981e710ef8c86f2a71ef332d991ef1@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan, Julien

>>> 
>>> +extern mfn_t first_valid_mfn;
>>> +
>>>    /*
>>>     * Create only non-leaf page table entries for the
>>>     * page range in Xen virtual address space.
>> 
>> ... I still disagree with the placement here (should be xen/numa.h 
>> imo),
> 
> I don't care too much about which header is used. So I am ok with 
> numa.h if this is what you really want. However...
> 
>> and I still don't see why we can't carry out the TODO right away, if 
>> we
>> have to touch all of this anyway. If it's really too much to ask from
>> the original contributor, I can certainly see about making a patch 
>> myself
> 
> There are a few reasons I didn't update with that approach or want to 
> ask Nicola for this:
>   1. I assume this will be a macro and it is not clear to me whether 
> Eclair would be able to detect the visibility change based on the 
> config
>   2. IMHO, this is obfuscating a bit more the code
>   3. I don't see why we want to special case first_valid_mfn. I am sure 
> we have other external variables in the same situation.
> 
> So if any solution needs to came up, then it needs to be generic, and I 
> fear this is going to be yet another lengthy work which is not worth it 
> for this case.
> 
>> (and I've now added this to my short-term TODO list).
> 
> Thanks. But as I wrote above, I am not sure I agree such proposal. Let 
> see what the code looks like.
> 

Given the controversy that arose on this patch, maybe it's best to drop 
it now from this series. If then it's agreed that as a temporary 
workaround you want to leave it as is and deviate, as I proposed 
elsewhere in the thread, feel free to reach out. Meanwhile, if patch 1 
looks ok I can mark this series as done and focus on the v2 for R2.1, 
which is almost ready.

-- 
Nicola Vetrini, BSc
Software Engineer, BUGSENG srl (https://bugseng.com)

