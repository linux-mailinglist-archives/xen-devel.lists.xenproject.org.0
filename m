Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C262C577F4F
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:05:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369487.600928 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNd5-0007Ti-EO; Mon, 18 Jul 2022 10:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369487.600928; Mon, 18 Jul 2022 10:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNd5-0007Rr-BZ; Mon, 18 Jul 2022 10:05:31 +0000
Received: by outflank-mailman (input) for mailman id 369487;
 Mon, 18 Jul 2022 10:05:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oDNd3-0007PM-Uz
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:05:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDNd2-0003fw-Rd; Mon, 18 Jul 2022 10:05:28 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.7.237.21])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oDNd2-0008Uv-Le; Mon, 18 Jul 2022 10:05:28 +0000
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
	bh=dV+jasoKk3gC8wKgROH3pnd7QENC8d8zIdRedI6098A=; b=0VfQ4lflbavOMvCoL/aoFMI0xh
	CnxecszZ+Pk69NPSaj+kCnhavV1a8l/2p++A71bNFDSgWHnN9gaV+iD02evRaWsCLV7Sl6ngwUoNz
	pqdl4ljWyxlsopUd1NJWYFRnXQ9dMoE6Qgh8quXRgZCMGbyg1mNNo6gi7LJEpC1geSZ8=;
Message-ID: <3c46a848-eac9-3dcb-80ae-3ceb7ea92402@xen.org>
Date: Mon, 18 Jul 2022 11:05:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/3] xen/heap: Split init_heap_pages() in two
To: Wei Chen <Wei.Chen@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220715170312.13931-1-julien@xen.org>
 <20220715170312.13931-3-julien@xen.org>
 <b7b1b735-e16e-2bf5-e634-e56291dab61b@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b7b1b735-e16e-2bf5-e634-e56291dab61b@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/07/2022 09:18, Wei Chen wrote:
>>   static void init_heap_pages(
>>       struct page_info *pg, unsigned long nr_pages)
>>   {
>>       unsigned long i;
>> -    bool idle_scrub = false;
>> +    bool need_scrub = scrub_debug;
>>
> 
> You have changed idle_scrub to need_scrub, but haven't mentioned this
> in commit log, and I also haven't found related discussion in v1. I
> am very clear about this change.

The meaning/use of the variable is now different. Before this patch, the 
variable was only indicating whether idle scrub was enabled (this is 
configurable by the admin). This was then or-ed with  'scrub_debug' when 
calling free_heap_pages().

With this patch, we now store the result of the or-ed in the local variable.

This is not something I felt was necessary to mention in the commit message.

Cheers,

-- 
Julien Grall

