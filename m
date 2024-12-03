Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B89E1DAA
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 14:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848022.1263033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIT39-00067I-SP; Tue, 03 Dec 2024 13:34:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848022.1263033; Tue, 03 Dec 2024 13:34:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIT39-00064l-Oo; Tue, 03 Dec 2024 13:34:47 +0000
Received: by outflank-mailman (input) for mailman id 848022;
 Tue, 03 Dec 2024 13:34:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rmlv=S4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tIT37-00064f-VQ
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 13:34:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2417::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a371c15-b17b-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 14:34:43 +0100 (CET)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 13:34:39 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 13:34:39 +0000
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
X-Inumbo-ID: 5a371c15-b17b-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNLS6+04Iy+CzbU9VHxnSI+FSkragwCET4kDDuh2guDptIBiz5tyNEUAi1qMbHBQSGAqfwHrpWT6EczlyBNcMygZsALtTD2n6I+AW8UbOustom7QqY9WwIjqsRPvBwrqZz0XrOGnaN1fgZMgHJCFIYrW/JrsszrgT3nRDt3cYygU8IfiEyazRVpcFY7rzMUhVWJKamBAWArxBOranVDMTiKVjcjJkchxYvPRdM22Y/6ElSbUPFcjzN8jbJLa1s42hDqzlot1d3/2nALgqSY6is1APUtgrHLtpGbgJqjeh5eoVAV1kSwyQinNgF2SQFuHCN3JXrB+/hvawFT6SI6gnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xw/MM0N0dOAzwKaqMDkHInXxh8ufqcWtVk0U998Z5M=;
 b=SSf4k3NBJeMdSVS4lvrIZRUAJKycgenNikl6QPyxmAf1bM1Z9gAq063TKUQRbikJwsYQgdpYURphU1mYOBsQk+Yr9sG3RsN/shBMHJDXlYRNtycO28j1o7KEoeL6RmHfp/FSSfmsJ2FLL+o8lFr79LwD8FOiMlu5dMsP82oTG0pTHpj0q2xrUZwy8R7Sjvut7Xo/e8ebP5Sfkjmx4x8juz3Nv3mlp8GkZ3KdJA9q82Gp7gSuK/IgE+Y/CFegXVGgNaz4bT7GXKH3dEkuh7+DvvnsiyY+9k63AMsSGpVLTMVpEVJoZJ9XagFEK3pII97KQB/Dm8OVJnf8qmxLtEfjNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xw/MM0N0dOAzwKaqMDkHInXxh8ufqcWtVk0U998Z5M=;
 b=TqpCUCjATdRgvZvp+yvRO2bs47XZKs7yw3dcSFJ12Q+EVRdQSdm1hXXumU+lpUm/bd33mrflKhAJCBXRX/Ru01TNtT/tEINHSWRo+B1FTQgRRmipCQIhpwZOeh1xK9LUJDmlIvkQYCaSsiwe5eTpNPVoS7px9ekTqFQv8jxwrLI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <41114d52-b618-4692-87f5-94de4b7ddeff@amd.com>
