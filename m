Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8E777EE00
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 01:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584963.915887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQPH-0003Bm-Qw; Wed, 16 Aug 2023 23:58:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584963.915887; Wed, 16 Aug 2023 23:58:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWQPH-00039L-NQ; Wed, 16 Aug 2023 23:58:31 +0000
Received: by outflank-mailman (input) for mailman id 584963;
 Wed, 16 Aug 2023 23:58:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CG9s=EB=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWQPG-00039D-Ed
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 23:58:30 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca836e81-3c90-11ee-8779-cb3800f73035;
 Thu, 17 Aug 2023 01:58:28 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by PH0PR12MB5645.namprd12.prod.outlook.com (2603:10b6:510:140::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Wed, 16 Aug
 2023 23:58:23 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::1280:3c61:6568:3908%5]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 23:58:23 +0000
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
X-Inumbo-ID: ca836e81-3c90-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBoFE1aiRh8UNh+E8+XsG4I15LmBaSyYbJMtSpm5CGAV77LpbqaP9uUmXXe7FOzai1ALaHSRo6YEItVnJbwTKCW5h/eD+0mD0YRpjuMts4AH9Sa56KU30MDJqBPeV5Kcf2yYWleF9yZ0Zt85AUcp/vjwfwBY7fqFMKtZqIsWGl29JEYtmZkamEGUJoJDyFCy+8q+/XkyC6Enzfn9+JE8C6PsqSljtOU5c+X/YPA/RMXm1OBT/CYmKMpVTD3iKxpnPXuRjiPexdOEALWGmEBDH+XnSd4kjWsD8Q7Uy29mhspxJacA/V5qYklOFAIydsOzQlDPuUO81gGwvnBQReelbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxpUVP2qWoQZBP9+wzeqy+5arL0STd0dmyUZ9D3fmn8=;
 b=MeeOuZ+4yoWyjbUH8rG9tFaWjnZBo503DI3Bi7e/0OWRcc6EDFklJv35hLTaDoO4B/0JvTNOmgSMAm1t4qa4y4e8LUgFG3l3VZXFAVz+sdi+7npRVVks5U5aWaSJH3ajjMWrIpEKDc8Xb/SJ/TVihxGNi68RctReQFHkLGH2BhtO25KiVJPzMIVatNutAzT1XuYyHU1auh7oxrMvmrGwwscugDbdron7K4FQknFcvb8l7dt9/IUXb/+OZ1VahYiEhTWuqGeOFmkLj3uQ5+H2Ppq5Xa65GDDIL1XLaaeOp8W7TEgQBUt8zQhgo2Jtb1KvqvshQNVkH3lyX1fP3w8vlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxpUVP2qWoQZBP9+wzeqy+5arL0STd0dmyUZ9D3fmn8=;
 b=cBb8vQrbRjRQl8h5B3osQ049AUaN/GpEVJcuWXlYO+xNPQ0mrAUAeSM84Efuw4282RVvjajd0xFmuf3UDsqzezbV81tlzxgOiEKzgc0hrpQ8yiDUIW6CgjYDx8avqCMus3Ch57VDkgwBLYdcwtAFx2u2nTOA3S7iXd3kE6d4ckk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Wed, 16 Aug 2023 16:58:19 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	sstabellini@kernel.org, jbeulich@suse.com,
	Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN][PATCH v7 11/19] xen/iommu: Introduce
 iommu_remove_dt_device()
Message-ID: <ZN1im4gtMaPGwkjJ@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-12-vikram.garhwal@amd.com>
 <dc5c6d44-32f5-9d16-af1d-a7b1f197b7b5@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <dc5c6d44-32f5-9d16-af1d-a7b1f197b7b5@xen.org>
