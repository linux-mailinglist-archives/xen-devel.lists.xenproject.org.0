Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04736A48312
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:36:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898275.1306855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfvU-0006Rt-OA; Thu, 27 Feb 2025 15:35:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898275.1306855; Thu, 27 Feb 2025 15:35:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfvU-0006Pw-LY; Thu, 27 Feb 2025 15:35:52 +0000
Received: by outflank-mailman (input) for mailman id 898275;
 Thu, 27 Feb 2025 15:35:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ymMN=VS=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tnfvT-0006Nx-Bq
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 15:35:51 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2409::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8574ec3f-f520-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 16:35:50 +0100 (CET)
Received: from SJ0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:a03:2c2::20)
 by LV2PR12MB5992.namprd12.prod.outlook.com (2603:10b6:408:14e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.22; Thu, 27 Feb
 2025 15:35:46 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::9f) by SJ0PR13CA0045.outlook.office365.com
 (2603:10b6:a03:2c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.15 via Frontend Transport; Thu,
 27 Feb 2025 15:35:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:35:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:35:44 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:35:44 -0600
Received: from [172.31.223.240] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Feb 2025 09:35:43 -0600
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
X-Inumbo-ID: 8574ec3f-f520-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YC63A+kn1DsZg0Mx0o6ouQ8len2CKlPS7kq4C2/zh/K+mbJyncOB3QT+WsTmjdhDYkEwDxPGfhfYtYkd3pmPYIRSnY+sXacMRdURT0covacx0QM8PvwxUFP4cDFIHCEdMqNAqKmy3yDHwT9Puc5y+XgrHcypsAvXIPRE182VZeyWg509DWzfsbB1qqEA7DqLQFKWMbh5XL5Or7oSeJZ/cUmti6F5FZxqSZc5tu5iYlpEGTpLt0WN4v3ouueCYQJRrJe1pBGFuRYrbarYOkUUireYIckBIW0q9QgRRRgzLNuNC5lip3MScbhkUdCFRBgr4xyqXRj0mvz5ENqEXKlzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HeaMMe9H844iQqYlqFtyyRKjZzFMJOHmVF9Guq2Tdoc=;
 b=dM/C0RJaceFa2sbXRxIFIxCEFqhWJOuc1kE800l98oZklbSedfH1SPLS0OBGajXQlcjXyHrAUU0Sqef4CIzUDfzY9K4lvX68m+ODth81f4V4x3qlOVHV9feek74KHNxyhyyGVuCukNc063xnZJFuQR8PURDSKxM5qPo3ZOqlzhC0ImtF4p6AcJn2udiynFXckzzIdm9+fn39NEs94jTuN4jhjpTxTgQMcYPIRa/PwrQARNMzsYM7QPOZbNQG937czfs3NsopQoW55hb4Gk1CXrvk+Njd6qL+kEzBEcigcJSq0jLcb9bTpS7KI2q91sqHyBD5f62sGRwif0LcCa5YwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HeaMMe9H844iQqYlqFtyyRKjZzFMJOHmVF9Guq2Tdoc=;
 b=H0OrSDxuC88JY9pb9Razq0cn54vn03x2do03krp+KK1E5z1oYQwkjo4yluo/j32lfTa6nIC6FFTpt7E29hkRTHrclBeNAvnkP7HqV8o0AArMrnnh+RPPsyPS8xlvcyPYYIIlm6vj6abik9QPhaJmImQtzhPbCm1aY0E8RGp1GPk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9eceff47-dba6-4628-8196-5c162df49e9d@amd.com>
Date: Thu, 27 Feb 2025 10:24:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tools/libxl: Skip missing PCI GSIs
To: Jan Beulich <jbeulich@suse.com>
CC: Jiqian Chen <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20250226201022.42447-1-jason.andryuk@amd.com>
 <20250226201022.42447-3-jason.andryuk@amd.com>
 <6819b451-9868-4c66-a52d-da5c91d58c7c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6819b451-9868-4c66-a52d-da5c91d58c7c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|LV2PR12MB5992:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c0ab26b-df2e-4bfc-4503-08dd574466f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ck5VenQ5RW00bmlmRHRVdzM2YWIrd3laOWh0ZzI2RXZ3OTJoQnVTT0NrRVJ5?=
 =?utf-8?B?VmdSS2RZYUFJQkxibkdxZm9XU3pZblBPblNVSmVxakpjTUdKQUJJTmZpczFr?=
 =?utf-8?B?ZzIwalcvRG5yWWFrU3ZhSGVwSnF4SjFpS3lDS1VaQlNGS2o0RGJ6TzQyNmVv?=
 =?utf-8?B?ZEVJc05IaTR5dTFzalFhQ0hUN00xcmxjTE51b3dlYU9UQStSNFVmMjNCRkJZ?=
 =?utf-8?B?WTVDb3J3UzU4QWJTWkdCS05ScGdleDVqSG5hUkgycU14SHVOUk1lYldRZlkw?=
 =?utf-8?B?Z05FM1oxTGhDMzdrQXg1NnVxTktMZXhSQVZyRDZDTmJaOU05SEVDSEd4STlG?=
 =?utf-8?B?Wlg3MFdyWUxoaDJTdVkxZjNuSjdRUnNWcVl0dE8ra3BsYmpEQVVwZS9nbzAx?=
 =?utf-8?B?ZHJRbW9aTHBNeTFmYmlIUU51b2JrVjZFSTBRNUlxMFVhRkhqQ1ZiZ2o2UExJ?=
 =?utf-8?B?aTMweXJRYm5ObEx1MDVidmFlSnNLQUdYdHNJWm01WVNNV25sejB4RjdXWUVw?=
 =?utf-8?B?MGZPS3NvVVgxRlZ1d09GT1piQi9OQlF4b0l3Q2pIREJpK0NKdG8vMUk5ZUhs?=
 =?utf-8?B?Y3dZUjVLUjlvam9nQ0kxRWRLdk9vZDZWNUptaEZaYk04U082aGF5bjRKc2Jh?=
 =?utf-8?B?MFJTTnJlN1ZJdWpEVjA4NldxWXk5SEZGNU1yZ3NCNTJtemhlemFJZThobjQ5?=
 =?utf-8?B?NnhsV1BXTjJxMmR3d0Rtdk9FekdGR3ZEbFNEUjB0N1Foc2N3R3NVN0E0RHIv?=
 =?utf-8?B?b0hITVYzNi96M3g2TzJpL0RjL08rbXJPRDZvYWFJdkdhMlU5MHZUZnh3WWU0?=
 =?utf-8?B?elc3ZlFqL3dtaW9CdFlYNkY0am5qYzh3ZlJwM3dqUFNiOHlkMkRKekhhRjVp?=
 =?utf-8?B?ZkpEcVI3T2sxdDk5cEwrTm9nUXlneDdFczBGUGZLYzhydDBkSnJaY1JsYUVN?=
 =?utf-8?B?RS8wVDArWWh3V1h4Y1ByTDBIN1hPREdXeXBDZkdGL3FYdDZNd0N5R0tvM3A1?=
 =?utf-8?B?SVc1YXYxN0RiYXRhMDRlUldxemFHRXJHQWZERng3OVhHaWpZMXB3RW41ckI2?=
 =?utf-8?B?NFF0cWJ1RURTTUlYTE5Qclc0QUk5Mk5QV0UxeWl5RnJsb1BJcGMxbzZ0Rjdz?=
 =?utf-8?B?YkZlNGpMUXdtZ1ZMNXlmd2lJdW1vNDZOeUZ3QWFOM3V5bzRjY2VYdFMrUG5P?=
 =?utf-8?B?VHUyVm9YZzI4b3pRRkNFQWFxY3Jrdm1vTFlMb2Z6TXFpYkQzVUt3WDh2Mi9E?=
 =?utf-8?B?ZlQwbWxXMURFWkJSN3lvdUxXYkZ0V0NwdUdGRTVMYzRadFJKUGNHQUFzaTBx?=
 =?utf-8?B?dStBWFM0RnFvZE1PbVRBYlNPcVRNc1F2L0VpcDhkOTg4dDVzd3g0VVlKV1F0?=
 =?utf-8?B?TkovYjZqTDljWkdZZTF1cVhob2lETXZXVGpucnF1cDVuNk5VSjludmJydEty?=
 =?utf-8?B?MHFmZkEyN0dObFc3N2pDT2hWR3MyS1VWYkZZRjYxSytEMjh1OWRUdXh4c1h4?=
 =?utf-8?B?U2N6UWtYV1ZWQnlKYlZvdDhXZ0plQnplckdma0hVVjhoSzlNTkNmOFo4b3l5?=
 =?utf-8?B?RG0yYkhEVGx5RzlMamxwODRyMHlJUXR0MDhyYmcxT2ZPMjExWTBXMGhaRGRo?=
 =?utf-8?B?azVEWnlXVUJyYXlJVERjVWlaY3BKcEp0OEtURzVTN1EzUldMTWNRcUlmd1ZW?=
 =?utf-8?B?ZXFYQlViaEcrcTBlSEdiN1BYTnVyUmM2MWJybkhlVE5uZ1paNnhvdWtqZS9n?=
 =?utf-8?B?dFNXWGUvbjQyT1pTMllOMHRUbllPSGJIdjY1Ym0yaDlXeVlSRU1CaU0yV2Yw?=
 =?utf-8?B?R0VMZ0VyZVYwaU0yM2dSK0IyakY4NU9BWThoUkczUHpDY1Z0Z0svTmY5emUy?=
 =?utf-8?B?cG1McHo1bFYvZ0xiMnBieTFjbWtoZFRSaklDZXZVZ21CMk12c2YwY1Q2UGVN?=
 =?utf-8?B?UjFveHp1d0Rlb0xqUG01TGNlNEhDZnBqTlJqOENhbFMwRUFTY1I3cDQrNDg2?=
 =?utf-8?Q?ByJXFIhAex3QCs1L2GcVD7Cl6hAIxc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:35:45.1593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c0ab26b-df2e-4bfc-4503-08dd574466f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5992

On 2025-02-27 03:25, Jan Beulich wrote:
> On 26.02.2025 21:10, Jason Andryuk wrote:
>> --- a/tools/libs/light/libxl_x86.c
>> +++ b/tools/libs/light/libxl_x86.c

>> @@ -925,7 +928,10 @@ int libxl__arch_hvm_unmap_gsi(libxl__gc *gc, uint32_t sbdf, uint32_t domid)
>>       int pirq = -1, gsi, r;
>>   
>>       gsi = xc_pcidev_get_gsi(CTX->xch, sbdf);
>> -    if (gsi < 0) {
>> +    if (gsi == -1 && errno == ENOENT) {
>> +        LOGD(DEBUG, domid, "xc_pcidev_get_gsi no gsi");
>> +        return 0;
>> +    } else if (gsi < 0) {
>>           return ERROR_FAIL;
>>       }
>>   
> 
> Why the special-casing of the value -1?

No good reason.  I'll restore it to < 0.  I originally thought 
xc_pcidev_get_gsi() was returning -errno in gsi.  That was not the case.

Regards,
Jason

