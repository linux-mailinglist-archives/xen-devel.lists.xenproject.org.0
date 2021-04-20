Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06960365793
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 13:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113550.216411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYoYj-0000TD-Jp; Tue, 20 Apr 2021 11:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113550.216411; Tue, 20 Apr 2021 11:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYoYj-0000So-GT; Tue, 20 Apr 2021 11:28:49 +0000
Received: by outflank-mailman (input) for mailman id 113550;
 Tue, 20 Apr 2021 11:28:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYoYh-0000Sj-DT
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 11:28:47 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f157fb83-a4e2-4008-93b2-ece1b8f341b2;
 Tue, 20 Apr 2021 11:28:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8FE17AF98;
 Tue, 20 Apr 2021 11:28:45 +0000 (UTC)
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
X-Inumbo-ID: f157fb83-a4e2-4008-93b2-ece1b8f341b2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618918125; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lRmWvHXX3TgjY2Zoj9JrTfd/UE48CQS1mOvA3YQ4IiE=;
	b=iz50U2V611fdqXAnyaqTMOdA9E7DdED5grCVotBRt4DEU4UYqPlaMUq6k2CyN/5yRjEVjl
	UmpbLi1JXpUw5nw1sOQY9zccdhblx+3LeCJgOWpogoVlG7XA1qsZZlMuO1JwjlPZB74k7c
	JjbR1BWIHOjSiCNPbqW4saCAbXFVA1Y=
Subject: Re: [PATCH v2 2/2] x86/cpuid: support LFENCE always serializing CPUID
 bit
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20210415144731.3356-1-roger.pau@citrix.com>
 <20210415144731.3356-3-roger.pau@citrix.com>
 <1bcda034-b08d-ec06-05fa-2d0f5cb26339@suse.com>
 <YH6xXeYVTEKsswQp@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <131cdf88-7942-9cc5-ff7d-ec538055ea9f@suse.com>
Date: Tue, 20 Apr 2021 13:28:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YH6xXeYVTEKsswQp@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 12:47, Roger Pau Monné wrote:
> On Tue, Apr 20, 2021 at 12:35:54PM +0200, Jan Beulich wrote:
>> I'd like to give Andrew a day or two more to respond there in case he
>> continues to see an issue, before I commit that with your R-b and this
>> one here. I'll assume you'll subsequently take care of that missing
>> piece then - if not, i.e. if e.g. I should, please let me know.
> 
> I think it should be something like the above,

Right (assuming you meant "below).

> in fact I think it
> would be perfectly fine to merge that chunk into your patch?

I'd rather not, so that this change can have its own reasoning in its
description.

Jan

> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 050cd5713e2..daf501779fe 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -314,12 +314,9 @@ static void __init calculate_host_policy(void)
>  
>      *p = raw_cpuid_policy;
>  
> -    p->basic.max_leaf =
> -        min_t(uint32_t, p->basic.max_leaf,   ARRAY_SIZE(p->basic.raw) - 1);
> -    p->feat.max_subleaf =
> -        min_t(uint32_t, p->feat.max_subleaf, ARRAY_SIZE(p->feat.raw) - 1);
> -    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, p->extd.max_leaf & 0xffff,
> -                                          ARRAY_SIZE(p->extd.raw) - 1);
> +    p->basic.max_leaf = ARRAY_SIZE(p->basic.raw) - 1;
> +    p->feat.max_subleaf = ARRAY_SIZE(p->feat.raw) - 1;
> +    p->extd.max_leaf = 0x80000000 | ARRAY_SIZE(p->extd.raw) - 1;
>  
>      cpuid_featureset_to_policy(boot_cpu_data.x86_capability, p);
>      recalculate_xstate(p);
> 


