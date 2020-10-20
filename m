Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B106A29413B
	for <lists+xen-devel@lfdr.de>; Tue, 20 Oct 2020 19:17:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.9747.25691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kUvGF-0004A1-Fl; Tue, 20 Oct 2020 17:17:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 9747.25691; Tue, 20 Oct 2020 17:17:23 +0000
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
	id 1kUvGF-00049c-CE; Tue, 20 Oct 2020 17:17:23 +0000
Received: by outflank-mailman (input) for mailman id 9747;
 Tue, 20 Oct 2020 17:17:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kUvGE-00049X-H1
 for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:17:22 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d3f8709c-fe60-4d4d-baaf-d6f4ebe44010;
 Tue, 20 Oct 2020 17:17:21 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUvG6-0000K1-Sr; Tue, 20 Oct 2020 17:17:14 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kUvG6-0007JD-Le; Tue, 20 Oct 2020 17:17:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TRnX=D3=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kUvGE-00049X-H1
	for xen-devel@lists.xenproject.org; Tue, 20 Oct 2020 17:17:22 +0000
X-Inumbo-ID: d3f8709c-fe60-4d4d-baaf-d6f4ebe44010
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id d3f8709c-fe60-4d4d-baaf-d6f4ebe44010;
	Tue, 20 Oct 2020 17:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=6XRVWEq9OP5/+7TDqIxD74K72OTW4DwG6dXwruk5jZI=; b=ED+EJ9pAuuNXMRv4ZNOnrp3DHe
	X+v2jtzE8zMpMZGywk+QiBFsqozS9syrNdAmk28dtZNleL8cTkE7pT+0mOAOLFGpZS2oM3vijDHNc
	g724OsazygwjrDaoEg2XZC+Oe26pkFDTGFGh5mO6o0f/AWLTx/Uyb0GYvGXQCNosKz/M=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUvG6-0000K1-Sr; Tue, 20 Oct 2020 17:17:14 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kUvG6-0007JD-Le; Tue, 20 Oct 2020 17:17:14 +0000
Subject: Re: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
To: paul@xen.org, xen-devel@lists.xenproject.org
Cc: 'Paul Durrant' <pdurrant@amazon.com>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>, 'Ian Jackson'
 <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>, 'Jan Beulich'
 <jbeulich@suse.com>, 'Stefano Stabellini' <sstabellini@kernel.org>
References: <20201005094905.2929-1-paul@xen.org>
 <20201005094905.2929-3-paul@xen.org>
 <97648df3-dcce-cd19-9074-6ca63d94b518@xen.org>
 <002a01d6a5e8$c36bb5a0$4a4320e0$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <e37bdd4a-f483-9143-7860-81be31916aca@xen.org>
Date: Tue, 20 Oct 2020 18:17:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <002a01d6a5e8$c36bb5a0$4a4320e0$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Paul,

On 19/10/2020 08:23, Paul Durrant wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 16 October 2020 16:47
>> To: Paul Durrant <paul@xen.org>; xen-devel@lists.xenproject.org
>> Cc: Paul Durrant <pdurrant@amazon.com>; Daniel De Graaf <dgdegra@tycho.nsa.gov>; Ian Jackson
>> <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>> <george.dunlap@citrix.com>; Jan Beulich <jbeulich@suse.com>; Stefano Stabellini
>> <sstabellini@kernel.org>
>> Subject: Re: [PATCH 2/5] iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
>>
>> Hi Paul,
>>
>> On 05/10/2020 10:49, Paul Durrant wrote:
>>> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
>>> index 791f0a2592..75e855625a 100644
>>> --- a/xen/include/public/domctl.h
>>> +++ b/xen/include/public/domctl.h
>>> @@ -1130,6 +1130,18 @@ struct xen_domctl_vuart_op {
>>>                                     */
>>>    };
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

Thanks for the explanation. I first thought the goal would to somehow 
invalidate the IOMMU :).

Anyway, it might be worth adding /* Reserved - should never be used */ 
on top.

Cheers,

-- 
Julien Grall

