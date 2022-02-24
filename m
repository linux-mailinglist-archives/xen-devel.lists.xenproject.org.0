Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D184C2EC0
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 15:56:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278343.475549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFXh-0002ya-Ed; Thu, 24 Feb 2022 14:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278343.475549; Thu, 24 Feb 2022 14:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNFXh-0002wX-BT; Thu, 24 Feb 2022 14:56:29 +0000
Received: by outflank-mailman (input) for mailman id 278343;
 Thu, 24 Feb 2022 14:56:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNFXg-0002wR-29
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 14:56:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFXd-0007sA-AV; Thu, 24 Feb 2022 14:56:25 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225] helo=[10.7.239.15])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNFXd-00007b-4S; Thu, 24 Feb 2022 14:56:25 +0000
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
	bh=6u5CC6sXY7MiFuExm3CiWvMNcdHodeFsJMFX7cjkLFk=; b=yZy55ahaUKtCNviYayfmyj8I7V
	X3EZd9QTsi4+J/+obvl3dLb3Ayh/Oh9OLxRR5K9BzumcmM+qwIqZFZyiTw1FrOfEtcnLUJu0kV/f/
	6pA0midppevoyR1lQIlnU2jUQPHB06w2Xiq8sdLJ3EnNph8CbUAHDFCupoNAh1i09DLc=;
Message-ID: <2a041673-c9ab-2699-a080-b170acc8df25@xen.org>
Date: Thu, 24 Feb 2022 14:56:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH] xen/mm: Remove always true ASSERT() in free_heap_pages()
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220223183831.5951-1-julien@xen.org>
 <6befff41-528d-015c-3c41-f643c0b98530@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6befff41-528d-015c-3c41-f643c0b98530@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 24/02/2022 08:27, Jan Beulich wrote:
> On 23.02.2022 19:38, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> free_heap_pages() has an ASSERT() checking that node is >= 0. However
>> node is defined as an unsigned int. So it cannot be negative.
>>
>> Therefore remove the check as it will always be true.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> I have looked at the history. AFAICT, node has always be defined
>> as unsigned int. So the ASSERT() may have never been useful (?).
> 
> Commit f0738d2d3f81 introduced "node" as a local variable of type
> "int". Along with this commit f1c6ac275100 introduced ia64's
> paddr_to_nid() (backing phys_to_nid()), which was able to return -1.
> Hence at the time the assertion fulfilled a purpose. I should have
> dropped it in bd3e1195d694.

Thanks for the information. It looks like I need to brush my git-blame 
skill :).

> 
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks!

Cheers,

-- 
Julien Grall

