Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275239D43ED
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2024 23:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.841220.1256729 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDtFK-0002P9-OV; Wed, 20 Nov 2024 22:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 841220.1256729; Wed, 20 Nov 2024 22:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDtFK-0002ND-Lc; Wed, 20 Nov 2024 22:32:26 +0000
Received: by outflank-mailman (input) for mailman id 841220;
 Wed, 20 Nov 2024 22:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HGtN=SP=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tDtFJ-0002N7-9R
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2024 22:32:25 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20626.outbound.protection.outlook.com
 [2a01:111:f403:2418::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d57d848-a78f-11ef-99a3-01e77a169b0f;
 Wed, 20 Nov 2024 23:32:20 +0100 (CET)
Received: from CH2PR07CA0005.namprd07.prod.outlook.com (2603:10b6:610:20::18)
 by SA1PR12MB8742.namprd12.prod.outlook.com (2603:10b6:806:373::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Wed, 20 Nov
 2024 22:32:12 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::bc) by CH2PR07CA0005.outlook.office365.com
 (2603:10b6:610:20::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Wed, 20 Nov 2024 22:32:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Wed, 20 Nov 2024 22:32:12 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Nov
 2024 16:32:11 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 20 Nov
 2024 16:32:11 -0600
Received: from [172.29.146.152] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 20 Nov 2024 16:32:10 -0600
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
X-Inumbo-ID: 4d57d848-a78f-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxODo6NjI2IiwiaGVsbyI6Ik5BTTEyLUJOOC1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjRkNTdkODQ4LWE3OGYtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyMTQxOTQwLjE5NDg5Nywic2VuZGVyIjoiamFzb24uYW5kcnl1a0BhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TUSF7zT8VXdkWI5WN6i3dTRyW4jLbOViCPJ+lcHsup7npdEI6unR51Y/6W5Gr4/XUDuUaUZMuvnoxtLfTQFzbhzD6ZVxoXmJZhLtXeI6yoAUgxnj6G9pD8P8utMwcYboyV+kXK49h56VwCINDVRPUgGutXVBdjVl0oIJKUkCfNNrDFhMH+OvItuoQmtxRi5nusbRzUFNO5s7dCNc02yYbwQrxkHPfNHpB4q6+SL8djkZr21BqO6JNxvr1wHUHxQsnYVkzHWUkaaEvwtWM5oD6W4Iz0FDjtDE5JWsXXao3r9f8BfAXBot0IPVlWeBtcZGEieOPddF6r9K9QlHpl4XYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8xm1btvpe9AmkygMgkrN7BtLT7Iickdu4+9Xrkjp0I=;
 b=bgYS91ljo+NcG/URBnu7Hpm0Qrd1Nb4dTd5wx7sXxihKLedaAqrL+Sl/l8+I1LM7IEMKLw8sb/H2IqqmQqgvG3Fll+5bXpbHhgJ4nj7p7JBw7jGhy0c8P5niNBkiY2yvB3RlrrX1r0rHOCkj4WD13yXnz3IiskkhFFw/XB7YgBzVltKsJTHyxIYNTWniszqnnCDA4hIcDlicuzWOXal4rAJNWBNxjZCXVlJGAa50p9fVhUpZoZTM9hPsmPOshp6Kc3dJai+E4AICZi/icRIjnTPWJ4Me2pULlRthy4iu77Oh0ZmHRxk4Vpf8e/BabWxOL4sKYtSA0Rj9N5vQtUpa9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8xm1btvpe9AmkygMgkrN7BtLT7Iickdu4+9Xrkjp0I=;
 b=gdACDHCOx9rq9Zz+7X2m6Y9qcJXUmMryINzdpLyeKMkSFZ3Nz+wqV0lA09GfY9UzhED/bjp6wriDv2i7FGttQmo8rbgLy2DlmCVQCicAMYtrAIPaKxdRiw7EC4Nxsc1c1JKW82rK0f3DE/1q0FqVLhpIX3maN4qIp0uZSk8QaZI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <3736a7c0-694a-4741-b4d3-a821d3785646@amd.com>
Date: Wed, 20 Nov 2024 17:32:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] x86/boot: add cmdline to struct boot_domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: <christopher.w.clark@gmail.com>, <stefano.stabellini@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-7-dpsmith@apertussolutions.com>
 <c4b37832-efaa-4a26-8bbf-a3cf7caa3468@amd.com>
 <a7b7ec58-73f6-4463-97c8-f9acdedec7af@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <a7b7ec58-73f6-4463-97c8-f9acdedec7af@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SA1PR12MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b5fbfa1-a6a7-4843-7b96-08dd09b32d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Szc3a09lT0ZqU2w5NGhBQndQOTliNlprVWtpZWdPYUZkVGlxZzEwNEVlUHR3?=
 =?utf-8?B?MWNSQXZBUXFEZVlhOVB5aHhsdDlrMFdIMnBMckszaFErNFRZNmQ5NE9tTm4z?=
 =?utf-8?B?UGJIc01oYlVDSFQ2ckh5cG0zT0lnczBGLzVQNVJ0RnNHVk5maDk2NHZocjRz?=
 =?utf-8?B?UXdZblhmMFpGZ2dZRmlXbEJ1TmtMZjdrQmNqNmpZUTZuaVl1eHlWMHlFWXpk?=
 =?utf-8?B?T0RTYjhWdmUva0R2Zjlpd3BHb2ltVVdIRFZJcG5KUjI4SzdaVG1pWlN0SFQy?=
 =?utf-8?B?WnZrbHpxd1Zyb1NKQk1odkZIME8wNlNoYm84dUJSNFhvSnRYMG9IUGxwOVc0?=
 =?utf-8?B?WUNNdFFLN1JIcUpkWUFBeEhhdThYL3VpR2QwSUlsVGRSRWUwRjd0cXBvNG5k?=
 =?utf-8?B?WDFCWlJpTjMxSXhoUmV3QVlpdXBIOEdrQ09XeG4vVVZtRUhsREl2Q3pVNmxi?=
 =?utf-8?B?SW1HNlU3QkozUXovN2ROeXhJN1ZLTXYvNlRlL1JZSzl0eGhHalAxTkVXR0l4?=
 =?utf-8?B?T0VPaGplWlRtZ1RxRURSUWdTaGVkV2pnMVB1ZHBmTUNqM3JlWjdsd29lNHZv?=
 =?utf-8?B?MGRZZm5kVVJzREdTR2pQRjNYTm1IK0lzckoyVGZxUDlJaGNTaGZEcjZGRnpl?=
 =?utf-8?B?K1h4Z0pzNE9KdHFjQ1VlWCtsOWRmWkRqWUZMOFczV1kzSFhJamtsN2ZoNC96?=
 =?utf-8?B?OE9CbjkvYmloNDMzZ2dXSzREZGtDVkQ1aUVucHdlWm1DckRzMXh0emJnSU12?=
 =?utf-8?B?WEMwU0lvMzlqYStmL3doVlVVczZ6S0hrWnY5UXArQzR0d0FQN3NoQmRrQXZ3?=
 =?utf-8?B?ZkhqdjlnVHFsYWE4b0ZvclpnNTBId1p4OFhxOUozMEpQL0gxUWlvK1Vpc2J2?=
 =?utf-8?B?NDc3bHVlcFhQRWI3NVNyUkhGTE1IUEMvS3pmT0dJUFFuVkpwODBxYzdtSTJP?=
 =?utf-8?B?cU1MM2l3bWlrZERDckYxNUcyOGtraUdzcUlSbmwrV3NlcHVrUkl4Q3lHa054?=
 =?utf-8?B?MGFITjZMdkxXOWpTaGVXcjhib0tiQ2VtZXhIMjJVS1F5M3NySnF3SGRMVlpC?=
 =?utf-8?B?YmVyRTZhRTFjcktUK0dIVkFKODhta1NreHI5TFJIRnFTN0RWZU5sWVNHRjEx?=
 =?utf-8?B?cUJ3Nm1aem1oSWcvNXRRcjRwSWpKQ0k4bkduOUtzR01yZnVFcjlhUTZDKzl4?=
 =?utf-8?B?L3QrelBrOHhDbW13TkZ5SEdRL3gzSUFlWDJYU1JjT0dVMWNkUkNMcDZpV1NF?=
 =?utf-8?B?RTRwZGNZbThpZjEyV29RdGl1aXlRb21wcm8vMWU5UHZ0Z25KNzlBNVhWVGVy?=
 =?utf-8?B?RFJnbHN1TjV4ZTZFVWYwWHVGNHhJZEtNZG1qV1VVdSthL1pyeHg2NWlaQUFl?=
 =?utf-8?B?QWZxUGJtbkpaVytrRFNHYllvYVpTdFl5WkJmTFRNMzJiK0NlTmd3dy9Ld2J3?=
 =?utf-8?B?ZWtRZ3dZZDNFS3NrNHhoUXpoZ2o0dWpQb1JxUWFrUDVxNU1ueGsySkJkbHVh?=
 =?utf-8?B?QzlBYytCY2drQm9WQ2hzM3NzcTR6bWdnOGF4VVhVbjJLZTFIbmhiNk5BTEZp?=
 =?utf-8?B?b1RtL2xUUVFCcTBWSFhZQmVYUldScWtUOWo1aVdPdG9QYkpKaXQrVU9XV1Zv?=
 =?utf-8?B?Q0pPWXI1eUp4L2MwMDBocmxMU1llMFFMNlhlcFVsRG9VUFdQNEJscWtMN3Jy?=
 =?utf-8?B?REQvaUZlNTlmNSt1NExqaEpZc2lEQk43L25RUDBXMUw4Y0REUlcyY1VpNGQr?=
 =?utf-8?B?a3oxWVl1c0UvYk9NYTBtcG9weXMvNkZBeENDOXpDYWpUQ2NyeCtEQUxUMnJM?=
 =?utf-8?B?ZEcvMTV2bnZXMXVsY0RIUGhoWWoxYTllNzVDMTJNZXd5Wm9MckIxVnA0SGJo?=
 =?utf-8?B?aVlJWGRiRzdpZXdSeVBickJUc0o2UitJdkpNMllMNjRXSGc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 22:32:12.3568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b5fbfa1-a6a7-4843-7b96-08dd09b32d88
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8742

On 2024-11-20 12:57, Daniel P. Smith wrote:
> On 11/15/24 13:20, Jason Andryuk wrote:
>> On 2024-11-15 08:12, Daniel P. Smith wrote:>>
>> Just xmalloc_array since it'll be overwritten immediately?
> 
> Yes and no, the concern I was worried about is that the allocation may 
> end up being slight bigger than what is copied in to the buffer. If we 
> do not zero the buffer, then those trailing bytes will have random data 
> in them. In a perfect world, nothing should ever reach those bytes based 
> on the current usage of the buffer. But from my perspective, it would be 
> safer to zero the buffer than rely on the world being perfect. I am not 
> fixed on not switching, just providing my 2 cents,

I only looked at the PVH case, but strlen() is used there to obtain the 
copy length.  I think it's unnecessary and the code doesn't require a 
zeroed buffer.  But I also realize it's safer to start from zeroed.

>>> +            panic("Error allocating cmdline buffer for %pd\n", d);
>>> +
>>>           if ( bd->kernel->cmdline_pa )
>>> -            safe_strcpy(cmdline,
>>> -                        cmdline_cook(__va(bd->kernel->cmdline_pa), 
>>> bi->loader));
>>> +            strlcpy(cmdline,
>>> +                    cmdline_cook(__va(bd->kernel->cmdline_pa),bi- 
>>> >loader),

Also I just noticed a missing space: "cmdline_pa),bi"

>>> +                    cmdline_size);
>>>           if ( bi->kextra )
>>>               /* kextra always includes exactly one leading space. */
>>> -            safe_strcat(cmdline, bi->kextra);
>>> +            strlcat(cmdline, bi->kextra, cmdline_size);
>>>           /* Append any extra parameters. */
>>>           if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
>>> -            safe_strcat(cmdline, " noapic");
>>> +            strlcat(cmdline, " noapic", cmdline_size);
>>>           if ( (strlen(acpi_param) == 0) && acpi_disabled )
>>>           {
>>> @@ -1028,17 +1055,21 @@ static struct domain *__init 
>>> create_dom0(struct boot_info *bi)
>>>           if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
>>>           {
>>> -            safe_strcat(cmdline, " acpi=");
>>> -            safe_strcat(cmdline, acpi_param);
>>> +            strlcat(cmdline, " acpi=", cmdline_size);
>>> +            strlcat(cmdline, acpi_param, cmdline_size);
>>>           }
>>> -        bd->kernel->cmdline_pa = __pa(cmdline);
>>> +        bd->cmdline = cmdline;
>>> +        bd->kernel->cmdline_pa = __pa(bd->cmdline);
>>
>> Should cmdline_pa go away if we now have a valid cmdline variable?
> 
> In the PVH dom0 case, we are still relying on cmdline_pa as the 
> reference to get at the command line in the function pvh_load_kernel(). 
> With the introduction of cmdline to boot_domain, I could convert the 
> interface of pvh_load_kernel() to take the boot_domain instance, 
> removing the need to update cmdline_pa. Not sure if you were asking 
> this, but as for cmdline_pa going completely away, that is not possible. 
> First the sequence of events do not allow it, and there is an one-off 
> case for PVH dom0 where the cmdline_pa of the initrd module is copied 
> into the domain.

I was thinking from this point forward only boot_domain->cmdline is 
necessary.  Maybe even zero-ing cmdline_pa?  With a valid pointer in 
cmdline, cmdline_pa shouldn't be necessary anymore.

Regards,
Jason

