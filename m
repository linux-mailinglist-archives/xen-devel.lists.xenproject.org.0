Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3654749C6E0
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 10:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260759.450807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCewv-0004mx-NT; Wed, 26 Jan 2022 09:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260759.450807; Wed, 26 Jan 2022 09:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCewv-0004l5-KK; Wed, 26 Jan 2022 09:50:45 +0000
Received: by outflank-mailman (input) for mailman id 260759;
 Wed, 26 Jan 2022 09:50:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nCewt-0004kz-Rz
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 09:50:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCewt-0007Cx-2J; Wed, 26 Jan 2022 09:50:43 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.95.98.192])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nCews-0008Bi-Rt; Wed, 26 Jan 2022 09:50:42 +0000
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
	bh=H5ebuzchRd7JcTUDDI9i1s6ltFuVO9D6Cf9cuhvpAw4=; b=YxqxqPWcYrDawpbMwxytazw3Ss
	UIjfnWMLhv4s9DxYozPUqlIdGtxQqxMyETR3R/dvfAVm/2bYO3BV/bOeaaXqkqC795wFPZFOSfSS9
	yIUbaBpmJVpI57vG7UALM9tXnzufbeElFbMja2Q19Dfl9nFOiXFmwz0JzpH46cvVx72c=;
Message-ID: <966ac15d-e91f-e812-1021-296ef60a9a06@xen.org>
Date: Wed, 26 Jan 2022 09:50:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [XEN PATCH v2 2/5] xen: export get_free_port
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, jgross@suse.com,
 Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <alpine.DEB.2.22.394.2201121646290.19362@ubuntu-linux-20-04-desktop>
 <20220113005855.1180101-2-sstabellini@kernel.org>
 <f3b2ae98-c7af-d8c0-b0a4-52e622517c34@xen.org>
 <alpine.DEB.2.22.394.2201241652330.27308@ubuntu-linux-20-04-desktop>
 <14af544d-0d20-9b58-4d70-5f5086ece032@suse.com>
 <alpine.DEB.2.22.394.2201251435030.27308@ubuntu-linux-20-04-desktop>
 <a992cf74-a75a-43d0-f83a-cd9549f586a8@xen.org>
 <alpine.DEB.2.22.394.2201251530400.27308@ubuntu-linux-20-04-desktop>
 <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <aa7aee5b-71cf-78c3-f8a2-f8d166f22ecb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/01/2022 07:30, Jan Beulich wrote:
> On 26.01.2022 02:03, Stefano Stabellini wrote:
>> Are you guys OK with something like this?
> 
> With proper proof that this isn't going to regress anything else, maybe.

That's why I sugested to also gate with system_state < SYS_STATE_boot so 
we reduce the potential regression (the use of hypercall should be 
limited at boot).

FWIW, there was a thread [1] to discuss the same issue as Stefano is 
facing (but in the context of Live-Update).

> But ...
> 
>> --- a/xen/include/xsm/dummy.h
>> +++ b/xen/include/xsm/dummy.h
>> @@ -92,7 +92,9 @@ static always_inline int xsm_default_action(
>>               return 0;
>>           /* fall through */
>>       case XSM_PRIV:
>> -        if ( is_control_domain(src) )
>> +        if ( is_control_domain(src) ||
>> +             src->domain_id == DOMID_IDLE ||
>> +             src->domain_id == DOMID_XEN )
>>               return 0;
> 
> ... my first question would be under what circumstances you might observe
> DOMID_XEN here and hence why this check is there.
> 
> Jan >

[1] 
https://lore.kernel.org/xen-devel/bfd645cf42ef7786183be15c222ad04beed362c0.camel@xen.org/

-- 
Julien Grall

