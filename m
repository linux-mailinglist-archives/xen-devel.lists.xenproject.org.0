Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F27722C3696
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 03:15:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37108.69296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khkKj-00066W-D4; Wed, 25 Nov 2020 02:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37108.69296; Wed, 25 Nov 2020 02:15:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khkKj-000667-9s; Wed, 25 Nov 2020 02:15:01 +0000
Received: by outflank-mailman (input) for mailman id 37108;
 Wed, 25 Nov 2020 02:14:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o5nq=E7=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1khkKh-000662-1p
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 02:14:59 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.220.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dd3037c-c5c6-49e2-a0c0-979381b91be0;
 Wed, 25 Nov 2020 02:14:57 +0000 (UTC)
Received: from CY4PR13CA0023.namprd13.prod.outlook.com (2603:10b6:903:32::33)
 by BL0PR02MB3667.namprd02.prod.outlook.com (2603:10b6:207:47::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Wed, 25 Nov
 2020 02:14:54 +0000
Received: from CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:32:cafe::cf) by CY4PR13CA0023.outlook.office365.com
 (2603:10b6:903:32::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.12 via Frontend
 Transport; Wed, 25 Nov 2020 02:14:54 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT033.mail.protection.outlook.com (10.152.75.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 02:14:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 24 Nov 2020 18:14:52 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 24 Nov 2020 18:14:52 -0800
Received: from [10.23.120.204] (port=57077 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1khkKa-0000bx-6N; Tue, 24 Nov 2020 18:14:52 -0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=o5nq=E7=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
	id 1khkKh-000662-1p
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 02:14:59 +0000
X-Inumbo-ID: 9dd3037c-c5c6-49e2-a0c0-979381b91be0
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown [40.107.220.78])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 9dd3037c-c5c6-49e2-a0c0-979381b91be0;
	Wed, 25 Nov 2020 02:14:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fkFWj09wNen4ukgQ1GCEBn2e29YOEkZKehzQd582b+qVDRc9GIwCzoNguIL0yESG8ZKa1bKkGgs29uolf1mxAN1t/kER5q1RDH2XZExbe+9pdsSvsWAHR3e7NvN7vuc3QHHWF7pyCRTPJ4Z3jHJBp+FssbX8WAI1Op2J4SjpyVbZ77LJBx4tchexVcQ9lwpEUV25K78s9fFt+xaaJjtH8NdDDfcFIaz0QUuSAAbL1M62gqolKHKzBWMeV90+zJKpAO59heln1l7mXZIKGOrpOwq6YRwm7csXXurwpnfPhz/CtI23/3+QJPV+KRnwkBJ8a1wkhxpXhtPzV570Ssndbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aA/fEOkvpH27qOdfBIo5qS26KGKmo1TlvffLgTTtNdw=;
 b=W6ZfpPISgHXfn8Fdouye33BS3EDxHAN5NjsgTJ0kIqnpBqATSqSZn24WMEdrwYNj96sWWgvOpnN+56GTcmc9irLqtcLo/+dw/gwe2n1y67KDnFmAypJmdchI+xQkwKEG/ynnScE1kAMXeaDfOblBGT05zU/AQdZJfD4Y+m9xb9gNNETZUKxit4E0ziQgClejq2T2tyein1Oms8jKzCbzQQwsKYDcGdYgiSNfYRHtNXItEm1twGCH2eZpoj+HQ3eg56KVQ2edn/fiCX3r3hkDdztO6o7bXkao36n258XKxq5lSsM57S0XEv49IpjQTi4e4CbmbIouQ/S2p3JIWDOB4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=zal.aero smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aA/fEOkvpH27qOdfBIo5qS26KGKmo1TlvffLgTTtNdw=;
 b=NN7U/X5g7LZlMmVXVLElG+QDzxkwZ5Ixf6BkBWVBC/Hj8oLcCbGYQC20mFawvxj/2kbJ/3B0p+Qbuvqn0CaiRKj/gMB5qtOdGUg3hyy0RzaAz6fjZGWQSJ5u0GjT6sZJsuGc2bb/UnwxROHS/tfAk0r1wK9PnUlvxDFdKD4Y0+s=
Received: from CY4PR13CA0023.namprd13.prod.outlook.com (2603:10b6:903:32::33)
 by BL0PR02MB3667.namprd02.prod.outlook.com (2603:10b6:207:47::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Wed, 25 Nov
 2020 02:14:54 +0000
Received: from CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:32:cafe::cf) by CY4PR13CA0023.outlook.office365.com
 (2603:10b6:903:32::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.12 via Frontend
 Transport; Wed, 25 Nov 2020 02:14:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; zal.aero; dkim=none (message not signed)
 header.d=none;zal.aero; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT033.mail.protection.outlook.com (10.152.75.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.20 via Frontend Transport; Wed, 25 Nov 2020 02:14:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 24 Nov 2020 18:14:52 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 24 Nov 2020 18:14:52 -0800
Received: from [10.23.120.204] (port=57077 helo=localhost)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <stefano.stabellini@xilinx.com>)
	id 1khkKa-0000bx-6N; Tue, 24 Nov 2020 18:14:52 -0800
Date: Tue, 24 Nov 2020 18:14:51 -0800
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Leo Krueger <leo.krueger@zal.aero>, <Zhiqiang.Hou@nxp.com>
CC: Julien Grall <julien@xen.org>, Stefano Stabellini
	<stefano.stabellini@xilinx.com>, Peng Fan <peng.fan@nxp.com>,
	"brucea@xilinx.com" <brucea@xilinx.com>, Cornelia Bruelhart
	<cornelia.bruelhart@zal.aero>, "oleksandr_andrushchenko@epam.com"
	<oleksandr_andrushchenko@epam.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>
Subject: Re: AW: AW: AW: AW: AW: AW: Xen data from meta-virtualization
 layer
In-Reply-To: <HE1PR05MB4794FE31A2BDE8BC458D81848BFB0@HE1PR05MB4794.eurprd05.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s>
References: <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com> <alpine.DEB.2.21.2011101842500.21307@sstabellini-ThinkPad-T480s> <DB6PR0402MB27608A03EC717053E392A92988E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47940ED4E5FDC0BADC54C8E78BE80@HE1PR05MB4794.eurprd05.prod.outlook.com> <DB6PR0402MB2760CEEABA9F52CDEB27C1DB88E80@DB6PR0402MB2760.eurprd04.prod.outlook.com> <HE1PR05MB47944761ED6A26D3E2CE15868BE40@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011161656080.20906@sstabellini-ThinkPad-T480s> <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com> <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s> <5dc63ee2-f1ce-31fc-cb6a-fe4dae929fb3@xen.org>
 <HE1PR05MB4794EBDD1FE29BC69D0BCC898BFD0@HE1PR05MB4794.eurprd05.prod.outlook.com> <b67581c6-6682-5059-55d1-a9c695a8cdc3@xen.org> <HE1PR05MB4794FE31A2BDE8BC458D81848BFB0@HE1PR05MB4794.eurprd05.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273b1988-81c1-4cc5-e4a8-08d890e7e564
X-MS-TrafficTypeDiagnostic: BL0PR02MB3667:
X-Microsoft-Antispam-PRVS:
	<BL0PR02MB36676EFEF1B9EA9FEE19980DA0FA0@BL0PR02MB3667.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g+SDvn+YPn0lDNeHV9XnvgqswmS03uYbhAyle1BPsp9WDwcurNbVzWpolC8COsF1e+QlGVutxN6anKidOYKWU7QBJi8c8N3bod9+gN5vS3cCuDke7vzlrh1g+/5wK9jrO/qiDuHdFz9RM+dIRajdR66YxzB55xWnUcjKjr47FQ9D/OBqut+P5pAq9/Tl0P7shwFKfEkxqkSUqzH2IBeVJQ1CbVk+EtJBIs3WzJl30XL4qjCLD92uIujnjxMX7oDs/yg61UQ0vL7LO2evnYoUK4DEXmKg4JVfWrYf3G7LIC+Xf1iGD/kEEwqNpiymJiQQagRKGaREfP1NhveesitAzg8lCtO7BTUqEH+oFiBq5dr2GMJ2jv7HAP+Tm1T6jc0En08UAeB+4Xa/KVuJYsxgzBoVRqgW2338cGZ/2ha/MtqOUdc8udZ7UfiKxAZ7+IwaJe/ZyACVSWkbPQ3yrtCYFWpkIhYV3CsEOY6zz8To20s=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(7916004)(346002)(136003)(376002)(39840400004)(396003)(46966005)(33716001)(426003)(9686003)(82310400003)(2906002)(966005)(44832011)(4326008)(70586007)(70206006)(83380400001)(8676002)(26005)(54906003)(356005)(9786002)(7636003)(316002)(47076004)(36906005)(5660300002)(186003)(336012)(478600001)(110136005)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2020 02:14:53.2625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 273b1988-81c1-4cc5-e4a8-08d890e7e564
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB3667

+ Zhiqiang Hou

On Tue, 24 Nov 2020, Leo Krueger wrote:
> > >>> On Tue, 17 Nov 2020, Leo Krueger wrote:
> > >>>> Hi,
> > >>>>
> > >>>> I enabled CONFIG_HAS_ITS (what a stupid mistake by me to not set it
> > >>>> before...) but then had to add the following node to my device tree
> > >>>>
> > >>>> 	gic_lpi_base: syscon@0x80000000 {
> > >>>> 		compatible = "gic-lpi-base";
> > >>
> > >> I couldn't find this compatible defined/used in Linux 5.10-rc4. @Leo,
> > >> could you clarify which flavor/version of Linux you are using?
> > >
> > > It is Linux 4.19 from Yocto (Warror release). XEN 4.13.2.
> > 
> > Do you have a link to the Linux tree? Is there any additional patches on top of
> > vanilla?
> 
> Linux tree is found here: https://github.com/kontron/linux-smarc-sal28/commits/master-LSDK-19.09
> (up to the latest commit in that branch)

[...]

> > Looking at the DT changes in [0], it looks like the node is not a child of gic@.
> > So I think Xen will map the region to Dom0.
> > 
> > There are two things that I can notice:
> >    1) This region is RAM, but I can't find any reserve node. Is there any specific
> > code in Linux to reserve it?
> >    2) The implementation in U-boot seems to suggest that the firmware will
> > configure the LPIs and then enable it. If that's the case, then Xen needs to
> > re-use the table in the DT rather than allocating a new one.

That Linux tree has no mentions of gic-lpi-base. That means that
gic-lpi-base is only used in u-boot, not in Linux. In particular the
most relevant commit is af288cb291da3abef6be0875527729296f7de7a0. 

In regards to the reserved-memory regions, maybe we are not seeing them
because Leo posted the host device tree, not the one passed at runtime
from u-boot to Linux?

If so, Leo, could you please boot Linux on native (no Xen) and get the
device tree from there at runtime using dtc -I fs -O dts
/proc/device-tree ?


However, the name of the reserved-memory region created by u-boot seems
to be "lpi_rd_table". I cannot find any mentions of lpi_rd_table in the
Linux kernel tree either.

Zhiqiang, Leo is trying to boot Xen on sAL28. Linux booting on Xen
throws errors in regards to GIC/ITS initialization. On other hardware
Xen can use and virtualize GICv3 and ITS just fine. Could you please
explain what is different about sAL28 and how Xen/Linux is expected to
use the lpi_rd_table reserved-memory region?

