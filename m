Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA88A89EF4
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 15:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.953897.1348288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4g04-00034k-DA; Tue, 15 Apr 2025 13:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 953897.1348288; Tue, 15 Apr 2025 13:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4g04-000323-AZ; Tue, 15 Apr 2025 13:06:52 +0000
Received: by outflank-mailman (input) for mailman id 953897;
 Tue, 15 Apr 2025 13:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jTwS=XB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4g02-00031w-Ek
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 13:06:50 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20603.outbound.protection.outlook.com
 [2a01:111:f403:2406::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ce0785f-19fa-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 15:06:48 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.21; Tue, 15 Apr
 2025 13:06:44 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%2]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 13:06:44 +0000
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
X-Inumbo-ID: 7ce0785f-19fa-11f0-9eae-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tLzawVvbUTLmV3G/TEV2EvcOO+MLb52Lktf9Bf1V0XgyBdBNugwkcPEQVSNYWT3KoWuFPh9h5aW/4uk8x1zmFadEZLjBtEWm0kcGoeLBQcKhpuY7sNS2mrPIfqbvn8sHNEuAz9Rq61puBv+cdWSZ54Knd7Zmb38au7AYNubu4ZtRgzWJ9L8mzU5lI8rYQ0TvfLfx4cKMRzPldKzeItoy88uuoN3GAtKViUKJPEmRyDMtNYFPL8nJI7i/81rZjQa+zr/uMao18ccf3EO+Zbh2w1NpwD36OuWju7s1/Ff2NOQ+idqLIa6QyZ7jnEkcyxKGUIxcgAJSsrj7a8xxfuDzNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qPQ7FcqW3y9LQgjrm1/oJB4iJKi7acAPrk0yjn91VTI=;
 b=ujHHjmuhblU3g16aGsALJG07qUM8+X2om/XZgSKUL/J3l1NnxTNxtXsET7KTV3bM7hAb+tg+wF2WBmSYImYrxfx7C6sxkWDIyIn0+lJKdroHOdi4g8SUueCcZU8MVjF/mKrAo+jDBUV5QI0B5M7kLPNZdURze7tmCjuPIbIn6/K/yioDuRrm/jYruIHTVhQX5yy+aJySTkzkkKLei1Q7Y8vOIiOoCK+LbQ8ClbZYw+twws8RTxzRU+kSjCJptn8AZ82vZalqDQC+JSoRR8rzY1gXiKsz/aS1VdYsK6zAa9WmccSxt+wAc3dM+IoZpvUB9NQoa1Nud6BsHCNBsUQMJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qPQ7FcqW3y9LQgjrm1/oJB4iJKi7acAPrk0yjn91VTI=;
 b=TIZQI49w1/IasbdSjpwFSe+BnoBVKG2bGzT9x/9obWGETkKiaGjFt1Nb/RL34PQ1eiYnmdm8sr2ZEv3hrB+xeeFo+qbtHrJBl+ujy/JheXehggHmUOKQw0N5qg+IGzE7eVTYvVfR+LMN6KJsaOpkoEiWGZ7GxuPpRHNOEWlhvuI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <181e7bd1-c286-4e81-ad34-d7c048497d0c@amd.com>