Date: Tue, 3 Dec 2024 13:34:34 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/mpu: Map early uart when earlyprintk on
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241127183906.485824-1-ayan.kumar.halder@amd.com>
 <20241127183906.485824-2-ayan.kumar.halder@amd.com>
 <c44686fc-f4c0-428a-8a3f-ce17a7c589ae@xen.org>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <c44686fc-f4c0-428a-8a3f-ce17a7c589ae@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::9) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 17a6e625-1909-40df-fd31-08dd139f3c7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VW9aeXZkRXlVL2NKS1o1UTVhRjlEOGduMTVqNVg5WEl6UFh3OVd6dzU1Z1Vy?=
 =?utf-8?B?RFo4MWxaTmlJazFiT1dvK1BoMHNvUURIcldZcmRuRWpSNkpoZ0ZRZjZYckwr?=
 =?utf-8?B?TVdIQWtKT2xzZlZ6VlNHOGs5TnUxWUZ6UWYxaTFiakJQS3EyK3kxTXVqcFFM?=
 =?utf-8?B?cVdHUXdPTk1CZGJxekhRQ3ZWcEVwM2hteVk1R2xjd2pXSjRoTGovTjVRZTFJ?=
 =?utf-8?B?VjJvb2xmYTJsalJ5d2llQldRbnFZaVFvTzRJeEVQN2JOZnEvOFhueVcvVTR6?=
 =?utf-8?B?N2JSbDJLOU9xbmt5ampESlY0enBGNTlNZXM2OGM1U3hWd0IxcVgrd3NZVHVw?=
 =?utf-8?B?UWxSRXc1UTlCenBKUTMxL3BTbGFtRmk5MzFOOUhiRE1MZlcvTGRhL1Z6WVBt?=
 =?utf-8?B?NGR1UzlxWElTdDhTcXdUL3p2S09YbGkwYjZobFBPaFZnOFkrVHdjb0ZNTGFX?=
 =?utf-8?B?V2Yxck9KSXpWWUJyNXR2TVUyT0h2VzFjVmFURUFvZVRZUUxmREJiSmpPQWRH?=
 =?utf-8?B?RHljemdzQ0t1ckY1SmcvVUVvcUJFbTJPZ1lkS2VRemgvSjhKSThxN3h1bVFR?=
 =?utf-8?B?QURFVXhpNUlJK09MRTBxdThzWDRtaXEyYUJIRGJiQ3F2M28yV056UCt5SGdK?=
 =?utf-8?B?WC9ORW1WZkxlK3NWakZyQzNWZ3BSbXNNWStaWkx6TTZ1OHNjbmo1Z09CZmRN?=
 =?utf-8?B?RlNPT2dhOEFVWGJMVGdjVG5Pb1hpTEg4amVkdVZtb0c5TktPN3pYWk1CdDha?=
 =?utf-8?B?b3dZRmtXOEJVdGdrWjRnOForR3A5N09UQUY2TVhPc08yKyt3Vnc5OTQxeGdr?=
 =?utf-8?B?MjhVdzRzck1XbXRzU0V3STdCY1BuOVpTZHdGMFJFSHVwTVB2eFQvczcxbFVO?=
 =?utf-8?B?ekZCNXMyL3Y2NGF0a0tLSzRkZHI3eVNuVHdxWXYwcUZCOHNIUGhJc3VBcmNR?=
 =?utf-8?B?VlVnVndoRE11TGdFdVNBNlU2UEFKNVY5SDBray9vK1lJNTBCWVFQZEh4dUVy?=
 =?utf-8?B?WkZKdWRPY09WRExjaTdMVThHMnM4ZVpXWkZYUXhhcCtMWHJCZXpKNFJzUzNy?=
 =?utf-8?B?YUJrMEcycTkzdjFBVTBEZElESWxoUUJQbzBtck1lNHpSaFNMVTBKcVZoSWxP?=
 =?utf-8?B?UVRZNy96RjBna29JVXpnbkl2b0FHM1ZYOFM1MjRCQ1RaTERYdnMwY2t0bk41?=
 =?utf-8?B?eittbzlUcFhGU1h5RHNueklhOVY4L1EvVG9FWUNVNGVQN0NSMTVJNVo4VTRr?=
 =?utf-8?B?czhRcE9VRndmQUVVTmhTdUYvajAzeE1UdkNHY2xhQzNTMzFyUHhiTllScDUy?=
 =?utf-8?B?ZDRtYnhiOU16clk0aGdGUXlNelFabGF6VHU3b1h1S1JBTlJzM1dZWGl5WFNj?=
 =?utf-8?B?ejlYK1FudzBtSU5rZ0k5cCtub2d4R1RjTC9mYm1IQ25hLzRqbS9KV2o3d2xp?=
 =?utf-8?B?cWlYNWQzV0U1bVl3alp6YzMrYUVFNENuVW51enZXdDk2NWprd0tuVmptNzVW?=
 =?utf-8?B?Z0d3QVhrQ0RzMEVOTkIwYzZRLzN2VGZjb1lKTkd4SllhY2dTM2pQVkNaTmNi?=
 =?utf-8?B?dHBrZXd1M09oT2lwZFNES2ZZZjNzcWZFQ1pnbW9zZ3pwYUYvWFlFNzZUOFBD?=
 =?utf-8?B?MGgzUERoWWREaVR1NEpGUjVaalAyMnNIYllsNzNvdXUrVDBQdmVLSmdaZ0V5?=
 =?utf-8?B?TXMrT24vUnRkL1ZIbWJUeXpOUDRHVU9jcUJ0OWZFUVlXTzNXTWtsUXp0Yk5K?=
 =?utf-8?B?UjF3eFJYNlpaTFlkbmRyWW9iSDdvamQ3ZWF6ZDNYRWVMblBpMVpIek1iRnJQ?=
 =?utf-8?Q?MYZ9xRVC0DpXOX5gVL2vYPKwT05ky/RGwV/DU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTNmOWE4U3J3MnVaTFM3cEJ6NmovNWNIU1JubG5rbFBoWUdXVVZaV2YwVFIw?=
 =?utf-8?B?MDJCVTVlT2l1dk1BQVFmblhncUNoWkk5RjNwUVdIVlNqTmJKQlZSMGhLQXV6?=
 =?utf-8?B?OWpoUUd5dC9maVlzLzUxQVlvVklwYm1nRGQ3bDJyOHcrakVWNEVoWThhSlBu?=
 =?utf-8?B?b0hONlNPVXdodmpiQTEzSkhqZUw1WkQwZnd2S2pxaFl2bis0ZFFyYnk3Yy8z?=
 =?utf-8?B?OXVOdmt6Nk9XT0ptWFNkM3JZUEhQUERQWDNKdEFEMWZaREdtQXJWNTBGWUZF?=
 =?utf-8?B?eElOKyszS3I3Q0tncUFEcDVrY3JVU0ZTR2NURXEvNzhVaThSZ2FWeEtmcC9Q?=
 =?utf-8?B?ZkswY2taNVJTSElyV3BvaUFWUzBMOEs3dnUzTGw3dXpRWGZGNEkySi9UTEcz?=
 =?utf-8?B?TVp3cWp4NFUxVXF6dzNOSko3UGZ4d3pCUnIzeGw0NmpQS3lraW1JQ3o5dGpD?=
 =?utf-8?B?ZVR1RlBZeVVaSVdraTN1R2wrVWl2dndBQ2V6eDJCZDYrUmkyOWE0SzFMejNL?=
 =?utf-8?B?UWxVVDgwdlpXSkNyUVBwdTVabm90VmIxZkkzYis1SzdYUGpiZ1VUN3FUTWZu?=
 =?utf-8?B?K1ZZQmhrTmZSbXNVajJnUm9sWjlFampjZ0FsMVdWSjNYbloyTmVhYkhsYzlv?=
 =?utf-8?B?blhYM2NLcnJyYlRCTUR3ekNMTWljNnhRUDdIUFFQT0tPUllJQU9FdHRINmZD?=
 =?utf-8?B?N2lRVkl2R3Rpd21jbUpVTElQNXNHRXdVTmFPRURpalQxZDdYTUNndStvWkFW?=
 =?utf-8?B?VCtpZnpkZE1Xa1hpOFpXYnVBeVhSZEEyRGdhVDFMRmtiOEtUd2wyNzgyVDVi?=
 =?utf-8?B?UFVNZUdxMjZ1SURmVTRvd1RBV2FFb0RLMHNzczh5TDBjU29NUGZQbElwMjdt?=
 =?utf-8?B?eVRjRnRpcWtXSUVFTUk4ZitPMjZ5WUI2TEFHN2tGcVYzMlpsMGVXZlVqTWwx?=
 =?utf-8?B?MnM1ZnpVMFBLbCtrdFUzTktCbkZYZjdmY2xoeWYvendxcU9EOEdqUGlDZVVO?=
 =?utf-8?B?eEJaa2ZSK2xPZmIrUXFiMkZ0aFFWODJJVHFVY2g0NHlrejgyRTVlMGdOOE94?=
 =?utf-8?B?bEdrbzhmYm8reElkWW9QalNlY0dCUlBJa3lrcldWek5xVE1YbWhvU1gyNTJI?=
 =?utf-8?B?cUI2elNBYlBXeTBQeEl6M1VacEdDMVVxU3huYjJvK2ZISWliUi9LTzNQOUpU?=
 =?utf-8?B?blBzN1U3Ym82Vm5MN1lhMngyZ0EzTXpRdUhJL3RKTEVxS0tIUU42dnhMZEJC?=
 =?utf-8?B?N28zUUoxQ0JtN2R2NWNSRXYyakl3RDVoemhTNXAvamVZS29JMmlrZGs3aU9v?=
 =?utf-8?B?eGszT3YxOGVQTWplSVBEd2k1S3RuZVo3d1hqeWsvaGZBQzRZNnd1RjBnZFp5?=
 =?utf-8?B?WjQxOWUxZzNwcHpnd056c21HWithWjV5cE1uMy94WjV6amZKWlVZczlVb3lC?=
 =?utf-8?B?M24xbHc2V1graXdQSWhiZVZMalFKa21VazlhTkJ4ODVlNWxVQ1V5bXdkL2NL?=
 =?utf-8?B?bTdhVjNDcUxFUE5USXU5Yk15ZjNoNHowcU1BeHBtRzJoaU9GKzAyazIvQnMv?=
 =?utf-8?B?anNFS3BHY0Z3UmtMY1Fkc05majdwSkJUY0lScmlSVndoQUttV0ZzUEVqNmdC?=
 =?utf-8?B?TFc0VzdzNEFJL0F3SGFESGhsMExHVmQ1cnZzYy90K0o2WkRRM3c4VXFIUHFq?=
 =?utf-8?B?RUE2LzlDSlhkdTdMb29EQWc0VE05NXhUM1JhcVpyaW5FT0JnTkNwdjNMeEp5?=
 =?utf-8?B?clg4S2tsbGNIWDllU0pkd013QXJ6aVBtTTZpZ3BRTk5PVmJ0Y0NRUlBQd3BQ?=
 =?utf-8?B?dGFYcTM1aWVBNjh0alc1aUZFYzJBdENDeG9wcVkveG9Eeml6akllY1JxbzVi?=
 =?utf-8?B?N0F5bEwzUjU3ek9TeWxBd3hvYlorWTZJbGQyU3p5ODJMejdBYW50b3BCcncy?=
 =?utf-8?B?WjVSNjdNVElRcGcrbnhsVmEycFhEYkkxbmFIKzZPNjNHc1k5T1FjMjgyVEwv?=
 =?utf-8?B?TTlIcm9pdi9SNGVKcFRGZWh4SUdSYUltZGhwSzU2djRjRDFZaVdmZS9HcTJK?=
 =?utf-8?B?OUVQQ2JaTFk2MEFiNm5MYUNiaEw2RnVKWTUrYTBSVHVGN0NwZnI1VnltQ3dx?=
 =?utf-8?Q?kSuymdz7BcL3+V34Oif1/UUEh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17a6e625-1909-40df-fd31-08dd139f3c7d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 13:34:39.5152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s/YTA0QDKyl4aC5npmT025857WHC/eNZi+Gic497DQYovmZWCXd4iQcllVs9/BEiSyUhNu1HQkUbEjWhsCL7cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409


