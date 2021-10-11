Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7EF428D8E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 15:09:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205969.361408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZv3N-0003o9-44; Mon, 11 Oct 2021 13:09:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205969.361408; Mon, 11 Oct 2021 13:09:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZv3N-0003lL-0e; Mon, 11 Oct 2021 13:09:17 +0000
Received: by outflank-mailman (input) for mailman id 205969;
 Mon, 11 Oct 2021 13:09:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TNE=O7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mZv3L-0003lF-IF
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 13:09:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cd2b8b5-b76d-47d6-bcd9-ce18d1ab05c6;
 Mon, 11 Oct 2021 13:09:14 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2054.outbound.protection.outlook.com [104.47.12.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-24-b_DOIOJCPyK2x-N1vah8lg-1; Mon, 11 Oct 2021 15:09:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4191.eurprd04.prod.outlook.com (2603:10a6:803:45::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20; Mon, 11 Oct
 2021 13:09:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 13:09:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0601CA0058.eurprd06.prod.outlook.com (2603:10a6:206::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.25 via Frontend Transport; Mon, 11 Oct 2021 13:09:09 +0000
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
X-Inumbo-ID: 2cd2b8b5-b76d-47d6-bcd9-ce18d1ab05c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633957753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kwg6JW8ZFQFAQGuD8NHuC30RImUViY+JB18LDSX1Blk=;
	b=FttYGkzZL8jV9/d8C5UBvoASOSyJ1XFzBfgUaoxbJLPKU+yCvIf3atvmrjpHCZwoYrczXW
	h4YU+y1/QbpBaknYV0yshlYWSLaBjmLZ4JqLPRYoNVnqzMGoNi2oUdg89DSjY75WtpMMSM
	VH4JY24cy7taBGCEDJ43F3LWEK35H5s=
X-MC-Unique: b_DOIOJCPyK2x-N1vah8lg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQVyQ/5xlBZQ2rvxEqRNNzV5ARQNYxU1Lsalzn4RQiI+w91p6+t+nwyMwnvdySEm0NZBqHmYzmTj2s3vcsdfRYWT5wz5mImn6OZjzOXTl9/kT3I/tDg7mQiseDlWJ600FHupHTt1jjCyv8qglkhLuSymzfZAGV0BOTsHcUM1tbg2dIP9LAH80/zOCrydJ6sCSvarzH8WDryVOI74KIgYN0JZ/NVG4Fop6StofkzLi1OWjgd8MrL9XlYgO5udc7zXAnHMC4KPxeyRLLpAr45iVWPMwz5dMS+yEUKFNo7vLDkMpecOofCWPvw6CfAhvMYufz3CkI0DIgl6PNm36Mu9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kwg6JW8ZFQFAQGuD8NHuC30RImUViY+JB18LDSX1Blk=;
 b=NvOsTdnPMEc6PQG233UKQ8s9thdJR6ki2T9dmGLyk/pdPVQQgYZfFgKZqdW0PnzwbMmO4hFXeRXMGQhUIyvpAbST4DCB+Q2/mFDCHLoFZvoLKELdG5MVrX/7j3hIE87EQYQ3vbLqdoLpFto8CYMt74H5D+emsOuqhM//ODfRHG5j365n5H8o3gOWlXNOhCtnis3Su7Dzjz6hYmXSqhaTztzr3GHCoyX5XxaHlILGNzscc9vcNjh4d5jQUxQXItdMIEvGSrkwdi3MGGz8QXdj2AS8rncGn8TREyCBVr/BzFkkh2utJcjPA3irNtnRevzgQnAMsRbikkD+8golgJTM3Q==
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b735c2d3-1dbb-ce0a-c2fa-160d4c6938d3@suse.com>
Date: Mon, 11 Oct 2021 15:09:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CEF7FFB0-779A-4F46-8667-6BCD9BA5CB6C@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0601CA0058.eurprd06.prod.outlook.com
 (2603:10a6:206::23) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b279947-83e4-4fe5-eccb-08d98cb85066
X-MS-TrafficTypeDiagnostic: VI1PR04MB4191:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4191AAD3C82D44B767F763E9B3B59@VI1PR04MB4191.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9bmMW+zzRSCIrUe5GcE/ObwCKagCwuf2vGu4hXDl0B5YweV37unRp18m3+6cnK1X43esiukDKTi9F31xx38i6XkAcc1gnBynxzl6MipWNf4OvWyaWdtltrHw4rzPRtjNZ5cKrva9GJZMu/p7M8tamGTdcrXqxZ4NQvsfzl7xOTOdxuZ1/Mc73TXsqOmDD7fbm/kEc42u2PDBDrdDxBSg5EqHXVikmufLxbR4JDwaHKXWg2OzSP3FiYXacGmQKVCZzxtVr6nHPK1MZSHAIEy0Jb5Qm6iE6L3+fbksbaP5Kh4802qyY9VDQllBadj24AZuYDOQFFFXoitIX2IwZku6umOKXij3YGA8I+Me4QMWCi05HDuOG3d35jmRozLebosTDV2MKRcEZ8+C7azvhZ2u96f7tlZ4rcyDiJhFH6HVnn2fbTIINTgjKnS85ceOOVEZH5lLrxdsfho+Dc5AubdGj8JYXAa9Xywx3bQfcv0CiwvXcFQsan4BeojfCJG4C6rlJgBz0ihwcgQTRt4p5cUFT5QWxkZu/DKx2bL1LTftbqyHLg1HBcaj9QbN0P+MNgdOZuyMqBHw8QG97jwFdPPfPeiZbaOCjX9tmUu+UBW8CWjLFdaqFNNjUtRGSVuW69mI2QpkQPPCTCm6tfIvw376TRzh2jW3yBpeUDCkOUsLuVJsMRZrCZTTtxugyZBCOqBrOz3clCfP2WBjqBgboJEsoK3GPXyDvJSciyWuCM4tYjZLv+sXkJUX1vIsZGBghM0auEzYaNNZE/LXwwJo2EXQqg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(8936002)(66556008)(6486002)(956004)(26005)(66476007)(83380400001)(186003)(53546011)(7416002)(66946007)(36756003)(8676002)(31696002)(31686004)(54906003)(38100700002)(316002)(16576012)(4326008)(5660300002)(2906002)(508600001)(6916009)(86362001)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnFJRlN3UWtRTGNGdkYvak42L3c3dG1DZU1LVTBHZkp1WUVJUVhqSE5qTEd2?=
 =?utf-8?B?Tk83RFBEcTByNDhLU0NCUVpPbllIL2hOTGNxR3R5Yy9JYWVRbVltY0ZlZjRV?=
 =?utf-8?B?akZVYmVPYWJYNTQreC9QQmJVejA4MWx0SEtWZVdRV0tsb2EyMU9uc3Jzd0Iv?=
 =?utf-8?B?bHhLQTA0bEZ5aUdmcW0wc1cwOGJkelN4S2ZUbUt2NEZUM1FaQlN2N21UdVRP?=
 =?utf-8?B?eHZkeFFScDRRemZvNHhiYTYzakFOdm05YUJjVkY1dnpaVGtkT3FRK2RlWk1r?=
 =?utf-8?B?UEhCc0tWOStZd3R6ZlQyNC9qeWtoTjN0cytHY2Mrby8xQ3ZVSUh6eHdxQWxH?=
 =?utf-8?B?eXVpR2tVY1lEWUt0T3FKUjhVVGtnVnBmWjErMzZvdkFrbVFZS3JRZFlOdnUr?=
 =?utf-8?B?OXp5UkF4eHA2bmxyT2ZTU3JxQTBBNGlhbTRxYTJmaWZzS1Q3TzFwbjBVVGNK?=
 =?utf-8?B?d205d2FvTjh4Z0c5SDhhdHYzWnloWEFTTmJVaHIvdnNMUHg2SFVNZTlNYzRv?=
 =?utf-8?B?a3lSZEtOZW5Pbm42aXdaY2xJVUNYWVc1VjV5cWwzMW9HYzBkTjRIaC9TUTNR?=
 =?utf-8?B?aDhtWnFxNWFybzlPVnAwcVV5SUVFQnV5dFBsZzJJRWJTd2MvSlI5Z2I5RmFI?=
 =?utf-8?B?Nkcrc3ZoN1hPT0I1ZDNvMlR4eWN0SjVMMWVna3VEbWhqMDZ6MktHZ3BBbWl2?=
 =?utf-8?B?aEZmM2ZWRXFrZ2U3Um5sclBCVC9qQWlYWW16aGgzam9OdDdabzlIUElDU2Rp?=
 =?utf-8?B?ekhST2M1bUxGbWhUSzZ2SGVBS3BJeVByNjI2aG9kME9FQVFjVGF6UUljQ3JP?=
 =?utf-8?B?R0c3ODI3TDlEdlBCMmRvVXBnUUdZejM0NjFSMng5L0tJdUg0WHNFMlFqQklt?=
 =?utf-8?B?MEZnd1FEaTR0SVdvbjdkdFhjU0hSYXFYR0duS3lzTVdCcEJoQ0c3dXBxQnQv?=
 =?utf-8?B?YTJHdTFYcjJ4TWdJWGFSS0VBb1AzNVNWUEc1MktNKzh2ajd6RDV0NHhRdC9O?=
 =?utf-8?B?ZUNKQlU5VEFUZzFFVlNLVkFIeC9EVnhhYWVka293cXUxcjc4WGxpZytENEtQ?=
 =?utf-8?B?VHdpSnJBdVlPS2phNUtWUFV0cy9oQzV6djQ5dm52d2dpT0pPVGYvQVJtUkQw?=
 =?utf-8?B?d1AzUy8wbklPSHEvOGNzN1BHZ3FIbTUxMFNSNjN0RHBvd29LeUU3WDZvOW5v?=
 =?utf-8?B?TEo3NnlzY0xpTjBzKzRWWkh3UElFdHQ5Q2RyMUh5Z1VRZmN4NFZVODFobit6?=
 =?utf-8?B?VTNMVERuT3YybGpZWXY1YUdxRkMrZ2NlRW8wUGFHWU5ERldHSDQzcWgxOXBK?=
 =?utf-8?B?Y2hqMnU5WW5zdStmelorUndqMStjb0JSeVlaTzZjejFqQkJaWlJZM21EWFAw?=
 =?utf-8?B?MDNDSTgvZ0xkY09aK3FNTnVXVmwvODlnNlppWjcyalFuZmJEaDR0NjhjSnl4?=
 =?utf-8?B?Z3V5bmtoSlBTMHUvL1cwbHcyU29QOWtUU0NjZ1JxZExkZmJGRUNPMVJ5SXEr?=
 =?utf-8?B?b0RVMEdBazJ2VktMa1R6SFMvUjNldjMvMGs2QVI1OEUvZ1lmQkl0TU9jQ0pW?=
 =?utf-8?B?b3JleENLTXlvN0U3Zm1OdERlOTZkZDQ5Z2hscFpFcnhDUXVQSkVWM3pEb2pZ?=
 =?utf-8?B?WC84OUNkdmJNaUVmNXNYcitrSDR5RnZNSEtmZDR4Qmp3MGNnK3EzVzdvTFNn?=
 =?utf-8?B?Njg0SFF5WU00MkZST0x3L3ZuMytiK2VzWTNHcUEvY2I3V1FVTEFnT2U4MVV0?=
 =?utf-8?Q?i2uG24JsjGvyboJBPUG+6CGx8YnCPIFzwwik6v8?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b279947-83e4-4fe5-eccb-08d98cb85066
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 13:09:10.1608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BEoowrqca829z8gUm8+uUmsH7oFRcuao9+e4YGWUvkYiAE7PsUU2mmsXEYFEDK+AUtfOZUtzOW/CQuBuizsaCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4191

On 11.10.2021 14:41, Bertrand Marquis wrote:
>> On 7 Oct 2021, at 14:43, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.10.2021 19:40, Rahul Singh wrote:
>>> --- /dev/null
>>> +++ b/xen/arch/arm/vpci.c
>>> @@ -0,0 +1,102 @@
>>> +/*
>>> + * xen/arch/arm/vpci.c
>>> + *
>>> + * This program is free software; you can redistribute it and/or modify
>>> + * it under the terms of the GNU General Public License as published by
>>> + * the Free Software Foundation; either version 2 of the License, or
>>> + * (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/mmio.h>
>>> +
>>> +#define REGISTER_OFFSET(addr)  ( (addr) & 0x00000fff)
>>
>> Nit: Stray blank (like you had in an earlier version for MMCFG_BDF()).
>> Also isn't this effectively part of the public interface (along with
>> MMCFG_BDF()), alongside GUEST_VPCI_ECAM_{BASE,SIZE}?
> 
> I will move that in the next version to xen/pci.h and rename it MMCFG_REG_OFFSET.
> Would that be ok ?

That would be okay and make sense when put next to MMCFG_BDF(), but
it would not address my comment: That still wouldn't be the public
interface. Otoh you only mimic hardware behavior, so perhaps the
splitting of the address isn't as relevant to put there as would be
GUEST_VPCI_ECAM_{BASE,SIZE}.

>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -766,6 +766,24 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>     else
>>>         iommu_enable_device(pdev);
>>
>> Please note the context above; ...
>>
>>> +#ifdef CONFIG_ARM
>>> +    /*
>>> +     * On ARM PCI devices discovery will be done by Dom0. Add vpci handler when
>>> +     * Dom0 inform XEN to add the PCI devices in XEN.
>>> +     */
>>> +    ret = vpci_add_handlers(pdev);
>>> +    if ( ret )
>>> +    {
>>> +        printk(XENLOG_ERR "setup of vPCI failed: %d\n", ret);
>>> +        pci_cleanup_msi(pdev);
>>> +        ret = iommu_remove_device(pdev);
>>> +        if ( pdev->domain )
>>> +            list_del(&pdev->domain_list);
>>> +        free_pdev(pseg, pdev);
>>
>> ... you unconditionally undo the if() part of the earlier conditional;
>> is there any guarantee that the other path can't ever be taken, now
>> and forever? If it can't be taken now (which I think is the case as
>> long as Dom0 wouldn't report the same device twice), then at least some
>> precaution wants taking. Maybe moving your addition into that if()
>> could be an option.
>>
>> Furthermore I continue to wonder whether this ordering is indeed
>> preferable over doing software setup before hardware arrangements. This
>> would address the above issue as well as long as vpci_add_handlers() is
>> idempotent. And it would likely simplify error cleanup.
> 
> I agree with you so I will move this code block before iommu part.
> 
> But digging deeper into this, I would have 2 questions:
> 
> - msi_cleanup was done there after a request from Stefano, but is not
> done in case or iommu error, is there an issue to solve here ?

Maybe, but I'm not sure. This very much depends on what a domain
could in principle do with a partly set-up device. Plus let's
not forget that we're talking of only Dom0 here (for now at least,
i.e. not considering the dom0less case).

But I'd also like to further defer to Stefano.

> Same could also go for the free_pdev ?

I think it's wrong to free_pdev() here. We want to internally keep
record of the device, even if the device ends up unusable. The only
place where free_pdev() ought to be called is imo pci_remove_device().

> - cleanup code was exactly the same as pci_remove_device code.
> Should the question about the path also be checked there ?

I'm sorry, but I'm afraid I don't see what "the path" refers to
here. You can't mean the conditional in pci_add_device() selecting
between iommu_add_device() and iommu_enable_device(), as "remove"
can only mean "remove", never "disable".

Jan


