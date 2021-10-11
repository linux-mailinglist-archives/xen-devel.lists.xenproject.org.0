Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91195428AFE
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:45:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205723.361105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsnv-0008Po-9y; Mon, 11 Oct 2021 10:45:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205723.361105; Mon, 11 Oct 2021 10:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZsnv-0008Nr-5T; Mon, 11 Oct 2021 10:45:11 +0000
Received: by outflank-mailman (input) for mailman id 205723;
 Mon, 11 Oct 2021 10:45:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZsnt-0008Mz-Ri
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:45:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsnt-00034m-J3; Mon, 11 Oct 2021 10:45:09 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsnt-0008OM-D4; Mon, 11 Oct 2021 10:45:09 +0000
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
	bh=8YIzacVrE5Uig7lY7JSn0GNOezBiHX+Ld0uhxcwJQSA=; b=okIybMojrpPPm83YXatlwGQOur
	WjBHE5D5+MZeIN7t1+mESjenMaR4GXsLgleYUVMsLGy3Zi14ICsSU+vjy7QaJOypmQGyiINAxLf5X
	4eI+p/AaskvcMCAdkN5gcp/f8WwP6skYf3F6khS0kaW2n8HfDD5LASWjqaHXaenZvz8k=;
Message-ID: <975079d0-38d4-2a56-541d-b6d652ce87c3@xen.org>
Date: Mon, 11 Oct 2021 11:45:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH 01/11] xen: reserve flags for internal usage in
 xen_domctl_createdomain
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <penny.zheng@arm.com>,
 xen-devel@lists.xenproject.org, sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-2-penny.zheng@arm.com>
 <7da75d7c-5640-305d-d742-d64b8c219949@xen.org>
 <60d813f7-a756-172c-999d-44f81504e268@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <60d813f7-a756-172c-999d-44f81504e268@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 28/09/2021 13:05, Jan Beulich wrote:
> On 23.09.2021 11:54, Julien Grall wrote:
>> On 23/09/2021 08:11, Penny Zheng wrote:
>>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>
>>> We are passing an extra special boolean flag at domain creation to
>>> specify whether we want to the domain to be privileged (i.e. dom0) or
>>> not. Another flag will be introduced later in this series.
>>>
>>> Reserve bits 16-31 from the existing flags bitfield in struct
>>> xen_domctl_createdomain for internal Xen usage.
>>
>> I am a bit split with this approach. This feels a bit of a hack to
>> reserve bits for internal purpose in external headers. But at the same
>> time I can see how this is easier to deal with it over repurposing the
>> last argument of domain_create().
> 
> I actually have trouble seeing why that's easier. It is a common thing
> to widen a bool to "unsigned int flags" when more than one control is
> needed.

I was suggesting this is easier for the following two reasons:
   1) All the option flags (internal and external) are in a single place.
   2) Reduce the risk to make a mistake when widening the field. In 
particular in the context of backporting. Although, this looks unlikely 
here.

> Plus this makes things needlessly harder once (in the future)
> the low 16 bits are exhausted in the public interface.

That's why I suggested this sounds like a hack. At the same time the 
split between external vs internal option is a bit more a pain for the 
developper. So I didn't feel pushing for one vs the other. That said, I 
will not argue against if you want to push for repurposing the last 
argument.

Cheers,

-- 
Julien Grall

