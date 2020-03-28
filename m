Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC70196532
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 11:55:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jI95g-0005CV-9s; Sat, 28 Mar 2020 10:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=eoyf=5N=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jI95f-0005CL-2c
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 10:53:23 +0000
X-Inumbo-ID: 57c81284-70e2-11ea-a6c1-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 57c81284-70e2-11ea-a6c1-bc764e2007e4;
 Sat, 28 Mar 2020 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8vaf3d+uhJiRLj435/ha2i9sn3nxkyjZup9zocN7ED0=; b=Aurx0by1q2AMT3qaLOCdwRrX1x
 rtTuMsOaQ8TQnQsL9BV1cd9Fz6NA2DG+f4LoUGLTvZUYTzX57F8E3mIBhw3OOzaJ6Djl0LPq7SMZI
 SRQmf0Q3COLVvbQYkAgkAgcX3cwRST1sEx10antKY3nyBUI5Xj6HssOq7PoV074PYepM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI95d-0007r3-0w; Sat, 28 Mar 2020 10:53:21 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jI95c-0006eI-RD; Sat, 28 Mar 2020 10:53:20 +0000
To: Jan Beulich <jbeulich@suse.com>
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-10-julien@xen.org>
 <bae1a883-45ad-344d-ecbf-4eddc7627182@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d3c391bb-f66b-a4fd-0848-46238db9cf59@xen.org>
Date: Sat, 28 Mar 2020 10:53:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <bae1a883-45ad-344d-ecbf-4eddc7627182@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 09/17] xen/x86: Reduce the number of use of
 l*e_{from, get}_pfn()
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 27/03/2020 10:52, Jan Beulich wrote:
> On 22.03.2020 17:14, julien@xen.org wrote:
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -1138,7 +1138,7 @@ static int
>>   get_page_from_l2e(
>>       l2_pgentry_t l2e, mfn_t l2mfn, struct domain *d, unsigned int flags)
>>   {
>> -    unsigned long mfn = l2e_get_pfn(l2e);
>> +    mfn_t mfn = l2e_get_mfn(l2e);
>>       int rc;
>>   
>>       if ( unlikely((l2e_get_flags(l2e) & L2_DISALLOW_MASK)) )
>> @@ -1150,7 +1150,7 @@ get_page_from_l2e(
>>   
>>       ASSERT(!(flags & PTF_preemptible));
>>   
>> -    rc = get_page_and_type_from_mfn(_mfn(mfn), PGT_l1_page_table, d, flags);
>> +    rc = get_page_and_type_from_mfn(mfn, PGT_l1_page_table, d, flags);
> 
> To bring this better in line with the L3 and L4 counterparts,
> could you please drop the local variable instead? Then

I will do it.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Cheers,

-- 
Julien Grall

