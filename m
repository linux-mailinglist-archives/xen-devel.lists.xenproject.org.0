Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9351B1D796F
	for <lists+xen-devel@lfdr.de>; Mon, 18 May 2020 15:15:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jafcR-0006dv-EI; Mon, 18 May 2020 13:15:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/+tu=7A=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jafcP-0006do-PN
 for xen-devel@lists.xenproject.org; Mon, 18 May 2020 13:15:45 +0000
X-Inumbo-ID: aeaf1e40-9909-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aeaf1e40-9909-11ea-b07b-bc764e2007e4;
 Mon, 18 May 2020 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NhDnZvpcDeGZ65uLgD9pNSdYv9QgJZf6F3tFtD4GQ+w=; b=xjnq5gPi9bggAZ7cXwfE857poU
 WJT1eGlht7AwSom1wM6HCZRFyslEEtH6K1INQD9Uvc87C9iElMpsh6w7jYGjIg4+SeTJaFVap9iFM
 nMi5ltXlpJmL3d4TPg8IAXdDXEIkC605I8tQvo5yyW5vqc9ejDl3gDmgTBMdd5ArdH9E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jafcM-00008D-NE; Mon, 18 May 2020 13:15:42 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jafcM-0006d4-FZ; Mon, 18 May 2020 13:15:42 +0000
Subject: Re: [RESEND PATCH v2 for-4.14] pvcalls: Document correctly and
 explicitely the padding for all arches
To: Jan Beulich <jbeulich@suse.com>
References: <20200516102157.1928-1-julien@xen.org>
 <31a7d5b0-4e4f-960c-d4e0-8e87bf489db2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <8b0aa4b3-9220-ab13-aa8f-2b7907a3efdf@xen.org>
Date: Mon, 18 May 2020 14:15:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <31a7d5b0-4e4f-960c-d4e0-8e87bf489db2@suse.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 18/05/2020 12:51, Jan Beulich wrote:
> On 16.05.2020 12:21, Julien Grall wrote:
>> --- a/xen/include/public/io/pvcalls.h
>> +++ b/xen/include/public/io/pvcalls.h
>> @@ -65,6 +65,9 @@ struct xen_pvcalls_request {
>>               uint32_t domain;
>>               uint32_t type;
>>               uint32_t protocol;
>> +#ifndef CONFIG_X86_32
>> +            uint8_t pad[4];
>> +#endif
> 
> There's no concept of CONFIG_* in the public headers, the dependency
> (as you'll find elsewhere) is on __i386__ / __x86_64__.

Doh, I forgot it. I will fix it.

> Also whether
> there's any padding really doesn't depend directly on the architecture,
> but instead on __alignof__(uint64_t) (i.e. a future port to a 32-bit
> arch, even if - like on x86 - just a guest bitness, may similarly
> want / need / have no padding here).

Lets imagine someone decide to introduce 32-bit and then later on 
64-bit. Both have different padding requirements. This would result to 
the same mess as on x86.

So I think we shouldn't depend on __alignof__(uint64_t) to avoid any 
more screw up. Obviously extra care would need to be taken if the 
padding is higher, but it is also true in many other place of Xen headers.

Cheers,

-- 
Julien Grall

