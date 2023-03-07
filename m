Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822966AF628
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 20:56:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507888.782052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZdOe-00049w-Jh; Tue, 07 Mar 2023 19:54:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507888.782052; Tue, 07 Mar 2023 19:54:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZdOe-00047T-Gk; Tue, 07 Mar 2023 19:54:52 +0000
Received: by outflank-mailman (input) for mailman id 507888;
 Tue, 07 Mar 2023 19:54:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ob8o=67=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1pZdOc-00046p-RC
 for xen-devel@lists.xenproject.org; Tue, 07 Mar 2023 19:54:51 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0601.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaee4c73-bd21-11ed-96b5-2f268f93b82a;
 Tue, 07 Mar 2023 20:54:50 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by PAXPR04MB9188.eurprd04.prod.outlook.com (2603:10a6:102:222::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.29; Tue, 7 Mar
 2023 19:54:47 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6156.029; Tue, 7 Mar 2023
 19:54:46 +0000
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
X-Inumbo-ID: eaee4c73-bd21-11ed-96b5-2f268f93b82a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUY2AfQoEAaICmjnh/n9WFH5r9662UtxXmhCWrjCto/KBPv6bl6fyAiE5VJWRR6lDm1mk+DIvB/I8+PKK6vNQvRdzZ8xJ2/ncydtiMRm0YE9U2/ioi6Ti+PfAzgRNnLlFE3oR7kwD7nUjJGQpFL9jr2hP97W6MDNMVTCdKA/TMeC8t4+26pj0SaCxGmWuTUv5kPeSKevdPGcaxZxzQ/Zvm9ezLO8cMxKw3Zgu8Xky0h1AVwMVsEMhk/qrOGPeTxRFssRGtBm49XW6tNM+QcQy3Rnsaw7m6HZZoucabDuGAhBfA+ZdkjYr4I2MbAGWqpWqaTkBAX9/mJA5HylWlam8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kc17WUrmS64784VF8GAKkn9ZAxdbN+DE1ElxJAybMRw=;
 b=WlHXxYnfPahY2+0SCe45gvTMAuaMyW3W+b27gcv9IzV40mwzTOf4M8HwxxOn8tS1GbCVO732ZBdCSpGIFtwWOrF45Hernkt5skYPHGhAYZluNJFHNZhihRx2xOxTu6wx2u9nRBJF7EQ6lJVRk5daVSkOcb12QJME6Q+8J3pTIMJecWySeT3SSDUTrZEB3Nzc+JwOB9hqn/KawqCX05zGicUkJGUEaEyj9U4zbupj1nmjHtLQjdqUXWKW3hip9suC1fIlqdPGwGOw3E05h3ShZjvzY4ovMB+dPaurfHjIHtvSWx9DywqFmJ+BqcnUCKqw4jI/SkJNgXvtmynaToyZqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kc17WUrmS64784VF8GAKkn9ZAxdbN+DE1ElxJAybMRw=;
 b=BrD9+u+PUBocwSxo6ro0xytgjmOcIUoJnuAdSw0uQIc85w7DtXicA+EsZu/BF1CEDWwBNJUJtY7rPVuTvAITfuS/u8/8l5J9dXHFXlplRyPp9Fd8fSMJZH9g765Sg5D/FWj5vnZgIClIUj0QtM4B0GUzgDJmLnwoSHPBcpci6Dk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Message-ID: <87f2a996-f3c0-bf74-8da3-c6ff861f797f@oss.nxp.com>
Date: Tue, 7 Mar 2023 21:54:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrei Cherechesu <andrei.cherechesu@nxp.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com
References: <20230307100949.9231-1-andrei.cherechesu@oss.nxp.com>
 <20230307100949.9231-3-andrei.cherechesu@oss.nxp.com>
 <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
From: Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
In-Reply-To: <370745D6-D6AF-43D0-8E9F-2DB160BE0E07@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR01CA0091.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::32) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|PAXPR04MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e882d17-87fc-4e6d-3e86-08db1f45cd02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zxG1V+6EDCKzXWp0frmluhkcDZNTEg6m56pMhhKbRnXbYAXlcf2SwLLClTPHW1pK1gf7OjMKpCN1xcsJnr/jz6EbeyGrmaNdBVSHGtQLblVcOjQCj1fN7SnkiRBSNhjoED/qveGkPl2oaTUqYAxv6+gdImJ4CEQf6nEMCWLPbZhdRLIAusYDHtlINmWdfKFRhlAxhjHvTWzkdovfzzGHhGBA5Wika5M6ae/R5peZuY5CccS7Onnm43CY4fjDSa2ifJt9hxQU9uJj4LGAFZC5WLVvULzX8GHIgu+nBts6T20WzuZkKyV3HgRPVVom6LdS+FTLj+p88S+cK7aHv5bQJVaXwPjeW/4deWyoRLfHfZgd5NOSZDLDzTSkZcOJJWsVaJ7PyJ2Ca+JMN1fjvvgymy9P7VrRYeCpyjEWW3EA5uzyegF0rh8GMIQY2LeL8KZBZ0RE/kMl9MRnwDwWWG/xwLFoXGVLE/d8yxtyjqkxtWUnJmUa3QCF1Gt0Lf7F4zuAPkYprVXKg/d47re2+vIGSO01zhy0CmdsFmTw+tnlNtXNpiIMhMY7p7BRr6H9wt3IHs8b93Czh6zDfghqnwM2/7uUpgVMEmkJ5OQZ0FVwSx2fDz+LxhdPV9CdG81evgMz54JvcxGPtwV7kZXPuoVnJ5GFz/POixvrtMVUW13KpREHGvbfb8RZY7xk16ZAmyTl38W7SfEFwDKqYHMuLPscg/7oXzQMhzlgV20ACoAw+Ik=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199018)(5660300002)(6512007)(186003)(26005)(8676002)(66556008)(66476007)(4326008)(66946007)(110136005)(966005)(6486002)(54906003)(31696002)(316002)(86362001)(6506007)(53546011)(41300700001)(55236004)(38100700002)(8936002)(478600001)(6666004)(83380400001)(2906002)(2616005)(31686004)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXpmYXJBYWljK2x1dXRCL1RrUmRYeE9jZGw5dVN4UmJkSFE0bUw3TzlaS0N3?=
 =?utf-8?B?YVgrSUdGZTM1SnI3Skx2dXROSUk0T3A3SFpVOURXVHhVYUJ2TEgzUXJNLzhP?=
 =?utf-8?B?NVA5SWZ6OWpYTy90RlpZbHAzN3RxbEJVYzBxd3VaSGdlaWNYbE9hSzNhOU0v?=
 =?utf-8?B?NU5TOXd0Y0FTemVHRnBVUHZXNTVnZXFpUzZ0UTI0TUNOSDVQaDJmWWJTTnAv?=
 =?utf-8?B?MlkrSzNyakFDb0cwL2N5d2szTXQ1bXQ4WUdzWTRoMURRSUY4MFg0aGJ5cmVO?=
 =?utf-8?B?UmtsTTJHeFdOdC9JVkNUYnZFZzA2ZDZVbDNNTXVOYXJPODRaNXZMbU90cktY?=
 =?utf-8?B?V0lrRXI5L25aZ0JzTGlBanljeS9hVXgrQXpNV2dBdEFYbzBSbDlQUEoyUVdH?=
 =?utf-8?B?eDBHamR4YVpORnplUWJXc3l2bVVISy8zdVZROXJ6VEhUL1JGazZETUIzdmhj?=
 =?utf-8?B?Mk44TVVkOVhmcVVWQUs4WDhEZ2F6djZsNm1aT2c5UmcxYlZwcWxqQTBNV1Zy?=
 =?utf-8?B?b0xLcVRqNHdxYmpTaG9QbWUvMXVveEdRWWxLR25vcTk3RXJleDU2MzBZRXhQ?=
 =?utf-8?B?WU5LUWE5NlBMakNsa0ZSSWlMWmJtb0dyNEpuRUxsV3R5YWZJeUJndG93bFhY?=
 =?utf-8?B?dlYrbXJtcmk3c3FXOGVTUVBiUUNXejc3RnNhb0hJZlpJRUpRRndQMHEyN2Ez?=
 =?utf-8?B?d2R4TitUQ3MyejgrZ3AzZ2x3bDFBMnhMMTlnTTVrQWlPN3lXeWlqSUVJVmtU?=
 =?utf-8?B?MFp5bUlXNzg5cGcvSnhHSGJ3amNaVS9EbjVOcXZoemdZQ1pQR0dERzNkZ1FN?=
 =?utf-8?B?MWpWWWZVRWRJOHg5L3RNUW4wUEgweVlUZzN2MlJNZGxmakxRaGpxYzFzb2k1?=
 =?utf-8?B?UzMvTU5iN0YzbmtaR3FxYyt1c2NqSEZhWXZicFhKOU8wbEM4WEIydzA3QTlB?=
 =?utf-8?B?TnNPZzhKL2UwSWVDRm9ObHNReW9VMFpqSjlYKzZCaGdMTmRnL21waGZwSWU3?=
 =?utf-8?B?cWFVUWgybm1ZMjlTaTRQVTl4RHhYOTJSb1ZEenQ3TjRhNUNmUWtiMEUyU0Z2?=
 =?utf-8?B?cWdSRlJPZVhpU0NFakVvalkwZWh3cnlZeFAwUWRqVEF3MW9qaTNpRG5pd0ZP?=
 =?utf-8?B?WGlkOWlGVFNIMUV3UCtSYTZOQ0hDYTdrSmhEKy9zTnB5TVpUditYWWJQb2Zq?=
 =?utf-8?B?OGRRVVZydXBCcThrWWg1aFN3QnR2WHFCSmFSNUlWbUIwMGFYV0lnRkMySURp?=
 =?utf-8?B?N2svd25IaXpEMjR2MThxRys2UERDbDRmNXRHZmJ2M1dQRGxlODR3R0lYZ0JY?=
 =?utf-8?B?NitpUDRpYTIzSGg3ZUhJMkFnUmxEYW5iV2VINUQ2MVJoMXJyV245eEUwZkNP?=
 =?utf-8?B?YWZjcE5xbUp6V0VTNnMwZEtRZ2tGeUFGRWhMVHRUZGxEZmIxUC9IaU1MZk1M?=
 =?utf-8?B?UVpLczFOWXVNQkg5Z0lrTDV4TDQxdTh2clNlWHV2dVZNSjIwZTBWVG1NRkVk?=
 =?utf-8?B?dW9DNnVlTCtOTi9HUXBHazFwMWZkSlVpUmVhRXIxWXFGVDV2Y0dDRlh2OW5u?=
 =?utf-8?B?V21hNjdnSER5TXhQYnhHby8wVklLRmZrdVVlZzgweDBkclFGYWtYMHRGVW5V?=
 =?utf-8?B?a1JLdDR6aDN6emhKS0JDazlqSHpiMHF0Y0QyYmhGYVJ3NGhQKzRiN05LYm9R?=
 =?utf-8?B?WWVNcHRDUG1oeFNGQ3hZT0Q1V2VKUndHMGtndmhiT1ZYL01DS1BwZCt1WjJH?=
 =?utf-8?B?Q25KK0h5djZPVmNhcCs1MzZPRTJsQjZqOVQyYWtNVjdKZUo3R1lUTFFOck1n?=
 =?utf-8?B?T1F3dmhRdUgwNDJoVVpjMmpYQklGOTJ0NVdITmg4azEwMXJrcUx5Q3gwZURE?=
 =?utf-8?B?d3VGZncyUHh6MlRiRWpuNXBUaUhvSDBPYk1YNmpGcHhHTUtJeitwYjRXd2la?=
 =?utf-8?B?bnRiWW1reVdobUxwNm5MZmtLWkMxTVpqVXVIZE9BQ1BGeVVOb0pKUUMvZHhB?=
 =?utf-8?B?S0ZETzZrbGtscGRVMGtXbXE1VGRvVktRd2l4UmZxenpoV1hHbG1wbnMxZGZn?=
 =?utf-8?B?OVdNdzZGUTZBSm9ac1VHT3dCWTRGcm0xMkNXYVhvc0tJblNVK3N3YTgvWE12?=
 =?utf-8?B?QTVQUzVHM0NST05WSmcvMjhDS0VlZzBYMll6eHl2QnZPM2ZPUzgzck83Z2lq?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e882d17-87fc-4e6d-3e86-08db1f45cd02
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2023 19:54:46.7612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qKs2xTwVrv0rgS7lWYq0HquIs4cJTSr81XUEbjMbduLHbeXPbvj+Q/Nr+TScGUCsFRLcKpcDw+Zp3/O1H0K4Ry00K+B3FlkBmPFKbKucGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9188

