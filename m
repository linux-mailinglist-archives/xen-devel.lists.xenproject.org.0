Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF025AE38C
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 10:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399659.640890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVULq-0006po-8V; Tue, 06 Sep 2022 08:54:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399659.640890; Tue, 06 Sep 2022 08:54:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVULq-0006my-5k; Tue, 06 Sep 2022 08:54:34 +0000
Received: by outflank-mailman (input) for mailman id 399659;
 Tue, 06 Sep 2022 08:54:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o/Pp=ZJ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oVULo-0006mq-VB
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 08:54:33 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80043.outbound.protection.outlook.com [40.107.8.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85b740de-2dc1-11ed-a016-b9edf5238543;
 Tue, 06 Sep 2022 10:54:31 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Tue, 6 Sep
 2022 08:54:30 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5588.017; Tue, 6 Sep 2022
 08:54:30 +0000
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
X-Inumbo-ID: 85b740de-2dc1-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFllZfIwO8ofzT8h3+JbmVP43a1q0ItTHoAWluVOGUHlZr1wE/2bAR9ZylRFmY8Alj48HwXZMTv/BTlE2q7C8LX1GeqANwhFb4QVxRpVfTnHuQqCa3XIls1R+KqZuAgsWWNLgG0VBM+ZCkXo+6t2OW/xY1kBYNRZgC4Qn+9r1TcmfN6VpPo8HHiW394+ufFcrpLnUk+9bwDetqUfUmgDtTLt1mfm5F39VwdSC5+k0wyNelXLag+eB3PLLhRtpPKbdPk9N/x75jt7kMTfbz7Tam65+elCQfho5UxXTMRxt2e5kc/8rKEIH1pLF5ZUbefyC03g70XgcjVGNYhnTtgMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBzlqSA3kdDDMPrJpGenrmU0q80ch7fAe9qpVfZO2SA=;
 b=h+nVkBamSJzNegneWLi2QhAldi6iO0c2ohM6BvJtnIhvg6GOGl+H8l1UcVEIRMWF3vjiFXlEs2+NnhH+YTamLzjxHBR8wxSCYBHX8nIZXX1SFsEnLXN4eIk/dHejUeRWf/PIsbPSgfKljAZ1pNxkIo0B6hZ8I+2wBA6Ip2LlmH5IrCMxv3bguQO7jxkUEjIVU+zM+0Dxm3WuanLa3NbHAUJnE/qB4iuR5R7lf3+be1YpqENBYv5NjdZ0LGoS/3Ih6Gqr3QBTrLBiZERlGbKGimaLbVI8CUM3vAjLiXEIIh0lLxwymfPrE1p3N+FC5vB7xAlIReoa4rv78iBlYInInA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBzlqSA3kdDDMPrJpGenrmU0q80ch7fAe9qpVfZO2SA=;
 b=IZKxpThj3qG9lyuDKtjWzaxtNbZtMr+OBa4qcd6YSmJJHK2nyFJ3g6veZZ/z7BufalLsJv+JsVBlCPgoeOndKqQrcdUBcdEeNzLG32PElS5qb0w8KuPcyPTj8VRCf9xEYqwjEEVGTl4SpbK2sINRodpHgK+8dKHhawLtFJz0oXI3mT0hYlqKIelY/Cw6/0jLF/BARyQpkdpMqxvMy960uO/rfSO9bT/c4MwEueEvnnipDFF/6PQfKgoeVCrsTzmdbSiJTxU9f44nH8yKW7yKYCzBk3VRUrBixNklGJEWM6f4JKxtJER3x1VNW1rDQEnaxijok43cnK3NYjzxLsQQSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <13572055-eabe-9010-f33c-d7554ad50973@suse.com>
Date: Tue, 6 Sep 2022 10:54:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/2] xen/pci: replace call to is_memory_hole to
 pci_check_bar
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1662024325.git.rahul.singh@arm.com>
 <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e30beac1480f03b51933d8016ad9aed8855ffc18.1662024325.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0039.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d8a566c-a2e1-4dac-9ac8-08da8fe5690c
