Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DEABE4AC813
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 19:00:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267344.461082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH8Ig-0008IR-O0; Mon, 07 Feb 2022 17:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267344.461082; Mon, 07 Feb 2022 17:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH8Ig-0008Gc-Kn; Mon, 07 Feb 2022 17:59:42 +0000
Received: by outflank-mailman (input) for mailman id 267344;
 Mon, 07 Feb 2022 17:59:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nH8If-0008GS-AA
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 17:59:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH8Ia-00010T-Cu; Mon, 07 Feb 2022 17:59:36 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH8Ia-0007y3-6c; Mon, 07 Feb 2022 17:59:36 +0000
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
	bh=AavZM4+nCYf+hhVDj31Q3ZFwyC5BD6Mtnm1gpxv4Wd4=; b=c+5v4bKH5tCMvMLeieX0hgMsni
	v6m/C1H0+myKjMMWSmDOibqrtY5qiVpjYiUoQThZuTRUpcRn4QgMRXK1ecrc+jztecG9vd/gRNHp8
	hT8+4GL1j2WjcvUsGp4Nt+OtaLqHIPQyIhjurGB5kA/0zd7jpb2rpSENlZkRL0XNc9W0=;
Message-ID: <da4fc5cc-d80e-b4d6-7c96-0f9eb47a9304@xen.org>
Date: Mon, 7 Feb 2022 17:59:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
 <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
 <ef4f77d7-2ad7-998e-c32b-534fdbc64e7f@xen.org>
 <46822a8c-998b-6ebb-5e2a-c9df5f7650e9@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <46822a8c-998b-6ebb-5e2a-c9df5f7650e9@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/02/2022 17:58, Oleksandr Tyshchenko wrote:
> 
> On 07.02.22 19:41, Julien Grall wrote:
>> On 06/01/2022 16:30, Oleksandr wrote:
>>
>> So I agree with Jan that the name should be adjusted if it stays where
>> it is.
>>
>> That said, I would actually prefer the adjustment in
>> alloc_heap_pages(). It is one less assignment per page and I don't
>> expect any issue with setting the bits to INVALID_GFN everywhere in
>> the future on Arm.
> 
> 
> Sorry I lost the context. To clarify, are you speaking about what I
> proposed at [1]?

That's correct.

Cheers,

-- 
Julien Grall

