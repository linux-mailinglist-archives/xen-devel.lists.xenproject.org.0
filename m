Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E3C78082E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 11:21:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585893.917097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWvfU-0007T2-Ap; Fri, 18 Aug 2023 09:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585893.917097; Fri, 18 Aug 2023 09:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWvfU-0007QP-7N; Fri, 18 Aug 2023 09:21:20 +0000
Received: by outflank-mailman (input) for mailman id 585893;
 Fri, 18 Aug 2023 09:21:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWvfS-0007QJ-El
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 09:21:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWvfP-0004eC-75; Fri, 18 Aug 2023 09:21:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWvfP-00075P-15; Fri, 18 Aug 2023 09:21:15 +0000
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
	bh=a6XTjDpfImIKT+U4vCBdxjejt1utfX8FRUxz2mSr8uU=; b=a8twulTwM4mSa8e4F8oxfzXtYJ
	au98NW2BjSbIDPNlanvuCZyPB2kXxXt3mwAuFeVJ01MmkDIvsbm0zRACOY9uoyVgJiyKbds8Eadxx
	gr8p8IZNjIfnBCISXigjoHfU0tP51VpF+ZQbi3mJbyjZoaUYjYBgeQRAOaXMVCPLYRdo=;
Message-ID: <891eb740-6777-4cad-8bb9-2b1a554b3563@xen.org>
Date: Fri, 18 Aug 2023 10:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] xen/public: arch-arm: All PSR_* defines should be
 unsigned
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-4-julien@xen.org>
 <93ccb2c0-fa2c-3e84-35bf-3d86aef7a2bd@suse.com>
 <2b86f83a-6352-4b43-835b-6c56ad8260ba@xen.org>
 <58ecfdf4-c0ce-be56-8686-d6fcf06f9609@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <58ecfdf4-c0ce-be56-8686-d6fcf06f9609@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/08/2023 09:14, Jan Beulich wrote:
> On 18.08.2023 09:39, Julien Grall wrote:
>> On 18/08/2023 07:33, Jan Beulich wrote:
>>> As an aside I wonder why they're here: They look like definitions of
>>> processor registers, which aren't under our (Xen's) control.
>>
>> I agree they are not under Xen's control. However, they are used by the
>> toolstack and IIRC back then they were not available in any other headers.
>>
>> Note that they are only available by the tools and the hypervisor (see
>> #ifdef above).
> 
> Yes, I did notice that (or else I would have used stronger wording).
> 
>>> I ask in
>>> part because the presence of such constants may then be taken as
>>> justification to add similar things in new ports. Yet such definitions
>>> shouldn't be put here.
>>
>>   From my understanding we are using the public headers to provide
>> macros/defines that are used by both the toolstack and the hypervisor.
>> If they are not meant to be exposed to the guest, then they will be
>> protected with "#if defined(__XEN__) || defined(__XEN_TOOLS__)".
>>
>> I think we are in a similar situation here. So it is not clear where
>> they should be put if we need to share them between the hypervisor and
>> the toolstack.
> 
> On x86 we simply arrange for certain hypervisor headers to be re-usable
> from the toolstack. See in particular arch/x86/include/asm/x86-*.h. And
> of course everything under include/xen/lib/x86/, but those are our own
> definitions, not ones meant to solely express relevant hw spec aspects.

Even if they are defined by the HW, we still need them to easily create 
some hypercalls field.

If we are planning to have a stable toolstack ABI (as Juergen 
suggested), then I would find a bit odd that onewould need to include 
lib/ (or provide their own header) in order to update the fields.

Anyway, I am not planning to do any re-ordering anytime soon for the 
public. But I would be happy to take part of the discussion if there are 
a general agreement to split further and someone wants to write patches.

Cheers,

-- 
Julien Grall

