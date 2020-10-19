Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D802922FA
	for <lists+xen-devel@lfdr.de>; Mon, 19 Oct 2020 09:30:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.8609.23075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPc5-000620-QQ; Mon, 19 Oct 2020 07:29:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 8609.23075; Mon, 19 Oct 2020 07:29:49 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUPc5-00061c-NN; Mon, 19 Oct 2020 07:29:49 +0000
Received: by outflank-mailman (input) for mailman id 8609;
 Mon, 19 Oct 2020 07:29:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kUPc4-00061X-Mj
 for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:29:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c4f8ad6-12a5-453c-a8a3-3a5415855b8b;
 Mon, 19 Oct 2020 07:29:47 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id ACF70AC8B;
 Mon, 19 Oct 2020 07:29:46 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nhcc=D2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kUPc4-00061X-Mj
	for xen-devel@lists.xenproject.org; Mon, 19 Oct 2020 07:29:48 +0000
X-Inumbo-ID: 2c4f8ad6-12a5-453c-a8a3-3a5415855b8b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 2c4f8ad6-12a5-453c-a8a3-3a5415855b8b;
	Mon, 19 Oct 2020 07:29:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603092586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SyjgKY1Si4K6wfxaWj8TKW9wqTWRjKNXPgMcltgR6zs=;
	b=It3YIAh8Tbtoj4VYIigE17U+Z4WsKeAhVF8eWE5FXAR4A6ZqLuM7zWaNhsTQqTZ/HFIJ7T
	uPA9lwF1okOdmnMGwqeKjUsipEZcYNrQ8teL8XwT1IQC81o/o7tjzBJUvRmoYa8BWPW+jB
	jxlE2bwvLExroL33LnNQ+y6fVYjtRRM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id ACF70AC8B;
	Mon, 19 Oct 2020 07:29:46 +0000 (UTC)
Subject: Re: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
To: paul@xen.org
Cc: 'Julien Grall' <julien@xen.org>, xen-devel@lists.xenproject.org,
 'Paul Durrant' <pdurrant@amazon.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>, 'Ian Jackson'
 <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-3-paul@xen.org>
 <97648df3-dcce-cd19-9074-6ca63d94b518@xen.org>
 <002a01d6a5e8$c36bb5a0$4a4320e0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7c4a0cda-5fff-c9ae-2fc1-4256aec5f694@suse.com>
Date: Mon, 19 Oct 2020 09:29:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <002a01d6a5e8$c36bb5a0$4a4320e0$@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19.10.2020 09:23, Paul Durrant wrote:
>> From: Julien Grall <julien@xen.org>
>> Sent: 16 October 2020 16:47
>>
>> On 05/10/2020 10:49, Paul Durrant wrote:
>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>> index 791f0a2592..75e855625a 100644
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -1130,6 +1130,18 @@ struct xen_domctl_vuart_op {
>>>                                    */
>>>   };
>>>
>>> +/*
>>> + * XEN_DOMCTL_iommu_ctl
>>> + *
>>> + * Control of VM IOMMU settings
>>> + */
>>> +
>>> +#define XEN_DOMCTL_IOMMU_INVALID 0
>>
>> I can't find any user of XEN_DOMCTL_IOMMU_INVALID. What's the purpose
>> for it?
>>
> 
> It's just a placeholder. I think it's generally safer that a zero opcode value is invalid.

But does this then need a #define? Starting valid command from 1
ought to be sufficient?

Jan

