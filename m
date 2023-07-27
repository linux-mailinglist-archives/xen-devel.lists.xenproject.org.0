Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F9A765F21
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 00:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571293.894804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP9Gg-00089i-VP; Thu, 27 Jul 2023 22:15:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571293.894804; Thu, 27 Jul 2023 22:15:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP9Gg-00087y-So; Thu, 27 Jul 2023 22:15:34 +0000
Received: by outflank-mailman (input) for mailman id 571293;
 Thu, 27 Jul 2023 22:15:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP9Gf-00087s-IZ
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 22:15:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP9Ga-0001F4-Pu; Thu, 27 Jul 2023 22:15:28 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP9Ga-0003V4-JK; Thu, 27 Jul 2023 22:15:28 +0000
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
	bh=Ac89RsOI6epHm8N86imvKKTEVHhmoqW3rtla8oMxjpw=; b=mxQsbg8bxzoqp2PSBJDSTOZ1Ve
	S+Xh4Sk7GkxtjOnuMQ/GN7RVGJjUOhrJbcjMELEy2rAdqoFTKXjw4yjlVNqo+k2/WgwZyhBrWw8MI
	Il8wrO46aekgxxMYzq2Csmg0lk7ywokTWd9KHwWvQvpvJtuF4dVrP4+trOibX3z84Of8=;
Message-ID: <2ebcadb0-2442-f893-d54c-5e86607cc77d@xen.org>
Date: Thu, 27 Jul 2023 23:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [XEN PATCH v3] xen/spinlock: mechanically rename parameter name
 'debug'
To: Stefano Stabellini <sstabellini@kernel.org>,
 Jan Beulich <jbeulich@suse.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, michal.orzel@amd.com,
 xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <a66f1084686b77b098c5ccf3d0cf5f52980fdf5a.1690317797.git.nicola.vetrini@bugseng.com>
 <11a3ae18-508b-cf08-2803-bc4aaeec7353@suse.com>
 <f424fc5b-6266-3d04-b494-0448fa453b75@bugseng.com>
 <8914bf47-c4ca-4a14-6a92-b5b23ee739a0@suse.com>
 <alpine.DEB.2.22.394.2307261448010.3118466@ubuntu-linux-20-04-desktop>
 <d099b736-22cf-0502-df37-9ae7b14d048a@suse.com>
 <alpine.DEB.2.22.394.2307271233480.3118466@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2307271233480.3118466@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/07/2023 20:35, Stefano Stabellini wrote:
> On Thu, 27 Jul 2023, Jan Beulich wrote:
>> On 26.07.2023 23:49, Stefano Stabellini wrote:
>>> On Wed, 26 Jul 2023, Jan Beulich wrote:
>>>> On 26.07.2023 08:42, Nicola Vetrini wrote:
>>>>> On 26/07/23 08:34, Jan Beulich wrote:
>>>>>> On 25.07.2023 22:45, Nicola Vetrini wrote:
>>>>>>> Rule 5.3 has the following headline:
>>>>>>> "An identifier declared in an inner scope shall not hide an
>>>>>>> identifier declared in an outer scope"
>>>>>>>
>>>>>>> To avoid any confusion resulting from the parameter 'debug'
>>>>>>> hiding the homonymous function declared at
>>>>>>> 'xen/arch/x86/include/asm/processor.h:428'
>>>>>>> the rename of parameters s/debug/lkdbg/ is performed.
>>>>>>>
>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>> ---
>>>>>>> Changes in v2:
>>>>>>> - s/dbg/lkdbg/
>>>>>>> Changes in v3:
>>>>>>> - Added missing renames for consistency
>>>>>>
>>>>>> Hmm, you asked whether to send v3, but then you didn't wait for an
>>>>>> answer. So to repeat what I said there: I'd prefer if we could first
>>>>>> settle whether to rename the conflicting x86 symbol.
>>>>>>
>>>>>
>>>>> Stefano replied asking for a v3 [1] before I had a chance to read your
>>>>> message this morning.
>>>>
>>>> Right, sorry, I spotted his reply only after seeing the v3.
>>>
>>> For what is worth I prefer the current implementation compared to
>>> renaming debug()
>>
>> I don't. My replacement name suggestions were only "just in case"; I
>> don't really like them.
> 
> Understood :-)
> 
> How would you like to proceed?
> 
> 1. we commit this patch as is
> 2. we wait for a third opinion from another maintainer
> 3. we find a new name for the variable
> 4. we change debug() instead
IMO, the name debug() is quite generic and it is not obvious that the 
function is a trap handler. So I think renaming debug() is the right way 
to go.

Cheers,

-- 
Julien Grall

