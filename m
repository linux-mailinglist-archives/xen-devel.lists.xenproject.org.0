Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFEC78F6E9
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 04:01:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594165.927389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbtTK-0001ki-S4; Fri, 01 Sep 2023 02:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594165.927389; Fri, 01 Sep 2023 02:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbtTK-0001gX-P5; Fri, 01 Sep 2023 02:01:18 +0000
Received: by outflank-mailman (input) for mailman id 594165;
 Fri, 01 Sep 2023 02:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbtTJ-0000pF-23
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 02:01:17 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f400:7eab::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d27e562-486b-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 04:01:14 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SN7PR12MB7979.namprd12.prod.outlook.com (2603:10b6:806:32a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Fri, 1 Sep
 2023 02:01:08 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::8931:6349:9a02:48c1%4]) with mapi id 15.20.6745.021; Fri, 1 Sep 2023
 02:01:08 +0000
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
X-Inumbo-ID: 6d27e562-486b-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XPfkI5ksHooLbnMlteDNT9RvW5Pzx3c+/H2/52kB0arDvQe7lvy562g9kClKIGfBlPdDgIuTfRLJ+uXfbeMZj+ya124J289ADoi7rpHD6udyRyilVk3mH70TR/NtFg7+qzDvcvaVylys7Nwf0dSqZkky6/oPqrbeerHrp5u7UXvDeX4UwvAFyfi7+5/5WIPC/tG2h4fYPNu593JmZUok39OEaWTZv4zXc6HqVffHv/0wf33AyNESVioTksLr5Q1uiQhtiS90wpw8z7bny6IkkGxeQDp78FWJCrYZkQ8SXuFj576GrlD15RWmcjF22m7/GVafpEXOKJKLzTNsBPKg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tefaZPbBjZKE8jg6y5E59w4cdQGNU/MmugF1cEd17wo=;
 b=hzd2HajX21rPE03X06wQnOtb59YqtZWxdvVSB9oslSDG5jOeJr/fzVG5aWcJ7bYw8ugthcD6orQlMnvSGQdIbZExDUSzBCmXVnM6OLWFRPULuKkAGy7yj6IrjBf0sSzXzWUjJujHK8Fk7mI2WIJD3Vm0Siu5N7k0CZhO3LIiHuBRnM1/BC6FHxWFd0oTHuRQ+i7xo9RosxDuzQbjjeflCqK/5DVPQBOzK8F1+yY5Ys130Z4Aor/EFvjn7kNUNlngmG1QCqap9tPaPJ/+YvrJLBFvIa2p7COfq1plO4AkHNKtbqh496i9gH4Bx539yoelubb1GiuPTrV3zWJQXXyE1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tefaZPbBjZKE8jg6y5E59w4cdQGNU/MmugF1cEd17wo=;
 b=o9EwpzxeedtQqGEQSXKSnsUCzNAm0qXsvDX4c+BJWyKaLcnFUW50EyveVwyMhWXKeA54w2z6o90fdNVEqEokFOTiw0iDTMStfnjYMs29mnPIubRuNOvPw6Eq+pz/Yg2OZYw6hYPxeg/0UTMrlN3Em8L84zfVdSeop/HzQHGFSmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Thu, 31 Aug 2023 19:01:04 -0700
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: Michal Orzel <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org,
	Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [XEN][PATCH v10 11/20] xen/iommu: Introduce
 iommu_remove_dt_device()
Message-ID: <ZPFF4Hnp0Skc38IE@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
 <20230825080222.14247-12-vikram.garhwal@amd.com>
 <079c831a-bf1e-5489-562b-01cf4e3e6b02@amd.com>
 <ZO-A7ZERxISru9Ug@amd.com>
 <7e622077-2062-f2c6-38ac-81196f80d1d2@amd.com>
 <4f5236f4-39c3-ddc7-3570-2b6bfcd514dd@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4f5236f4-39c3-ddc7-3570-2b6bfcd514dd@amd.com>
