Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2C8792400
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 17:39:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595766.929376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdY8k-0000A2-1b; Tue, 05 Sep 2023 15:38:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595766.929376; Tue, 05 Sep 2023 15:38:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdY8j-000082-UH; Tue, 05 Sep 2023 15:38:53 +0000
Received: by outflank-mailman (input) for mailman id 595766;
 Tue, 05 Sep 2023 15:38:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JXF+=EV=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdY8j-00007w-9E
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 15:38:53 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eab::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4edb7ec2-4c02-11ee-9b0d-b553b5be7939;
 Tue, 05 Sep 2023 17:38:51 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by LV2PR12MB5726.namprd12.prod.outlook.com (2603:10b6:408:17e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 15:38:46 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 15:38:46 +0000
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
X-Inumbo-ID: 4edb7ec2-4c02-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJ3MTmfTw3sW2caZE72FUVyommhNZ2x/BJdWFmX9wKPB5zbw/H0b1PcYzvQeZ8hqyW8mfmtBB1VzxPltCUx4NqBpVfZu1yrMrdQNEAnpAiOdCeek1j+5q8w/W1+pURL0fvjvKVD+yvQSjz8SmeYq/1SjVOX5E+V/WhwQQVczlaCeYRZ1u8OGg5ivhEYUOUNBf/xfgnY7YbbFYcxND7FC+2V2+qj0Uow0kMB/PuXQXsh0lBhQmejGLNlKy+BqQPQCPwjSsx1knkqtWXNhwQsZ4zsrrjxlxIKAPdZmn450BdAMHQofWrVx+rOEHbFvSQ3pjO4f7ULiQ/FBlKLuskNB2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jp+CDM5M1kKPiFuAkbjlFz5ns0wvQUg4ze1J3pFIDUY=;
 b=GaKQl98ac8zlDXld1+9IHtSGG7BkZzuLYUclw7ApwHl0liiI1Nn3SG3ZCYVyvgWO1uY35+eIYooWGHPK5aK4ta3hUut+bg5orDmbxmOzrPL3tCGkz3m/0bZ+9tPGSP61lbsTxvk1c+2EDftFQbUJDefqU4Co4k2inXmdFXmJJK7z9e40rO49RQ8xWT2mX4MSdCAJA01xPmdlYISlwXoL7R214PNolqzG8/EE544KEZc77iiYAxtvvsBG9CPKnNQVYcdT2XeW/nlObfs2McqkODkocA42Of4ZTBUqjGS0slKTane7q8DySAtWcabheIAD964RpnT0NY+CnYUu/rnk3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp+CDM5M1kKPiFuAkbjlFz5ns0wvQUg4ze1J3pFIDUY=;
 b=0Tr/Nziiay/F7l794KC9kmEzGH47pjy/ppjY1TeydYDsrMwtHhgXqwuvn+QXg7/NGFjt5jtCV8xnzbM/4Stc3KqeFR842zk0OthFyXWSTVhm+FTpkccWUblSd8TtDRYVeeJHpFWCImM5MHxB2qtF+yftCnbBA3BXpPzDstZhuu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 5 Sep 2023 11:38:37 -0400
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org
Subject: Re: [XEN][PATCH v11 14/20] common/device_tree: Add rwlock for dt_host
Message-ID: <ZPdLfWX5KFKjXmQK@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
 <20230901045947.32351-15-vikram.garhwal@amd.com>
 <227d9107-5f5c-b773-639e-ee59a7047a27@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <227d9107-5f5c-b773-639e-ee59a7047a27@amd.com>
X-ClientProxiedBy: BY3PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::6) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|LV2PR12MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: e32532f2-5306-405a-165d-08dbae26310a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DyzNWaE8jBQD4/xE2VH+JeXN2D7bChTmSiZZWez8+6zPFULzI3gsAhnH/Ug92GYGcdUGQigFyj+P8Lc3h6YpdhR4uYYQ6Ie3eJK3aAaTCyNXaFPa1S5evFGIN2gP2aG+Ffmtj+VBBQ/ZLUKqwU0Lr5JOD1lVkFeQqcVw09Da/j58r99LfEvFolsS3JF+4JBExpBfad6q90TzWO4a5yebqjxKKEWGtVxSyZVr3mxk6kkLiI3EUYrDxYscY3KmodAL769xDNaEsLMeHIfi13xow4drmBUx7JhE0VwyLhKFRZLBZK1Ks2/o5ACHvCXL5fOpa0tkmMsmBfGnlypwER0AfIuNv+M81DNLLjTYDYFHClJG+TBIhXa3VDtAdWiM6X3XtGM9iMheT6XmbQY0JmwxMd8GlefFOkAJO9l3ID+v14e5NKHvmXVz/vYzv8IGBVaNUnslmoOtfOoYTTIVgn0UZzsolWw8lLjhawIfzM9LRP+9Pud8hIXacNr+V8exebEX1jLugoBTo96E7ztnzntNUYIS6Icjl2gjlq4P47ERDoaabCNDklxysrd7i+dIPE0X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(396003)(136003)(186009)(451199024)(1800799009)(8936002)(8676002)(5660300002)(2906002)(6636002)(37006003)(36756003)(316002)(66556008)(66476007)(66946007)(4326008)(6862004)(44832011)(41300700001)(6486002)(6506007)(53546011)(6512007)(26005)(38100700002)(6666004)(478600001)(2616005)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVcxWFp0ZVBOODMxVEpyODVIQVlOQmJTQXRoaFVaYURrbDVGb01iVGlSbUp0?=
 =?utf-8?B?Qk9rQkl1cUFxZDZJM3dZWkZHL1V5QURSaFNscXNzc1FiK1lBVzZ3a2NQa1ll?=
 =?utf-8?B?WGxLbVc2bldWS1lQRUtSbFBycGNYT1JyWi9VTGt2RDdPSFZTa3JZZ0Y0cHVB?=
 =?utf-8?B?MEJZWlo2MmpnNG0ySENmeEFuRDhtNDFDRjZRVnlHMkxmU25pWXlVVUxIQWZG?=
 =?utf-8?B?MnBaYVlhTWJCbFhESU55cUhVSzE0TDV2bENtMDNheWNGKzM3Y1Vqb3BVRCth?=
 =?utf-8?B?WDkyUDZhSTYxbFg3dzhickNjengrK3d0RVY2Z2JUNmhDcFlnVkNmNE92NmZU?=
 =?utf-8?B?QklJQjdReHMzZ0czNVVaVllncEVNd2tyaDVkbVFvVTF5WmpTbDJ0ajJBcW1t?=
 =?utf-8?B?cnZicllmQzIzTnYzLzlNYWVNdlpadFlBekNzSnhLRHpqQjdYenpKZlJhN0E5?=
 =?utf-8?B?YkJVRGE3d1U0cmlweW0xSDV3ck1YbjdOcXAwSEN3bWwvajc4Y2lNQmhVenVl?=
 =?utf-8?B?YVF3dzMvWEZ4M3BlbXlLUVFXczdsZ2R3aVZ4WTE1YllMdTMvMmJGcnJDRVAz?=
 =?utf-8?B?K3pNMjZxbEZibjE4dElzWU9UNDNoR0w4LzRCejVCVGJFbHVlL0dwekNBbjNs?=
 =?utf-8?B?M040RElpaUlQVyswN1ZITzIzRStUbFFpT3dzMlZMOHdQYmJiTkJ4anR1ZDZN?=
 =?utf-8?B?T2dKZk4yOGtBbGZ0TWJYRGhTMG1XSW9KTDZWYzVlMVByTU5RS3dYeGhiRzNK?=
 =?utf-8?B?WGFPTlVnYlpjMTBKVmdlQ3M1RHFXY0lKMGpHL3pTOTQxakZvVXIxREc4SFov?=
 =?utf-8?B?OWxMaU1Ha29mc3A0RkdWdDhsakNSSkx3WnhaV2dLTDJyQnNycWdlZHVmb3Rs?=
 =?utf-8?B?VCtNRllpVFQwZkl0eWYwa1RUWHM0K002WXZCWUZqWXRUblAzdUUwWjdOYlR3?=
 =?utf-8?B?eWRGMFEzOFZSYTh4enhJckhITnh6dWhzdEFmc2FKMlY0UWR2TjFEMjJjc3Bu?=
 =?utf-8?B?ZUdHWk5XaTdrQm00ckpNbGJQRzVXV2lDQ3N3dzA0d1hOYk9nMUxKMUZrOE1N?=
 =?utf-8?B?d1RFSzNEWUoyMFZidUpPZXYrckJPRGNjQWpTVTNUZzI0MFU0VTVpYk5ZYlJw?=
 =?utf-8?B?RElBWlBqVUVtMlVxLzdrZU5hSTlrNlpNM2RQNFhvaEtqNE9NUm5KT2ZqK2FG?=
 =?utf-8?B?YzAzdTZPY2lVQnFHalFoWk9aUGJQMEQxUkRuclJWNTIzWCs5MWhPNEtlWWVw?=
 =?utf-8?B?TUc2TXZUcmNkaVpTdHlKdGdkZ0c1cFRqT09BVE9YY21Ra3hCLy9DRW1hRmxF?=
 =?utf-8?B?dUVTN1I0UkxTditQbVdQQmtLanBzcjY3Q2FHN0ExSEJNSEllMThWbUNUUlBr?=
 =?utf-8?B?ZnpwdzlESDFTTEdvSkgxQnkwTTJpRld2a3k4ZE9wZk91UE4rUzEzSVZBYjJZ?=
 =?utf-8?B?eXE3QlNTb0FIMUltWkpxQVlCOWhoZmR3cjVsekQ2ek85UFV0TTB3bjh3QnN3?=
 =?utf-8?B?MVlsUEhPS0JUS0FtMGlvVzRobG9iSHN4VmVmTHMvVHEzckQzMUErSXp0UG94?=
 =?utf-8?B?bUJUV29mNEdiMy82THZSSjk5Q05lQjZsaEExRmF5RksrWVpLUmlpNUpWQ2tu?=
 =?utf-8?B?QlpYZGpJRld1eHlQNFlwMGxOb01jU3IxUFJCRFEranpya051WU9WZ0s0dVFX?=
 =?utf-8?B?cmtJOGF1Y2pacFlqZjg1WlhiODdWTzJFdkpmOU1jTjFkT0hXOW1HTG9KS3Uz?=
 =?utf-8?B?U1cyRUdQSkR4NlJCZWpKb0t6T3JCTFJaakd3dlZDaTVxRVlud0R6OU9iMUs0?=
 =?utf-8?B?QnBXcEVLVjB5eEpMU3VpV2diRTVpOUpBYnN0TG9Kc2tMMFBxcXJnSEJBVGZB?=
 =?utf-8?B?UGZhT0swc0NyTUxYWGV1QWo4TURVai8rRU9FekJqdkNNNkdnejJlZGh0akQy?=
 =?utf-8?B?aGlmaGd4T1ZkSHBzK1pxRmNYcGloVFBDZnAwRmcvbThrNHliYlZCSWRkYlFu?=
 =?utf-8?B?TDk4bWJ1cGkvbWVkOGVWbEFxSmU3TUJGaXdLRlpxMENza0V4RjR4a2d1dTJM?=
 =?utf-8?B?Q21oUU9ENVVEc0xJVUFyUy9DQVJaN0I1NUwxVXhNSEYyeDg0eXV1ZzlpNFNY?=
 =?utf-8?Q?qtk+Y5Ts0mlme5cEaRnLE6bUl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32532f2-5306-405a-165d-08dbae26310a
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 15:38:46.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwUTduia6PtmWeCziNV414sRPBa4w+MVNiKSv/ADh61RX9e8l0CLV1+Bwqpg/W3+pm3jbK4Z5VRj1zTWVTRrtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5726

