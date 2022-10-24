Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA48860B566
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 20:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429325.680280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on26h-0002um-4r; Mon, 24 Oct 2022 18:23:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429325.680280; Mon, 24 Oct 2022 18:23:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1on26h-0002s3-1S; Mon, 24 Oct 2022 18:23:27 +0000
Received: by outflank-mailman (input) for mailman id 429325;
 Mon, 24 Oct 2022 18:23:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1on26f-0002rv-PA
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 18:23:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11hn2220.outbound.protection.outlook.com [52.100.172.220])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1c15b3a-53c8-11ed-8fd0-01056ac49cbb;
 Mon, 24 Oct 2022 20:23:24 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH0PR12MB5484.namprd12.prod.outlook.com (2603:10b6:510:eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 18:23:20 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 18:23:20 +0000
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
X-Inumbo-ID: f1c15b3a-53c8-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpTNXUJizdCh4s09tYtXQg4ElrrGBkTOKeGL05yuDqclewH++Pz5F1NEOuZSA3U8trQyPGsNFKNMSizecc7nzZ9y+nUjyGFYLC2TLUgGrltEXU9xyek3oCkoulT5wObjnALJpL9GlW2Cnbv+olARtsdQscQlVUvDw9CQvsdrDRt4izhB1ymPrOvz2PI3Q+GEza+5IOC3OFgXHOQTmNTVLt6CqWRZhMxj6WxEk26ZzsDpy2xRZQHK05xPHnCv9+SgJY9Pflo8q/+y+gt1E3PJFWra7E5SQaJvBcBwk5rLIg4XrzEKMj0EDw+AFLpaqX2Pv4dm4KHL4XrdA2LpI//Phg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRItKjpgSE6luuTmK1leJybAIODKGpR0/UJh+Ns5K64=;
 b=MEO+kd1WtvdcV6kBHnsu48JPbSCPHgJimQ39vdDjZSOw5SzKqtZsxiMF2oSopFc5mpCDQvt3PYOxAKyuEWCtXGH4e5Wxeo4Hu2pHygHMg6zd7F9I5U/ONVxham/R2fboRgBQGnGwyDqYN2uKVOubIGnv4dgZgIAlTVmHj6fZiQjtq6Hpk6Lj6g+yzA8QXL4ezM7fXIzEJ8wmY3WHaltPJ5jxKJ/C2nRq+dc4nsjzbJxOjdkvzIk+moOzTlugjX3TzCUhyTp1BtecEcXE7mGnV5T9PTi9/S+9FqIkCfejLDzkskO/caIPIK5BOdJ5zECk6pZV1qtxiowF8Un4hjAKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TRItKjpgSE6luuTmK1leJybAIODKGpR0/UJh+Ns5K64=;
 b=BQ6bSFZkBekY5FYG9JKKCTtljqy0/e3PTby3z0Zg1mFglgNWcPPpuf/AMdUeoyER9siVTJEjzL8N/2VayThPLo1uCkWMNyvYJKWudWc2zeUffS6qFL1y5ut8vH3rN8MQHoUxy8ZwvMDpMMV0qPBk5aEpiVZh5aMbJEhRrdNmjnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <37395a5a-e014-c8a3-8209-6b056ed4fe01@amd.com>
Date: Mon, 24 Oct 2022 19:23:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 00/12] Arm: Enable GICv3 for AArch32
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com, michalo@amd.com
References: <20221024181917.60416-1-ayankuma@amd.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20221024181917.60416-1-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0417.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::8) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH0PR12MB5484:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c2203ba-4bec-464e-d108-08dab5ecd424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dFA5TjVEQXVZSkd3ZXlQamViamEvQStSNFlZNlYzdDlPTHZLMTNEVktNS0sv?=
 =?utf-8?B?bm52OExyOGxrT2tlRTB2S3doMXJSYjU5S2VDdTFYb2ZDUzdZVnVYTThjZTFu?=
 =?utf-8?B?cGN4dGlBa1VZOW5nR2hrRW55V21MeSt1cEgvTDM1QWd5bU1DQXd4dU1BVmsy?=
 =?utf-8?B?Y3hidUVHTzdWWEIwV0Zad2ZOK1ROVkpxMGdVMWlTTTVuNTM0MkZjQndkR0M5?=
 =?utf-8?B?TFBtOUFYdi81QURYRUd0OC9kQUhtdlNvNFJyVTE4ZHVyZ3UvQ2cxWU82eFdL?=
 =?utf-8?B?YXhNSXc2OW9ZZTZ5SkdiT04rdUY3VitjSE9nVmpsbmlRNGJBeStGKzJUUXlt?=
 =?utf-8?B?bG1JRmFSdERvWVZHQkhVWWFmTkFqQ3QxN3F0d20vMFcyeWJJVktGZ2ZoZmRs?=
 =?utf-8?B?MEpudWczenN5TGpKV0Q1OFBKUHBKSEYwMFRJRHF6WURZS2dXMGFRNXl6ajNw?=
 =?utf-8?B?NG91Ny9wL0wzeXArc1FwVmpHSU9pVElQRmxhL1pRd3duY3hneVA4R2l0Y1No?=
 =?utf-8?B?VkNveGZOS3NjNzZCYUFHcWdWM0I3UHZqWHNrOXFGOEJLa2gvTmZvQUQ2WDFT?=
 =?utf-8?B?S2VMNFArSXpBcmIxZi9XRUlYRSthdm1PZy9aZEs2a0JCWTFhcTVCWDU0bDFG?=
 =?utf-8?B?Ni9ZNmxiVGk0RjJNSDBOaGRxNlhCcnJzK2d5TU95SnZiZk1FOG9CcTVuVDd6?=
 =?utf-8?B?RDFTRzZjRTBoRWlOeDJrREZDdDNTNE0wNitPbHpjTnpkSVhQbUhSS0tUMTVo?=
 =?utf-8?B?U3phVGRnNk5pU0h2WmpFWWJCamgyY1ByTWV6TVl0cHlCbk8xL2hURVlnbHEx?=
 =?utf-8?B?cjBqa05BUmttWnRYcmsrWFJuaCtXb3BCbVYxQ3BYaDcyenJLU0FRWnlHNkF4?=
 =?utf-8?B?QlRUVUtSYXRQVU1SMXpGSDFRcjVQb2RqeE1xU29UNHV6cWhSN0t0d0Y5SXNo?=
 =?utf-8?B?bmtXZ1pxamN2M3htRjdMS0RYVG5jeTZjUnZsbWlNYWtsdStqMjdrRzVFV3ZN?=
 =?utf-8?B?N1o1TWJabGxKYVR1NW9BZlJtTmVMcW9ZZjd5Uk5BdWxHdm9aYjFGakJ6bFlK?=
 =?utf-8?B?a2pwWGNVNjYrNEJ5cEdOTkdveXZ4R01sTndBTEEyTFFxWVd5WVk1SDVpNVNM?=
 =?utf-8?B?bGhFTjJiZXJiRkE0VnJFU3V4L0lWODFkT1NiNFdzLzdQcGR4RW5yRHgwYVpG?=
 =?utf-8?B?cXZkRDNBQ3FRa0JLM1pld0tQb2hiSHpsbUZOdHpqR1Q3YzU3dHVZYlB5T0JV?=
 =?utf-8?B?WkZqejVkZUNmK0ExcWdBc3hwQjc0aVN5MktydytVV3MydnBzQk1TRmo5Wk4v?=
 =?utf-8?B?M2hDSHJvclk5OGNiN0ZpMFA2RGZSWjdDSFo1c2VZM3h5NjVjZVVSQXVMbWVS?=
 =?utf-8?B?MHhCYUJNRmczcDQ3WTB1dFpuMW1INm92TXJFR0JCVEtPTUZtTzN3KzFMY3Zl?=
 =?utf-8?B?RS9hdGpWemNDMTdYby94N3g3b0tMeDQ2OUlJS0lKYmQvT2E4bkowakhXc0Rk?=
 =?utf-8?B?Kzh3QTBYK294VUVsVU0zNFJFb2Fmd0VjbTUxaFE2TDFRYjNNRS8rMXd0aVYw?=
 =?utf-8?B?SDMzTjdRQXNIN2hiZzdrYTIzNlgxek9kSXJvdWUyQkszclNMNC9UTERSa1Ru?=
 =?utf-8?B?RjZzKzd3Z2VoNXQ0MWpwZEovVUlsWnc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230022)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(451199015)(31686004)(6512007)(53546011)(316002)(26005)(36756003)(66556008)(66476007)(4326008)(8676002)(31696002)(66946007)(41300700001)(8936002)(5660300002)(2906002)(6666004)(6486002)(478600001)(6916009)(6506007)(83380400001)(186003)(38100700002)(2616005)(43740500002)(45980500001)(11215385002);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTI3UWtUcXpoc3FvazhxeXNCbkt2VERzWXI0d3NLOUtPcnZvZ0g1VW04VXhU?=
 =?utf-8?B?c0lMTlNYdUU1M1kxV1BqYmtycmNlc2UvS0d2S2o3enFhR0MzQnFwdWQ1SG5G?=
 =?utf-8?B?eXJ4d21BTjl1OTNRWFFkY3NUekkwaXgvcmE5ZkF3VFZZckwzUnByTzE4TmdG?=
 =?utf-8?B?anBvb1ZYM096YUo0ZjdTSVNLRVZxTlBabFdEa2kxV0RCc0h5QnFlT0JTZ2J1?=
 =?utf-8?B?Q3VtMXdScUMydStwaEhIWENINzY0R3EybmlLb3FRSlBPeU9vSTI3QytDWWhT?=
 =?utf-8?B?Y29tN3pGL3VvZmRnd0gyY20zb2lWWUVvWHJZSVhNSTUzSDVsWmVGUk5tU2sr?=
 =?utf-8?B?aHd6aUszaFlwMG5sZjA1Vk9YNDFOTUhYdW9hSm9TZWFBUEhXVWJMd2ZJR2Ft?=
 =?utf-8?B?V3NUZDhKb2FjRzk3UTFQYnRBTjUrREpHUVNiRjlYNVc5cHBKTTNKcGJxRjhv?=
 =?utf-8?B?MXpubVozZEpSaSsxT21NZ2pKK2NFQ0djNHVwYWRKSW9JdzVCUmhCSTZQQUFl?=
 =?utf-8?B?ZXJUSnpiMTJaWlJzU1FoZDE0cXgzZjVwaGtkK0VhRi9wMmdjc3dvY2NhUVZZ?=
 =?utf-8?B?VndmSlJCU014Wm14NWJSczk1NGtUWDltOE1HNjk5UmZ0STJYbUJpdWNmYkE4?=
 =?utf-8?B?ZDdydEFQMkJyUHN3TmMvY01KUmxmZ2hsdlVyVENtamhXMFdvQkczR0JMcFJv?=
 =?utf-8?B?M00yVUNHQjdWcUdsRXZSRUhuZUpId2I0dCtmYVF4MUpxd2JDWVdXZUltbUhM?=
 =?utf-8?B?MWFLU0p0dlA2c0lMeG55dDgzUEV4YThkKytvWisvTGJCL1lDNHBnZVJOOUVM?=
 =?utf-8?B?bHYxK3J0QTl0VkxVVWZxbXZ4cEpjM1lpU1ZRQS9RN1l2U3FGSkJsRXBMSzA4?=
 =?utf-8?B?bkM5c2llaVlVR0ZUbTRmZjAxMTU2bUNjbk9MTXBlbUhaLzZXdGVZRlNnWDI5?=
 =?utf-8?B?V1BmcjdHd05vKzdkdGpaRFI3bml5R2NYR0lJODR4NDQxZ1A1L0FGMW5WU0FT?=
 =?utf-8?B?WkREL3dlOWJwdnUwWDY5cHpRR1BicEdCQTZLR2pJYklwYnUyNXNlYkhaclhM?=
 =?utf-8?B?MkVUSmUxOXRITDNTZEVEMFVpWnB4RVZyL28rRGN3ajlYWk9QbVhuNGY3QnNM?=
 =?utf-8?B?V01YUVlUeTZFSktkNk9oV21tVzVZbCt2d0RrM1NtaFhFOGFkQ2tMVXZvRTRs?=
 =?utf-8?B?eWJXTWk5Y1hqbTNJVDg3dklHTS9kK2dMN2tya0VSbHp1ditDQ25XdnZMZmU1?=
 =?utf-8?B?TCt1R2VIN09IbExOaWNvWnlaVmxuVWFDbldGc2daYUxlaVEzU2dzdW5hYytI?=
 =?utf-8?B?ZURRejNhOFlSVEJ3NFlKY2Flb0hNVXI1WE13ak9kbkMwalEvcTBxd1ZqeUJZ?=
 =?utf-8?B?UDJsOG5yRmY4VHl1UVNDNVdRanEwVStNOCs4N2ptYUowOU9DZGFvOTZhb0J3?=
 =?utf-8?B?bTh0K1VKOXN4VXBKdXNyczE2ZFVXeVg0SWF4WllEYzBjNUVHT1NqNmVpRFVn?=
 =?utf-8?B?aEJvWThoVmxlK0ZpaGNXcW1CQ243eVdiOGgxdmJEUDliVDNjMDZvQmVNU0Fv?=
 =?utf-8?B?TUNnWDdRRnpOancwdjZkYVFJeUdvQVZ1NlYvN2VMOW5LejQxWTNzWDhXb3Fo?=
 =?utf-8?B?YVlkcU5TRG5wdTJLWW9RVm9MWTRWTHZXWEgzZWFDemgyMUZXaFBaUnhvTkJU?=
 =?utf-8?B?Wncwb0VtajdxRVVnc3FLSE8rVXRiTVh3M21tYUFkNG8xaWVRRG5uRXQ3K2pD?=
 =?utf-8?B?V2s5WjB3YmJjUENpSkp1VFcrd1g3NjRMaGx6ZmF1L0p0R1U2Zkg0MTA4MzRR?=
 =?utf-8?B?eXpJMytHL2ZISS9GWVlDN2RFU1ZESVFsY1l2TFRFWEtmbnZwV0FXclc1TzlZ?=
 =?utf-8?B?cXYzUnp3WDFQd0NLdlRMTkJ5SlJRVWVVTFlqS3dQaHEwRzFTdkxnUlBNZUVS?=
 =?utf-8?B?QTJ0c1Q5SW0vcmZpVW1RVmtFZDJtTVdDU3dPSm5LeEw4OFEyTTRGL2NEMWYy?=
 =?utf-8?B?S0lSakM1TmcrNitKQUl0K0tGamFUb3ZVUlY0K0I1K29ZVG5BL2VQcGVqU0Y2?=
 =?utf-8?B?TjEzbXRUWXJCeEFsYktJL2Y3WkZreVU0cXpUUVhzSDRkVThTRUhxZHhNcmFq?=
 =?utf-8?Q?loCya/MeEMC/QJ07nvA8c6j3o?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c2203ba-4bec-464e-d108-08dab5ecd424
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 18:23:20.4938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkCiuVU8W1rPOtOiJYIv8J9G6/eNy7YTGqXTvdLemyIfSEWjzqhnWOjQk0FYuu4gd6NASz5xeIGCB/s0MQU17g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5484


