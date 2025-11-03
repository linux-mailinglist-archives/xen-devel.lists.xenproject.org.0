Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC19C2A8AF
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 09:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155226.1484736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFpoY-0004uO-Fm; Mon, 03 Nov 2025 08:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155226.1484736; Mon, 03 Nov 2025 08:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFpoY-0004sT-Ca; Mon, 03 Nov 2025 08:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1155226;
 Mon, 03 Nov 2025 08:21:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MMMf=5L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vFpoX-0004sL-0H
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 08:21:21 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0fd3773b-b88e-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 09:21:14 +0100 (CET)
Received: from SJ0PR03CA0390.namprd03.prod.outlook.com (2603:10b6:a03:3a1::35)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.13; Mon, 3 Nov 2025 08:21:06 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::ce) by SJ0PR03CA0390.outlook.office365.com
 (2603:10b6:a03:3a1::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 08:20:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Mon, 3 Nov 2025 08:21:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 3 Nov
 2025 00:21:04 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 3 Nov
 2025 02:21:04 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 3 Nov 2025 00:21:02 -0800
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
X-Inumbo-ID: 0fd3773b-b88e-11f0-9d16-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWzsFgeeeMZT+8gV0QfbnWLNyxhWodXmgYvZV87B8xH4v7G/oAK8CTEtojz78uaZl7hFcEEO+dCR+kn/ayvrGC4PnolL03LwXKiZmRQfZUn443umyGGeJrKaiEEms3ahb14Y7SYdzllLFLJbfmZ2sitNXEYZBljxa6PgI8HqjdfsAwQkUB+uEdjyf/wGSk7S11AHFIiqXrlZ/wEr9nVJb4BG2ecEN+NUL668I95x+fWNDjBYtOagUvUaf/MUoN80iQIGFUnN9r886AFd7PVhmvhL0oSjNo84DMjerGallWFdUV21hi6GiC6/S8y7/kkENoFCJHyoc+nvvjEwfUJRJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzpI4N0VoaKoDwPnKdSNJrSZNt2XpjQzIv/AeIVZz5c=;
 b=ITod/Sr08aH8E8yAdJMu5yy9AtMiFoqzw6fIbNQbOznBu3nwceuJwSdftVB+4bTQ5EZTf5gzMfthk2U3OSiC7Ver42rVaBqcuOz/1606rcV1EnBfxHxrRO6erAyd6HVpR0KBAmtr+yPGEupgDvaPBl7hEEaVfVPWOmX9sTn1LOCmLVWSoSvt3Y7SuKYYdCOKpKgbzmCbZtPtyPM5ePFBxOqw6cecdx2peq6VNvbt0X/cZXjw07ug3UqcFvZqg66LO9tkB9GDX5IBDxH48YPy6wBTBACykz2O7OD4c9yjqRlps9Wfk6ujpmFRUUFd3/KXe08Nm324MnccMUC2wHKQHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzpI4N0VoaKoDwPnKdSNJrSZNt2XpjQzIv/AeIVZz5c=;
 b=iz/qxnE/hkN0vueUIHe8L48WbqyL8RutS7S8DAWPHs3kFsp6cIHUTddYlvUDt20fU79ibE3cryRBsSrLH11/LvymnL9iXa+99RrDEK47TADuAh1ACNEgxm/GvCn9IEPvfPOn/xjUEhyAzAegpDcq4ddnr90kn4tDi62CPMuastQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <575902ae-c22d-47f4-a6ca-02a2125f39d6@amd.com>
Date: Mon, 3 Nov 2025 09:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] xen/char: implement suspend/resume calls for SCIF
 driver
To: Mykola Kvach <xakep.amatop@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Mykola Kvach
	<mykola_kvach@epam.com>
