Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B106CBE39C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:14:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187077.1508497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9L6-0004Vb-HL; Mon, 15 Dec 2025 14:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187077.1508497; Mon, 15 Dec 2025 14:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9L6-0004TW-EH; Mon, 15 Dec 2025 14:14:16 +0000
Received: by outflank-mailman (input) for mailman id 1187077;
 Mon, 15 Dec 2025 14:14:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pjwr=6V=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vV9L5-0004TP-63
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:14:15 +0000
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazlp170120007.outbound.protection.outlook.com
 [2a01:111:f403:c101::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 554e8335-d9c0-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 15:14:13 +0100 (CET)
Received: from BN1PR14CA0022.namprd14.prod.outlook.com (2603:10b6:408:e3::27)
 by CH1PR12MB9598.namprd12.prod.outlook.com (2603:10b6:610:2ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 14:13:53 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::7e) by BN1PR14CA0022.outlook.office365.com
 (2603:10b6:408:e3::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 14:13:50 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 14:13:53 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 15 Dec
 2025 08:13:53 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 15 Dec
 2025 08:13:52 -0600
Received: from [172.24.22.120] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 06:13:52 -0800
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
X-Inumbo-ID: 554e8335-d9c0-11f0-b15b-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbdDwErGSIjzvPbvT8pWvS654xT8JYeoW/BcsozctwtcuiIG4McXiRs6heCHMFmLpznoXR+QmNtJYzAj3smmNe76Fg6WzFaRH+dJmwbGNqTBOqx0tDmk/kimdhz++EQBZ/ZlC7Qg2ZqVUvSy0gE5DwE2aedD+ivpsJ17jbJE26Uil38x4cmIADbV/3PcSXnK0mCnm7m6ulF4ZTQMI/q8vqoP/MTpwOvdghGptdZcZTuvWCfEVOgdSHFlhiOx3qHxRztCY3OCg/PRAb5xVPchcBl1pGD+yKM/UZzLvSUPaCmdVr++4bhzZdBQNMkOJRiGwAD5KaSfmSzezyR3TFSNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BN5GeH/d3wf/S3L0KfK6Vn3S2aK2/XrzNkj5xe4a8ho=;
 b=JwxWbn3uNerQIq+KqZ+dM8jBvDEC2iebTTkPrwvWhLxLUIVe1KK5sCI3K7+sy9ITCMfEl6kF0JAVQogjRH78zUYb/k9dq8xcd2Sz1i5IKd1/WWetSHJRrR4qFNqV/IxinA94sEKbcb10ns8U3W21KvQUvP3ONUez6NEyxjMLb4WtOUxSBrTf5dpZtzKPeJP3MA7GIVApzzbiP39umx6p7382ukcGQ0V7kKpOle8QVjBxzrMCs/zf1vyKlNybE7xtLXbzDd1Rzq3NZ+7pP0uto0QITb/+oeOKv2XXcr7Iy0uocg7YODC4VVP97DIC0Io4n/Q+pUP+luzQt5PWrH+Lfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BN5GeH/d3wf/S3L0KfK6Vn3S2aK2/XrzNkj5xe4a8ho=;
 b=ggx32q5ui5t18iP1u17Xf047E6dn0Me3FgnAqUShczKK3YERgve111bJFsbVt0WxLP1/ZHdPtmO+Ty1tAElw39QZg6Zga2HFoiL4HUSERWZmQDlb+gFv3QiAG2yEm9diSPu2R0XCSSLqdRNP+DV9ahvr2OhP22KnEseIaPUf5UA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <5b1d19ce-0d69-4df6-8507-f5cac1ccd5ab@amd.com>
Date: Mon, 15 Dec 2025 09:13:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/x86: Pass TPM ACPI table to PVH dom0
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20251212222949.626539-1-jason.andryuk@amd.com>
 <1646c1ef-ec42-4148-94e1-24b8874a1cfc@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <1646c1ef-ec42-4148-94e1-24b8874a1cfc@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|CH1PR12MB9598:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6ac46c-1ece-487d-f34e-08de3be42d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S2pYeFhDREtQazkwcTlGb3JON2VYbU93SGgzSTlSS3BwOHJxMC9rdkVpWVRq?=
 =?utf-8?B?MGRFT3BUU2trM1llbFJpTkowank0dHVDYS9IaGZ1WHA2cm5zeC9FRDV3N0o5?=
 =?utf-8?B?YlkvUnVuSzBlRmJLeXlSRUxSaTNHUndCZjFZSFpQVW9Sdm5XUVJ6NUdEL2E3?=
 =?utf-8?B?SmdLY2FCN3B2elZXZWkrbTZzK3YyTno1VGhFakZMNmdscGVNaU4yeEMveTBG?=
 =?utf-8?B?SWxUeDVYelJSUlBkSXEvUkFMcllOdkxVaGg3em8vN2VhTHYzNFRORDB4WVd6?=
 =?utf-8?B?aHE1SzJjNStlY0Rjb243dFkwY0VJTi9LS3d3cmkveUkvUmM1RCtySWFCNUlC?=
 =?utf-8?B?TUlSVUtHUWVud3F6aksyVVlzaGRHbEFCdEo0NTY2eWY0djk2U0syNTY5Qk9X?=
 =?utf-8?B?M0QrcEZMY3FsZkZiWE43TWE1ZkZKWUpQdk9WdzdKK1hVdWtBZEhobjR4OGdq?=
 =?utf-8?B?VHc0VnRocjZic0JLUERrN0JNMzhPNm5tK3pTTTZqSmt6NWNCNTM0eU9heExE?=
 =?utf-8?B?QzQrT1loOTNUUWRraXJ3Y3dPOEVueDZKWXBrMlFXZXBVOGdlUE9YdGxqem1a?=
 =?utf-8?B?aStCUkxEL1dzeHRIcW5mSmNtWHhWWmtwQmkrOHk1cW5ldlcxTU5PVVFsNDM5?=
 =?utf-8?B?Qk9MSWVxc1ZkOGU5YnNpVTgva2lMVVZ6S1Y1MzNCbWplY0JTWUM1R1h4VGN1?=
 =?utf-8?B?aXZRUEZrUG5xM3RNMTE5cjBpZnZnT0NpWXBwNVpqcHBSODBaZTRROVRWekVh?=
 =?utf-8?B?cTVmU054dytpTkVqZk1NbVBsNTFSSWxqVkpSK0E5NEk5MW9Oaktja25tT1dO?=
 =?utf-8?B?eDR3SmVqem9KcE5GelpNc0ljSSttVXhoMHRZV0ZWZ002bFJFN2ZiQmRrRTdq?=
 =?utf-8?B?ekxHdWRrYzU4c1hJUHJXQVFiQjhiUTYxS1FvQ084S0F1UG8zSmZzODYzMVFG?=
 =?utf-8?B?bSsyT1ZONWw3WVRjZTdaSUZNY0lQY1djdzJRaEc0UmtMZEtkaWV4clZyQVZJ?=
 =?utf-8?B?SDF3K2c2Wk9LV0pMQkR5N3VBMitzeUZ1TURVTEJkbG14VSt6cGh6b3FCekg4?=
 =?utf-8?B?TU9FNGRyQmQ5R1cwcG0vQjZCSnFGZG5iaGF4UlZCSDB1eit0ZFE5MW5mQmJ1?=
 =?utf-8?B?TnpjNHBDSFpidHlVbXlZbXdUODFLbVBUZW9DUmthRE4yd3NYT0RLekRZclBI?=
 =?utf-8?B?SGgvcTZFWUJ6V01HWDF1U1ZHNTRuUHJROWpDRURvNWdVNVFHa0FFcjAvbXN5?=
 =?utf-8?B?YzVPQytQOXBHVTVlNWJuL3ZYRjJIU0NPMlBWeDVVSittN0lkMUlmSmQwNTg5?=
 =?utf-8?B?NS90RXdwOHB5ajliRXpXRVE2M3diT2NtVTA4TE9ySVlRZEJUY0lkWlo2eEtQ?=
 =?utf-8?B?UXRONGlqcytQMENKZ1drUWMyZmV6QzlPdm9tUFkwVFNSbVp6azAzbU1IaGZH?=
 =?utf-8?B?ZjZFOWpqc2oyalE2NmU2NVRicmViUE04N0w2bEthVzVkM0ZsS3V3SEZjcnJ1?=
 =?utf-8?B?ajFzSW1KTDE2ZlZZOG54TDRaQVRvam1DZFFvVEdQUzZzZjVFM1VZNjFFQ3hG?=
 =?utf-8?B?ajBSeU5qZk5JZXFXQytaYU4yYVhoZmVmTk1KMHZ6MDFEZUVvbFg0dlJSemtl?=
 =?utf-8?B?Mm1kNWk5U05VZW94YzIvSjBnMGVoSzJ4VUprNjVJelp5S3M5K0VabWwxMkV4?=
 =?utf-8?B?bmFueFhHVHQwSkFKWTU3bE4rMjBoa1ZDaGZlTllMUlQ3c0xNeUJPNVp1MDZp?=
 =?utf-8?B?aU9qbWFiQ2ViZnlma05hMHBheXJYWmJIMmxBQ2twV2p2NTJVK2xIRDQ1L2dh?=
 =?utf-8?B?K3Y3a2c3TXZGZm8wbkpEdzkwaEozWjdhdkRsOXZvRWlNS0lCeWpCSTVTOGdu?=
 =?utf-8?B?WG5BN2pCMXUram9aVVdRc2YrQlBqcEdGTEJCUENOUmJubkUxMERMbnl5ZC9i?=
 =?utf-8?B?QjFNdkFkd3JpMkZuOVJ1RlREeUp2OVZyaG81a1dRQk0yZ2M5dzlZQ0QwZHBm?=
 =?utf-8?B?S1pqckpWZ2x4K1h4MURKVUJPSUh1RTBDZWY2MVVIZWlrTW5Wd0RBNHpacFY4?=
 =?utf-8?B?bForYUZ0WGtXN1Fhc1NZS1hTNFhuRWkxR29CNi9YUXl0V0FhWi9ySjVSc3J1?=
 =?utf-8?Q?X2/8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 14:13:53.2979
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6ac46c-1ece-487d-f34e-08de3be42d65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9598

On 2025-12-15 04:46, Jan Beulich wrote:
> On 12.12.2025 23:29, Jason Andryuk wrote:
>> Pass the TPM2 ACPI table so that the device can be found by a PVH dom0.
>>
>> Otherwise dom0 shows:
>> tpm_tis MSFT0101:00: [Firmware Bug]: failed to get TPM2 ACPI table
>> tpm_tis MSFT0101:00: probe with driver tpm_tis failed with error -22
>>
>> TCPA is "Trusted Computing Platform Alliance table", but it is really
>> the table for a TPM 1.2.  Use that as the comment as it's more
>> identifiable for readers.
> 
> Not sure about this particular aspect - this and ...
> 
>> --- a/xen/include/acpi/actbl3.h
>> +++ b/xen/include/acpi/actbl3.h
>> @@ -78,8 +78,10 @@
>>   #define ACPI_SIG_CSRT           "CSRT"	/* Core System Resources Table */
>>   #define ACPI_SIG_MATR           "MATR"	/* Memory Address Translation Table */
>>   #define ACPI_SIG_MSDM           "MSDM"	/* Microsoft Data Management Table */
>> -#define ACPI_SIG_WPBT           "WPBT"	/* Windows Platform Binary Table */
>> +#define ACPI_SIG_TCPA           "TCPA"	/* TPM 1.2 Table */
>> +#define ACPI_SIG_TPM2           "TPM2"	/* TPM 2.0 Table */
> 
> ... the TPM2 comment bring us out of sync with what Linux has there.

I'm fine with copying these from the Linux version to keep them in sync. 
  I should have realized this was an imported header when adding the 
entries.

Regards,
Jason

