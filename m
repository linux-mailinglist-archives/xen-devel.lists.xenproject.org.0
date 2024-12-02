Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E34829E072A
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 16:36:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846730.1261883 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI8TE-0004hJ-46; Mon, 02 Dec 2024 15:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846730.1261883; Mon, 02 Dec 2024 15:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI8TE-0004eX-1I; Mon, 02 Dec 2024 15:36:20 +0000
Received: by outflank-mailman (input) for mailman id 846730;
 Mon, 02 Dec 2024 15:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e8Bi=S3=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tI8TC-0004eR-LD
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 15:36:18 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2009::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2b4dbed3-b0c3-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 16:36:16 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 15:36:12 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 15:36:11 +0000
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
X-Inumbo-ID: 2b4dbed3-b0c3-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaNsm1KStYnGabtyuBW6saMRkySODJRv/e1pPKRzQcSk5RIKwz6RVNepCjATzFCyrf41r8W57dfEJYIXTmb7uaWTySbG3R88Q7A7YmMbpB5hGeH4TQ0+mfAOVTmtuW49a+4OOt1XvNkCD+IEjh0wKo/ytzIUHzBteVePSctzqv8MCLZBNAl7qvhEsHuzUIM/uPf7AU2eqsv4oMU0od8oX+E+sFVgqn7HmLvbbZrp+gmOSBcoaARXdxyes3b8zUY8O5/EKtEuWKC10zRCdKiTayVeG1mccnJOgTS6zt6D13k9jLtUNvQAsFnQURjpAZDnDgbRMYuLOVZBtRGx8sKNdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGQL8XVivSmIqhJLIGJN3hPvdiz+GNNKZi3aRNbCIt8=;
 b=ZKoohSuhJpQYG2Ac0C6lmJ7swQyP93e0fZWhE4jAk+uABrObu2//ZMFzD3VxRcT4wePqcWwYTPfrdXHjRJWnzk7czWR8iobtotU6+t6M1NajDf+176q4hxBNtZOgkUSs4k9CfZVsRVaNwXD0QaAC4BsDIKJgIM1WceN5X33md/QWT9+wpk7JIj1nhyDqddIblNlkRrbDvqL9fAwWOLvq1OmjY4z+8P5MNTgFFuKboOh94A+fWNXOms/W6SHoz9UbXT5zr618kSITrhvscHRua2mpal91xenoFeqi1aoAY+EmaTxSiutRiMcUg9wcXSu7onOAoXccySf4K6NKQdNRMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RGQL8XVivSmIqhJLIGJN3hPvdiz+GNNKZi3aRNbCIt8=;
 b=bRROMRm2x1VyZuUGvZa5pLPg1NaY93J0RGuWMQzy5vrsGKjKLGh+UrvRQDyA3C5EoRErOtkV1v92LdfiK2P8TNkbur60K9QalDRi/E2DlNNW4/aOzWOM4Rd5NrhirJmn9fgjHcNXt8fWr6AR3n+RGs6kqEIZE0aTTgGbluU6Jcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <3b29ca45-3df0-4853-88ba-f2138909daa7@amd.com>
