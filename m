Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED34F78D7DC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 19:49:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593226.926185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbPJ6-0006Xv-8q; Wed, 30 Aug 2023 17:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593226.926185; Wed, 30 Aug 2023 17:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbPJ6-0006Vf-5y; Wed, 30 Aug 2023 17:48:44 +0000
Received: by outflank-mailman (input) for mailman id 593226;
 Wed, 30 Aug 2023 17:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dzxB=EP=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbPJ5-0006VZ-7V
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 17:48:43 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 739b8685-475d-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 19:48:40 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH8PR12MB6914.namprd12.prod.outlook.com (2603:10b6:510:1cb::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Wed, 30 Aug
 2023 17:48:36 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.015; Wed, 30 Aug 2023
 17:48:36 +0000
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
X-Inumbo-ID: 739b8685-475d-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2QIa18aDhrNedooLSLS90HWIrGcwdNYzMBlhrZsJGTfbC+0plAYU1KFdi48xykBW1STnxMnmqL9JGk7Cz4DCLPkFnyryOIkKFkHEKRDRWfaKy/G6fMTlXjLTnMreD5NyPyLK9ICDkdCCOZWEgut+gsbMwLfTdNDOrhb33Y8sfOk9QVf9aLw6z2ct5Zj85sEgScVVj8EyKmj4HVujG/4POVc94d0tuxhiyhKIf9xYfRRoASDbzHk4eY40CMzI5VGgGSwUOhuza6quSPXYdTmPmwrC4+34WMsmSv07CrZxesS/jMwN7j4YjN6T6fzbOM8kiR0SUECoZLVe6FNuUqVuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mR/qB7NahkfYGvULqYo6+N0kz82f7BK2P8mXqDNzkjU=;
 b=Ly8giEu0CzM3Q61ktc6f+8HG0cliVt3kj96sDaJA4BeKVRszzj5KkMa9IyEdhPLHfaqoF2dY7MrupwWx8KClX9GXlmHyn65g4ghq9P8sJO3pDKAxqysCs7E3Sowp7a3qqQbigCPcljuyF781nqv7msZ7sbsrnOXGE/UqG4575pJRAUy55ixedb/zZ668oJ58EkREkVT8UyAuS/eWe9e6E5nCt+0b4mRnh1r90KVxiBclh+oUw7D3+oiHk4xR0SE+OMww7MIiU4dpFTC+/19CA4Mz5aNJBjd+ZbjPM108CDezixmX75hNZwL1QJPCuu1AwTySITMMu5Tboo6S48psFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mR/qB7NahkfYGvULqYo6+N0kz82f7BK2P8mXqDNzkjU=;
 b=y4j0vsskoP+3K7U/LpRJvI4GDLJfZxEzTfE/tD33FveOZF+fAUOFah72WtB2y8mtmYJv/IwMWBqtr3t9VIw6JD7V7dNEy2RhQm2lgUZ+m8GUVRzOo2865tnAyOoL9KyqxsYq4DHVgnAXPVxCBS4JXQE8PL/8wzIrQWixFnmavsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 30 Aug 2023 10:48:29 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN][PATCH v10 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
Message-ID: <ZO-A7ZERxISru9Ug@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-12-vikram.garhwal@amd.com>
 <079c831a-bf1e-5489-562b-01cf4e3e6b02@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <079c831a-bf1e-5489-562b-01cf4e3e6b02@amd.com>
X-ClientProxiedBy: SJ0PR05CA0109.namprd05.prod.outlook.com
 (2603:10b6:a03:334::24) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH8PR12MB6914:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f0c7ac-d4ab-4c14-c4ee-08dba98155e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CG+3qUTENaXcp959xbqAG9CEJc/Xdsj6djsx3Y1IHZ+taabSvKeX8qS8ZDIOTfGbfe8DMDp2f9Pk1Zo+smIDKiPF/pWI3x/70n0hvVzPKeCGcqFqtJikZS2IkeuJG3Kt0FeDh0EBWI8G7gDsruiXpAruyp27d4l9sdf2Blol5Qhl5xsjdkPr2nVCR79WbLg/BuGDBcAPhRNq8hjGeZ61c/o/0Sam/qPtn8PupWIXCaAqDeV+zftlSz3opyiUjtNBzH3Es0dYsQKy36d2tnAgqMYygAmO6MNhcLL9qHV0RoadP7168vEsADs6+KsSztk/mFL0plG7CavXyMp9Gvl/Vw0eHMcHq/hBjhSII47tpH1U/9eyYSYaoCdqPVqsNNWGUVzSY61c04moM1LHrt685aVLrb7KjNxk/GO+EaiPoqxKV7zyM/yIZ4j+fUPUbbAAPWkfuqnS+LoygnApM/S/0+WtrAfI6zh9yPVEmKXawC3/ca2h9DYYSyUVPCzB7owaGqmVd2dUCgKx0l73zdVNpWiuJAYjCpFGtWYkk0P/bLWC7mvqroQzMGMCoRubw4BC
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(376002)(136003)(346002)(366004)(186009)(451199024)(1800799009)(66556008)(54906003)(66476007)(66946007)(37006003)(316002)(6636002)(478600001)(38100700002)(2906002)(86362001)(8936002)(6862004)(44832011)(41300700001)(5660300002)(4326008)(2616005)(83380400001)(8676002)(6512007)(6486002)(6666004)(6506007)(53546011)(26005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmhXNk5IUlFub0tSWVBwMlF3dmVjWTBJelJBQ1V0ODUrMGM1bEhIZmpIc2p6?=
 =?utf-8?B?U2RRUTZwN1FXRytSSHNFQ1h1OEpqRWI5YUZXeXRFZWUvQWk3cVU3NzE0bDhC?=
 =?utf-8?B?R25HNlRmMGhxNXZSeERycVdYcEpnRjVpT3FXdktkelVKQitpZGRkMGNsRlNx?=
 =?utf-8?B?aHRETE5hNjluYTRSMmFtaUtDcWNPYTB1Y25WalpTenIwREZQcUc5WEFSc2pq?=
 =?utf-8?B?Q3F3dUQzU3gzL09pNkZCODkxT09kN1pyYktVc2FXSUk1c2MrMzNvOVMvUlhT?=
 =?utf-8?B?Yi9lUWRPeG13UWxENTNQbkt0eUZlZFQ0RGNrUEZaTGExZitsUTNpdk5jUGI3?=
 =?utf-8?B?N3Y2YVlFWGdGZVRsV1V2emdhYzdxWnp4SEljdi92ZFMzRHNuaHhNQWQySXo3?=
 =?utf-8?B?S0JtUy9hdndiUzFZYnhHcmFQSktSZDVpOGFIZTNrQjJEck5TT1BWRGZ4NGE0?=
 =?utf-8?B?TUE4cWVjUWVxNEg5ak92MzFwc2VvQnJJQ0ExT2g0WUtNREFxQ21MTzdxNmYx?=
 =?utf-8?B?ZzcwbHJGc1FDNjFuMmF0R3BJa056TFlYcEM2Mldtdm9nVFE0MFZTek5RNnBR?=
 =?utf-8?B?Q3RiMGRJVkZEQU1RaGU0VlFtV3JPblNOaW1MT25lK3BCd1VIRElTMFdCbU1I?=
 =?utf-8?B?QWVBdmZFQTI5UHNQNkpKMEpzSkM4OFFqWHhjSVlnNHhiWVRqTWxoZ280VzRO?=
 =?utf-8?B?OU5taThiQUd0dkltVjF6VThMNE02ZmVJWWZBb3VUbUU1dUZ0K0V5bnRjYTdJ?=
 =?utf-8?B?WWZjckF0MmlaVUZYb3BtblVxY0NBNzRuaFdPQW1icDgrWi8weFY0VklLVXFH?=
 =?utf-8?B?WkN5aVlQVmtsMFNlRE1udHZaNktUeVhrUDV1WU5LMmM4N2YrOUJlS3hyNVhV?=
 =?utf-8?B?K1ZrUmxqZk92QnhGb3BhVlI0d0tHYzFpY2hiellyQVlSOEJ2WHBsRW9iLzcw?=
 =?utf-8?B?MHFCT21MeHFQemxUQ2o0emZqUGl4VmVaSjMwSlhmakNGbURLWDI2NmU4aHRw?=
 =?utf-8?B?VjRkaWRUa04rR0VXSzI3S2h1Q282SVF6dFpDL1oyZG5uZEZ5MVhIano3YWQ3?=
 =?utf-8?B?eHgrcnlRVzZpeFFoSXhOQkxwQ09uNzBvMHlSNGFrQUx5NEpvczdmb2pNdlp0?=
 =?utf-8?B?VU1RMmxvWnFIdTljVVRLNEt2MkZYU29aUlZxcHE4ZjRUNHViT0FCSTlhd0Zx?=
 =?utf-8?B?d1VVL3B4cURKSTlVMytOL1lCOTdmL0hYMU04MjJkMHFCSjk0R1RYRFNjYW1n?=
 =?utf-8?B?YTVyb3hFeWRuYXAxU2hXZGdhN0RzR2d2Z0crb2hLT1h1cXNjcjB0VWVPallx?=
 =?utf-8?B?OW1NdEFvZTJMQlBhVXRmZzhWTXh0TUdCb0VaL0hlU05oNzNDTDdjMGRHellw?=
 =?utf-8?B?Vld6MXdJdWpETlppbmVScU5WSEhDOUpZMGs2a245UlJZa1U1MitmdGM0b1VU?=
 =?utf-8?B?VlA2MFFzakJ5Z2dNUVlIbWxoaTBXTGtTSjlLcWVGbDdaNHVFU0lObnlvY2Rs?=
 =?utf-8?B?T3h2dDlweGVENm81NStOM3doNjZJN215ZjJRdmdxUTh0aDRFRUE2V3lackp4?=
 =?utf-8?B?RjE2cjdLclFLaEFlcFNNdytvRnVDNjRkbVBHKzYyeTRpeHNXcHVDUmFlWkpW?=
 =?utf-8?B?bEJjRkdpV05SMGV5SXZRNHBJV3g4S3p1YTJCS1BiYXo2alVVdmVGY1Iyb1Fm?=
 =?utf-8?B?RHl2dVh4K2h4aUxUdHoxeXVLVW1qQVF6b251SjVDeHo4dHFBZlFCR3hlR0pn?=
 =?utf-8?B?cDR6N2o3NHQxSnFHNmlnYUtMdTcrcDRjQWNwOXJ6Q0VZQmJoMnNRR1cwZkty?=
 =?utf-8?B?ekx4Y3pRMFFZeVhIWnpsUDA4MFdRK1NuUTd3Z2JPUHgrcjRIbWE2a1Jra3pT?=
 =?utf-8?B?U0pFazNvTGJ2eHRlbyt3RC8vdVZlQ2V4Y2QzN243N3hFLytPb1lNWWFKVWpX?=
 =?utf-8?B?bjhYV0Z5WVFtNElaZzVMNmhZcGdYRlkvV0dCL0E3TkNzUUJ6NGNCaXhDTWtm?=
 =?utf-8?B?N0hhUVpRbzBvOGtDNWxNNXFMZ0lYSys1L3BuMjlwZzYvck1uSHo3bUxTUUpT?=
 =?utf-8?B?T1k5L0xuT1JLNlNBL1Y0Z3RhQzBnVnAyeFl1YUY3WXlyblBOejZ6Qysza1NR?=
 =?utf-8?Q?LlPZGi6qjr2oevIqxfYm8SqJe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f0c7ac-d4ab-4c14-c4ee-08dba98155e2
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 17:48:36.2702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEuov9r5H0HHeDxnP+ZeZZ3T53FL124sgGLxyZ6dNHuYig38S94qCHxaSgAyd9/AItMqTF0OAYQLY7LSWjCOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6914

Hi Michal,
On Tue, Aug 29, 2023 at 10:23:30AM +0200, Michal Orzel wrote:
> 
> 
> On 25/08/2023 10:02, Vikram Garhwal wrote:
> > Remove master device from the IOMMU. This will be helpful when removing the
> > overlay nodes using dynamic programming during run time.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> You don't seem to handle Julien remarks for this patch made in v9.
> I will forward them here to avoid answering to old version, but for the future, do not carry the exact same patch
> if you haven't yet addressed someone's remarks.
This got skipped as I cannot find direct email from Julien. The only email reply
on this patch is can find is from: xen-devel-bounces@lists.xenproject.org and
this got messed up with other larger set of email xen-devel sends.

Did you get direct email?
> 
> > 
> > ---
> > Changes from v7:
> >     Add check if IOMMU is enabled.
> >     Fix indentation of fail.
> > ---
> > ---
> >  xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
> >  xen/include/xen/iommu.h               |  1 +
> >  2 files changed, 45 insertions(+)
> > 
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 1202eac625..3fad65fb69 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
> >      return 0;
> >  }
> >  
> > +int iommu_remove_dt_device(struct dt_device_node *np)
> > +{
> > +    const struct iommu_ops *ops = iommu_get_ops();
> > +    struct device *dev = dt_to_dev(np);
> > +    int rc;
> > +
> > +    if ( !iommu_enabled )
> > +        return 1;
> J:
> The caller doesn't seem to check if the error code is > 0. So can we 
> instead return a -ERRNO?
Will change the check in caller. I want to keep this as it as so it looks
similar to iommu_add_dt_device().
> 
> If you want to continue to return a value > 0 then I think it should be 
> documented in a comment like we did for iommu_add_dt_device().
>
Will add comment before iommu_remove_dt_device().
> > +
> > +    if ( !ops )
> > +        return -EOPNOTSUPP;
> > +
> > +    spin_lock(&dtdevs_lock);
> > +
> > +    if ( iommu_dt_device_is_assigned_locked(np) )
> > +    {
> > +        rc = -EBUSY;
> > +        goto fail;
> > +    }
> > +
> > +    /*
> > +     * The driver which supports generic IOMMU DT bindings must have this
> > +     * callback implemented.
> > +     */
> J:
> I have questioned this message in v7 and I still question it. I guess 
> you copied the comment on top of add_device(), this was add there 
> because we have a different way to add legacy device.
> 
> But here there are no such requirement. In fact, you are not adding the 
> the callback to all the IOMMU drivers... Yet all of them support the 
> generic IOMMU DT bindings.
Will change this.
> 
> > +    if ( !ops->remove_device )
> > +    {
> > +        rc = -EOPNOTSUPP;
> > +        goto fail;
> > +    }
> > +
> > +    /*
> > +     * Remove master device from the IOMMU if latter is present and available.
> J:
> I read this as this will not return an error if the device is protected. 
> However, AFAICT, the implement in the SMMU driver provided in this 
> series will return an error. So I would suggest to replace this sentence 
> with:
> 
> de-register the device from the IOMMU driver.
Will change the comment.
> 
> > +     * The driver is responsible for removing is_protected flag.
> J:
> Can you add an assert in the 'if ( !rc )' block to confirm that 
> is_protected was effectively removed. Something like:
> 
> ASSERT(!dt_device_is_protected(dev));
Is ASSERT really required here. remove callback can return before setting is_protected as false.
> 
> This would help to confirm the driver is respecting what you expect.
> 
> > +     */
> > +    rc = ops->remove_device(0, dev);
> > +
> > +    if ( !rc )
> > +        iommu_fwspec_free(dev);
> > +
> > + fail:
> > +    spin_unlock(&dtdevs_lock);
> > +    return rc;
> > +}
> > +
> >  int iommu_add_dt_device(struct dt_device_node *np)
> >  {
> >      const struct iommu_ops *ops = iommu_get_ops();
> > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > index 110693c59f..a8e9bc9a2d 100644
> > --- a/xen/include/xen/iommu.h
> > +++ b/xen/include/xen/iommu.h
> > @@ -233,6 +233,7 @@ int iommu_add_dt_device(struct dt_device_node *np);
> >  
> >  int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
> >                         XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
> > +int iommu_remove_dt_device(struct dt_device_node *np);
> >  
> >  #endif /* HAS_DEVICE_TREE */
> >  
> 
> ~Michal

