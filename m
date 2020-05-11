Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E77F41CE8A3
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 00:58:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYHNM-0003et-6f; Mon, 11 May 2020 22:58:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nZYY=6Z=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jYHNK-0003eo-Iv
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 22:58:18 +0000
X-Inumbo-ID: e6fd6876-93da-11ea-b07b-bc764e2007e4
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (unknown
 [40.107.75.42]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6fd6876-93da-11ea-b07b-bc764e2007e4;
 Mon, 11 May 2020 22:58:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PiU3pPYgCT8zd5wAa2Mm1Bs7sDX8BPvvqIw8JdlrLGfyBdj70i1SRxLnnium+u1/+pRbjvcD445rHMLVoM/S+yxSmdZTLFK/f5uAO2sP74E6L4KTDYVn8Gr9WYvZSOLoe88OAj0vb2zTM2PgFPCTmiv7q/sg2XduRByNZc4H4KEziMLNTw7f9sHtUcuzUbSnSW/SPMoGMSqwpZRjUdMODZvfOHBeLdbKBmjE/dYFD6S+VbQzvo7GaHI/38HA0jHSZ4thfR4pVtZSoV54VSf0Ce6xpV+SfVnbs0TbcPx8JF2xf6pVHZdpbbjNYXcnlmou7zjWnYNFQ/oM+5Onos4qIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5CEMu3z68dH/mrbR1Lvb8MxsL5xs/aDZWZz3J8TNTY=;
 b=Ubvb4aMUbcNVLQaqIScRxF6o4px3aG4OYfTW86630kNEhd2SKes+an6cf+HJRnUf1x9HWxqgaLluYiA/RqQObPEmKUJlFnAo0i/K7u5QhInFfbmNnyKsLKSXfNpBk5pxEwOFUzoWmS9WfXzzhwUjrUMlVw14qE9gq5hgT0fU34orYjNZJZawO+wmvAB3kN2wNOjv7Acqe60xJ8bn85GXER7o2IOTJ1ZIyiRERDuUP2fJrYV9+PH+oE3ql3RVBMSkGnUXGZgcJS1HYqDNQJCFm+45+BFAOAk3qXXc19/hdGvw0FwQZBecR9VrcSMUNXgylo6Er8N7FGr+/Sbonpx4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K5CEMu3z68dH/mrbR1Lvb8MxsL5xs/aDZWZz3J8TNTY=;
 b=QkiXt4TtLDKaS9ZIQFGmlizuLnTdfmU/ofnUewFpPws8ISfhISPBezh+7vX9WHLmqNnIZkvLCDcCOXcDukrS3ynznPrZDXE/QQjtyHILg5Hh49e4ohBfhvSeig6KkSvAxa6VNVYcNNp7H5Vr/MoFcOeIDwYupbm1aspRIOGzrDs=
Received: from MN2PR12CA0024.namprd12.prod.outlook.com (2603:10b6:208:a8::37)
 by BY5PR02MB7060.namprd02.prod.outlook.com (2603:10b6:a03:236::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.35; Mon, 11 May
 2020 22:58:15 +0000
Received: from BL2NAM02FT005.eop-nam02.prod.protection.outlook.com
 (2603:10b6:208:a8:cafe::b9) by MN2PR12CA0024.outlook.office365.com
 (2603:10b6:208:a8::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Mon, 11 May 2020 22:58:15 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT005.mail.protection.outlook.com (10.152.76.252) with Microsoft SMTP
 Server id 15.20.2979.29 via Frontend Transport; Mon, 11 May 2020 22:58:14
 +0000
Received: from [149.199.38.66] (port=34857 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jYHN0-0004nZ-Dp; Mon, 11 May 2020 15:57:58 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jYHNF-0001MK-Sm; Mon, 11 May 2020 15:58:13 -0700
Received: from xsj-pvapsmtp01 (mail.xilinx.com [149.199.38.66] (may be forged))
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 04BMw9pn002845; 
 Mon, 11 May 2020 15:58:09 -0700
Received: from [172.19.222.70] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jYHNB-0001M3-Fc; Mon, 11 May 2020 15:58:09 -0700
Date: Mon, 11 May 2020 15:58:09 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 10/12] xen/arm: if is_domain_direct_mapped use native
 UART address for vPL011
In-Reply-To: <8c01cb1a-0745-3eca-a45d-09c9297163ce@xen.org>
Message-ID: <alpine.DEB.2.21.2005111543330.26167@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-10-sstabellini@kernel.org>
 <05b46414-12c3-5f79-f4b1-46cf8750d28c@xen.org>
 <alpine.DEB.2.21.2004301319380.28941@sstabellini-ThinkPad-T480s>
 <7176c924-eb16-959e-53cd-c73db88f65db@xen.org>
 <alpine.DEB.2.21.2005081601400.26167@sstabellini-ThinkPad-T480s>
 <8c01cb1a-0745-3eca-a45d-09c9297163ce@xen.org>
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
 SFS:(7916004)(376002)(346002)(39860400002)(136003)(396003)(46966005)(33430700001)(54906003)(33716001)(70586007)(53546011)(26005)(316002)(186003)(47076004)(82310400002)(33440700001)(82740400003)(70206006)(8676002)(426003)(8936002)(356005)(478600001)(81166007)(2906002)(9786002)(9686003)(4326008)(44832011)(336012)(6916009)(5660300002)(42866002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dea80352-44ca-4e90-0f26-08d7f5fec942
X-MS-TrafficTypeDiagnostic: BY5PR02MB7060:
X-Microsoft-Antispam-PRVS: <BY5PR02MB70602B158118E359DB604DBFA0A10@BY5PR02MB7060.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 04004D94E2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MaeGaLXcpgKumLqDb11fEekkt9OjEYr7kXp2RY/pQjiX4clHBjnqyB/CXGqykRN4HyWcen17kdC/d1AOs/W6EDuIzZuF/WsixFQXM/w/4e3fOAxnHjvVhXrk1AGQBRo+Dq0QhYNL9NY3EPVIMJzt+Wclhf7d6N43dMsXBlB3Ld05/KW4TawytQgOscudEqnGs7RofKyD4plJgOcj8hr75kCSoZLjjg7WGI/SiSgaisdRgxtFsTW2K37NEeXYvBgMS3f+kLFt7FIOgDtYo8kOVw4ckhEuEmqz1ckHZJooZ4dsxyvAA7ePYHdXq8WR4bXKcJVwrlidtYPAK9mJoffhH47hMINlWprPLEAVARdcGVeVzG2YxqWUL/mBGst+bzLh7i7jJLicdXtFCkrXWTP3zDSfFYZbiOSAhmCQbgOsrHjlUYYTAwvHrvb1maA0JBtAvT5CXSUUlr+6yDAsBj2h/UQEGZMLY3H9Wn0TQ1lxPOCB119pl6RZV0VcV2iuT4YpN1ECr3c6+MDsmgM6w0lsvxo6rH5yh3kpkUpZ6VpenAP1lcNETJIiHvTj5mPxv4vhSQ8tia1tje0sk8Vvmnc+2aLlFqKul1yVbIWCP6rBeVw=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2020 22:58:14.3182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea80352-44ca-4e90-0f26-08d7f5fec942
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7060
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
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Sat, 9 May 2020, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/05/2020 01:07, Stefano Stabellini wrote:
> > On Fri, 1 May 2020, Julien Grall wrote:
> > > On 01/05/2020 02:26, Stefano Stabellini wrote:
> > > > On Wed, 15 Apr 2020, Julien Grall wrote:
> > > > > Hi Stefano,
> > > > > 
> > > > > On 15/04/2020 02:02, Stefano Stabellini wrote:
> > > > > > We always use a fix address to map the vPL011 to domains. The
> > > > > > address
> > > > > > could be a problem for domains that are directly mapped.
> > > > > > 
> > > > > > Instead, for domains that are directly mapped, reuse the address of
> > > > > > the
> > > > > > physical UART on the platform to avoid potential clashes.
> > > > > 
> > > > > How do you know the physical UART MMIO region is big enough to fit the
> > > > > PL011?
> > > > 
> > > > That cannot be because the vPL011 MMIO size is 1 page, which is the
> > > > minimum right?
> > > 
> > > No, there are platforms out with multiple UARTs in the same page (see
> > > sunxi
> > > for instance).
> > 
> > But if there are multiple UARTs sharing the same page, and the first one
> > is used by Xen, there is no way to assign one of the secondary UARTs to
> > a domU. So there would be no problem choosing the physical UART address
> > for the virtual PL011.
> 
> AFAICT, nothing prevents a user to assign such UART to a dom0less guest today.
> It would not be safe, but it should work.
>
> If you want to make it safe, then you would need to trap the MMIO access so
> they can be sanitized. For a UART device, I don't think the overhead would be
> too bad.
> 
> Anyway, the only thing I request is to add sanity check in the code to help
> the user diagnostics any potential clash.

OK thanks for clarifying, I'll do that.