X-MS-TrafficTypeDiagnostic: PAXPR04MB9201:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tXeH3dtYV3AAZRIhoOhZAkUwgffEc/WB4XEx3MYoLK1CaQ+cEJz6Cm3TlfcngB0jHPe7YyPGLhZ4WIfFQjsolzikpoRugwDwJGLH9gyc+TC34kXrS8c3GvnYHlUWUNZgWOfCntDnpTjLM7nFwfZkBmSSnhTdsHdi+kBVV2/KOU8kWN0W1GJF/FbyswcqS5Cqbn8Nw62yJBVRA2xSU1zpaxCbRMkdQXIPbBak3FgrNmkWwJTBBNLVdyBn8E+rLfjDeC98srsGsB54PUhfAG1YrmBvLGw9H92UKSMS731BEEykNQdjJwPN2uCcxb4H+MNBvGpofnkc2wDdDwlrNyzZZa7crWYDHwKeYacuCFs4BqAayggcNHL0KAZokZ2qeze2675GF2jqqfSclT+UCHfsqYtXHg7aqFAjk8AiI04R+72nwtViqr78RT1j9wrhSGcsnGSjleTaiOAGDphgQGoh3DMvBcKcqft/IiAEsa44HPXH1H56IONvRawTXwHTyACe0+fc4mpUTruQ0PBSO9V/eaifNR6JOvOSVMK6kM4VrXpcJN5Pfhwnq5f7egShLfhhC7ghKq23fOyuOWVbqxKA6QMrke4VkzuENYib2mI84YIkaCdo+3LmEu3nwXcoDnqaV4+mafomVs/opqxb5YzO+7eIEddbF5sJSv+Ov09tZFPGHJJPrrdNMYXziHv+1T08V4JqmIETPVNwZCc19Vs8cS1EO1undvINqs2qSZjt7gEyWReamXM8yJZ7Wi13b3SJ0LizawzHBnm3P5FjjLwAsOr0HoCyHtNMEohirUjmIls=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(136003)(376002)(366004)(346002)(6486002)(38100700002)(66556008)(86362001)(53546011)(6506007)(6512007)(26005)(66946007)(478600001)(316002)(41300700001)(54906003)(31696002)(6916009)(66476007)(2906002)(31686004)(186003)(36756003)(5660300002)(4744005)(8936002)(4326008)(2616005)(8676002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amVIa0lkOUNiS3V0Vi9zWnVpVmYzSXF2QzJ3UDdVSm85d0NvRGNMSlNPZE80?=
 =?utf-8?B?Q3lVUTlxcUNZSUZtSVZUOEJVN1ZsSW4xYkZNWlh5Q0ZUcS9lQzR4ODI4Kzgw?=
 =?utf-8?B?NC9MbkNhWGM3eWRLSGk5NXRNQUpkMGNMQXRYcE4vR1VnRWs5TmJMU1FQWkhT?=
 =?utf-8?B?RFU1anRFamxNZG5mbUdRSkx0VkFHUCt6RnE0UHBVQTBSV2VUS1VsUzlxZmdO?=
 =?utf-8?B?TTN3SmJ0Q1NYWlBlZ2ZMZTM4c0xKblUzNVc5SkVqRnhYelNaUG1vK2dOYk9r?=
 =?utf-8?B?QldUN0FHa0ZDa2pLZXhWeitxM2xCSllHNXRaSHg3Tm01N0pmbGlwK3ZnM3By?=
 =?utf-8?B?SVZCZ3RNd0Q0WXgzTGFIcC9LbmpnSG4zcUd1Y0NHeEhKRnFxU3NJUy8raHdK?=
 =?utf-8?B?ak1pbllkTHExNmh0N29NSkVKRGkvNmJzSHZ1bmZxeE0xUzNiVUxFMmdaRE5M?=
 =?utf-8?B?ZFpuLzJESm1xY1RYMDY3Q09FRXNLdC9WeFc2TDgwUFBaTGkvNWRyakFqMFBj?=
 =?utf-8?B?MWJqbUJUTjZKenZneThvN3JiNWM5RDdIRXlXQWR3TGxUSUNZTC8vdUVLcXZl?=
 =?utf-8?B?eG5MRGFKa1RhaENFTWgxYWRHRFAxc2lhd1dOMmRhdEJQc3NncGpQT0pnb3V0?=
 =?utf-8?B?ZUJlK2pNZk00S3JjcXdBcklubDVHWHd2Nyt6bWlBRzlDUzF4YmhkSE4xcDU4?=
 =?utf-8?B?eGV0TmVKcll1dWNHL2ZZWUROYktHZTZBcUlnenh1a21tRngwV21DR2trNHN1?=
 =?utf-8?B?eWR1VDV5WFJyaUFmU1YvWW9CaFFrQ1orUW10a1VRNEpDU3pqV1YvaGRQVXN4?=
 =?utf-8?B?TE02ekVXKzlpcjhiMGtjUU1QLzBEVjlhU3NJU2drM0RDYnM3MEJNZkJIQktN?=
 =?utf-8?B?ZVRCVnhaazNpb0RsNGovRm9YRHNhUVh1bmZBSVpiZk92bzE3UDdBdWl4TUdM?=
 =?utf-8?B?UFdkTE45Q1N4djUrZ3pWVDBqck1zeGJOTGRRV05JM2RyMGVzNmgwQmdiTC95?=
 =?utf-8?B?YitkRm9OL0ZEMFg0VlljSUp5N3pCRmJNMzFnYjd1cjZpWGFjYUxPK1FMd3Nm?=
 =?utf-8?B?akEveHJwci9QWHNvN3pnUDNTRkNnd3V6QUhndlpZWEQzYU1ycUk2ZURRVXZB?=
 =?utf-8?B?eTBXMEMwWVhXTGZ2SnNycUttanRGazI2Mjk1NDFsWjJpb29aYXQySnNUZXAv?=
 =?utf-8?B?WlVjclVJb0IvclkzYWtBbGU1NFZKTkpIdHdvcEw5NDJlSC9iQzZZWHJQQ3dk?=
 =?utf-8?B?eW96S2NUYXZ1aGUvT1JVN2ZiTnpuREJCVU9RK2xDNVNaaTllMWdQQjlZT21I?=
 =?utf-8?B?Q2FkSkNDc3VQaVZLby9STWtnbFFWUUluTXJOS0I2SzBUalhUNHg0endQNUt0?=
 =?utf-8?B?RjJTaVBUTUhSWDBjVEV6NUFOVUVsOEFYeEU5YzZDSzVETnVFV3JnTWhOSVJz?=
 =?utf-8?B?NzhwMFBBYkRWOXRISkt4VWZ2ZDhUVXltZElRVzRIcXpQNnladVJkRkI4Um9C?=
 =?utf-8?B?U2VXVEt2VFVYZ2R3blEwL1dpQ2ZVd1hiNG1jaDhOQ0svQnFVM1hLQ0pVcUJk?=
 =?utf-8?B?ZmlvT3RpcW9JZGt6czA0VThzOEVqcGs4MzgzbnhMSjNzWWtNRXRNQ2l6K0xB?=
 =?utf-8?B?LzMxVzR6T1ErMHVYT2wxTy8vSXNteUx1eUJFeDl1MDQ0VjV3TUpvaEoxdS9E?=
 =?utf-8?B?dUxrVUtGanpKM3dRZ1BZZDBSOStkV1YwVUQyV2lOcTdOdlYzUDVMa1hQd3Jp?=
 =?utf-8?B?REZFRStzbHlrb2hFU2Rjdms5cDNLMWF5VWJMNEdRZS9ldUVaWldxbGZBYXVp?=
 =?utf-8?B?OHQrTzh3RDgza282Nkxzdm52cjBPdFZQUFc3dEdsT2pvbTUxK2pUYmswY2Y4?=
 =?utf-8?B?WkVudWNPeE5RRWdKWC9YQUhrUFRVa3FOZmlXM3c2TEc4TEhFMVNTVDFoMnZC?=
 =?utf-8?B?YXYyb0JpcHFRbFFLS2p3cnlXNlllelBUSkxrSE9WUDZxQkdsSGVBY0dQU2NP?=
 =?utf-8?B?cDZxSEowb3Zka0JCTnNLbll2TVNHeWtTSGpPSnJBc01EOXNWb0ttaEVLVzNn?=
 =?utf-8?B?Zm84RkFPSWRQL05WSzQveThyaWZVVVZpUnU3d1MvTGcyY09mMzJlem4wckFR?=
 =?utf-8?Q?2GfoXJznXmV0bDTbKFgYCxa33?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d8a566c-a2e1-4dac-9ac8-08da8fe5690c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 08:54:29.9844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wcq5ZzOqjeY7dy16y0Pvgc7tDVfzX0ctdGX6YdQUpSzWVf22bNmLw/u5wGQhcKYH0D8kvU0wgGp+NIg7LNcBpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

On 01.09.2022 11:29, Rahul Singh wrote:
> is_memory_hole was implemented for x86 and not for ARM when introduced.
> Replace is_memory_hole call to pci_check_bar as function should check
> if device BAR is in defined memory range. Also, add an implementation
> for ARM which is required for PCI passthrough.
> 
> On x86, pci_check_bar will call is_memory_hole which will check if BAR
> is not overlapping with any memory region defined in the memory map.
> 
> On ARM, pci_check_bar will go through the host bridge ranges and check
> if the BAR is in the range of defined ranges.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



