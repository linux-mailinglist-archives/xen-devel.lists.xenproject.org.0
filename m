Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF462770F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Nov 2022 09:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443159.697636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUT5-00017H-UI; Mon, 14 Nov 2022 08:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443159.697636; Mon, 14 Nov 2022 08:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouUT5-00014W-R8; Mon, 14 Nov 2022 08:05:23 +0000
Received: by outflank-mailman (input) for mailman id 443159;
 Mon, 14 Nov 2022 08:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=b4jG=3O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ouUT4-00014Q-Vf
 for xen-devel@lists.xenproject.org; Mon, 14 Nov 2022 08:05:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15b607b7-63f3-11ed-8fd2-01056ac49cbb;
 Mon, 14 Nov 2022 09:05:21 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8659.eurprd04.prod.outlook.com (2603:10a6:20b:42a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.16; Mon, 14 Nov
 2022 08:05:20 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::48df:9a8c:c706:36b5%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 08:05:20 +0000
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
X-Inumbo-ID: 15b607b7-63f3-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENJwJIshxyLE8QFcmVcIRiwDpWqWm42jsjEhgukiz84cHAqKZT9NttAhKThTDEfT5Dz5zB8VG6rhPoq2VpT4rO+ad/o6QsAutRqFiVZc+IuutpkBMjvxQ3NCTaBk+MLK+at3F+S/p49vfVtOfAP1ltyzWsrpl7TW0RCKRJSwO8Z0GyGN1BvU1JK6mLkV5pHcS1w9aqASXJMquSOYJPDsS2Dpw+JtWYX7nNFa++vCevGRYaajWFRZaWiCI0wRpEPihKD2znKpg/2umPQyoTNPVRrdR/OuZInDUexqBKs/MIK/IypyBywUvaJfSyZH0AYD1Q1ULFl44Td2beqnMvvEVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hzeG/rUAn0/ElhMrKWbiKgW5t+kpvQ1MfO9huLRsLtQ=;
 b=JAI+g+Y752E16vx4LxVHiJqJntbgOBHIf7hx1GYrKfch2nmRaotX45hou75t8DLPjXfOMpufRqfRkRpe1HXE4seO9OH1dNyOktsZdSYOLv9V6TUS2fdWLvHYnFIPoTU0JKiwDlNm/+7ICvnZ8uUDj7rUsrnFjb8+hw0iYYGFdSWzRJCI8hX7Dx5FSQWdsXfDlqgSF5rc2m5hh5u/bkW9QggRYvL55Y7D3rHKcQFwzqJe2BDQEaS8C165EDZ6yUDQbXnlfVKQpuQQ0jEvQVY3tSs6btii1DZU11eBpOcrGRY7IppvM3Mh6sbwtjeMloOty2BR14ptBOvnNTfU0gL77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hzeG/rUAn0/ElhMrKWbiKgW5t+kpvQ1MfO9huLRsLtQ=;
 b=4nz/sDtiYazPayxDISpVBYiqKTmaWiAabh6QE2mVQ0CZ54FFoV5gTFCH1l8bR3sPyPMQ0rwNo4EO8/UGKeyzGxjFwiz0LIY3aSf5P+kzsPYEQ94gcnfsiXrNljhq33IikFfq1osjmBbUdRa2up0Eym7902fCvUjZKe6KeyXAbJmyuNE90ScH7Xd1c03CNoM6ABC40WoZcj4BhRD7a4f5s/kVGyOV4CirgB1m3BQDtutlp+R9BZsl4TAMNCjn6ta4hmMr4tIapzHIDdgcCMm74x6dcLxxe3MxBQs/2AUqtnYQEIeNWsHt0BmSfF0RMJsH7PjRQfwIFYDYL0n4n8luOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3aa067b2-fa49-326a-c5a0-6735bc95951e@suse.com>
Date: Mon, 14 Nov 2022 09:05:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 0/6] Device tree based NUMA support for Arm - Part#2
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221114063451.473711-1-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221114063451.473711-1-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB8659:EE_
X-MS-Office365-Filtering-Correlation-Id: be02c441-7bcd-4177-60d2-08dac616f952
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IA5M1AT1cTijKioHgB0kSfisMYYJT3zJDuRpW2kATEALviCR6RdIe3bB2HcdTppaXU2AqPUPvawx1wFN+UBwYsdIR6JTjiCvhhzEdjHm3tWwpjt838qeUtj/UHG59rR7gRIKEtg7FwVkVnIgEvT0n1P9YfbO6P4HYA6YzoI/01yaHblhzzvt9IHGEXG9k5ezk+VULrAdxZbuKjgmz3q/IdIJUyeIfa9oONb/Lp5lQzV+lY82FomBj53ahypSzC4H/KMAyaXAgaNIQooVP9HGMMFUwlf9Yn5EYruxg5gmyl0aXj5dBE3akgt9WAZo5kvtFwp3c6efK8BiqAbwehozWUQHaxE4krvdN1M+RLEzmEZvv2cB46FEk+kO9TaSUgy7FmrsbIsppaljMAy2bE83+0Seo8zTc4wdvd9AOzli38NLFJ4L+zxmripyyTL77789nJbtldm5E6P2J0h4Y4b/ydVXNcXLaBNJ5y5kqS3ZSOh1Bl6UPhUdg+ijKMj4xoe1O+Wjy5g/B5O9gnXbH/nhhtpaH6CElzj/Boo+I3lur0GyiFbFjpv5iL4pdfZZ05ULIRkTNlmq6RieqYWPSmkjbZHgH7R0F+JDIYG3R9Re24xrJhEANzX2R8XoIBnqUpF/i64LqXCgkcN4fhNgvy+SGtnUgXgjkLkPavM8MvwKjyEcddCgHpCd/DreREVgJvgeoupex2wrCfFR6Qy2OSLvjF8oM3v1jjAh1Suf/d2+mnN1w6g8GYQti8CAUIfVgFbMAAp903ZeLFEBt368hY8WOo0UvJgDQx5yhx6iqP0qCXT6pGGZZI4Y/oyV2KigovnW2TU4xhYQyaF2Iqwh+eGfFguXQo9rY3pUjTs0uY5/g6c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(346002)(396003)(136003)(376002)(451199015)(966005)(5660300002)(41300700001)(6486002)(36756003)(8936002)(2906002)(478600001)(38100700002)(83380400001)(26005)(6512007)(53546011)(31696002)(6506007)(86362001)(2616005)(186003)(54906003)(8676002)(31686004)(66556008)(66946007)(6916009)(4326008)(66476007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pDNVNzbXRUdHQzVmViNURLYU1UUk9rUG95SUoxWjIzR3dJZjhKNkE2bElB?=
 =?utf-8?B?b0lkVmZuelZWWkd1Qk0vNko4YnhDUlNjRjR4NHJNSEw0dVU4R0NvZ1NwNkk2?=
 =?utf-8?B?UjhFOFZtNzFwUHBLQ1R2U3ZNSXBvVG1SZ1JZamxQMUFzVVJFQUNsdkgvMy93?=
 =?utf-8?B?WXl5bVJ5UEhSemdHMlBwUDFQUVVsTEZpQUtKTGE1SnFzWHZXRy8rOWR4OEtE?=
 =?utf-8?B?L25rVkpwVk9wRTNqR01iTjhyUS9vd3BtaUpVTGxtZStmeWgvRlhJSGhLN2gy?=
 =?utf-8?B?a09hS28xRnFYbVJFWnRUWFh1N3hVVkFDNGJlWFVybkVTOHNoZ2lRTmRCR2ds?=
 =?utf-8?B?WWliV0pzTWV6ZUpnZnhsdW9LeU4rWVpJYjZBM3FyTWZnUkxiSFBTc3VMVysy?=
 =?utf-8?B?cHhHZ1hvM0ZCYkVlYkxQOUJTRm8xZDhjbWJnQjFMQzRraUIzWFdDR001cHZw?=
 =?utf-8?B?cmNYNUFuQSszclpleGM4d2dLNE1oM3BrbnR2bEZnTnI0SGxQeWRnKys3c2Fs?=
 =?utf-8?B?cE5UY0FaNUJqbEFTQUN1UlM0UUF4bHNvVVpldW1XYi9FcE42QzRZeGpvelo0?=
 =?utf-8?B?SGpCWVd2K0lDcE1oUExsdG1NQzFOS1ZCZkgyTHdyakVyakltZjcwN2d4bHpz?=
 =?utf-8?B?WEdBQUhhUHdjL2I4aU11VXUyQXpJYUdJcG1memFYeWx5ajZjZGhTdWhVS2dD?=
 =?utf-8?B?aEJ4SjFrSWZEVjJ2Z0FvMlNiQ1EwUWhNdHJJSE5IMUdqQm1CRXZrNUdDSTZH?=
 =?utf-8?B?SlNoSWVxeVE1OE1WbElZa0lRTUVjNWMwM1l3NkVTNlptRUtPbHU3V2xSRlR1?=
 =?utf-8?B?NGQwWUQ1RzlwQmlHOFhPaUdLVkVNZThNWVVZMC82dWRWTXRidDM2U0NUcXpC?=
 =?utf-8?B?NHd1cVg3ZE8wZVNVS3Y3RFlDdmtWUDYzRVE0eTA1TE54NFR3b055N2Exc1N0?=
 =?utf-8?B?bTkrWjA1ZjlxcW1DRkc4NGU1Nm9GTzVlekIvcHNrZ2RMMTZ3VUJHakNuOStk?=
 =?utf-8?B?aGoza3p3WjlGOWtqWlV1NlNCa2VQMzRPSnZOWCtMWHlRRDl1c1VNSE00NE5V?=
 =?utf-8?B?S2FadVQvTko0NDYrU2p1azJzTFFLVGF4U01pNndDRFI3WXhCTUxPQlhtVVdv?=
 =?utf-8?B?RXJhemtOOXBBL3EzMElwWDQ1ZjZ2NHJWTTUrM2xRdHpmSThCOFRkQ0VqVis5?=
 =?utf-8?B?M2k5MExEVE1kZkQ2WTVLalJVV2sra0F3ZHNwZmtPUEluWjQ5Q2NQdnVQSHR6?=
 =?utf-8?B?Z2hldlpUR2FrWFg0aHhHOVRPenJKTWw4NTJvOUR5WFdUQUc2clpMZUFBeWY2?=
 =?utf-8?B?WWpuTE1OWDN2dzBGY09UblFBWndra09lZEpOT1FWR25uZzBkdnc2d1dndkF0?=
 =?utf-8?B?aEZ2amYyMFkwMUdwK0pwdWdMUXowTjhjWkNiL0ptanhabGtodXQyaktGci94?=
 =?utf-8?B?bTlQenJaMWdISUhWckdvWjNkKzU3RTNBZS9Sb2dMcEdtSzJTSmkreTBsWG0z?=
 =?utf-8?B?bVJmUkIrWUViSkFTRTl0R2tVWVVqczhaaGwrT2pnZFVhVm14eGp4VC9jc2dL?=
 =?utf-8?B?VGUveUNBMnUydlpLOFowNXZ5ditnT1o2U05KSjAvVVZ0dDM1eU5UT3JERVlX?=
 =?utf-8?B?eUZOTjNTYlJwOVlzbVJkWlpwY1NnZ3BUd2pEMXVxOGwxV004OFE4VkUxdVpl?=
 =?utf-8?B?ODNxNGpvS0h5SHVIM0wwbkt5Y1Nqa3FLWUM0dmErVFRMcFNjc0FmcXowRVNo?=
 =?utf-8?B?OW8xc0x2MEhGN2lpSUJNTDk1VURsc3lJL1ZRbUtHa0lEamplRjkvcUgraDVu?=
 =?utf-8?B?ZytNT2xkWHI3T2RORjdxS0ViSnJZRzZnTWtWQ0pvRGpkUFV2MkFzUFArejdQ?=
 =?utf-8?B?SHpwb29SUWdvbGNiaEpsV29VWmRJaXh3QXY0RTk2QkIraUMvcW9CYmNuUzd5?=
 =?utf-8?B?STgxUDlCaXhpWkN6VFFhRU1VYWU0Nk05K1MySTBsUFgvazY0NFpoN0h0S0p5?=
 =?utf-8?B?LzV6K3k1bFBzS1RSRTQ0aG5oSDRaNkx1ZFhiQXZsL1FRZXJWaVh4Z0Vjcnpn?=
 =?utf-8?B?dllDVEllMHkzTThvSWFIblBPV0VYOWJ1ZEdQUHVTTDVWVnJWcDc0UE1KZ2Yr?=
 =?utf-8?Q?N7NJ6tU1boJgYT6kpDWrBxQGu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be02c441-7bcd-4177-60d2-08dac616f952
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 08:05:20.3039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZ7sa1zN1x6wrND0W1ovZoECWsqx0nMNuzzRPX39V0P/kDTCVHaXeqThOy5+TNWIZMrcpn5ZpO6HoaVAAigiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8659

On 14.11.2022 07:34, Wei Chen wrote:
> (The Arm device tree based NUMA support patch set contains 35
> patches. In order to make stuff easier for reviewers, I split
> them into 3 parts:
> 1. Preparation. I have re-sorted the patch series. And moved
>    independent patches to the head of the series - merged in [1]
> 2. Move generically usable code from x86 to common - this series.
> 3. Add new code to support Arm.
> 
> This series only contains the second part patches. As the whole NUMA
> series has been reviewed for 1 round in [2], so this series would
> be v8)
> 
> Xen memory allocation and scheduler modules are NUMA aware.
> But actually, on x86 has implemented the architecture APIs
> to support NUMA. Arm was providing a set of fake architecture
> APIs to make it compatible with NUMA awared memory allocation
> and scheduler.
> 
> Arm system was working well as a single node NUMA system with
> these fake APIs, because we didn't have multiple nodes NUMA
> system on Arm. But in recent years, more and more Arm devices
> support multiple nodes NUMA system.
> 
> So now we have a new problem. When Xen is running on these Arm
> devices, Xen still treat them as single node SMP systems. The
> NUMA affinity capability of Xen memory allocation and scheduler
> becomes meaningless. Because they rely on input data that does
> not reflect real NUMA layout.
> 
> Xen still think the access time for all of the memory is the
> same for all CPUs. However, Xen may allocate memory to a VM
> from different NUMA nodes with different access speeds. This
> difference can be amplified in workloads inside VM, causing
> performance instability and timeouts.
> 
> So in this patch series, we implement a set of NUMA API to use
> device tree to describe the NUMA layout. We reuse most of the
> code of x86 NUMA to create and maintain the mapping between
> memory and CPU, create the matrix between any two NUMA nodes.
> Except ACPI and some x86 specified code, we have moved other
> code to common. In next stage, when we implement ACPI based
> NUMA for Arm64, we may move the ACPI NUMA code to common too,
> but in current stage, we keep it as x86 only.
> 
> This patch serires has been tested and booted well on one
> Arm64 NUMA machine and one HPE x86 NUMA machine.
> 
> [1] https://lists.xenproject.org/archives/html/xen-devel/2022-06/msg00499.html
> [2] https://lists.xenproject.org/archives/html/xen-devel/2021-09/msg01903.html
> 
> ---
> v7 -> v8:
>  1. Rebase code to resolve merge conflict.

You mention this here but not in any of the patches. Which leaves
reviewers guessing where the re-base actually was: Re-bases, at
least sometimes, also need (re-)reviewing.

Jan

