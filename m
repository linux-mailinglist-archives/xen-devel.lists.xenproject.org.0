Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B62643119B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 09:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211740.369383 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNQV-0003Mx-58; Mon, 18 Oct 2021 07:51:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211740.369383; Mon, 18 Oct 2021 07:51:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNQV-0003Ji-1y; Mon, 18 Oct 2021 07:51:19 +0000
Received: by outflank-mailman (input) for mailman id 211740;
 Mon, 18 Oct 2021 07:51:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNQT-0003Jb-LS
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 07:51:17 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b80e1da-2fe8-11ec-82cb-12813bfff9fa;
 Mon, 18 Oct 2021 07:51:15 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2106.outbound.protection.outlook.com [104.47.17.106])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-t6pQhcLQM3uBaZLQEGmzPQ-1; Mon, 18 Oct 2021 09:51:13 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2334.eurprd04.prod.outlook.com (2603:10a6:800:29::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Mon, 18 Oct
 2021 07:51:11 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 07:51:11 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0002.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17 via Frontend Transport; Mon, 18 Oct 2021 07:51:10 +0000
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
X-Inumbo-ID: 2b80e1da-2fe8-11ec-82cb-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634543474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FknbApa2PAo7adaUdVHxba5J4xeT9MoJ8JZDuiScedE=;
	b=J9xVzToeOLuM8NWK8qIoY5SJ/Xd6cJ+aWxfnD0g3IXYsONSkf1N3SZBC1kn/SArE5IyAQs
	EGDTBP8UN/5m5sj6oWUQWNQ0ueSx/2HR2T7nh9tnMDG7Bv+K0Z9bBH64Y+9c9C1r7Gw/PV
	+F7lFPDJ/sc94KRsPUHI/QtgYHD3f4k=
X-MC-Unique: t6pQhcLQM3uBaZLQEGmzPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QYQZxuq9Oy2P29ug11XL97EhzXja2NBFVK1X2IPXyxVtjbpP8zMvSXsGE4qrY/BqQ2L4TpFC3EuyrTd7X5E2GKXjYl9olRbSE3J1XOxbLNFJvaSq7GhuSiBx5VDGexIape6Ph+nDDnxDzMX4ml7ZwONH+mEVFceshUmzW8zXDHp9q0GUgySymztLUowAE9moBqeRZmNz0iCtlwQkbRqDcc4G0CwXCL+N2UK6Xo43LUFQbVtKRb/UfIh32ZzWW6c5Ol/7e9EMCu1deaEWmrpu9nQNRrH6n2LcRK783ZwXyMcl8ntTcyZGW6DHSo0h9x6YEuG2DnyjcpXVN0LOeLGL9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FknbApa2PAo7adaUdVHxba5J4xeT9MoJ8JZDuiScedE=;
 b=dzhjhhH2NKECbw5NVO15SefOYk8z54NRrFQoKTWejknZUIrMnp4w9cJ+zFzCKo9HxkR/+WW6aFFlmTZgyZ8CjwcxLe20c0fKuMXMGxw8c1z/bFhYA3H1qeB/skn6XOqLlHWpNqJDj58+vWXB3YSwGugY/+RQxkE4S/CtSs0bgP3Uok1NftiwqqH1ZFxQqqrmNZir+EsJ5es60Xf+iqDJb2b7Rfqeh8zMdc884/BfRtujAOwHnz6bXituuhd0DsOJS5cGVwoSveAfZBs9IeARL5/W2SlaXqVRhYpZW2P/MCOp6xNKYEAv1xCJl5DdsRDPp3An3+WBfhT26tQzbC1puw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v8 2/5] xen/arm: Enable the existing x86 virtual PCI
 support for ARM
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Rahul Singh <Rahul.Singh@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>
References: <cover.1634315461.git.bertrand.marquis@arm.com>
 <e2b10f56043155e4bb8eae824723045ccc042f8e.1634315461.git.bertrand.marquis@arm.com>
 <cef8d2a6-91c1-2d4d-2078-98d0a92b067a@xen.org>
 <F447A1D8-A023-4127-AAC0-7511868DE9C4@arm.com>
 <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f77c42e2-4a3c-9e28-25c5-b23efffef25d@suse.com>
