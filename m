Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF56C2E6E
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 11:11:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512283.792170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peYwm-0006VZ-Ga; Tue, 21 Mar 2023 10:10:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512283.792170; Tue, 21 Mar 2023 10:10:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peYwm-0006SC-Cp; Tue, 21 Mar 2023 10:10:28 +0000
Received: by outflank-mailman (input) for mailman id 512283;
 Tue, 21 Mar 2023 10:10:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gvkR=7N=amd.com=Ray.Huang@srs-se1.protection.inumbo.net>)
 id 1peYwj-0006S3-V4
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 10:10:26 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95dfe18c-c7d0-11ed-b464-930f4c7d94ae;
 Tue, 21 Mar 2023 11:10:22 +0100 (CET)
Received: from DM5PR12MB2504.namprd12.prod.outlook.com (2603:10b6:4:b5::19) by
 MN2PR12MB4568.namprd12.prod.outlook.com (2603:10b6:208:260::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 10:10:16 +0000
Received: from DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022]) by DM5PR12MB2504.namprd12.prod.outlook.com
 ([fe80::4f9:60f8:cb12:d022%3]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 10:10:16 +0000
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
X-Inumbo-ID: 95dfe18c-c7d0-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TBed0m6L2HTS7LvuSgkmN6kta5XjDRttBs1HpmxJHnvrQ+s5ItHK3qqGKbmr3VUiX8zYpFM/WF0X3kFiTcoaV1QM3c2ma6r1H+u2CjPDizQ6eLsRl+KD1gOZqXJ/9fZM48B0fABoCp48JtnAgnqHGBTJozqphux7D7g8e4Pkv6yRy/bX8EdPNWiFQ6Zon2mNfVQI5mblSGqAy1/od6IBtMELxBj41wBnJr9NMdOG6kFRAwpUQLq03xSsVONTKd2LiK1IUQ+zUqC20Yby3E45JeEOSVyPy1rRi36uEdQ1qK6X12qli0d5KnBtrw3k4ZRl6CAQmR3UD8sFnOtLuO/r3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4KR8SS7bAJAEyjjkp2H+c3Jo+wmQy4iL5rXZ577QZr4=;
 b=Wj47Kzp3JjCaxBwpPvu+KFRkDCEuRnHYLtid7yvhRoFgiYGsRbg+/0grAKYCBIYZrYZXbN/vpPNnbmoNpjK+v2uYAHTVDULieCA4xe9osbvHz2fRIxyJd8DRc342OmwucD2cp4cYEaVBkgT2BjXZazNciEtkqicuhWXik8WFnXCmhvRL87bWSXde3wUVmoaRuAw+YdRv+2AMl4cbgB8/xF8fExCGdlFteUaQtCDOYj2Cxe61pqTFKsnyGxJXMHyD7MVNJN4SeBB3Ogx+2tUJ2QhLKQaKKfgqC8l+/+GZhwLBDXcnw4hfDWLxIvIyTtG2MLFaUvxSMHr+gikElnlX4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4KR8SS7bAJAEyjjkp2H+c3Jo+wmQy4iL5rXZ577QZr4=;
 b=m8JTzizn138kYoax9CfFggszzsYDHSEsDM0VFfsCakPefVNnzsHxWjvM+tA0w8C0FtvlrsJj9pqDmYnDhoYXvZEmZ0i79DZb2U3HgtHk9k9QrEGBQQA8xVE/rmDmTizYC6ICsfoDUJUvEmwdg2j67qb2SCCx3oYFYIQ5BU6RBF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Tue, 21 Mar 2023 18:09:48 +0800
From: Huang Rui <ray.huang@amd.com>
To: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Deucher, Alexander" <Alexander.Deucher@amd.com>,
	"Koenig, Christian" <Christian.Koenig@amd.com>,
	"Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	"Zhang, Julia" <Julia.Zhang@amd.com>,
	"Chen, Jiqian" <Jiqian.Chen@amd.com>
Subject: Re: [RFC XEN PATCH 3/6] x86/pvh: shouldn't check pirq flag when map
 pirq in PVH
Message-ID: <ZBmCbORdc5+xxF9R@amd.com>
References: <20230312075455.450187-1-ray.huang@amd.com>
 <20230312075455.450187-4-ray.huang@amd.com>
 <ZBHq+UeK/lBj3s8l@Air-de-Roger>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZBHq+UeK/lBj3s8l@Air-de-Roger>
X-ClientProxiedBy: SG2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:3:17::35) To DM5PR12MB2504.namprd12.prod.outlook.com
 (2603:10b6:4:b5::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR12MB2504:EE_|MN2PR12MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: ececc15e-1f67-4798-23cf-08db29f4778c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p2ISpOzuNlqt7ZW8Y5C6+0IN/2zyHnUzlgYPwL9kUASwYJ/mZgbfUnfbnHouk8L15MfIzDdESMNE1wkvIosU2dwgPUH/jN4YyrraVIM+TD4yJPju/QayzfZ0hKGLg4skxahE5EVVi8g2w8TbxcyddWO3PIKfdUhDTdsKutReHuAOjzm7pRRaLxCu5jaLaaizbjozDRTYtPDU9PXqgcMtAUyDMFky+s5JWNW0onlIU1Tzo7MTSeBibPXEAMKuXaAzmlJd7GF08pB7kDKV+j2vgSwSr4lNqM1vjpYRxnKsAc/zTGisApiRE5giGAiCJBn0EVFB5RpcZrS37nXLH4h82Cn5qL0PfIogIj/0pupcT1Zv8V4Gk9rkoR4+EWTza24di3ao2eJsOM76G7txPZU97kQTmLj6I0E2BgjXIDLvdGnm/iw3Hul0Zh1EUYnfMDRMtCyYRxInGBRHLTX0a7ZXCv+G0sslErII1PPuVbJIbmlDg+J8/y6fo4duQa23foOuzExNYsUE1HBXKBWbHq7WXrDkZL3AKpn73FpKtzcp1rnZzfYC2aXosFuOE1Y+0ufvzrRb7qDG5TR66+XyhLY7bQFGUPhRbScM04lQeI47FmNTnoKXFrgZ3Jdoc5NVr0rbIJJAnv3XyI+NLWg1vZmVxT8ND0bTr/5wWanylanwn85gaGAZjYcTN1JgcbhCNt7+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM5PR12MB2504.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199018)(2616005)(6512007)(6506007)(6666004)(26005)(6486002)(6916009)(478600001)(8676002)(54906003)(186003)(66476007)(66556008)(66946007)(4326008)(83380400001)(316002)(8936002)(2906002)(41300700001)(5660300002)(38100700002)(86362001)(36756003)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?j7EapjRERsVsy+XuspMpmDd22qa61ldBR7o1DwMR1/VcG06bJzzsAl2IJu?=
 =?iso-8859-1?Q?CBXn26xY0Mz9CJF/NCC9jUeKKoyYL+xySE9MYTEqfi/84YXk2RwTULUlIB?=
 =?iso-8859-1?Q?0YaW4HS0Oxzg/gQbo6Kpn1ApirzZvxLPfO42q6699crSak8sHbcVBIwv0k?=
 =?iso-8859-1?Q?7CXwS/VUyBx+YnpYBusDDLJ8PZKZdwoXJHc/l1DM3UrVyUVg8nGZyZdAEi?=
 =?iso-8859-1?Q?ga48/ZSkq0yGS5+y3E+FcaNvVuHpiTh3aSj0EG++b3iEMNdFTRE14+kbWZ?=
 =?iso-8859-1?Q?a/cGC1B9ApIbzey9Co/PB9aaYokKwyiv3HAokcNjJGz3Z8tgOonQJVDLfG?=
 =?iso-8859-1?Q?/xoU6cpoTjkMvacUd3XDJrON9gWibS8T8onv7/3+OCvHRSv1ZXVb4fu9HR?=
 =?iso-8859-1?Q?KLzJ5PU/MJTcIlJX7QWg3HOY1pTdiN/bn+MPi7YZyAkZfAcLp6BnyW4rph?=
 =?iso-8859-1?Q?szG+WkZkrpMR37BOGhJWKj2L76Faxwy7vPXUdPGI/X8OBWl4o60c8v2edg?=
 =?iso-8859-1?Q?Ai1WvfpbvU0R8l8iU6QvBbgQfzSlp8zLubrJagjoC2mVrs5coA9sOdsuJu?=
 =?iso-8859-1?Q?QVeV7qKdM7YYHxGe9ANxijgXAeCBmOJkvvs31bpzO/jUAfAe16dSoTftwE?=
 =?iso-8859-1?Q?+uXPSupOclstDov3gh2ChcrBtYLKVyz4HanXjYEMnfWPcj23peJI7BrEFY?=
 =?iso-8859-1?Q?kqTSAudQhmXM6Jgfd7JnuVmnFJBee5ltA8y4AYvlRuFx0vINas/rnPbrWa?=
 =?iso-8859-1?Q?mPLvudN3qpYYDlKHhOT/KLeNbKSQhb+UuhrxT+T1h5cNl3BEcR8lXV8KbL?=
 =?iso-8859-1?Q?fWSYyONfDDEkzJoYglmmij/fIhPDg89ducGv9UJJczbStz6anu3V3l+Sgd?=
 =?iso-8859-1?Q?I8HFSU7Ja5Y9lAv2mCvmbme8lAF3c+9LP8cYGdVLVSNVPxXU6bJytEiBuq?=
 =?iso-8859-1?Q?6F5hziMt+ze4cJBfeNMzrA15RXXbthGigLSp0ImNHgqiiTC80Ghkmyoxa/?=
 =?iso-8859-1?Q?6o7Ehq66HSWC500XYy2h5CH0duMfsO1EGATJn/2WASiNJpDANwIKc4TySU?=
 =?iso-8859-1?Q?XRUymBAYvR7CfRu2A8yZhZZye5EBPiH1qMgoKIfgJb+lUQLLmBV+c49x7G?=
 =?iso-8859-1?Q?E3Lilu0+5/bItaj01LByEHPNtjeXqH7uhkHgR3+SYWAJohLKcNTOB/LXuE?=
 =?iso-8859-1?Q?wIQegq1kbP/fD1iPa+QvzT58wb7EgxDSn7Smx0funRHfEUue1ywfPujBf0?=
 =?iso-8859-1?Q?p7MrnJOuV6M8cfYHbxBUEO50Z9HUmrJfzSu6mKNd+MI/xTqpNy8jWNzkRT?=
 =?iso-8859-1?Q?ISlgcZRJcMiI3BIYtEKwqlSj1PNr2YuXY6DorzZUfAgoJyWFgtKxy7DiWE?=
 =?iso-8859-1?Q?jRv8EBk13Gf12uzl+Gs/KPKAUroTV3hDPwgKHU6rFhPNIDRLhz/oGT7mvx?=
 =?iso-8859-1?Q?/ylUdEa+W3yhtSMKfQA5UXyoCcUxBNgcOkxP4B09NgZZhTedHX8g5IwMdC?=
 =?iso-8859-1?Q?ruoSsb10/cmk2JxZm/pRqk20h0PSv3uyjkdcs22D+9Lb2G7p4X8kfe8qse?=
 =?iso-8859-1?Q?sUqV9TwI2Ly3QqB41gzCXDdsD4wE7CE/TQtixjanv+57gLuUhPpC0ZplDf?=
 =?iso-8859-1?Q?PAnAzsL6GXQY2WxeMucnxHpaASDBYu8jhh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ececc15e-1f67-4798-23cf-08db29f4778c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2504.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 10:10:16.1082
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9YlXXKYeOy1wK/X7drn+u2b/EPU2sjPXzmW6L87xvE0L8C7qZnIyLbSboMjr5bkeKyCyWas1X51UEGSOAu/xOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4568

