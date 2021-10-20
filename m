Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E63A4345CA
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:17:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213587.371861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5qS-0005uI-LO; Wed, 20 Oct 2021 07:17:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213587.371861; Wed, 20 Oct 2021 07:17:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5qS-0005ri-H6; Wed, 20 Oct 2021 07:17:04 +0000
Received: by outflank-mailman (input) for mailman id 213587;
 Wed, 20 Oct 2021 07:17:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md5qQ-0005rc-Jp
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:17:02 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7f392c9-3175-11ec-8334-12813bfff9fa;
 Wed, 20 Oct 2021 07:17:01 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2176.outbound.protection.outlook.com [104.47.17.176])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-37-JrpqshxYO2ODZXrqH0xbCA-1; Wed, 20 Oct 2021 09:16:59 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3536.eurprd04.prod.outlook.com (2603:10a6:803:2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Wed, 20 Oct
 2021 07:16:58 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 07:16:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM6PR10CA0097.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:8c::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 07:16:57 +0000
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
X-Inumbo-ID: b7f392c9-3175-11ec-8334-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634714220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lzKpWBmNCVdXzMMpesGqb9CpcVPnwTl3L1TXTsA2oHw=;
	b=QDBWxSzUPpoZeZHqTvxbswwXz1Oj216+LEjveKFANnvalBRWHUHzLtDPj/5RYrY4HeIcEe
	hHYgzEmROaYAwdGYlHaBZA9N8E+UU3DR97PweutCX9zw7YsRBDOUp8wNtQtf5RugDADcY2
	Es79kIXmEAzpdc/uPU5ZWafOQYsSOao=
X-MC-Unique: JrpqshxYO2ODZXrqH0xbCA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jPtOOwFZWoJF43jY7y3pXZFxbtWfETgraQ6Xd2V/otyiXITb8JclZgMXDv+VLYd+zOXuJLPOEcQVdH+vF/DR29ZnDZNUKU6JTVBoBpkiSNC9/6btrsiuWm+D/Bu92t8xsn3+x+Cai5gc6MqpcOavnrMghuv6u+hVjrpTGOjLrC/Z2NgOlpv9Mwotv4HqI+Wivufya/wlzD8PiFXxsYVuhrnFdpP2vI6T8ArxcjeX0RDoizUQCTFyIJlOf3GJfwUa0Urbtl06/8uFmPRMtcPWr0PiLF6tSNyfnvUzhqfpwnplnTo9L8G4FONB0wj14fN/810wgxQWaXusTh4pS2kboQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzKpWBmNCVdXzMMpesGqb9CpcVPnwTl3L1TXTsA2oHw=;
 b=kdF0UGQI0Iki4Dizn5G23oBPzi0jodhgln8oG9iLtXqWrrIc7TiXrRUBKA71YjBqyFKtx+jKQnIk7tF7XbLyBSSin9PgfUSudo2uX2w7RrDTHO7zm6wsj9bwxpJJLoq90ukXl5GRrbtX1Ks1GWfZtBpmwKpKKV2lAOapFr9grAImRicx8lnEmmnQOOViX8FZIIwiLVc00vhumsqTIdeA0YsPfitOzZKYShBRFAh+d8G0TACUHHyp6ChY5jUkYKpnmNYQlTqfYll8p5RnHl2Km3gMKTaciZ4dIcWzAh8cMYIVdttL8wxiZao9UqkxfzoRvE6D1Z+RG8armdhpuAJkgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
To: Bertrand Marquis <bertrand.marquis@arm.com>
Cc: iwj@xenproject.org, Oleksandr_Andrushchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f77b70f-93b8-2b54-3aa1-5de677d858cc@suse.com>
Date: Wed, 20 Oct 2021 09:16:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR10CA0097.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::38) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c57a1ad3-3bed-4a23-fb83-08d993999a3a
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3536:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB35369A054589F576CFE3711AB3BE9@VI1PR0402MB3536.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	REw0PJxl98JAXFmYsIzIULGe/Goa5kvRPJTuhbrWa1ZLBtp5hrtOw4BNUTcV0IwAfypEkuvjQj/PR8pQk7LalI+Ep1ruRMfNc6HuKYOtJPP206zsGYx8Hrm9hP9DGw5owH0Pv/qpWBjQKpg6nsZ4cxosKk/DHfaPTNC6w0hje0ubBdjwjhNPfUBtCwEEPPsCCT81HByJkk4BKyY3mOlO9ayU0gNK0O5LeKQFEiJPSwaGZYkArj5LYqla751RC86G0j68NyMn9H6u88RfN8c72aoVv74vrXf4GNQxGHGPXkYSGYEgz/h6WlGPRQKTUvr5AlnAD/kg2zxwBagDfh2gK0ODolnX+JlpMc0iLMEpQJ9BczUlAfZHrEbD7rFzElA2aW+tdfjrVG02uJerRZjnjc5XcGWGGXAbZkGdORFlwHNRaKTt3kG37E/wgZ38KTvSpRHvvYMaQzBPz6zQljJoUS5xP+sDEgy83+HTnIeXJ4IBMIo4+bFy6rqynB/7yIJYvVlMoWJWb3cefc353AuE4wVN1mN2HVLvqBn37Rh8ybtT+dwgFePhN04aKLFtdkTfEMdbHVlMeShnC3sImzbcb3OLc9KxXaXe/jIaxhgoRIOSInu2dhRB8q87tVaJVMvVuLhl2glVowmlU/rNT4qtuQFhHQYiqkuQ64elEvcBmVoX7ZNR9jHSb1zyJxQElvF00lkapGIX0zdCH0bY4JSQ94b5bWrcybLfktveEZ/Tb30H1ZSPJADGDDdGAH0ch5aC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(66476007)(6486002)(8936002)(66556008)(66946007)(86362001)(31696002)(2616005)(16576012)(956004)(83380400001)(7416002)(38100700002)(8676002)(6666004)(31686004)(6916009)(54906003)(36756003)(508600001)(4326008)(2906002)(316002)(5660300002)(53546011)(186003)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OGhGZHBLZ0N1L1doM3p2eWgzeURCQXA4TTBTanNpWFJoYkR5a29IR24xT0FE?=
 =?utf-8?B?TGt6NWtmMGhmSE54N240UFQ2dzVaT1BKM2FrZEtJQzgwWFpiKys2RVJLS05w?=
 =?utf-8?B?YVdWU09OMDV2cHR3cHhReVA1WVNiZFh2UDFKTFhYZlBNRzJnUEVENlhpNXZO?=
 =?utf-8?B?V1Q2NWlXcHoxcnhaWVl0WWs4dHJHdFN6cktFWmlpbUNoRnVVVEt6bUZ5SkVn?=
 =?utf-8?B?VGxJeXRrb012UG1Fa00wcm5NeWhkMklmZmU3dTNBRE9TczNKWjV1amsybVhW?=
 =?utf-8?B?Y2JaQzdWVHNIMXBHeWlOQmNnQm1tQU1qdlhZTEgzbWlxeS83SHRDWVRpQkdj?=
 =?utf-8?B?R1c5NlBlVHNUemhCYXlkSTFjYm9VNzExV25mM2xTUzZQS3lROXR0TGRDM1Fa?=
 =?utf-8?B?TEtIWkl4eitiQmhMcEg3d0JhelVrMkZobnRlbkdTdjdTSE5zYUpkYXJQVTB5?=
 =?utf-8?B?QkdQb2VqLzlnS1V1aGZxKzBGaE04bXdYSDAvcDlWRTJKbkdCUGwyN2RoaEZi?=
 =?utf-8?B?WExaQ1BxNFhTWkRiN3dsa2N6RklRaHRrN0E3Y0h1aElEUGEyVEpCT0RLejRP?=
 =?utf-8?B?VDVCa1ZOa2ZxWUF4Q0VoVXorZXRPd3RTM1prVDY2a1RnZ3pJaEVHNzFuQkEz?=
 =?utf-8?B?d2UwMHZmbWp1MU9RL0l3VlJNL1g3aGJGeDRVaXJXbHlKRDNTVEpmVVFtYlV1?=
 =?utf-8?B?NVJhUE84UmE2eEg0MHNWdXdxam9zQWQyVjh2UjF5UEtkQ0hpQ256Uy95QzNZ?=
 =?utf-8?B?WmVON1ZFTGdVSTZvTDJlbDg2TURZWDgxZ2xDZ3JLd1piaEFYYnZPOHN1SGJK?=
 =?utf-8?B?V0Q1Rkt6b2ZoN2hxcGdQdCtQcEVSc2pRZ0tZZ2FLSjIzeW00S0FEV0Fsa3c0?=
 =?utf-8?B?S0lhZXdWbzZDT1hIeTNVL3pKZEtEM2JnVDZ1UnY5Wnd5b042dTdQSmxDdnRJ?=
 =?utf-8?B?NzdXRjlmekNwSTdpWGttU0dsVEhnM2syUzZxeHV2T0k5MW9lUHY4ZEdSZVZ4?=
 =?utf-8?B?WEFQeVFnNGR6TkExNnlmNHg4dG5qcjM4eUdQRnpBQWRjOUVweHlVSmRuSkVM?=
 =?utf-8?B?OGc5UXhVMEZvajk4NVdlNU51dmRzMENHR2ZHa2Z5YlJLODVkWC9rK2R6dUx3?=
 =?utf-8?B?MUR5eSs5eWxhMUgzNzI2NmwxaTdtN0F3WkF0QmVVMXdzNE5QbEI0ZGFFNENj?=
 =?utf-8?B?VTNjb1NvRlVRcm1FWHJpbC9DZkh1VHlhYVU3L0RDb1JKK2toQnFPeFUzUmth?=
 =?utf-8?B?ZzYzQUhuVDlvVFdydDhWVHcrNHZVZlRWdXkvN0tlSXRHN2lLM0Q0bzcwOTNr?=
 =?utf-8?B?b3NickJodzB3cHVWZ3FWblViWTl5VkQ0bzRQQWhZdHkxL0IyWnFRTi93cmNC?=
 =?utf-8?B?aUZnM2V4NEZtVU5Eb0E4cVdsZGtyaWdvRnI0bFRwQWdXUjVpRkRKYzcrTytk?=
 =?utf-8?B?SmdCeWdzR21wQy83Um83cndlcHdVUStjQXhzNlhZaE9qaFpVdnhBM3k0K0lR?=
 =?utf-8?B?WlYvaVU2NVFyOG16MXcxbWVhaWJGeTd4OE5qTEZnRzdCNUZISUpNNXdYczVR?=
 =?utf-8?B?QklEc2xHUlIwRXBTT3dKS1VIYVhLSzN0MHV2amhoMENDV3NacThlOFZqRmR4?=
 =?utf-8?B?eFpwQVBWenVjeWFod2NrZHBlUHc3UzdaOVhMTkEyOG0vWHVkOXJkZjQ3MVdu?=
 =?utf-8?B?SjVSV1NFSlJHM0FyMWlMLzlWVitFZmxxNThMSHQyRU5CWlFGZHUrTnZTRVRq?=
 =?utf-8?Q?H+82uNQpYdzIHaIHOXwUTzcomhYqRfB9UJeIjQb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57a1ad3-3bed-4a23-fb83-08d993999a3a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 07:16:57.7721
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3536

On 19.10.2021 18:08, Bertrand Marquis wrote:
> Xen might not be able to discover at boot time all devices or some devices
> might appear after specific actions from dom0.
> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> PCI devices to Xen.
> As those devices where not known from Xen before, the vpci handlers must
> be properly installed during pci_device_add for x86 PVH Dom0, in the
> same way as what is done currently on arm (where Xen does not detect PCI
> devices but relies on Dom0 to declare them all the time).
> 
> So this patch is removing the ifdef protecting the call to
> vpci_add_handlers and the comment which was arm specific.
> 
> vpci_add_handlers is called on during pci_device_add which can be called
> at runtime through hypercall physdev_op.
> Remove __hwdom_init as the call is not limited anymore to hardware
> domain init and fix linker script to only keep vpci_array in rodata
> section.
> 
> Add missing vpci handlers cleanup during pci_device_remove and in case
> of error with iommu during pci_device_add.
> 
> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> defined.
> 
> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> for ARM")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I'm inclined to suggest s/exit/error/ in the title though (and maybe
also s/path/paths/), which would be easy enough to do while committing.
But first we need Roger's ack here anyway ...

Jan