References: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
 <CAGeoDV9ejB-6tg0eNK-6jD8zEZb1G0+AmJNaKVt50P4DiB6Kng@mail.gmail.com>
 <5c1db85b-8733-47d5-b751-864cdb45aca4@amd.com>
 <CAGeoDV96uei_QLCYBrFsJP5OU2=x2xjGKOHyKSDHfGJfk0RomQ@mail.gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <CAGeoDV96uei_QLCYBrFsJP5OU2=x2xjGKOHyKSDHfGJfk0RomQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a494c9c-7e1b-49d7-2af7-08de1ab1ef8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajZGVitlN3Z0b0dIN3hmek11b0w1YzU2UWMzaVdQVFhOV0wvbkhCb0JmdFRF?=
 =?utf-8?B?VXJnN1RQbUQzajZ6dHpEOXhLMkMrVXhVc2hTYjlXMDlpdE53Sk9IUVFCeEFQ?=
 =?utf-8?B?L2QzRmNxbkRvdVlkOGpyV3BMeUhWZHdDVU9LTEg3Ykc4QmUzUlF3dlQ5azJk?=
 =?utf-8?B?NEtFZFROOWZ6RGh1cnhyekk5UTd0Z0V1Y2dzVk9jWVpuWjVhdnNRWUZabnhV?=
 =?utf-8?B?UVphRUNnNWdZcUhJWlBBbjZhRVFpZ0Zzekdzd2xyVmdkeisvMW53RkVlREkz?=
 =?utf-8?B?SVlYWE9NekxwWkpRK0VvUEFXNEpQNU9MakkwdmtyQ2JZT2tJK0ovNXR5Uy9z?=
 =?utf-8?B?QnlERnhmMHM0M0MzVUVkZnNnbXBMVWZ0MmlteG5qY294TTVVMlloY1FrK2dN?=
 =?utf-8?B?aHlZLzVPb29QaE1DSU1QdElBMjJmVldXdlI5UmRjVHZpcERQTjhOb3BWYVJy?=
 =?utf-8?B?RWRLRkFhRjdIWVF6ZEErWEg0dmFKbUVOUHExOEJvbU5MTE1BeEJhd055U01x?=
 =?utf-8?B?MTZrZGhmamRYcjRkTHFDZmlVUzFjYVFiRmhxYVlNZk8rU2tJQ2x6dW90Umda?=
 =?utf-8?B?MHY3M2lxWlhLTjBVRFZHT1dUdHZEWVRnYUFQTG93RDQ3Skh4a2dFRmRWVVc4?=
 =?utf-8?B?VDVDZy9FWE5aWkZwUFhIY0lpbDBmM3JhNU5vS2dRRmtxUzRLb1RCOVJSSVcr?=
 =?utf-8?B?ZHZNN0taYWxEdXI5YVppaFhVOUYwZWMveVMzWnBpWXZrQ2hjdjdpMVFwWEk4?=
 =?utf-8?B?Y0ZmOGE4dmhuNm9WY2dLSjNpdStKUlhRemRBR3hUb3FDZE1SM2I2cWJsUFNj?=
 =?utf-8?B?Mk9wQTExTysvbkFKV0ZGeFFydGNyT1dOeTJhM011VUlnZWdvNXBxSlgwTjhP?=
 =?utf-8?B?VXk0MWF3VXdjeHR2dkNpVCtsZEZlNEFadWd1a2c3bG05TURGZ0w1NjU0K0Jt?=
 =?utf-8?B?d0hNTUdGZXBVYlNUdUtWcEkzbno2WVF4aFpDam1zSDkvQk4rdG5XbHhHM0g2?=
 =?utf-8?B?cWRzSTdDRkhXQnFJYmhJRy95blhQNWd6YWs2d0FCeWpHcmVBWVM3YXNXbzdq?=
 =?utf-8?B?L3ZpaFlxb2xldjJ2cUtLL0tuaUxSWm9QTk9objdwclRpSU5UeUd3aW1RSHpw?=
 =?utf-8?B?ODhjT0RsUXdNMElsaG4xbEFlSzA1S3I3MEpsV0lZdVNsSmQ5bTVOdVU5MzRJ?=
 =?utf-8?B?WHI3TG1yMytETDJiWDV1N3BHUHlNOUJhakx0MXJNT0tNbEdFOTlmNHNiWlN5?=
 =?utf-8?B?dlZrSHN4QXlRR2tzSjdGekNMVUU4LzRzQjB4UEZ2a1ZoVXdwQnZ1N0JVek9h?=
 =?utf-8?B?MXRGektJL0JQT1FFZk9CcElPVmEvZWdHOU83RjhOT3p2dTUza1dYY1hMSXo5?=
 =?utf-8?B?L1UrRDJCa0RyQWdkMWxBbnN3aWxFczFkV2ozTXZURURkRDlkdy9DbkhCdG1O?=
 =?utf-8?B?cEk3RmtwV0MxbXpoK2NsbjhyN2w1UVIxNnFwdWNrMXVkdFlDeGoyL2x1TEVF?=
 =?utf-8?B?MHdCeXJCYTZoeFlkaEZqWDRaZkdQWTY4Y2hFc3JXNmh6WWliTUprNzhmK1lG?=
 =?utf-8?B?WGp6bEFYeElpdXI2QVhkVXo0VjRhMkhpazRIQ1dGOU4yV3JjVTJPOEUxVzNp?=
 =?utf-8?B?aW83VDM2UjJsNldxcWZ0WG1nSk1Jc3orUmpKLzZ6NjRFQ0M1WXQ1VVBlUWY2?=
 =?utf-8?B?anRWdkZHTWc5UkhOUDkxWnBIaHpRemlQbkZBenN1SXp4OFlKWGhJOUtBTml0?=
 =?utf-8?B?cnREWWRrc1F6QmJVZEtYT1BWaXVpSFpTbHVRbnNOK2Zac1ZSUVppM0pDbUtq?=
 =?utf-8?B?UHFQWWQ0ekZBbGV2QUtoN1dNSCthQWk4TnN0K0l4dEgyYkRkdjlZeklYOWtq?=
 =?utf-8?B?d1A5MVFycUlKMDY0YzdKVWRHRUJMVTIwYllQS0FsYmNuU2lnbmdja2Y2UWhk?=
 =?utf-8?B?WEdSdy9FRllVYnBObkc1OFAwdDM5WmpQT3B4MDdycmR1eTFOcndrL1l4a3hD?=
 =?utf-8?B?ZEIwamFCTmwxL3VBeVN2aFNLL1FvRlRjREZxTUdiQmpCQW1tc2ZwdnBZN0Rr?=
 =?utf-8?B?RnRQZXpHQmp1cDdwbDVWKzV6bzFKdmRzdnZUcHlBWVBjZnBMSVc5R0U4Mlp1?=
 =?utf-8?Q?+gos=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:21:06.2446
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a494c9c-7e1b-49d7-2af7-08de1ab1ef8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010



