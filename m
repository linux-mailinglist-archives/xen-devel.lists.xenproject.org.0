Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A1801C28
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 11:11:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646044.1008585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9MxK-0006dD-Pt; Sat, 02 Dec 2023 10:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646044.1008585; Sat, 02 Dec 2023 10:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9MxK-0006a3-Mq; Sat, 02 Dec 2023 10:10:38 +0000
Received: by outflank-mailman (input) for mailman id 646044;
 Sat, 02 Dec 2023 10:10:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r9MxI-0006Zx-Qw
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 10:10:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9MxF-0000mW-MS; Sat, 02 Dec 2023 10:10:33 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r9MxF-00014O-Fz; Sat, 02 Dec 2023 10:10:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Bz9lCaYWOKxMw+dImV0pKvZu5ZHmKu1Ikro8YfuO9OY=; b=WGi/GKHxm6TdmiJl3AoTsKMiGP
	cvMa8C/v+cAZB3MR6AqiPc0loL+N7+E5kTJQ6m7l8RlmlC+/XkW9l0RAP9+O4lIwP2MR18ZyXCHT7
	VYje2McH8/QJnvhybj7Ie1UAtQ9rpEr3SkgPnsROi7L6kS79/pMtr/s1hf/k6vrwhvUI=;
Message-ID: <67299896-49cb-4d71-aa93-71a2f18b2d0e@xen.org>
Date: Sat, 2 Dec 2023 10:10:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 7/7] xen/page_alloc: deviate first_valid_mfn for MISRA
 C Rule 8.4
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 bertrand.marquis@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1701270983.git.nicola.vetrini@bugseng.com>
 <1ee69d2f0b9e9a704bf869e2b2700f88a8069343.1701270983.git.nicola.vetrini@bugseng.com>
 <alpine.DEB.2.22.394.2311301847300.110490@ubuntu-linux-20-04-desktop>
 <21956d5b-08ad-45ac-96ff-22fe7d54ec60@suse.com>
 <alpine.DEB.2.22.394.2312011901450.110490@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312011901450.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/12/2023 04:03, Stefano Stabellini wrote:
> On Fri, 1 Dec 2023, Jan Beulich wrote:
>> On 01.12.2023 03:47, Stefano Stabellini wrote:
>>> On Wed, 29 Nov 2023, Nicola Vetrini wrote:
>>>> No functional change.
>>>>
>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> ---
>>>> The preferred way to deviate is to use asmlinkage, but this modification is only
>>>> the consequence of NUMA on ARM (and possibly PPC) being a work in progress.
>>>> As stated in the comment above the textual deviation, first_valid_mfn will
>>>> likely then become static and there would be no need for the comment anymore.
>>>> This works towards having the analysis for this rule clean (i.e. no violations);
>>>> the interest in having a clean rule is that then it could be used to signal
>>>> newly introduced violations by making the analysis job fail.
>>>
>>> Please add this text as part of the commit message. It can be done on
>>> commit.
>>
>> I assume you saw my reply on another of the patches in this series as to
>> asmlinkage use on variables? IOW I think this paragraph would also need
>> adjustment to account for that.
> 
> I was going to ask you about that: reading your reply
> https://marc.info/?l=xen-devel&m=170142048615336 it is not clear to me
> what you are asking or suggesting as next step in regard to asmlinkage
> use on variables.

Regardless what Jan wrote there, I think it would be an abuse to add 
asmlinkage for first_valid_mfn because it is not used by assembly code.

The same goes for the use of SAF-1-safe. This is defined as:

"Functions and variables used only by asm modules do not need to have a 
visible declaration prior to their definition."

Now, regarding the violation itself. AFAIU, this would be a violation 
only on x86 because Arm, PPC, RISC-V will all need the declaration as 
NUMA is not supported. For Arm, we may have NUMA support soon, but I 
doubt this will happen in the next couple of years for the others.

Furthermore, I am sure this is not the only exported variable/function 
which may be used by some archictectures but not others. So I think it 
would be better to declare first_valid_mfn in a common header.

Cheers,

-- 
Julien Grall

