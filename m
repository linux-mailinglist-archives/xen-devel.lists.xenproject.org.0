Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4EE3A1DD0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jun 2021 21:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139546.258028 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr45h-0004Dp-7B; Wed, 09 Jun 2021 19:42:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139546.258028; Wed, 09 Jun 2021 19:42:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lr45h-0004BU-3z; Wed, 09 Jun 2021 19:42:17 +0000
Received: by outflank-mailman (input) for mailman id 139546;
 Wed, 09 Jun 2021 19:42:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j3Z5=LD=xilinx.com=edgar@srs-us1.protection.inumbo.net>)
 id 1lr45f-0004BO-So
 for xen-devel@lists.xenproject.org; Wed, 09 Jun 2021 19:42:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.237.81]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba333e9c-a3aa-4927-8c7c-83cb886729fc;
 Wed, 09 Jun 2021 19:42:14 +0000 (UTC)
Received: from BN9PR03CA0460.namprd03.prod.outlook.com (2603:10b6:408:139::15)
 by DM6PR02MB6793.namprd02.prod.outlook.com (2603:10b6:5:213::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 19:42:13 +0000
Received: from BN1NAM02FT041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:139:cafe::27) by BN9PR03CA0460.outlook.office365.com
 (2603:10b6:408:139::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend
 Transport; Wed, 9 Jun 2021 19:42:13 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT041.mail.protection.outlook.com (10.13.2.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.18 via Frontend Transport; Wed, 9 Jun 2021 19:42:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 9 Jun 2021 12:42:12 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 9 Jun 2021 12:42:12 -0700
Received: from [10.71.119.214] (port=52456 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar@xilinx.com>)
 id 1lr45c-00032B-0N; Wed, 09 Jun 2021 12:42:12 -0700
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
X-Inumbo-ID: ba333e9c-a3aa-4927-8c7c-83cb886729fc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrfnfA4j+5aeA6ipStugEk+R0/FsH0PZsluFpLtZelBEl6ow6eWEiYZDI1k/qrNty/ulg7182vvgCbQgRZPz4t0jHTRKIJrPzEwdTzjhXxzX5ZWCTJdhzyTu+ZGU1fyVnloJYmfEzU6AClR0RTrTwiXNnWWELFwPKo7F/q+fdmBDp8oR2ggQ1jaXDzlVYW4StStco0b0lvbRIXG71EwwzI9uA/fonnH1ff1aUGL/XTwok03voZppaA7UXo/m6zN5uAklkXRfb30VDY7lUeMOSP8gPnV9v0P+fVfuNipEuYKJWprL1sr0mnNNr5aquuxo5+WCNQCkfjs4F8qJdkxdrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT2wVoqIIhbCEe6+6/5VTaC1yHQtIarCslgk7GCNoMw=;
 b=ayWOQ3eZifvc4Id6+dEs/6GC7HjV69jgvxOZTsfyX2lHwsXYpx2rchyxgkMnT8cnprP91dAx4ReNE3o+SJrpVQO4ui7dLYIu9t6awnVIhpaK1qNUJ8ntjHRYm/gDE7KMAHD5cLGJLyTTSG7JVbGfEC7pfk4sMZRqsOtNPW6C8aVWYj6laybGJf885XPVvf/DLQtgyHy2zjurpjHNTxgpPmdhsM3hgqtxU7GPkTJf3MWq0q+ePYYnxLlg7c+dbx4BN//zGJ1iX91Aa1fNqVJtksfR/oZtd2IDE1tNNOxEIIPaKLMiIb6avUXnlJurspv+bO/sd4bYhpboyWGMi5IPCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=xen.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TT2wVoqIIhbCEe6+6/5VTaC1yHQtIarCslgk7GCNoMw=;
 b=oRzBVgiZfaI11miNMPQjDFwiUtuI5kPW8AXkCnwPU2aZ+FFAoXbKE7WsmnBIQ+JjcYyN+PMkF6RfWLXwm1GcarzbvAJnfvsP6DeAC2UZCMsX664ZL5Ek+Y2lwX/2cfWgUIPHQiIKSkCNhC7bZWr8uQzuF89Q29+d4T/7jJaPlRI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Date: Wed, 9 Jun 2021 21:42:09 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: Julien Grall <julien@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, <Volodymyr_Babchuk@epam.com>,
	<xen-devel@lists.xenproject.org>, <Bertrand.Marquis@arm.com>,
	<Michal.Orzel@arm.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm32: SPSR_hyp/SPSR
Message-ID: <20210609194209.GE6590@toto>
References: <20210609174324.6621-1-sstabellini@kernel.org>
 <712da7a7-2c1f-fd24-398d-27966335618a@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <712da7a7-2c1f-fd24-398d-27966335618a@xen.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7f5c623a-b282-4be3-98e8-08d92b7eadd1
X-MS-TrafficTypeDiagnostic: DM6PR02MB6793:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB67937FE8E7D209DA11388BA0C2369@DM6PR02MB6793.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TGVehs2enPX3K0bxiRJrsyhLbTACeguAzVAXHc0jXmWl88u1fpOpxbaDntQ+EOYBcuisjkFMnUJV7ES7LtBxMag90i31WxwK+7U5XRiulso7jIhadDEYAIf9D7N4/FiDz/B3EVkfnwgaNd/62OUlD3Fauf/oCbdjsfDL8CPKxHKkmmNDnhj+Qqtu/rrELyqEitbxjrn32BThi3Hbw7oZb+1ralvUHZh5qPYgI3vYbswcrZ0yUDJJHezY2ETvG+AsfdUjowPPCVa5jHQHQZ1WT9TVPpAQrv3NIYgBglaJU3MiGkG3kAlWe4cMX0jZYzQDgfNHORZkXSABd16J/27JgZnubMFYBv/YfAn9/dcDE6LnSfO6y1IzO8/8mjrZry7PYph14WbuFLdBIdxZCOqLzPbZwrFH9uwL6VxkWX8imVLylPvIHLEjcsxkk6w5ULQ9OCWCjO52MBoIbLj8LE6H1LPE09H20jReqPwwNmZRO/J6+Cic9RJE90/yG6hB0ENA1A7HVd7TZ0JEMWY9CzAjEdK7UFWWiUZoRz8fX0xros4ZbnP8h58a4nWxUdJHZz1gTugdxb/FtsTTfAXSox8DTQ8apNhC+iqQPR3FJL4t8mxHojRATDRh2U6armrTIs0G6NHPKmpoykuJ0KOyAaY39sbxvEkaG43+9msVG4coy48=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(136003)(346002)(39860400002)(46966006)(36840700001)(33716001)(47076005)(53546011)(9686003)(2906002)(1076003)(316002)(8676002)(26005)(82310400003)(4326008)(336012)(4744005)(107886003)(83380400001)(5660300002)(33656002)(82740400003)(36906005)(36860700001)(478600001)(7636003)(426003)(6916009)(6666004)(70586007)(356005)(9786002)(54906003)(186003)(8936002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 19:42:13.0284
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f5c623a-b282-4be3-98e8-08d92b7eadd1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6793

On Wed, Jun 09, 2021 at 06:53:02PM +0100, Julien Grall wrote:
> Hi Stefano,
> 
> On 09/06/2021 18:43, Stefano Stabellini wrote:
> > SPSR_hyp is not meant to be accessed from Hyp mode (EL2); accesses
> > trigger UNPREDICTABLE behaviour. Xen should read/write SPSR instead.
> 
> Please provide a reference to the spec. This helps reviewer and/or future
> developper to figure out quickly where this comes from.
> 
> > 
> > This fixes booting Xen/arm32 on QEMU.
> > 
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> With the reference added:
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Cheers,
Edgar


