Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D38934290D9
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 16:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206069.361541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw0l-0000RR-22; Mon, 11 Oct 2021 14:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206069.361541; Mon, 11 Oct 2021 14:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZw0k-0000OL-U7; Mon, 11 Oct 2021 14:10:38 +0000
Received: by outflank-mailman (input) for mailman id 206069;
 Mon, 11 Oct 2021 14:10:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZw0j-0000OF-JU
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 14:10:37 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1f926520-0569-4a17-ac61-7a42d4446f2c;
 Mon, 11 Oct 2021 14:10:36 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-qolydffSNs274cFjWKww1g-1; Mon, 11 Oct 2021 16:10:34 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2448.eurprd04.prod.outlook.com (2603:10a6:800:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Mon, 11 Oct
 2021 14:10:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 14:10:32 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0201.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21 via Frontend
 Transport; Mon, 11 Oct 2021 14:10:31 +0000
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
X-Inumbo-ID: 1f926520-0569-4a17-ac61-7a42d4446f2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633961435;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kw2Ceni+XQKt5NPbDV+odXhQltkoHaqKnhIsBoGwAhI=;
	b=HNVH5dtuOwbSU4UZtIcEd/8D9IemDVHK7/H1bdT9u24bBeUq1QsZG7+F0lBibO8NfPtpnX
	iFwsDH98+XvPFvb2OHis6cA5IEOLfClomiaL9K5V/nt0/rKi3gBMPeGJ9JLtK6ACR3xI1V
	b/21GeMoihkzT2KHkjTjCpmnFf2B3U8=
X-MC-Unique: qolydffSNs274cFjWKww1g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5sfXKIUX0kB2mXa0M941WIFCj+U2Po/+B7/IANl9ZYauaAVp6zpDjFKBt4HQ8zm5MFUgnc0r0BQ9iJxWzy3cEyT+/4m1A82ma8QmZcZUrUCmAr+/HxnQfM5pp3Sh181i4k6zPMcCe7n7F8iQ6RCyCFrLeRJhTitf2s0WcVktmvby7fe0NEV2cBJjDvGBEbkINPzkp3a79/oaINL4VSYdY6Zh2P6u0vUQLjlB9mG4DD8ui+3yGqc4MwanTd2gJbmG+xXoux3bzZjntDymv+vcqffbU2ceifWlqCoF3V6gRYlXkBc9agiQZ3i8t3RADiYG006Ki164KVeSeJ349OoDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kw2Ceni+XQKt5NPbDV+odXhQltkoHaqKnhIsBoGwAhI=;
 b=iN4O637mQS+SMEVBiUdMc+uBIEt1ZmpLOz99jiBMQgDHFgJBz4RoAFf/UX+11q9UzaN+FyLi3+eZcUAWui4NdeAU0NUJMo/Z3IhMG2diTrunFJBs3EQrsZE0Vjf6KuzCjwWxaVHRNeVUZD1IcTDpiarJx8zAVV7N33+4EXiG2gdOhr+CJTxiRSCmouyJcGNWDT2OGGF5AukXz26bFUZnFdYclSoKR6YHhywTNwlRy5pHkXRNYuBg8p64wvQB2Xi2RC5yZ4WMd1F/G6B8rd6KYxQsJEZMAK0iCOsamr/SZ+jGbFGXqkoDJE5AOjNv6gu8hnZqsE7Kx6GqDqqrFjtsqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v5 08/11] xen/arm: Enable the existing x86 virtual PCI
 support for ARM.
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Rahul Singh <Rahul.Singh@arm.com>, Andre Przywara
 <Andre.Przywara@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <9bdca2cda5d2e83f94dc2423e55714273539760a.1633540842.git.rahul.singh@arm.com>
 <6752f2d3-171b-37f5-c809-82995a8f3f36@suse.com>
 <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
 <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
 <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <59c9e102-c710-64d3-2a1a-cc8dcbcceead@suse.com>
