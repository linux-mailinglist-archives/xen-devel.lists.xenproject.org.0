Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE2A522164
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 18:35:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325896.548675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSpU-0000FU-Br; Tue, 10 May 2022 16:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325896.548675; Tue, 10 May 2022 16:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noSpU-0000Cw-7z; Tue, 10 May 2022 16:35:20 +0000
Received: by outflank-mailman (input) for mailman id 325896;
 Tue, 10 May 2022 16:35:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1noSpT-0000Cq-8L
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 16:35:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noSpS-0001qJ-KN; Tue, 10 May 2022 16:35:18 +0000
Received: from [54.239.6.189] (helo=[192.168.24.150])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1noSpS-0001na-Du; Tue, 10 May 2022 16:35:18 +0000
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
	bh=Lok7NcgowaSocHlF+3kALI8krImFTVbkL+lIoDgLr4M=; b=vBhmlsZ03+KNLMFEJOR1WsL5CN
	sBQADLtJuPEisf0JIiK4LCf2dcM3dOwQ9gaeEPKQh2wkGWEzst2yJnXTVPLcm9Z+aNFTRIMOCBkvh
	GUsKNEn+I0n761kFl3yqMmQFSx4RLWGzmM422oYkOglTu7s62uz2ZATHnA5hxo6Jyag0=;
Message-ID: <eab9afec-b023-ef7a-dc09-1b579c7f36b4@xen.org>
Date: Tue, 10 May 2022 17:35:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, Bertrand Marquis
 <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
 <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8011EAE7-7DF6-4342-B0BF-F64190099BA0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 10/05/2022 17:30, Rahul Singh wrote:
>> +    rc = evtchn_alloc_unbound(&alloc);
>> +    if ( rc )
>> +    {
>> +        printk("Failed allocating event channel for domain\n");
>> +        return rc;
>> +    }
>> +
>> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
>> +
>> +    return 0;
>> +}
>> +
>> static int __init construct_domU(struct domain *d,
>>                                   const struct dt_device_node *node)
>> {
>> @@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain *d,
>>      if ( rc < 0 )
>>          return rc;
>>
>> +    if ( kinfo.dom0less_enhanced )
> 
> I think we need to do something like this to fix the error.
>   if ( hardware_domain && kinfo.dom0less_enhanced )
> {
> 
> }

Is there any use case to use "dom0less_enhanced" without dom0 (or a 
domain servicing Xenstored)?

If not, then I would consider to forbid this case and return an error.

Cheers,

-- 
Julien Grall

