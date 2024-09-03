Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0544B96A18A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 17:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.789352.1198949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slV4b-0007FT-Ss; Tue, 03 Sep 2024 15:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 789352.1198949; Tue, 03 Sep 2024 15:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slV4b-0007CX-QB; Tue, 03 Sep 2024 15:04:01 +0000
Received: by outflank-mailman (input) for mailman id 789352;
 Tue, 03 Sep 2024 15:04:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zNil=QB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1slV4a-0007CR-Ja
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 15:04:00 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2417::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bebc1c74-6a05-11ef-a0b2-8be0dac302b0;
 Tue, 03 Sep 2024 17:03:59 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SN7PR12MB8169.namprd12.prod.outlook.com (2603:10b6:806:32f::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 15:03:55 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 15:03:55 +0000
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
X-Inumbo-ID: bebc1c74-6a05-11ef-a0b2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s4oudjW5zegiW0M5MWr/FU+CZIycyF4eiMl3TJQwxgfGESJfBqg5kuVur17/gHKtaMqE8KiPB9D6XrZdzySwR1iPqUVtjrSpCkoyjBB9wz+rOXEz8eP55REhKrn5aG35VMHVMBh4fvmq7IvxIwOJxy8mJRTNdKSDC/HS/ncNJlmBOSOz1WiieqknOSDwd1kzhvMgq7urFSBq+k06v9VX6IHyR7oux3+k51/i68FAIwEFffKnHHdD2MC8g7MAQMOWnNiBTiA9WhEtzsV2MDmlf8tngb1sXiCsyf6Kge51Am7nxCaRWFsOzjKE9/vWU8aAu0/c9+YBwimGd44K/+Zndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sW2v3sVMFEjnbr6SUh7ezX/eGsuELblnzEeCJex0Dgk=;
 b=xHgZ/9FzJiWyyEC/dRJO37IgXyf7e5B5APe8o3LypKgC1Tel2Ar8zF5fRMLJtdrddcopJrDbmtWLrdSTs9GaaWfHgXMx4J9qJfgPslpDQtPV3jH0yXNV75blKbJTvkJWhr1SCpKIZz7c6pi1dqdSgZWpkdK0jFNe9KBq1w3gLutwSZiiRfeO0sLG0wgZUP3jghp9NqG6xSdsBkIKNlpujV/CfBG6Va2C78aM6pr8KnF2dOJMhzVQ5iKIoCjp5fUy71jgRhXJY+Q3mZC7TqqCZeJuBsfttrIW6rfMhlg4ElegtsERjN9JBcc/OI3a36i/+u/xoUUj2tgyELQw/wZAvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sW2v3sVMFEjnbr6SUh7ezX/eGsuELblnzEeCJex0Dgk=;
 b=f+nWQUux/vnBHpLODwQ+P5NR03FDwvFnHLAUvWOGNY8RLQTLNgO1OOhtQa+1qAg0Qhbhz9E8hgf3joNj/plVYNQGzyI/VU0//nHaAT/R1Q1zUWO7bbFMGQ//kUEjGhHw8jE2OScB3W/6NBkP61jxasPPQVDQe6XZ7Y4mO2jfPm8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <cd87836d-efee-4580-baf3-13eef847a67c@amd.com>
Date: Tue, 3 Sep 2024 16:03:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for emulated uart
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20240829133314.4042845-1-ayan.kumar.halder@amd.com>
 <578a5631-fee7-4de0-a764-1f7c896ee057@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <578a5631-fee7-4de0-a764-1f7c896ee057@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0033.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::8) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SN7PR12MB8169:EE_
