Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6AC9EC124
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 01:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853525.1266956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLB32-0005Qu-Ur; Wed, 11 Dec 2024 00:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853525.1266956; Wed, 11 Dec 2024 00:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLB32-0005Ox-RY; Wed, 11 Dec 2024 00:57:52 +0000
Received: by outflank-mailman (input) for mailman id 853525;
 Wed, 11 Dec 2024 00:57:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lbUB=TE=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tLB30-0005Or-Vr
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 00:57:51 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ef33b6f1-b75a-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 01:57:48 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733878658727540.469110684163;
 Tue, 10 Dec 2024 16:57:38 -0800 (PST)
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
X-Inumbo-ID: ef33b6f1-b75a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733878661; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jpeaWtvOOhwLlouOtQU/Pw/h2E3SdTOU/Rgb6MiyQ+5oBp1hbDUc8aef4WmwnIVEzNrA9TCXIgmsGH0fh8DJYypR9yZnBGG3hjYS1K0YuKVXfyUxLenQMI9P/zXH99T2wsaXcYy65Fnsh/0HBbMIDaqner4eRMFdpuUx0du8vEg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733878661; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+OPkbT16o3bYHk6acl1lNzdU3SOOeeF6WOeEkuYsQWY=; 
	b=IR+c9gb9FWmkQGJIFlx7somppyqT7gLGEsQMxiW5qEoWL3SQqCOuBHc7d+o3KaEtV7q8O+kNBL1eprDbrzeqzkuszKsSqO6zqDCsxqkxauJWwUWwBBaZiloD7oY7UOqH7LbkH38V/V+oc9k/C5+ypHfuRC423ojfDkSQsCD8af0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733878661;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+OPkbT16o3bYHk6acl1lNzdU3SOOeeF6WOeEkuYsQWY=;
	b=DdolmXwLioHlczhdUol04lWwwiqmpbbyMzGl/2RQApNdfZd+Oec6BEm/CVkkI2FW
	ov0ii6YfJP95XFL/pums4QKNo5kMksMu4CankHRvGY/pm0aE+3E448ykGIi5Bko4Knu
	JXAmIPt0ASplUg6nTOQb9psLQqVhyvf7rhYbX22Q=
Message-ID: <cd9cde6a-16bc-4ec9-94af-b499fbdde3d6@apertussolutions.com>
Date: Tue, 10 Dec 2024 19:57:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 5/6] x86/boot: introduce domid field to struct
 boot_domain
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-6-dpsmith@apertussolutions.com>
 <bfbd15eb-9888-4988-b9a1-8191a696a4c2@suse.com>
 <83e3b0a9-e0e6-4d36-a3ce-4687b1886733@apertussolutions.com>
 <7f40d7ba-26ec-4301-abbc-aef5d1ade44c@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <7f40d7ba-26ec-4301-abbc-aef5d1ade44c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/9/24 03:55, Jan Beulich wrote:
> On 04.12.2024 17:45, Daniel P. Smith wrote:
>> On 11/27/24 05:32, Jan Beulich wrote:
>>> On 15.11.2024 14:12, Daniel P. Smith wrote:
>>>>        init_dom0_cpuid_policy(d);
>>>>    
>>>>        if ( alloc_dom0_vcpu0(d) == NULL )
>>>> -        panic("Error creating d%uv0\n", domid);
>>>> +        panic("Error creating d%uv0\n", bd->domid);
>>>
>>> Imo this would better use d->domain_id. And while touching it, %u would also
>>> want swapping for %d.
>>
>> hmm, I was actually considering s/d%u/%pd/ and just pass in d, but was
>> certain if there was an explicit reason it wasn't used before. If I am
>> going to change it, would %pd not be more desired here?
> 
> When writing my original reply, I certainly considered this. The anomaly
> here is that you really mean to log a vCPU ID, which would require a
> struct vcpu * and use of %pv. Yet you don't have that here, precisely
> because the creation of the vCPU failed. That said, since
> vsprintf.c:print_vcpu() calls print_domain(), using %pd is certainly an
> option here (inconsistencies would arise if %pv and %pd presented domain
> IDs in [perhaps just slightly] different ways).

Will do, thanks!

v/r,
dps

