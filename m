Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6488B2E75
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 03:49:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712350.1112985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Ahn-0007ZF-IX; Fri, 26 Apr 2024 01:48:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712350.1112985; Fri, 26 Apr 2024 01:48:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0Ahn-0007XS-Fs; Fri, 26 Apr 2024 01:48:51 +0000
Received: by outflank-mailman (input) for mailman id 712350;
 Fri, 26 Apr 2024 01:48:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0Ahm-0007XL-3B
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 01:48:50 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1faff5e4-036f-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 03:48:49 +0200 (CEST)
Received: from BLAPR05CA0012.namprd05.prod.outlook.com (2603:10b6:208:36e::21)
 by CY8PR12MB7681.namprd12.prod.outlook.com (2603:10b6:930:84::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 01:48:44 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::76) by BLAPR05CA0012.outlook.office365.com
 (2603:10b6:208:36e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.13 via Frontend
 Transport; Fri, 26 Apr 2024 01:48:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 01:48:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 20:48:43 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 20:48:43 -0500
Received: from [172.31.100.92] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 20:48:41 -0500
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
X-Inumbo-ID: 1faff5e4-036f-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VSwIcP4YmeoeL7Ip0HP74SRwY9BCch4zWzB276lUz0VSO32+8Nx+1KdMDHZnSR/pwzn0pUHe+XrLwxN5+81qugW5J0/wdHia3NpfTxAxTBglYyE8TNQJugGC/tCVDQ00tNjOxtmgX2ijZ1srwsV1Z+yuVkJk7FVZ14Lm5gjsChOKCWDOhshMGAEqzizBb7cb/SoUH/LFslX+ho95zy03eDPDdd1FeVAheQbA1NiCdv8U7hi7QzbYy5a5jJzQ6SODXBTl4a5e5XSn3dqgVhpCtCR2BIsgYLzs5Jn2cxWYtpsRFa9t8P7azCCwQFNjavoDW7lF070heQ4PJhPlyCAUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5r3OY9+i3m/tvaQ/bxsIpagM9MMW0+E+w89ONUJ8Xw=;
 b=LOYjZejwCqpHyaouon2kX20F4fJQ7fdvxlUykI4YQX9AQ43inJef2L2hGLvmD2h+xpWHpaPUhB0JRvwFUrxlgIiFM/33W8MAlWznLT5qyFWsO9ZsjnGplMM96QNZHicCXl2C+tRo6v4+Y7l0A4rmdB9xrht5lKnl6jJrRjZ8bOGK55GbdR0LeswEVDtDHO8kg8fgf7kkXmf1+H7IP/eSMQ+mU/Necs+JzNW1N6cPj2EE3StCilpRrEC8cTXInbSVzkTCWmQbL0loUARYTX3aSXvvbZdgsUi8EDGmB3ccpzlUMOQnP0l5nzoFslli03jGectf3TfQ5FeL7aZGg1JoKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5r3OY9+i3m/tvaQ/bxsIpagM9MMW0+E+w89ONUJ8Xw=;
 b=KcJPpTqPP9BMv+Dz6l2kpgKPX2MKT6BZvhltuSqfYAutJZwj/Hc6g8wGQUXElBpH53vatGZcb+Dp9Xx0vBjQgiiSZo/jqG5b3zSlIgiBFZwo5CXMMDTRblyGRkENw7JywWfTPThlOjCijq11H8Wag8xHSF+4fW3tL/sIHx0j4gI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <37176371-6ebe-474b-8cbc-18fc028ce4eb@amd.com>
Date: Fri, 26 Apr 2024 09:48:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] tools/helpers: Add get_overlay
To: Stewart Hildebrand <stewart.hildebrand@amd.com>, Jan Beulich
	<jbeulich@suse.com>
