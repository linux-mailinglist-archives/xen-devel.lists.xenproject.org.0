Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E94E7CF3DF
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 11:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619029.963521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPAZ-000324-T7; Thu, 19 Oct 2023 09:18:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619029.963521; Thu, 19 Oct 2023 09:18:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtPAZ-0002yX-P5; Thu, 19 Oct 2023 09:18:19 +0000
Received: by outflank-mailman (input) for mailman id 619029;
 Thu, 19 Oct 2023 09:18:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=in48=GB=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qtPAY-0002Wn-BO
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 09:18:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70569d51-6e60-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 11:18:17 +0200 (CEST)
Received: from [192.168.1.9] (net-188-218-250-245.cust.vodafonedsl.it
 [188.218.250.245])
 by support.bugseng.com (Postfix) with ESMTPSA id CC4654EE0743;
 Thu, 19 Oct 2023 11:18:16 +0200 (CEST)
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
X-Inumbo-ID: 70569d51-6e60-11ee-98d5-6d05b1d4d9a1
Message-ID: <66049700-c16b-4086-b14f-154285f3ebf0@bugseng.com>
Date: Thu, 19 Oct 2023 11:18:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/4] xen: address violations of MISRA C:2012 Rule 13.1
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli
 <dfaggioli@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>
References: <cover.1697638210.git.simone.ballarin@bugseng.com>
 <1e0f12095bcbc82ae3585c9fcf57bec7e324049c.1697638210.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <alpine.DEB.2.22.394.2310181803351.965337@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/10/23 03:06, Stefano Stabellini wrote:
> On Wed, 18 Oct 2023, Simone Ballarin wrote:
>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>
>> This patch moves expressions with side-effects outside the initializer lists.
>>
>> No functional changes.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> ---
>>   xen/common/sched/core.c    | 16 ++++++++++++----
>>   xen/drivers/char/ns16550.c |  4 +++-
>>   2 files changed, 15 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
>> index 12deefa745..519884f989 100644
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -1504,6 +1504,8 @@ long vcpu_yield(void)
>>   {
>>       struct vcpu * v=current;
>>       spinlock_t *lock;
>> +    domid_t domain_id;
>> +    int vcpu_id;
>>   
>>       rcu_read_lock(&sched_res_rculock);
>>   
>> @@ -1515,7 +1517,9 @@ long vcpu_yield(void)
>>   
>>       SCHED_STAT_CRANK(vcpu_yield);
>>   
>> -    TRACE_2D(TRC_SCHED_YIELD, current->domain->domain_id, current->vcpu_id);
>> +    domain_id = current->domain->domain_id;
>> +    vcpu_id = current->vcpu_id;
>> +    TRACE_2D(TRC_SCHED_YIELD, domain_id, vcpu_id);
> 
> Also here it looks like accessing the current pointer is considered a
> side effect. Why? This is a just a global variable that is only accessed
> for reading.
> 
> 
>>       raise_softirq(SCHEDULE_SOFTIRQ);
>>       return 0;
>>   }
>> @@ -1888,14 +1892,17 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>       case SCHEDOP_shutdown:
>>       {
>>           struct sched_shutdown sched_shutdown;
>> +        domid_t domain_id;
>> +        int vcpu_id;
>>   
>>           ret = -EFAULT;
>>           if ( copy_from_guest(&sched_shutdown, arg, 1) )
>>               break;
>>   
>> +        domain_id = current->domain->domain_id;
>> +        vcpu_id = current->vcpu_id;
>>           TRACE_3D(TRC_SCHED_SHUTDOWN,
>> -                 current->domain->domain_id, current->vcpu_id,
>> -                 sched_shutdown.reason);
>> +                 domain_id, vcpu_id, sched_shutdown.reason);
>>           ret = domain_shutdown(current->domain, (u8)sched_shutdown.reason);
>>   
>>           break;
>> @@ -1905,13 +1912,14 @@ ret_t do_sched_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>       {
>>           struct sched_shutdown sched_shutdown;
>>           struct domain *d = current->domain;
>> +        int vcpu_id = current->vcpu_id;
>>   
>>           ret = -EFAULT;
>>           if ( copy_from_guest(&sched_shutdown, arg, 1) )
>>               break;
>>   
>>           TRACE_3D(TRC_SCHED_SHUTDOWN_CODE,
>> -                 d->domain_id, current->vcpu_id, sched_shutdown.reason);
>> +                 d->domain_id, vcpu_id, sched_shutdown.reason);
>>   
>>           spin_lock(&d->shutdown_lock);
>>           if ( d->shutdown_code == SHUTDOWN_CODE_INVALID )
>> diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
>> index 28ddedd50d..0b3d8b2a30 100644
>> --- a/xen/drivers/char/ns16550.c
>> +++ b/xen/drivers/char/ns16550.c
>> @@ -445,10 +445,12 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
>>               struct msi_info msi = {
>>                   .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
>>                                    uart->ps_bdf[2]),
>> -                .irq = rc = uart->irq,
>> +                .irq = uart->irq,
>>                   .entry_nr = 1
>>               };
>>   
>> +            rc = uart->irq;
> 
> What's the side effect here? If the side effect is rc = uart->irq, why
> is it considered a side effect?
> 

Yes, rc = uart->irq is the side-effect: it writes a variable
declared outside the context of the expression.

Consider the following example:

int rc;

struct S s = {
   .x = rc = 2,
   .y = rc = 3
};

What's the value of rc?


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


