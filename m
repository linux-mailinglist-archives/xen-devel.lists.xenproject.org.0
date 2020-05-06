Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A501C7831
	for <lists+xen-devel@lfdr.de>; Wed,  6 May 2020 19:43:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWO4p-00009g-3F; Wed, 06 May 2020 17:43:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1k+i=6U=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1jWO4n-00009b-1v
 for xen-devel@lists.xenproject.org; Wed, 06 May 2020 17:43:21 +0000
X-Inumbo-ID: 0fb8c4b8-8fc1-11ea-b07b-bc764e2007e4
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe4d::606])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fb8c4b8-8fc1-11ea-b07b-bc764e2007e4;
 Wed, 06 May 2020 17:43:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Un9SsL4KemWwktdneznDc1S5sXAJEnxeD8dfjQ0dpX6HvAgOufDEpnEptpApfL1jIgAY6oERLk93mf3JpfTumKArH9UE42Datp5vxT/a/8CIrtxfscI1HplknNFuCs+k242hKkT+VwYO3gR+Z2YKP80dTRKxIQTc4Y8vquIN2a6TQyFDBd91IiZTIA3MVRob+Qn3IaTZDXV5QYu9yb3Lr9tGGZJ+xKbOiVcTkvBmupicVGWiSl2QKehgyg5R6CuovvpWkPKdZ+Gggklq6LfFp2bl6jCkeGXna0kdavfojlKdBOFdS01omSyAjF+CxiUKyG2pFNUXEjt8xkHYt3VIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mzZkmMA7oaaKbkudavSrrrfxrNdSmUWpy3H2kpSAVo=;
 b=fwyO2AB2Q/oR+L9knpLqbsUPqoq+5Fivli4CSXPXyGW3Kbrb3kXLqZbS3kQioka8vfzAKZpFbldGdcRfhcYYPtxNvJp7qCCIAxxLCtVnVNOjP20aZj/q2n7HWJofHSC7YBuEgKSjb3Y/htDXu3rV6zpZ/sOLocbOWx+LRRYyUSY61rMUcnmE53r3XTTytvibYTcN3m025agS+W357ajFTXYvEczWsDPf5AI2E7u9DDUArbs+Jh1HCw5ghcYJOGDqa/cre2Wgx0cAa6Emumkjx3Spwi4bJqabID6yX2uE44E+w6rOsqFrLWgpSlEp6TSLAZKPWlbpLBZHQaNfQRC/TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=cardoe.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/mzZkmMA7oaaKbkudavSrrrfxrNdSmUWpy3H2kpSAVo=;
 b=Y2SN3GN/ExUH4WX04nkFVDlmB+1Jtw+kP8aeZ2z8JPc8yEL1nht518FZwHZ5j7U/LMsgZMO7e16n5Xp9RxLqxkAlbrDZBaUuecGWMX2y9+BhjuB7ZQHq3KvSj/Diqiux4V9U9PuMUXLcQ/tI4HkymrNScFV7Jdcg0Nh2Re9DXWQ=
Received: from BL0PR02CA0005.namprd02.prod.outlook.com (2603:10b6:207:3c::18)
 by MWHPR02MB2399.namprd02.prod.outlook.com (2603:10b6:300:5c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.29; Wed, 6 May
 2020 17:43:12 +0000
Received: from BL2NAM02FT034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:207:3c:cafe::9c) by BL0PR02CA0005.outlook.office365.com
 (2603:10b6:207:3c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.28 via Frontend
 Transport; Wed, 6 May 2020 17:43:12 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; cardoe.com; dkim=none (message not signed)
 header.d=none;cardoe.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 BL2NAM02FT034.mail.protection.outlook.com (10.152.77.161) with Microsoft SMTP
 Server id 15.20.2958.27 via Frontend Transport; Wed, 6 May 2020 17:43:12
 +0000
Received: from [149.199.38.66] (port=39372 helo=xsj-pvapsmtp01)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jWO4V-0002KV-CB; Wed, 06 May 2020 10:43:03 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1jWO4d-0004W7-Rm; Wed, 06 May 2020 10:43:11 -0700
Received: from [172.19.2.220] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1jWO4a-0004VR-6f; Wed, 06 May 2020 10:43:08 -0700
Date: Wed, 6 May 2020 10:43:07 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: cardoe@cardoe.com, wl@xen.org
Subject: FuSa (temporary) repository for Xen safety documents
Message-ID: <alpine.DEB.2.21.2005051552410.14706@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(6029001)(7916004)(376002)(346002)(396003)(136003)(39860400002)(46966005)(33430700001)(70206006)(81166007)(336012)(8676002)(107886003)(47076004)(44832011)(8936002)(316002)(9686003)(70586007)(426003)(4326008)(9786002)(2906002)(82740400003)(33716001)(4744005)(82310400002)(33440700001)(356005)(26005)(478600001)(966005)(186003)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 69bed9f1-091b-4d4c-8c04-08d7f1e4f2ad
X-MS-TrafficTypeDiagnostic: MWHPR02MB2399:
X-Microsoft-Antispam-PRVS: <MWHPR02MB2399A63D0BB692714B3F737BA0A40@MWHPR02MB2399.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 03950F25EC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfQX1sQLrd9JLkWeqSFp6pxtBIOAfauMpGEYDL/ol93ka2fFCliaEO2iEOiJ1RzN+KWpfLZp2M6/7frFknDt+CB3E1OWcEZR84t+bALpDlgW5l4bBHPn/gcvnk2mc4ElJXh0zFYlbcVWkue8nhe2d1MjH77SixcY7ELUdrVmPfb+565GufDVkog4JYFTBIKwZen4GRUavQGZaNvuN3vT9zX+m4hbahzBTdcGyNBaE/Vo1Mi4Xi413kDPzeRNY0YCA2HWg7u//y1Z5WfJY7hejb/IembvMnGoz1vP4zAGTmR80T3OL94wOdgv2+MEljFjbrmu9DajkNrvIQ1iJodbmDL723OZzn31FxKbAgf8TMUDIddp2NpssKxzI3Af8upEVfLbDHIXU/TgQi0bD+YvPF4QyW9WhmqM1KzxQwYOKmRk8dIrAxS7+0WheMILcb05f4xFDtISeOakCgy8u2UjEHdH2M26cN9U2g6itDGF9+q0JUM7+0PWoUgD/wah/58ts9m84XAfZTXZZJZQxK2mAeUEJJwFozX7u6W7rXPCPNyYF8TO1bygb6z5jqjoPn28NrS/Bp8E9c4RP8+NEopw6L3dBL8upZjcP/+TBiFcJYQGsSiNclHmMKt3nlzzttCcJwfZ7ZNZWolRDq4lYT+0zAnjeIA0lBnO4sKQb+lhS34=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2020 17:43:12.2421 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bed9f1-091b-4d4c-8c04-08d7f1e4f2ad
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2399
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
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@xilinx.com,
 George.Dunlap@citrix.com, nathalie@xilinx.com, fusa-sig@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

I would like to let you know that I plan to create a FuSa.git repository
under:

https://gitlab.com/xen-project

to host the work-in-progress Xen safety certification documents.

The goal is to have those documents under xen.git, as they need to be
linked to corresponding source code, but we opted for having a separate
repository in the short term to allow easier access and contributions
from safety experts that are not familiar with the git-send-email
workflow.

Cheers,

Stefano

