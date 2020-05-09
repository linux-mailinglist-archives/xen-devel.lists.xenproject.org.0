Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4741CBB8D
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 02:07:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXD1E-0005Bh-NI; Sat, 09 May 2020 00:07:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fco=6X=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jXD1D-0005BT-MO
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 00:07:03 +0000
X-Inumbo-ID: 029ef5e4-9189-11ea-9887-bc764e2007e4
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (unknown
 [40.107.92.79]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 029ef5e4-9189-11ea-9887-bc764e2007e4;
 Sat, 09 May 2020 00:07:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zme4ZBlaCjpSqGiNjvCVs7dyL0ePyKo3wqnZxDJwUnAcK3pc1j97k/Jx/owzGXcl20Y/LsNgoHCBPogfOhsjXVDyZou/B3LElhmOPnpSq+yYeqok85syuWPFHB+WM+Tbf7GAH1dMhxwtZRxJjwSC/M2O12nAklK0h26914itUtd9agMM4TcdC73CEqBscD+05Sarac0CY1NiyP3F9JJB39IsRdU/4dFVuTXmJ/245AFHWUNRwN0XCgh8eNyvTj6MfiBJS2BgkUbyPxc/qkJfzWw0lNlGNY1ho4BTHYH2o21Z9HGFIb4JIBBylJM0OWxw2zZMgJcZHshtgSEpvfvnuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH0sWIKra/opr9d1Bhi9Dt35s70uZNG4dRQKOY59tIA=;
 b=QmX+03nsLzEHP8NDNeQDdbhzkxYhWjZ8zeBDLtmjYSjigs67FWKaYcIyx/KVMHEn59NZVj8NEmyp8OtQB0e/0fU2be0oTJFR0R2CphSeZlA7uKXZLWOjASnZqtaIOtEGkKSMzpFU6lLkoNaaHSA0lDXRvUPUa/QjDEWePwzuNsaY0ewYuKvlwGKHCqM9dhbCkhX7LKyflzS/tq9z3Cbi91fkdGTRpaemkg4y05cRQjcKBSR20242sNCfVVivh9jNEeR57r3ivQgmcdGlMb9RjAxYsZ4xDZCVP0+f/8uFcsQF2DWKzaIT97sU4yo8Uf0SfQroFdVnU9hX//egYoIX2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZH0sWIKra/opr9d1Bhi9Dt35s70uZNG4dRQKOY59tIA=;
 b=DQ9mzv/yZQ0oASqiM9G/O6BLXdqBtusc7OZEyyUwbWlLfuwuhTwYXE7gt6/6yFJxuc25ocpX05eUyHA0FavlXmsl2Qdhiq1kGAKFYKKhGeSL9Gs6l3k9/asKuCddZ7GiDp4Ve1q66hN7CfH7nPB7YWSCehZIksz7BDdAGsXgT8Y=
Received: from CY4PR06CA0038.namprd06.prod.outlook.com (2603:10b6:903:77::24)
 by CH2PR02MB6950.namprd02.prod.outlook.com (2603:10b6:610:5c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.33; Sat, 9 May
 2020 00:06:58 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:77:cafe::c1) by CY4PR06CA0038.outlook.office365.com
 (2603:10b6:903:77::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Sat, 9 May 2020 00:06:58 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Sat, 9 May 2020 00:06:58
 +0000
Received: from [149.199.38.66] (port=58476 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jXD0w-0000AB-BR; Fri, 08 May 2020 17:06:46 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jXD17-0002lm-S7; Fri, 08 May 2020 17:06:57 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04906oPU027484; 
 Fri, 8 May 2020 17:06:51 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jXD10-0002kr-SF; Fri, 08 May 2020 17:06:50 -0700
Date: Fri, 8 May 2020 17:06:50 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 09/12] xen/arm: if is_domain_direct_mapped use native
 addresses for GICv3
In-Reply-To: <ab281b4d-c78f-15c3-57d3-85d0cef7bec8@xen.org>
Message-ID: <alpine.DEB.2.21.2005081458530.26167@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-9-sstabellini@kernel.org>
 <923411c5-37d4-c86e-c5a8-8acd8a6830e7@xen.org>
 <alpine.DEB.2.21.2004301613220.28941@sstabellini-ThinkPad-T480s>
 <ab281b4d-c78f-15c3-57d3-85d0cef7bec8@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(7916004)(346002)(396003)(136003)(376002)(39860400002)(46966005)(33430700001)(8676002)(8936002)(6916009)(70586007)(70206006)(9786002)(336012)(426003)(82310400002)(47076004)(33440700001)(82740400003)(356005)(478600001)(81166007)(53546011)(26005)(33716001)(4326008)(186003)(107886003)(316002)(44832011)(54906003)(9686003)(2906002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6406708f-257e-4951-6315-08d7f3ace3ff
X-MS-TrafficTypeDiagnostic: CH2PR02MB6950:
X-Microsoft-Antispam-PRVS: <CH2PR02MB695010FF5712BDB7A2145D0BA0A30@CH2PR02MB6950.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFm//OQDTs+cyb+jcewL7XtgezIvBWYSw0sK8w5Bj+rKG4FQITha15M2w8bccis7qocct7r5m57FnuPnIjF4iLzbKWucobmcD218eQVajGU03IuViFkczzQaNODZUqBXF1ny0Qv6M6lotQ4NPolfeYYP3H3fNBrbZoSsq1cxv6xqsv2TMD5SmNsTVcD87oVm/x+MlCoc+ajQ1KDoO5PIS7kbAMVPSVXVJ6hjU9P4dFfC+JEq0Y/32b67EDHfzLJNu+e7B68av5seugLeNLXjPCqT+5yZbZ2+XAD0ex+bZvHMr+kpn8bCyVkePo7Wsa/6cmpN0J9UOzjFeLbX+jCHNAiiMEiWwwfUUVeV+cfVVRCas9pUZF2Z3SJr2OnWkwjEi0HJaG96RHiwIC0YLvGp2aGEoxSaW8HDbm6QsoT22rvDqkP8UM7ke1Ga+gPOvtGvB6erpxxRXC87rRVT1zt3FLO67jXprM1RcuktCNAf921i9BvSlKPvK5is1yn/VuINSSXim2GfcOQA6x7WPSU9DH1XKnqETk/5Xhq/ELHtc8tL/geFO0A0EAd/xIGksyVM4iuxI2EPXCcLpFfwa8apog==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 00:06:58.1234 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6406708f-257e-4951-6315-08d7f3ace3ff
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6950
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr_Babchuk@epam.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, 1 May 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 01/05/2020 02:31, Stefano Stabellini wrote:
> > On Wed, 15 Apr 2020, Julien Grall wrote:
> > > > diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> > > > index 4e60ba15cc..4cf430f865 100644
> > > > --- a/xen/arch/arm/vgic-v3.c
> > > > +++ b/xen/arch/arm/vgic-v3.c
> > > > @@ -1677,13 +1677,25 @@ static int vgic_v3_domain_init(struct domain *d)
> > > 
> > > 
> > > I think you also want to modify vgic_v3_max_rdist_count().
> > 
> > I don't think so: domUs even direct-mapped still only get 1 rdist
> > region. This patch is not changing the layout of the domU gic, it is
> > only finding a "hole" in the physical address space to make sure there
> > are no conflicts (or at least minimize the chance of conflicts.)
> 
> How do you know the "hole" is big enough?
> 
> > 
> > > >         * Domain 0 gets the hardware address.
> > > >         * Guests get the virtual platform layout.
> > > 
> > > This comment needs to be updated.
> > 
> > Yep, I'll do
> > 
> > 
> > > >         */
> > > > -    if ( is_hardware_domain(d) )
> > > > +    if ( is_domain_direct_mapped(d) )
> > > >        {
> > > >            unsigned int first_cpu = 0;
> > > > +        unsigned int nr_rdist_regions;
> > > >              d->arch.vgic.dbase = vgic_v3_hw.dbase;
> > > >    -        for ( i = 0; i < vgic_v3_hw.nr_rdist_regions; i++ )
> > > > +        if ( is_hardware_domain(d) )
> > > > +        {
> > > > +            nr_rdist_regions = vgic_v3_hw.nr_rdist_regions;
> > > > +            d->arch.vgic.intid_bits = vgic_v3_hw.intid_bits;
> > > > +        }
> > > > +        else
> > > > +        {
> > > > +            nr_rdist_regions = 1;
> > > 
> > > What does promise your the rdist region will be big enough to cater all
> > > the
> > > re-distributors for your domain?
> > 
> > Good point. I'll add an explicit check for that with at least a warning.
> > I don't think we want to return error because the configuration it is
> > still likely to work.
> 
> No it is not going to work. Imagine you have have a guest with 3 vCPUs but the
> first re-distributor region can only cater 2 re-distributor. How is this going
> to be fine to continue?
> 
> For dom0, we are re-using the same hole but possibly not all of them. Why
> can't we do that for domU?

I implemented what you suggested

