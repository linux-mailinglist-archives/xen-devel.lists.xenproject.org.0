Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FB735D9A5
	for <lists+xen-devel@lfdr.de>; Tue, 13 Apr 2021 10:09:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109572.209149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWE6s-0004Rx-UB; Tue, 13 Apr 2021 08:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109572.209149; Tue, 13 Apr 2021 08:09:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWE6s-0004RY-QV; Tue, 13 Apr 2021 08:09:22 +0000
Received: by outflank-mailman (input) for mailman id 109572;
 Tue, 13 Apr 2021 08:09:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWE6r-0004RT-8I
 for xen-devel@lists.xenproject.org; Tue, 13 Apr 2021 08:09:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2e963ff-be95-4357-af5d-e1d620ff985e;
 Tue, 13 Apr 2021 08:09:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 719E3B0EA;
 Tue, 13 Apr 2021 08:09:19 +0000 (UTC)
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
X-Inumbo-ID: a2e963ff-be95-4357-af5d-e1d620ff985e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618301359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LHAvMnvNF4OK3/k9Ct4oNGcrGQrZqtQ6oj43xIDYCh4=;
	b=Xy+jXwWXYLbjxw1sOC/K9m9HrXZlDFTanD0r+jc/UvqP8MqN2BX4N+++G6PS9bM2qRINOW
	T9vmQpsXpXbi2E3rx/t9dMape3vbQPPW5ZPqEjbRX4MfebtyiYCFHCC/B/uczzHqdacXX8
	1X7ZSphCcpgyGoFg/+lraZvQv6rxXTY=
Subject: Re: [PATCH 3/3] xen-pciback: simplify vpci's find hook
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, Konrad Wilk <konrad.wilk@oracle.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <d2ac85d9-0ad1-71a3-fa3b-b99340b3204d@suse.com>
 <158273a2-d1b9-3545-b25d-affca867376c@suse.com>
 <e9f358bc-e957-e039-235c-6a9f68328554@oracle.com>
 <ea274ffe-4eee-9fa5-b5d1-e8528b112227@suse.com>
 <037a8fc2-2c69-2049-8826-32181b8aec2d@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7686006-5f95-3216-60ff-daf1b1cbe8c4@suse.com>
Date: Tue, 13 Apr 2021 10:09:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <037a8fc2-2c69-2049-8826-32181b8aec2d@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12.04.2021 18:05, Boris Ostrovsky wrote:
> 
> On 4/12/21 5:50 AM, Jan Beulich wrote:
>> On 09.04.2021 23:45, Boris Ostrovsky wrote:
>>> On 4/7/21 10:37 AM, Jan Beulich wrote:
>>>> There's no point in comparing SBDF - we can simply compare the struct
>>>> pci_dev pointers. If they weren't the same for a given device, we'd have
>>>> bigger problems from having stored a stale pointer.
>>>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>
>>> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
>> Thanks. As the 1st patch of this series still looks to have an unclear
>> disposition (unless not getting back a reply on my responses to your
>> comments means silent agreement),
> 
> 
> TBH I have been struggling with understanding both the original problem (just like you have) and the solution you are proposing (apart from making dev_list[] more compact).
> 
> 
>>  I can't predict yet when I'd be able
>> to submit v2. Hence I'd like to point out that this patch is
>> independent of the former two, and hence would need to wait further if
>> you wanted to apply it. After all this one (unlike the other two) is
>> merely cleanup, and hence would rather want to go in during a merge
>> window.
> 
> 
> Given that next Sunday may be when 5.12 is released I think everything but stoppers will have to wait for the merge window.

Oh, I didn't mean it this way. Instead I thought the 3rd patch here could
be pushed to Linus during the merge window, while the other two may be
fine to go his way also during early RCs of 5.13 (giving us some time to
sort what exactly we want to do).

Jan

