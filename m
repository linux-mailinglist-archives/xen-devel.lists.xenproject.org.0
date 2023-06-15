Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6AD0730F94
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 08:43:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549397.857900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ggI-0002Kk-Pa; Thu, 15 Jun 2023 06:42:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549397.857900; Thu, 15 Jun 2023 06:42:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9ggI-0002HS-Kb; Thu, 15 Jun 2023 06:42:06 +0000
Received: by outflank-mailman (input) for mailman id 549397;
 Thu, 15 Jun 2023 06:42:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAiO=CD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q9ggG-0002H3-Px
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 06:42:04 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba93dfb8-0b47-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 08:42:00 +0200 (CEST)
Received: from PH8PR07CA0019.namprd07.prod.outlook.com (2603:10b6:510:2cd::18)
 by SJ0PR12MB8116.namprd12.prod.outlook.com (2603:10b6:a03:4ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 06:41:55 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:2cd:cafe::4b) by PH8PR07CA0019.outlook.office365.com
 (2603:10b6:510:2cd::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Thu, 15 Jun 2023 06:41:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.27 via Frontend Transport; Thu, 15 Jun 2023 06:41:55 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Thu, 15 Jun
 2023 01:41:50 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Thu, 15 Jun 2023 01:41:48 -0500
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
X-Inumbo-ID: ba93dfb8-0b47-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aqldfbLUHgg6JxzP5GnE2Aqr9+F5g4pUkbqmk5dHyaRoWwH5Arg14cxaQrt8bpzT5uAUQRzJfBFvNvs3aPqnvxYFl87LlHuZXlOyL1L/e0qZB5nnzERT1RIE2KFtFe4W8T96nX0CzWp9tb3zi5oiF4N6uI/5OU6gElaryu4GNPjz3WaPtBLkq5F0d7xlpYvM3towx4z7dFrq6Xv+J2xhbl0OvcQDeGX3RSBNCvlwXYXqcsPgw0SMcshqkditx3tmJyRK1c+8TAQYtj33L1FoHVx1BrVr8sDnKP0my4lZLV9N7MYeBFfGzuozP/e5XHQBjQZRdbVh67z88DVCtAGMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ePZVHWiomxesV+rzw3eymIut3qjDdkJ+FrS4yGi+6o=;
 b=bDfMt82dNnW0PxQjJgvvZUT2VCSgeBcIJNlX/jr0NhmoO8FyH0DjR/46qxlhH5NpcBeE2dmIH25q4FzYcLIWnLIp0/9/wGsOdQ7FJZpPHC5bzJw2yP9cJeRM3pdCh/eeDwnDxpTn60y+LvLiME+EePFGnV97gDYJQloVv62BvDAX5DxEZtctBCe7oYraSSAzWqFRUOIaToX2Z/vojYXD8vNYcit0G5HggFi0lVv3M19pbvfuxbeMp0Ii7WIXvFrj6izB/bQufuxAULIOUC55xhM7CnOpgVTsJc8XMVjyI+z4kpMwKf1/LyIYOCWneh/LmNm4LZg8gZOKrVmTL/0nrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ePZVHWiomxesV+rzw3eymIut3qjDdkJ+FrS4yGi+6o=;
 b=rz+5vIUZr1MVbfoSEHdhsla8bA7visuFgJvC1wjjLIZmWQMx5bUAwkA6sNlGMo3BbJNof3L3HGYyy+hbGBa4Oe4jpwvjrMvVkQNmtNfBvDA1K8wV9u7lYS46GAQKIMmdbR0ppyuXLALsAtxN/3Jhw7QCNu3XLMhvRYpz+gBgpuU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8d2a300f-1fe9-590f-7481-b0980d23c743@amd.com>
Date: Thu, 15 Jun 2023 08:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/4] xen/arm: debug-pl011: Use correct accessors
To: Stefano Stabellini <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
 <20230607092727.19654-2-michal.orzel@amd.com>
 <alpine.DEB.2.22.394.2306141836050.897208@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2306141836050.897208@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|SJ0PR12MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: b2b0507f-ba72-46cb-3587-08db6d6b9c17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XV1j6wNuaDJK9bDtrTv+FouWJnmVZvWN5rEqWy5eH3cwbn/pH4/WtWj/ymeAxDLrvyCGz+6w/qlmWeBsbFbIKvtqGnZV8MTqLfyUPKQk8E0Vxm6yTLUrfOlEJ5F/8K2Iaof3Y2ET+zY+wMGHq4ujspxP4E94uSy6G3pyQgIjIJaQcGBeX5S1YlnnzAQuC3xO+2ZyL3Z5oRKy2l38Fq9OVE2+rhcvWY9Ma4yj+8LlLytPi9l+aiSxMEfz7AnzkyEoQpp46ekQnyV7U4UD5MScJp4tZH3SWqQS82BEBwbPoaP5uG6WjFTNKK4LJa8Qz8u/cjOvXc44w4FlIGfapf+UuiHkVIQE/mA3Lpid3JATzq5lOt5TVbNy401qN/a+YIBC1rIAAtz/tstwRM8UMM4yfQH0UEC+TqyQsFPat//cecc2zI0uiJOG9YhExkzkKmWsgY5tnonDWhKdmGZvadUBZ++RnKXImhgk0jYhAh/N0O/gCgrgkhWWQXrasVHShVS6RnHFuNVc8bu6jhyKnPE1sL2fLg/WYtnrlPEIdfiy/yZ3tP9lemWHcPmQBgOSILpkEMoRGM33hwo9f4ulNX6i9u2GVhstvIGDxe4+cVstltIv7xnVaBG4R5xx8vn7O5QhH5ZT5ERRSrNJTBidIILE7EH3PY+az1GuGSHXhjXaqMzY313zNdTy3mQ7qotxdIHQ4kATYAmx1y3HplpxpPuQ7Wg0ostT0dlEXRJRFv0XigwEiwTtm+xL994h9skWRMSbsyw1Rjf/XOndZtejJc1zX8QnRSX7cvsUXce7y8gS5CjxchLinj0PUQ3FlMs6L8GJ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199021)(36840700001)(46966006)(40470700004)(82310400005)(40480700001)(40460700003)(478600001)(2616005)(26005)(53546011)(8676002)(41300700001)(8936002)(70586007)(316002)(16576012)(5660300002)(36756003)(4326008)(70206006)(44832011)(54906003)(82740400003)(81166007)(356005)(6916009)(31696002)(86362001)(2906002)(47076005)(186003)(36860700001)(83380400001)(426003)(336012)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 06:41:55.0127
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b0507f-ba72-46cb-3587-08db6d6b9c17
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8116