Date: Mon, 18 Oct 2021 09:51:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <a45077dc-e144-4427-9ae2-5815045ecaec@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P251CA0002.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a27dd519-8add-4e79-6221-08d9920c0d59
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2334:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB23345B31AB43751990973BC5B3BC9@VI1PR0401MB2334.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N3iKni3xzndSQn9wq4grOva3SBEGyLFsMywn8t2OgLBA4qrf3d1e91K35+zyij6pyMwxDNlS53NOnfofBGBgAq2F6sHVZBVxTmXw+wLvESPoDtUhqQKvaJSAVBTO8Tgpa0qXcBWJBSjb540KAeq2V/L22jydHWWe3H21qi5dzQiGwdIr2ELzU1nCcSPgJhWzvUzVF0VqYBDPSdeVJwcBCwJhT3uVw7VvlgR9H17aiu+64fRB+hAwKeWWAr4jKtLQKam4qy04rRkTJwBSQtUwioxxPS1vni/SmoI1y1NOydsDF2FAywv8WUzaQ1SKEf/fhl+qWGKNCtCVo6E0wK0U3cHuXmcwXhK+dwmQcrBetmPdjSJ0hGMby6YDmU4LpUChZfuRO2+EuW3h3k1840sflx79/JDXvD5WNKZHUc8C3ur93EWQDwdU2YeosUXjpFgeYi2Gr5TTm4hZShRp9++OHa0pfx9RWoEPt4I/JUyP1qmCpBDVJqWvQe/zPERwDcMKemtNr0gW8LV6Z45AIMCwiSzlPlVKbOiYeyqYAQttSce8YfITLp0wKQxf6sNb5lU3Az3cCE5wsw7CATVZVF5oiwtFLdXuHtdtPfFVoP0zDFu+3RUHtrxGNVdrF3kkfqN83kPfwnK5J7yov1xz7SIVT7DbIHEOkE9QAV0Ttgm7dcVlxvxFRJnzWE8RlyqIBtd5WuqYCsdiLQevj5JrrO9VFz0746HzhFmLJTp38DoU9Vh7kMYIRGcBCjCjndXmtk0n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2616005)(31686004)(956004)(31696002)(86362001)(6486002)(83380400001)(4326008)(16576012)(7416002)(316002)(8936002)(8676002)(2906002)(54906003)(6916009)(38100700002)(186003)(5660300002)(508600001)(66946007)(53546011)(26005)(36756003)(66476007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b1dYUlNpS1Axak5GNEJ3V1JYdTAzbVR5SmRSVXR0ek1sbzhaZEVkdlZ4STl5?=
 =?utf-8?B?WHNPQ2EvWFRjczVnVUxLKzJtN1RkSjRYbTlTb0VKbUpRbUlOM1d2L256UlpS?=
 =?utf-8?B?RitSdTVjQVI0U0h5bHRVY2tTcHlhTlpjbEs0c2VLWkFzZ0dKVjNXV1dmb2Nl?=
 =?utf-8?B?ZTU1eTlQcmRTVDVlYWg1Z0F2bFMyOWcwWGY3RXprc3lEQTZlNXFxOElrWlpV?=
 =?utf-8?B?WGkzUlhWRTFPY0Q3NU4xd0lqS1hWaFJvTEJ5UnloajVBY3RMNEhtbnRZTExI?=
 =?utf-8?B?NXU3b2gybG4xMkFjMTZwemo1NC9HSk9NL2o5ZGRiRndjVU42RGluRXZYd0R2?=
 =?utf-8?B?RTBRVlZyYk1tSHNSTjFQS3RrSnYybkhEWWRPbi9YSWZScjQ3dGgraTRsT2sv?=
 =?utf-8?B?em80SUNrQnRaY0pxaU9IUFFjNnZ3MWFLVU9SU1RDSEVKd2tVOTU2VkppWTlX?=
 =?utf-8?B?TmJxR3I5MWY2bU1FNDVQdE5OVWxRbytoQTg5UkFkaDV0bDgvemlDTTRqQlV4?=
 =?utf-8?B?WFlDMVVUbEJyajRUTjBNSG0wTkxmUVZhYUV3TzBNaGpOUFptTllJUnhQWnYw?=
 =?utf-8?B?N3A3TmVhckl2K0kvd204b1V3QmQwVUpXV1VnUzA3MTEvL3JVQzdnVTJnTFVV?=
 =?utf-8?B?Q3VsT0RoVGhQL0pxeS9WSGZhMFREMGxkbG94dStoYUJjYmJnQUhpWk1OY2ND?=
 =?utf-8?B?YkRKUFhQa1ZYZFU2dTFIdVFxc0RaWFNxeE1CSmFDSU5zcTVlN2NwS0dpYkM3?=
 =?utf-8?B?SzY0YVZNRXJDUlRJaEM3SlplZUlxOU5yaE1TM00yYmkxWFNaaElKczVHVFoy?=
 =?utf-8?B?MnlSU2lpRGF2N0g2Y2orWHE4WnJVY1IzeVFZZDhERnZBSjFLQk44blNJTWtH?=
 =?utf-8?B?bmlVS01XdlI1RjBibnpSQUFYRHlMbUVoSjhwY1JjVXBKdXcrZHJBWXdOM1pV?=
 =?utf-8?B?d1pockhsRERLMkp1anMyWUEreVZ6ZmoxZVVKdWV6MUtFQUVEK2F3V0VXOFlk?=
 =?utf-8?B?bnZlNTNkLzNJb3BIQjE2MFlLcTY2NTlJdDV0djZ6QVk3RHVXc0krT0hpbUpv?=
 =?utf-8?B?YnFNYTE4Mkd2aUJLWE10RUt5dVB2a2NSZ0paZkZ5RnpOeGZlbEpLTlgvcDQw?=
 =?utf-8?B?MWEvTEVMeXppcFpnYVBvak1XWGxLcndkaEEzMXkwc1M5N2JJd1M4MGkvU2E3?=
 =?utf-8?B?cFhGVjIxcDRhdVY2RjNaMkNQSUFrbnFOZmdMeXJvcVFYa0F3Y1hMN21VUWk5?=
 =?utf-8?B?UGI5TnpXRHlJd3U1QXVGVjBiU2VuTmtWaTByeHZhUGs1bFN0ZWtELzhwWkxo?=
 =?utf-8?B?LzBTRjZiWVZScndRK3BzSm91MmFTVm9FbjdKa0VRNWUrckRJdy95NlpsOTY4?=
 =?utf-8?B?ekEyZzlPQk5kSWxzYitZbVljV2pHZzg3V2ZJUzUvUnhTQWh0TnpKMFljU0hv?=
 =?utf-8?B?NG5wbDNVdE1qcml1ekNvczc1RVMxbU5ybmtPWjZaRjRvckQ0WlE0Uy84Q2h3?=
 =?utf-8?B?cHVHcFJBZ29heUU3K2kyRGdncGdLWE1MMVBycG5ucHd0eDJhSFdkMVpNcTZ0?=
 =?utf-8?B?R0xYcmtUdmlsMFo0c21HRWVxRnJsc1QyUGpHMUpIOG11TzN6Um9aZWNmekFX?=
 =?utf-8?B?WlRZVU55SnZxZW5ZeHd2ZEN2MDE4Z0tmRG5lNm9ydWt3MGl4aHZwN3d4Wlo5?=
 =?utf-8?B?LzEwZ0U2REtFVUMreC9BdXo1a0FVVU5CZTZwMlZQemVZcDBsYk0rZzVaeHVM?=
 =?utf-8?Q?EnPUVwBNZPA5QHlixJrxrbRyv+nB/B45R/sCh8z?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a27dd519-8add-4e79-6221-08d9920c0d59
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 07:51:11.1779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6SRWryyq2uqzpDcgutO9UkQEh1oPza55uArz1flrnIUJOgPGIDCc1BvHchMHlL806wmzaY1T17y2IaRyoP/PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2334

On 15.10.2021 20:38, Julien Grall wrote:
> 
> 
> On 15/10/2021 18:33, Bertrand Marquis wrote:
>> Hi Julien,
> 
> Hi Bertrand,
> 
>>
>>> On 15 Oct 2021, at 18:25, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Bertrand,
>>>
>>> On 15/10/2021 17:51, Bertrand Marquis wrote:
>>>> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
>>>> index 3aa8c3175f..35e0190796 100644
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -756,6 +756,19 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>       if ( !pdev->domain )
>>>>       {
>>>>           pdev->domain = hardware_domain;
>>>> +#ifdef CONFIG_ARM
>>>> +        /*
>>>> +         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
>>>> +         * when Dom0 inform XEN to add the PCI devices in XEN.
>>>> +         */
>>>> +        ret = vpci_add_handlers(pdev);
>>>
>>> I don't seem to find the code to remove __init_hwdom in this series. Are you intending to fix it separately?
>>
>> Yes I think it is better to fix that in a new patch as it will require some discussion as it will impact the x86 code if I just remove the flag now.
> For the future patch series, may I ask to keep track of outstanding 
> issues in the commit message (if you don't plan to address them before 
> commiting) or after --- (if they are meant to be addressed before 
> commiting)?
> 
> In this case, the impact on Arm is this would result to an hypervisor 
> crash if called. If we drop __init_hwdom, the impact on x86 is Xen text 
> will slightly be bigger after the boot time.
> 
> AFAICT, the code is not reachable on Arm (?).

Which re-raises my question towards testing of what is being added in
this series. Supported also by the typo in v7 patch 1, which suggests
that version wasn't even build-tested.

Jan

> Therefore, one could argue 
> we this can wait after the week-end as this is a latent bug. Yet, I am 
> not really comfortable to see knowningly buggy code merged.
> 
> Stefano, would you be willing to remove __init_hwdom while committing 
> it? If not, can you update the commit message and mention this patch 
> doesn't work as intended?
> 
> Cheers,
> 


