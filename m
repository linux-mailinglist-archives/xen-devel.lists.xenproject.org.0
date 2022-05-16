Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24AD2528BD2
	for <lists+xen-devel@lfdr.de>; Mon, 16 May 2022 19:21:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.330204.553548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeOs-00074K-0j; Mon, 16 May 2022 17:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 330204.553548; Mon, 16 May 2022 17:20:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nqeOr-00071Z-TC; Mon, 16 May 2022 17:20:53 +0000
Received: by outflank-mailman (input) for mailman id 330204;
 Mon, 16 May 2022 17:20:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nqeOq-00071T-9s
 for xen-devel@lists.xenproject.org; Mon, 16 May 2022 17:20:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeOp-0007IP-Vh; Mon, 16 May 2022 17:20:51 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.22.38]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nqeOp-0006hK-Ps; Mon, 16 May 2022 17:20:51 +0000
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
	bh=P3CVErx1CBYC12HZ5XyQN2UokAuMQKARiPsAhfrma0w=; b=Ab3csFuN3QDGD7LY9Dx5o7sVVa
	Hm7cHbIv4kpabapMDM/VswTCSOaToXJVN1culh2Nn155kNYoedolc2PMt/I6WY9eNpAVIb1AtKHYm
	DizDn1Z4N5tg3wdsfD4fWk8dF1XPA1xj5EH1DDm9Rbz6sbAQzTtnitfEtheSY02uypkQ=;
Message-ID: <51ad75c6-2de3-1602-d2ac-b0193ed922f6@xen.org>
Date: Mon, 16 May 2022 18:20:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v2] xen/arm: Avoid overflow using MIDR_IMPLEMENTOR_MASK
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220505115906.380416-1-michal.orzel@arm.com>
 <YnO/bIw/bG8hMNx+@arm.com> <a96bc62d-8bf8-1507-5838-8e29297bc775@arm.com>
 <e790fa9f-6b13-112f-6849-24fc46a91a89@xen.org> <YnoogHgRMzex3pA3@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <YnoogHgRMzex3pA3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Catalin,

On 10/05/2022 09:55, Catalin Marinas wrote:
> On Tue, May 10, 2022 at 09:27:29AM +0100, Julien Grall wrote:
>> Hi,
>>
>> On 10/05/2022 07:49, Michal Orzel wrote:
>>> On 05.05.2022 14:13, Catalin Marinas wrote:
>>>> On Thu, May 05, 2022 at 01:59:06PM +0200, Michal Orzel wrote:
>>>>> Value of macro MIDR_IMPLEMENTOR_MASK exceeds the range of integer
>>>>> and can lead to overflow. Currently there is no issue as it is used
>>>>> in an expression implicitly casted to u32 in MIDR_IS_CPU_MODEL_RANGE.
>>>>> To avoid possible problems, fix the macro.
>>>>>
>>>>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
>>>>> Link: https://lore.kernel.org/r/20220426070603.56031-1-michal.orzel@arm.com
>>>>> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
>>>>> Origin: git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git (48e6f22e25a4)
>>>>> ---
>>>>> Changes since v1:
>>>>> - add Origin tag as the patch was merged in upstream arm64 linux tree
>>>>
>>>> Note that there's always a risk that the commit Id will be changed
>>>> before it hits mainline (Linus' tree).
>>>>
>>>
>>> This commit is now in linux-next:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=48e6f22e25a44e43952db5fbb767dea0c9319cb2
>>> so we can be sure that the SHA will stay unmodified there (and will be the same in Linus' tree).
>>
>> AFAIK, linux-next branch is just a merge of all the maintainers branch and
>> often rewritten. So there are no guarantee a commit id is valid until it
>> reached Linus' tree.
> 
> Indeed. While I try not to rebase it, it may happen occasionally.
> 
>>> Question to maintainers:
>>> Do you want me to update Origin to point to linux-next?
>>
>> So we have a link to the patch and a name. This should be sufficient to find
>> the commit.
>>
>> Therefore, I would simply on top of Origin:
> 
> Yeah, just keep the link to the mailing list. I guess you can drop my
> Singed-off-by as well if it appears to be picked from the list rather
> than the kernel repo. If you want an ack:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

I have done what you suggested and committed. Thanks!

Cheers,

-- 
Julien Grall

