Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E601CBB8F
	for <lists+xen-devel@lfdr.de>; Sat,  9 May 2020 02:07:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jXD1h-0005IV-9f; Sat, 09 May 2020 00:07:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/fco=6X=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jXD1f-0005HV-DR
 for xen-devel@lists.xenproject.org; Sat, 09 May 2020 00:07:31 +0000
X-Inumbo-ID: 12c47b24-9189-11ea-ae69-bc764e2007e4
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.94.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12c47b24-9189-11ea-ae69-bc764e2007e4;
 Sat, 09 May 2020 00:07:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7HVosScciPnnBGfHsRzlbBRGX/aCtR7cEwz97ZZXRN4ZlPlWmYJsgcc4rpPlo6NU5jGqfCZg2rj8eRn4XOcvoR26Mgs14uDfd1jZsOQwF90ZRmPEhyA7xwVJPWeBgh/+NcNvJHX0R7PNiU3vON4gKW9GonyFuGNVSpnOwW9nhGeMeD+Gib5GpP/UgYjTSAp7JicQObblifRvllTMWiFCztGb+fNGUnitXsIauUufWOfrPd2cAHqYRwcUl+M7eYyB1HIRPCny4DCMSuXEOSeRW+LYTk+lh2XWV9MjbngeD7s2+KJLkGZnAV32dLtlCwUJwmx66slWZ9c68N6X4VINw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XojeCPjyUHJaldrlTDJ9nO2YyaD6JRL0I9Lrsh9Rm68=;
 b=Qlm4O3ErfjYrX1XZvmYvwGemPUZEYnqtgAKazOBSEwyWAW/UX4CIUkos/AfkDsTDszRWw43zFBIJ3UkFXgfznx6gNM7VmESpCNyTL4Vqm7AYfm56cC0uVuHxFdvxoINMYnIIFlMwYYqMLJI6eEjfSdFhJSTPxKyp2L25Hn03+ioF02sfAQPmBH1y4spknw5Nyj5Yc2SkK1puKq+GNw+GIxTI2+ZFg5DidjmW87Osu9u778fCx+0cyeCgsBengWRf1ryL7etmlXXnX7WLuCkTct7NEMmmhC4EVr/U09KE7+5BlVHIlhDOMu+w27q5m6RmJLtWE0SczIZ9Ob6zTt6FbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XojeCPjyUHJaldrlTDJ9nO2YyaD6JRL0I9Lrsh9Rm68=;
 b=KEXuF2Z01JnXYIAQ6nGZZZBK/1iJHepgImTviyNsVycUFakgTKghPWXpXJ987GS+Diz/uZWNtnZZxwpT8YE17ZgZCjFjtxeLIes3BbmjvO3yjqH9twWDc8oVq4Z4GoxIBPmc2f1QbkHWr3m+V6/SqW4c46RlwjVO1xzs2+XNt9E=