CC: Anthony PERARD <anthony@xenproject.org>, Stefano Stabellini
	<stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-12-xin.wang2@amd.com>
 <c8228db9-6bb6-4115-9cc4-bcd8f49319e5@suse.com>
 <0d94b108-63f5-454d-8204-7a01ba8bcb7f@amd.com>
 <4f9d9182-6db7-436a-a38e-21afed89e41f@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <4f9d9182-6db7-436a-a38e-21afed89e41f@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|CY8PR12MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6e0768-8cb0-4369-a61b-08dc65930195
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFNmanZ3cjBlVVdyT0dMSHIrYVR4cWYyY0NHdm8rQkdQS2ROd05Beml3TklS?=
 =?utf-8?B?dXA1cHpQU3JsVnpWTVp5NHBvOUNrUURaM1hPN2RwZ0xNb3FjZzg3WVc2T0p2?=
 =?utf-8?B?UmloOERMellBQW9PRHl6aVl1UmwvTlVGSXI3SWtGdGFPU3M5S2FyeTRkRDlx?=
 =?utf-8?B?eXY4bkRNUTdPZ3VzU2ZjYlhhUE9jUHZmT0N1V1RYRHp2akp5dFRrMTNDYVFp?=
 =?utf-8?B?Tk0rZnpnb2hlZkllQVNtOGEwaU5OOWdzNFBEb3Z6SXNxOTg2SFRNenpBelZv?=
 =?utf-8?B?d0hWNGVRenhGWlNGVUJ1ckhpR0tLSmU2UERLNnNJN3BIakhQenhvSmVjTjFt?=
 =?utf-8?B?TVhCT2x6YlVaQUFDK1Y1ZkxuRC9IYVZTY243Q1R5a0ovbWpnS05FNm93blZ5?=
 =?utf-8?B?ZmxSQmd6MVA4Ty91SGEzeFNySzZHRVdqcGd5ZitTUkhWUEpET0hJY2MxQVlI?=
 =?utf-8?B?SjIrSnlneG9mUXF4cEV1dTJ6dGpQN2o2SUIxRnJIK25qZDZKdGpPOFQ1cjlj?=
 =?utf-8?B?d29ZYzdCV05KUmRGWWhwNmIwWnplU1ZlaGVoLytNanBQUUFZd2NiUFVaQk9G?=
 =?utf-8?B?dklRL2VIeURGTGVqbDBrb3NLWXNQcHpiaSt2Wkk5RDg3SlhsWStXWHM2WGx6?=
 =?utf-8?B?SEUvK2Jja3JvN1plVWZvZkdmSGNBZDZ0RFdVcmd1SVFuSGVqUGtNQmk1dWx2?=
 =?utf-8?B?VCtJYzVaT3BsRm9GRWk3ZS9uTGgzcWxaYndKcTlSdGI5TEhwNG1jZHBPVFdP?=
 =?utf-8?B?cG1Dcjh0cmY4TWZFSnpOUFMvWEg4cFkxdXZCSTdrcDZLTXNtdTRiNmxmSjVT?=
 =?utf-8?B?K0F3Z0Q4QUxTK2M1aW51VEF0MFhvNU5vdGdHMHlsalFjYVhXeDdVT2phdkJL?=
 =?utf-8?B?b1h3Y042b3N4bGxkRXJ5bkZxSmF0K0t6Z21nMk5qbkV4QTlBd0ZzdHpkQW9y?=
 =?utf-8?B?VUp4VW1NZkZoUC9weVcrUU0xdFBCcXFUSkE2bms2bDFod1YwWWxyZnl1MC9s?=
 =?utf-8?B?VjI0RFlXYmRubEtvWnY3TWZ6NStGbmVUMG9ySy9Ma3dBUndpR3RHWFJjUkM2?=
 =?utf-8?B?cWdEWVU4WThJaFBZaXdIOWVqNWNqK21sWE56bkpZeDB6Q1pQejhtbXhtd3Bl?=
 =?utf-8?B?djFYNVZUb1JWY1d5UWNJT1YzbU1IMUthUmlhOU96blR6WTVmeEU4MFhiM1pS?=
 =?utf-8?B?d05YNW9BQ0NDZTliMW5wOVB6TU1KblI5N3FXRmJtMnZqMFQ3VXluODEyYm9M?=
 =?utf-8?B?eUlySStSdVZ5d3VhSm1MeEYvTVRLaXZ6NG55c3lXUDdaV1cxelpCTXYvcFhm?=
 =?utf-8?B?TlNUbEx3bEs5ZmVRY0gyUW9BTGxzQnJYcER3UEU0Z1R4K1M1UEZENW9aTFJi?=
 =?utf-8?B?TlVRY1BIQ1NFaEdBckdZV3BSQ3Y5NFVYeG9qWk1ZRzUrL2dPUFVTa2pPN0dE?=
 =?utf-8?B?TEV4SVdhUnZnTWxMTFFUa1NzVkgxZlpEOCtGL1c4QmFncmZNc2ZBYTFKUzVE?=
 =?utf-8?B?WngzWE5Vb2MvR1JScTVXNjQ3alJtVEZENjhtUHlDbFhhcWRvRENmTDNZTXdL?=
 =?utf-8?B?NmZiaWFORXBNeDg5OUc0QkhWbDhhV3JYczJ4Szlicld2RktNaWFDcGlySkFp?=
 =?utf-8?B?ZjZQUGh5MFcvYjFVVHdkNHk5UmJJR1lrVE42SGgzNnM2Qzg0Q3pkQTMxRjlp?=
 =?utf-8?B?WjNmbWxWdE1SakZuSTdpcjZ0ZVRuNkJZdy9oM3hQNVVDSkptMThhRndSVmU5?=
 =?utf-8?B?YlVBR0FtTHdsZEc0VXVYQU9BY1hEeGhOcUR6TjUyREV6bWQzWlUrQ2J4ZnZI?=
 =?utf-8?B?UDlINFVNeVB2YVNWd3p4aUVxc3VTR0ZaNFVWUG9vRm9lSWNHVzlpT1dHeTJO?=
 =?utf-8?Q?i/S3zJ8nW96yt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 01:48:43.9856
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6e0768-8cb0-4369-a61b-08dc65930195
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7681

