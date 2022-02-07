Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDB54AC7C2
	for <lists+xen-devel@lfdr.de>; Mon,  7 Feb 2022 18:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.267325.461059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH81R-0006bI-W3; Mon, 07 Feb 2022 17:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 267325.461059; Mon, 07 Feb 2022 17:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nH81R-0006Yu-RZ; Mon, 07 Feb 2022 17:41:53 +0000
Received: by outflank-mailman (input) for mailman id 267325;
 Mon, 07 Feb 2022 17:41:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nH81R-0006Yo-87
 for xen-devel@lists.xenproject.org; Mon, 07 Feb 2022 17:41:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH81L-0000h4-TF; Mon, 07 Feb 2022 17:41:47 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226] helo=[10.85.34.134])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nH81L-0006Nh-M9; Mon, 07 Feb 2022 17:41:47 +0000
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
	bh=7ut4eDQhFUpXJ39YNWdkNKE95R/eFzuGjwWnxKStmNA=; b=OxP7Y2zDmXz2GjWXhHxDI7tooF
	+STC7ivxfPa92cjRcQCJmScygEyR1fNZ7HeOXR5qeFSM38OvxOep9oOkYCcfl/Zr0By6Yk6aC3t+V
	ahuELoLhzlr12ftx1RwW9dM6UiRYG0xfwKHA0REptXdyjUMwNo9mRpgjmYNarlf/op+I=;
Message-ID: <ef4f77d7-2ad7-998e-c32b-534fdbc64e7f@xen.org>
Date: Mon, 7 Feb 2022 17:41:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
To: Oleksandr <olekstysh@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a7a905fe-3feb-507a-7ce4-ed7dce78de86@suse.com>
 <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aeba1af9-8386-3bca-dfbd-1c9110ae09de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Sorry for the late reply.

On 06/01/2022 16:30, Oleksandr wrote:

So I agree with Jan that the name should be adjusted if it stays where 
it is.

That said, I would actually prefer the adjustment in alloc_heap_pages(). 
It is one less assignment per page and I don't expect any issue with 
setting the bits to INVALID_GFN everywhere in the future on Arm.

Note that you would also need to update acquire_staticmem_pages().

Cheers,

-- 
Julien Grall

