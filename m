Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBA5742DB6
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 21:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557051.870064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExSv-00081f-IW; Thu, 29 Jun 2023 19:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557051.870064; Thu, 29 Jun 2023 19:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qExSv-0007zW-Fr; Thu, 29 Jun 2023 19:38:05 +0000
Received: by outflank-mailman (input) for mailman id 557051;
 Thu, 29 Jun 2023 19:38:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qExSt-0007zO-VQ
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 19:38:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExSs-0005j7-N1; Thu, 29 Jun 2023 19:38:02 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qExSs-00075C-Gj; Thu, 29 Jun 2023 19:38:02 +0000
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
	bh=IHHW2BNkv6xCEimXakHA4bCvkNo8hXTkGpUnArOjJy0=; b=eQfsk0lYA66YYQycyk+BEcjHZ2
	OgW9lXRPJTzmkwAxWM2ecQHxCwIuuU1zXyFi2lDFgVOoPpCXurTYuABe2quJXgO7FUbpN8iFq1fHW
	4JyTv8w3a0U9wVgr2XDjlE9cVpFivxdMgNBD0oHnkBZUdAONKa2b+VcgH7JqQWCiFT8E=;
Message-ID: <5a894884-c8a1-ab74-d82a-0a177cbdf201@xen.org>
Date: Thu, 29 Jun 2023 20:38:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v3 1/3] xen/arch/arm: fix violations of MISRA C:2012
 Rule 3.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 "michal.orzel@amd.com" <michal.orzel@amd.com>,
 "xenia.ragiadakou@amd.com" <xenia.ragiadakou@amd.com>,
 "ayan.kumar.halder@amd.com" <ayan.kumar.halder@amd.com>,
 "consulting@bugseng.com" <consulting@bugseng.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1688032865.git.nicola.vetrini@bugseng.com>
 <7996a8bb62e62076d48bdf289e37352bb5e43b52.1688032865.git.nicola.vetrini@bugseng.com>
 <5FD86C4C-3BD6-4ED3-A910-683DCC86613D@arm.com>
 <alpine.DEB.2.22.394.2306291211060.3936094@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2306291211060.3936094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 29/06/2023 20:11, Stefano Stabellini wrote:
> On Thu, 29 Jun 2023, Luca Fancellu wrote:
>>> On 29 Jun 2023, at 11:06, Nicola Vetrini <nicola.vetrini@bugseng.com> wrote:
>>>
>>> In the files `xen/arch/arm/include/asm/arm(32|64)/flushtlb.h' there are a
>>> few occurrences of nested '//' character sequences inside C-style comment
>>> blocks, which violate Rule 3.1. The patch aims to resolve those by changing
>>> the inner comments to arm asm comments, delimited by ';' instead.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Can I suggest another commit title:
>> “xen/arm: tlbflush: fix violations of MISRA C:2012 Rule 3.1"
>>
>> Sometimes when I am not sure on how to deal with prefixes, I check to the git
>> history of the line I am changing, for these lines there was a commit from
>> Julien using these prefixes. I’m using vs code with GitLens extension, that
>> ease a lot this kind of checks.
>>
>> Apart from that, the changes looks good to me:
>>
>> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> 
> With Luca's suggestion (can be done on commit):
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

I have committed this patch.

Patch #2 requires an ack from Rahul/Bertrand.

Cheers,

-- 
Julien Grall

