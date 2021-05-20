Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E8538A137
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130818.244830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljexg-0007D0-UD; Thu, 20 May 2021 09:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130818.244830; Thu, 20 May 2021 09:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljexg-0007AG-R0; Thu, 20 May 2021 09:27:24 +0000
Received: by outflank-mailman (input) for mailman id 130818;
 Thu, 20 May 2021 09:27:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljexf-0007AA-3O
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:27:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 00e0c74f-3340-4325-be5a-8eafe6f91952;
 Thu, 20 May 2021 09:27:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6CD17AE81;
 Thu, 20 May 2021 09:27:21 +0000 (UTC)
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
X-Inumbo-ID: 00e0c74f-3340-4325-be5a-8eafe6f91952
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621502841; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7rqhgH9R9B73ijK+Qc/m24+QJNhL73dhbh8I92A83hI=;
	b=ssiW7HuR6VuDhLIudyXNbhAV165+/yUOINVmdBJPkP8WqLcNoiN8AOtKJBbZ+nQfCHpM1U
	xKHfeJP9KHfu5WpHvPwYsuz3GgupGVwlyWbNCbesGicGw2X/S/Nd0tJ6dvBooobkjHXvdy
	AhZha3fFAbxoREIWUt7brmFhc9heTJQ=
Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
To: Julien Grall <julien@xen.org>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <2f4eb08e-261b-70c4-bcbc-e08db36a50a9@xen.org>
 <VE1PR08MB52155DD56E548E98AE937CE8F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <VE1PR08MB5215E19BFE3E7F329229D8E7F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <44b46f35-cc51-9274-77f2-cfd18c998a38@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b53c5ef5-ccab-a472-1edc-63082d89f09a@suse.com>
Date: Thu, 20 May 2021 11:27:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <44b46f35-cc51-9274-77f2-cfd18c998a38@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.05.2021 10:59, Julien Grall wrote:
> On 20/05/2021 09:40, Penny Zheng wrote:
>> Oh, Second thought on this.
>> And I think you are referring to balloon in/out here, hmm, also, like
> 
> Yes I am referring to balloon in/out.
> 
>> I replied there:
>> "For issues on ballooning out or in, it is not supported here.
> 
> So long you are not using the solution in prod then you are fine (see 
> below)... But then we should make clear this feature is a tech preview.
> 
>> Domain on Static Allocation and 1:1 direct-map are all based on
>> dom0-less right now, so no PV, grant table, event channel, etc, considered.
>>
>> Right now, it only supports device got passthrough into the guest."
> 
> So we are not creating the hypervisor node in the DT for dom0less domU. 
> However, the hypercalls are still accessible by a domU if it really
> wants to use them.
> 
> Therefore, a guest can easily mess up with your static configuration and 
> predictability.
> 
> IMHO, this is a must to solve before "static memory" can be used in 
> production.

I'm having trouble seeing why it can't be addressed right away: Such
guests can balloon in only after they've ballooned out some pages,
and such balloon-in requests would be satisfied from the same static
memory that is associated by the guest anyway.

Jan

