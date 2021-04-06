Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF820355B43
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 20:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106203.203114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqMu-0006KX-1F; Tue, 06 Apr 2021 18:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106203.203114; Tue, 06 Apr 2021 18:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTqMt-0006K8-Tb; Tue, 06 Apr 2021 18:24:03 +0000
Received: by outflank-mailman (input) for mailman id 106203;
 Tue, 06 Apr 2021 18:24:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lTqMs-0006K3-Qy
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 18:24:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqMs-0004eY-I3; Tue, 06 Apr 2021 18:24:02 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lTqMs-00044a-AW; Tue, 06 Apr 2021 18:24:02 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=BZP3iKi1XbN9l3U4s7ySlAJN4db+rboxQtklMGl8q6c=; b=kkanvdPJenS4f1G1UdMbwhlsdo
	b2KNgGBWOzpH3bz/zsQvgrvkvHQumMwoVx0/zqoBig14QgHMsVfWUdT2bsl/W6JSmtYP3gI4Nfz6f
	TYPnUH7Jyr21OxBwn6/HjvUKz3nzWA2jdoaIFI1TVdbcjYFjFYNLOWUsRij0Gn0V9qiM=;
Subject: Re: [PATCH 02/14] xen/sched: Constify name and opt_name in struct
 scheduler
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, George Dunlap
 <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 xen-devel@lists.xenproject.org
References: <20210405155713.29754-1-julien@xen.org>
 <20210405155713.29754-3-julien@xen.org>
 <5618bed6-a213-d2c9-4cbf-d95cb4dc02b4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <00a75c04-fad1-7061-ac39-a811f442db05@xen.org>
Date: Tue, 6 Apr 2021 19:24:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <5618bed6-a213-d2c9-4cbf-d95cb4dc02b4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 06/04/2021 09:07, Jan Beulich wrote:
> On 05.04.2021 17:57, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Both name and opt_name are pointing to literal string. So mark both of
>> the fields as const.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit ...
> 
>> --- a/xen/common/sched/private.h
>> +++ b/xen/common/sched/private.h
>> @@ -272,8 +272,8 @@ static inline spinlock_t *pcpu_schedule_trylock(unsigned int cpu)
>>   }
>>   
>>   struct scheduler {
>> -    char *name;             /* full name for this scheduler      */
>> -    char *opt_name;         /* option name for this scheduler    */
>> +    const char *name;       /* full name for this scheduler      */
>> +    const char *opt_name;   /* option name for this scheduler    */
> 
> ... I'd like to suggest considering at least the latter to become
> an array instead of a pointer - there's little point wasting 8
> bytes of storage for the pointer when the strings pointed to are
> all at most 9 bytes long (right now; I don't expect much longer
> ones to appear).

I have tried this simple/dumb change on top of my patch:

diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
index a870320146ef..ab2236874217 100644
--- a/xen/common/sched/private.h
+++ b/xen/common/sched/private.h
@@ -273,7 +273,7 @@ static inline spinlock_t 
*pcpu_schedule_trylock(unsigned int cpu)

  struct scheduler {
      const char *name;       /* full name for this scheduler      */
-    const char *opt_name;   /* option name for this scheduler    */
+    const char opt_name[9]; /* option name for this scheduler    */
      unsigned int sched_id;  /* ID for this scheduler             */
      void *sched_data;       /* global data pointer               */
      struct cpupool *cpupool;/* points to this scheduler's pool   */

GCC will throw an error:

core.c: In function ‘scheduler_init’:
core.c:2987:17: error: assignment of read-only variable ‘ops’
              ops = *schedulers[i];
                  ^
core.c:2997:21: error: assignment of read-only variable ‘ops’
                  ops = *schedulers[i];
                      ^

I don't particularly want to drop the const. So the code would probably 
need some rework.

My patch doesn't change the size of the structure, so I would prefer to 
keep this patch as-is.

Cheers,

-- 
Julien Grall

