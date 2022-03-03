Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDC44CC6C9
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 21:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283736.482843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPrhI-0002Cl-Qj; Thu, 03 Mar 2022 20:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283736.482843; Thu, 03 Mar 2022 20:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPrhI-0002Av-Mo; Thu, 03 Mar 2022 20:05:12 +0000
Received: by outflank-mailman (input) for mailman id 283736;
 Thu, 03 Mar 2022 20:05:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPrhH-0002Ap-Fl
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 20:05:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPrhD-0005Aj-CL; Thu, 03 Mar 2022 20:05:07 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPrhD-0004W1-6r; Thu, 03 Mar 2022 20:05:07 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=z+df0/2OOWm7L2qgArxR2JZjrOAWg2HWJArVvtEGVtc=; b=mFhWXUirf00iLFDRL9ZIZoj4oI
	VIWMvLlvzgnxAUj65ltbvq2yZDXQEnLRrieP+Q4EO8AS97H1do7xlNHZBwCQBzmCzDfsslX87LXIa
	oRVVXeX70ap1htSnElVjU8BMfHrWpJmKNCBY0BzpXxmfWWB/CcUep7/Ofyx+mj5i9ErA=;
Message-ID: <4029db6a-3693-ce70-2f7e-7978284ceed9@xen.org>
Date: Thu, 3 Mar 2022 20:05:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <03851bd4-9202-385f-d991-c9720185c946@suse.com>
 <1a4bef81-d29e-97ae-098b-d1e582e5af28@suse.com>
 <915C7BBD-AD0C-42B8-8459-C3BFDCDC0A11@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] x86: fold sections in final binaries
In-Reply-To: <915C7BBD-AD0C-42B8-8459-C3BFDCDC0A11@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 01/03/2022 13:30, Bertrand Marquis wrote:
>> On 1 Mar 2022, at 08:58, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 01.03.2022 09:55, Jan Beulich wrote:
>>> Especially when linking a PE binary (xen.efi), standalone output
>>> sections are expensive: Often the linker will align the subsequent one
>>> on the section alignment boundary (2Mb) when the linker script doesn't
>>> otherwise place it. (I haven't been able to derive from observed
>>> behavior under what conditions it would not do so.)
>>>
>>> With gcov enabled (and with gcc11) I'm observing enough sections that,
>>> as of quite recently, the resulting image doesn't fit in 16Mb anymore,
>>> failing the final ASSERT() in the linker script. (That assertion is
>>> slated to go away, but that's a separate change.)
>>>
>>> Any destructor related sections can be discarded, as we never "exit"
>>> the hypervisor. This includes .text.exit, which is referenced from
>>> .dtors.*. Constructor related sections need to all be taken care of, not
>>> just those with historically used names: .ctors.* and .text.startup is
>>> what gcc11 populates. While there re-arrange ordering / sorting to match
>>> that used by the linker provided scripts.
>>>
>>> Finally, for xen.efi only, also discard .note.gnu.*. These are
>>> meaningless in a PE binary. Quite likely, while not meaningless there,
>>> the section is also of no use in ELF, but keep it there for now.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> Some of this will likely want mirroring to Arm as well, even if xen.efi
>> there isn't produced by the linker. Sections are better properly folded
>> even for ELF, and constructors not ending up in [__ctors_start,__ctors_end)
>> can surely not do any good.
> 
> I fully agree with that and it would make sense to do both changes together to
> avoid differences between x86 and arm unless required.
> 
> Right now our discard section on arm is a lot shorter and I do not see why we
> would need any of the sections that are discarded on x86.

Me neither.

> 
> As this needs testing and checking I do not think it makes sense for you to do
> that right now.
> @Stefano and Julien: I am ok to create myself a task to sync with x86 in the
>   next weeks/months, what do you think ?

I haven't looked in details the exact difference between two linker 
scripts. After the sync, I would expect to be mostly similar.

We also have the RISCv and possibly soon PowerPC. So, I would consider 
to consolidate the linker scripts if possible. This would help to keep 
them in sync.

Anyway, as discussed on IRC, let's start with updating the Arm linker 
scripts. We can then look at the differences.

Cheers,

-- 
Julien Grall