On Wed, Mar 15, 2023 at 11:57:45PM +0800, Roger Pau Monné wrote:
> On Sun, Mar 12, 2023 at 03:54:52PM +0800, Huang Rui wrote:
> > From: Chen Jiqian <Jiqian.Chen@amd.com>
> > 
> > PVH is also hvm type domain, but PVH hasn't X86_EMU_USE_PIRQ
> > flag. So, when dom0 is PVH and call PHYSDEVOP_map_pirq, it
> > will fail at check has_pirq();
> > 
> > Signed-off-by: Chen Jiqian <Jiqian.Chen@amd.com>
> > Signed-off-by: Huang Rui <ray.huang@amd.com>
> > ---
> >  xen/arch/x86/hvm/hypercall.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/hypercall.c b/xen/arch/x86/hvm/hypercall.c
> > index 405d0a95af..16a2f5c0b3 100644
> > --- a/xen/arch/x86/hvm/hypercall.c
> > +++ b/xen/arch/x86/hvm/hypercall.c
> > @@ -89,8 +89,6 @@ long hvm_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
> >      case PHYSDEVOP_eoi:
> >      case PHYSDEVOP_irq_status_query:
> >      case PHYSDEVOP_get_free_pirq:
> > -        if ( !has_pirq(currd) )
> > -            return -ENOSYS;
> 
> Since I've taken a look at the Linux side of this, it seems like you
> need PHYSDEVOP_map_pirq and PHYSDEVOP_setup_gsi, but the later is not
> in this list because has never been available to HVM type guests.

Do you mean HVM guest only support MSI(-X)?

> 
> I would like to better understand the usage by PVH dom0 for GSI
> passthrough before deciding on what to do here.  IIRC QEMU also uses
> PHYSDEVOP_{un,}map_pirq in order to allocate MSI(-X) interrupts.
> 

The MSI(-X) interrupt doesn't work even on the passthrough device at domU
even the dom0 is PV domain. It seems a common problem, I remember Christian
encountered the similar issue as well. So we fallback to use the GSI
interrupt instead.

Thanks,
Ray

