Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE32339245
	for <lists+xen-devel@lfdr.de>; Fri, 12 Mar 2021 16:50:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97210.184545 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKk2h-0001bO-GH; Fri, 12 Mar 2021 15:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97210.184545; Fri, 12 Mar 2021 15:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lKk2h-0001az-Cx; Fri, 12 Mar 2021 15:49:35 +0000
Received: by outflank-mailman (input) for mailman id 97210;
 Fri, 12 Mar 2021 15:49:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F/Rg=IK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lKk2g-0001au-4Q
 for xen-devel@lists.xenproject.org; Fri, 12 Mar 2021 15:49:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d94ff4cd-1462-4026-9989-73fc7b2d8104;
 Fri, 12 Mar 2021 15:49:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A45DB123;
 Fri, 12 Mar 2021 15:49:32 +0000 (UTC)
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
X-Inumbo-ID: d94ff4cd-1462-4026-9989-73fc7b2d8104
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615564172; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8/XB+mDpG3c4DHIZyhXeJDdEhhLiKHV+nd4VlhMdsPQ=;
	b=lvCaN30LK5uJ1G+bP4fEb84GR1PaoeLZYKZCIRmQUJhszTadPEsBE5VRHN5fZpBwLT3Gz5
	+iDXGfe23dlCIlFsn5yTp0ihlA1SVLF0dJpuK/Fl6Vjch32XMzg9F0IxjxRfwSg6auOyP7
	7SFBKu0wMGa3uFq/DDplV93KJQaI6+I=
Subject: Re: [PATCH] xen: fix for_each_cpu when NR_CPUS=1
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Dario Faggioli <dfaggioli@suse.com>
References: <161545564302.24868.14477928469038686899.stgit@Wayrath>
 <24651.29866.263648.422601@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f007ec2c-7464-c744-27bf-875d0cbc9876@suse.com>
Date: Fri, 12 Mar 2021 16:49:33 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <24651.29866.263648.422601@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.03.2021 15:03, Ian Jackson wrote:
> Dario Faggioli writes ("[PATCH] xen: fix for_each_cpu when NR_CPUS=1"):
>> -#if NR_CPUS > 1
>>  #define for_each_cpu(cpu, mask)			\
>>  	for ((cpu) = cpumask_first(mask);	\
> 
> Just a thought: does cpumask_first work on an empty mask ?

I'm sure it does, yes - it'll return a value >= nr_cpu_ids in
this case. If it didn't work, NR_CPUS > 1 would also be badly
affected.

Jan

