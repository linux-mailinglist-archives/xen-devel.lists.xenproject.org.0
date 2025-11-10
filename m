Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FA4C49B12
	for <lists+xen-devel@lfdr.de>; Tue, 11 Nov 2025 00:03:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158736.1487170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIau7-0006xL-4P; Mon, 10 Nov 2025 23:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158736.1487170; Mon, 10 Nov 2025 23:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIau7-0006vV-1d; Mon, 10 Nov 2025 23:02:31 +0000
Received: by outflank-mailman (input) for mailman id 1158736;
 Mon, 10 Nov 2025 23:02:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vIau5-0006vP-HU
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 23:02:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vIau4-000Gln-31;
 Mon, 10 Nov 2025 23:02:28 +0000
Received: from [2a02:8012:3a1:0:7c23:6ba:10ba:c44c]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vIau4-001hT3-1s;
 Mon, 10 Nov 2025 23:02:28 +0000
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
	bh=0xwmyzEEGDSQClUJUJsvvMbHRf2FWr64X4lXqjn9IQg=; b=JkajC3ezAx++GkOQcfgjWEjWzW
	p4FE87yqw+z+Ni0/R5dkQz8zL75k6WzoCntRl1Ul3i0Z+GXLNC3GTDNxqmO0dyJvwZO7lWk+jF089
	IRGuO9BRSAiyjfjzFvzFz4e321xtfyP5/kK8y+PWQJdJfDTwUj6+dl4AUo9JOKtPDrHo=;
Message-ID: <241eaaf3-069c-4dc8-8161-45a9563dbc77@xen.org>
Date: Mon, 10 Nov 2025 23:02:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/12] xen/common: add cache coloring common code
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Carlo Nonato <carlo.nonato@minervasys.tech>, xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech, marco.solieri@minervasys.tech,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
 <20241217170637.233097-2-carlo.nonato@minervasys.tech>
 <0b5f19ea-6e33-4658-a165-f0af1cffbd03@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0b5f19ea-6e33-4658-a165-f0af1cffbd03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Mykola,

On 07/11/2025 08:27, Mykola Kvach wrote:
>> +void __init llc_coloring_init(void)
>> +{
>> +    unsigned int way_size;
>> +
>> +    llc_coloring_enabled = (opt_llc_coloring >= 1);
>> +    if ( (opt_llc_coloring != 0) && llc_size && llc_nr_ways )
>> +    {
>> +        llc_coloring_enabled = true;
>> +        way_size = llc_size / llc_nr_ways;
>> +    }
>> +    else if ( !llc_coloring_enabled )
>> +        return;
>> +    else
>> +    {
>> +        way_size = get_llc_way_size();
>> +        if ( !way_size )
>> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' 
>> missing\n");
> 
> As far as I can see, this error means that we did not detect a suitable 
> LLC/unified cache.
> Maybe it would be better to make that explicit in the panic message.

I am rather confused why there are reviews on the series that was merged 
nearly a year ago. If you have comments that needs to be addressed, then 
it would be best to either send a new series or start a new thread (if 
there are bugs which needs discussion).

Cheers,

-- 
Julien Grall