On 07/03/2023 17:38, Bertrand Marquis wrote:
> Hi Andrei,
> 
>> On 7 Mar 2023, at 11:09, Andrei Cherechesu (OSS) <andrei.cherechesu@oss.nxp.com> wrote:
>>
>> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>>
>> Added support for parsing the ARM generic timer interrupts DT
>> node by the "interrupt-names" property, if it is available.
>>
>> If not available, the usual parsing based on the expected
>> IRQ order is performed.
>>
>> Also added the "hyp-virt" PPI to the timer PPI list, even
>> though it's currently not in use. If the "hyp-virt" PPI is
>> not found, the hypervisor won't panic.
>>
>> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
>> ---
>> xen/arch/arm/include/asm/time.h |  3 ++-
>> xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>> 2 files changed, 24 insertions(+), 5 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
>> index 4b401c1110..49ad8c1a6d 100644
>> --- a/xen/arch/arm/include/asm/time.h
>> +++ b/xen/arch/arm/include/asm/time.h
>> @@ -82,7 +82,8 @@ enum timer_ppi
>>     TIMER_PHYS_NONSECURE_PPI = 1,
>>     TIMER_VIRT_PPI = 2,
>>     TIMER_HYP_PPI = 3,
>> -    MAX_TIMER_PPI = 4,
>> +    TIMER_HYP_VIRT_PPI = 4,
>> +    MAX_TIMER_PPI = 5,
>> };
>>
>> /*
>> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
>> index 433d7be909..794da646d6 100644
>> --- a/xen/arch/arm/time.c
>> +++ b/xen/arch/arm/time.c
>> @@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
>>
>> static unsigned int timer_irq[MAX_TIMER_PPI];
>>
>> +static const char *timer_irq_names[MAX_TIMER_PPI] = {
>> +    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
>> +    [TIMER_PHYS_NONSECURE_PPI] = "phys",
>> +    [TIMER_VIRT_PPI] = "virt",
>> +    [TIMER_HYP_PPI] = "hyp-phys",
>> +    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
>> +};
>> +
> 
> I would need some reference or a pointer to some doc to check those.

Hi Bertrand,

This implementation follows the one in Linux [0]. The parsing order for
the IRQs remains the same whether or not the "interrupt-names" property
is available, since the driver in both Linux and Xen expects them in a
specific order (defined by enum arch_timer_ppi_nr in Linux, for example)
which, most of the time, does not correspond to how they are mapped onto
the SoC. But now it can discover them correctly regardless of their
order in the "interrupts" property in the DT node.

Only the "hyp-virt" IRQ is not required to be present, which is also the
last one parsed.

[0]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/clocksource/arm_arch_timer.c?id=86332e9e3477af8f31c9d5f3e81e57e0fd2118e7

> 
>> unsigned int timer_get_irq(enum timer_ppi ppi)
>> {
>>     ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
>> @@ -149,15 +157,25 @@ static void __init init_dt_xen_time(void)
>> {
>>     int res;
>>     unsigned int i;
>> +    bool has_names;
>> +
>> +    has_names = dt_property_read_bool(timer, "interrupt-names");
>>
>>     /* Retrieve all IRQs for the timer */
>>     for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>>     {
>> -        res = platform_get_irq(timer, i);
>> -
>> -        if ( res < 0 )
>> +        if ( has_names )
>> +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
>> +        else
>> +            res = platform_get_irq(timer, i);
>> +
>> +        if ( res > 0 )
> 
> The behaviour of the code is changed here compared to the current
> version as res = 0 will now generate a panic.
> 
> Some device tree might not specify an interrupt number and just put
> 0 and Xen will now panic on those systems.
> As I have no idea if such systems exists and the behaviour is modified
> you should justify this and mention it in the commit message or keep
> the old behaviour and let 0 go through without a panic.
> 
> @stefano, julien any idea here ? should just keep the old behaviour ?
> 

You're right, I didn't take the dummy fake interrupts case into
consideration. I also think we should keep the old behaviour then, and
let 0 go through too, as you mentioned.


>> +            timer_irq[i] = res;
>> +        /* Do not panic if "hyp-virt" PPI is not found, since it's not
>> +         * currently used.
>> +         */
> 
> Please respect the standard for comments and keep the first line empty:
> /*
>  * comment
>  */
> 

Will update in v2.

>> +        else if ( i != TIMER_HYP_VIRT_PPI )
>>             panic("Timer: Unable to retrieve IRQ %u from the device tree\n", i);
>> -        timer_irq[i] = res;
>>     }
>> }
> 
> Cheers
> Bertrand
> 

Thanks for the review.

Regards,
Andrei

>>
>> -- 
>> 2.35.1
>>
>>
> 

