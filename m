Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B3E7199C7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:31:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542370.846148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4faI-0005v5-Dz; Thu, 01 Jun 2023 10:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542370.846148; Thu, 01 Jun 2023 10:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4faI-0005tQ-A5; Thu, 01 Jun 2023 10:31:10 +0000
Received: by outflank-mailman (input) for mailman id 542370;
 Thu, 01 Jun 2023 10:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ef9=BV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4faH-0005tK-Ch
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:31:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20603.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 695f2990-0067-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 12:31:05 +0200 (CEST)
Received: from MW4PR04CA0192.namprd04.prod.outlook.com (2603:10b6:303:86::17)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 10:31:02 +0000
Received: from CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::a7) by MW4PR04CA0192.outlook.office365.com
 (2603:10b6:303:86::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Thu, 1 Jun 2023 10:31:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT067.mail.protection.outlook.com (10.13.174.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.23 via Frontend Transport; Thu, 1 Jun 2023 10:31:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 05:30:58 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 05:30:58 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 05:30:57 -0500
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
X-Inumbo-ID: 695f2990-0067-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Waw5kKXBmiCw953veVhWJVRBf35TBX6zeqtJagSrBdBEvFkmhHa1kGrgAC5uN8t5F3qWl6Zqc9w6sHEnuJiNtuTCE/EK5lSWpD4W46IPimLeXs8lyIZKK2AcFiSPOjZJN99m+z66UGIUpA4D5Q/AsiX8tmpz+MfXDpzInZTGXJJB2AnCn8zVMDZ9Vzgn4Hi0TWmbb72VwTHqMhzDj9leld8WthH3ArrdnMyBbp+rv2P9u/i94gcEH6C0zjUaN2duQnZ9ckCyngunWNuhqsGOPMdeDCHRD03uzRof5YiYBQMOHYmis+A1WjnQUaB2bgD37caYP4DYDvpoYTg3R0y2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IHD0xMyFuB1q0A+hkVK4fZ4Tjh+PEyfRSw1tb56v1Y=;
 b=nQ9WMF0EI9F3MQrf2dcpTrQsp/dgv4WX8wyKzrmiTzHCtZ7E9xssV3E5eX8AX4CljjHUKGW7OySCZ9eVtvz4EBNxz5Ihsoi/QQbTAyZ6yx+cz3UVDB/8eQzCj4kpun1HugKATGpB56oguhoqzip8EgZEs39B34SNGjjHj2Jyyq+42MPk3RG/IsRawB+tYNH4R4FiXMZqivozGoqDXFJnNa1eE73rgYk0BVikMoYIox36bv69qRXaqZmn9LKNaQ0iChaULmKLLbHwqdPBi7VvGBQDT+oBUMto40LzLKUhKLIuyvtEwp5wt5bocaOnbs0lxzud1hiepMjyfD8RpToJuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IHD0xMyFuB1q0A+hkVK4fZ4Tjh+PEyfRSw1tb56v1Y=;
 b=VUNddt+vytfWwDCBQV0rT5t2Kx7wVfC+a+WWFshTwzCLtpz8Z5W5cG1AlV/ykcNh+nkXsKQfoo75k+IiqeWC1yzL9343YJiotLdRqXtKji0fvfKi/F4X6hEVWkXZroBwdnoIG0o5FbjxrLSLcI2/NkyYLMDQ3evjmMbRefRLSdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <73a143ee-8301-e0c0-a3fc-83ec10441c4c@amd.com>
Date: Thu, 1 Jun 2023 12:30:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] xen/arm: debug-pl011: Use 32-bit accessors for broader
 compatibility
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230601085001.1782-1-michal.orzel@amd.com>
 <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7C760D1D-DAAE-48AC-8B2B-E6140452BE4A@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT067:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: ec1a35b9-b443-4659-db5f-08db628b4bf9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C6LvbDQITnwhSPqj9bl9tDbldHhKzITKOJtxIMFf3Nr2IInxfEsTkJbPTwUbJd++nT7hjKe+J5Xe38rJ75PEMGFW+48EMZMgl5xngeuo/HyNVR69MtjAGvC926PyDo6a0X8Oi+KzBlKPWOuhz6hjca5weiC4zsgCdMqKBaPE/ppbYDRt+/wviwEl6hqWksTAUb8wg22Q6Kd92RxRrOGwQtCwmIEvKapKSUbFuuc+UiIs/YzA0dHEyGObsrnVs3mjIF2N/E4HQ+KZ1kpDVRbZcND5kCtHSvcIhB0PSvy4PRRgiZYybTzRJiBA7NExRBe6jgdcivwcDsV+TfqlhLdFeQ03O+X3Pum7dBjdiPCHR/eavBK9z9edWkO7TpaqiRGGgnIDgN7LJbiokQsqM6Z0FK+Jpwk5Cn4neD37iKcCrBN91Mu6hXKg7+xyx3dB5m29vaod7iC23vWv1DTHNLcVHbi69iiewunW3CX5a2u1dDDWhb9UEx/NyW7WZQa/PDM+Y8EBZp4zkeL9JJEAQXOXKWFMgXMXHGWS6iSKf7LbBZM47oyxiQTg4ZzUi5YrPpQicXHTZfzL9xP7hik9yZVyPzHJ6IMzbJGN0rrdRytodvxJt0IIasl1VqqhaZmh1I02VcN6hFT0AfqSQSDhrPikKdR1O4NOa2a2ibcaLX8OMgf4Sc3EwJViTE2XN67AIjSxAth1g3DPOwlUrRS+sw6KA6pjrQ8wyjp4UpXnoBf1mnOPZNSizo/p1cDfLN4BnSoCiB8wRBjpteWDKV4Dz47q3AhDSCc5Pix2xldHRTdYao5IWTBAjP96ltrUE/aquB3a
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(82740400003)(81166007)(36756003)(356005)(86362001)(31696002)(82310400005)(31686004)(40460700003)(8676002)(41300700001)(5660300002)(26005)(44832011)(53546011)(40480700001)(2906002)(186003)(336012)(426003)(47076005)(2616005)(83380400001)(6666004)(70586007)(316002)(70206006)(54906003)(478600001)(16576012)(8936002)(36860700001)(4326008)(6916009)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:31:01.6136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec1a35b9-b443-4659-db5f-08db628b4bf9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316

Hi Bertrand,

On 01/06/2023 12:19, Bertrand Marquis wrote:
> 
> 
> Hi Michal,
> 
>> On 1 Jun 2023, at 10:50, Michal Orzel <michal.orzel@amd.com> wrote:
>>
>> There are implementations of the PL011 that can only handle 32-bit
>> accesses (i.e. no 16-bit or 8-bit), usually advertised by 'reg-io-width'
>> dt property set to 4. On such UARTs, the current early printk code for
>> arm64 does not work. To fix this issue, make all the accesses to be 32-bit
>> by using ldr, str without a size field. This makes it possible to use
>> early printk on such platforms, while all the other implementations should
>> generally cope with 32-bit accesses. In case they do not, they would
>> already fail as we explicitly use writel/readl in the runtime driver to
>> maintain broader compatibility and to be SBSAv2 compliant. Therefore, this
>> change makes the runtime/early handling consistent (also it matches the
>> arm32 debug-pl011 code).
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> xen/arch/arm/arm64/debug-pl011.inc | 8 ++++----
>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>> index 6d60e78c8ba3..80eb8fdc1ec7 100644
>> --- a/xen/arch/arm/arm64/debug-pl011.inc
>> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>> @@ -25,9 +25,9 @@
>>  */
>> .macro early_uart_init xb, c
>>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>> -        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>> +        str   w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>> -        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>> +        str   w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>         mov   x\c, #WLEN_8           /* 8n1 */
>>         str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>>         ldr   x\c, =(RXE | TXE | UARTEN)
>> @@ -41,7 +41,7 @@
>>  */
>> .macro early_uart_ready xb, c
>> 1:
>> -        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>> +        ldr   w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
>>         tst   w\c, #BUSY             /* Check BUSY bit */
>>         b.ne  1b                     /* Wait for the UART to be ready */
>> .endm
>> @@ -52,7 +52,7 @@
>>  * wt: register which contains the character to transmit
>>  */
>> .macro early_uart_transmit xb, wt
>> -        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
>> +        str   \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
> 
> Is it really ok to drop the 8bit access here ?
It is not only ok, it is necessary. Otherwise it won't work on the above mentioned UARTs (they can only perform 32-bit access).
And following to what I wrote in commit msg:
- we use str already in arm32 which results in 32-bit access
- we use reald/writel that end up as str/ldr in runtime driver
- we are down to SBSAv2 spec that runtime driver follows (meaning we can use early printk for SBSA too)
- this way we support broader list of PL011s consistently (i.e. both early and runtime driver works as oppose to only runtime)

Also, before every early_uart_transmit we use ldrb (to convert to char) which means that the rest of the \wt register (8:31) is zero extended.

~Michal

