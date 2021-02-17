Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4444C31D887
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 12:38:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86226.161721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCLAG-0005hO-M5; Wed, 17 Feb 2021 11:38:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86226.161721; Wed, 17 Feb 2021 11:38:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCLAG-0005gy-If; Wed, 17 Feb 2021 11:38:40 +0000
Received: by outflank-mailman (input) for mailman id 86226;
 Wed, 17 Feb 2021 11:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFXw=HT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lCLAE-0005go-Vg
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 11:38:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0c4b9658-75e6-40de-9758-2556c233326d;
 Wed, 17 Feb 2021 11:38:37 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 45D6CB125;
 Wed, 17 Feb 2021 11:38:36 +0000 (UTC)
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
X-Inumbo-ID: 0c4b9658-75e6-40de-9758-2556c233326d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613561916; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1kg9CDmEonWqa5Cubbsh4CG5mab/QezBHryd96oV8Ss=;
	b=djwstGH2h+mp93vugv2X9BznSdSCrYeNP8nGyNq5Of9wF8m6tJ5XydblCH1lNSn4JtPs/Y
	l9TfzRU0zsY6tS9xer1DOj+5BpuiAi5NXXQmFPcIMgwVXdMCm8l7fvLwVS/U0D0gamdqNz
	1KcPQu2JwtF1iud3Gee2KUE+6RVVyfs=
Subject: Re: [PATCH 2/3] gnttab: bypass IOMMU (un)mapping when a domain is
 (un)mapping its own grant
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <156559d5-853a-5bb9-942b-f623627e0907@suse.com>
 <5bb4fba7-a10b-90c4-82f7-8cde6e8cacfb@suse.com>
 <a267959c-538e-0f90-f9a5-72e836f33cb4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <283d8514-16fb-8973-e395-0a86bf820306@suse.com>
Date: Wed, 17 Feb 2021 12:38:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a267959c-538e-0f90-f9a5-72e836f33cb4@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 17.02.2021 12:03, Julien Grall wrote:
> On 17/02/2021 10:46, Jan Beulich wrote:
>> Mappings for a domain's own pages should already be present in the
>> IOMMU. While installing the same mapping again is merely redundant (and
>> inefficient), removing the mapping when the grant mapping gets removed
>> is outright wrong in this case: The mapping was there before the map, so
>> should remain in place after unmapping.
>>
>> This affects
>> - Arm Dom0 in the direct mapped case,
>> - x86 PV Dom0 in the "iommu=dom0-strict" / "dom0-iommu=strict" cases,
>> - all x86 PV DomU-s, including driver domains.
>>
>> Reported-by: Rahul Singh <Rahul.Singh@arm.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -1243,7 +1243,7 @@ map_grant_ref(
>>           goto undo_out;
>>       }
>>   
>> -    need_iommu = gnttab_need_iommu_mapping(ld);
>> +    need_iommu = ld != rd && gnttab_need_iommu_mapping(ld);
> 
> AFAICT, the owner of the page may not always be rd. So do we want to 
> check against the owner instead?

For the DomIO case - specifically not. And the DomCOW case can't
happen when an IOMMU is in use. Did I overlook any other cases
where the page may not be owned by rd?

Jan