On 03/11/2025 08:30, Mykola Kvach wrote:
> Hi Michal,
> 
> Thank you for the fast response and the review.
> 
> On Thu, Oct 30, 2025 at 10:41 AM Orzel, Michal <michal.orzel@amd.com> wrote:
>>
>>
>>
>> On 30/10/2025 08:59, Mykola Kvach wrote:
>>> @Stefano Stabellini @Michal Orzel @Julien Grall @Bertrand Marquis ping
>>>
>>> On Thu, Aug 7, 2025 at 8:16 AM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>>>
>>>> From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>>
>>>> Implement suspend and resume callbacks for the SCIF UART driver,
>>>> enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
>>>> handling of UART state across system suspend/resume cycles.
>>>>
>>>> Tested on Renesas R-Car H3 Starter Kit.
>>>>
>>>> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>>>> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>>> ---
>>>> In patch v5, there are no changes at all;
>>>> it was done just to trigger a review.
>>>>
>>>> In patch v4, enhance commit message, no functional changes
>>>>
>>>> In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
>>>> the suspend/resume functions in the SCIF driver.
>>>> ---
>>>>  xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
>>>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
>>>> index 757793ca45..888821a3b8 100644
>>>> --- a/xen/drivers/char/scif-uart.c
>>>> +++ b/xen/drivers/char/scif-uart.c
>>>> @@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data)
>>>>      }
>>>>  }
>>>>
>>>> -static void __init scif_uart_init_preirq(struct serial_port *port)
>>>> +static void scif_uart_disable(struct scif_uart *uart)
>>>>  {
>>>> -    struct scif_uart *uart = port->uart;
>>>>      const struct port_params *params = uart->params;
>>>>
>>>>      /*
>>>> @@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct serial_port *port)
>>>>
>>>>      /* Reset TX/RX FIFOs */
>>>>      scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
>>>> +}
>>>> +
>>>> +static void scif_uart_init_preirq(struct serial_port *port)
>>>> +{
>>>> +    struct scif_uart *uart = port->uart;
>>>> +    const struct port_params *params = uart->params;
>>>> +
>>>> +    scif_uart_disable(uart);
>>>>
>>>>      /* Clear all errors and flags */
>>>>      scif_readw(uart, params->status_reg);
>>>> @@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *port)
>>>>      scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
>>>>  }
>>>>
>>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>>> +
>>>> +static void scif_uart_suspend(struct serial_port *port)
>>>> +{
>>>> +    struct scif_uart *uart = port->uart;
>>>> +
>>>> +    scif_uart_stop_tx(port);
>>>> +    scif_uart_disable(uart);
>>>> +}
>>>> +
>>>> +static void scif_uart_resume(struct serial_port *port)
>>>> +{
>>>> +    struct scif_uart *uart = port->uart;
>>>> +    const struct port_params *params = uart->params;
>>>> +    uint16_t ctrl;
>>>> +
>>>> +    scif_uart_init_preirq(port);
>> This will also call scif_uart_disable() that was already invoked during suspend.
>> Why do we need to re-disable it when resuming?
> 
> Thanks for the question.
> 
> Yes, resume calls scif_uart_init_preirq(), which in turn calls
> scif_uart_disable(). This is intentional.
> 
> - While Xen is suspended, EL3 firmware (e.g. TF-A) may use an early
>   or runtime console and reconfigure the SCIF, including enabling
>   TX. Re-disabling gives a quiescent baseline.
> 
> - PSCI does not guarantee device state across SYSTEM_SUSPEND; device
>   preconditions are outside PSCI's scope. We cannot rely on the state
>   Xen left before suspend.
> 
> - We reuse scif_uart_init_preirq() on resume to keep a single,
>   well-tested initialization path identical to cold boot. This avoids
>   split logic and keeps behavior consistent.
> 
> - The extra disable is idempotent and cheap (FIFO/status clear), while
>   preventing spurious data on bring-up.
> 
> I can add an inline comment to make this explicit:
> 
> /* On resume, EL3/firmware may have touched SCIF (early/runtime
>  * console). Disable again to start from a clean, quiescent state
>  * before reinit; reuse scif_uart_init_preirq() to keep the cold-boot
>  * sequence.
>  */
No need, your explanation makes sense. Thanks.

~Michal