Hi Stewart,

On 4/26/2024 9:45 AM, Stewart Hildebrand wrote:
> On 4/24/24 20:43, Henry Wang wrote:
>> Hi Jan,
>>
>> On 4/24/2024 2:08 PM, Jan Beulich wrote:
>>> On 24.04.2024 05:34, Henry Wang wrote:
>>>> From: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>>
>>>> This user level application copies the overlay dtbo shared by dom0 while doing
>>>> overlay node assignment operation. It uses xenstore to communicate with dom0.
>>>> More information on the protocol is writtien in docs/misc/overlay.txt file.
>>>>
>>>> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>> Signed-off-by: Henry Wang <xin.wang2@amd.com>
>>>> ---
>>>>    tools/helpers/Makefile      |   8 +
>>>>    tools/helpers/get_overlay.c | 393 ++++++++++++++++++++++++++++++++++++
>>>>    2 files changed, 401 insertions(+)
>>>>    create mode 100644 tools/helpers/get_overlay.c
>>> As mentioned before on various occasions - new files preferably use dashes as
>>> separators in preference to underscores. You not doing so is particularly
>>> puzzling seeing ...
>>>
>>>> --- a/tools/helpers/Makefile
>>>> +++ b/tools/helpers/Makefile
>>>> @@ -12,6 +12,7 @@ TARGETS += init-xenstore-domain
>>>>    endif
>>>>    ifeq ($(CONFIG_ARM),y)
>>>>    TARGETS += init-dom0less
>>>> +TARGETS += get_overlay
>>> ... patch context here (demonstrating a whopping 3 dashes used in similar
>>> cases).
>> I am not very sure why Vikram used "_" in the original patch. However I agree you are correct. Since I am currently doing the follow up of this series, I will use "-" in v2 as suggested. Thanks.
> Please also add tools/helpers/get-overlay to .gitignore

Thanks for the reminder! Yes sure I will add it.

Kind regards,
Henry

