Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88708C1F081
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 09:42:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153423.1483764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEOEP-0000UB-SQ; Thu, 30 Oct 2025 08:42:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153423.1483764; Thu, 30 Oct 2025 08:42:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEOEP-0000RN-Pc; Thu, 30 Oct 2025 08:42:05 +0000
Received: by outflank-mailman (input) for mailman id 1153423;
 Thu, 30 Oct 2025 08:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EEwi=5H=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vEOEO-0000RH-M9
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 08:42:04 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b7c5839-b56c-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 09:41:58 +0100 (CET)
Received: from CH2PR18CA0032.namprd18.prod.outlook.com (2603:10b6:610:55::12)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 08:41:52 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::9d) by CH2PR18CA0032.outlook.office365.com
 (2603:10b6:610:55::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 08:41:52 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 08:41:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Oct
 2025 01:41:51 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 30 Oct
 2025 01:41:50 -0700
Received: from [10.71.194.215] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 30 Oct 2025 01:41:49 -0700
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
X-Inumbo-ID: 4b7c5839-b56c-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IOLXesMlH2MijGp3PSLpMTrkNOK30kv2Kf2b79ZWuX7RCSl5UNlFckYFgELpjY0C6lNlAGaFHwb9wmZCUnzah6WSTCRRfX5/LnwyzJj+gTsUKUYHIjpFem5qDdDoBl4Qp2v0vSbULlUVqEn0G5dY4R+qSHbHzryRP3Q7F+dYFJ98HsmnWmpYCfTuQBrgOUk9dXOjgCCNLzah1Jsc5lvBK9fUrH2oNLakXKLJtFXGusOgjNB7siTtACYKeZZbqvVR0V1wBhpaq4koLrvTPeczr1hT7PYYN2XxVwCNdHO4nYT9Hw2e1ft1nwjJ3IxES3JIk6i5pbueSGBduETTCemQ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/y0o0RcELoKu8pbsP+8R9y5P9bLFXwib2yu9DI228oI=;
 b=Jx3uuL/ji6r4MTsUAl6n5ivB0f7OwDhfN810RopYIAW5uIwcg/04WWqchfmxyz9KpdkXGks+8kcwA4hC+XT0Erxxl3V1rcOfT+WWIFkYEIar1AbTKYYZIk5/2kuSfNeLWq32HxDjscYWwAav5TJ6zqapuMm1+4VCeJb/TSm+XlcusaEvka/uMOPKa3Ht/YubmVOJI4hD+eQMPuiPzXLDe4wj4f4MAvuF5Pzq8irDwtu83rff98s8yIh2vIXV4dM9tsYb9zakFZvfAuGdxsL4bzpqRnd8wNwrtS9Pdw91kjNQphwBnrB4JRehIMK/sg/aSABX0cpAV47aRyZ8GmTwQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/y0o0RcELoKu8pbsP+8R9y5P9bLFXwib2yu9DI228oI=;
 b=CYX40KqGzxpN6qCi0N5HOU/2CN3TKxVD5qGo+0dpPSnJ/aeS+6HtgVieNjTkD7OtxWqo9a4rARaSZ6YYVT5vPM+2AcMnnKRrLrc6DRcqyBUj7JYhdpR0muDhqUAyCBEOL9ErC4cqo1keL4G+hp4E1usVXgHGrK02WfcOJRHNMmc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5c1db85b-8733-47d5-b751-864cdb45aca4@amd.com>
Date: Thu, 30 Oct 2025 09:41:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <volodymyr_babchuk@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Oleksandr Andrushchenko
	<oleksandr_andrushchenko@epam.com>, Mykola Kvach <mykola_kvach@epam.com>
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
 <CAGeoDV9ejB-6tg0eNK-6jD8zEZb1G0+AmJNaKVt50P4DiB6Kng@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV9ejB-6tg0eNK-6jD8zEZb1G0+AmJNaKVt50P4DiB6Kng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d49915d-ee61-435a-c46f-08de17902ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dkR4b1RDRlk5S0h4aU4yVjdqMTlSMnJkY0oyZUYrY2FxSnpicFl3N2s4eUZU?=
 =?utf-8?B?VXVDRDc3djJ5WmM3R1JzbDNOSS9hWWhGdE9DUHVZaFlFcktjMGdxS2duV2di?=
 =?utf-8?B?NzM3Y0VTRGRhRkdtVWNBTGxlNUhDZ1JIbTdCWWk3Z1VqQm1XbUNEVFlIQWdk?=
 =?utf-8?B?T2xWWWpWQ3J3aGRRR1hMT0N5Tjh2bGZvaG9qTVFYS2t4a0t3djUyZi9YSHpa?=
 =?utf-8?B?M1UvemtmQkJFWUdKMjlZdHN1Y3NhODlJYUptcmdFaVlxaUo2TFdJbHQ5OW9R?=
 =?utf-8?B?Y01JY3NaYnk4NllHSXRQUmJXdS9kSjcrZVNPV2FvNkJzbGdFU1FqK0ErWkdS?=
 =?utf-8?B?MFVXQXBYSEVaQk1USTRubGdhY2QwNS9Eb21uSEVuaG14V3dOQnJRQVFKWElw?=
 =?utf-8?B?OG9lWEMyK3JvRmo4ZjRhN2llL2NZVlBrVFp0SXJ3UGhZV2hWc05xTnQxdm85?=
 =?utf-8?B?M0ZydjRzazRnQzJpcHoxaFlhME5YRk1PZ0N4V25RbXQzamduK3NUanlyOXVq?=
 =?utf-8?B?K3hYL0lteUExTU11YUZ4aHFqamZ0dzJRdVhhZmdiaTNYcEhibXBPaFZmSWtw?=
 =?utf-8?B?c2RsaC9FcENiRWFvc1hSY0xUck0vZ2NoVWFOZjdHT29MRTFFWUR1UUJkNDE5?=
 =?utf-8?B?VDAvMVROVFFEUWU1REtKeGk3Qkk5dkF2SHhURlR6N0NCcG9ZRjdGVmM5MG9L?=
 =?utf-8?B?VUthOTcrMGY5dnFic0x4ZzNiWW5DbmpRTGxlak9MNEZkWkQvS2szWkdGVmpJ?=
 =?utf-8?B?U3MzU3dKQm12OXJublRYeWl3U2Y4OHVnT0ExZTBlczJjd2dlaGxjZ1R5SzB4?=
 =?utf-8?B?czdndDkrajNTUnFZTFVJK1c1bUNxSWxGNll2WUpubFo5OGo4VEpBNWxGaVJG?=
 =?utf-8?B?ZFd3UTRCTWZaOW9oaklxdWdqQVU4a1dpUFVMY1VIc3pxUllRcU9CN2xJM29Q?=
 =?utf-8?B?b29jNFhTczdxZGRVRVlUZVJONDdvc05pd1ZOUjVVd3NDcHlRR21KZTZ1MDkr?=
 =?utf-8?B?TGlRNU9IekZ0elllbERKKzFmenF4YlB2VUREdWZYSURVYUxNK0EwVEt0TVNh?=
 =?utf-8?B?QldwRVBsZXVhR3Y0MmVXN2R0YUV4SURpK2JhR1JYRVFPOW5QaGdwYlljenZ3?=
 =?utf-8?B?ZHQ3Zm16aGRaWi92QjdRcmdZYnpnRlVzaW9HbG8zY2tSMFNOUXZuRXEvNTFx?=
 =?utf-8?B?WHVJK0V3WXowQzV2cXd2UlRmMW93ZFVHQ2g0d24zVUVzejBVYk5aeFFPZjFo?=
 =?utf-8?B?eTB0bmE1Q0FjbDRNY1hDelUzcmcrRk1ZM1FpVGh2QzY5VWdxTG5PQ1R5WVRC?=
 =?utf-8?B?alVxeW5Tdjk1Vll2Z3FyN1ZNRmhVem0zMGxpdnVoSFMxcEVtOEpYMnBlMS9I?=
 =?utf-8?B?bkhNVGp5YjZEYk1QUEIyaGtZQUlzNzJwanhmM0J2WDh6ZXRRdEpmVWxRVUhP?=
 =?utf-8?B?bm9uS3hkV2RseHlBVXVOTy9LZm1WMHlYMlBMN0pjMFBPT20zdEI5L1ZHZW9X?=
 =?utf-8?B?STdvbEZpRENjaUNONnI2MFdXUHRmT1VzOWdqeEZMVTVkYitMZ0grQWZ6em5w?=
 =?utf-8?B?TE9HckNOQXM0V1Btdjg1WklBZVZhcmZ4QmdEcEttQU1taW9KZ0k4Y2h6NWNO?=
 =?utf-8?B?bW8vUHpwRDFyaGNoaC9IQW9vRGVNVkZYeGhzTE9CaU5VUVpTKzVIejZvcHVQ?=
 =?utf-8?B?cFd1MVh1Y1dVeHdVcDZFWFpka3V2UkdpYkhyYXRXY3hZRzNzc1ZmZnVwOUFa?=
 =?utf-8?B?cG9ac2l2WmkzOFRZNGNQWmE4b0orT2pTOWZlMlNuelkrVXJaRmtsdkR3aHNv?=
 =?utf-8?B?ZERENWRjNFFIWXREKzY0RUhSOWZycHdDZ1pOMDlTTnR4NlkvY0xhdEJXYjl5?=
 =?utf-8?B?OGJmWGhtYjF4UjA2YVdVcUVveGVHaE53VDRPQjR5WkRnUFRyYTN0VFlPVGxT?=
 =?utf-8?B?Rk9GaytMbVN5VGVscEdSbHc1NEI4eHpnNC92L0IxYks5U3ZFcG1BZzJreFpj?=
 =?utf-8?B?UDhFekIvV0NRN3dSRUlYcURzLzJwRVcvdUZ0MmRzSldrcjFTRHZTaFlDSWg4?=
 =?utf-8?B?RmpHZ1RxNjVSOUNHbXgxM3JzRFkwQ1F1ZnlVSzJVWnhoM3Jmbzd6VmtjUVZV?=
 =?utf-8?Q?fNKU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 08:41:52.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d49915d-ee61-435a-c46f-08de17902ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336



On 30/10/2025 08:59, Mykola Kvach wrote:
> @Stefano Stabellini @Michal Orzel @Julien Grall @Bertrand Marquis ping
> 
> On Thu, Aug 7, 2025 at 8:16 AM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>
>> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>
>> Implement suspend and resume callbacks for the SCIF UART driver,
>> enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
>> handling of UART state across system suspend/resume cycles.
>>
>> Tested on Renesas R-Car H3 Starter Kit.
>>
>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>> ---
>> In patch v5, there are no changes at all;
>> it was done just to trigger a review.
>>
>> In patch v4, enhance commit message, no functional changes
>>
>> In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
>> the suspend/resume functions in the SCIF driver.
>> ---
>>  xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
>> index 757793ca45..888821a3b8 100644
>> --- a/xen/drivers/char/scif-uart.c
>> +++ b/xen/drivers/char/scif-uart.c
>> @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data)
>>      }
>>  }
>>
>> -static void __init scif_uart_init_preirq(struct serial_port *port)
>> +static void scif_uart_disable(struct scif_uart *uart)
>>  {
>> -    struct scif_uart *uart = port->uart;
>>      const struct port_params *params = uart->params;
>>
>>      /*
>> @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct serial_port *port)
>>
>>      /* Reset TX/RX FIFOs */
>>      scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
>> +}
>> +
>> +static void scif_uart_init_preirq(struct serial_port *port)
>> +{
>> +    struct scif_uart *uart = port->uart;
>> +    const struct port_params *params = uart->params;
>> +
>> +    scif_uart_disable(uart);
>>
>>      /* Clear all errors and flags */
>>      scif_readw(uart, params->status_reg);
>> @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *port)
>>      scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
>>  }
>>
>> +#ifdef CONFIG_SYSTEM_SUSPEND
>> +
>> +static void scif_uart_suspend(struct serial_port *port)
>> +{
>> +    struct scif_uart *uart = port->uart;
>> +
>> +    scif_uart_stop_tx(port);
>> +    scif_uart_disable(uart);
>> +}
>> +
>> +static void scif_uart_resume(struct serial_port *port)
>> +{
>> +    struct scif_uart *uart = port->uart;
>> +    const struct port_params *params = uart->params;
>> +    uint16_t ctrl;
>> +
>> +    scif_uart_init_preirq(port);
This will also call scif_uart_disable() that was already invoked during suspend.
Why do we need to re-disable it when resuming?

Other than that:
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