Hi Stefano,

On 15/06/2023 03:36, Stefano Stabellini wrote:
> 
> 
> On Wed, 7 Jun 2023, Michal Orzel wrote:
>> Although most PL011 UARTs can cope with 32-bit accesses, some of the old
>> legacy ones might not. PL011 registers are 8/16-bit wide and this shall
>> be perceived as the normal behavior.
>>
>> Modify early printk pl011 code for arm32/arm64 to use the correct
>> accessors depending on the register size (refer ARM DDI 0183G, Table 3.1).
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Next patch will override strX,ldrX with macros but I prefer to keep the
>> history clean (+ possibiltity for a backport if needed).
>> ---
>>  xen/arch/arm/arm32/debug-pl011.inc | 12 ++++++------
>>  xen/arch/arm/arm64/debug-pl011.inc |  6 +++---
>>  2 files changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
>> index c527f1d4424d..9fe0c2503831 100644
>> --- a/xen/arch/arm/arm32/debug-pl011.inc
>> +++ b/xen/arch/arm/arm32/debug-pl011.inc
>> @@ -26,13 +26,13 @@
>>   */
>>  .macro early_uart_init rb, rc, rd
>>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>> -        str   \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
>> +        strb  \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
>>          mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>> -        str   \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
>> +        strh  \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
>>          mov   \rc, #WLEN_8          /* 8n1 */
>> -        str   \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>> +        strb  \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>>          ldr   \rc, =(RXE | TXE | UARTEN)      /* RXE | TXE | UARTEN */
>> -        str   \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
>> +        strh  \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
>>  .endm
>>
>>  /*
>> @@ -42,7 +42,7 @@
>>   */
>>  .macro early_uart_ready rb, rc
>>  1:
>> -        ldr   \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
>> +        ldrh  \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
>>          tst   \rc, #BUSY             /* Check BUSY bit */
>>          bne   1b                    /* Wait for the UART to be ready */
>>  .endm
>> @@ -53,7 +53,7 @@
>>   * rt: register which contains the character to transmit
>>   */
>>  .macro early_uart_transmit rb, rt
>> -        str   \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
>> +        strb  \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
> 
> Isn't UARTDR potentially 12-bit? I am not sure if we should use strb or
> strh here...
UARTDR is 16-bit register where bits 15:12 are reserved and 11:8 are for indicating errors during READ.
Here, we perform WRITE meaning the actual register width is 8 bytes. This is also indicated by the PL011 TRM
which specifies width as "12/8" meaning 12 for READ and 8 for WRITE.

~Michal


