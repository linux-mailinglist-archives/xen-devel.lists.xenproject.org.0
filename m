Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDD295B33D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Aug 2024 12:53:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.781745.1191259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5R3-0002en-3O; Thu, 22 Aug 2024 10:52:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 781745.1191259; Thu, 22 Aug 2024 10:52:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sh5R3-0002dC-0Y; Thu, 22 Aug 2024 10:52:57 +0000
Received: by outflank-mailman (input) for mailman id 781745;
 Thu, 22 Aug 2024 10:52:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wmoe=PV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sh5R2-0002d6-CS
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 10:52:56 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20609.outbound.protection.outlook.com
 [2a01:111:f403:2405::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae32b8a5-6074-11ef-8776-851b0ebba9a2;
 Thu, 22 Aug 2024 12:52:53 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by CH2PR12MB4231.namprd12.prod.outlook.com (2603:10b6:610:7d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 10:52:47 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7875.023; Thu, 22 Aug 2024
 10:52:46 +0000
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
X-Inumbo-ID: ae32b8a5-6074-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXnKRZ8dNXvdm5G4tV7nBu1iHtQ5thwOySY3v7LAJHkF2Rn+K/+iPboCU3EhmFyy8IWH1UjtnC3AbtdM0HHMKUdAp5MiTqiAsf9etnySS4Hgx9fZbQDRGYVMB5eGpKs27VxpOBE59Mx4zscBV+L/7NbnRxcBZqVDMJIKZ/wEGqCUq4GxbqYzB5UpiaNmBJO5hmcpLz56oHnevF9vAkAXpOYjeJ7WcGVesazWdARK9PqtbFyPrkvREJAQzL7sNrsRiPibc4fdpn6L229ioyGQg63YODAVMiulYvufYjIgVhRQ/wV9i5HzvGZ3VxRdO+oclzGl+xtCKG8p0ANUaEJ7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lMG8aiKz4WuD+wtermS59/pswWNOKugwWJiLeC1HqG4=;
 b=lj0bo8AY2ATLyaJTJB1OpX7vplGPo3y5d+jAYQwP2JXzFUdkgzXWLmKqr2jmeR87UT7c4t3LBMkSTsD9CvwuP85RkI1tM4a5xtvYd18Vq3nnPzyHq0bq82HbiMdNzNFmkkjHha5sbjtEHnZXHm/KMHxC/Gj4lXQkGI3cRF8a2SJSQdlZLLeaNDGep22hBPU1trvuwS0cFjsTyJFdgX8xvdTpIU6R2yCwnT0OkU7OXVsiJXXFzg5eQpEg035wQGdbCK/VuwdFANI5uBAB0M8yPEfboJB4M8Lzr8L3SL5/bDS43HUyNRlEq9dRLyzLy8+Hnnr8GBeVtm513lHWDjJXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lMG8aiKz4WuD+wtermS59/pswWNOKugwWJiLeC1HqG4=;
 b=XPzlsf3FYlU9cA3mlWz3cZR43K1+dvqZc8un826ofeKxolP9FrigLM1i8l4u/e5l2D+IJjkYlgKL4dQuYJPJ5GC7eU3++bvvisvOwbfxOary6I8V/qSgtUN3wR1LjyPxWqdgiBhSqzveQ3Ja5C3E6aCUBpyurtDOWnLizxdYsrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <6d065949-dfae-41f8-b030-c7d09516846b@amd.com>
Date: Thu, 22 Aug 2024 11:52:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: make VMAP support in MMU system only
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Chen <wei.chen@arm.com>
References: <20240821122503.2315844-1-ayan.kumar.halder@amd.com>
 <20240821122503.2315844-5-ayan.kumar.halder@amd.com>
 <cd2e6b08-ce76-4707-831a-c21b05ca85cf@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <cd2e6b08-ce76-4707-831a-c21b05ca85cf@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::8) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|CH2PR12MB4231:EE_
X-MS-Office365-Filtering-Correlation-Id: 09c4b190-8a4d-477b-efc9-08dcc2988ead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHZWcjJJWUNRa0NkTkJXYTVMYllqemVLcTRNTk1JeTVpQlJrUm5HMDBTNmJD?=
 =?utf-8?B?YWlsdmRvTnJGbjFwN0xnb1BFUnRUcDZ0bko5dmJDR25nNGZrbDUxZFF1YzNL?=
 =?utf-8?B?akNQREVBZ0gyYUdiQkVIdTZ6bTlDa0U3T284NE5wSWpMcGVkcW5xdlhBNEpn?=
 =?utf-8?B?WkJ4bG5iNjZRODhyc29COXltc2VRNGoxY0FGSkhUSGRyaDBUUTJiekxWRHlP?=
 =?utf-8?B?dHVBRnZ3OTFzdTExN0Q3WGNacENXV1FMdzlWaGY2YzMzSFlpWGJRL1hLWTVR?=
 =?utf-8?B?djlGaXdzYlkyZm5tbU1TU2tGbEVuM1p5ajl0STB0bVBqZE1UVlU4ZW5qOWRQ?=
 =?utf-8?B?dUJBVjd4ajczUXphcXZIUUpUM3pWZXRLUTJqZStyRHlsNlFLS3ZxbkxQLzhB?=
 =?utf-8?B?NWhmRDNqTlN0b3JoSEFmNzZ2ZlNIYlJvRUdYRjE5YUYvb0toK25PdDkwaUcr?=
 =?utf-8?B?OWs1dG02UU5ZNnlJWDUrQ3dCSFhxMkR2bUtpWHB4QjJaY3U4V25xdVo0M01T?=
 =?utf-8?B?WGl3SmhIc0RRdHNrVDhNTEZPc2h0QUkzVHltNW5lSk9OWVh3aGE3VmFRQ2Vw?=
 =?utf-8?B?UGgzeWxlRkdORmN5aFpwa05CUytLaDRQeEIwSGtjU2VYQzc0YUc4TE5VZUl4?=
 =?utf-8?B?aW92Smo4TGlqQ0pPUitoUENJYldIU2k3NXlNRDVHWjIvZFJKaEhJV3JsWWwx?=
 =?utf-8?B?WkUwYnkyc1FvclFDRi8vblFVNXhHREo1ckpxK2VCaGhXall1U2JkUG5rb254?=
 =?utf-8?B?TmpDUHZzZTFoemE3V3FmclZ1YVVuWE5KanhTb0l0VkwxVHQzZVQ4NXV1NFNo?=
 =?utf-8?B?WWJ0YWQ0WTFTRkMveE15bUhBdmYwaTNJbTl3dDNvcU5XbmRUcC8zbVNhQnR0?=
 =?utf-8?B?b2VucTVEU3VoQTlPVTh3ckRtS29JUnVGVllpS21KaHZ0U3VaamlPNXNGdHVV?=
 =?utf-8?B?U3FiRWV4dG5QclpEODVnOCs4cGZmc0JUMEJrM3c4T3MrY25PcVcwNVY5NzRS?=
 =?utf-8?B?QWhKK3hlSmpqLy84c0F3ZUR2ZWR5WHVMd1hXSXJJQzZwQS9KVFFrZVNPcWlm?=
 =?utf-8?B?aFJCNzh5MW91UzVQajdZNUJoN0JGamowcVFmYnh0TnZCUVRvR2lYZTU3OTJJ?=
 =?utf-8?B?aEhVQXdCeEJ2SmVPN2hZM1pKTWYyVGkxOFRYby8zVytDRzJIYjlnNGltaUtY?=
 =?utf-8?B?WGRHR255aHBHR1FNM05rdUxKWjlBTXdOSDVzSlRjcUIxOHNyckZ5NlYza0pm?=
 =?utf-8?B?Y2ZlbHlqd0tablUwQ2dNOVMrVzFueGt5MDhtWmJ2WW5hU2YrUDgwOXNsSlhW?=
 =?utf-8?B?VWF0QmF4WG91d2RWME9WaFQ4bTdpMDFKa2swbXZSQm4zb2ZJYWU2dkI4anBO?=
 =?utf-8?B?bGNzM1BLc3daM1FHVFVYajVaemdscHU4dFlobGEzMkRrcVR1bVA1dklIWU9C?=
 =?utf-8?B?R1JMUUdobmdwTE8wVmxCLzJGU2hCTTB2OEJ1T3kvS3puQ0szNkV4RVVRaGFl?=
 =?utf-8?B?MTVUektPemVQU3l6azNFbDk1cnRTUjN4ZFRPWHhXRlVRV2FDYjErcmowUTE1?=
 =?utf-8?B?Rm44K2ErN0RXZ21WMnAxN0lOR01SQmF2RDNyaE84ekNZNWFSREE2anFibDFh?=
 =?utf-8?B?bm1xcGJBWjZ6N2ZaNGlXZVVjUlRoV2NWbm1xSFpqV3d3cDRWYlhITkRpaUhk?=
 =?utf-8?B?b0pDVjc1b3FGakR1R0M2Y2V5bnR0VzB2OVhTOUJJMTJqenRFdzkrK3lYa1Ft?=
 =?utf-8?Q?ynddoMbdliPzVhKRW4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVNhdk5GQVhjbVRteTF4RUxWTnhyczYyQ2ZPUFBUQzlNY0ZRSUpkK2JxbEVk?=
 =?utf-8?B?UCtEZGM5dzBjSmlzTFFXcDVNQXp0RDJ4TnBvdlNqVS9MZUlRRHJha0NiQ2Jx?=
 =?utf-8?B?bzRSSnR4Q2dmRGNZMkFOSDIxOHAyeFAwY3BkNjlScXZKbDMvbUx4NmhSUVpG?=
 =?utf-8?B?Rm9McXNESGlQY213NEtXUm82bWZnSHhUbmlzKzJtZ05QSkhCcXpIb2l3UEp6?=
 =?utf-8?B?Sk5Ga3VLenNFNXIvQVdIMUdoazNuK2VlOHFUbUI4U0R4b1hUdnpjeXlnczZz?=
 =?utf-8?B?NndDUmV1c1ZNbzhKdERJS2R2WjhYWFVjR0E1NysrQmhzMWFjQ2JhU2ZhdkpO?=
 =?utf-8?B?Q3NrQ3lpeVVubFZJKzNhVEJuN3c1M3ZqQ0JZS015SDNiVWxSUklmaVkzMit6?=
 =?utf-8?B?dlJ4TitRMHZsSUVicmx6UlRJdWpkcVRDNzlvVWtsUXRzbU5GNzZ0N1dFTzRL?=
 =?utf-8?B?clVmZUZuRVdYbkJyOHI0RTlyTTJHaFN2KzlhT0tMREFvVjRsTVUxR0xKSk95?=
 =?utf-8?B?SUhkOHJ5QkFBMmRMUVBsTzlWV2xhUTdwRk5kSkphZngxamVYczhqRVJzQjZj?=
 =?utf-8?B?dS9qb1ZNbjFQb1B6bkU2RCtzV21sM1U3SjBVWnNvS1pjcCtuQ2VZcHlnRkRS?=
 =?utf-8?B?Nk1kNU9LbERCanc1TFhXZjdhTkVHcDljV3BrcUhtd3lZeDlEUm1HQUo3eVdo?=
 =?utf-8?B?T1BBSkMyZDZWckovV2xUTE96UGg5SS9mUXZYRUpCdlFrSVU2eTRIYkp3YTZX?=
 =?utf-8?B?YlZRb1c3eDlmL0xDZmUvQXpURnhIOWxtUWNmVXBtMmlpTjVQbGVjOWN3am9R?=
 =?utf-8?B?azN0TU5QNXJONEtOSWVuMFl6OWI1R3NHRXVjd1k5SXVSNjJkQjhzblk1WjRp?=
 =?utf-8?B?enhUVHNNbjkycDFSNXh5MDhleW9rL2h1b0tIR3IyQ2w1T3BkWmkwdVBiUUlr?=
 =?utf-8?B?OUEzeWl0SGlVQ0s5c3FycWhpMjEwRjFhQkN0c0MyRGJ0ZkNPNVBMTGhmQXYz?=
 =?utf-8?B?cmlmKzdwME1senRRNXR2ZW5EVjdiQ2twNUJTeFZ6NlpRUG1pbHpDUFVMSXp1?=
 =?utf-8?B?aDRvbVFCb2NDUUw1SU96SnZiUTlNeWxkZ2owNzBXVEpFdHFRTTBCd3U3WWdP?=
 =?utf-8?B?ay9HR1VhMStkSUo2SFdSRGVxODVmbzBBRWJOYUNhRERuSWlwZlg4V1hzdUNL?=
 =?utf-8?B?cThPenpybGlwNGV6UWxFNkhFbmhBdndGTC9nR05tanpoaXU5Y09VdGxrWUpX?=
 =?utf-8?B?Y0tpRGhTUElhUnFXWVpMODJSdjBVcDBCOGxtS3FBUjZ4T0dCVFB0WHFCanVG?=
 =?utf-8?B?MFNkSEVMVzU1ZXZ6OFV4b0V6cy9FTUNQRS8zV09sMUJRb2s2cVFoSEFGeGNM?=
 =?utf-8?B?NHJuR0dBdlNCMjlXUWxaWi8rUGtVMHBWNWdVN2I1azRCRnN3VFBDbjRwSEhq?=
 =?utf-8?B?U3FSU2hsb2dDRXM4N1B2c2RTQWhpMEUwR09McXpTZ1ZYVlRoM1dXM3NLL3J3?=
 =?utf-8?B?VXByRXl3QnJLN25qa2xKWkhVUlZKODUwbzFmQnMveWJKTUhmTERNSzhldzEy?=
 =?utf-8?B?N1VFd2hmQngzYk5CUXZXTGlWL2hyTXEwdzlFS2pnYmVQck81L3NXdmdJbWdW?=
 =?utf-8?B?dmxmZ0Fxc2d6Mmh0dG10d3ZUOFpUY2wyV2ovbnl0dXg0SVBuMGxhZXdYQjl6?=
 =?utf-8?B?eUVwdkkxaTFNelhWcW1MdnpDWGJMUyt1RWtqT1pjak9qYU5iS0JyUjNnN1Zy?=
 =?utf-8?B?dWkzNDVmSmxodzMxTncwNVhHcnVSY0YvRzVxTnpNbWxhZGx0VkFWbCtld21Q?=
 =?utf-8?B?RjZFRFRnSmd1YlZIVkVxVC9uR0pydzB0QThXMkRKeVkzUlZIYi9OZ1FQUFl6?=
 =?utf-8?B?eEIxVW5zY3piQkJEcmNWS1RJNHhWV1NsR2praTVZek5NNkVBeXZ0Q0owcTlw?=
 =?utf-8?B?R0dYMkd5bmNWa2ZicDB0V2NiVFp1bXBUMTVVMGw2ZFZMMjdKY2x0NjBtMEFK?=
 =?utf-8?B?WHZXMzNHS0NOWUxKb3NFSkRuUmwzTEJ6RzZqRVZwanozY2NtNVNTMFB6djF1?=
 =?utf-8?B?R21vNFNtWE5WdlVNeDhrcUx1cGFNS2M2YW5sa1BOa2pRMnFrN285L015b09X?=
 =?utf-8?Q?cfKPxcnOMzFbK6tv/MKayFH+Z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c4b190-8a4d-477b-efc9-08dcc2988ead
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 10:52:46.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRSocqPkRelElQrGrzrriar+7i7UKkTvwIocUP1y3zH++G0WpjFsvpinoO2u+rcj+DG83ypWFTevb626IsFfxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4231


On 21/08/2024 22:14, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 21/08/2024 13:25, Ayan Kumar Halder wrote:
>> From: Penny Zheng <penny.zheng@arm.com>
>>
>> Introduce CONFIG_VMAP which is selected by the architectures that use
>> MMU. vm_init() does not do anything if CONFIG_VMAP is not enabled.
>>
>> VMAP is widely used in ALTERNATIVE feature to remap a range of memory
>> with new memory attributes. Since this is highly dependent on virtual
>> address translation, we choose to fold VMAP in MMU system.
>>
>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>> only support in MMU system on ARM architecture. And ALTERNATIVE now
>> depends on VMAP.
>>
>> HARDEN_BRANCH_PREDICTOR is now gated on MMU as speculative
>> attacks are not possible on non MMU based systems (ie Cortex-R52, R82).
>> See 
>> https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability.
>
> I don't have a strong opinion on whether it should be split. But I do 
> agree this deserves a bit more explanation.
>
> Also, as I mentioned before, speculative attacks may be possible on 
> non-MMU based systems. In fact some the Cortex-R are in the affected 
> list... The R82 and R52 are not listed, but note:
>
> "For information about any unlisted processors please contact Arm".
>
> So how about the following explanation:
>
> "At the moment, the users of HARDEN_BRANCH_PREDICTOR requires to use 
> the vmap() to update the exceptions vectors. While it might be 
> possible to rework the code, it is believed that speculative attackes 
> would be difficult to exploit on non-MMU because the software is 
> tightly controlled. So for now make HARDEN_PREDICTOR to depend on the 
> !MMU.

This makes sense. However, I think you mean

..... make HARDEN_BRANCH_PREDICTOR to depend on the **MMU**.

>
>>
>> Also took the opportunity to remove "#ifdef VMAP_VIRT_START .. endif"
>> from vmap.c. Instead vmap.c is compiled when HAS_VMAP is enabled. Thus,
>> HAS_VMAP is now enabled from x86, ppc and riscv architectures as all of
>> them use MMU and has VMAP_VIRT_START defined.
>>
>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>
> With the typo pointed out by Jan:

Yes, I will use HAS_VMAP.

  I will update the commit message as below. Let me know if this makes 
sense.

```
xen: make VMAP support in MMU system only

Introduce CONFIG_HAS_VMAP which is selected by the architectures that
use MMU. vm_init() does not do anything if CONFIG_HAS_VMAP is not
enabled.

HAS_VMAP is widely used in ALTERNATIVE feature to remap a range of
memory with new memory attributes. Since this is highly dependent on
virtual address translation, we choose to fold HAS_VMAP in MMU. And
ALTERNATIVE depends on HAS_VMAP.

At the moment, the users of HARDEN_BRANCH_PREDICTOR requires to use the
vmap() to update the exceptions vectors. While it might be possible to
rework the code, it is believed that speculative attackes would be
difficult to exploit on non-MMU because the software is tightly
controlled. So for now make HARDEN_BRANCH_PREDICTOR to depend on the
MMU.

Also took the opportunity to remove "#ifdef VMAP_VIRT_START .. endif"
from vmap.c. Instead vmap.c is compiled when HAS_VMAP is enabled. Thus,
HAS_VMAP is now enabled from x86, ppc and riscv architectures as all of
them use MMU and has VMAP_VIRT_START defined.

```

- Ayan

>
> Acked-by: Julien Grall <jgrall@amazon.com>
>
> Cheers,
>

