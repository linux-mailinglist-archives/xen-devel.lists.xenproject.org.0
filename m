Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D160A6228E8
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 11:47:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440847.695068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osibj-0001zR-Bw; Wed, 09 Nov 2022 10:46:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440847.695068; Wed, 09 Nov 2022 10:46:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osibj-0001wc-8D; Wed, 09 Nov 2022 10:46:59 +0000
Received: by outflank-mailman (input) for mailman id 440847;
 Wed, 09 Nov 2022 10:46:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1osibh-0001wW-Hg
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 10:46:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osibg-0002ag-Mq; Wed, 09 Nov 2022 10:46:56 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.30.147]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1osibg-0004rz-Fj; Wed, 09 Nov 2022 10:46:56 +0000
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
	bh=zYl8ZBhqmdBhzZINfxX2qs1SGsEN98BDu/mYqyRJTsA=; b=iyxKp8APuL4LNSI+IlUmBqstsx
	HfSEow6nw5evZNlPHRSqU/9V/AX+4GZ6vPdDK4O/kCdkCOkseOBNWmhXHCinmaHARsMCvuOE/2d76
	+l+rspBuLgHkU+VUwsux66C40ESJ6Gj/pvMois7A6JKA/0EWUyhsb2r5Qty8wWpShkm8=;
Message-ID: <10204661-e985-ef5e-b7a7-820e2dbba021@xen.org>
Date: Wed, 9 Nov 2022 10:46:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
 <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
 <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>
 <90878b0e-c40e-e4cc-e423-c514a72ede7f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <90878b0e-c40e-e4cc-e423-c514a72ede7f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 08/11/2022 07:54, Juergen Gross wrote:
> On 07.11.22 19:33, Julien Grall wrote:
>>
>>
>> On 07/11/2022 07:54, Juergen Gross wrote:
>>> On 06.11.22 22:18, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 01/11/2022 15:28, Juergen Gross wrote:
>>>>> When a domain has been recognized to have stopped, remove all its
>>>>> registered watches. This avoids sending watch events to the dead 
>>>>> domain
>>>>> when all the nodes related to it are being removed by the Xen tools.
>>>>
>>>>  From my understanding, shutdown doesn't mean dead. It may be used 
>>>> during migration (or snapshotting), where we don't want to touch the 
>>>> state in case of a cancellation (or resume).
>>>>
>>>> For instance, see the command XS_RESUME which will clear 
>>>> domain->shutdown.
>>>
>>> Oh, good catch!
>>>
>>> I need to additionally check the "shutdown reason". I can remove the
>>> watches only in case of the reason not having been "suspend".
>>
>> This is quite fragile because we may add new shutdown code in the 
>> future that could resume.
>>
>> I think it would be better to only delete the watches if the domain is 
>> effectively dying (I don't think it can come back from that state)
> 
> This is how it is done today.

Not really. dominfo.dying is only set if the domain is dead (i.e. 
DOMDYING_dead). This is happening *after* everything has been 
relinquished. So this is quite late compare to what you seem to want.

> 
> The domain's Xenstore entries are removed before the domain is being
> destroyed.
Do you mean before domain_kill() is called? If so, maybe we should call 
domain_kill() before hand.

The other alternative, would be to notify the Xenstored that domain is 
never going to come back.

Cheers,

-- 
Julien Grall

