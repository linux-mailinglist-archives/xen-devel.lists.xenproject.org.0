Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9782C7FFC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 09:33:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40719.73646 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjecH-00054J-QX; Mon, 30 Nov 2020 08:33:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40719.73646; Mon, 30 Nov 2020 08:33:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjecH-00053v-NM; Mon, 30 Nov 2020 08:33:01 +0000
Received: by outflank-mailman (input) for mailman id 40719;
 Mon, 30 Nov 2020 08:33:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj5U=FE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kjecG-00053q-9D
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 08:33:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b794f48e-d5ea-4726-8f27-58ca90e7ab10;
 Mon, 30 Nov 2020 08:32:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AD63BAC6A;
 Mon, 30 Nov 2020 08:32:56 +0000 (UTC)
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
X-Inumbo-ID: b794f48e-d5ea-4726-8f27-58ca90e7ab10
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606725176; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Ydry4higSvtBV6mILjaf+1YKXT5bhOQm95fx+ARtAM=;
	b=JWbhHEHKZF5tTMohSP2BVW/98rk6cmKy6Av6TjGMFMLBt/k1EV+/3eJmhltwcN+l6e1amS
	jOuD6eXxofs9xvCYgkshYNti9cR9chtmKlLLyN2f7UZTxI2in7zp5TYjI9ds6rVN1YBuai
	6Pc8GS1ycHSc/iBzuh8eGKVvKMlxqmE=
Subject: Re: [PATCH v4] IOMMU: make DMA containment of quarantined devices
 optional
To: "Tian, Kevin" <kevin.tian@intel.com>
Cc: "Cooper, Andrew" <andrew.cooper3@citrix.com>, Paul Durrant
 <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c78e09fa-606c-c6c4-e9db-b57cb50ee5e2@suse.com>
 <MWHPR11MB1645257FCF6DF38A68310ABF8CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
 <9ad2b898-16d8-9f80-b6ef-8f618419d369@suse.com>
 <MWHPR11MB1645ED0ED102DE2903B302878CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ae87896-1656-e383-7725-22414a8e58cd@suse.com>
Date: Mon, 30 Nov 2020 09:32:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB1645ED0ED102DE2903B302878CF50@MWHPR11MB1645.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 09:05, Tian, Kevin wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, November 30, 2020 3:35 PM
>>
>> On 30.11.2020 07:13, Tian, Kevin wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Saturday, November 28, 2020 12:46 AM
>>>>
>>>> @@ -1316,11 +1316,32 @@ boolean (e.g. `iommu=no`) can override t
>>>>      will prevent Xen from booting if IOMMUs aren't discovered and
>> enabled
>>>>      successfully.
>>>>
>>>> -*   The `quarantine` boolean can be used to control Xen's behavior when
>>>> -    de-assigning devices from guests.  If enabled (the default), Xen always
>>>> +*   The `quarantine` option can be used to control Xen's behavior when
>>>> +    de-assigning devices from guests.
>>>> +
>>>> +    When a PCI device is assigned to an untrusted domain, it is possible
>>>> +    for that domain to program the device to DMA to an arbitrary address.
>>>> +    The IOMMU is used to protect the host from malicious DMA by making
>>>> +    sure that the device addresses can only target memory assigned to the
>>>> +    guest.  However, when the guest domain is torn down, assigning the
>>>> +    device back to the hardware domain would allow any in-flight DMA to
>>>> +    potentially target critical host data.  To avoid this, quarantining
>>>> +    should be enabled.  Quarantining can be done in two ways: In its basic
>>>> +    form, all in-flight DMA will simply be forced to encounter IOMMU
>>>> +    faults.  Since there are systems where doing so can cause host lockup,
>>>> +    an alternative form is available where writes to memory will be made
>>>> +    fault, but reads will be directed to a dummy page.  The implication
>>>> +    here is that such reads will go unnoticed, i.e. an admin may not
>>>> +    become aware of the underlying problem.
>>>> +
>>>> +    Therefore, if this option is set to true (the default), Xen always
>>>>      quarantines such devices; they must be explicitly assigned back to
>> Dom0
>>>> -    before they can be used there again.  If disabled, Xen will only
>>>> -    quarantine devices the toolstack hass arranged for getting quarantined.
>>>> +    before they can be used there again.  If set to "scratch-page", still
>>>> +    active DMA reads will additionally be directed to a "scratch" page.  If
>>>> +    set to false, Xen will only quarantine devices the toolstack has
>> arranged
>>>> +    for getting quarantined.
>>>
>>> Here let's be clear about the quarantine policy when the quarantine
>>> devices are arranged by toolstack. Based on this patch it is the 'basic'
>>> form i.e. always getting IOMMU faults for such devices.
>>
>> Well, the policy is always as chosen via command line. Therefore do
>> you perhaps merely mean the default mode to be spelled out? This is
>> already the case at the beginning of the 2nd paragraph.
> 
> When I read above paragraphs, it's clear about the enabled case where
> two quarantine forms are available (basic vs. scratch-page) and how to
> choose them, but it's not crystal clear about the disabled case which 
> form is assumed for toolstack-managed devices, from an user p.o.v.

Oh, now I think I got what you mean. I've added '..., and only in the
"basic" form' to that last sentence.

Jan