Date: Tue, 15 Apr 2025 14:06:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Xen Armv8-R booting protocol
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall <julien@xen.org>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <F10A37DE-4F3B-4A18-BAB7-B95616516A2A@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <F10A37DE-4F3B-4A18-BAB7-B95616516A2A@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU2PR04CA0009.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::14) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: ad99ce79-b2fa-42ff-02e4-08dd7c1e5f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0gyY2ZQaHlERXI5dDVVYzVRTEVpSlZITkEzdXlyelp5cXFuV0g2alZxNTV6?=
 =?utf-8?B?cldaVWl1YkRiSXNJOTZvSWx2Z05mTkhSUW1mU2ZKTDhsMDdwRHRRWENFaGJi?=
 =?utf-8?B?bisyVHYrbC8rU1p3UG9oaWt5VmQ0cjBVZERLVHR6dlFmSHJ2ck1DbkhxdmVX?=
 =?utf-8?B?ZnQ0djVCeEN6ZDJUWTlOVVdJRFBXQU9Uc3VmVXF3M2licFdKYWJnaEE3NTRy?=
 =?utf-8?B?VnNER1FnYktCZ0J6TnRXOWRuRjdFKzZVL1I2WjZRT0p5SkRyYXBhb0wzSDgy?=
 =?utf-8?B?elFOUjBPU05HUjlxK2M0RDZHaXJqVEI5VWVJR2lOazlBajZNVWJtTTFreHAw?=
 =?utf-8?B?cWJ4YmczcjlWVndXVzZRTjNmYk5jejdLaTlqR2p0a2psVUxub25FUmxPcFBs?=
 =?utf-8?B?UE43TC95RzhYSUZzMUxLZjdvUDlyWVp4bm5VNjZraTloTGtQRko4L3BPdnkr?=
 =?utf-8?B?dzZJT0NVUkcrV3FKbjAzNnpvMXh4TStkK0QzTTNtVEdzdUtucEFBcmpmN3JX?=
 =?utf-8?B?WVRrT2hmUkpybzJLZUkwdTZpaUhPeThmYmViOU00SkhpaU0vZXArWitydGN3?=
 =?utf-8?B?a3V6VHh5aTVKWlo0NUo1UnI1clRSV2hSZ2ZIYnpvYmN2RThhVGJMZy9RZjBr?=
 =?utf-8?B?eHFGSmp6R0kyNHRHR2NWbnluRDgwVC95bVkrc3F1MzZlcXdibjVIM1k2ODZJ?=
 =?utf-8?B?TEZrLzJXaG8ySCswL1Nwd2Q2K2VaZEgvNVppMTVIMzNoUEkyNGIzNXdsWEFX?=
 =?utf-8?B?SU90bjBqZCttMExzMGdWaWxMejVDNTUrVmZrU3F2SzJFYVVIMithL1R5OVlE?=
 =?utf-8?B?Zkpta09wRWYyeDBMSkdJSGEwZmFKeUt4QkJkTTJrS2JKRjUyU0paVTdnd2Q1?=
 =?utf-8?B?ejRQWmNRa00zV0ZLNHF6S3ZiRnVnRHhaWU10eVJpdmpkZEJSNUlLVEQ1V0ha?=
 =?utf-8?B?bFE3VFN4RjErQXZLUGZZZHpjbjd3S2luZFJRLzZvQ25sNjRITnV0VmhKTTAr?=
 =?utf-8?B?cnhnMEdMc3kvWS9QbEZzTlNOREd2Zys4V2hSWERnazVweVBUdHBYYTFqVExt?=
 =?utf-8?B?WkI2TjhvdWNqRVpGdlVETmRCM3RyRVFrTzg3QWdBNXMxNS9ZTXRoSm15eCts?=
 =?utf-8?B?anZHYU9uakh4Qms3Q21ESHhpMHBxeHBBeDlLVGlhSkNRYTluU2RSNVdTUkFa?=
 =?utf-8?B?TndrYWYrZU1ydE5BTFF1dk5Vd01saGZ3LzFFekh3ZzV0SHNWeTNtOVdiVUk4?=
 =?utf-8?B?anY1ZlBTeGRxMStpcCs3V1JpTFhSUysrdndSVXhxZEo2RUNvY3YxWHdJL2Vs?=
 =?utf-8?B?dGFIYnovMi8weXFnS2t4N2pPcTlXdE9tRTZHM1ZHUFJGMmNYTDY1MXcxWUxu?=
 =?utf-8?B?LzkyRHJSL3FTbk9jK1pWNWJ3dDVteHY0WlRtUTRnY1R6Q1l2Q29JNXA5YTF1?=
 =?utf-8?B?M1laWDFkQWJPS0VlTDJRTThkU3FicnZWbUltam1NdDhVVmdaRWcrUktzOHpL?=
 =?utf-8?B?dVF2M28rNHpiakNabVYzTlZqWmN2OGNlTk52aDBGYVVvOWFXNSs0ZElKaW5Z?=
 =?utf-8?B?czlRcXB2d0ZTREx4N3dVUHVyWnlsY0lHdFdCL2Voamk5S2dpL040Rkg2UDR2?=
 =?utf-8?B?TXlacTVoKy9VNjRBR0kzRVM5cDJFWHo4OWR5d0ZLZThCS2xCM0VGSFQ3L1JJ?=
 =?utf-8?B?RlJHQ3Rwa0JBbUlnTDk4UXZZVmdpVy8ra1pSc3p1aWJURVkzNjlqVU5lZFJt?=
 =?utf-8?B?TGh6bmdrTElqaUcxaDZnazNjbGRmQWRjUWFKWEhTMk9yZ2pzNkJaWEpqZC9p?=
 =?utf-8?B?WTdhcS8wNmE2VFZQa0l2TytLVEhrMmdsVWZyMmxzTzdOTHhrRWNPN0NJa1pp?=
 =?utf-8?B?NkJlZ0MxajdsN3RUWHFPWHE2ak5tOXFqbUdETkJWT1E1bHQwV0RvUldrcnpp?=
 =?utf-8?Q?TxBy66/f/Fs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MnBidGlONkNYeE9lZFYxbU5TU0FMWjZwSDMxc20xSi9YV0YxVEw3R1VGdEJR?=
 =?utf-8?B?VnFDeXdiZGY3S2ppQ2NnTldXV0lkQ2VhdU5OMTJTQjljZXk3WWFZNVJObC9s?=
 =?utf-8?B?YXdWQVVlNnZyVWgzQ2xxcWMzUzR3VllrbnRpRkx1Qm5Pb1F5TS9heGhYMGQw?=
 =?utf-8?B?OS9oV3Jkb3UwSGU4dHUrNlNxcmxXYzBEaittazN0dWYzMTlQdytTUkt2WHp2?=
 =?utf-8?B?SVVvYkhweVdBL0IvdTBzeEU3TFE2YWpqZ0ZvZ3NncllWdjJtRmpIbDNDaFpH?=
 =?utf-8?B?bzg3UUdCUDBhMVNodHBDTmZ6SEJPUmRQQm5WdDdWRUtJelVKRjZYSnI4QXRk?=
 =?utf-8?B?ZUY4VkRTUDR0MTNKU0txWHB1NFNyQm85eEpTSENqamFSc3NYSWEwNmg3L1ln?=
 =?utf-8?B?VjU0YnFIRWlLVzhTblgva3ZjaG1zWDVIZzd5UnhGR3ZIa0dNY1p2MVlGWkxB?=
 =?utf-8?B?VHB6OE1wNFlTbkh3SnVQbktCNmNNR0ZqTHJYZUgvdExLbHd0WUVSZ3NjTC96?=
 =?utf-8?B?RmtsYnV2cUc5RVA2ak50aFBLZlVQaGlrbGRsS3pwV1lZcDFrQ0h0NUpJRmNt?=
 =?utf-8?B?TFJJMUNNbVBMeG9NdWVjcGE5Yll1R29FbW5RUEtFZFZmS0tPZko0TjdCNFI1?=
 =?utf-8?B?ZkxOOUlNRzVMS05PbkVUelphc1pWMlUzVzFjOHBSZzVYczhoMmJQYUxqcm81?=
 =?utf-8?B?cXo4dU1FREpaZ1A1cHFqeGdLb2pudmdvU1FsaXYvZXd2cXdhbUZBbC9weG8x?=
 =?utf-8?B?VDZDOUwwQnNPNTBIUlJidVJaOG9rWFp4andld0dGajBqZ3hoWXFOZWxBUHZv?=
 =?utf-8?B?YVY0R00zdGswS1pKT0xuOEp2Zk91RVd1ZXBENXRCQlZNU2toYjZQMm5ZSXo2?=
 =?utf-8?B?L0s0cFJZclB1OCt1VmN5cElYNWtySCtuZ0FIWEN3Zmd2UmxYbWJOTy9Sdy9i?=
 =?utf-8?B?NE92cTdpNmxJS0NMZ1VZNDRsdGFuSG0ySWlVTnYyVm85MmhZeE9ybnZFYTNz?=
 =?utf-8?B?MlZoaUo2by90K0lPMStiUkFCcGxsZjZsd2VTOG40b3hLdWhpRjBhQlhzQnFv?=
 =?utf-8?B?bUp4WWFkcmY4SWpiQUE4aDN1N3BBWTJzYmdjMVNmc1hzczRRK1Vua1BQT3lG?=
 =?utf-8?B?aWNUREJzSFRvUUIrOFhoNkRIN2xZTXJPZ3EzUVQ0cUkzRG81SWtURFZZQVBI?=
 =?utf-8?B?RE1iZmhqa282MzBObzNFT2NhckM0bi90Tk9zZlc3bmNIL1BEcERHZGZEcWp0?=
 =?utf-8?B?MnNjR0NlbmRPZ1g2MThDRGh0bnl3S1NEbWFqWG44R2Q1OXVSUkl3VytiWUF1?=
 =?utf-8?B?Y0FtSzk3cEtOOUNLYmdseVQybEdORjJWQXk5blltSnI3ak0yV1RqT0owcWJn?=
 =?utf-8?B?Um1ZUU9vbFRsdnFGU2NYalJlS3JUU215bEJQalZ2bkJRSnJuQUZ4c3hKSkdP?=
 =?utf-8?B?aDhWL2RRTmhGQ1dobmd0M2xsWS9XT2FOS1NsajI0YlNHQzgwWjNIOU4rRDI5?=
 =?utf-8?B?U0o4RkVvT2d5by9zRk5yZ054RWlzVUx2ZXZ5N3hJUDZYZm5CdzRQWml3NzFJ?=
 =?utf-8?B?eFJKa3V2Z1FGUEI3NU4xam5nNkxVZW9uRC9Ca0dKS2NxWDFuemhESTdMYjAw?=
 =?utf-8?B?c28xODFiYVZPL1NLajVzZEJWNGJZMml5WkMvbFhBY2k1TTA0b1ZvZjRTUWpj?=
 =?utf-8?B?UTBjUUlPcnlZRVlEL2M0em9VdkozSXpsZmo5cGloc2x2MVNvNG5Ta1ZYUHFu?=
 =?utf-8?B?SDRmYVpSVWQ5Um52L01sL1B2YjA2S2QwNU5GT2VZZHdPZVUvc0I2Nk5OaDh2?=
 =?utf-8?B?anloR1pWb1kwL0cyeUkxNUNQVTUvMDB2WG5QcWN4OUhYWENEQ2ZnS2hQN2FO?=
 =?utf-8?B?RDV1WVExUWVUVlNxOHZoZXNoK1oxNlNoN3F0ZGpBVVlnbGw2VkVzMm1abkVz?=
 =?utf-8?B?SjNUdFU1MUVMbXdpRFRUODh4cEhNNWE5NnNKWWkvTlNEeWRzZ3RlaDFmMm1Y?=
 =?utf-8?B?VW8xWkdQaDJramxzOWtCQ1J5Ujc4dWo5bkgyTkFjUWprangvR0FNNWhibkFL?=
 =?utf-8?B?bG9JL25FaURBd01Wdms5eXFsMmp1SS9CbEUvQmlibnBXa0w4c0pRKzVpWTl4?=
 =?utf-8?Q?bsEHMw50r8V6Ver+GZ+9PXjzX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad99ce79-b2fa-42ff-02e4-08dd7c1e5f2d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 13:06:44.5395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwERvp8R0Ny3xc1gD0p3XeBkc2qoxKuCNIN6MB7h4e3hRLlmiOAyUM7CoDz3gpOXZ0Nb85kuMXRISl19kduEdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453


