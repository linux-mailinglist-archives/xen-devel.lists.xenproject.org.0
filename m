Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832D31FAC2A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 11:19:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl7kU-0001TG-QO; Tue, 16 Jun 2020 09:19:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jl7kT-0001TB-Pd
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 09:19:17 +0000
X-Inumbo-ID: 73f97da8-afb2-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 73f97da8-afb2-11ea-bca7-bc764e2007e4;
 Tue, 16 Jun 2020 09:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uNcSOBRJ4m/G3cKvPiPnd/BSRd1yzcUjdLL1eQmZ7sU=; b=4VvClosMytF8N2JJYPZuK+1J/o
 Mg9kRhCrY3zVrm+IOiblwjlmb2j0BRveeVZbbbIZtuymC8o1DDqFQxVruh0Gaa3yC3RJodQHwAieN
 aysN1bgrAPbBS41MR7U98mcWjuT8FQ1v9TlS2tu8m33RJN3uBQjE6mLYRWHPHTDx3hIw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl7kQ-0001pV-K9; Tue, 16 Jun 2020 09:19:14 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl7kQ-0004r9-Cl; Tue, 16 Jun 2020 09:19:14 +0000
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
To: Jan Beulich <jbeulich@suse.com>
References: <20200613184132.11880-1-julien@xen.org>
 <61a4dccf-4dc8-11a7-7428-f48e39b05276@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <035d1085-c08c-3dee-6e9b-faf245ef660d@xen.org>
Date: Tue, 16 Jun 2020 10:19:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <61a4dccf-4dc8-11a7-7428-f48e39b05276@suse.com>
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



On 16/06/2020 09:26, Jan Beulich wrote:
> On 13.06.2020 20:41, Julien Grall wrote:
>> @@ -73,10 +76,18 @@ struct xen_pvcalls_request {
>>               uint32_t flags;
>>               grant_ref_t ref;
>>               uint32_t evtchn;
>> +#ifndef __i386__
>> +            uint8_t pad[4];
>> +#endif
> 
> Where possible I think uint32_t would be slightly better to use.

OOI, why?

> 
>>           } connect;
>>           struct xen_pvcalls_release {
>>               uint64_t id;
>>               uint8_t reuse;
>> +#ifndef __i386__
>> +            uint8_t pad[7];
>> +#else
>> +            uint8_t pad[3];
>> +#endif
> 
> For this I'd recommend uniform "uint8_t pad[3];" (i.e. outside
> of any #ifdef) followed by a uint32_t again inside the #ifdef.

Same question here. The more the padding cannot be re-used.

> 
> Expressing everything through e.g. alignof() would seem even
> better, but I can't currently think of a way to do so cleanly.

I am afraid I don't have time to look at how alignof() can work nicely. 
Feel free to send a follow-up or pick-up the patch is you really want 
alignof().

Cheers,

-- 
Julien Grall

