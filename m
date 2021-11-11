Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D9B44DC51
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 20:47:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224894.388450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlG20-0003cC-CB; Thu, 11 Nov 2021 19:46:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224894.388450; Thu, 11 Nov 2021 19:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlG20-0003ZV-93; Thu, 11 Nov 2021 19:46:44 +0000
Received: by outflank-mailman (input) for mailman id 224894;
 Thu, 11 Nov 2021 19:46:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zPDt=P6=xilinx.com=fnuv@srs-se1.protection.inumbo.net>)
 id 1mlG1y-0003Z9-OF
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 19:46:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe59::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15b08191-4328-11ec-a9d2-d9f7a1cc8784;
 Thu, 11 Nov 2021 20:46:39 +0100 (CET)
Received: from BN9PR03CA0255.namprd03.prod.outlook.com (2603:10b6:408:ff::20)
 by MWHPR02MB2800.namprd02.prod.outlook.com (2603:10b6:300:108::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.18; Thu, 11 Nov
 2021 19:46:36 +0000
Received: from BN1NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::ce) by BN9PR03CA0255.outlook.office365.com
 (2603:10b6:408:ff::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.15 via Frontend
 Transport; Thu, 11 Nov 2021 19:46:36 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT027.mail.protection.outlook.com (10.13.2.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Thu, 11 Nov 2021 19:46:36 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 11 Nov 2021 11:46:36 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 11 Nov 2021 11:46:36 -0800
Received: from [172.19.2.115] (port=51582 helo=xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mlG1s-000Ca0-1s; Thu, 11 Nov 2021 11:46:36 -0800
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
X-Inumbo-ID: 15b08191-4328-11ec-a9d2-d9f7a1cc8784
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J2bN6kijWWMPZRXWWjT5DPALTF/VHXJKXCSo/UXr5MhkXKSrWioIHhKRC1+OVx4m0/9SbYr9px7vvgPWywtinbacYBlr+jn+C4N8gys0jPT3HEsuESLJP2jTEzUOJMW7AC8Ar7MB4ZIzRZmMJnG/9of6qKCAIoSnGqb5M78N1t7QGlBAdtU9TCJreS1IN/ACwxQcLqmWfAryzveby9NAxSygu5f4CGTTrv5EWCshsmiBTv5l0RqMHqtT1dE/mm7AGnkyielkPjqENtZQw+mHRVMTCorMtnV9tn0ikvW81PxM+8k5aeM04FnjdpuhLR21GYn2qM6ICFzxuDgbvmp7Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oanxJCqxuD8biqDND0jkyeBJtkq1ZVjdDJ9JTMfrVXE=;
 b=IPQBZYWfs8kDuhXznEiTbq8LVwUAJAp/zHygzR9IKG3XYgHn9aIuRYwpQg9WvrMPoDj1fCKirJYfGL1q4AAqgmyoOmuKhx+22j4HIyN3XRSP3R3i3QpUga1txdwhn9ZaEiaHOvJhHbmgpBnrCSTC9h+ZDupY68Rh40ThzefTIGamg5NUjy7vHU9uhwDmzH/As0PTbCfm6ReFFszSoLVlGjtDanpWWCbfqdyf1At834aPd3XBkBNNlSy1ez20kLNZurNkFlmJOh96hFPDpwXk+E7Xb2ta/h/8M9twrLJEqxHfij7A5T8MxvtHfiDSI4dzb5HHmoWxiOmhWAVtMPnWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=citrix.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oanxJCqxuD8biqDND0jkyeBJtkq1ZVjdDJ9JTMfrVXE=;
 b=tYUo3ia0rhzQ7xMp7C0z86zRLCY8E2wVAZJRTomGiLNc7AWPAJZGgaMYntYTLlXa+PfMFqgDX/yz0wJwtF/tyUpfEHMP+0Hron+y6sdic/VYd/IYEQN9gMi9gdx+zH/O7knL8wVcZrfUmV9xmwDzX4eRWRK8KI/aGN++0d5iThU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Date: Thu, 11 Nov 2021 11:46:36 -0800
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: Anthony PERARD <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <bertrand.marquis@arm.com>, <volodymyr_babchuk@epam.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>
Subject: Re: [XEN][RFC PATCH v2 10/12] tools/libs/ctrl: Implement new xc
 interfaces for dt overlay
Message-ID: <20211111194634.GA211320@xilinx.com>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-11-git-send-email-fnu.vikram@xilinx.com>
 <YY1KwUC7EaJC4vJa@perard>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <YY1KwUC7EaJC4vJa@perard>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 95e5f4fb-4b67-4e73-e658-08d9a54bf8ea
X-MS-TrafficTypeDiagnostic: MWHPR02MB2800:
X-Microsoft-Antispam-PRVS:
	<MWHPR02MB28007655CDD02FB9411946CBBC949@MWHPR02MB2800.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mpSRPYbxq8r+lFczRFc0ju8GHS9dN3UEvIRyDo/UdXhapccdjQlHdzEkTNMU/9MouzoZiwQetQVPExqz0kbtV7SoDevMitCbG5pauTZlEFD9cVXermFrXhznGnPzWS/KpSOUq9TnwRgu/4I3Lk3cQcgR5ib7CANg7c/RY1FlcVC9eTcKAg84a1UVeo3orUctiBsOJpAl5QaXlV3Bx1lF0aq79Y5Pnu1/mWpaoHe1ef6h4ldCIIuwDZVKe4cWN5q1+gQyTtQ27n3q4Tyq6kkPmA2G8vnDVI3v+ZHTUZLf2zf1jVjJOOw5Zcdz9Ss9jKJDcoqn0v76sz5Zg9API4p7fqSIJEIzynBC3XlU9QKS0tgZZm9B5ANft+K2aJICUYxk/xdB+9ej+eGm6byJfla7w3ZyOj1S9J08UGeUX3yBd8qRC3QAETAqG+L+4atjHvhRncozmjw7SMO6e2MdsUgH0XIawAJkX/K67gEUGOGEQmVydtqfhIEbXN6rKb9kfNwj830OTF5aBGkIEQhDN+U2OnJEtT8VK0JjJUkXJSwH1DGRT8GhFqhr+gkaGvoKACBQcY9bQQ1guI7eQjOpVPWG/S9eTb2tKJdH4+wyEcTJyuWK3RI4nv7aAWREcohpeQVHogFxN7wihR16x2f9WNigv3hqz9iO6Y9whZGk10pZH9xGBCXWw8zamx+hamTt41OdHi9OiZYGaCmcE7afHNxU+Ochwib6vxvfibKcQUmrzoE=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(46966006)(36840700001)(7636003)(7696005)(9786002)(70586007)(2906002)(70206006)(426003)(6916009)(82310400003)(8936002)(26005)(336012)(8676002)(54906003)(36756003)(2616005)(316002)(186003)(47076005)(356005)(36860700001)(4326008)(33656002)(36906005)(508600001)(5660300002)(1076003)(27376004);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2021 19:46:36.5500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95e5f4fb-4b67-4e73-e658-08d9a54bf8ea
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2800

On Thu, Nov 11, 2021 at 04:54:25PM +0000, Anthony PERARD wrote:
Hi Anthony,
> On Mon, Nov 08, 2021 at 11:02:25PM -0800, Vikram Garhwal wrote:
> > xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
> > operation type i.e. add or remove to xen.
> > 
> > Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> > ---
> >  tools/include/xenctrl.h      |  5 +++++
> >  tools/libs/ctrl/Makefile     |  1 +
> >  tools/libs/ctrl/xc_overlay.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 57 insertions(+)
> >  create mode 100644 tools/libs/ctrl/xc_overlay.c
> > 
> > diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
> > index 07b96e6..cfd7c5c 100644
> > --- a/tools/include/xenctrl.h
> > +++ b/tools/include/xenctrl.h
> > @@ -2684,6 +2684,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
> >  int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
> >                           xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
> >  
> > +#if defined (CONFIG_OVERLAY_DTB)
> > +int xc_dt_overlay(xc_interface *xch, void *overlay_fdt, int overlay_fdt_size,
> > +                  uint8_t overlayop);
> > +#endif
> > +
> >  /* Compat shims */
> >  #include "xenctrl_compat.h"
> >  
> > diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
> > index 519246b..a21a949 100644
> > --- a/tools/libs/ctrl/Makefile
> > +++ b/tools/libs/ctrl/Makefile
> > @@ -3,6 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
> >  
> >  SRCS-y       += xc_altp2m.c
> >  SRCS-y       += xc_cpupool.c
> > +SRCS-$(CONFIG_OVERLAY_DTB) += xc_overlay.c
> 
> So, this patch seems to introduce the use of CONFIG_OVERLAY_DTB, is
> there a reason why the new functionality can't be always builtin?
> 
Above, if you meant removing "CONFIG_OEVRLAY_DTB" then here is my answer:
This feature is supported by ARM based FPGA devices only so there were a few
comments on v1 series to keep the code inside a config only. Now, for the tool
side also I kept the CONFIG_OVERLAY_DTB to align the xen-tools with Xen.

Although, now i saw your comments on patch 10 regarding  "always provide
libxl_dt_overlay() but which would return ENOSYS when libxl is built without
CONFIG_OVERLAY_DTB". That seems better approach here for all three xen-tool
patches.

Initially, i was not sure what to do here that's why i wrote a question in the
cover letter about this.

Also, do you know how to enable this config via menuconfig when building the Xen
tools? I know how to enable for Xen but not sure about tools.

Thanks for reviewing this.

Regards,
Vikram Garhwal

> Thanks,
> 
> -- 
> Anthony PERARD

