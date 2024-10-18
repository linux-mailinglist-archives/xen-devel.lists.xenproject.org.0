Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D02669A327A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2024 04:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.821535.1235399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cWi-0007np-Dj; Fri, 18 Oct 2024 02:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 821535.1235399; Fri, 18 Oct 2024 02:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t1cWi-0007lh-Ar; Fri, 18 Oct 2024 02:15:40 +0000
Received: by outflank-mailman (input) for mailman id 821535;
 Fri, 18 Oct 2024 02:15:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BiWJ=RO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1t1cWh-0007lb-28
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2024 02:15:39 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20614.outbound.protection.outlook.com
 [2a01:111:f403:2407::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc3e0dc0-8cf6-11ef-99a3-01e77a169b0f;
 Fri, 18 Oct 2024 04:15:36 +0200 (CEST)
Received: from MN2PR15CA0058.namprd15.prod.outlook.com (2603:10b6:208:237::27)
 by CY8PR12MB7755.namprd12.prod.outlook.com (2603:10b6:930:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Fri, 18 Oct
 2024 02:15:32 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:237:cafe::d9) by MN2PR15CA0058.outlook.office365.com
 (2603:10b6:208:237::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20 via Frontend
 Transport; Fri, 18 Oct 2024 02:15:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8069.17 via Frontend Transport; Fri, 18 Oct 2024 02:15:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 21:15:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Oct
 2024 21:15:29 -0500
Received: from [192.168.122.223] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 17 Oct 2024 21:15:28 -0500
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
X-Inumbo-ID: dc3e0dc0-8cf6-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBeH5b8K0on5EiuDKME/YKoGUb0OONGXt9VQq/qqn65U9NEvcshkYfDGt2M01TGLYH8bTcx7F1EvEE4s9/4MoU5kgOZ8il3Sl0mKOfNyW2BcuZOyw5iE1Dpo+aDvAlgY9+3s7c3x2mmh1EuRWLLU6ndaGgUZ7aoWiEvPpgVz6Fm8j9TM0gmjnAlglgGPeEGXMX6hKz0vwNpRww2q2+nuWdpiR6LAVq8fE7FLOeGWkD1hgWyyJoYfUPfdhiyXwHJ6ZLmdbA8lY3b1Gku3+X7BZdcEYOCQQJq9l649drQSGWSulJhcTIZQpqzV5Z5X1Bx17/hhH+QmrxtOha6qwaREvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPZT5wcr0oCwNIfVfwipZlRogRfPVeQtTOls2m5X7HI=;
 b=RrD6aAqzDyqK0CN4nOLnF2BHdP4Wt3cpEDqlA6Kky3ZDldbcfSfAgqcwwJHyUj05iaZTKeF5XLsV4jk77PgK6W3Hc6lLWIYvvmxaoy2I269zt631tGy7AN1SYf2y98bnRwblYuyeqzpdPA+SN7ZgPCmzcpMJ1zGhOVMpNyR4y00bTA6UG4j1ftE0i9G2YTcDB+bgarpy86T2ueBkbtv+B5BJup8ObrIbGT6rishEmgm7EEcKH8Vuk4+JTga4JATuyodnlzDcwbDoaLrbMCTvzWUvhZ0e47wKqE22HMz2yHlMoFErlSz87yq69AwJiV432lIaSYAIqvBxIevRYyt0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPZT5wcr0oCwNIfVfwipZlRogRfPVeQtTOls2m5X7HI=;
 b=QsbqoaVpAJMtMaIyVpm9RcAttEBRO6BxGDBmcZW2piVOSC1eqV+qlAp3Mx3LXrunbrjbqyH+oOGpSrMoHMuG5FHmE64SNoKTmFBe8LrMN56Zhow9w0BT/16C+dSquRdLv1R2mUm4sKofldZdYWV58x/6jX7c+0c9+HAtPOalXhI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b82a3f4c-51fd-40c4-ba71-36ec0f4bf688@amd.com>
Date: Thu, 17 Oct 2024 22:15:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] x86/msi: harden stale pdev handling
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20241011152727.366770-1-stewart.hildebrand@amd.com>
 <20241011152727.366770-2-stewart.hildebrand@amd.com>
 <58d4bea5-ff50-4b12-aa81-8ae79b49196c@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <58d4bea5-ff50-4b12-aa81-8ae79b49196c@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|CY8PR12MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dfb6f22-053e-4dac-4043-08dcef1abd16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MEZ6aS9hZWYyYk15ZW54KzludXNvZW1lNUNNaUlJTEYySkJEVU5xTXNFcVdF?=
 =?utf-8?B?THErYlBwZ2xueWw4K056anRxSWZ1cUF5b1RGNkVuRnRvZnA2dldvcUhZUzAy?=
 =?utf-8?B?V0ErRy81RDl5SE5vRFczaHdvMmRNSmdJekNGZExNcElaeHRlUVVaUGVNa0NC?=
 =?utf-8?B?cUJRb2kwb3RKd1hTT1B0Vi9ERjZFVTdKTVkyY2ZaZjBTK2VzcERlRU9ZcE13?=
 =?utf-8?B?QWlsM1RHRkJQdFlzN0lIQ3JzTk8zcFJ1Tnc4QjRwZWEzQVRjcjZ5U0FXZFY4?=
 =?utf-8?B?Z1hES0ptSHBVQ1BkSGxyQnpBNWszMXJTMGl3QlJvMFRPWTBiSWE3akU2citK?=
 =?utf-8?B?VTNZTzBVRkFhSWlmbmpRaHpjZWxUb09Nb3pVOHp3SE14TjJZQzJ6TmNPZzdK?=
 =?utf-8?B?T2lIdm1zSSs2Ri9Ka2NDV3cweXRqSHBFZmZGREdNK0dnNEJmY1htenlDQ1ZM?=
 =?utf-8?B?Qy92MVZ0bmZHemgrMlVzdkE0aG5OS01lbEx0NGxvRENNc2RkSlBxcjVCOTNm?=
 =?utf-8?B?QkVnVnRlOHZ1VW5VL3FINkVka1FuWlVBTC9QVER1L3NmV0FERHBydk9VUHdx?=
 =?utf-8?B?TTR2VHJKdGN4cHlkczRac3AwZE1sa29yRXhEMitqVStyRnNzU1ViWGp0Vlo1?=
 =?utf-8?B?eENwM1pIMkpmUzY4Q29KR0VwZUZZS0tYemJZYUQxb1RzSjVad1lKcTU3Tmhy?=
 =?utf-8?B?Q2F2V1BhVjZJdjdNRGRhY25pNW54VUErdWt5M05xLzdnNmxGTHNUWitqS3VP?=
 =?utf-8?B?Yk1PQkk0MmhZNFY4aXRSZXRlSEd1MmpFZDJ5Z2FHei9jQ1hZV1JMNi9KbnNs?=
 =?utf-8?B?TVdsKy9WYXdzczk3dWZWUXJkcnB0Y2VkS1ZES0JvOUdUZzhndXZMNFBacEZV?=
 =?utf-8?B?ZjdybTFHWEF3VGdLUGp2Q2Ixa1Y0UnpVeVpQUkpCUmNUanFPK3hjRVpQOEFB?=
 =?utf-8?B?akVWN055UGZJaDRld0Evd051L0pqVWcrQWEyaFR5VlA5eWx5aVNrV2liUTUw?=
 =?utf-8?B?aitPMkNXZjNKSFE3M2Vab3dicmNLZWZxSkt6czI3dlllb2s5TkYzd3dhUUFw?=
 =?utf-8?B?Y0p5MUUrZUJQaEd2SGxmVzFNNG8xZkR5WW9ubGRQblZXK0J3UnZ4RFhDVFNU?=
 =?utf-8?B?U1c0ZFRLeVcrakNHbUV2YnBHbGNXSG5yVVRrQ3k3VVE2ZWJxdzRndDZadzRs?=
 =?utf-8?B?SnJsY0gwZGlmdWZUUjQ2N2ZBamdObzB2dXJ5b0VzUXB5MmJ3Z0t0Q0g1QWpw?=
 =?utf-8?B?bmQrM0VxWk5QMGtXUVVTSEcyWGtqZGJUUS9idTdzWHJKTWhJaXlRTE5kSWl6?=
 =?utf-8?B?WElvaE9rYVRZdDg1NFJyOXBWKzc3QlRQZVFrMkE2VDFQdkJGMlNBcU5ZMVox?=
 =?utf-8?B?UlpDVGVaams2WXFiRXNQSktESXZrdjROdVEvamVEVnFOTGRHdEZvSG9IUUs5?=
 =?utf-8?B?UWxVWWNCVnhRVE1CTW04WE5TSDJtZEl2c3h6eFo2Z1hBYXRGRFIrZzJoU1RF?=
 =?utf-8?B?ZUtOdjNGWGdoOXEraThReGNHR0hoaEFFRnQ1RUN6TVptc0VMZGZNTGcrTk43?=
 =?utf-8?B?WFNWcHdKc3ZnNE9xTW1kSzhacThEQisyNTNTSW5VdzlWTjBGWG4vK3pQY1o2?=
 =?utf-8?B?dWpXcS85b1F0c1MzTXdCank0NXV1Rm1Pa2UyTkdsOFBMY1o4K2YrNzg3KzRH?=
 =?utf-8?B?NHRVbG1jT1kvenU3bXMzVEd6V1lnbHJmR1BaUk82Q1hhamVzNU5yMDB3WUxL?=
 =?utf-8?B?NXQwTFNwQzRkd3A0VTJIRklhV0tmQ1NzaVVJNVdTbnRYak9nZUUzSUk1ekZq?=
 =?utf-8?B?TzZGU1llbS9iOHVnbDRwR3ZoNlkrd1BmZ1BZYkxKL09qRysxVEJLcEx4T2Jr?=
 =?utf-8?B?aWlmMUhpaUFBVnhvVEY3blR1ZW0wUExTZTFtNW5uMFd0b2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 02:15:29.9526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dfb6f22-053e-4dac-4043-08dcef1abd16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7755

On 10/15/24 02:58, Jan Beulich wrote:
> On 11.10.2024 17:27, Stewart Hildebrand wrote:
>> --- a/xen/arch/x86/msi.c
>> +++ b/xen/arch/x86/msi.c
>> @@ -1243,7 +1243,12 @@ int pci_reset_msix_state(struct pci_dev *pdev)
>>  {
>>      unsigned int pos = pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
>>  
>> -    ASSERT(pos);
>> +    if ( !pos )
>> +    {
>> +        pdev->broken = true;
>> +        return -EFAULT;
>> +    }
>> +
>>      /*
>>       * Xen expects the device state to be the after reset one, and hence
>>       * host_maskall = guest_maskall = false and all entries should have the
>> @@ -1271,7 +1276,12 @@ int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
>>          entry = find_msi_entry(pdev, -1, PCI_CAP_ID_MSIX);
>>          pos = entry ? entry->msi_attrib.pos
>>                      : pci_find_cap_offset(pdev->sbdf, PCI_CAP_ID_MSIX);
>> -        ASSERT(pos);
>> +
>> +        if ( !pos )
>> +        {
>> +            pdev->broken = true;
>> +            return -EFAULT;
>> +        }
>>  
>>          if ( reg >= pos && reg < msix_pba_offset_reg(pos) + 4 )
>>          {
> 
> There are more instances of pci_find_cap_offset(..., PCI_CAP_ID_MSIX)
> which may want/need dealing with, even if there are no ASSERT()s there.

Yes, and some instances of pci_find_cap_offset(..., PCI_CAP_ID_MSI) too.

> Setting ->broken is of course a perhaps desirable (side) effect. Nevertheless
> I wonder whether latching the capability position once during device init
> wouldn't be an alternative (better?) approach.

I'll give this a try for the next rev.

> Finally I don't think -EFAULT is appropriate here. Imo it should be -ENODEV.

OK

> 
> Jan


