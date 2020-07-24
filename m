Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0584722C2D5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 12:12:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyufB-0003ZT-So; Fri, 24 Jul 2020 10:10:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GqWP=BD=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1jyufA-0003ZJ-81
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 10:10:48 +0000
X-Inumbo-ID: f0eebdd6-cd95-11ea-87eb-bc764e2007e4
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.244.77]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f0eebdd6-cd95-11ea-87eb-bc764e2007e4;
 Fri, 24 Jul 2020 10:10:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kx1/02qUC4E/3GSyLlGDtHa/zTynoHHlol+h+Kc0qVjqNEQ99CrzccpEbxC5vxzispwrR4/kJOP+hmQbVcxaql4eM3eQ2P/En2ag9eW5rc5YQPqj3r5YqhDHfXVHg2fx1D29HQZzJri9nX8JvmxcwFgc+21yCzHRACZJI/0BgY+J8suin0aOoKx7cWjB+B9oylVSvOnfeQiA4sOvr3kXWsOs6mssKUVFYuM8qehFWJifH8uuhgBPUVPKzae5Uum5zKTZp0UV5tVayH1ZJMilvx0X+P6d2TbJK8SyoUb5r88a8PJ0jcug6OJ1et/xKIRD1O6C9HCehdA7ZFoFcL30sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUonZA9j8i16PCdI0fzT8Z9CmO63uN/yPps7RE191vo=;
 b=EZJ425/ZG2ZGVngMhLZxgz7lJwRtOI4sl5mFDE9rOyXXS8i+2jP6UTb+fvm1QqHutBaNL5AzBEAWJy24FdxhlSgeE/IXupJOStP5NHNr+Wx/HjcR/RsIpgnbVLrRDy0NSWOcE5VIFB+mPG1skHkKpEOHUcmtL8oHsdczqIX0eXAXYosP+O+x1b6u1hQuucanFpWPQJsvdVI+cuC4OkcWY+KKXCln3Y+oxJxf7Wl77vcUpW1cRErnQTrs9MzCLq53n4dG2QpGI69KaXOcRnWfUmailYVUCwS1HIk79HT413Uet26JQVOorKPg7Zae3NbaDOnS0zrExF3GZK+4qYJ36Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUonZA9j8i16PCdI0fzT8Z9CmO63uN/yPps7RE191vo=;
 b=MRsBhcrFDz4LJ6lcRbTYxkpbD8JWY57bO179EO+QIWlEMCuO1QmgY9FZ3Jk2IZ6GwX3L68J7KfaEwPTJc1sJY7CS5exK9KO0WtKMvh9CD5muqfYtu+eMnh+r1qPXTCRnHlcBqb3q965J7Biuapd3EvXep58DgCZiu8ZOyPzMfWc=
