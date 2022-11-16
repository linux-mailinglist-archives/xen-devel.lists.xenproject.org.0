Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D4062B481
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 09:06:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444197.699127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDQY-0006PY-5A; Wed, 16 Nov 2022 08:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444197.699127; Wed, 16 Nov 2022 08:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovDQY-0006MZ-1v; Wed, 16 Nov 2022 08:05:46 +0000
Received: by outflank-mailman (input) for mailman id 444197;
 Wed, 16 Nov 2022 08:05:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ql+j=3Q=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovDQW-0006MT-4A
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 08:05:44 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 761af832-6585-11ed-91b6-6bf2151ebd3b;
 Wed, 16 Nov 2022 09:05:41 +0100 (CET)
Received: from DS7PR03CA0204.namprd03.prod.outlook.com (2603:10b6:5:3b6::29)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Wed, 16 Nov
 2022 08:05:38 +0000
Received: from DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::91) by DS7PR03CA0204.outlook.office365.com
 (2603:10b6:5:3b6::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18 via Frontend
 Transport; Wed, 16 Nov 2022 08:05:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT014.mail.protection.outlook.com (10.13.173.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Wed, 16 Nov 2022 08:05:37 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 02:05:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 16 Nov
 2022 02:05:36 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 16 Nov 2022 02:05:35 -0600
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
X-Inumbo-ID: 761af832-6585-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJ+onLxfyreeqpzFJO31ZNqGpwj6QHEeUZjneG7qMmFQiEFpIVGfYqq3g3ICsTLnKztVo5AmwWBjx9vj2T+NEtNGqZRqAF56UmPCUnJjXJkXxQusyEmGJLji1MHRVQunWXgpzQ94LscwtR5I9Vs7Sr/J3Uolas6Fvn4B1zTRwse53r0QuvZGFkq39TlwcjMZS+ZVug28iVhqMromAkLHNRrgu9W+Lgor3ez/9kiPmJZgwPcxK4gZAGocT/GxS1DMI1FxPMc2H+Fqjck4NA4zalYOIaM2/aFWRvcnfCj2l3OHMAaBc0tEd+mMiChmmRneuGm//6nE4SQntgkCiWa6yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w+CQIaOUaKAQN/pAJ34lGE1EUSECEdRiBdCEXK6uM6A=;
 b=gnKOmT/SwqFC6B2xf/2vSF9iRGbHV7lW5Xj9FbJvLNnh3DZAwDOmfy1qvoT6CzHsiqutB5eKKKVTVB20N5+3+G96O6l6klDWGSEnaZX2QTpR2sVilpC97hzC6w4u1l9vvLXwDWL4XWKivnvRVnuPTS9VQxOcXWNFfjMmQpvpcyb9eTTflLh21o6J9mK80sAnEArQD2uF9ZgvODiBWJaJiBZsdHfUhK5+63LHdTZFSvt+5s50gDggOPDpW0u1N/CXQQGC50tTEXXPlNOX2s10XsL2JDUc1hM7MBgXlrjGNZ+mjHYetMLZ/cw6MCxlTAcmcmpJ9JKA7K4otH7iH3NZ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w+CQIaOUaKAQN/pAJ34lGE1EUSECEdRiBdCEXK6uM6A=;
 b=KghjNzk8xSqRJS1FKZbzQ+VgL8vqrxrXkSW49qGS9wnPeWMkxqpSr5OPtKKUS4qQEkl/7GxbUbUcZq3yhOunK0K5cgFCYOgmdDoV5MftWhAoH2tjbXKQQRdDOlUpKe4nDg1AXGP2cU3f4RnfErIjTUHv0AxEUwWowvRvES3dU7g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
Date: Wed, 16 Nov 2022 09:05:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
 <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT014:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ffa877d-8781-4910-2339-08dac7a958ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kfwBe0tU7TY19WdxweSNjVoGAVrKanzBJH5wL/R1v5w28Ax6YArq8cnyGfobRhOipjJbQyndsQn3F58qbbUUIiC+aknGYeD4xl6HgzQ5VNHHUucVbJ+M/o54hT+MjOY1BkVI5aC9uPt5B1GOCn79j2II50BTw16GW/BdleSxYtXztQZxsDkXhVs/G8E5X6vdUN4C5HiI5ODkHYxbi+i8S+ZWKJDvpbq6Ugt0HZa0UC3qdfPfWwrDlq3fw1HBwKginDeCtBL0k/mqx5IIhRFkgD0hL2qYvrMIchVDtXnC64HoNeluusAqFucsm3/i4Dpnpaes3PvXUeasITGeO8HrTh1tcz3k9WfN3v2uyELBYtvCiD2nvNXk2WonPv2ObxcGxScq5YfhMa1h8IpUFER+UGcakr751w7yUvl5j9kVZKNAer2ZtACAYh3L5/YGtTlU1QpQQIt5OQL6IhI74wvL1DKxxm6DrYdORD0r4vsZ/AJT2R2/gLr2OKynEMTf15gu2Mk/ca0ZfDKjhHfjxrD/zUaquhnbOEz0L0JNNmgj1xuvvQnJ7pNA6Qm/VXFiaYyIRVzLOWHu24hgfeQjOGvQ6Z/14oH73fumCQEniaUqWQnaX4WWsiAcP5Dp7Fb0UrorpS9yrp9vtR7LCeqUxDvxDZ4d2kAmVVrga+ld8jRRDB29TKMPs159DpC7l4luf1bUyQcBGsECAgIMw2op87RJzZED0WWNxRBlXQ3hCWcF4Q8GWhpcqFJZYqC/dQSd7eI6k9NUOmLm4jFSzvKKGL32f6S25jJ4/YH+aKVIC4iDvycJ0Jq3hkPoAnrj1U84bORWI3hFM1K6WGXsQ8iUr4lKmg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(36756003)(478600001)(70586007)(70206006)(4326008)(54906003)(316002)(16576012)(110136005)(36860700001)(8676002)(83380400001)(82740400003)(81166007)(40480700001)(26005)(86362001)(6666004)(53546011)(31696002)(47076005)(356005)(82310400005)(426003)(336012)(40460700003)(186003)(2616005)(8936002)(44832011)(5660300002)(2906002)(31686004)(41300700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2022 08:05:37.6707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ffa877d-8781-4910-2339-08dac7a958ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT014.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763

Hi Julien,

On 16/11/2022 00:10, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 24/10/2022 11:05, Michal Orzel wrote:
>> Make use of the macros defined in asm/pl011-uart.h instead of hardcoding
>> the values. Also, take the opportunity to fix the file extension in a
>> top-level comment.
>>
>> No functional change intended.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> 
> With one comment below:
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> 
>> ---
>>   xen/arch/arm/arm64/debug-pl011.inc | 20 +++++++++++---------
>>   1 file changed, 11 insertions(+), 9 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
>> index 1928a2e3ffbb..d82f2f1de197 100644
>> --- a/xen/arch/arm/arm64/debug-pl011.inc
>> +++ b/xen/arch/arm/arm64/debug-pl011.inc
>> @@ -1,5 +1,5 @@
>>   /*
>> - * xen/arch/arm/arm64/debug-pl011.S
>> + * xen/arch/arm/arm64/debug-pl011.inc
>>    *
>>    * PL011 specific debug code
>>    *
>> @@ -16,6 +16,8 @@
>>    * GNU General Public License for more details.
>>    */
>>
>> + #include <asm/pl011-uart.h>
>> +
>>   /*
>>    * PL011 UART initialization
>>    * xb: register which containts the UART base address
>> @@ -23,13 +25,13 @@
>>    */
>>   .macro early_uart_init xb, c
>>           mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
>> -        strh  w\c, [\xb, #0x28]      /* -> UARTFBRD (Baud divisor fraction) */
>> +        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
>>           mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
>> -        strh  w\c, [\xb, #0x24]      /* -> UARTIBRD (Baud divisor integer) */
>> +        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
>>           mov   x\c, #0x60             /* 8n1 */
> 
> Can we introduce macro/define for 0x60?
We could but I think this should not be part of this patch.
The reason being, the arm32 code also uses hardcoded 0x60 so it should be changed as well.
I can create a prerequisite patch introducing the macro and changing the arm32 code first unless you prefer to have everything in a single patch.

As for the macro itself, because 8n1 only requires setting bits for WLEN (1 stop bit and no parity are 0 by default), we can do
the following in pl011-uart.h:
#define WLEN_8 0x60
and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).


> 
>> -        str   w\c, [\xb, #0x2C]      /* -> UARTLCR_H (Line control) */
>> -        ldr   x\c, =0x00000301       /* RXE | TXE | UARTEN */
>> -        str   w\c, [\xb, #0x30]      /* -> UARTCR (Control Register) */
>> +        str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
>> +        ldr   x\c, =(RXE | TXE | UARTEN)
>> +        str   w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
>>   .endm
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

