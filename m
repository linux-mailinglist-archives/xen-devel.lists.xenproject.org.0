Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FE7FD2D6
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 10:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643779.1004266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8GyW-0005o7-Ur; Wed, 29 Nov 2023 09:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643779.1004266; Wed, 29 Nov 2023 09:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8GyW-0005lr-Qx; Wed, 29 Nov 2023 09:35:20 +0000
Received: by outflank-mailman (input) for mailman id 643779;
 Wed, 29 Nov 2023 09:35:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1bx=HK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r8GyV-0005ll-Gv
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 09:35:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9bb712dd-8e9a-11ee-98e3-6d05b1d4d9a1;
 Wed, 29 Nov 2023 10:35:18 +0100 (CET)
Received: from [192.168.1.15] (host-82-59-158-146.retail.telecomitalia.it
 [82.59.158.146])
 by support.bugseng.com (Postfix) with ESMTPSA id 098724EE0737;
 Wed, 29 Nov 2023 10:35:17 +0100 (CET)
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
X-Inumbo-ID: 9bb712dd-8e9a-11ee-98e3-6d05b1d4d9a1
Message-ID: <a1b56fe2-b19d-4ecf-ae10-df7f3d911e47@bugseng.com>
Date: Wed, 29 Nov 2023 10:35:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] x86/guest_walk: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US, it
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: consulting@bugseng.com, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>
References: <e0422c0127ebb402bb4f593d41571caf36b0864b.1701164432.git.federico.serafini@bugseng.com>
 <320b5d4c-73c0-45de-92d5-953bcae59e4a@suse.com>
 <4f09cc01-3975-4c2f-960f-67f3ac1f53a4@citrix.com>
 <74748681-dca2-437a-a438-f0a6294ea8e4@suse.com>
From: Federico Serafini <federico.serafini@bugseng.com>
Organization: BUGSENG srl
In-Reply-To: <74748681-dca2-437a-a438-f0a6294ea8e4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/23 14:43, Jan Beulich wrote:
> On 28.11.2023 14:17, Andrew Cooper wrote:
>> On 28/11/2023 1:00 pm, Jan Beulich wrote:
>>> On 28.11.2023 10:46, Federico Serafini wrote:
>>>> Uniform declaration and definition of guest_walk_tables() using
>>>> parameter name "pfec_walk":
>>>> this name highlights the connection with PFEC_* constants and it is
>>>> consistent with the use of the parameter within function body.
>>>> No functional change.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>> I'm curious what other x86 maintainers think. I for one don't like this,
>>> but not enough to object if others are happy. That said, there was earlier
>>> discussion (and perhaps even a patch), yet without a reference I don't
>>> think I can locate this among all the Misra bits and pieces.
>>
>> I looked at this and wanted a bit of time to think.
>>
>> Sadly, this code is half way through some cleanup, which started before
>> speculation and will continue in my copious free time.
>>
>> It's wrong to be passing PFEC_* constants, and that's why I renamed pfec
>> -> walk the last time I was fixing security bugs here  (indeed, passing
>> the wrong constant here *was* the security issue).  I missed the
>> prototype while fixing the implementation.
>>
>> At some point, PFEC_* will no longer be passed in.
>>
>> Therefore I'd far rather this was a one-line change for the declaration
>> changing pfec -> walk.
> 
> So that was what Federico originally had. Did you see my response at
> https://lists.xenproject.org/archives/html/xen-devel/2023-07/msg00122.html ?
> While I certainly agree with your plans (as far as I understand them),
> doing as you suggest would make it harder to spot what values are correct
> to pass to the function today. With a suitable new set of constants and
> perhaps even a proper typedef, such confusion would likely not arise.
Thanks to both for the information.

I take this opportunity to inform that we are really close to the end
with Rule 8.3 for x86, this is the situation:
- do_multicall(), Stefano sent a patch;
- guest_walk_tables(), Andrew will take care of it;
- xenmem_add_to_physmap_one(), this is the last one.

For the latter, I see you (x86) share the declaration with ARM,
where "gfn" is used for the last parameter instead of "gpfn".
Do you agree in changing the name in the definition from "gpfn"
to "gfn"?
If you agree, do you have any suggestions on how to rename
the local variable "gfn"?
Following your suggestions, I can do the renaming in two
steps to prevent bad things to happening.

-- 
Federico Serafini, M.Sc.

Software Engineer, BUGSENG (http://bugseng.com)

