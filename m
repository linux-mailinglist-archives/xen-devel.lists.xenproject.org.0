Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A015784CA
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 16:07:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369839.601382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDROh-0006gx-L7; Mon, 18 Jul 2022 14:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369839.601382; Mon, 18 Jul 2022 14:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDROh-0006eL-IE; Mon, 18 Jul 2022 14:06:55 +0000
Received: by outflank-mailman (input) for mailman id 369839;
 Mon, 18 Jul 2022 14:06:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oDROf-0006e6-FL
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 14:06:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDROf-0008DC-3q; Mon, 18 Jul 2022 14:06:53 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.237.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDROe-0003pW-UF; Mon, 18 Jul 2022 14:06:53 +0000
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
	bh=xmahiAjJq7OYe90xJYuKF3N/m/MMwNbtWIdoIRVkUnw=; b=i+qr1YfpFFudD5omd/y0PoKGbe
	PdeVEfyCD0lp8LlvVl9vSmskqYyNpzwZ8PF3aKcLMqPyoh/XGN5OG3mZ46H98Jh9Vk/P+JugoPGHz
	7CP8OnxoH96PM6fI0Lhkw8/o89lBuedD7l9m9rZXZkVNulFB8kjyvTIZAhYmLN5/Nn00=;
Message-ID: <8c4fd536-e581-b7d5-51b7-e9a65602e6da@xen.org>
Date: Mon, 18 Jul 2022 15:06:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 4/7] xen/arm: mm: Add more ASSERT() in {destroy,
 modify}_xen_mappings()
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20220624091146.35716-1-julien@xen.org>
 <20220624091146.35716-5-julien@xen.org>
 <5CD19BFD-62C6-4409-A5A9-675D8F5FF795@arm.com>
 <8c6a788c-ccb9-fc5c-fdf6-870540eed722@xen.org>
 <48d5cdc0-3937-a5f5-5c0e-a0eee90342f3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <48d5cdc0-3937-a5f5-5c0e-a0eee90342f3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 18/07/2022 09:47, Jan Beulich wrote:
> On 16.07.2022 16:38, Julien Grall wrote:
>> On 04/07/2022 13:35, Bertrand Marquis wrote:
>>>> On 24 Jun 2022, at 10:11, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> Both destroy_xen_mappings() and modify_xen_mappings() will take in
>>>> parameter a range [start, end[. Both end should be page aligned.
>>>>
>>>> Add extra ASSERT() to ensure start and end are page aligned. Take the
>>>> opportunity to rename 'v' to 's' to be consistent with the other helper.
>>>>
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> With the prototype updated in mm.h as suggested by Michal:
>>
>> Done. I will send a new version shortly.
> 
> I notice you had applied and then reverted this, with the revert saying
> an x86 ack was missing. I don't see any need for an x86 ack here though,
> so I'm puzzled ...

Sorry, I am not sure why I thought this needed an x86 ack. I will 
(re-)commit it shortly.

Cheers,

-- 
Julien Grall

