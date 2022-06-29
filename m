Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8463E55FDD0
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 12:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.357814.586638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VJG-0000Zm-1W; Wed, 29 Jun 2022 10:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 357814.586638; Wed, 29 Jun 2022 10:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6VJF-0000XT-V6; Wed, 29 Jun 2022 10:52:37 +0000
Received: by outflank-mailman (input) for mailman id 357814;
 Wed, 29 Jun 2022 10:52:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o6VJF-0000XG-0p
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 10:52:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6VJE-0000Xp-0c; Wed, 29 Jun 2022 10:52:36 +0000
Received: from [54.239.6.187] (helo=[192.168.9.41])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o6VJD-0004t5-Qb; Wed, 29 Jun 2022 10:52:35 +0000
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
	bh=kCFwRr7yce9vJdVsRE5LV2dkcIbYhc6BbKQwIfSdxuI=; b=ETZWNmUL4jZxxRRrEYn3bd03c2
	WuzryDlhU86NjmAoGmxX8DwlJ0SBSlGPkqJD9l336+CGncR8G4ceYEDPUjbcxISEhOKK0/CwafzDo
	78o/x2qU2HpbCA6UhgYylMZwnYfL3WHti3f9BrOTepk+Ur4t/r3E5eUn3pzF7uw+bYSM=;
Message-ID: <fdaa154e-95f1-6f80-6f27-f94aaaf1f77b@xen.org>
Date: Wed, 29 Jun 2022 11:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH 3/7] xen/common: Use unsigned int instead of plain
 unsigned
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
References: <20220627131543.410971-1-michal.orzel@arm.com>
 <20220627131543.410971-4-michal.orzel@arm.com>
 <4ee1fbaf-9d31-d28e-cb8d-f330c6a1923f@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <4ee1fbaf-9d31-d28e-cb8d-f330c6a1923f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/06/2022 11:46, Michal Orzel wrote:
> On 27.06.2022 15:15, Michal Orzel wrote:
>> This is just for the style and consistency reasons as the former is
>> being used more often than the latter.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> 
> It looks like this change was forgotten when merging other patches from the series.

I noticed the same and was going to commit it yesterday night. However, 
it is technically missing an ack/review for trace.c (this is maintained 
by George).

The change is small and likely not controversial. So I guess we could do 
without George's review. That said, I would like to give him a chance to 
answer (I will commit it on Friday if there are no answer).

Cheers,

-- 
Julien Grall