Date: Mon, 11 Oct 2021 16:10:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <A8DEBD07-FB45-4E4E-A2C3-7AF8B393B032@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0201.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2bbf2b29-072f-4367-1036-08d98cc0e2e9
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2448:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2448767A3C3E45DDD7B7834FB3B59@VI1PR0401MB2448.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/IBV0R7hY582V5lWg+ZWyjNmuvxfYDHD9KBKj5E6eQOGGLoGXUjMIsMmKEpHiXvXt+Cf7aJWOcm5D3mEt1ipJ1H3e6lIBEyLgc8cWvNAZNneStiRQhTbRAbXmc60j73XIzH8FKn3ZpjNkgXX35XIBViKc+qGJqYRyMQxCyxyUmDtw2vyShv/gcPKvV8zZrHDcKFWYrG0y9BzV/LotpQb5l0So7FzlB5eha7o/EHhixAGwquOdERsqAlkF+VW82XQaxUdht8Q0XLOOVhh3HGLjy1cWI+I8SqK4MqjfXdmDvaPiqNqYULIHESSEfzri2TwZW8sWoommTXZMlJX+NUIGOGKNwFMxq/kejAnfPwIevQxT2z9MWq3RUVCu/ySjLOS45tTGc1ZB4tvYcXoik/DLm+MpnK/lp+WAo0QflPRzriyUbNjPZ+Tjt+Cn3JGwV6Npw9D5eLBXg9ruMMQTguTMru+nqtW4TzO5ijHpnjU65PgGPVZwhr8s/iUkeorgPADBwG5TLVGcp3UGW6agTvyFEZR/s67KrmwGmJbaeMWeXO+lpoLVfaXdR8RzjBxTBxfb/TfzTlyQ003UtOXEt21E5krQD+eZdc7KsvSYiOiD8SyI8fowhCcpF1rOxs8dsJ1mv9OPIRjdFD9pmpnDRsiEMrQbxKzmioihwYpJQ8XcNK7Z0Gw9v5cjSxr4TabciDCD3H+GFscBbU52NTujhMoEE1SBROXEUtoOkdtoKpWMeDqqHXYxLDmA3VqMEcGkBd86w+ojfPSTD31P7Hf36N2sQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66946007)(53546011)(7416002)(8936002)(36756003)(186003)(26005)(83380400001)(86362001)(5660300002)(6486002)(8676002)(38100700002)(6916009)(66556008)(16576012)(316002)(31696002)(66476007)(2906002)(2616005)(956004)(31686004)(54906003)(4326008)(508600001)(2004002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3JpZXZkaDcxdGVaZVlIeHVSZkIycytrZVpwdTVVY3JOUDdmOExET2V6WitO?=
 =?utf-8?B?bzFkbEFhVm9NRUh0YXlQRWRIRWNPOEpqVVdFaDdwL0E4eU85WWNFdVV4UWFx?=
 =?utf-8?B?NDR4b296RTJ6bjZYWnJhYW1JekFLVmRjbnJsYWp6TG1USm4yMitQYm91SWYy?=
 =?utf-8?B?NmViT1BuTUJYOVVaYWxxSWdvYWZKSnk5MWdnNHNXaVRTZEo0ZGJRdzZGeTdm?=
 =?utf-8?B?eWZWR055Ukg5cExUSHI1VjY1cXhtNGdBcTZLQXBSYkFhUStwa3VmQ1hkcm5J?=
 =?utf-8?B?QzY5L0I1MVBRNUVtQkZEOHJPZVNFQ2g1OWtOY3lETXl5d01RdVZNQUpGeVZw?=
 =?utf-8?B?K2JrWHlRb1NYWldEMW1UM0tBcWVSaS96UzhoSFhtVHpJd01HOVdHMmRQSng3?=
 =?utf-8?B?RXZKN2V3Q1pDVzFvL2dKeTl4c0d3ZWhhUGxLKzJKd2NUQ08vWjZUa2VZbXg5?=
 =?utf-8?B?TTRUSlhsNlVFanA5aEFtcjFXN0E0WjY4VzNRK09rNFhYdkZyRXIxWXJoazNo?=
 =?utf-8?B?QzQ3ZTJSQXY0WjZBMmdqQWZ5SE1YUmlMV1NkQXFUaGV1alZvMUFkR2JlOEtj?=
 =?utf-8?B?TVVGVHVTOTNGeHhWcVdOOVJFckRpM1daNGJ5czVIazNlRGxhOGRiRnQ4bWNH?=
 =?utf-8?B?RUxQNjdVV2FHNHZUdFlaRDlTL000ck92N2xJaDAvWEZOZ0R2VXdxT1UxMitw?=
 =?utf-8?B?dTR6dkhQRWc2NlByTHNIYWdyWXRpSHZrd1lHY3BYSnl5Tko4QjJZblZTUjlK?=
 =?utf-8?B?NzM3SFArU204RGNxZjBaZEtGNloyK1VKNFpsa1NTMkhBYTkybUg4QmU5QW1n?=
 =?utf-8?B?cnZSNERlb2wxQ2ZSREtQcTZLeWVvRkI0YzIrWVcwbVNoNWRsZ1BKQUdUOU01?=
 =?utf-8?B?ZFFPTzV6V1NReGhpV2t4bzRzaC9OUXJrY2pRTUd6cHE4NGZCSnJ0anpUK1Rw?=
 =?utf-8?B?SDJWZURROU42UTc0cGhVeFVoelpCTWFOVW5XbUUvby91eVpMcks2UDREMnRz?=
 =?utf-8?B?M0dZY2NnTFE3Z0RhbC9KWDE1NFFKZWtmaEsrMlB4cnpPd0hoVHdFNnF3b21l?=
 =?utf-8?B?M3FZdDZya09sSlpiMEhpMzJ3VDBJQmlIcXJDZHVjai9XNG02cFR4c0p4OFFI?=
 =?utf-8?B?UkFqUmtVVVF1YU5rUlpuUHUzTVdNQzRFV2xrV1RZSy9zSk16Y2dEbEcxRndp?=
 =?utf-8?B?VXhpZU1xbnJCSExaTHE5Vm5kdXJtZGY0eEJ3MnFTdkVUTi8yZm1CZkxsWDhS?=
 =?utf-8?B?NUx1V0NkZUl0MElXTG5lSTUveVRhZjFiQkZVOVlNdVFweDBVUk5aYkt5WFgy?=
 =?utf-8?B?ZG5jaHY5Wjc2MmZxSWwzS3ZEaDVqUTJFMkY4T1d0WmFoN0pleG9oOGZRb0xo?=
 =?utf-8?B?VzdzSE55Y2hSczdwTUt3V0JrZWdVWFRJSTBOaXhieVp5ZUViY1ZyMVhVSlVS?=
 =?utf-8?B?L3dadEdvcjgrYTBkb2FEeHFBbFZ4Q3k1NzByVGFBQ1E1L2RWT0NkQU1XbzlF?=
 =?utf-8?B?aXVSQlpHK0gzQnFxaHAxQTJMZmlWOUtDQlJBcUNoR1o5L28yNmVMZllWR1Rl?=
 =?utf-8?B?K09iQTgwWksrdHZCak9iVi9vdWx6K3o4Tm9PNnVaMmZET3lybGZXS0FEbWlt?=
 =?utf-8?B?aWIzbE9uMVYwRG15dDY2RFp3b3lNUWdrZkVFT2Q5Qmljak5FU0dvVlhqQ3N2?=
 =?utf-8?B?MFRWcWlwRlZWbmJTZE14NUU1L25Fd1dWdHVRZVh0c0laOEhYRkd6RjQ5Q2F5?=
 =?utf-8?Q?0LAdWfagb9jqs1WfMMJ/PVBNBnqMLDlPeNAaGAF?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbf2b29-072f-4367-1036-08d98cc0e2e9
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 14:10:31.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaJrwGQFijOCBGTqQgOY4uuz7Wi4e1d1neDOkl6O5V2WQDIT7uFdKhJ45d1qRO3gTn/rzQL14ZZ12Rsv+oHylQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2448

On 11.10.2021 15:34, Bertrand Marquis wrote:
>> On 11 Oct 2021, at 14:09, Jan Beulich <jbeulich@suse.com> wrote:
>> On 11.10.2021 14:41, Bertrand Marquis wrote:
>>>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 06.10.2021 19:40, Rahul Singh wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/arch/arm/vpci.c
>>>>> @@ -0,0 +1,102 @@
>>>>> +/*
>>>>> + * xen/arch/arm/vpci.c
>>>>> + *
>>>>> + * This program is free software; you can redistribute it and/or modify
>>>>> + * it under the terms of the GNU General Public License as published by
>>>>> + * the Free Software Foundation; either version 2 of the License, or
>>>>> + * (at your option) any later version.
>>>>> + *
>>>>> + * This program is distributed in the hope that it will be useful,
>>>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>>> + * GNU General Public License for more details.
>>>>> + */
>>>>> +#include <xen/sched.h>
>>>>> +
>>>>> +#include <asm/mmio.h>
>>>>> +
>>>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>>>>
>>>> Nit: Stray blank (like you had in an earlier version for MMCFG_BDF()).
>>>> Also isn't this effectively part of the public interface (along with
>>>> MMCFG_BDF()), alongside GUEST_VPCI_ECAM_{BASE,SIZE}?
>>>
>>> I will move that in the next version to xen/pci.h and rename itMMCFG_REG_OFFSET.
>>> Would that be ok ?
>>
>> That would be okay and make sense when put next to MMCFG_BDF(), but
>> it would not address my comment: That still wouldn't be the public
>> interface. Otoh you only mimic hardware behavior, so perhaps the
>> splitting of the address isn't as relevant to put there as would be
>> GUEST_VPCI_ECAM_{BASE,SIZE}.
> 
> Ok now I get what you wanted.
> 
> You would actually like both MMCFG_BDF and MMCFG_REG_OFFSET to
> be moved to arch-arm.h.
> 
> Then I am not quite sure to follow why.
> Those are not macros coming out of a way we have to define this but from
> how it works in standard PCI.
> The base and size are needed to know where the PCI bus will be.
> 
> So why should those be needed in public headers ?

