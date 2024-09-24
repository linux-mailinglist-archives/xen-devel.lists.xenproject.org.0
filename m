Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E05D9840CE
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:43:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802498.1212744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st18e-0005d2-3q; Tue, 24 Sep 2024 08:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802498.1212744; Tue, 24 Sep 2024 08:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st18e-0005ac-0U; Tue, 24 Sep 2024 08:43:16 +0000
Received: by outflank-mailman (input) for mailman id 802498;
 Tue, 24 Sep 2024 08:43:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Xj2=QW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1st18c-0005aW-0t
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:43:14 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [2a01:111:f403:2418::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 07358a2e-7a51-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:43:11 +0200 (CEST)
Received: from PH8PR12MB7326.namprd12.prod.outlook.com (2603:10b6:510:216::7)
 by SA1PR12MB5671.namprd12.prod.outlook.com (2603:10b6:806:23b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Tue, 24 Sep
 2024 08:43:07 +0000
Received: from PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264]) by PH8PR12MB7326.namprd12.prod.outlook.com
 ([fe80::6d76:9c33:d230:8264%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 08:43:07 +0000
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
X-Inumbo-ID: 07358a2e-7a51-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JuYEkshVwZdjT3yjiS61grGYn3+r+E4+VXN1c5pMm/cNiauMYwYdRvObuDCG0y4UD7vvXOIlOoDZGEznxRGvSdQu2/jRplKOKmq3IEuJqJnyVfMk1307+7SpgHLqvHG3kSpjYTDfwuPBC5VL33eGoKQGcB4gKBFp3jlxjXJW3jhfTg5LZSUJQJNQTkshbaSmRt7JC6mLOsSdq262VE3uQLCDfpTMhLRJbCsRiEahGxf5BkGQp34797Zi2HQa0EtDpSAP4NKruqA3umJAe46ek/KpM3ynXl4e9Hj6kkxMda0CIER/NcVit4MNKrJNnMOdGTr7lC/96Biiter282pOYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIjGWEfYrFmnz/963cl5kZFbXNPlCnciUu4ddZctey0=;
 b=J8yPVfqjpcrXl4okesXn+Fl72swgTY0Xiq/09dTSJNUJBpNWF2WpT1i1hn0dJaTjAt3Rh/ux2k/4NkmPezfR6q2XaXxVJ9BWjDRlKWD1uwUY7wY/2NyrM8phK1Z9OjCQVid34aEyfBD7n3vTOd1uUQY7yYuoZ3yb04HP71V34AOMtLsLVr1UrNaQ0O5p1cZ6QImSVT2CzvjolZOL7C7Js3JH69ud75CGzaEW68HGVW6bdsemj2hhg1runS57yRUCLcNWnkRaYQ7V6iC8jSY74CC2eaenHRQmgsN5B990c3s0KXWrF+a2u1bT6XZOGcB15iDnJKxw090Sher53BJAew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIjGWEfYrFmnz/963cl5kZFbXNPlCnciUu4ddZctey0=;
 b=hHizforETAAOMr+mZ+r8U0qyBv3Ins6NUfWQ6kiXLV/Cc54MxbBfbGcv8CTzc7B8Bu4seXG+pT8+xCwzsVEOp/vpmpyxlQGOdk270xF7rpRWZ6OW/98uacm4L9KAi/ujwRBPMeHLG0EBll/HC+6cNmFfRk43A1EHo4+wZtL5/dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5bbcfa70-3b30-451b-a749-f5939eeb4bd5@amd.com>
Date: Tue, 24 Sep 2024 09:43:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] docs: fusa: Add Assumption of Use (AoU)
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>, Julien Grall
 <julien@xen.org>, Julien Grall <jgrall@amazon.com>
References: <20240916121851.3587139-1-ayan.kumar.halder@amd.com>
 <C3DB9D13-B9E6-4F8D-9678-59555E36AD68@arm.com>
 <87472b10-8e36-462f-a4fb-973684bceaa1@amd.com>
 <F7E20E7F-FEB1-4A70-8D76-75B5A827048E@arm.com>
 <51b52075-cc06-45b4-8d85-d6cb903fcda1@citrix.com>
 <DC433E1F-CD65-4F70-BD51-AABBBB320D73@arm.com>
Content-Language: en-GB
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <DC433E1F-CD65-4F70-BD51-AABBBB320D73@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZP191CA0046.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4f8::15) To PH8PR12MB7326.namprd12.prod.outlook.com
 (2603:10b6:510:216::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7326:EE_|SA1PR12MB5671:EE_
X-MS-Office365-Filtering-Correlation-Id: b8c30487-46cd-4cdc-aa73-08dcdc74e942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0hNUnJneUhTNzZZaTVmQTdYN1lGS1J5Wld0ZmM2U1pQUnBYbFVIRnRLcHA5?=
 =?utf-8?B?T3hiZW0vNTB1aWtTcGtkUmNnQ09FcGRROG9kLzRvbFVuZHN6M3FPc1FZSWt6?=
 =?utf-8?B?WUlySmJUWkRhbEVzeklJSXFHV1RjSk5YMGp3U0t0TmFBTWV6aUJnbjdDZ3Vz?=
 =?utf-8?B?c3JpTXhHeERIQjJOQXcxZElRQXZBU1BGbEpPWk1FdFBNQVk1aStKbUtDS0xW?=
 =?utf-8?B?ZXR5WXhZRlFXYnM3SkFzMjBENWlTdWlmeUR3aXZ2WHhSdDBiM3lKWWlQWGhM?=
 =?utf-8?B?Y1FJcFl2Z3hyVHpKRHprWTRFd2pDajhEQTF3a0dpVldrSFZDSC9XYlplbXNE?=
 =?utf-8?B?ajRKaFNwU21lUXdHS1lqWmI4Z2Q0RXBlOFZ0cjgxRFlTMlZiSldHbEZDR0h5?=
 =?utf-8?B?czY4eWdPdTNyQ1o4RVMwVUZYVXlRS2RIOWp0akRUcUxrRGxlN2pISmRGbFlx?=
 =?utf-8?B?VHRTbzlDYUQ2VVJvRzkxTW9HVFlqanQ4SVhWTytsN1AxSng2SEZTYjRqNlhR?=
 =?utf-8?B?OGx2WVNyMFZJMnU2TStQeHd3a240SmxReE84TUhzUDVzYjVab2JtQjZ3Q3F1?=
 =?utf-8?B?d0RvS2pMdExacTZZRXB4WkV6ZmdZQXRUN2VSK0NLbyt2bFFFdGtCSHZFbnM4?=
 =?utf-8?B?T2QvRkRsY3R6TTZoYktBZG1LSUttRDl1SnZteVExR1orUGVDeENLdkVlVkoz?=
 =?utf-8?B?cStyZ1l4YjNIQkxTVjVVYmtySG1TekM5SjUyWmZ3SEsrOE45YzUwWU5PR2w1?=
 =?utf-8?B?VnorT052N1JaYU5xN0pDUUcyZWcvQllIYjIyQkFZNGZiMGxPc0VPVDQ3Sm1o?=
 =?utf-8?B?ZEtXVzJ3L2YxRmNxVTNpaUowdktQU0Jlb0VNOVgxR01pckcxMUUwWjBtQnhH?=
 =?utf-8?B?a2c0dldWbE16LzRPaFdYYkhDbXlMYzlPN1FKR3Z3M3o1bkJTVGpXcWNqNjZq?=
 =?utf-8?B?QUU3bjJld0J2dGtIT1VRZk9hK1BXQlBsUksxMk5BdldaUEdRMHQxUHQrRzBG?=
 =?utf-8?B?NGFudnoxbE9zMDk5ZWhGS1pBQmlVVXZPRmZMZWdGbDFFQUJ2VFU3aDdqOGpz?=
 =?utf-8?B?K3krMUxDdnl0M2k0ekZtekdkQ1NvSnN1UU5GWFhESEc3cDU2ODNNTFc2OHZN?=
 =?utf-8?B?LzRIVFhKbXAzVmdQbnoxQXNXcnVpSTNnQ3RHVHAvTkxSRndELzBTYzZjTHNT?=
 =?utf-8?B?VFM3L1pLaFhDV25EcnNrUzF3ME1hUTZNRkN1Y25mRVNCSEQ3RDFWTzFiV1JZ?=
 =?utf-8?B?TXpFRFhoQUlxbldZYkxzK2JoZ3lKdExQQkxMYUx1R1dJTnJKT242NUMvalEw?=
 =?utf-8?B?RzdsRVlEVWtwUWpXNkZpcGp2VnZqamptQzFNOFR0RmpuYVhLc3hyOEJ2Sk9R?=
 =?utf-8?B?dmpZTCtiaStEanFRUHBqSlVzb1RYb1E3M3Zrdk9yc3ZBY2hQL3ROUmx1OG5u?=
 =?utf-8?B?ZzBHcVdVdEdHcnFTSkVSelBNNHRsSENhTDNSTEl5S05lUUMxYzViOC8xSnN5?=
 =?utf-8?B?Z1B4MGd1Mng5U09EOFBwRW9YVzhySHVwb0VZZWp4Uy9WS1FkN1dUem9mcXJy?=
 =?utf-8?B?WEliL3ZVUmptMGF3U3FoZ1NQMTZaRklnTmIyU1E1am91Wm53NFl4TU1jNktI?=
 =?utf-8?B?WHd6ZXB3b1RsWG1lR1JKMENLMFhVT2xZenV2MDhMU3VBc3NnaGtvS0pneXI3?=
 =?utf-8?B?ZC9VVis0Z1B4M3MvM0hwb3oxR3NpTnBUbTdWcWtoa0dnODlYdkQ2RzdnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7326.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTMwT2Zqei9uNW9ycGNRY0l1SVBuUSt4b2kxd1dNYlJGcFI3STc2THZTWnJx?=
 =?utf-8?B?KzhMNndPTGZySTZ4WjFaUkdHTzhYRXZGNFYwcWdrU09KU1dnc3RjRWdnNkhK?=
 =?utf-8?B?ODd1dVVNVmxJWUhCYktqMmRBakNIS1BRc3pnVlZlTDVXaG04V3JKZi93eGN3?=
 =?utf-8?B?eU84a0taK09LYklHM0JMS2poOXVweFF0ZUswTnRSRm51UThMbWd1WlNleWdp?=
 =?utf-8?B?cW9TR0F0MjFjTjVnNStncmJ2WkFiRGwvajkyQWVQR1RhWnlWbnQvU2o5MDNE?=
 =?utf-8?B?MTdvT2VsR0lzQmwySitTOUx2NTJRdVN0eTU2RHRpeU5EL29XQXp0OFM2Qkl5?=
 =?utf-8?B?bHFBTzNqcFVLck10TWhicStrcEw1bS96TWtMUkVtSXA3WWxHLzdwRThyTnlF?=
 =?utf-8?B?V1gwYm5jREpRNGo4V29DMm1NUkU5SVVuaks2M3Z0RzFSVjZhUnZNeitHY2xm?=
 =?utf-8?B?ejBMVVhLL1NGNyt3elQzQUpzNFBNeDhJNVhDQ2NXaXl3enRYRzRIaHAvWEUv?=
 =?utf-8?B?N29qOHBVYk5aQ3QrY2szdDk3ckRhSkgyWFVjOEt2bFdsa084WkxicDIyTFpN?=
 =?utf-8?B?RmtLdERNVnJHak9hdFI3QWE4Yzl5ZkJRUlp2dzQybDhsamFnMm1DY2NVc2xS?=
 =?utf-8?B?dGx5bExWazdQV3haQ3BERm5RQWZrWEJ5Y3E5MXU2eHFMdGFkRThjMjl4TjJn?=
 =?utf-8?B?andnMTJGZ21FZUczdURQVTYwelZzaDhCSkZDMGNPQkJPRjhTSFlvem1yRUx5?=
 =?utf-8?B?SkI0ZWNHYjVGVU9JZlptQUR1bHlVSGhlYWkySVlOZ1VLQ1VMUDBYYWxVbGM4?=
 =?utf-8?B?emovbmh1ZEcyajRLT2krSFI4TGlvVGpLNHk1VGpFN1M0d09qSXZYR2RMdmNh?=
 =?utf-8?B?WkVPZ0ZMUUlqSEhVVHh1RkVaKzZ1UE55U0hmK1JxNm9qeWxpU200dDRjazVZ?=
 =?utf-8?B?ZGZWZmNoSExNWTd0RXV5REN0SzdSMlBGZXpsY0dVUU0xaklHZU42TWN4SnJ2?=
 =?utf-8?B?YXBxOUJuWEc5cG9KK050QmhTam5tNXlacGhXL3JvbHpGcTR0eDE5QmZTOG10?=
 =?utf-8?B?SloxUEVCNTBNSXFtWStVaTNadEVQOWEzemU5WHVqdXYvZS9vNGZCeVdUYW5j?=
 =?utf-8?B?dkxKSXdyVUNCSVQ5bWpxdWlPRU9mb1dOMlZ3NFpmVW9OQXpycTN1bG9qdVVj?=
 =?utf-8?B?MnZaejVhOUkyM3E1TlNtNGpOa3FXRmI4b1BBS0Z4V0ErUDUvRUFjVElmNnVa?=
 =?utf-8?B?bHAycnl3cHlXQSt3dEJyWis3NmZkdTZqeGdsUXhGelpsMzFRQzNTT2JOcWhm?=
 =?utf-8?B?ZE1zemp2ck9ZYkVRUEp5SThNNU9seUovTHgyUG9NRnpLTXU1V2VmNmVzakEr?=
 =?utf-8?B?QjVTVTJaTzFOeUlmV2hEbkdsVkhSK0NZQVlVRzlvQXNQbUhaa2hEK28zU0RW?=
 =?utf-8?B?MGV6di9YL0FMVVNQMDBsZ3FKRjAyeTJ4c3pJY1BpdjVJRGJmTjAyVllqRHRm?=
 =?utf-8?B?UzB0bWFzTkFCSUxUWmwrWEg5RVhZTGhIc0dIZE5ONm1nclhMaytVR0FrMFN0?=
 =?utf-8?B?bUcxdFl6UnMxSldHbnpaSjNPQjBaNlQ4L3kybXB3YlFSTnZSbEYrOEF0bzdG?=
 =?utf-8?B?ZHc2SnFad3dCaGJET1NsRHNIL3JrT2tEclBRcW9CVzBGRmYyMU1NY2pTU2FI?=
 =?utf-8?B?cktUY1BuajRoRFFsMW0vdHNsNWZrbUQ4ZG9mZWIxbUl1L1Urd1UzT2l1eHJx?=
 =?utf-8?B?Z2tvdXRGVWhQemxuMklyTWd2cVZ1dUxWWld3eEo4djR2Ulg3ZndjRkZRNXR2?=
 =?utf-8?B?eVVMK2JjRVJUZjJBVStOMVFaWFR2OWxqVnFCY3JRelZRaUZqV2FPVlJySjk3?=
 =?utf-8?B?R1NDeHplUVAzcTdQenYraGYvK0hJeHdXeS9sMzFTSVMvanVGb2JKdlQwaEls?=
 =?utf-8?B?T1JBazBhckdjOGkrZHZ0bWxaZlIrR1dIQlc0bWVqdUZiRG92eGFWbDQ4VUs5?=
 =?utf-8?B?TVhOWXpFRTRNMWFiWWt5MU9xZUtuaWdHeFFsVC9CeHZzU3B0cW9telVBMmpj?=
 =?utf-8?B?V1d0bkhFaVViWnM0Q29RWG1RTEcrWHNTbDF6ekdSU2MvQlBRb0FlOTFSaXdi?=
 =?utf-8?Q?g/iuaynfZYgeNBwz5Mn+FzCq3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c30487-46cd-4cdc-aa73-08dcdc74e942
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7326.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:43:06.9764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlKHl4H9RoxQiwAJhR9J+d0gHIvHiIFLQf3lBNNqHbK3nY5b+Sf1cOOSszTUmgWMHzz3EeveMp5YJKjcFy989g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5671


On 24/09/2024 09:32, Bertrand Marquis wrote:
> Hi Andrew,
Hi Andrew/Bertrand,
>
>> On 24 Sep 2024, at 10:15, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 24/09/2024 8:14 am, Bertrand Marquis wrote:
>>>>>> diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
>>>>>> index 245a219ff2..aa85ff821c 100644
>>>>>> --- a/docs/fusa/reqs/intro.rst
>>>>>> +++ b/docs/fusa/reqs/intro.rst
>>>>>> @@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
>>>>>> OpenFastTrace parses through the requirements and generates a traceability
>>>>>> report.
>>>>>>
>>>>>> +Assumption of Use
>>>>>> +=================
>>>>>> +
>>>>>> +To fulfill one or more design requirements, there may be underlying assumptions
>>>>>> +on one or more components that Xen interacts with directly or indirectly. For
>>>>>> +eg, there may be assumptions on the underlying platform (hardware + firmware +
>>>>>> +bootloader) to set certain registers, etc. The important thing here is that
>>>>>> +anyone who validates these requirements, need to consider the assumption on the
>>>>>> +other components.
>>>> I think there is a typo.
>>>>> I would simplify a bit:
>>>>> Xen is making several assumptions on the status of the platform or on some
>>>>> functions being present and functional.
>>>> s/functional/functionality.
>>> no that sounds weird, functional is right in the sentence i think.
>> "functional" is correct grammar here.  "functionality" would not be.
Yes, I have left it as "functional" in my v4. I saw this message after I 
had sent out the patch.
>>
>> However, "functions being present and functional" less than ideal.  I'd
>> suggest "present and working", "present and operational" instead, or to
>> rework the first "functions" into something else.
> "Present and operational" sounds good to me as they might be working
> but be deactivated by firmware for example.

I think the definition of AoU, seems clear to us.

Also any of the suggestions made by Andrew or Bertrand seems ok. (I 
don't have any opinion which one sounds better).

I will leave it to Stefano to fix the patch on commit (as suggested by 
Bertrand in v4).

- Ayan


