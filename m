Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2191A4414B
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 14:50:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895806.1304449 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmvK3-00066e-VQ; Tue, 25 Feb 2025 13:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895806.1304449; Tue, 25 Feb 2025 13:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmvK3-00065B-Sm; Tue, 25 Feb 2025 13:50:07 +0000
Received: by outflank-mailman (input) for mailman id 895806;
 Tue, 25 Feb 2025 13:50:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tmvK2-0005zO-JM
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 13:50:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tmvJw-004fR8-0I;
 Tue, 25 Feb 2025 13:49:59 +0000
Received: from [2a02:8012:3a1:0:f5fd:6758:15c9:e7d4]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tmvJv-003AIv-23;
 Tue, 25 Feb 2025 13:49:59 +0000
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
	bh=mv0DVzcwXdxikvCGXbyr3ha1TrGRRkIV3YdO/0Ud7X4=; b=dPX1Etnvy/S0Q46vtUP32hTWls
	0/kp+RxWk4jLTCIbqyx38V5Ckoz3ApMIiVrtlyfVjwugQSwlolCSEU2npf+bNASNNkrnIRv4N2Kmk
	ELe/i38oYJD8mHZevGUAai1LuL9f/PQ10oZhxI2kJ49RAfzYf6XePhkcCGvyK8D6RigU=;
Message-ID: <a20efeaa-640c-4b7e-b54f-14f3ff15f5ac@xen.org>
Date: Tue, 25 Feb 2025 13:49:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
 <02afc1bce09dd22865c7e2bad6cad9a804fca64b.1739182214.git.mykyta_poturai@epam.com>
 <f8f72da9-797e-44e5-93c2-cadb9fd1aae4@suse.com>
 <bab5a083-3aa2-4c5f-b798-57322e1af521@epam.com>
 <0c60434c-3899-4b1e-92c8-b72afdb698db@suse.com>
 <a7d1fd12-b950-4ba2-b8e9-9131d9a2b4e7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a7d1fd12-b950-4ba2-b8e9-9131d9a2b4e7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/02/2025 11:10, Jan Beulich wrote:
> On 25.02.2025 12:08, Jan Beulich wrote:
>> On 25.02.2025 12:05, Mykyta Poturai wrote:
>>> On 10.02.25 12:46, Jan Beulich wrote:
>>>> On 10.02.2025 11:30, Mykyta Poturai wrote:
>>>>> --- a/xen/include/xen/iommu.h
>>>>> +++ b/xen/include/xen/iommu.h
>>>>> @@ -238,6 +238,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>>>>>     */
>>>>>    int iommu_remove_dt_device(struct dt_device_node *np);
>>>>>    
>>>>> +/*
>>>>> + * Status code indicating that DT device cannot be added to the IOMMU
>>>>> + * or removed from it because the IOMMU is disabled or the device is not
>>>>> + * connected to it.
>>>>> + */
>>>>> +
>>>>> +#define DT_NO_IOMMU    1
>>>>
>>>> While an improvement, it still isn't clear whose "status code" this is.
>>>> The #define is effectively hanging in the air, from all I can tell. And
>>>> from it not being a normal error code it is pretty clear that it better
>>>> would have only very narrow use.
>>>>
>>>> Also can you please omit an interspersing blank line when the comment
>>>> is specifically tied to a definition or declaration?
>>>
>>> What would you say about removing this status code entirely and
>>> returning something like -ENODEV instead, with adding special handling
>>> for this return to the callers where needed?
>>
>> I'd be okay with that; Arm folks also need to be, though.
> 
> Oh, and: Of course it then needs to be pretty clear / obvious that -ENODEV
> cannot come into play for other reasons / from other origins.

It would be difficult to guarantee that all the callbacks will never 
return -ENODEV. So I am quite reluctant to use -ENODEV to indicate the 
IOMMU is not available or the device is not behind an IOMMU.

Anyway, I can't fully remember the previous discussion. Can someone 
remind me what we are trying to solve with introducing DT_NO_IOMMU? The 
meaning of the value is already properly documented on each function 
that can return the value:

* >0 : device doesn't need to be protected by an IOMMU
*      (IOMMU is not enabled/present or device is not connected to it).

It seems to me it would be easier to open-code the value because there 
is no question of how the define is going to be used.

Cheers,

-- 
Julien Grall


