Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B820120CE2F
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jun 2020 13:24:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jprtc-0004F4-Me; Mon, 29 Jun 2020 11:24:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Zna=AK=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jprta-0004EX-Dx
 for xen-devel@lists.xenproject.org; Mon, 29 Jun 2020 11:24:18 +0000
X-Inumbo-ID: 11f81422-b9fb-11ea-8558-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11f81422-b9fb-11ea-8558-12813bfff9fa;
 Mon, 29 Jun 2020 11:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qBXwwFNpTJo650Yvu6M04pDVZ8TiiNlPlGjOy9+EJ3s=; b=KvK1rxCHjQibAbNKDWkRFhqjCG
 sq36MdcvyPQm6+tMCaGXjHRFrjD/fUstkS5sdmxgWI3L6kFx/kTOlmzsdNxQ82EJFZvCxnPrp8UVy
 uKhDGFJi4reRdeLmFBVRUU86AVKdS5qgjUebwwi/o+mZTP8Z1OHP3m+8sQi7PW0MuABM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jprtX-0001ak-Co; Mon, 29 Jun 2020 11:24:15 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jprtX-0002M2-5m; Mon, 29 Jun 2020 11:24:15 +0000
Subject: Re: [PATCH v4 for-4.14 2/2] pvcalls: Document correctly and
 explicitely the padding for all arches
To: Jan Beulich <jbeulich@suse.com>
References: <20200627095533.14145-1-julien@xen.org>
 <20200627095533.14145-3-julien@xen.org>
 <9fc81bbe-6c30-e848-ceae-1356ec30a8f8@suse.com>
 <11dad2fc-b1ec-3279-1a99-920a5f67456a@xen.org>
 <37362d94-053d-5eb9-d2fa-9d30690313f0@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0c03797c-33c2-8f56-fb0e-b578712cf681@xen.org>
Date: Mon, 29 Jun 2020 12:24:12 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <37362d94-053d-5eb9-d2fa-9d30690313f0@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 paul@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <jgrall@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 29/06/2020 12:22, Jan Beulich wrote:
> On 29.06.2020 12:03, Julien Grall wrote:
>> On 29/06/2020 09:28, Jan Beulich wrote:
>>> On 27.06.2020 11:55, Julien Grall wrote:
>>>> As an aside, the padding sadly cannot be mandated to be 0 as they are
>>>> already present. So it is not going to be possible to use the padding
>>>> for extending a command in the future.
>>>
>>> Why is the other adjustment fine to make due to still being tech
>>> preview, but this one wouldn't be for the same reason?
>>
>> This is mostly a left-over of the previous message. Although, I am not
>> really inclined to address this myself any time soon.
> 
> Sure, I didn't mean to indicate I might expect you to. But perhaps
> here the wording could be slightly changed as well?

I am planning to remove the paragraph completely.

Cheers,

-- 
Julien Grall