On 15/04/2025 13:10, Luca Fancellu wrote:
> Hi all,
Hi Luca,
>
> I’ve started this thread to talk about a possible Xen booting protocol when running on Armv8-R,
> currently Xen uses the Linux boot protocol and some other requirements stated in docs/misc/arm/booting.txt.
>
> Unfortunately we don’t have anything already available for Armv8-R, the only implementation of a bootloader
> is the boot-wrapper-aarch64 which keeps the MPU off, I/D cache off.
>
> So my proposal is to add additional requirements in our docs/misc/arm/booting.txt for the case where Xen is
> started on Armv8-R, under "Firmware/bootloader requirements”.
This makes sense.
>
> diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
> index 21ae74837dcc..39f029153e38 100644
> --- a/docs/misc/arm/booting.txt
> +++ b/docs/misc/arm/booting.txt
> @@ -62,6 +62,14 @@ Xen relies on some settings the firmware has to configure in EL3 before starting
>   
>   * The bit SCR_EL3.HCE (resp. SCR.HCE for 32-bit ARM) must be set to 1.
>   
> +When Xen runs on Armv8-R, the highest exception level is EL2 and the only
> +available mode is secure, hence the above requirements needs to be adjusted to
> +this case:
> +
> +* Xen must be entered in S EL2 mode.

Refer ARM DDI 0568A.c ID110520 A1.3.1

Armv8-R (AArch32) only supports a single Security state, Non-secure.

I see that it differs from Armv8-R (AArch64) ARM DDI 0600A.d ID120821, A1.3

The PE is always in Secure state.

Probably you can mention both.

> +
> +* Xen must be entered with MPU off and data cache disabled (SCTLR_EL2.M bit and
> +  SCTLR_EL2.C set to 0).
>   
>   [1] linux/Documentation/arm/booting.rst
>   Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arch/arm/booting.rst
>
> Please let me know your thoughts.

A question, Do you know if u-boot (or any other bootloader) is supported 
on Armv8-R ? Because someone needs to pass the DTB address in r2/x0.

- Ayan

>
> Cheers,
> Luca
>

