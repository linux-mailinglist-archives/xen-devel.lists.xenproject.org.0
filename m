Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA358C9F08
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 16:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726185.1130438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94NU-0007AQ-NQ; Mon, 20 May 2024 14:52:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726185.1130438; Mon, 20 May 2024 14:52:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s94NU-00077Q-JE; Mon, 20 May 2024 14:52:40 +0000
Received: by outflank-mailman (input) for mailman id 726185;
 Mon, 20 May 2024 14:52:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s94NT-00077K-AB
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 14:52:39 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98e3604c-16b8-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 16:52:37 +0200 (CEST)
Received: from SA9PR10CA0010.namprd10.prod.outlook.com (2603:10b6:806:a7::15)
 by CY8PR12MB7265.namprd12.prod.outlook.com (2603:10b6:930:57::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 14:52:31 +0000
Received: from SA2PEPF00003F66.namprd04.prod.outlook.com
 (2603:10b6:806:a7:cafe::a2) by SA9PR10CA0010.outlook.office365.com
 (2603:10b6:806:a7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Mon, 20 May 2024 14:52:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003F66.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 14:52:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 09:52:28 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 09:52:26 -0500
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
X-Inumbo-ID: 98e3604c-16b8-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjwTV1r2oOKd9W230ry/OCXCdEHzeoV3ktYpD5DPQXWBMj+FiEx0/LFPryhWHkjebjovBqYKI+BhRIXiGgtUxtqC34HXspI9/jJv1Nf6RCrLb4s4yHVlU6ibygf/+zxI8RSVVrElrZ0dHUCYmXzB0Sp/mdnY2uNmA9vt6Rz6vMNGcUPxFYRmpPLJwILGThGBDdcu/9CGH0nRIVMSLCp43RZOxB2gnwxxG7kuKM/xszGYw0lp7wmX9NcsI/EqH0BfuwJkZ2VkqeQPdoR44Ve5t0dEn21ZQ0lsUjTdWBOhdz/6hgMgEuOGXVf5dIr4DXDzP3iYQaTLyHqJtnglCwVjwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUZTRuRZpTJvKvnJre3jqWAN7n3G4U+8+LDtO2FmSXo=;
 b=JwbcwpY0yNV41wWCK8W10352XKsymvanbe42ZMXjC5iJKO3S+AJBkjTbACBHxZusGBa3HHrlWzwvtfnNHKgPaNTO5le/OysR7fc09inSr+Mxm6TVgIFyG2UWr7dc/Qhj/Uv8iUVP4p+CR/Hp152H34hPHIIILnIz5o/D4eguS7j32SBoFSULCOi9G0o2VbR69lr40ypwK6+hsDNhYzL5wA/MQZhYEX1aEh442wLr80ZtZVN7kAaRLOkIAIiomQzrnahPZzdrTCdMOV+YT03sbTyZuPffy2dkzlBqLo1nB3uRotfEbiQtVPdn/L8BCkDcX8A7nJP3HMnV2iCzD8vPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUZTRuRZpTJvKvnJre3jqWAN7n3G4U+8+LDtO2FmSXo=;
 b=bSiKOKgOoYaHwLN0CPcfUYQC3Jn+tafi7Q6wRothYCSdYkaYx8a2t38WmyMycJun45k2nTtj559a6iavZFaGkV9IVerhP1U09KePWLiZJ6TaeprSyk4RWNMGhyG0BEprKqBmEM5xF2MPPwe0o8MVyaA/cfz2sB+aSDUvDNoR5Fs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <86c91b57-68b4-4271-87ec-b80525ed3373@amd.com>
Date: Mon, 20 May 2024 22:52:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/arm/static-shmem: Static-shmem should be
 direct-mapped for direct-mapped domains
To: Michal Orzel <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240517032156.1490515-1-xin.wang2@amd.com>
 <20240517032156.1490515-2-xin.wang2@amd.com>
 <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <ee20798f-a459-492a-a7a1-308472878fe1@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F66:EE_|CY8PR12MB7265:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f25c36-c727-45b3-0d66-08dc78dc798d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eFE0bDlmUUo0ajlzSFd5SWd4VUxTeE0vWkFMd0pLWW8veVlCazQzYkVmUTVG?=
 =?utf-8?B?K2x2dWNROTlZZE8zak9DM1daSUtSYkpZOHlGUEorWkJOZzhhT3hBWDRrQ3lz?=
 =?utf-8?B?ZGhxcExEQlNmRklIakdQc3d2V090T1dsNWd6YklaR1ZPMXlrSUloSkF1MFg5?=
 =?utf-8?B?aVZTWTNZN3A2a1lpV1JsTWt2bDFPWHpFM0svZWZBbVlvN250c3d1ekdLUEpZ?=
 =?utf-8?B?Ynh0U2NxWEZtRWhPYkc2RjRQTnFseVlhQmtIMUdWNEYrVUZaYkFqbEk1U1BQ?=
 =?utf-8?B?UjZrRlg4SnJjQnVYR2hIL3JZS0t1NktXcDhRV3JsaUtTL3VURWdXYUgwbG5W?=
 =?utf-8?B?TlpnU1ZzajVXN3hqMUtLNXRmRFVOdHNrMGgvU01UN0Q4R05SUmc3Q3g4ZTcv?=
 =?utf-8?B?cXhLMzQraEllZm1ocWxOQWtrTTB3RjgvQWowVEpQakFzMGYrWkVXbkJlNE45?=
 =?utf-8?B?K3orc2o2LzVKQUhFUko5Rzc5amh5ckhQbUNzOWszRzJYRjVCdXdrK1JrQXpa?=
 =?utf-8?B?T25UZjFyWWVWRnhDOU9BZmJ6OUtaS0FEOCtLT0NUbXh6TFprSkFsSTRWWTVS?=
 =?utf-8?B?a0FQcTVCK29TRmt1eUdyL1A2RWVBa1FMYW5oR0N2aUxXMVgyb3NFYkY5dkd2?=
 =?utf-8?B?SnVVcGNDR0lVRjZ5Yk9SMUJhQ2FMSUxaUWgrYVU1UDcwZGhRb1JodWxhSTlS?=
 =?utf-8?B?OUpiUmlpTmhmTDR2dzBsY050Yyt4OGdqUm9WSEVHbzIydWttS3RUYXNQM1dB?=
 =?utf-8?B?OHAxNUdvQ2tyUU1BbjlXY0ZCNzBUNXpHc3ROMUZSbUN5Y1h6OEJudWc2VGJo?=
 =?utf-8?B?OHo4Tmg4b3U3L3E2bGlZVnAzdEpzMXRSTHpnZ0NGcnhjb1EwbW1hR3BKbGc3?=
 =?utf-8?B?OTczWjFWSjZiM3BNYVcyRElzYzhYbUY5YVBtZXNoeEJTOWw1Mk9lSkxvNllt?=
 =?utf-8?B?dDZqZ0hIbnFJY3VKdlJKclNSVG9ZZStLRS9jZ0tMSVd5VUt2a0lGZncxcnU4?=
 =?utf-8?B?OHVuZUxqOFRxb01wNFlSV0R6eE0xUVhETVZ2S2tCbG1meGxDQTYvTWRJZm1F?=
 =?utf-8?B?QXd0NnNXdFVJc0NMTjJOWEc4K2VqMlhxMmMzNnJTOW1FNUd0RUdrUXpiMWNF?=
 =?utf-8?B?TXBveXgwQW90cFFVSW1xeFMwUktoSzJuNCtOR3Job3h0NTdhNWF3VkkrRGRF?=
 =?utf-8?B?MldZSVB4NEhNb1JiaHpPYU1IcmJKTkkzOEZYZ1A2Yzd6dmZ0TjE0QXRqQzVD?=
 =?utf-8?B?V3JndHVZeWRDV0kwbTlub0hzakQraTdCR3BBcklDbjVlZHFVbjFRT3d2QW16?=
 =?utf-8?B?Y25PTHlLMHRCK0MwQVN1SnZlQnNzTTA1QTkrcGJxQ01MZVZ3QmpHUmZEbXRH?=
 =?utf-8?B?amZaeEd3bmQvbzgzcktDZmdoTGgybnV4WkRCY2xvdlZKc2d0cmFHOVE5OEtJ?=
 =?utf-8?B?bzR1M3pLamtkdHRiNTBZSm1pcjNlT2I2UDJBN0I0U3NXVVZ3ZXRCRml5Nlpp?=
 =?utf-8?B?WG5ZRkRiSmExTEE5SUFTTHRnZmRvRWk1L25QZVdqMldPUlMrMU9jY29zclJn?=
 =?utf-8?B?ejU5cmRmSTl5RUY3VEppankrSlRuci94Zkw1bWk2U3VCdUwyKzJWRitMSzE4?=
 =?utf-8?B?UE5wREg1clIwUHhSTlRKbmVtZzBmUWtSVUNOalhzQU1jRGZGTnpkd2pHRHBI?=
 =?utf-8?B?L3kzaWpnWjBZL0xMdjBoVy9YUnc0L3owKzhFSjZhVmN1bXV4bXJwbGxzUEVq?=
 =?utf-8?B?N2pJVVZ1SFdEaHlTVVVEaFRBdVBTOEJsV2treVVXSTJkUERkcHBVdkt3T01s?=
 =?utf-8?B?aXlrNDJreUFBaVk0ZldyYW9uODJQeFEwQ0VsUkpWeG9GMUhPYXk0ck1aNVVL?=
 =?utf-8?Q?C3himXi2Kj2bi?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 14:52:30.6411
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f25c36-c727-45b3-0d66-08dc78dc798d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003F66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7265

Hi Michal, Luca,

On 5/20/2024 7:24 PM, Michal Orzel wrote:
> Hi Henry,
>
> +CC: Luca
>
> On 17/05/2024 05:21, Henry Wang wrote:
>> To make things easier, add restriction that static shared memory
>> should also be direct-mapped for direct-mapped domains. Check the
>> host physical address to be matched with guest physical address when
>> parsing the device tree. Document this restriction in the doc.
> I'm ok with this restriction.
>
> @Luca, do you have any use case preventing us from making this restriction?
>
> This patch clashes with Luca series so depending on which goes first,

I agree that there will be some conflicts between the two series. To 
avoid back and forth, if Luca's series goes in first, would it be ok for 
you if I place the same check from this patch in 
handle_shared_mem_bank() like below?

diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 9c3a83042d..2d23fa4917 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -219,6 +219,13 @@ static int __init handle_shared_mem_bank(struct 
domain *d, paddr_t gbase,
      pbase = shm_bank->start;
      psize = shm_bank->size;

+    if ( is_domain_direct_mapped(d) && (pbase != gbase) )
+    {
+        printk("%pd: physical address 0x%"PRIpaddr" and guest address 
0x%"PRIpaddr" are not direct-mapped.\n",
+               d, pbase, gbase);
+        return -EINVAL;
+    }
+
      printk("%pd: SHMEM map from %s: mphys 0x%"PRIpaddr" -> gphys 
0x%"PRIpaddr", size 0x%"PRIpaddr"\n",
             d, bank_from_heap ? "Xen heap" : "Host", pbase, gbase, psize);

> Acked-by: Michal Orzel <michal.orzel@amd.com>

Thanks. I will take the tag if you are ok with above diff (for the case 
if this series goes in later than Luca's).

>>           }
>> +        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>> +        {
>> +            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not 1:1 direct-mapped.\n",
> NIT: 1:1 and direct-mapped means the same so no need to place them next to each other

Ok. I will drop the "1:1" in the next version. Thanks.

Kind regards,
Henry

> ~Michal


