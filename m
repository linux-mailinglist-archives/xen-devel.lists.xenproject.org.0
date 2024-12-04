Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D89E4463
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 20:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848739.1263565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIus6-0004SR-Ne; Wed, 04 Dec 2024 19:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848739.1263565; Wed, 04 Dec 2024 19:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIus6-0004Pq-KX; Wed, 04 Dec 2024 19:17:14 +0000
Received: by outflank-mailman (input) for mailman id 848739;
 Wed, 04 Dec 2024 19:17:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fO+b=S5=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1tIus5-0004Pk-D8
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 19:17:13 +0000
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com
 [136.143.188.51]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b213348-b274-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 20:17:10 +0100 (CET)
Received: by mx.zohomail.com with SMTPS id 1733339821300558.3175722697706;
 Wed, 4 Dec 2024 11:17:01 -0800 (PST)
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
X-Inumbo-ID: 5b213348-b274-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; t=1733339823; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JUIFAYTptMPu+D+S5wJzODsBXuz13Y95U2dMv2fbM+ykBQ7hQjogvnv05cDXt9pS9QSMuHI05GLEcTWHPn1iGL9wtmx8OZzpkiN+nhNGWxC2R8SEBXe4+xWg5xtDo4XwmSSgsFvLUd8acETBQbz4ZVIDVfb2IMNGJhhiZaf78vI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733339823; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=StuxpsyUAmqaaCDxtlpMU/g74F5wKRQHXEQ4hk5YQys=; 
	b=Ht7tj7GYEYRLqNjIcmNJWhUGThoocP0khOqxbU1DQby0LTPaQC2jK63Rzgk7THPEhC8YBlKgS9EugC6RM1g3q5/Mnmnr51yxjHpVxD8En0BEi3npzwH/uank41OaVmItz9v8o7BSaFdWgO1xDzdwWWF9SkvlGoXBiCYPfAbP/js=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733339823;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=StuxpsyUAmqaaCDxtlpMU/g74F5wKRQHXEQ4hk5YQys=;
	b=gZ8JgUALYQDV5LsCbrKxl0N9JS49KFTFIpKvDXnxx3CAkVJFiwHV5eUgy3Fb4qR0
	hPAJR3ZCErCNKvnoMUKy1egPIR5pd9fQRZVC4wt+seO2QwdNBIbJfGYPQx+hJJGhcRk
	y7V3uJlqMmeUDiSQRUwZU1AOB0czflWWKZn5KlQU=
Message-ID: <d545214e-f44a-4dd3-a9b6-e188a9618c14@apertussolutions.com>
Date: Wed, 4 Dec 2024 14:16:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] x86/boot: introduce boot domain
To: Jan Beulich <jbeulich@suse.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-2-dpsmith@apertussolutions.com>
 <de804eaa-df1d-4ca5-9dd7-1ee36c9d150b@suse.com>
Content-Language: en-US
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
In-Reply-To: <de804eaa-df1d-4ca5-9dd7-1ee36c9d150b@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 12/2/24 04:57, Jan Beulich wrote:
> On 23.11.2024 19:20, Daniel P. Smith wrote:
>> To begin moving toward allowing the hypervisor to construct more than one
>> domain at boot, a container is needed for a domain's build information.
>> Introduce a new header, <xen/asm/bootdomain.h>, that contains the initial
>> struct boot_domain that encapsulate the build information for a domain.
> 
> Why does this need to be a per-arch header? Wasn't one of the goals to unify
> things as much as possible?

Correct and at this point the level of unification is this series that 
provides a common device tree definition.

>> --- a/xen/arch/x86/include/asm/dom0_build.h
>> +++ b/xen/arch/x86/include/asm/dom0_build.h
>> @@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
>>                                       unsigned long initrd_len);
>>   int dom0_setup_permissions(struct domain *d);
>>   
>> -struct boot_info;
>> -int dom0_construct_pv(struct boot_info *bi, struct domain *d);
>> -int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
>> +struct boot_domain;
>> +int dom0_construct_pv(struct boot_domain *bd);
>> +int dom0_construct_pvh(struct boot_domain *bd);
> 
> I'm wondering: Just a few commits ago you moved these to boot_info. Now you
> move them to boot_domain. Why the extra churn, and what further transformations
> are to be expected?

Introducing all the abstractions and adjusting all interfaces in one go 
was deemed too complex to review and originally done that way because 
doing it incrementally would require making changes to changes. 
Therefore it is an artifact of breaking the larger change into an 
incremental introduction of the changes. When the multi-domain builder 
is incrementally introduced, there will be renaming in place, splitting, 
and renaming as function are moved.

v/r,
dps

