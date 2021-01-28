Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4C33078B6
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 15:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77146.139561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58gd-0001Iz-2T; Thu, 28 Jan 2021 14:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77146.139561; Thu, 28 Jan 2021 14:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l58gc-0001Ic-Vf; Thu, 28 Jan 2021 14:54:18 +0000
Received: by outflank-mailman (input) for mailman id 77146;
 Thu, 28 Jan 2021 14:54:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AY0C=G7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l58gb-0001IW-CY
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 14:54:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c5a8ed3c-c05b-4ad7-9158-b2497ab97c11;
 Thu, 28 Jan 2021 14:54:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAD05AE7D;
 Thu, 28 Jan 2021 14:54:14 +0000 (UTC)
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
X-Inumbo-ID: c5a8ed3c-c05b-4ad7-9158-b2497ab97c11
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611845655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gMExEDRFdmp6DwtIQ7gxyCMBOyGB9d4wPsf1mmk8tLk=;
	b=AVx9Cu1x/IVZBoDw7zs0CNhkaEiILWRqBYji7fau7sP3wc2IT3KJFZ0FwbqC7vp75AQpEp
	CekFs3DjWdoeqo/CveOw10ohcmRq6j0c5WxyQzkxhIhBXCrXvzjedCCGoLjtGEv+bPJnQj
	v8/jgNbhrMhhJh4Ar3S2WTPcHGM8ld8=
Subject: Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req
 fields to struct vcpu
To: Ian Jackson <iwj@xenproject.org>
Cc: Julien Grall <julien@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <1611601709-28361-1-git-send-email-olekstysh@gmail.com>
 <1611601709-28361-11-git-send-email-olekstysh@gmail.com>
 <2a048ca9-2767-a4d8-c864-21392bb65fdc@xen.org>
 <f4a4cbe6-89a1-3f80-2d03-fd62c5d7eda6@suse.com>
 <61c10e68-d3fe-af16-b22f-bac804a0a70a@xen.org>
 <1330ae92-d2ac-fca2-e149-fb7c39b3a66f@suse.com>
 <24594.53081.646632.583737@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a9fe45ac-8503-7b9c-a8b4-bd8e767a11d3@suse.com>
Date: Thu, 28 Jan 2021 15:54:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <24594.53081.646632.583737@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 28.01.2021 15:51, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH V5 10/22] xen/ioreq: Move x86's io_completion/io_req fields to struct vcpu"):
>> On 28.01.2021 15:21, Julien Grall wrote:
>>> It seems that this is a build issue as if I clean the repo the error 
>>> disappear.
>>>
>>> The error happens when I move from staging to a batch with this series 
>>> applied without a cleaning the tree. It also happens the other way 
>>> around as well.
> 
> How vexing.
> 
>>> Removing entry.o or asm-offsets.h before building doesn't help. Any 
>>> other idea?
>>
>> No, I'd need to know how exactly to repro and then try to debug.
> 
> IMO this problem is not a blocker for pushing this today or tomorrow.
> Unless someone disagrees ?

No, I don't think this is caused by this series, and Andrew's
reply of having noticed the same supports this.

Jan

