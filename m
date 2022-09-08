Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B08BC5B1B6A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 13:30:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403165.645168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFil-0005wo-R7; Thu, 08 Sep 2022 11:29:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403165.645168; Thu, 08 Sep 2022 11:29:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWFil-0005uq-OE; Thu, 08 Sep 2022 11:29:23 +0000
Received: by outflank-mailman (input) for mailman id 403165;
 Thu, 08 Sep 2022 11:29:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWFik-0005uk-51
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 11:29:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWFij-00066Q-RC; Thu, 08 Sep 2022 11:29:21 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWFij-0005BX-L0; Thu, 08 Sep 2022 11:29:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=Uuj8qJ9EuJsMdUdLBNxhKzue23Br6mdT4hxrOmqVGKo=; b=m5jfV67wJm5i3sGCGM/gpQ6max
	kif/FoVnqlojctazb3tyUaDilUj9cj66rDFhNk6LlKnr0AWOpeV8iJVfzSO7czuRpSbP0yHUWLdr5
	aYYjV7BHvF/2Gc84vrUqoLakD6fMtDlfs+LgwE0oDFH8ydcGbKb5OfxLlo5fXxItqjJ4=;
Message-ID: <57153092-942e-2382-b863-911c7460c43e@xen.org>
Date: Thu, 8 Sep 2022 12:29:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v5] tools/xenstore: add migration stream extensions for
 new features
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220908081552.19889-1-jgross@suse.com>
 <168bd423-aa3a-ead6-4a00-0f540ae3c15f@xen.org>
In-Reply-To: <168bd423-aa3a-ead6-4a00-0f540ae3c15f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08/09/2022 11:12, Julien Grall wrote:
> Hi Juergen,
> 
> On 08/09/2022 09:15, Juergen Gross wrote:
>> Extend the definition of the Xenstore migration stream to cover new
>> features:
>>
>> - per domain features
>> - extended watches (watch depth)
>> - per domain quota
>>
>> Some of those additions (per domain features and extended watches)
>> require bumping the migration stream version to "2", as usage of those
>> features will require to transport mandatory new information in the
>> migration stream.
>>
>> One note regarding the GLOBAL_QUOTA_DATA record: the split of quota
>> between global and per-domain ones is meant to support the possibility
>> to pass on unknown quota settings for newly created domains to other
>> Xenstore instances:
>>
>> Imagine Xenstore A knows about global quota g and domain quota d, while
>> Xenstore B doesn't know both. Initially I'm running Xenstore A on a
>> host, then I'm live-updating to B.
>>
>> B gets the information that g is global, and d is per-domain, but has
>> no other idea what to do with the values of g and d. OTOH it knows that
>> each new domain should get d with the related value, so it can set d
>> for each newly created domain.
>>
>> When B is either downgraded to A again, or a domain is migrated to
>> another host running A, B can add the quota information of d for all
>> domains.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

I have committed it.

Cheers,

-- 
Julien Grall