On 24/10/2022 19:19, Ayan Kumar Halder wrote:
> Hi All,
>
> Please find the following patches to enable GICv3 for AArch32.
> This is a pre-requisite to support Xen on Cortex-R52 (AArch32-v8R system)
>
> Let me know your thoughts.
NACK. Please ignore this. I have sent by mistake.
>
> Ayan Kumar Halder (12):
>    Arm: GICv3: Sysreg emulation is applicable for Aarch64 only
>    Arm: GICv3: Move the macros to compute the affnity level to
>      arm64/arm32
>    Arm: GICv3: Enable vreg_reg64_* macros for AArch32
>    Arm: GICv3: Emulate GICR_TYPER on AArch32
>    Arm: GICv3: Emulate GICR_PENDBASER and GICR_PROPBASER on AArch32
>    Arm: GICv3: Emulate of ICC_SGI1R on AArch32
>    Arm: GICv3: Emulate ICH_LR<n>_EL2 on AArch32
>    Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
>    Arm: GICv3: Define GIC registers for AArch32
>    Arm: GICv3: Use ULL instead of UL for 64bits
>    Arm: GICv3: Define macros to read/write 64 bit
>    Arm: GICv3: Enable GICv3 for AArch32
>
>   xen/arch/arm/Kconfig                       |   2 +-
>   xen/arch/arm/gic-v3-its.c                  |  20 ++--
>   xen/arch/arm/gic-v3-lpi.c                  |   8 +-
>   xen/arch/arm/gic-v3.c                      | 132 ++++++++++-----------
>   xen/arch/arm/include/asm/arm32/io.h        |   4 +
>   xen/arch/arm/include/asm/arm32/processor.h |  10 ++
>   xen/arch/arm/include/asm/arm32/sysregs.h   |  80 +++++++++++++
>   xen/arch/arm/include/asm/arm64/processor.h |  13 ++
>   xen/arch/arm/include/asm/arm64/sysregs.h   |   7 +-
>   xen/arch/arm/include/asm/cpufeature.h      |   1 +
>   xen/arch/arm/include/asm/gic_v3_defs.h     |  24 ++--
>   xen/arch/arm/include/asm/gic_v3_its.h      |   2 +-
>   xen/arch/arm/include/asm/processor.h       |  14 ---
>   xen/arch/arm/include/asm/vreg.h            |  23 ++--
>   xen/arch/arm/vgic-v3-its.c                 |  17 +--
>   xen/arch/arm/vgic-v3.c                     |  26 ++--
>   16 files changed, 242 insertions(+), 141 deletions(-)
>