X-MS-Office365-Filtering-Correlation-Id: 4732df3a-1657-41cb-5867-08dccc29a16f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WmRhU0ttMjFQOE9qbXZFdEptRjdFYXVxMGxmWnlqMU1rRG5kdndUT3lSK0xK?=
 =?utf-8?B?blRNanJqdlI0MGRZT09pQ01HaGZOeUlMWDFTeWVhWmhQNzAwL0YyRFNYT28r?=
 =?utf-8?B?Vk1ERDN1aDdGeHA4NHIxSWRDQldBU0RBYXFxbnVzL1NCT0FkbmJJY0J3QjAx?=
 =?utf-8?B?TlZ6OGdUeENMdXBlTXI2NHhJSkxwZmltUTl6NWRWTVZ1S1ZFN0k4QTR3NjRL?=
 =?utf-8?B?VUd5UXRXYlhwNmgyNW9MaWhjeTNkODlIemJwNkN3ak1DV3ZZQ000QVhsYmxl?=
 =?utf-8?B?VUZZWUtmQURraFQ4aEZ0THZRWTBDcThOaHJMMW9SQ1dtbDRtQ1dQeU03SzRN?=
 =?utf-8?B?S0xDYkFlSWVaeDk5UjBwbjdPZmNIR2ZVaW8rd0g1UEJLeGtjQVVLKzAyejFP?=
 =?utf-8?B?cm1saUtaM0x2bm9zZjYvbDJDeXBaKzBTdFpxTWREcEhpZGM1SnRxMXNkZG1S?=
 =?utf-8?B?emZENVF4R0YwL1hDb2dVS0w0dXIwOHJEVVNVMExIc0FqVTZpSi8zNnNJbE9X?=
 =?utf-8?B?Ti9BYlVHTEsveGdXOWRXVVhIK0F0c21xejA1bldkajdHd1I2bmdNUUl5U3Zt?=
 =?utf-8?B?c1hBYkR1b0VpYm1UdC83T3c1T01qb1E4Mm1EazBUUFpDL3htOERMQXcwNDcx?=
 =?utf-8?B?NEtMdnhqdXNoU0R6MXo3MEFhVERTZWg4dXlxUWRUdkN6VDRKY1A4NXBzVFVR?=
 =?utf-8?B?b2QrNnQ4em54aVRjbWhyRzJJQncwRHN4OGJKWTBtM2Y5L29ha1M4cXBTb2Jv?=
 =?utf-8?B?SCt5blU2OWFGNUZCcFROTHY4VEE3UHRRaW82Q2lRcVhIU3d4eEJBdk0yVWtX?=
 =?utf-8?B?UURFVzhSbHBzVE83WWJvZVpUcWFHNkdnMU9CL1JPWTMwZXlFSnRVQjg2Zity?=
 =?utf-8?B?em04T2YyQWRRSmhyYmFHVWh4d3UyNzZhRTlLS1dhOXZIWGtUUlYrbmZJVkFD?=
 =?utf-8?B?Q0FNRnFHeW90R2tRTUpIa0ovUHlOL2VUZUJ6N3lNQjRObEY5SDNnd3lQYmh1?=
 =?utf-8?B?N2dNWUxQYzlPQnc5c1NBWXRCakhPVTdmSWVHRG5HdnViR0h4VFloZWRXaG10?=
 =?utf-8?B?eHg4OTd6Y1Qxc2x2ekhZVStTZ1p4TzNKTW9Jck1ReXJPMGhYNHZRblFkUGtZ?=
 =?utf-8?B?dEZYQU1BRXZFSXVLS3BhVG9KSUkvQmloMDlMeUxxZ0pqVTEybUV2cXN1MG1I?=
 =?utf-8?B?bzBBTWVJeW1rZ0g0UDVEdVByREdMNDFwUksyOGRVMTVSMHNKSDMxTWNTcndk?=
 =?utf-8?B?N2VJYnB1NlQyRzRmelBQeXlRQjZqWEpsb3FmazQ1NEJRRHMwSDNCWnZkcktv?=
 =?utf-8?B?MVUzYTRsZFI1U0JqeDdzcjh1YXBaaDJrQkd6Yk5XR01wVjRkSUNESm5sNm5W?=
 =?utf-8?B?Vkx5aERuNFM0WEN1Y1cvZ3RzWUwyZVFITU1jcUlZZWs3YlJRa3JLVzFrUEp2?=
 =?utf-8?B?REVCSGwxSVVLaHAvaEtadXZndlpMTmtPY2RDdHZsM2lEV3pSai9zWStpS01H?=
 =?utf-8?B?TlcyNHVpVDNsdEo2WE5CeEltMXZnVXg3SlRhTG9wTEhjS2QwbG9KU09MNUVj?=
 =?utf-8?B?ZzAxeGZqQ2RUOVk4WnVleGdaa3dGZDVmMU95bzVrSGltOGFNdVVKYkhzS3FM?=
 =?utf-8?B?d25NSHhQQ2ZwZTB4eE1ZbmxEMkQvUXV5aWd4YnZiY24yMmtIMDBwNGZHLzAx?=
 =?utf-8?B?TU01UWk5UzE2U2I0aXhkY3VFVVN5R3I2enhjS3FseS80QUNZUFIxSHRIK0tV?=
 =?utf-8?B?ZXlheEJ3WFhsV1dTSk5CclFBbVg4aGxIZGRnaFRqNEl4ejJndEFYdFFyVEly?=
 =?utf-8?B?cG1uZzBwNXFxM3Zvd01SQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmIxUVhDVmJ6clRjaGV5a3hhNU43Q3hHbDdidnBOb0ZIeDBvRklHNmxPTjZt?=
 =?utf-8?B?VFZLalowdkI3OUViUE1OcVdNeGxlZWdkVW8xeG5ETEFlYTBSLzRhYm5KUjFD?=
 =?utf-8?B?aFZDTzk5RVZCejVrSmVUajM2eVNrQWJkZWw1UXM3aUJ1dEFpbzFxc0xyL1I1?=
 =?utf-8?B?elBuWm9DV21HY2s1OHRraG5vbWdscW94R2p4NHYrWjQ5TllpOVlEaDZ4c1hu?=
 =?utf-8?B?eWlMU3hDVTBjdCtJZXJ5dnNiRUNpaE5LUUtlN1NmL251SGlvYlRUOWtmTVo0?=
 =?utf-8?B?UUxWNzZHa0pnRzMxUjI4U3BUeWZ0bDVFMzFGTXZEbXZlMnJQeVBhc3Q5UzJj?=
 =?utf-8?B?K2tHYUlEWXlUZnVaT25LMzBtNUthaVZzLzBLOURGc3JhdmNNRUdVU0laUE84?=
 =?utf-8?B?VEsyTld0QjYyUTZXc2RVVCtlalNJdmg2dVcya1BtQ2pPbFNzeVhzb0tmZmRo?=
 =?utf-8?B?VlNsVzlod1ZjVXRwenJuS0RrVEU2d2dzRllYcldvWTZHWm9LRm56cVJwQTIw?=
 =?utf-8?B?UzJMVnhRWFl4RUN3UDMrVkhpRUU3U3NOL0ZiZGd6S2pFdDdHKzIwdU9wZm9T?=
 =?utf-8?B?bGcwNHpueXI2RmdITjU2bGtMRWwvZkJIOTkrbm1tVUorRG9rekgvaFJJV0NI?=
 =?utf-8?B?N2NUdWtHWE5sOEVmVjJhSTEvQ01BejMxbEhSTnBHdm04UlUrZkNMUWxIQjlS?=
 =?utf-8?B?UXJYWkI5ZzBGbFhQQXppZjh0bFJoRXFsbk1qL3cxby92SmhyQ2E4U3ErRFZG?=
 =?utf-8?B?Ylo0RlJGclFESWJnNTVBRHdhaDJGSTNxYW5zN29WZ0pzbW9qRjI3ZDNJTHhw?=
 =?utf-8?B?bjk0MmIyeUl3ejRPUmJDSThKMi9pWkNQOHFSRm5HbGFMU25LUDB2NldrcHZu?=
 =?utf-8?B?dGQ3YzZDcDB6MHltU2dkU1laVG5xOEJUeWc1UlhNWTdWOEI2cmkxUVVkV2th?=
 =?utf-8?B?dVh5NTBBeURsV2lSSXBxZDBNRFgwS282LzNGS3dUbmFRb3lvOEtKeENKNjZr?=
 =?utf-8?B?N0Nwek0vb0V1WTZ3R3Nic0p3WktNbmVQOU1iZ2ZiUXYvd1IxRStuVUdGY1Za?=
 =?utf-8?B?VFJUN2VwLzRUWVZvZ2dyZUdEQWpWeEJudExkbmJ6b0Qyb2hqZXNXVEtEVjIv?=
 =?utf-8?B?eEI5U0crU1pOWG9qUUI0cEZaeHF1NEdqMi9QYk9QZUR0OWc4OVMzZE1IS2hv?=
 =?utf-8?B?eWVIekI2YittSnRlZk91dldVb2orU1Z6blozaVVZdmwrNzlCUlR1TkpBSGVy?=
 =?utf-8?B?WGpZTjNxR3ZjbndjbGF0bENIOUpSV2I4VWdubThIVHNLbCtsbE5lZEVCZWZa?=
 =?utf-8?B?THhQNDNoWWJ1eGIwSlRpNS9UMm9SaWUvK0VTcld1SnhrZ1ZFUUJKQ05pN1dE?=
 =?utf-8?B?cjdmMHFZbVVldlRZUmd6eXFQMzhBWm9xYTlGcFBlTUwxS29YYmwzRjVwSU0z?=
 =?utf-8?B?OHRNSVByWGo4eEp4RVNjcVdLYndSTlMrbm02S1JVM3ZidU5kSWpmVTgxWTRV?=
 =?utf-8?B?b1IvV0FVMnNJcVVYWklCYlgrTStkY3BqdUpKVGRZdjBabHlYZ2hSaW1Ea0lw?=
 =?utf-8?B?NzZpUzJVY0pUOHhBc1VxV3EyejlxVTQ1b1E1ejFhdHc4L1BFcWFibWM2dVRY?=
 =?utf-8?B?Z1VkUTZUMVdwbE9UWkprbFVETkZPczNHdmUxSmtFWGQ5Y1cvVGgyb01PNkhw?=
 =?utf-8?B?RzY5Nmo2WmJYZlAwMHlwMngxbENHVTRwbWFIT3U0cnQ4SUJCbk5DcnEwYVBN?=
 =?utf-8?B?c0JhYkYvbU4zQS96cnIyK3RNYXVIU0VZWC9hbU0zK3ZvaXNaQ0pRcVZWT2dC?=
 =?utf-8?B?REFEMHFsRnFMdjVjbGQ2QXFld3R4dDhhckdPZzhsOE9MTW9tUGw2R0xmcFR4?=
 =?utf-8?B?dWVYT043R0t5MmxuZzZ5Y3JaQ3lNUEduM0tkL3BKYUEwZ3dKKzNmVVRrNjB0?=
 =?utf-8?B?VmI1UlUwVTV1aGlMaWdxTkhHeU5tUmxEL0Q4MU5JUVFnaFR5MjU1L3k1VXZX?=
 =?utf-8?B?dVpyT2VIazE1eXJwckE5TEVuVVFTUWt0OVlUcytaQVVNSDNIb1VaVEVQU2dn?=
 =?utf-8?B?bnVCRUUxaHpQbStPdUtEaVZJSnk1OVN5c05FN1l4UERJNThrQkR3ZUdUaTVV?=
 =?utf-8?Q?kDqfOWUzUE8oxSERSH7SepJok?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4732df3a-1657-41cb-5867-08dccc29a16f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 15:03:55.6445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B0BpY6/zT6vBiT2r6MYcd6mOHY0oTHVTixzwNnwhx6Zis0sbShM0u6gjWtwqNJ0hYwyHdpiXaH49bM/CLRVmrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8169

Hi,

>> diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
>> index 9c98c84a9a..b69699e5fb 100644
>> --- a/docs/fusa/reqs/market-reqs/reqs.rst
>> +++ b/docs/fusa/reqs/market-reqs/reqs.rst
>> @@ -15,6 +15,22 @@ Rationale:
>>   
>>   Comments:
>>   
>> +Needs:
>> + - XenProd
>> +
>> +Run virtualization unaware VMs
>> +------------------------------
>> +
>> +`XenMkt~run_virtualization_unaware_vms~1`
>> +
>> +Description:
>> +Xen shall run VMs which haven't been modified for Xen.
>> +
>> +Rationale:
>> +Any kernel/RTOS can run as a VM on top of Xen.
> You cannot say that as it is far from being true. For booting guests, Xen follows e.g. Linux Image protocol
> which means more than just a header on top of the image. I would remove this rationale.

This requirement is imprecise and thus cannot be tested easily. We will 
drop this req.

- Ayan


