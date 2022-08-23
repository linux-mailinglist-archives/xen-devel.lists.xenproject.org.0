Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E26A59D2C9
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 09:57:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391715.629662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQOli-00073w-RZ; Tue, 23 Aug 2022 07:56:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391715.629662; Tue, 23 Aug 2022 07:56:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQOli-000729-Om; Tue, 23 Aug 2022 07:56:14 +0000
Received: by outflank-mailman (input) for mailman id 391715;
 Tue, 23 Aug 2022 07:56:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQOli-000723-1P
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 07:56:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQOlc-0005kj-5L; Tue, 23 Aug 2022 07:56:08 +0000
Received: from [54.239.6.189] (helo=[192.168.28.231])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQOlb-0002hv-SU; Tue, 23 Aug 2022 07:56:08 +0000
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
	bh=BtFIZIHjs3dBvxT1HH8CA3vL6Y3aLlZPeZs3StgF+/8=; b=a11u+5lmTg3ArY6MUD/rcFkNbE
	Tdv4AmqDNyxb7+t4N/Yjc4MN3HlHUzbPKCBoThTViE4jwE6rWPqlQiw17emDmijr81qbbEMRXF9Z2
	M5lmmwSwriTxXtz+hFn4tgVJpDZPjcbl7NdRXaEIJl9zIDXNPaxhhPD3nAbz8HovTqbE=;
Message-ID: <96618b21-7cb5-d160-75b3-953ccdc75ac5@xen.org>
Date: Tue, 23 Aug 2022 08:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1660902588.git.rahul.singh@arm.com>
 <1a8c49dcc237187cbb9fccaafe1e6533fe68381c.1660902588.git.rahul.singh@arm.com>
 <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <71c651a6-e8ad-78fc-efe5-2f20c332530a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul and Jan,

On 22/08/2022 14:49, Jan Beulich wrote:
> On 19.08.2022 12:02, Rahul Singh wrote:
>> Static event channel support will be added for dom0less domains.

I am not sure how this sentence is related to this patch. You...

>> Restrict the maximum number of evtchn supported for domUs to avoid
>> allocating a large amount of memory in Xen.

... still need the limit to prevent a domain using more memory because 
at the moment they are unlimited.

> 
> Please clarify here how you arrived at 4096 and why you expect no
> dom0less DomU would ever want to have more. The limit, after all,
> is far below that of FIFO event channels.

I will reply on this because I suggested the limit. A dom0less DomU is 
exactly the same as a DomU created by the toolstack. The default is 1023 
(I originally thought it was 4096).

I would expect that is 1023 is going to be fine by default also for 
dom0less domU as on Arm we don't bind physical interrupts to event 
channels. So the only big use for them is for inter-domain communication.

Therefore, I think it should be ok to default to 1023 if we want 
consistency.

If someone needs more than 1023, we could introduce a per-domain 
device-tree property to override the default maximum.

> 
>> --- a/xen/arch/arm/domain_build.c
>> +++ b/xen/arch/arm/domain_build.c
>> @@ -3277,7 +3277,7 @@ void __init create_domUs(void)
>>           struct xen_domctl_createdomain d_cfg = {
>>               .arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE,
>>               .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>> -            .max_evtchn_port = -1,
>> +            .max_evtchn_port = MAX_EVTCHNS_PORT,
>>               .max_grant_frames = -1,
>>               .max_maptrack_frames = -1,
>>               .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -76,6 +76,9 @@ extern domid_t hardware_domid;
>>   /* Maximum number of event channels for any ABI. */
>>   #define MAX_NR_EVTCHNS MAX(EVTCHN_2L_NR_CHANNELS, EVTCHN_FIFO_NR_CHANNELS)
>>   
>> +/* Maximum number of event channels supported for domUs. */
>> +#define MAX_EVTCHNS_PORT 4096
> 
> I'm afraid the variable name doesn't express its purpose, and the
> comment also claims wider applicability than is actually the case.
> It's also not clear whether the constant really needs to live in
> the already heavily overloaded xen/sched.h.

IMHO, I think the value would be better hardcoded with an explanation on 
top how we chose the default value.

Cheers,

-- 
Julien Grall