Date: Mon, 2 Dec 2024 15:36:06 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] xen/arm: mpu: Create boot-time MPU protection
 regions
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Luca Fancellu <luca.fancellu@arm.com>
References: <20241118121250.4027441-1-ayan.kumar.halder@amd.com>
 <20241118121250.4027441-2-ayan.kumar.halder@amd.com>
 <4521597b-2714-4ec2-8e80-d90dfa84ce99@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <4521597b-2714-4ec2-8e80-d90dfa84ce99@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PR0P264CA0140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::32) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 969a0327-e012-43ce-aa45-08dd12e70c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UE4zd0J3bisxSnEvRGh5emRndUdFV29wQVNGVHo2N2p5WTdCYThGMWtCbllS?=
 =?utf-8?B?NGVIK2dMeGE2c2xTWkNMWFFFSnltZ3lUc3V6WGc5dnhmU05JUzk3WHZaY3RW?=
 =?utf-8?B?TXRQZFVtRDJPeU1oTkQzQkhLNzBiSkxyRHBIMi9pWnh0NGFUd0VIY215Z2pl?=
 =?utf-8?B?c0RvV0dPcjNOREI4SGpLN0JXNnFwUWhYdkFYUmRxdlIyN0NSTm1ITDgzcVNm?=
 =?utf-8?B?RDIwVzkrbStGZXdHTEZHSzJKWG5GVmdBOHNEUU9YS05uUDBRelBtdDk0c0Qr?=
 =?utf-8?B?bXFrc0ZKYU0xYXVpb0ZqOUxVOVBuWWVRQ1JhL0pTbVFRL2t6ZG5mcjhQaXNC?=
 =?utf-8?B?SHcvVWloUG1EMzFJeGY4aG5aaSsxZC84ZVA1WUoxU1BoUlRkaE5RQXdHTXBT?=
 =?utf-8?B?VXVodVpWQkhvYWh3L3lkUlZtNEt4aWYvd1ZHRXkwUUhWSU1obXY0R3pOWHhC?=
 =?utf-8?B?Zjd2K3lpRDFPdzBZbDRzZ3BTU053Y2U0MjRSRnZ4TElPc2MyNzdYeHRlSzR6?=
 =?utf-8?B?UndDWGIwMFdwU1lPRWhIb21ZT2RFU240Y1Z3M1NFcHY2ZGZCSE91WkFhd0NT?=
 =?utf-8?B?L0p4aVZjNFpZM2xtTkgvWmp2QmZFNCtiZzVET3RtZi96TGlHc3ZzYU55MkhZ?=
 =?utf-8?B?SzBFQlRpakNCY1FsTlpBNjNJcEZEQWZKY0NvR09pa2YzMi9YaUMxdnJTdUdZ?=
 =?utf-8?B?eUJVSUdIMzN6M0RUZGFUTEZVL3FNMjlsbnRaVExqaHNIallkUkExaXJuRVV5?=
 =?utf-8?B?RmdFNUNadnF0UHdwTXQwa3J2dVo3L2Qzc3RjVHdJOWdqeHhTZloyN3BRVHM3?=
 =?utf-8?B?dmVPdFVDWWUvL2w1enM3aWRpWnBjbGZJVlVVa1RCN2tOczBVL2lncmlFMVFy?=
 =?utf-8?B?eVVtNzBOU0JTR0xwZ29HaGdxdDNHcHVJOU8rNHhJWUFaemNTK1hQUlVncWxq?=
 =?utf-8?B?NGJwUFlyZjZuZXdkN3hVZjM1Wjc1MkFsZ0VqS1E4NHBuTXE2R1Eya1hGbnNI?=
 =?utf-8?B?WVI5bGw0WVpUVjN6U3NTWGErc0pMZGtvM3ZCdVNmenpHY2Rkdkh6SDgraS9L?=
 =?utf-8?B?eUFIaEVCaTR2aVBYaVpiVzJ5bkhQa0NTS1g4T1U4MXJlb2ZDQnNKdmgzRm01?=
 =?utf-8?B?UlhPWWYxSlZmclRCaUV2YVZuY2l1T0Z6Yytacmt3MUxUNEIyeFI3clNYbldl?=
 =?utf-8?B?Z2N6Q0pEeDhHdEREdGIyaXBvbUNIOG1kVVlvTGEvem5uWHVmTUdaTFBOZnhO?=
 =?utf-8?B?UnNFZDlSMnFZbjBobnpSaDVjYTg3MHhrTzR5SjlWUVMyWVcvSmtYUGx3dWMv?=
 =?utf-8?B?RWU0NXlnaTJBK0lQdURZeFlPVkxCQ1oxRFpyaG1zUmhTVjVNZmtQK2pGS3pj?=
 =?utf-8?B?VUhPVHdNVzdqbHlsN0FxTVZlVUZUQklISG9YeTAyTVE0OGRXcExjRVhSaXlj?=
 =?utf-8?B?K1dvM2xVTWFTVkh4ZFdLbHZLbjVWYjR0aDN1Rm12SDdZcWNUMkVsUzVOemZC?=
 =?utf-8?B?SmtBVk9QREZWQnBtVHVmZWpLcXFNdjhnQXBUQmcxcFBsRUpJdzB5bTJPZTZT?=
 =?utf-8?B?SDl3WS9DSDE5RWtEamtNa0dPbWVyeElSK0RrY3lhaTNJdHBuN0p2citrbHJ6?=
 =?utf-8?B?bngwS1IxdGlYaDR2UjVrMHVKT0IzL2hyTTJBbG8yV1k0ZWJyVUJ6QVFEczdp?=
 =?utf-8?B?eVA0cWROMFEyeUE3OGJrQUFPQ3hKamVpaG91ODBaNmRZYnVhWUVsSmVIRFc1?=
 =?utf-8?B?R1AvQXg4YmVDQjNzR1VubjBMZTRTNXhHU20wckNxd1BndmE0VWRqVm4yZUhK?=
 =?utf-8?B?Q05JU09iQmN0Z2dVb25CZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlowZkZ3T1o1YnJnL0dRMjFzNXJWL1ZBTzB1OEQwRzdBYXp3VytYeDE1OGl1?=
 =?utf-8?B?RGF2QjlEMDMxRVUwMzZTclhlLzg1eU1kSGxkaUx1bHR3bENpcXh2ejZpVkRp?=
 =?utf-8?B?YitJNTZZWDREMUhMdkpvY0kxcGw4TitmYzJsK3JLRm8vNGhtUkxhOUtURm9L?=
 =?utf-8?B?SXdjMGRYb0duR2Y4ZUd1ei9OOHozUVhXYjJPUW16YUphaUpsWG5HOWlEb2k0?=
 =?utf-8?B?YVFMZk5iTmFvdGI2aGNGZmVYcEdXRWZTWmNaQ3hIUDlMOWZPZUxLSURiM1Ro?=
 =?utf-8?B?TlBmOWE0RGN1QzZQOTB4U2hYaUxmNjgxVDkxL1NjSk1pN3p2bGY0SWtvbFpz?=
 =?utf-8?B?Vkl1Ny9nZDVKeEZmNGV2bGZsWkczOFJ1R0pYcWFsRDcxclpPNE81d20xK2JH?=
 =?utf-8?B?bHlUdk84SEJ4a3ZpWkJnSlZUSUN1RnAwMzFZVEo1K2xwR29JRmVZUnpDcC82?=
 =?utf-8?B?WG1xWGpQN3lhbzc1SVpmTXpBTGsvNDF5M1lpdTlSRDEyVDlET0lOL3VnaTF4?=
 =?utf-8?B?OTgyMm8ybm9mNDFiSytTNG5wTXNOQWZzd3hNd2JjbjcyV2xIaFJNWThtWFRU?=
 =?utf-8?B?MVR5N2FQZmhQd1BlMHRQc1ZXUitqV21sZG9vMUM5aTBQVTlSaGUxb24wQmxV?=
 =?utf-8?B?enhaODlOeXVkUjdpTkNMR0ZsOTMraWhYLzdvWFdJc1hxbXhOMW5takNmWkgv?=
 =?utf-8?B?Z3I5anRORXpEbm5YTEEveHE5SGlMclViVit6cEI5V1pnV1RTTjFFdHBEOHJP?=
 =?utf-8?B?NUdNRThxZjVBQ2pzc09sUUhaNktkTmtlS2x3M2R3c3p0Mjg2ZVFBM3hHN25L?=
 =?utf-8?B?S1NJMjVLWklxYVUrZkRMSmI1NzJRUnRpelY3N0VSMTZEd0VXLzVDZndkWFJ2?=
 =?utf-8?B?N0NPSzJOM2tteFdtNjdlT0JkZ2FwV3ZPZjhuaERxblFGdGphelB5OG1yaG5D?=
 =?utf-8?B?Q0gwRng3dWhLZ1hvQWxQMjRGZ05YMnlrckRDa0YrYkRURlkxZ1dSRWcrOEJu?=
 =?utf-8?B?WER4YkdQRk42bmVBdDRrKzFWUFBxcWZTeEs1YXJQYURKbkwxTFowVjRWZG5Q?=
 =?utf-8?B?UjdVZVd0L0VJMXFnMVpxVjB1VXVoQmhjTkp3eHdtWS8vRndtT0xrWjBlejgw?=
 =?utf-8?B?U3h4akFpSDI5NnRCY1o0Zk1SUzhZVS85NEVCV3ErWDZ5VDNMODNXQXpmRlp4?=
 =?utf-8?B?Y2JnTmxVaHdqMHZCWjJMdnJKUEtMN1MydXVXZlpjR0d6T2liUHNWOVNsTnNO?=
 =?utf-8?B?UW9ScVd4OGxCNGk0WlNiajZ5dHdlZ2xUbU02cGlETGxvN29NU014TldmSGlw?=
 =?utf-8?B?VWdXbTZjeEE1R3JJNXlVT0tXZCtFbHpsTis0d1VxcHBNajNvRWtzNnc3U2t5?=
 =?utf-8?B?eTdXaG1CWXZOcmJLUDhqQ2NValkzN0xGV2ROQWtDTUVMTG1zRm1sSFhUQ055?=
 =?utf-8?B?K2FrZlVhS3J0WkZYR3o3K2lQenZTOGlMOENLUkY0VW5QK1ZVWE80dHJXNUJq?=
 =?utf-8?B?VGpkU3Bob28zZCsrQ1J5ZVFGSVdSY1pGMnB6aTZqWTFTNFpjNUFiV0JmRk9D?=
 =?utf-8?B?UVFVSWxHd1JQV24xNGErUzE4SWJ2SG9KLzZYKzcybjdUeDNLTWozc1VPTW0y?=
 =?utf-8?B?L25TRVQ4Qks4ZE9hSkM3aWNNdEZ0Vm16MXB3UTRaVUlaQmJIOWdpWHIydFBC?=
 =?utf-8?B?YytwZzlLZjU2LzA0TWJvcCtia1BOOFdpVnFYNXl1N250VjU4OCtjK0d5dHRt?=
 =?utf-8?B?QTVMUlZ6K0ZJOG5adlMyeCtobzNCQVd6dVpPUmtQTEk1b0J0bmJLVFNNd05F?=
 =?utf-8?B?ekhDUzhRQkpkOWowNnAyek43cDAwSXpVNGc0eU9nRDBBc0Qwa0RYRkt5R2d5?=
 =?utf-8?B?UmNtUE9PUWNTakRHb0crUG5TVFJXZ0RyOCt5KzBMbWErSGhYajlFRmw1b2Zl?=
 =?utf-8?B?eWlXY0p1TWdsMmFQcmovSTFjMmMySmFpdFhMNjdQL3gwSEVueHl2VFZCdXJu?=
 =?utf-8?B?SDlXTHdPcS80Zks3c056NkRsK1JLUjU5WCs5VXFzMXFTa0Z5aHQwQytLSURq?=
 =?utf-8?B?VENvUWdUUmNQVHRlcWRNU1BrVHhVSlFDVWRQY1ZqYlJGWm5Vb1lnd2lMZGVw?=
 =?utf-8?Q?ZpLnvGkJXYt0bOYgIK07YAmne?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 969a0327-e012-43ce-aa45-08dd12e70c8b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 15:36:11.7514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9jLq9ZzzQ+EZp2Rd7uX4FCn4xp29FaVdJNlAy6dIoDbhzzFHK562knyg+czxujygdymO0+20K4DZAjZ4PjTUqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556