Received: from DM5PR13CA0003.namprd13.prod.outlook.com (2603:10b6:3:23::13) by
 DM6PR02MB5355.namprd02.prod.outlook.com (2603:10b6:5:47::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Sat, 9 May 2020 00:07:29 +0000
Received: from CY1NAM02FT058.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:23:cafe::fc) by DM5PR13CA0003.outlook.office365.com
 (2603:10b6:3:23::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.12 via Frontend
 Transport; Sat, 9 May 2020 00:07:29 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT058.mail.protection.outlook.com (10.152.74.149) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Sat, 9 May 2020 00:07:28
 +0000
Received: from [149.199.38.66] (port=58649 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jXD1Q-0000Aj-JC; Fri, 08 May 2020 17:07:16 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jXD1c-0002nr-3s; Fri, 08 May 2020 17:07:28 -0700
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04907I0P027994; 
 Fri, 8 May 2020 17:07:18 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jXD1S-0002nd-39; Fri, 08 May 2020 17:07:18 -0700
Date: Fri, 8 May 2020 17:07:17 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 10/12] xen/arm: if is_domain_direct_mapped use native
 UART address for vPL011
In-Reply-To: <7176c924-eb16-959e-53cd-c73db88f65db@xen.org>
Message-ID: <alpine.DEB.2.21.2005081601400.26167@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-10-sstabellini@kernel.org>
 <05b46414-12c3-5f79-f4b1-46cf8750d28c@xen.org>
 <alpine.DEB.2.21.2004301319380.28941@sstabellini-ThinkPad-T480s>
 <7176c924-eb16-959e-53cd-c73db88f65db@xen.org>
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
 SFS:(7916004)(346002)(136003)(376002)(396003)(39860400002)(46966005)(33430700001)(426003)(8676002)(8936002)(44832011)(82740400003)(81166007)(356005)(5660300002)(82310400002)(47076004)(2906002)(70206006)(26005)(6916009)(478600001)(316002)(33440700001)(9686003)(336012)(186003)(107886003)(33716001)(70586007)(9786002)(54906003)(4326008)(53546011);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fbc0ecb-0939-4738-8377-08d7f3acf605
X-MS-TrafficTypeDiagnostic: DM6PR02MB5355:
X-Microsoft-Antispam-PRVS: <DM6PR02MB5355E3BC01770FA5E64411D9A0A30@DM6PR02MB5355.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 03982FDC1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJ7a4Vf4H7dhL4Hg+SOUbGPGbJzdlo07zrPex28zWCZa3f+nSfN9Le9Bp09tqX8VWI4LvNn9DZceq1EFGve+Z3BTkA6G3Eq4Nx9mzCPTzMkbCX4Ht3K3XrGZrsZIQKOsL3VO8vgUcOVesZCWgfA+gu4bT1ttYWupRnq+K935d2VwJo4tRBhoQFA49n43/crad9eG1rvp2uQD+BFRjyZtPtVxvNcZx5l5fBPASuuwJGmojL2+KZwcetVSNSJtWY2rTaUY+fbHl9uSHLtNmSMY3rSPKxz6eiKKJ5JRlHdVKTH2N+9zsVtwB9M31isgCeatCmqC8+qqTuHmR1cFQb1LVuO/+EuxnYHvOTU9hgACIGCMakQ8XcbdUD9BECFqcYGqhJS8i5ppwmhC/k+R58FpNfImMYA+S7BunC5jHRJgyvL1rh6V8Cq26JfxqvSzAIdOOBXYAjQptHwU5ZFB0I2JJ2mh6P4KF7bYZwqw5u8aShXxn7wXJCPMjGKWfQJrrNonK2HtHU0ccfBZ3aqegMc6YH4OWrGcFnQlaJsHIzo5/fh27TOYs6KyVsWo5oHqo7IoWJ+lmTb8EtHn+DRTV104ug==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2020 00:07:28.3625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fbc0ecb-0939-4738-8377-08d7f3acf605
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5355
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
> On 01/05/2020 02:26, Stefano Stabellini wrote:
> > On Wed, 15 Apr 2020, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 15/04/2020 02:02, Stefano Stabellini wrote:
> > > > We always use a fix address to map the vPL011 to domains. The address
> > > > could be a problem for domains that are directly mapped.
> > > > 
> > > > Instead, for domains that are directly mapped, reuse the address of the
> > > > physical UART on the platform to avoid potential clashes.
> > > 
> > > How do you know the physical UART MMIO region is big enough to fit the
> > > PL011?
> > 
> > That cannot be because the vPL011 MMIO size is 1 page, which is the
> > minimum right?
> 
> No, there are platforms out with multiple UARTs in the same page (see sunxi
> for instance).

But if there are multiple UARTs sharing the same page, and the first one
is used by Xen, there is no way to assign one of the secondary UARTs to
a domU. So there would be no problem choosing the physical UART address
for the virtual PL011.
 
 
> > > What if the user want to assign the physical UART to the domain + the
> > > vpl011?
> > 
> > A user can assign a UART to the domain, but it cannot assign the UART
> > used by Xen (DTUART), which is the one we are using here to get the
> > physical information.
> > 
> > 
> > (If there is no UART used by Xen then we'll fall back to the virtual
> > addresses. If they conflict we return error and let the user fix the
> > configuration.)
> 
> If there is no UART in Xen, how the user will know the addresses conflicted?
> Earlyprintk?

That's a good question. Yes, I think earlyprintk would be the only way.

