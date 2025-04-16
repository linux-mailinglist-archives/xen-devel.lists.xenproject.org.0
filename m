Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC80EA9058C
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 16:09:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956278.1349744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53SO-0004tt-Q5; Wed, 16 Apr 2025 14:09:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956278.1349744; Wed, 16 Apr 2025 14:09:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u53SO-0004sR-NH; Wed, 16 Apr 2025 14:09:40 +0000
Received: by outflank-mailman (input) for mailman id 956278;
 Wed, 16 Apr 2025 14:09:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S7a8=XC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u53SN-0004sL-B5
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 14:09:39 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6cb90560-1acc-11f0-9ffb-bf95429c2676;
 Wed, 16 Apr 2025 16:09:36 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1744812565751917.8576138284637;
 Wed, 16 Apr 2025 07:09:25 -0700 (PDT)
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
X-Inumbo-ID: 6cb90560-1acc-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; t=1744812568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BCis9hV7oWV6F1kyeKaEJ497qn1iFleMTzUyoB/LysVY1/QFABhTJw8bLmyb4lEalxlkFRC6Hu0ypwvOamG1LepTf++3hB0z++hRphvYMc2cxEhgF0vRYXW6rMQp7LMDOr9X8yziXddAXE0LT5s/pwdpkXdARfUfcAudBW4KVJk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744812568; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bgJEe1PXQwKcecuib65KktJ9XTH1TD3iCEqg49HXt8g=; 
	b=ilDT0vREVbrTOG/GO+eCIuKxW5CzAfa1WWmMqghmRyfUbNh4kKa5bKjP/ZyWYHv6iJFp3uTu1ZhO8WwlEGBarRUnttK7sD8QBOVnhymfAkATXagjVQOeD3Hfk2g6bhjUsAHtBpLXFPhVDogjn+HZPnafpiU3GzwluXBb7wMglxQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744812568;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=bgJEe1PXQwKcecuib65KktJ9XTH1TD3iCEqg49HXt8g=;
	b=RD30UROEt+Wn6aOC2gcDxhGk7CWXbxPmOrv4TNlZ42WEg4Xf8Q6hIIJGN+bIhj3D
	8PlFlvwEfZxibvseHZw94jZLbPRj3/Tbng5oRAaEu69F/04UZf3QGx5rpDanC6pPug+
	EnAPQcoZwipI5ZSTAuzZIZOsWAicVavu0AyBEJx0=
Message-ID: <e78a9dcd-3fa3-4c66-860d-3d2b8206b67c@apertussolutions.com>
Date: Wed, 16 Apr 2025 10:09:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device
 tree
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Alejandro Vallejo <agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-14-agarciav@amd.com>
 <7a13e61b-8568-4852-bb46-974964e02d61@suse.com>
 <82fe6290-ea16-4e4f-8be4-76b9b624e398@apertussolutions.com>
 <c9290102-d29d-4c54-9052-995e960e4ea0@suse.com>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Autocrypt: addr=dpsmith@apertussolutions.com; keydata=
 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
In-Reply-To: <c9290102-d29d-4c54-9052-995e960e4ea0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 4/16/25 09:38, Jan Beulich wrote:
> On 16.04.2025 15:32, Daniel P. Smith wrote:
>> On 4/10/25 07:57, Jan Beulich wrote:
>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>> --- a/xen/arch/x86/domain-builder/fdt.c
>>>> +++ b/xen/arch/x86/domain-builder/fdt.c
>>>> @@ -193,6 +193,25 @@ static int __init process_domain_node(
>>>>                bd->domid = (domid_t)val;
>>>>                printk("  domid: %d\n", bd->domid);
>>>>            }
>>>> +        else if ( strncmp(prop_name, "mode", name_len) == 0 )
>>>> +        {
>>>> +            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
>>>> +            {
>>>> +                printk("  failed processing mode for domain %s\n", name);
>>>> +                return -EINVAL;
>>>> +            }
>>>> +
>>>> +            printk("  mode: ");
>>>> +            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
>>>> +            {
>>>> +                if ( bd->mode & BUILD_MODE_ENABLE_DM )
>>>> +                    printk("HVM\n");
>>>> +                else
>>>> +                    printk("PVH\n");
>>>> +            }
>>>> +            else
>>>> +                printk("PV\n");
>>>> +        }
>>>
>>> My prior questions here remain: What's the significance of
>>> BUILD_MODE_ENABLE_DM when set alongside BUILD_MODE_PARAVIRT? What about
>>> any of the other bits being set?
>>
>>   From boot-domain.h:
>>                                             /* On     | Off    */
>> #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
>> #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
>>
>> The logic says, if BUILD_MODE_PARAVIRT bit is not set, thus an HVM
>> domain, check if BUILD_MODE_ENABLE_DM has been set. This is determin if
>> the domain is what the toolstack differentiates as either an HVM or PVH
>> domain. As you should know, there is no case of a PV domain requiring a
>> backing device mode (DM) domain. IOW, BUILD_MODE_ENABLE_DM is only
>> relevant to an HVM domain.
> 
> And hence should (my conclusion) never be set for a PV one.

Yes and?

> Except - how wide or narrow do you mean "DM"? There are certainly cases
> where a PV guest requires a qemu to serve as backend for one or more
> devices. That's not what "DM" originally meant, but it goes in that
> direction. Hence just to avoid such an ambiguity I think it's better to
> properly reject any flags / flag combinations that we can't make sense
> of.

OpenXT has done this for since it was XenClientXT, and those are driver 
domains. We do distinguish between the two because a device model domain 
is specific to provide the larger core device plane to a domain. While a 
driver domain is a much narrower scope of providing a specific emulated 
hardware device to one or more domains. As a result, they have totally 
different security policies applied to them.

v/r,
dps