Received: from MN2PR02CA0029.namprd02.prod.outlook.com (2603:10b6:208:fc::42)
 by BYAPR02MB4536.namprd02.prod.outlook.com (2603:10b6:a03:55::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.21; Fri, 24 Jul
 2020 10:10:44 +0000
Received: from BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:fc:cafe::df) by MN2PR02CA0029.outlook.office365.com
 (2603:10b6:208:fc::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.24 via Frontend
 Transport; Fri, 24 Jul 2020 10:10:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT013.mail.protection.outlook.com (10.152.77.19) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Fri, 24 Jul 2020 10:10:44
 +0000
Received: from [149.199.38.66] (port=47026 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jyudE-0002AN-Mt; Fri, 24 Jul 2020 03:08:48 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jyuf5-00070d-RF; Fri, 24 Jul 2020 03:10:43 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06OAAVLT005058; 
 Fri, 24 Jul 2020 03:10:32 -0700
Received: from [10.23.123.153] (helo=xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jyuet-0006tI-T0; Fri, 24 Jul 2020 03:10:31 -0700
Date: Fri, 24 Jul 2020 03:10:31 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC v2 1/2] arm,smmu: switch to using iommu_fwspec functions
Message-ID: <20200724101030.eznostod3ngsnpea@xilinx.com>
References: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
 <1595390431-24805-2-git-send-email-brian.woods@xilinx.com>
 <alpine.DEB.2.21.2007220938020.17562@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2007220938020.17562@sstabellini-ThinkPad-T480s>
User-Agent: NeoMutt/20180716
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0bc23bda-ca66-444d-ccd0-08d82fb9d3cd
X-MS-TrafficTypeDiagnostic: BYAPR02MB4536:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4536299D6A7B6B160CC466B3D7770@BYAPR02MB4536.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F97vID2GpDBBBRRj29C1QUrvl+IvGCCTN1VXUxsnKMcVTK2DQwJKXI9EclWnEKrMszT/ygPN27Erb4A/I+d6E9s3gJOSy5kwPs/fu9zfLfaJElMB4ATR3btsKf8kYIgtPT757Z17fkcn0H3MY1sk3I1L58eghMQhX5P74vVtLWrKNkHuzt1vvXgty+Nh4MAK2l/fVqXxyqxs+FmgeuPx1nPJWCXuqO+GcliyEAxncryvcxOwVMbEejWYR7frRi6lLU9OD1jcu92M4ASMxRt7QD2ylnVne/FwJDufJW/H6waW81G9scGSAE9Q0oU1bic9J2rprdzeJhWrXbLoQcPkgTQoZi8ehlI5trnkoeaEj1Zg6pfHe08EPzOtVdFpU+eOXtzi4rss+5RMAS3kbtjRj7x/4K5JkHELVc1lsBwKr8w=
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(136003)(396003)(346002)(39860400002)(46966005)(4326008)(356005)(478600001)(2906002)(82310400002)(316002)(8676002)(5660300002)(82740400003)(1076003)(81166007)(44832011)(8936002)(36756003)(47076004)(2616005)(26005)(70586007)(70206006)(336012)(9786002)(54906003)(86362001)(6916009)(186003)(7696005)(426003)(142933001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2020 10:10:44.1800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bc23bda-ca66-444d-ccd0-08d82fb9d3cd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: BL2NAM02FT013.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4536
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
Cc: Brian Woods <brian.woods@xilinx.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Jul 22, 2020 at 09:47:43AM -0700, Stefano Stabellini wrote:
> On Tue, 21 Jul 2020, Brian Woods wrote:
> > Modify the smmu driver so that it uses the iommu_fwspec helper
> > functions.  This means both ARM IOMMU drivers will both use the
> > iommu_fwspec helper functions.
> > 
> > Signed-off-by: Brian Woods <brian.woods@xilinx.com>
> 
> [...]
> 
> > @@ -1924,14 +1924,21 @@ static int arm_smmu_add_device(struct device *dev)
> >  			ret = -ENOMEM;
> >  			goto out_put_group;
> >  		}
> > +		cfg->fwspec = kzalloc(sizeof(struct iommu_fwspec), GFP_KERNEL);
> > +		if (!cfg->fwspec) {
> > +			kfree(cfg);
> > +			ret = -ENOMEM;
> > +			goto out_put_group;
> > +		}
> > +		iommu_fwspec_init(dev, smmu->dev);
> 
> Normally the fwspec structure is initialized in
> xen/drivers/passthrough/device_tree.c:iommu_add_dt_device. However here
> we are trying to use it with the legacy bindings, that of course don't
> initialize in iommu_add_dt_device because they are different.
> 
> So I imagine this is the reason why we have to initialize iommu_fwspec here
> indepdendently from iommu_add_dt_device.
> 
> However, why are we allocating the struct iommu_fwspec twice?
> 
> We are calling kzalloc, then iommu_fwspec_init is calling xzalloc.
> 
> Similarly, we are storing the pointer to struct iommu_fwspec in
> cfg->fwspec but actually there is already a pointer to struct
> iommu_fwspec in struct device (the one set by dev_iommu_fwspec_set.)
> 
> Do we actually need both?

Sorry for taking so long.

Hrm, I've been looking for why I created two fwspecs and I'm not sure
why... It's pretty late, but later this morning I'll try some things
and try and remove it.

Brian

