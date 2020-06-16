Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 063641FACF7
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 11:42:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl87A-0004HV-24; Tue, 16 Jun 2020 09:42:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QOm8=75=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jl878-0004HQ-R9
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 09:42:42 +0000
X-Inumbo-ID: b979119c-afb5-11ea-b89c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b979119c-afb5-11ea-b89c-12813bfff9fa;
 Tue, 16 Jun 2020 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lAm2g1ojc6VEH7hmyiVMF3fiK5iNLWUygyth59wbesw=; b=En8AvKtDEWR53zg1NP60xgO/qg
 rlhq4CAFeDizwYNvPVhL0naKnZa4UUVOYx4/0Yt3xiGNT+JdZ8oi1/uWQVJxp4VpfL8mq/oGfUEIU
 enTtL5wBhr+S5niTe5FK6FWz8YAmuV/+kFlLcRNRKpF+mQi5kd9lbROUsWV9N1zdYPFs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl875-0002Ha-Vn; Tue, 16 Jun 2020 09:42:39 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jl875-00062N-PN; Tue, 16 Jun 2020 09:42:39 +0000
Subject: Re: [PATCH v3 for-4.14] pvcalls: Document correctly and explicitely
 the padding for all arches
To: Jan Beulich <jbeulich@suse.com>
References: <20200613184132.11880-1-julien@xen.org>
 <61a4dccf-4dc8-11a7-7428-f48e39b05276@suse.com>
 <035d1085-c08c-3dee-6e9b-faf245ef660d@xen.org>
 <0dd2ffb5-88ff-114f-6127-5bbcc5eed1ae@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e1121e89-0b34-089c-4ac2-1497990400f3@xen.org>
Date: Tue, 16 Jun 2020 10:42:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <0dd2ffb5-88ff-114f-6127-5bbcc5eed1ae@suse.com>
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



On 16/06/2020 10:36, Jan Beulich wrote:
> On 16.06.2020 11:19, Julien Grall wrote:
>>
>>
>> On 16/06/2020 09:26, Jan Beulich wrote:
>>> On 13.06.2020 20:41, Julien Grall wrote:
>>>> @@ -73,10 +76,18 @@ struct xen_pvcalls_request {
>>>>                uint32_t flags;
>>>>                grant_ref_t ref;
>>>>                uint32_t evtchn;
>>>> +#ifndef __i386__
>>>> +            uint8_t pad[4];
>>>> +#endif
>>>
>>> Where possible I think uint32_t would be slightly better to use.
>>
>> OOI, why?
> 
> Because everything else here uses the wider type, plus the
> question of why use a compound type (array) when a simple
> one does.
This is pretty much a matter of taste. In this case, I decided to 
specify the padding the same way accross all the structure.

Cheers,

-- 
Julien Grall

