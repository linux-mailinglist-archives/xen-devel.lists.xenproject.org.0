Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98867801346
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 20:03:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645665.1007899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98mg-0003rd-J9; Fri, 01 Dec 2023 19:02:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645665.1007899; Fri, 01 Dec 2023 19:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98mg-0003oj-GE; Fri, 01 Dec 2023 19:02:42 +0000
Received: by outflank-mailman (input) for mailman id 645665;
 Fri, 01 Dec 2023 19:02:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r98mf-0003oZ-1z
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 19:02:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98me-0006QB-EG; Fri, 01 Dec 2023 19:02:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r98me-00014r-7x; Fri, 01 Dec 2023 19:02:40 +0000
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
	bh=R8IDklkeTWmJqxaYii8AJSBt4+CAqorEPzJPnof4lBk=; b=QcTl73hbgDpQDN/+lZ6yozYpSl
	3Y3WL24Vo/Mtq72VPPtL07ZnBFPF+9sPloXpVZXhGh8zSH4DquNPBL+NqJQfewxJjpMsS7+ADdmcs
	WzMiCCuYwH5vHR/d6Ytwb8r9bt/YZLUcVWMLToLCKt9qCI1mQXxfkhJm1mS+byDnCmaY=;
Message-ID: <11d320ca-fabe-42c2-91fb-d5eb0a386560@xen.org>
Date: Fri, 1 Dec 2023 19:02:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/arm: Move static event channel feature to a
 separate module
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231130095757.11162-1-michal.orzel@amd.com>
 <915388E2-F755-4F62-B796-63A174DFF3C1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <915388E2-F755-4F62-B796-63A174DFF3C1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 30/11/2023 13:17, Luca Fancellu wrote:
>> On 30 Nov 2023, at 09:57, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> Move static event channel feature related code to a separate module
>> (static-evtchn.{c,h}) in the spirit of fine granular configuration, so
>> that the feature can be disabled if not needed.
>>
>> Introduce Kconfig option CONFIG_STATIC_EVTCHN, enabled by default (to
>> keep the current behavior) dependent on CONFIG_DOM0LESS. While it could
>> be possible to create a loopback connection for dom0 only, this use case
>> does not really need this feature and all the docs and commit messages
>> refer explicitly to the use in dom0less system.
>>
>> The only function visible externally is alloc_static_evtchn(), so move
>> the prototype to static-evtchn.h and provide a stub in case a feature
>> is disabled. Guard static_evtchn_created in struct dt_device_node as
>> well as its helpers.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
> 
> Hi Michal,
> 
> FWIW because it is already Ack-ed.
> 
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>

Usually when I provide an Acked-by, it means I went through the code and 
generally happy with the patch, but I didn't review throroughly. Even if 
I provide a reviewed-by, it is always useful to have extra pair of eyes 
:). So thanks for looking at it!

It is now committed.

Cheers,

> 
> 
> 

-- 
Julien Grall