Well, see my "Otoh ..." in the earlier reply. Keeping the two
address splitting macros out of there is okay.

>>>>> --- a/xen/drivers/passthrough/pci.c
>>>>> +++ b/xen/drivers/passthrough/pci.c
>>>>> @@ -766,6 +766,24 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>>    else
>>>>>        iommu_enable_device(pdev);
>>>>
>>>> Please note the context above; ...
>>>>
>>>>> +#ifdef CONFIG_ARM
>>>>> +    /*
>>>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
>>>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>>>> +     */
>>>>> +    ret = vpci_add_handlers(pdev);
>>>>> +    if ( ret )
>>>>> +    {
>>>>> +        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
>>>>> +        pci_cleanup_msi(pdev);
>>>>> +        ret = iommu_remove_device(pdev);
>>>>> +        if ( pdev->domain )
>>>>> +            list_del(&pdev->domain_list);
>>>>> +        free_pdev(pseg, pdev);
>>>>
>>>> ... you unconditionally undo the if() part of the earlier conditional;
>>>> is there any guarantee that the other path can't ever be taken, now
>>>> and forever? If it can't be taken now (which I think is the case as
>>>> long as Dom0 wouldn't report the same device twice), then at least some
>>>> precaution wants taking. Maybe moving your addition into that if()
>>>> could be an option.
>>>>
>>>> Furthermore I continue to wonder whether this ordering is indeed
>>>> preferable over doing software setup before hardware arrangements. This
>>>> would address the above issue as well as long as vpci_add_handlers() is
>>>> idempotent. And it would likely simplify error cleanup.
>>>
>>> I agree with you so I will move this code block before iommu part.
>>>
>>> But digging deeper into this, I would have 2 questions:
>>>
>>> - msi_cleanup was done there after a request from Stefano, but is not
>>> done in case or iommu error, is there an issue to solve here ?
>>
>> Maybe, but I'm not sure. This very much depends on what a domain
>> could in principle do with a partly set-up device. Plus let's
>> not forget that we're talking of only Dom0 here (for now at least,
>> i.e. not considering the dom0less case).
>>
>> But I'd also like to further defer to Stefano.
> 
> Ok, I must admit I do not really see at that stage why doing an MSI cleanup
> could be needed so I will wait for Stefano to know if I need to keep this when
> moving the block up (at the end it is theoretical right now as this is empty).
> 
>>
>>> Same could also go for the free_pdev ?
>>
>> I think it's wrong to free_pdev() here. We want to internally keep
>> record of the device, even if the device ends up unusable. The only
>> place where free_pdev() ought to be called is imo pci_remove_device().
> 
> Ok.
> 
>>
>>> - cleanup code was exactly the same as pci_remove_device code.
>>> Should the question about the path also be checked there ?
>>
>> I'm sorry, but I'm afraid I don't see what "the path" refers to
>> here. You can't mean the conditional in pci_add_device() selecting
>> between iommu_add_device() and iommu_enable_device(), as "remove"
>> can only mean "remove", never "disable".
> 
> I will try to explain: when we just enable we do not add an entry in the list but
> we still remove an entry from the list every time (as the condition becomes
> always true because pdev->domain is at the end always set)

Well, that anomaly is what I did point out in my review remarks to
Rahul. We shouldn't remove an entry from the list if we didn't add
one. But quite likely, if we don't free the pdev, we shouldn't be
removing the list entry in either case.

Jan