On 30/11/2024 17:45, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 18/11/2024 12:12, Ayan Kumar Halder wrote:
>> +/*
>> + * Macro to prepare and set a EL2 MPU memory region.
>> + * We will also create an according MPU memory region entry, which
>> + * is a structure of pr_t,  in table \prmap.
>> + *
>> + * sel:         region selector
>> + * base:        reg storing base address
>> + * limit:       reg storing limit address
>> + * prbar:       store computed PRBAR_EL2 value
>> + * prlar:       store computed PRLAR_EL2 value
>> + * maxcount:    maximum number of EL2 regions supported
>> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_DATA_PRBAR
>> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not 
>> specified it will be
>> + *              REGION_NORMAL_PRLAR
>> + *
>> + * Preserves \maxcount
>> + * Clobbers \sel, \base, \limit, \prbar, \prlar
>
> Per this line, "\sel" is clobbered. Which implies the caller cannot 
> rely on the value. Yet ...
>
>> + *
>> + * Note that all parameters using registers should be distinct.
>> + */
>> +.macro prepare_xen_region, sel, base, limit, prbar, prlar, maxcount, 
>> attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
>> +    /* Check if the region is empty */
>> +    cmp   \base, \limit
>> +    beq   1f
>> +
>> +    /* Check if the number of regions exceeded the count specified 
>> in MPUIR_EL2 */
>> +    cmp   \sel, \maxcount
>> +    bge   fail_insufficient_regions
>> +
>> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
>> +    and   \base, \base, #MPU_REGION_MASK
>> +    mov   \prbar, #\attr_prbar
>> +    orr   \prbar, \prbar, \base
>> +
>> +    /* Limit address should be inclusive */
>> +    sub   \limit, \limit, #1
>> +    and   \limit, \limit, #MPU_REGION_MASK
>> +    mov   \prlar, #\attr_prlar
>> +    orr   \prlar, \prlar, \limit
>> +
>> +    msr   PRSELR_EL2, \sel
>> +    isb
>> +    msr   PRBAR_EL2, \prbar
>> +    msr   PRLAR_EL2, \prlar
>> +    dsb   sy
>> +    isb
>> +
>> +    add   \sel, \sel, #1
>> +
>> +1:
>> +.endm
>> +
>> +/*
>> + * Failure caused due to insufficient MPU regions.
>> + */
>> +FUNC_LOCAL(fail_insufficient_regions)
>> +    PRINT("- Selected MPU region is above the implemented number in 
>> MPUIR_EL2 -\r\n")
>> +1:  wfe
>> +    b   1b
>> +END(fail_insufficient_regions)
>> +
>> +/*
>> + * Maps the various sections of Xen (described in xen.lds.S) as 
>> different MPU
>> + * regions.
>> + *
>> + * Clobbers x0 - x5
>> + *
>> + */
>> +FUNC(enable_boot_cpu_mm)
>> +    /* Get the number of regions specified in MPUIR_EL2 */
>> +    mrs   x5, MPUIR_EL2
>> +    and   x5, x5, #NUM_MPU_REGIONS_MASK
>> +
>> +    /* x0: region sel */
>> +    mov   x0, xzr
>> +    /* Xen text section. */
>> +    ldr   x1, =_stext
>> +    ldr   x2, =_etext
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_TEXT_PRBAR
>> +
>> +    /* Xen read-only data section. */
>> +    ldr   x1, =_srodata
>> +    ldr   x2, =_erodata
>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, 
>> attr_prbar=REGION_RO_PRBAR
>
>
> ... you will pass x0 (\sel) without any update from the previous call. 
> So effectively, you treat \sel as an input/output that will get 
> incremented.
>
> Therefore the comment needs to be updated. Possibly to:
>
> "
> output:
>
> sel: Next available index in the MPU
> "
Yes,  makes sense.
>
> I will commit the series once we agree on the wording.

Yes, agreed with the wording.

- Ayan