On 02/12/2024 20:53, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 27/11/2024 18:39, Ayan Kumar Halder wrote:
>> CONFIG_EARLY_UART_SIZE is introduced to let user provide physical 
>> size of
>> early UART. Unlike MMU where we map a page in the virtual address space,
>> here we need to know the exact physical size to be mapped.
>> As VA == PA in case of MPU, the memory layout follows exactly the 
>> hardware
>> configuration. As a consequence, we set EARLY_UART_VIRTUAL_ADDRESS as 
>> physical
>> address.
>>
>> EARLY_UART_BASE_ADDRESS and EARLY_UART_SIZE should be aligned to the 
>> minimum
>> size of MPU region (ie 64 bits) as per the hardware restrictions. 
>> Refer ARM
>> DDI 0600A.d ID120821 A1.3 "A minimum protection region size of 64 
>> bytes.".
>>
>> UART is mapped as nGnRE region (as specified by ATTR=100 , refer 
>> G1.3.13,
>> MAIR_EL2, "---0100 Device memory nGnRE") and Doc ID - 102670_0101_02_en
>
> I can't find the Doc you point online. Do you have a link?
https://developer.arm.com/documentation/102670/0101 - Cortex-R82 
processor TRM
>
>> Table 4-3, Armv8 architecture memory types (nGnRE - Corresponds to 
>> Device in
>> Armv7 architecture). Also, it is mapped as outer shareable, RW at EL2 
>> only
>
> I don't quite understand why you mention Armv7 here. 
Actually I was quoting from Cortex-R82 TRM.
> The code you modify below is 64-bit so Armv8 only.
>
> The code itself LGTM.

Ack.

- Ayan

>
> Cheers,
>

