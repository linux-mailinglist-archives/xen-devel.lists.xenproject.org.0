Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF04292BA9F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jul 2024 15:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756264.1164825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAa5-0005pD-Bg; Tue, 09 Jul 2024 13:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756264.1164825; Tue, 09 Jul 2024 13:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRAa5-0005mk-7p; Tue, 09 Jul 2024 13:08:29 +0000
Received: by outflank-mailman (input) for mailman id 756264;
 Tue, 09 Jul 2024 13:08:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k/4u=OJ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sRAa3-0005mA-WC
 for xen-devel@lists.xenproject.org; Tue, 09 Jul 2024 13:08:28 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:240a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52b07ba4-3df4-11ef-8776-851b0ebba9a2;
 Tue, 09 Jul 2024 15:08:25 +0200 (CEST)
Received: from BN6PR17CA0035.namprd17.prod.outlook.com (2603:10b6:405:75::24)
 by DS0PR12MB8320.namprd12.prod.outlook.com (2603:10b6:8:f8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 13:08:19 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:405:75:cafe::8b) by BN6PR17CA0035.outlook.office365.com
 (2603:10b6:405:75::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 13:08:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 13:08:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 9 Jul
 2024 08:08:18 -0500
Received: from [172.27.0.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 9 Jul 2024 08:08:16 -0500
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
X-Inumbo-ID: 52b07ba4-3df4-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzfFn8P1aaEt74rEpTpskRA18oSgJ6E1VsSrs7lh+PB6jmZhExunMG2N+l6LoH3OtIGL+xSTn/u2Gql7MBbJ6tSvmZ/Ax0tDh34mvtXWJON0vcSzF17lv4B1Km0i9d43BM+krZ/ceFymH3UOcvSxL5g0HXEg9RIKIMrCdZBfyL/xZdpwgak++2t8e6g1tY1e8rH52/zK5BVojcHDemAgUOerir9sI9xfFF6pqQqPcCAws6Kwhr+BP37DaDby3NskT7Fr7i40AY8evBUrwFZ9qRbxDiqPZPhY0yajiM6AlHxUnh/j6778KDrv55a7+PMFCIP2YUU8vT5VAGRsv5S84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LlpqXmSyRDgkU25hc8SLHYu2bhD4WWJ4MtJWsEyMHzI=;
 b=KlpFPFCoMRiHVzHGwKgaMNs8vaqQ7BKC9phAVw1gNAVteQ4OwC6UjSknvpJ7g+gkj6t85HFCTczcPgqtywcnwOZtmLo/i/zzsX3odonlebMx93AoiwINTiZEMPs/TloWcay4CcYT7AFbEdF/+TAJaSpcPp90dQOC+aDI3N5GELWYHGR1nj7Le4VEvQmSEIq6eYV6JTPU5h4fZEu0zZY26c+rDCn4imRssOkEhqRCATArSZOJy6XEeE1eVv/YLceX9NGhNc54YC76HUSwMOtnTfq2w3rmoYJNAPin2f1TiPYK7dOXfMjdzJ+cuzL4kep3WaXk6aySfnaglQbTM0fUeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LlpqXmSyRDgkU25hc8SLHYu2bhD4WWJ4MtJWsEyMHzI=;
 b=wAvK7Luqx0uO2K6ZOUsY1hWUbYpGr+T8ZGXuGSZQ2jUqQkPAEVkQ53prdLr9LXaWqGoxvlYSZqL7mCuXTalSyO9ah8yC6dUPUnzof+PdYs5yzNbZh3neGSK8goBQPr2wSuBs8CqyfZflrvaT0b2AX448ZrArOBjpjsBIbst1MCc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3d6d35ea-5044-4249-a277-0e5aa31ed888@amd.com>
Date: Tue, 9 Jul 2024 09:08:11 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Problems in PV dom0 on recent x86 hardware
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, Jan Beulich
	<jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <baade0a7-e204-4743-bda1-282df74e5f89@suse.com>
 <d379a900-fd1c-42ca-bc31-071f7fd80d0b@suse.com>
 <ZousjqOAFJgO6681@macbook.local>
 <6101999a-6f88-46cb-b850-af43b364f299@suse.com>
 <7a0a8b1c-69e0-435d-b4f4-7a9d784eab29@amd.com>
 <1f96a355-b0d2-4cc9-a2ae-6d3ab750136d@suse.com>
 <89d7b5a6-e971-4cd0-85df-0dd599d0ba1b@suse.com>
 <7d207d6c-d025-4fbb-8649-9c42224097f5@suse.com>
 <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <88db3cb6-2b7e-48b2-9bf4-d871067325a0@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DS0PR12MB8320:EE_
X-MS-Office365-Filtering-Correlation-Id: b2afd9c6-993f-4c15-283e-08dca0183448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U3NpaTM4OSs5RjlabXdyckVscXlIMStudGh6dExDZ0xucnZ1WUE1TkJLMXB2?=
 =?utf-8?B?MUV1RU5sTVkzaTh6eE50RFV2RXB5Wkl2YmJkNUgzcXB0cWlFa1krWkVZVnox?=
 =?utf-8?B?Z21CZlhMZkVoa3RqOVdRUVlnSmhDOUZxbzlvbm5xVHBzTUdYcWVaeHlXeVg5?=
 =?utf-8?B?YktXSDYxd21uUVpQcmpkT0twRjNGY2JYTSsyZTdxUHg5VWtYTHdYOFhHNlNm?=
 =?utf-8?B?RnRvT1lYMEF2b0pORzlYQjFBa0tzVHpocjMwVGRTY0s2QUhlMGgvMTV3dXNE?=
 =?utf-8?B?Q1ZXbnFaZ1FtazFlcTIzcmxBRzBWeUZFQ0RnSmVzaE91UlZTcVJMNVVTZ3A2?=
 =?utf-8?B?WUNjZkZzbC9sUU90V2g2YzBlSnE0bEN0S01XTk9PVVgvdVFyeXRuUEJjVlNv?=
 =?utf-8?B?clJoY1o5K1hSaTR6KzJ0a0JTOHNOdDZ3TFJFejE4dGEvbjM4aXdGbHRmUG1h?=
 =?utf-8?B?OEFaajJwZk9vbTh1alp2RGM1T2FobzZaUStGaDdFOXVMTUQ5aUJQWGQwU2lX?=
 =?utf-8?B?U3JNVVg1WUtnci9PcTdhaDloRFQ2Zksrb3plWWxkWlpjRUZMOGdoenhWd2RO?=
 =?utf-8?B?aEJHN0VYVmxZRURQY1NadTh6N0RWSkxMczNiazEzMWpLSVRJRjBqVkhSU2x1?=
 =?utf-8?B?bjYvYlg0MjNxOGNCMGI3blNDVEEra1I3K1lhNTBRcTltbFRkTGIvZUNnNEIv?=
 =?utf-8?B?WDlVNlBETktKWFRIcTBtWHJvR3V0NTNxU3Q5NTdJaHRvbVJ1Y0RYL0pmc0wy?=
 =?utf-8?B?N1FsTlhmQmE4elJZdUdlZVJjREhRZkJoUjBzdHZDLzBMRVRtaWFxNjYyMjln?=
 =?utf-8?B?MW5hU1VsczJIYXRnNFNxOHZOb2V6N0M3eEp0YzlmNG9MSGlZcmUyaG1PcjNV?=
 =?utf-8?B?NmFTTjJIYStLWDNxUi91eGpwcGZ3UlB1VmphaGRnMjN4RHhES2x2R1BTL0FW?=
 =?utf-8?B?STkyRExyT3Q2d0hhUmdQc1dGcTJKOXNuam91MVVLeVorYUlyMW5QRktkRHYv?=
 =?utf-8?B?Y2E2cVVHbTBqb00zV2tTckFxY1o2YkcvTlBINmREbG0yc0p2MEpIb2lEbzZS?=
 =?utf-8?B?a3dMNlBUVTNCSGNFZlQ0elpxTDREQnIvSzhxd2syWUtUcS9GWTN6TE9RVmhp?=
 =?utf-8?B?Qk1Ja2RsNmpuS0NTaEVsTE9rYnUzS0RkdmxBN2lmY2g0THNaSzBNVlBHbTdU?=
 =?utf-8?B?SmV5dWhoMDB0YnhiUDlYTGJ3VWxCWW81bU92UjBURUZNZDFQRE13RXgwMVlK?=
 =?utf-8?B?ekxNUUJJL0dSZ3RZb2R5ZDdFYjhnam5zN2pRTy9WdlluVmY5SFl0NTBqV1hY?=
 =?utf-8?B?WFBkZEQ0aHNXamFteno1ZGsrcE4rdkRLSVBBOGRrR0QrU3ZtNDVsVkw3U25k?=
 =?utf-8?B?dFNBVUwyMTNZRklRNllKY3g5T1EvMmhWMnJ1a2lrUVAxeHVhNUFKQngwQysr?=
 =?utf-8?B?ak5uMXhrV1BheUhUaDNDM2FDdTI5akZkSndEOUZaZlBudWR5STlCZkJnRFVq?=
 =?utf-8?B?QUxnL0lwS0I0WnlvamJVRyt4THhzQXdIdGlzSVNUc2xKbStyRE8wMTd4N3hl?=
 =?utf-8?B?aHpWUmFNcFZoWldGZ2djK0htNmozc0FaNjJCWndERzh0N2hRMEt6R1Bsd2l0?=
 =?utf-8?B?QnI3SVdOS05yaFJXUVViYzVMeWQ4eVYwbHF2U3Vadi9wR3ZMTG5VTzMreHkz?=
 =?utf-8?B?S3pPS002eGplTmIxOUlWVmZIMTBXSVdpSXhSUmlIREdYaFB2NmpmQ05ub3FS?=
 =?utf-8?B?K3pTc0xVVUswYk5DWXpMUHNOa3h5MjFoWXY1eHpyTFlFRzYyV25scmtna3Jm?=
 =?utf-8?B?ZHM3RU5iRmIyd0dmRWdTcjdlYWxsWEVURTYzN1V6QktyVjhLT1JqZy9leUZK?=
 =?utf-8?Q?ty0ogju8LPvji?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 13:08:19.3914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2afd9c6-993f-4c15-283e-08dca0183448
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8320

On 2024-07-09 06:56, Jürgen Groß wrote:
> On 09.07.24 09:01, Jan Beulich wrote:
>> On 09.07.2024 08:36, Jürgen Groß wrote:
>>> On 09.07.24 08:24, Jan Beulich wrote:
>>>> On 08.07.2024 23:30, Jason Andryuk wrote:
>>>>>    From the backtrace, it looks like the immediate case is just 
>>>>> trying to
>>>>> read a 4-byte version:
>>>>>
>>>>>    >>>> [   44.575541]  ucsi_acpi_dsm+0x53/0x80
>>>>>    >>>> [   44.575546]  ucsi_acpi_read+0x2e/0x60
>>>>>    >>>> [   44.575550]  ucsi_register+0x24/0xa0
>>>>>    >>>> [   44.575555]  ucsi_acpi_probe+0x162/0x1e3
>>>>>
>>>>> int ucsi_register(struct ucsi *ucsi)
>>>>> {
>>>>>            int ret;
>>>>>
>>>>>            ret = ucsi->ops->read(ucsi, UCSI_VERSION, &ucsi->version,
>>>>>                                  sizeof(ucsi->version));
>>>>>
>>>>> ->read being ucsi_acpi_read()
>>>>>
>>>>> However, the driver also appears write to adjacent addresses.
>>>>
>>>> There are also corresponding write functions in the driver, yes, but
>>>> ucsi_acpi_async_write() (used directly or indirectly) similarly calls
>>>> ucsi_acpi_dsm(), which wires through to acpi_evaluate_dsm(). That's
>>>> ACPI object evaluation, which isn't obvious without seeing the
>>>> involved AML whether it might write said memory region.
>>>
>>> I guess an ACPI dump would help here?
>>
>> Perhaps, yes.
> 
> It is available in the bug report:
> 
> https://bugzilla.opensuse.org/show_bug.cgi?id=1227301

After acpixtract & iasl:

$ grep -ir FEEC *
dsdt.dsl:   OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
ssdt16.dsl: OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)


from the DSDT:
     Scope (\_SB.PCI0.LPC0.EC0)
     {
         OperationRegion (ECMM, SystemMemory, 0xFEEC2000, 0x0100)
         Field (ECMM, AnyAcc, Lock, Preserve)
         {
             TWBT,   2048
         }

         Name (BTBF, Buffer (0x0100)
         {
              0x00                                             // .
         })
         Method (BTIF, 0, NotSerialized)
         {
             BTBF = TWBT /* \_SB_.PCI0.LPC0.EC0_.TWBT */
             Return (BTBF) /* \_SB_.PCI0.LPC0.EC0_.BTBF */
         }
     }

 From SSDT16:
DefinitionBlock ("", "SSDT", 2, "LENOVO", "UsbCTabl", 0x00000001)
{
     External (_SB_.PCI0.LPC0.EC0_, DeviceObj)

     Scope (\_SB)
     {
         OperationRegion (SUSC, SystemMemory, 0xFEEC2100, 0x30)
         Field (SUSC, ByteAcc, Lock, Preserve)
         {


This embedded controller (?) seems to live at 0xfeec2xxx.

Regards,
Jason