Hi,
On Mon, Sep 04, 2023 at 01:09:52PM +0200, Michal Orzel wrote:
> 
> 
> On 01/09/2023 06:59, Vikram Garhwal wrote:
> > Dynamic programming ops will modify the dt_host and there might be other
> > functions which are browsing the dt_host at the same time. To avoid the race
> > conditions, adding rwlock for browsing the dt_host during runtime. dt_host
> > writer will be added in the follow-up patch for device tree overlay
> > functionalities.
> > 
> > Reason behind adding rwlock instead of spinlock:
> >     For now, dynamic programming is the sole modifier of dt_host in Xen during
> >     run time. All other access functions like iommu_release_dt_device() are
> >     just reading the dt_host during run-time. So, there is a need to protect
> >     others from browsing the dt_host while dynamic programming is modifying
> >     it. rwlock is better suitable for this task as spinlock won't be able to
> >     differentiate between read and write access.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > ---
> > Changes from v10:
> >     Add ASSERT for iommu_assign_dt_device() and iommu_add_dt_device().
> > Changes from v9:
> >     Update commit message and fix indentation.
> >     Add ASSERT() for iommu_deassign_dt_device() and iommu_remove_dt_device().
> >     Fix code styles.
> >     Remove rwlock_init in unflatten_device_tree() and do DEFINE_RWLOCK in
> >         device-tree.c
> > Changes from v7:
> >     Keep one lock for dt_host instead of lock for each node under dt_host.
> > ---
> > ---
> >  xen/common/device_tree.c              |  1 +
> >  xen/drivers/passthrough/device_tree.c | 28 +++++++++++++++++++++++++--
> >  xen/include/xen/device_tree.h         |  7 +++++++
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
> > index f38f51ec0b..b1c2952951 100644
> > --- a/xen/common/device_tree.c
> > +++ b/xen/common/device_tree.c
> > @@ -31,6 +31,7 @@ dt_irq_xlate_func dt_irq_xlate;
> >  struct dt_device_node *dt_host;
> >  /* Interrupt controller node*/
> >  const struct dt_device_node *dt_interrupt_controller;
> > +DEFINE_RWLOCK(dt_host_lock);
> >  
> >  /**
> >   * struct dt_alias_prop - Alias property in 'aliases' node
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 80f6efc606..1f9cfccf95 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -31,6 +31,8 @@ int iommu_assign_dt_device(struct domain *d, struct dt_device_node *dev)
> >      int rc = -EBUSY;
> >      struct domain_iommu *hd = dom_iommu(d);
> >  
> > +    ASSERT(system_state <= SYS_STATE_active || rw_is_locked(&dt_host_lock));
> This looks not right (I know Julien suggested this). The second part will be checked only if state > active i.e. suspend/resume.
> I think this wants to be:
> ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock));
> so that once the state is >= active, we require dt_host_lock to be locked.
I rechecked this, you are right! Will update it to check the lock only for
>= active.
> 
> ~Michal