X-ClientProxiedBy: SA0PR11CA0161.namprd11.prod.outlook.com
 (2603:10b6:806:1bb::16) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|PH0PR12MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: eb34a6d5-9236-4584-c309-08db9eb4acf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A7fEnus+AIro1Ox74MOow/kNxaEETO2B++/BiweJRQKOuEHAI/Ksm6ZhU0HnnIniVJrKHTkCklEly1oiXuIYLkVWQusQMlJxd5/lxUiSB71njqOgBRi1q8E3P7KR3ic9e5VwNBp5XH+I2oN9zwanKscm29i4mY7iwYjFb6JIH3RuHiSjHfvXERIed88Q/eGFc4dDySDy/J7KRAuTtsW3xwqibuV4mULA1SCmj0/nUOSovDpJS7aiTdo0ZSxBS7mIk1PZaeYSz5EOP+/sM15j/m8hk3sMaNP/wONyYlK9kBqm8xhFY6XkfSOyvOBzroaRS97/0VocgbBE/uzq1BhqbLcv7UHdIkNFzxjwVagxHxQ65n1ClHIAqZroz9J7FOOfrrMoUN+Z15EBBEEOy36ripmBzS0Yw+gLkYbWnCSbw18vhkjT07f9KoLESD6Zk+nd4Lcgl2DodGquE/cqxK5+ONX3FgkEvjdMw9cyHzKAFv1PNZOVPXoAMH1PmX3ofZICnRx06f9gkxJeM2UCVBTZ36vIQb/WaInIw1OiQqprDpGNtYIjm7yVODx4sBjo0eGJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199024)(1800799009)(186009)(316002)(54906003)(6916009)(66556008)(66946007)(66476007)(5660300002)(41300700001)(44832011)(38100700002)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(53546011)(6512007)(36756003)(6506007)(6666004)(6486002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmxXWGZOWHVOcHl3M0ZyNCtGV0dOUVRZajhVWjJoOWpqZDkvNWdKeCtob3lL?=
 =?utf-8?B?U3ltc01QZXAzSGIwKzFwQ1ZVYkNvVWF1N3pSUmtyeUR4bXd3Vm9IVGNIUGlv?=
 =?utf-8?B?NTF4dzZaeU80TzJveXJvMWNmN1RaUW9WSFUxOE5udmpMRDY4MVdEWkNjUGZ1?=
 =?utf-8?B?bUVwbExtYTdVRm5SRytvMms4T2pFaHkzYk5Pb3c1elpZTlJ5eVdjQzVja2lQ?=
 =?utf-8?B?c2Y4Y2x0RHVqKzkzMzVZY05Ed3BoMFdnbVF1ZTZTdzZ2bUJJbEd4UVp5bXhy?=
 =?utf-8?B?bE9Wc1BLNVJlWEpHc3FwQ3pHNG5RS1lzV1Bzb2Y1UnVieVpPZkhBZ1J2b01Y?=
 =?utf-8?B?eVVEdDUvVU9ST3JQWEpBNnZsVENUWXdEa3p0dE9ybGsrdVkyeWFRL2lSSGIr?=
 =?utf-8?B?YWVaMGUwMXdXaThxQktTYmUvdE9jTGdGTmo0eE1rTERaTmpZM3dBWURVZjkw?=
 =?utf-8?B?NkRNMUVvSjRYaElxVEtRc1hCN3pKY3lEakJ3aFc0NjcrRWxRb2FRVXg2NUNT?=
 =?utf-8?B?Wk5OdmJhMXZOZDFXeWt1M3hnWEMwR1p1aU54RkMxazRUY01FWTlESm5MWkFw?=
 =?utf-8?B?QVRwdkNUcnN2N0tCSTRZV2J5QTVqY1ZoOStFc3MydUxXcVFaeTJyTWJuQjA0?=
 =?utf-8?B?cTlzbDh5VnY0VXVmaWcrMkhCbW1DRGZvVkhmcFUwWlRsUjQvWXh5cUVnZGVw?=
 =?utf-8?B?VVZENDgyQkk4WFU0c1RMNlB5c0VkUjhpL0diQnZQN0ZqTFNIMm52RXB6WEQ3?=
 =?utf-8?B?eFdRSkFSODZHYW9vNUtpcTVMOUt3SURNVHFGNEI1R1I0cGhFVXhCdTQrR2lN?=
 =?utf-8?B?OG9Lb0o0SFllaFRCdVB6Y3N5VndwMXRxTEVSVzNITzQyWkN6dEF0NEEyM0hL?=
 =?utf-8?B?bnJkOTl2dXludVB0VjNQMGVLUGdSTzV0NFNSZFN1Tyt2Z0oranh0Vk1TaTlY?=
 =?utf-8?B?NnZML2htbDhQMnVqREdMaExJSG1jWXAvRzAvdUxXNUZEY1FPeUxyenVEaDMy?=
 =?utf-8?B?THFtMmZDdENFQ3FVZVVLN2RJSzdnajl4VHBjN0dPdmRFdytNUHZjVkJwbWlj?=
 =?utf-8?B?TW1oQUQycU1YMWJ1Yy8wSW85SHNycXMwSGgvWlhJblZXTVRDYjZ2RmtKcmpi?=
 =?utf-8?B?U1VQem1TUlN3K1NlbzRiU05ZNmhMUDU4Vnc0NWxrT1ZVUzBxejdtZm0zazJw?=
 =?utf-8?B?Umg5NW1xam1sWStVMFk4MStrajh0dHRmaFZqcndsd0NUOVljcVBXY0c1M0pJ?=
 =?utf-8?B?aG5aaGZiUWoyV25oRmJoaHgyUGtIcjJmRExpazRkRW13SmJpd09adnJsZk5B?=
 =?utf-8?B?bkJLa0xBQzREVTArTmRVSWpTM0t1anJ3bUZQdlM0SzdKS2d5WEVyWm55ZGxL?=
 =?utf-8?B?bjBnb0dXV0QraVlWZTRnMm81c3Z3bmNDUmhCU2R3MDVCd1FzL0kzUkdhWFkw?=
 =?utf-8?B?UEU2cjJDMEZPUStrOVB1a1BLR0JVdlBrWDJhSVBQSlo0V2NWeUswdGVaMHlt?=
 =?utf-8?B?TWpVMjZTSWhtYllabHM3OHR1eXJrZ1IrMWVTNGc1VnV0cGVYOXlsYlJ6and3?=
 =?utf-8?B?RlMwdFhadDZIYXo2QWMwV2VpRTFwNURhL3lQWFhqU3VobFo0S2txU2hoS3FH?=
 =?utf-8?B?TmNQUllnZzdzODhuR3lQMHVKcW9ZZW9kYWY1d0tkaWhhaVo3bklYbTA2ZFA4?=
 =?utf-8?B?TDVVL1RIUVBXcHZYd253ZGFvNFRhS29DRWVRdlRmZE9ObmlFYmhNTWdiOWxK?=
 =?utf-8?B?QndBTGxNL255Smh4T01pYUdEcFZvSDR0emFIS3lxYmxOUk9PaUZPMk5sQ2xT?=
 =?utf-8?B?UGROL01ySXAzUS90MnNOajAwZkd3NkRVaXRoYlV0VFNwZ3pWRzFNT1NzOVov?=
 =?utf-8?B?TEd5dFUxeXNYN0hQa1MzdjVpUmducGlOendiUVJ1dFIvK05KZExwSHpWcFhq?=
 =?utf-8?B?cklucEtFS0hiL0VuSEEveVVIT0dmV1JFNHR3dy9DZzBibDdZK0hXVVB4U1Bi?=
 =?utf-8?B?cUJXdndKOEwwSUt5SVpXTXFvaGI0cU91NW1qaTMrTHg3Rm1BS2tGc3F3RUZZ?=
 =?utf-8?B?bXZ4VkNXSjZ5RDBsY0ttRWRNd2NJZlhUTmFISHc5Tm84WUpoSGt0Q1RBeVo1?=
 =?utf-8?Q?63Tw62o7t9uHQo6r5noT6GDHR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb34a6d5-9236-4584-c309-08db9eb4acf4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 23:58:23.8214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BYao4y5D94kGNGLLO2ISV9lrJKaW9L0QwhaFKZeU6RXB7JXjmSjKnEF7Ft+wY6W1r2XCVsjtbpqy7LiWlnKCFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645

On Mon, Jun 05, 2023 at 08:37:03PM +0100, Julien Grall wrote:
> Hi,
> 
> On 02/06/2023 01:48, Vikram Garhwal wrote:
> > Remove master device from the IOMMU. This will be helpful when removing the
> > overlay nodes using dynamic programming during run time.
> > 
> > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> > Acked-by: Jan Beulich <jbeulich@suse.com>
> > ---
> >   xen/drivers/passthrough/device_tree.c | 41 +++++++++++++++++++++++++++
> >   xen/include/xen/iommu.h               |  2 ++
> >   2 files changed, 43 insertions(+)
> > 
> > diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> > index 8cc413f867..301a5bcd97 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -126,6 +126,47 @@ int iommu_release_dt_devices(struct domain *d)
> >       return 0;
> >   }
> > +int iommu_remove_dt_device(struct dt_device_node *np)
> > +{
> > +    const struct iommu_ops *ops = iommu_get_ops();
> > +    struct device *dev = dt_to_dev(np);
> > +    int rc;
> > +
> 
> iommu_add_dt_device() checks if the IOMMU is enabled. I think you should do
> the same here as well and return 0 if it is disabled.
Added iommu_enabled check in v8.
> 
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
> 
> It is not clear to me why you want to mandate remove_device when using the
> generic IOMMU DT bindings.
> 
> But if this is really necessary, then I think the comment should be placed
> on top of the callback definition rather than in the caller.
Added a comment on top of remove_generic in smmu.c
> 
> > +    if ( !ops->remove_device )
> > +    {
> > +        rc = -EOPNOTSUPP;
> > +        goto fail;
> > +    }
> > +
> > +    /*
> > +     * Remove master device from the IOMMU if latter is present and available.
> > +     * The driver is responsible for removing is_protected flag.
> > +     */
> > +    rc = ops->remove_device(0, dev);
> > +
> > +    if ( !rc )
> > +        iommu_fwspec_free(dev);
> > +
> > +fail:
> > +    spin_unlock(&dtdevs_lock);
> > +    return rc;
> > +}
> > +
> >   int iommu_add_dt_device(struct dt_device_node *np)
> >   {
> >       const struct iommu_ops *ops = iommu_get_ops();
> > diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> > index 405db59971..0d7924821b 100644
> > --- a/xen/include/xen/iommu.h
> > +++ b/xen/include/xen/iommu.h
> > @@ -229,6 +229,8 @@ int iommu_release_dt_devices(struct domain *d);
> >    */
> >   int iommu_add_dt_device(struct dt_device_node *np);
> > +int iommu_remove_dt_device(struct dt_device_node *np);
> > +
> >   int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
> >                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
> 
> Cheers,
> 
> -- 
> Julien Grall

