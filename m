Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC0E4C38B3
	for <lists+xen-devel@lfdr.de>; Thu, 24 Feb 2022 23:24:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278650.475984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNMXH-00080K-2m; Thu, 24 Feb 2022 22:24:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278650.475984; Thu, 24 Feb 2022 22:24:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNMXG-0007xs-VM; Thu, 24 Feb 2022 22:24:30 +0000
Received: by outflank-mailman (input) for mailman id 278650;
 Thu, 24 Feb 2022 22:24:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nNMXG-0007xm-10
 for xen-devel@lists.xenproject.org; Thu, 24 Feb 2022 22:24:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNMXF-00082d-OX; Thu, 24 Feb 2022 22:24:29 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nNMXF-0003mu-JC; Thu, 24 Feb 2022 22:24:29 +0000
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
	bh=qTJugUZnT4nVv2+/PF1cBL0sMF506Nh/3pH55iDwan4=; b=CAKGcIWCSVi1C25jhy5JiY4Duy
	7aXbgpdJqftw/rRPp2IX6Scx4l1xzD+V8tkcBbDE81GMG3tKkp5sSEg4WbWfEUH7EQoi4hS7tsnT2
	5H7Y+KnB38kApqP9+ytVO0PYFpQZ+vkraF/V1Lfpk3XETD9QUKgL2kdDaQ4/liunc44c=;
Message-ID: <5dfae695-a59c-6f03-49ee-1903f7d55296@xen.org>
Date: Thu, 24 Feb 2022 22:24:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 02/19] xen/arm: lpae: Use the generic helpers to
 defined the Xen PT helpers
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220221102218.33785-1-julien@xen.org>
 <20220221102218.33785-3-julien@xen.org>
 <2DB6D0E3-E220-47C1-BB01-E4679AFA34EC@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2DB6D0E3-E220-47C1-BB01-E4679AFA34EC@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22/02/2022 15:38, Bertrand Marquis wrote:
> Hi Julien,

Hi Bertrand,

>> On 21 Feb 2022, at 10:22, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, Xen PT helpers are only working with 4KB page granularity
>> and open-code the generic helpers. To allow more flexibility, we can
>> re-use the generic helpers and pass Xen's page granularity
>> (PAGE_SHIFT).
>>
>> As Xen PT helpers are used in both C and assembly, we need to move
>> the generic helpers definition outside of the !__ASSEMBLY__ section.
>>
>> Take the opportunity to prefix LPAE_ENTRIES, LPAE_ENTRIES and
>> LPAE_ENTRIES_MASK with XEN_PT_.
> 
> The list needs to be fixed to be SHIFT, ENTRIES and ENTRY_MASK.

I have fixed it in my tree and will commit it with...

>>
>> Note the aliases for each level are still kept for the time being so we
>> can avoid a massive patch to change all the callers.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> With this fixed:
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Michal's and your's reviewed-by.

Cheers,

-- 
Julien Grall