X-ClientProxiedBy: BYAPR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::14) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SN7PR12MB7979:EE_
X-MS-Office365-Filtering-Correlation-Id: a0bb132b-057a-4dc2-dea1-08dbaa8f4e97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	N4YVOx2wC9W/IFeLQJQ3B6vx0ZiKL7XOtL8tTPZrgmGWrBCBr1CQyuq7tcfbXzaLHxyvxjKFQ1spb+XRb5/VflbiIVvZJGiA2erTAYi+/o5JRFTEqXfR0qWRLEvJxExnUG6wzkjx/SJW8rn5oGbp+ZCX0DSfDv+N9CTAirOWEWDh2Bu8x8PWEZ9GMLMrpsn5/Vb0ez7X24Xh7zxInn2JV3KXhP3C19jG9Y9G6eqXaxrs1C+Y3HweY9MYfZifjBIk6BYW7h5IdygFoZoVsCY+DLhhy/Qz/M+IoVIvSngQuzZauNwp1r7NBRLmvAWkrkyXvz/bXXxRvmOVsdVLGAgyWVWotXicXOyAaKhO03+4tPo3IDC6pDeux0T0l6MnrZmK1T5w4/OEGklPTXF9z8WR23Sw8WcZ1jUoaWYHnzBefEccAKBtu2DEQPuvaay9+/323ad4QriH2S54G25Sh4BgUiSX6fEtnsOKROIA/A1pOveP7M8g8eoDHh5P5fvT45XGUczX+80Rum4Gs0HnyuuBhGsyvxo/MwGHGxEy7rIORaXeQJbQW2QHxiReubuN1m30
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(39860400002)(136003)(396003)(346002)(186009)(451199024)(1800799009)(6512007)(6666004)(6486002)(6506007)(36756003)(38100700002)(86362001)(2616005)(2906002)(26005)(53546011)(83380400001)(478600001)(4326008)(66556008)(54906003)(8936002)(8676002)(6862004)(66946007)(5660300002)(37006003)(6636002)(41300700001)(44832011)(316002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekthc3ZPOFpOMHlYU28yQ0kxRmk2RmFaL1J6cjQwT1NaN2FDak5waDlkaWcv?=
 =?utf-8?B?Ujc2Sjd6R2pEalp4TVRzWDMrVWpMcnV6Y3hhSUNKNTVha1RGR09zSHBlR3Fz?=
 =?utf-8?B?eWxWd2ErZTN5bjNGZnl1U1NFSnBjZ0pFV2lJeUJXZ1g3eEtKTzlnc0FPcFVt?=
 =?utf-8?B?d21zUGs4VjBmMllOd1dxSSsxUEVmYlhQZnJ2bXI3dytZeEEyUVRvaGE1WU9i?=
 =?utf-8?B?SGxJVHF6Y001bDVQajgwMkFBNkNkTGY1N0VmNU9VVEJQdHl0OHF1OUUyT24w?=
 =?utf-8?B?T2tIYW85ZDVuTDgzTENoUUhjM3dPR2VnckdKZDV4ZktFbWtDSHI0eG1hVUQ1?=
 =?utf-8?B?TTNiL0JXUmhwRzhvTlpvL1J6TUNiZnNDdWUrT0FXS2hqWTV5emFBQmJrL3RQ?=
 =?utf-8?B?Y2lqMXlHYlV3em1BWU41QjNaREJMTnBYZUJ5T1dEblROWHRZRG12V1JtMFJ0?=
 =?utf-8?B?eUxJeU4zWi9SbVR4K0NHVkF5cm1JOFd3b2t3enhlTGJRYWw2SFlqUDJZM3hy?=
 =?utf-8?B?Tzk3SlBZaEF2dzFldDdMeTkwOWRDLzVCV1BnV0RUa3ppY01CekIrcjV3aHZF?=
 =?utf-8?B?UmJVby9tWSsrRzBYU2RVdk10WkZMOE12eFFIM2tKQXd5MWZCWnF0OHdrTWto?=
 =?utf-8?B?cWIxMGFtN1l4VDU1UElmbU5aK2pFOGZ3U0RvNE9hQ3lCeTAwckRHL09OSDdh?=
 =?utf-8?B?VUtFa2hRenh1NWQ4clF3SW1zc2x6NFdFWDBFaFBscWZjZWZEVHo3UEpIR0cw?=
 =?utf-8?B?Z3E3SXdlQ3ZhWlQ3RlRScFp3MmV5Vmd0ekE5ek85MDFCMnlTRmJJUmp6RDl0?=
 =?utf-8?B?THVmM3BncnFWQndLeWZ6NzhNZ2gwTnY3VjFWem8xRTRuMnJaTmpaZEVCTDFh?=
 =?utf-8?B?RkRneVozQm55S29kVW5sMFNrWlJ6ZnU0L05haU1tVDlFdjF6cWtYUjBIeVZo?=
 =?utf-8?B?UldVVUlnSjJONDBFNFZwQnBFQURMTFFaS1Z1ZDZhWU5JRnRNN0p5bXk4d0pt?=
 =?utf-8?B?Qy9rL0gwb1Z4a2pWVHlDK2g5SmFDVGIrcGJGL0pYa0pnNmZtQWpwWDQvQWpS?=
 =?utf-8?B?R0lDd3kybVBSS0RNVUcxbDcxZ2VnNzdscHB2UENzYkI0RXB0OENoTWRBdEZa?=
 =?utf-8?B?M2RkeDNGTTdlSXErclRjcnIzR3dFRnM3NXFia1BVZ0JBQ3hoY1k1MkNucmIz?=
 =?utf-8?B?SHMybFd4SVh5Z0U0bzM1LzN2bjFKN3BBMGErcldqblZrT3MzdnNNb244WmVz?=
 =?utf-8?B?QXAvbEtqcDAzMUlwT2pjTVJQYmNKeEJ4L1B6NG15cnVIcWJFNnNUS2VqVEFP?=
 =?utf-8?B?ekNWWWhlZ1JKeWpiR2JkSTJvMzJVdWF2UUVnN3VNSVpCTGMrdjR2TzF2Q2Z4?=
 =?utf-8?B?RG9EYklJcWFFUU1lTU9nSkpHT2VPQlZKamxMcFBzeCtCY3BKa2U0OFh0bkNh?=
 =?utf-8?B?ejJwOGVjTlIzK25OTUcxc2Jlb1N3RC9EOFpRajBvb2J3eHMzNk8yNjRjcHM3?=
 =?utf-8?B?VmlSL09wOThza1I0Y1k0TEFVTkxJaVVyS0ZENFY5YlBCbnU1QTlCZ2QyM3dC?=
 =?utf-8?B?S0NzREFHcllxNHRqN3g0R2U5b2hQRHhBSnRxT0cwTUN1S29xMnV1VzdHMU5y?=
 =?utf-8?B?WW1kVFYrS1ZBVjBCWU8vOG5kSUlONWZHcDJmVWk3ejVuY0o5cTRHeDdaSXd4?=
 =?utf-8?B?U25oZ29xOTRUaDFNajNtaWw5dndXSDdOWFVmM01ZS0FDcElCK1FGVlR2UjRW?=
 =?utf-8?B?b1prR0o4MVlRVjNMWHdORE84THd6QkxxQk1kbStTTElVZkM5QnV3bndKNG55?=
 =?utf-8?B?SVR6SVNiTW1Ed2pJdmZLNndXOW5YdVZYS2pIalMxSk8xOTNNMk5nRjlCVHBl?=
 =?utf-8?B?K2FZK0hXdjFFVnN2WGhiWnRacTNFR3lBSXVVSVhaQzJ2elM3RHFCZUk4QURr?=
 =?utf-8?B?OXNaN2thY1NZN2t0b2Eyb1M0WjhGcnVNNk9hTTUwYTZFdGNnUUV3TVFBNWQr?=
 =?utf-8?B?NmRiQy9kVEVZUExSUU1jS2FQMFlqR2ZGUERXdlVyaldPNUY1YnFCWnVTTlc3?=
 =?utf-8?B?RElsRnFzQm5XTkEyakVTYlA4U3lkRW5iMjc4cXN4VUdCdDNqVTlYVVRtZTZU?=
 =?utf-8?Q?hRNEiIOwjMbr2feL4Re85ZHcS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0bb132b-057a-4dc2-dea1-08dbaa8f4e97
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 02:01:08.1835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xB4j7hjnB/2q9NzCM0oPR7QoFH67Pzi3rc7qkgB0IjFRj/efZABwji1tub7S0RqBOCYzTBmtqIIA02oSE4cQuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7979

On Thu, Aug 31, 2023 at 09:32:48AM +0200, Michal Orzel wrote:
> 
> 
> On 31/08/2023 09:23, Michal Orzel wrote:
> > 
> > 
> > On 30/08/2023 19:48, Vikram Garhwal wrote:
> >> Hi Michal,
> >> On Tue, Aug 29, 2023 at 10:23:30AM +0200, Michal Orzel wrote:
> >>>
> >>>
> >>> On 25/08/2023 10:02, Vikram Garhwal wrote:
> >>>> Remove master device from the IOMMU. This will be helpful when removing the
> >>>> overlay nodes using dynamic programming during run time.
> >>>>
> >>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> >>>> Acked-by: Jan Beulich <jbeulich@suse.com>
> >>>
> >>> You don't seem to handle Julien remarks for this patch made in v9.
> >>> I will forward them here to avoid answering to old version, but for the future, do not carry the exact same patch
> >>> if you haven't yet addressed someone's remarks.
> >> This got skipped as I cannot find direct email from Julien. The only email reply
> >> on this patch is can find is from: xen-devel-bounces@lists.xenproject.org and
> >> this got messed up with other larger set of email xen-devel sends.
> >>
> >> Did you get direct email?
> >>>
> >>>>
> >>>> ---
> >>>> Changes from v7:
> >>>>     Add check if IOMMU is enabled.
> >>>>     Fix indentation of fail.
> >>>> ---
> >>>> ---
> >>>>  xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
> >>>>  xen/include/xen/iommu.h               |  1 +
> >>>>  2 files changed, 45 insertions(+)
> >>>>
> >>>> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> >>>> index 1202eac625..3fad65fb69 100644
> >>>> --- a/xen/drivers/passthrough/device_tree.c
> >>>> +++ b/xen/drivers/passthrough/device_tree.c
> >>>> @@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
> >>>>      return 0;
> >>>>  }
> >>>>
> >>>> +int iommu_remove_dt_device(struct dt_device_node *np)
> >>>> +{
> >>>> +    const struct iommu_ops *ops = iommu_get_ops();
> >>>> +    struct device *dev = dt_to_dev(np);
> >>>> +    int rc;
> >>>> +
> >>>> +    if ( !iommu_enabled )
> >>>> +        return 1;
> >>> J:
> >>> The caller doesn't seem to check if the error code is > 0. So can we
> >>> instead return a -ERRNO?
> >> Will change the check in caller. I want to keep this as it as so it looks
> >> similar to iommu_add_dt_device().
> >>>
> >>> If you want to continue to return a value > 0 then I think it should be
> >>> documented in a comment like we did for iommu_add_dt_device().
> >>>
> >> Will add comment before iommu_remove_dt_device().
> >>>> +
> >>>> +    if ( !ops )
> >>>> +        return -EOPNOTSUPP;
> >>>> +
> >>>> +    spin_lock(&dtdevs_lock);
> >>>> +
> >>>> +    if ( iommu_dt_device_is_assigned_locked(np) )
> >>>> +    {
> >>>> +        rc = -EBUSY;
> >>>> +        goto fail;
> >>>> +    }
> >>>> +
> >>>> +    /*
> >>>> +     * The driver which supports generic IOMMU DT bindings must have this
> >>>> +     * callback implemented.
> >>>> +     */
> >>> J:
> >>> I have questioned this message in v7 and I still question it. I guess
> >>> you copied the comment on top of add_device(), this was add there
> >>> because we have a different way to add legacy device.
> >>>
> >>> But here there are no such requirement. In fact, you are not adding the
> >>> the callback to all the IOMMU drivers... Yet all of them support the
> >>> generic IOMMU DT bindings.
> >> Will change this.
> >>>
> >>>> +    if ( !ops->remove_device )
> >>>> +    {
> >>>> +        rc = -EOPNOTSUPP;
> >>>> +        goto fail;
> >>>> +    }
> >>>> +
> >>>> +    /*
> >>>> +     * Remove master device from the IOMMU if latter is present and available.
> >>> J:
> >>> I read this as this will not return an error if the device is protected.
> >>> However, AFAICT, the implement in the SMMU driver provided in this
> >>> series will return an error. So I would suggest to replace this sentence
> >>> with:
> >>>
> >>> de-register the device from the IOMMU driver.
> >> Will change the comment.
> >>>
> >>>> +     * The driver is responsible for removing is_protected flag.
> >>> J:
> >>> Can you add an assert in the 'if ( !rc )' block to confirm that
> >>> is_protected was effectively removed. Something like:
> >>>
> >>> ASSERT(!dt_device_is_protected(dev));
> >> Is ASSERT really required here. remove callback can return before setting is_protected as false.
> > I think Julien wanted to add extra check to make sure driver behaves as expected.
> > That said, his suggestion is incorrect since the callback can return before clearing the flag.
> > So, if ASSERT is required, this should be:
> > ASSERT(rc || !dt_device_is_protected(dev));
> > so that we check for is_protected being false only on callback returning success (i.e. 0).
> I wrote this based on iommu_add_dt_device(), which does:
>     if ( !rc )
>         rc = ops->add_device(0, dev);
> 
> but looking at iommu_remove_dt_device(), where you have:
>     rc = ops->remove_device(0, dev);
>     if ( !rc )
>         iommu_fwspec_free(dev);
> 
> you should do what Stefano suggested (i.e. just add ASSERT into ( !rc ) block)
Added it in v11.
> 
> ~Michal

