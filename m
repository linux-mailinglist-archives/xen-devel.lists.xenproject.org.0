Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F5A2B72B2
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 00:54:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29303.58629 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfAmv-0000R8-E8; Tue, 17 Nov 2020 23:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29303.58629; Tue, 17 Nov 2020 23:53:29 +0000
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
	id 1kfAmv-0000Qj-9r; Tue, 17 Nov 2020 23:53:29 +0000
Received: by outflank-mailman (input) for mailman id 29303;
 Tue, 17 Nov 2020 23:53:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ct0K=EX=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1kfAmt-0000QZ-3G
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 23:53:27 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown
 [40.107.220.41]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4875fee1-023f-4f08-a726-849a53d09777;
 Tue, 17 Nov 2020 23:53:22 +0000 (UTC)
Received: from SA9PR13CA0004.namprd13.prod.outlook.com (2603:10b6:806:21::9)
 by SN6PR02MB5024.namprd02.prod.outlook.com (2603:10b6:805:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 17 Nov
 2020 23:53:17 +0000
Received: from SN1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:21:cafe::c8) by SA9PR13CA0004.outlook.office365.com
 (2603:10b6:806:21::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Tue, 17 Nov 2020 23:53:17 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT014.mail.protection.outlook.com (10.152.72.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 23:53:15 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 17 Nov 2020 15:53:14 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 17 Nov 2020 15:53:14 -0800
Received: from [10.23.120.204] (port=64958 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1kfAmf-00034j-TM; Tue, 17 Nov 2020 15:53:14 -0800
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Ct0K=EX=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
	id 1kfAmt-0000QZ-3G
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 23:53:27 +0000
X-Inumbo-ID: 4875fee1-023f-4f08-a726-849a53d09777
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (unknown [40.107.220.41])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 4875fee1-023f-4f08-a726-849a53d09777;
	Tue, 17 Nov 2020 23:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXcu+Q24Z/ooVWGuyG8K650izdhMTDhE3yBSnnJI6mBxpBhzJZIszj7SR0OVIGOtb0nTmD6lpbkniNKH7/oySPJUXhZhEzAE37UUPxhV99ZUlwPVBvuxo56iz8GTLCso0pBJeSPnFhhuW/GSNXbXTeFCh+1SXrBeBeRSO3479bUAeTKx7C8+mDbWuHD9eGO/YDMNMf1P/zY/679MH8mjBEtPVYcDEL/pwZqgSQGb5azesRQx5cLyCi+A5aOUMO7lFLIGsPHpjmAcsz/VBeI6O8uMlqGYrEHGgvLrIvbriZxWiz1f/vlveCkw6eQ0U5OZvPfHXsWhIcTYGgnqPDXD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTMcDdDhDLIIShZKVKmD5GHRUXQJUUBebIlTm2Z02oA=;
 b=MEwAqOxJ7dt/3ZYmaqWPI3FC1Mb5/TWwI/ODW+4x9CjgjZFrOdNlkN9f2A0R4RhSOD7h49eCEGNskBz8ZmfrSc3n++Anzf3deSrB3glhXC7hyFXSqGayDGdlXR7uvc3+sijMFA+E5+9OiwsmmGYA4QrCgwWjh1+Z+JUFp3SR9riiGs3Gh2XHEeLFclDCeUABvP1AOTZ9IYvEu6DGDa9FrwWymmRrs73ybQH8CE1S3Quv98upUI3o7+NOkeQwGyGfl74LUYmMUq8n/nfTFxjFDAWvfY7HI9bPmPB9t9sz0i12QY9yYC2WtyzIOFe9iyDcAdM6zYH0hcA7dGuNUFMF5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=zal.aero smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTMcDdDhDLIIShZKVKmD5GHRUXQJUUBebIlTm2Z02oA=;
 b=ZpXH5FtxvzacvZsAuIVihcgk2H0gsNC+aqG1iCrkx26b++faRJ5+UzacVMoPmpN8pB3gst3ZpgoZRrvRo9DngZNApC6Y7coZnooQu12gVczbHqOGpJqmYYX6HGxA5WMYnUJ8Dp4SZ25z6igTnsKYZ/bIgIpSyAuZ0LznNdsrEHA=
Received: from SA9PR13CA0004.namprd13.prod.outlook.com (2603:10b6:806:21::9)
 by SN6PR02MB5024.namprd02.prod.outlook.com (2603:10b6:805:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Tue, 17 Nov
 2020 23:53:17 +0000
Received: from SN1NAM02FT014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:21:cafe::c8) by SA9PR13CA0004.outlook.office365.com
 (2603:10b6:806:21::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.15 via Frontend
 Transport; Tue, 17 Nov 2020 23:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; zal.aero; dkim=none (message not signed)
 header.d=none;zal.aero; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT014.mail.protection.outlook.com (10.152.72.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3564.22 via Frontend Transport; Tue, 17 Nov 2020 23:53:15 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 17 Nov 2020 15:53:14 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 17 Nov 2020 15:53:14 -0800
Received: from [10.23.120.204] (port=64958 helo=localhost)
	by smtp.xilinx.com with esmtp (Exim 4.90)
	(envelope-from <stefano.stabellini@xilinx.com>)
	id 1kfAmf-00034j-TM; Tue, 17 Nov 2020 15:53:14 -0800
Date: Tue, 17 Nov 2020 15:53:13 -0800
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Leo Krueger <leo.krueger@zal.aero>
CC: Stefano Stabellini <stefano.stabellini@xilinx.com>, Peng Fan
	<peng.fan@nxp.com>, "brucea@xilinx.com" <brucea@xilinx.com>, "Cornelia
 Bruelhart" <cornelia.bruelhart@zal.aero>, <oleksandr_andrushchenko@epam.com>,
	<xen-devel@lists.xenproject.org>, <Bertrand.Marquis@arm.com>,
	<julien@xen.org>
Subject: Re: AW: AW: AW: AW: Xen data from meta-virtualization layer
In-Reply-To: <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2011171544380.438@sstabellini-ThinkPad-T480s>
References: <AM4PR0501MB2227089FDDF0209EF6E215D9E6100@AM4PR0501MB2227.eurprd05.prod.outlook.com> <AM4PR0501MB22274E52A5A3BE912D477D8CE6EA0@AM4PR0501MB2227.eurprd05.prod.outlook.com> <HE1PR05MB47941E23CE053CE72F18867C8BEA0@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011091858010.21307@sstabellini-ThinkPad-T480s> <HE1PR05MB4794B5C57A54A29A48EE8EAE8BE90@HE1PR05MB4794.eurprd05.prod.outlook.com> <alpine.DEB.2.21.2011101842500.21307@sstabellini-ThinkPad-T480s>,<DB6PR0402MB27608A03EC717053E392A92988E80@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <HE1PR05MB47940ED4E5FDC0BADC54C8E78BE80@HE1PR05MB4794.eurprd05.prod.outlook.com> <DB6PR0402MB2760CEEABA9F52CDEB27C1DB88E80@DB6PR0402MB2760.eurprd04.prod.outlook.com> <HE1PR05MB47944761ED6A26D3E2CE15868BE40@HE1PR05MB4794.eurprd05.prod.outlook.com>
 <alpine.DEB.2.21.2011161656080.20906@sstabellini-ThinkPad-T480s> <HE1PR05MB4794569AC67109AF8B6517268BE20@HE1PR05MB4794.eurprd05.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2110900997-1605656680=:438"
Content-ID: <alpine.DEB.2.21.2011171544490.438@sstabellini-ThinkPad-T480s>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9672d543-d690-4cbd-ef31-08d88b53f36b
X-MS-TrafficTypeDiagnostic: SN6PR02MB5024:
X-Microsoft-Antispam-PRVS:
	<SN6PR02MB50240565C1882A32B9DD54EFA0E20@SN6PR02MB5024.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XSRhvAMKTQQ4Z+9jzvzMEAn3XenCbehKsyAzFQrpZQ3Cv9F20uDDevVW+8MQUoUjJNMZqjtFb76csJQtJX3xoQfDZOwoXEzpsC9sRzDJWM9tJgVfn8EbRKnWDfM4+buJ/uw/DvErwJg1XyhBAlClRs/m9XmPYyyphBKmdzLJpQC16sjhIZGjvH59MS7Xj9RyKwwORW5TIZSeUe77cA+m+h0Y7TVZO4rrHrEvpEwFHs39qUY2N/y2DjTs3Q0Y7L7BYNgtwo0Z5thn+zuqFpwdEPvgjlwI7GahFRU/mppz73pZ3OEZTdmSqQ4b2ZTa54tnhobQ4sJRlVFczlt6ptmP/4qftB1G/f/bTMxeENJtSvg0/x4M9g4y5yqpFvch1S7/JEZbY8RrnhlGtWK1e+CnXg==
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(376002)(346002)(136003)(396003)(46966005)(83380400001)(82740400003)(9786002)(21480400003)(82310400003)(8676002)(26005)(33964004)(9686003)(47076004)(7636003)(33716001)(44832011)(356005)(426003)(6916009)(8936002)(336012)(2906002)(5660300002)(235185007)(316002)(478600001)(54906003)(36906005)(186003)(66574015)(4326008)(70586007)(70206006)(66616009);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 23:53:15.4589
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9672d543-d690-4cbd-ef31-08d88b53f36b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5024

--8323329-2110900997-1605656680=:438
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2011171544491.438@sstabellini-ThinkPad-T480s>

Adding Bertrand, Oleksandr, Julien, and others -- they have a more
recent experience with GICv3 ITS than me and might be able to help.
I am attaching the device tree Leo sent a few days ago for reference.


Typically when you can set the ethernet link up and no packets are
exchanged it is because of a missing interrupt. In this case a missing
MSI.

Bertrand, I believe you tried the GIC ITS driver with PCI devices
recently. It is expected to work correctly with MSIs in Dom0, right?



On Tue, 17 Nov 2020, Leo Krueger wrote:
> Hi,
> 
> I enabled CONFIG_HAS_ITS (what a stupid mistake by me to not set it before...) but then had to add the following node to my device tree
> 
> 	gic_lpi_base: syscon@0x80000000 {
> 		compatible = "gic-lpi-base";
> 		reg = <0x0 0x80000000 0x0 0x100000>;
> 		max-gic-redistributors = <2>;
> 	};
> 
> to somehow change something in regard to the ITS and MSI/MSI-X
> 
> (XEN) GICv3 initialization:
> (XEN)       gic_dist_addr=0x00000006000000
> (XEN)       gic_maintenance_irq=25
> (XEN)       gic_rdist_stride=0
> (XEN)       gic_rdist_regions=1
> (XEN)       redistributor regions:
> (XEN)         - region 0: 0x00000006040000 - 0x00000006080000
> (XEN) GICv3: using at most 57344 LPIs on the host.
> (XEN) GICv3: 288 lines, (IID 0001143b).
> (XEN) GICv3: Found ITS @0x6020000
> (XEN) using non-cacheable ITS command queue
> (XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001c000
> 
> [    0.000000] GICv3: Distributor has no Range Selector support
> [    0.000000] GICv3: no VLPI support, no direct LPI support
> [    0.000000] ITS [mem 0x06020000-0x0603ffff]
> [    0.000000] ITS@0x0000000006020000: allocated 65536 Devices @dc880000 (flat, esz 8, psz 64K, shr 1)
> [    0.000000] ITS@0x0000000006020000: allocated 32768 Interrupt Collections @dc820000 (flat, esz 2, psz 64K, shr 1)
> [    0.000000] GIC: using LPI property table @0x00000000dc830000
> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000006040000
> [    0.000000] CPU0: using LPI pending table @0x00000000dc840000
> ...
> [    0.040080] Platform MSI: gic-its domain created
> [    0.040136] PCI/MSI: /interrupt-controller/gic-its domain created
> [    0.040181] fsl-mc MSI: /interrupt-controller/gic-its domain created
> 
> 
> Still I am ending up with the " Failed to add - passthrough or MSI/MSI-X might fail!" log messages for some PCI devices, but at least the on-board ethernet ports (fsl_enetc ) are initialized.
> I can set the link up and a link is successfully established.
> 
> But (!) I cannot receive or transmit anything (no error message...) and there seem to be no interrupts:
> 
> 29:          0   ITS-MSI   1 Edge      gbe0-rxtx0
>  32:          0   ITS-MSI 8192 Edge      ptp_qoriq
> 
> (from /proc/interrupts).
> 
> Any idea on this one? I keep digging and checking whether my device tree needs some additional fixes.
> 
> Kind regards,
> Leo
> 
> --
> Leo Krüger, M.Sc.
> Senior Systems Engineer Distributed Systems
> Intelligent Digital Cabin
> 
> ZAL Zentrum für Angewandte Luftfahrtforschung GmbH
> Hein-Saß-Weg 22
> 21129 Hamburg
>  
> +49 (0) 40 248 595-154
> 
> zal.aero | twitter.com/ZALTechCenter | facebook.com/ZALTechCenter 
> 
> ZAL Zentrum für Angewandte Luftfahrtforschung GmbH 
> Sitz der Gesellschaft / Legal Domicile: Hamburg 
> Registergericht / Registration Court: Amtsgericht Hamburg HRB 110232
> Vorsitzender des Aufsichtsrates / Chairman of the Supervisory Board: StR Andreas Rieckhof
> Geschäftsführung / Board of Management: Roland Gerhards
> 
> Disclaimer:
> This e-mail may contain confidential and/or privileged information. If you are not the intended recipient (or have
> received this mail in error), please notify the sender immediately and destroy this e-mail. Any unauthorised copying, 
> disclosure or distribution of the material in this e-mail is strictly forbidden.
> 
> > -----Ursprüngliche Nachricht-----
> > Von: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > Gesendet: Dienstag, 17. November 2020 01:59
> > An: Leo Krueger <leo.krueger@zal.aero>
> > Cc: Peng Fan <peng.fan@nxp.com>; Stefano Stabellini
> > <stefano.stabellini@xilinx.com>; brucea@xilinx.com; Cornelia Bruelhart
> > <cornelia.bruelhart@zal.aero>
> > Betreff: Re: AW: AW: AW: Xen data from meta-virtualization layer
> > 
> > Replies inline below
> > 
> > 
> > On Sun, 15 Nov 2020, Leo Krueger wrote:
> > > Hi Peng, hi Stefano,
> > >
> > >
> > >
> > > sorry for the long silence…
> > >
> > >
> > >
> > > I tried the change suggested (and hope I didn’t do anything wrong
> > > while doing so…) on top of XEN 4.13.2 (before, I always tried with
> > > 4.12 but wanted to give 4.13.2 a try as well) but I do not see any difference,
> > still the same “unhandled context fault” log entries pop up and I cannot
> > access my sdcard.
> > >
> > >
> > >
> > > As it seems to work without respectively disabled iommu, that would be
> > > fine for me for now. What I am worried about a bit more is PCIe or
> > MSI/MSIX to be exact.
> > >
> > >
> > >
> > > Here is the gic-v3 and its node from my device tree:
> > >
> > >
> > >
> > > interrupt-controller@6000000 {
> > >
> > >         compatible = "arm,gic-v3";
> > >
> > >         #address-cells = <0x2>;
> > >
> > >         #size-cells = <0x2>;
> > >
> > >         ranges;
> > >
> > >         reg = <0x0 0x6000000 0x0 0x10000 0x0 0x6040000 0x0 0x40000>;
> > >
> > >         #interrupt-cells = <0x3>;
> > >
> > >         interrupt-controller;
> > >
> > >         interrupts = <0x1 0x9 0xf08>;
> > >
> > >         phandle = <0x1>;
> > >
> > >
> > >
> > >         gic-its@6020000 {
> > >
> > >                 compatible = "arm,gic-v3-its";
> > >
> > >                 msi-controller;
> > >
> > >                 reg = <0x0 0x6020000 0x0 0x20000>;
> > >
> > >                 phandle = <0xd>;
> > >
> > >         };
> > >
> > > };
> > >
> > >
> > >
> > > And here are some kernel log excerpts related to GIC when booting
> > without (!) XEN:
> > >
> > >
> > >
> > > [    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
> > >
> > > [    0.000000] GICv3: Distributor has no Range Selector support
> > >
> > > [    0.000000] GICv3: no VLPI support, no direct LPI support
> > >
> > > [    0.000000] ITS [mem 0x06020000-0x0603ffff]
> > >
> > > [    0.000000] ITS@0x0000000006020000: allocated 65536 Devices
> > > @20fb880000 (flat, esz 8, psz 64K, shr 0)
> > >
> > > [    0.000000] ITS: using cache flushing for cmd queue
> > >
> > > [    0.000000] GIC: using LPI property table @0x00000020fb830000
> > >
> > > [    0.000000] GICv3: CPU0: found redistributor 0 region
> > > 0:0x0000000006040000
> > >
> > > [    0.000000] CPU0: using LPI pending table @0x00000020fb840000
> > >
> > > [    0.000000] GIC: using cache flushing for LPI property table
> > >
> > >
> > >
> > > However, when booting with XEN, only the following three lines are
> > contained in the kernel log:
> > >
> > >
> > >
> > > [    0.000000] GICv3: Distributor has no Range Selector support
> > >
> > > [    0.000000] GICv3: no VLPI support, no direct LPI support
> > >
> > > [    0.000000] GICv3: CPU0: found redistributor 0 region
> > > 0:0x0000000006040000
> > 
> > "no VLPI support" is very suspicious, it looks like Dom0 doesn't find any ITS
> > support.
> > 
> > Can you double check that you have the ITS driver in Xen built-in? That would
> > be CONFIG_HAS_ITS. If you do "make menuconfig" and enable "Configure
> > standard Xen features (expert users)" you should get a new option "GICv3
> > ITS MSI controller support" under "Architecture Features".
> > Make sure to enable it.
> > 
> > Let me know if that works!
> 
--8323329-2110900997-1605656680=:438
Content-Type: text/plain; charset="US-ASCII"; name="devicetree.dts"
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.DEB.2.21.2011171547220.438@sstabellini-ThinkPad-T480s>
Content-Description:
Content-Disposition: attachment; filename="devicetree.dts"

LyB7DQogICAgICAgIGNvbXBhdGlibGUgPSAia29udHJvbixzbDI4IiwgImZz
bCxsczEwMjhhIjsNCiAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9IDwweDAw
MDAwMDAxPjsNCiAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAw
Mj47DQogICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDI+Ow0KICAg
ICAgICBtb2RlbCA9ICJLb250cm9uIFNNQVJDLXNBTDI4IjsNCiAgICAgICAg
Y2hvc2VuIHsNCiAgICAgICAgICAgICAgICB4ZW4sZG9tMC1ib290YXJncyA9
ICJyb290PS9kZXYvbW1jYmxrMXAyIGNvbnNvbGU9aHZjMCBlYXJseWNvbj14
ZW4gZWFybHlwcmludGs9eGVuIGNsa19pZ25vcmVfdW51c2VkIHJvb3R3YWl0
ICI7DQogICAgICAgICAgICAgICAgeGVuLHhlbi1ib290YXJncyA9ICJjb25z
b2xlPWR0dWFydCBkdHVhcnQ9c2VyaWFsMCBkb20wX21lbT01MTJNIGRvbTBf
bWF4X3ZjcHVzPTEgYm9vdHNjcnViPTAgdndmaT1uYXRpdmUgc2NoZWQ9bnVs
bCAiOw0KICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAw
MDI+Ow0KICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDAw
MDAwMDI+Ow0KICAgICAgICAgICAgICAgIGRvbTAgew0KICAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHg4MTIwMDAwMCAweDAw
MDAwMDAwIDB4MDE1MTcwMDg+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
Y29tcGF0aWJsZSA9ICJ4ZW4sbGludXgtemltYWdlIiwgInhlbixtdWx0aWJv
b3QtbW9kdWxlIjsNCiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICB9Ow0K
ICAgICAgICBhbGlhc2VzIHsNCiAgICAgICAgICAgICAgICBydGMxID0gIi9z
b2MvdGltZXJAMjgwMDAwMCI7DQogICAgICAgICAgICAgICAgY3J5cHRvID0g
Ii9zb2MvY3J5cHRvQDgwMDAwMDAiOw0KICAgICAgICAgICAgICAgIHNlcmlh
bDAgPSAiL3NvYy9zZXJpYWxAMjFjMDUwMCI7DQogICAgICAgICAgICAgICAg
c2VyaWFsMSA9ICIvc29jL3NlcmlhbEAyMWMwNjAwIjsNCiAgICAgICAgfTsN
CiAgICAgICAgY3B1cyB7DQogICAgICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAgICAgICAgICAgY3B1QDAgew0K
ICAgICAgICAgICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGNv
cnRleC1hNzIiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
MDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgZW5hYmxlLW1l
dGhvZCA9ICJwc2NpIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
cyA9IDwweDAwMDAwMDAyIDB4MDAwMDAwMDEgMHgwMDAwMDAwMD47DQogICAg
ICAgICAgICAgICAgICAgICAgICBuZXh0LWxldmVsLWNhY2hlID0gPDB4MDAw
MDAwMDM+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY3B1LWlkbGUtc3Rh
dGVzID0gPDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
I2Nvb2xpbmctY2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAgICAgICAg
ICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMTM+Ow0KICAgICAgICAg
ICAgICAgIH07DQogICAgICAgICAgICAgICAgY3B1QDEgew0KICAgICAgICAg
ICAgICAgICAgICAgICAgZGV2aWNlX3R5cGUgPSAiY3B1IjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGNvcnRleC1hNzIi
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDE+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgZW5hYmxlLW1ldGhvZCA9ICJw
c2NpIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwweDAw
MDAwMDAyIDB4MDAwMDAwMDEgMHgwMDAwMDAwMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICBuZXh0LWxldmVsLWNhY2hlID0gPDB4MDAwMDAwMDM+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgY3B1LWlkbGUtc3RhdGVzID0gPDB4
MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgI2Nvb2xpbmct
Y2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAgICAgICAgICAgICAgICAg
ICBwaGFuZGxlID0gPDB4MDAwMDAwMTQ+Ow0KICAgICAgICAgICAgICAgIH07
DQogICAgICAgICAgICAgICAgbDItY2FjaGUgew0KICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJjYWNoZSI7DQogICAgICAgICAgICAg
ICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMDM+Ow0KICAgICAgICAg
ICAgICAgIH07DQogICAgICAgIH07DQogICAgICAgIGlkbGUtc3RhdGVzIHsN
CiAgICAgICAgICAgICAgICBlbnRyeS1tZXRob2QgPSAiYXJtLHBzY2kiOw0K
ICAgICAgICAgICAgICAgIGNwdS1wdzIwIHsNCiAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAiYXJtLGlkbGUtc3RhdGUiOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgaWRsZS1zdGF0ZS1uYW1lID0gIlBXMjAiOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgYXJtLHBzY2ktc3VzcGVuZC1wYXJh
bSA9IDwweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGVu
dHJ5LWxhdGVuY3ktdXMgPSA8MHgwMDAwMDdkMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICBleGl0LWxhdGVuY3ktdXMgPSA8MHgwMDAwMDdkMD47DQog
ICAgICAgICAgICAgICAgICAgICAgICBtaW4tcmVzaWRlbmN5LXVzID0gPDB4
MDAwMDE3NzA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9
IDwweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICB9
Ow0KICAgICAgICBjbG9jay1zeXNjbGsgew0KICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KICAgICAgICAgICAgICAgICNj
bG9jay1jZWxscyA9IDwweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICBj
bG9jay1mcmVxdWVuY3kgPSA8MHgwNWY1ZTEwMD47DQogICAgICAgICAgICAg
ICAgY2xvY2stb3V0cHV0LW5hbWVzID0gInN5c2NsayI7DQogICAgICAgICAg
ICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDA3PjsNCiAgICAgICAgfTsNCiAg
ICAgICAgY2xvY2stb3NjLTI3bSB7DQogICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJmaXhlZC1jbG9jayI7DQogICAgICAgICAgICAgICAgI2Nsb2Nr
LWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDwweDAxOWJmY2MwPjsNCiAgICAgICAgICAgICAgICBj
bG9jay1vdXRwdXQtbmFtZXMgPSAicGh5XzI3bSI7DQogICAgICAgICAgICAg
ICAgcGhhbmRsZSA9IDwweDAwMDAwMDA1PjsNCiAgICAgICAgfTsNCiAgICAg
ICAgY2xvY2stZGlzcGxheUBmMWYwMDAwIHsNCiAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImZzbCxsczEwMjhhLXBsbGRpZyI7DQogICAgICAgICAg
ICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwZjFmMDAwMCAweDAwMDAwMDAw
IDB4MDAwMGZmZmY+Ow0KICAgICAgICAgICAgICAgICNjbG9jay1jZWxscyA9
IDwweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgw
MDAwMDAwNT47DQogICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAw
MDE3PjsNCiAgICAgICAgfTsNCiAgICAgICAgY2xvY2stYXhpIHsNCiAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsNCiAgICAg
ICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAg
ICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDB4MjZiZTM2ODA+Ow0K
ICAgICAgICAgICAgICAgIGNsb2NrLW91dHB1dC1uYW1lcyA9ICJhY2xrIjsN
CiAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMTg+Ow0KICAg
ICAgICB9Ow0KICAgICAgICBjbG9jay1hcGIgew0KICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOw0KICAgICAgICAgICAgICAg
ICNjbG9jay1jZWxscyA9IDwweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAg
ICBjbG9jay1mcmVxdWVuY3kgPSA8MHgyNmJlMzY4MD47DQogICAgICAgICAg
ICAgICAgY2xvY2stb3V0cHV0LW5hbWVzID0gInBjbGsiOw0KICAgICAgICAg
ICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAxOT47DQogICAgICAgIH07DQog
ICAgICAgIGNsb2NrLWhkcGNvcmUgew0KICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZml4ZWQtY2xvY2siOw0KICAgICAgICAgICAgICAgICNjbG9j
ay1jZWxscyA9IDwweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICBjbG9j
ay1mcmVxdWVuY3kgPSA8MHgwOWFmOGRhMD47DQogICAgICAgICAgICAgICAg
Y2xvY2stb3V0cHV0LW5hbWVzID0gImhkcGNsayI7DQogICAgICAgICAgICAg
ICAgcGhhbmRsZSA9IDwweDAwMDAwMDFiPjsNCiAgICAgICAgfTsNCiAgICAg
ICAgcmVib290IHsNCiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gInN5
c2Nvbi1yZWJvb3QiOw0KICAgICAgICAgICAgICAgIHJlZ21hcCA9IDwweDAw
MDAwMDA2PjsNCiAgICAgICAgICAgICAgICBvZmZzZXQgPSA8MHgwMDAwMDAw
MD47DQogICAgICAgICAgICAgICAgbWFzayA9IDwweDAwMDAwMDAyPjsNCiAg
ICAgICAgfTsNCiAgICAgICAgdGltZXIgew0KICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiYXJtLGFybXY4LXRpbWVyIjsNCiAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDEgMHgwMDAwMDAwZCAweDAwMDAw
MzA4IDB4MDAwMDAwMDEgMHgwMDAwMDAwZSAweDAwMDAwMzA4IDB4MDAwMDAw
MDEgMHgwMDAwMDAwYiAweDAwMDAwMzA4IDB4MDAwMDAwMDEgMHgwMDAwMDAw
YSAweDAwMDAwMzA4PjsNCiAgICAgICAgfTsNCiAgICAgICAgaW50ZXJydXB0
LWNvbnRyb2xsZXJANjAwMDAwMCB7DQogICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJhcm0sZ2ljLXYzIjsNCiAgICAgICAgICAgICAgICAjYWRkcmVz
cy1jZWxscyA9IDwweDAwMDAwMDAyPjsNCiAgICAgICAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwweDAwMDAwMDAyPjsNCiAgICAgICAgICAgICAgICByYW5n
ZXM7DQogICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwNjAw
MDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDAgMHgwMDAwMDAwMCAweDA2MDQw
MDAwIDB4MDAwMDAwMDAgMHgwMDA0MDAwMD47DQogICAgICAgICAgICAgICAg
I2ludGVycnVwdC1jZWxscyA9IDwweDAwMDAwMDAzPjsNCiAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCiAgICAgICAgICAgICAgICBp
bnRlcnJ1cHRzID0gPDB4MDAwMDAwMDEgMHgwMDAwMDAwOSAweDAwMDAwZjA4
PjsNCiAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMDE+Ow0K
ICAgICAgICAgICAgICAgIGdpYy1pdHNANjAyMDAwMCB7DQogICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFybSxnaWMtdjMtaXRzIjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIG1zaS1jb250cm9sbGVyOw0KICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwNjAy
MDAwMCAweDAwMDAwMDAwIDB4MDAwMjAwMDA+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDBkPjsNCiAgICAgICAgICAg
ICAgICB9Ow0KICAgICAgICB9Ow0KICAgICAgICBzb2Mgew0KICAgICAgICAg
ICAgICAgIGNvbXBhdGlibGUgPSAic2ltcGxlLWJ1cyI7DQogICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAg
ICAgICAgICAgcmFuZ2VzOw0KICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8
MHgwMDAwMDAxZj47DQogICAgICAgICAgICAgICAgbWVtb3J5LWNvbnRyb2xs
ZXJAMTA4MDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZzbCxxb3JpcS1tZW1vcnktY29udHJvbGxlciI7DQogICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAxMDgwMDAw
IDB4MDAwMDAwMDAgMHgwMDAwMTAwMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDA5MCAweDAw
MDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGJpZy1lbmRpYW47
DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAw
MjA+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgc3lz
Y29uQDFlMDAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJmc2wsbHMxMDI4YS1kY2ZnIiwgInN5c2NvbiI7DQogICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAxZTAwMDAw
IDB4MDAwMDAwMDAgMHgwMDAxMDAwMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICBiaWctZW5kaWFuOw0KICAgICAgICAgICAgICAgICAgICAgICAgcGhh
bmRsZSA9IDwweDAwMDAwMDIxPjsNCiAgICAgICAgICAgICAgICB9Ow0KICAg
ICAgICAgICAgICAgIHN5c2NvbkAxZTYwMDAwIHsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtcnN0IiwgInN5
c2NvbiI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAw
MDAwMCAweDAxZTYwMDAwIDB4MDAwMDAwMDAgMHgwMDAxMDAwMD47DQogICAg
ICAgICAgICAgICAgICAgICAgICBsaXR0bGUtZW5kaWFuOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDA2PjsNCiAgICAg
ICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIHN5c2NvbkAxZmMwMDAw
IHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNs
LGxzMTAyOGEtc2NmZyIsICJzeXNjb24iOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMWZjMDAwMCAweDAwMDAwMDAw
IDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgYmlnLWVu
ZGlhbjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgw
MDAwMDAyMj47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAg
ICBjbG9jay1jb250cm9sbGVyQDEzMDAwMDAgew0KICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1jbG9ja2dlbiI7
DQogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAw
eDAxMzAwMDAwIDB4MDAwMDAwMDAgMHgwMDBhMDAwMD47DQogICAgICAgICAg
ICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MHgwMDAwMDAwMj47DQog
ICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgwMDAwMDAwNz47
DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAw
MDI+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgdXNi
QDMxMDAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgeGVuLHBhc3N0
aHJvdWdoOw0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJzbnBzLGR3YzMiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDB4MDAwMDAwMDAgMHgwMzEwMDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAw
MDAwMDAwIDB4MDAwMDAwNTAgMHgwMDAwMDAwND47DQogICAgICAgICAgICAg
ICAgICAgICAgICBkcl9tb2RlID0gImhvc3QiOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgc25wcyxkaXNfcnhkZXRfaW5wM19xdWlyazsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIHNucHMscXVpcmstZnJhbWUtbGVuZ3RoLWFkanVz
dG1lbnQgPSA8MHgwMDAwMDAyMD47DQogICAgICAgICAgICAgICAgICAgICAg
ICBzbnBzLGluY3ItYnVyc3QtdHlwZS1hZGp1c3RtZW50ID0gPDB4MDAwMDAw
MDEgMHgwMDAwMDAwNCAweDAwMDAwMDA4IDB4MDAwMDAwMTA+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDIzPjsNCiAg
ICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIHVzYkAzMTEwMDAw
IHsNCiAgICAgICAgICAgICAgICAgICAgICAgIHhlbixwYXNzdGhyb3VnaDsN
CiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAic25wcyxk
d2MzIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDAwIDB4MDMxMTAwMDAgMHgwMDAwMDAwMCAweDAwMDEwMDAwPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAw
eDAwMDAwMDUxIDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgZHJfbW9kZSA9ICJob3N0IjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IHNucHMsZGlzX3J4ZGV0X2lucDNfcXVpcms7DQogICAgICAgICAgICAgICAg
ICAgICAgICBzbnBzLHF1aXJrLWZyYW1lLWxlbmd0aC1hZGp1c3RtZW50ID0g
PDB4MDAwMDAwMjA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgc25wcyxp
bmNyLWJ1cnN0LXR5cGUtYWRqdXN0bWVudCA9IDwweDAwMDAwMDAxIDB4MDAw
MDAwMDQgMHgwMDAwMDAwOCAweDAwMDAwMDEwPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAyND47DQogICAgICAgICAg
ICAgICAgfTsNCiAgICAgICAgICAgICAgICBzcGlAMjBjMDAwMCB7DQogICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCxseDIxNjBh
LWZzcGkiOw0KICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2Vs
bHMgPSA8MHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAgICAgICAgICAj
c2l6ZS1jZWxscyA9IDwweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDIwYzAwMDAgMHgwMDAwMDAw
MCAweDAwMDEwMDAwIDB4MDAwMDAwMDAgMHgyMDAwMDAwMCAweDAwMDAwMDAw
IDB4MTAwMDAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnLW5h
bWVzID0gImZzcGlfYmFzZSIsICJmc3BpX21tYXAiOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAw
MTkgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9j
a3MgPSA8MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDMgMHgwMDAw
MDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDM+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgY2xvY2stbmFtZXMgPSAiZnNwaV9lbiIsICJmc3BpIjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJva2F5IjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIG54cCxmc3BpLWhhcy1zZWNvbmQtY2hpcDsN
CiAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAy
NT47DQogICAgICAgICAgICAgICAgICAgICAgICB3MjVxMzJqd0AwIHsNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMg
PSA8MHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIncyNXEzMmp3Iiwg
ImplZGVjLHNwaS1ub3IiOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtMjVwLGZhc3QtcmVhZDsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3BpLW1heC1mcmVxdWVuY3kgPSA8MHgwN2VkNmI0MD47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3BpLXJ4
LWJ1cy13aWR0aCA9IDwweDAwMDAwMDAyPjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3BpLXR4LWJ1cy13aWR0aCA9IDwweDAwMDAwMDAx
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFydGl0aW9u
QDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gInJjdyI7DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVhZC1v
bmx5Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJ0aXRpb25AMTAwMDAg
ew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
ZyA9IDwweDAwMDEwMDAwIDB4MDAwZjAwMDA+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0gImZhaWxzYWZlIGJv
b3Rsb2FkZXIiOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHJlYWQtb25seTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFy
dGl0aW9uQDEwMDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4MDAxMDAwMDAgMHgwMDA0MDAwMD47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwg
PSAiZmFpbHNhZmUgRFAgZmlybXdhcmUiOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJlYWQtb25seTsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGFydGl0aW9uQDE0MDAwMCB7DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAxNDAwMDAg
MHgwMDBhMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbGFiZWwgPSAiZmFpbHNhZmUgdHJ1c3RlZCBmaXJtd2FyZSI7
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVh
ZC1vbmx5Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJ0aXRpb25AMWUw
MDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwMDFlMDAwMCAweDAwMDIwMDAwPjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJyZXNlcnZl
ZCI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVhZC1vbmx5Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXJ0aXRpb25A
MjAwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHgwMDIwMDAwMCAweDAwMDEwMDAwPjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJjb25m
aWd1cmF0aW9uIHN0b3JlIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFy
dGl0aW9uQDIxMDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVnID0gPDB4MDAyMTAwMDAgMHgwMDBmMDAwMD47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwg
PSAiYm9vdGxvYWRlciI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIH07DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhcnRp
dGlvbkAzMDAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAwMzAwMDAwIDB4MDAwNDAwMDA+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVsID0g
IkRQIGZpcm13YXJlIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFydGl0
aW9uQDM0MDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MDAzNDAwMDAgMHgwMDBhMDAwMD47DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGFiZWwgPSAi
dHJ1c3RlZCBmaXJtd2FyZSI7DQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIH07DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBh
cnRpdGlvbkAzZTAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAwM2UwMDAwIDB4MDAwMjAwMDA+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxhYmVs
ID0gImJvb3Rsb2FkZXIgZW52aXJvbm1lbnQiOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
fTsNCiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIGkyY0Ay
MDAwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiZnNsLHZmNjEwLWkyYyI7DQogICAgICAgICAgICAgICAgICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjAwMDAw
MCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwMjIgMHgw
MDAwMDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8
MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgZG1hLW5hbWVzOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgZG1hcyA9IDwweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAy
NyAweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAyNj47DQogICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQogICAgICAgICAg
ICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMjY+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgcnRjQDMyIHsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJtaWNyb2NyeXN0YWwscnY4
ODAzIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0g
PDB4MDAwMDAwMzI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnRlcnJ1cHQtcGFyZW50ID0gPDB4MDAwMDAwMDk+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAw
MDAgMHgwMDAwMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHdha2V1cC1zb3VyY2U7DQogICAgICAgICAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgc2wyOGNwbGRANGEgew0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9
IDwweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAia29udHJvbixzbDI4
Y3BsZCI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAwMDAwMDRhPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0LXBhcmVudCA9IDwweDAwMDAwMDBhPjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAw
MDA2IDB4MDAwMDAwMDI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwweDAwMDAwMDAy
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9
IDwweDAwMDAwMDA5PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgd2F0Y2hkb2dANCB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJrb250cm9uLHNsMjhjcGxkLXdk
dCI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
cmVnID0gPDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB9Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
YW5AYiB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJrb250cm9uLHNsMjhjcGxkLWZhbiI7DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
MDAwMDAwMGI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwd20wQGMgew0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNwd20t
Y2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJrb250cm9uLHNsMjhj
cGxkLXB3bSI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MDAwMDAwMGM+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAyNz47
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHB3bTFAZSB7DQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI3B3bS1jZWxscyA9IDww
eDAwMDAwMDAyPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImtvbnRyb24sc2wyOGNwbGQtcHdtIjsN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwMDAwMDAwZT47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDI4PjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZ3BpbzBAMTAgew0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAia29udHJvbixz
bDI4Y3BsZC1ncGlvIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAxMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBhcmVudCA9
IDwweDAwMDAwMDBhPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDYgMHgwMDAwMDAw
Mj47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z3Bpby1jb250cm9sbGVyOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICNncGlvLWNlbGxzID0gPDB4MDAwMDAwMDI+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwaW8tbGlu
ZS1uYW1lcyA9ICJHUElPMF9DQU0wX1BXUl9OIiwgIkdQSU8xX0NBTTFfUFdS
X04iLCAiR1BJTzJfQ0FNMF9SU1RfTiIsICJHUElPM19DQU0xX1JTVF9OIiwg
IkdQSU80X0hEQV9SU1RfTiIsICJHUElPNV9QV01fT1VUIiwgIkdQSU82X1RB
Q0hJTiIsICJHUElPNyI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7DQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2ludGVycnVwdC1jZWxs
cyA9IDwweDAwMDAwMDAyPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMjk+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBncGlvMUAxNSB7DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJrb250cm9u
LHNsMjhjcGxkLWdwaW8iOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDE1PjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtcGFyZW50
ID0gPDB4MDAwMDAwMGE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwNiAweDAwMDAw
MDAyPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBncGlvLWNvbnRyb2xsZXI7DQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgI2dwaW8tY2VsbHMgPSA8MHgwMDAwMDAwMj47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpby1s
aW5lLW5hbWVzID0gWzQ3IDUwIDQ5IDRmIDM4IDAwIDQ3IDUwIDQ5IDRmIDM5
IDAwIDQ3IDUwIDQ5IDRmIDMxIDMwIDAwIDQ3IDUwIDQ5IDRmIDMxIDMxIDAw
IDAwIDAwIDAwIDAwXTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHQtY29udHJvbGxlcjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxz
ID0gPDB4MDAwMDAwMDI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAyYT47DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdwbzBAMWEgew0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAia29udHJvbixz
bDI4Y3BsZC1ncG8iOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDFhPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvLWNvbnRyb2xsZXI7DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgI2dwaW8t
Y2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgZ3Bpby1saW5lLW5hbWVzID0gKiAweDAwMDAw
MDAwODI4MDE5ODggWzB4MDAwMDAwNzJdOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAxZD47
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGdwaTBAMWIgew0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
a29udHJvbixzbDI4Y3BsZC1ncGkiOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDFiPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBncGlvLWNvbnRy
b2xsZXI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgI2dwaW8tY2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3Bpby1saW5lLW5hbWVzID0g
KiAweDAwMDAwMDAwODI4MDFhNzggWzB4MDAwMDAwNTJdOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgw
MDAwMDAxZT47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07
DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgZWVwcm9tQDUwIHsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMzMiI7DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDUwPjsN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZXNpemUgPSA8
MHgwMDAwMDAyMD47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAg
ICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgaTJjQDIwMTAwMDAg
ew0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2ws
dmY2MTAtaTJjIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNz
LWNlbGxzID0gPDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgI3NpemUtY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAyMDEwMDAwIDB4MDAw
MDAwMDAgMHgwMDAxMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICBp
bnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAyMiAweDAwMDAwMDA0
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwweDAwMDAw
MDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAg
ICAgICAgICBkbWEtbmFtZXMgPSAidHgiLCAicngiOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgZG1hcyA9IDwweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgw
MDAwMDAyNSAweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAyND47DQog
ICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDJi
PjsNCiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIGkyY0Ay
MDIwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiZnNsLHZmNjEwLWkyYyI7DQogICAgICAgICAgICAgICAgICAgICAgICAj
YWRkcmVzcy1jZWxscyA9IDwweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjAyMDAw
MCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwMjMgMHgw
MDAwMDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8
MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgZG1hLW5hbWVzID0gInR4IiwgInJ4IjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGRtYXMgPSA8MHgwMDAwMDAwOCAweDAwMDAw
MDAxIDB4MDAwMDAwMjMgMHgwMDAwMDAwOCAweDAwMDAwMDAxIDB4MDAwMDAw
MjI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2Fi
bGVkIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgw
MDAwMDAyYz47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAg
ICBpMmNAMjAzMDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImZzbCx2ZjYxMC1pMmMiOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAwMT47DQogICAgICAg
ICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwMDAwMDAwPjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4
MDIwMzAwMDAgMHgwMDAwMDAwMCAweDAwMDEwMDAwPjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAweDAwMDAw
MDIzIDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPDB4MDAwMDAwMDIgMHgwMDAwMDAwNCAweDAwMDAwMDAxPjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGRtYS1uYW1lczsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIGRtYXMgPSA8MHgwMDAwMDAwOCAweDAwMDAwMDAxIDB4
MDAwMDAwMjkgMHgwMDAwMDAwOCAweDAwMDAwMDAxIDB4MDAwMDAwMjg+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KICAg
ICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDJkPjsN
CiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIGkyY0AyMDQw
MDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
ZnNsLHZmNjEwLWkyYyI7DQogICAgICAgICAgICAgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjA0MDAwMCAw
eDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwNGEgMHgwMDAw
MDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgw
MDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgZG1hLW5hbWVzOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgZG1hcyA9IDwweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAyYiAw
eDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAyYT47DQogICAgICAgICAg
ICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQogICAgICAgICAgICAg
ICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMmU+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgZWVwcm9tQDUwIHsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCwyNGMzMiI7DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDUwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFnZXNp
emUgPSA8MHgwMDAwMDAyMD47DQogICAgICAgICAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgaTJjQDIw
NTAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJmc2wsdmY2MTAtaTJjIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICNh
ZGRyZXNzLWNlbGxzID0gPDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgI3NpemUtY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAyMDUwMDAw
IDB4MDAwMDAwMDAgMHgwMDAxMDAwMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDA0YSAweDAw
MDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDww
eDAwMDAwMDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47DQogICAgICAgICAg
ICAgICAgICAgICAgICBkbWEtbmFtZXMgPSAidHgiLCAicngiOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgZG1hcyA9IDwweDAwMDAwMDA4IDB4MDAwMDAw
MDEgMHgwMDAwMDAyZCAweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAy
Yz47DQogICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJs
ZWQiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAw
MDAwMDJmPjsNCiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAg
IGkyY0AyMDYwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZnNsLHZmNjEwLWkyYyI7DQogICAgICAgICAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDAwMDAwMDAxPjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgw
MjA2MDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAw
NGIgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9j
a3MgPSA8MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgZG1hLW5hbWVzID0gInR4IiwgInJ4IjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIGRtYXMgPSA8MHgwMDAwMDAwOCAw
eDAwMDAwMDAxIDB4MDAwMDAwMmYgMHgwMDAwMDAwOCAweDAwMDAwMDAxIDB4
MDAwMDAwMmU+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0g
ImRpc2FibGVkIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUg
PSA8MHgwMDAwMDAzMD47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAg
ICAgICAgICBpMmNAMjA3MDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImZzbCx2ZjYxMC1pMmMiOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAwMT47DQog
ICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwMDAw
MDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDAwIDB4MDIwNzAwMDAgMHgwMDAwMDAwMCAweDAwMDEwMDAwPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAw
eDAwMDAwMDRiIDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPDB4MDAwMDAwMDIgMHgwMDAwMDAwNCAweDAwMDAwMDAx
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIs
ICJyeCI7DQogICAgICAgICAgICAgICAgICAgICAgICBkbWFzID0gPDB4MDAw
MDAwMDggMHgwMDAwMDAwMSAweDAwMDAwMDExIDB4MDAwMDAwMDggMHgwMDAw
MDAwMSAweDAwMDAwMDEwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHN0
YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAgICBw
aGFuZGxlID0gPDB4MDAwMDAwMzE+Ow0KICAgICAgICAgICAgICAgIH07DQog
ICAgICAgICAgICAgICAgc3BpQDIxMDAwMDAgew0KICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kc3BpIiwgImZz
bCxsczEwMjFhLXYxLjAtZHNwaSI7DQogICAgICAgICAgICAgICAgICAgICAg
ICAjYWRkcmVzcy1jZWxscyA9IDwweDAwMDAwMDAxPjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjEw
MDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwMWEg
MHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1u
YW1lcyA9ICJkc3BpIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2Nr
cyA9IDwweDAwMDAwMDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47DQogICAg
ICAgICAgICAgICAgICAgICAgICBzcGktbnVtLWNoaXBzZWxlY3RzID0gPDB4
MDAwMDAwMDU+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgbGl0dGxlLWVu
ZGlhbjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4
MDAwMDAwMzI+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAg
ICAgc3BpQDIxMTAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1kc3BpIiwgImZzbCxsczEwMjFhLXYx
LjAtZHNwaSI7DQogICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICNzaXplLWNlbGxzID0gPDB4MDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjExMDAwMCAweDAwMDAw
MDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwMWEgMHgwMDAwMDAwND47
DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJkc3Bp
IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwweDAwMDAw
MDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAg
ICAgICAgICBzcGktbnVtLWNoaXBzZWxlY3RzID0gPDB4MDAwMDAwMDU+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgbGl0dGxlLWVuZGlhbjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAg
ICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMzM+Ow0K
ICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgc3BpQDIxMjAw
MDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJm
c2wsbHMxMDI4YS1kc3BpIiwgImZzbCxsczEwMjFhLXYxLjAtZHNwaSI7DQog
ICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwweDAw
MDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxz
ID0gPDB4MDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MDAwMDAwMDAgMHgwMjEyMDAwMCAweDAwMDAwMDAwIDB4MDAwMTAw
MDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDww
eDAwMDAwMDAwIDB4MDAwMDAwMWEgMHgwMDAwMDAwND47DQogICAgICAgICAg
ICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJkc3BpIjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIGNsb2NrcyA9IDwweDAwMDAwMDAyIDB4MDAwMDAw
MDQgMHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAgICAgICAgICBzcGkt
bnVtLWNoaXBzZWxlY3RzID0gPDB4MDAwMDAwMDU+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgbGl0dGxlLWVuZGlhbjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAg
ICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwMzQ+Ow0KICAgICAgICAgICAg
ICAgIH07DQogICAgICAgICAgICAgICAgY2FuQDIxODAwMDAgew0KICAgICAg
ICAgICAgICAgICAgICAgICAgeGVuLHBhc3N0aHJvdWdoOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YXIxLWZs
ZXhjYW4iLCAiZnNsLGx4MjE2MGFyMS1mbGV4Y2FuIjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDIxODAwMDAgMHgw
MDAwMDAwMCAweDAwMDEwMDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAweDAwMDAwMDE1IDB4MDAwMDAw
MDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPDB4MDAw
MDAwMDcgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiaXBnIiwgInBl
ciI7DQogICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7
DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAw
MzU+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgY2Fu
QDIxOTAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgeGVuLHBhc3N0
aHJvdWdoOw0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJmc2wsbHMxMDI4YXIxLWZsZXhjYW4iLCAiZnNsLGx4MjE2MGFyMS1mbGV4
Y2FuIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDAwIDB4MDIxOTAwMDAgMHgwMDAwMDAwMCAweDAwMDEwMDAwPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAw
eDAwMDAwMDE2IDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPDB4MDAwMDAwMDcgMHgwMDAwMDAwMiAweDAwMDAwMDA0
IDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2st
bmFtZXMgPSAiaXBnIiwgInBlciI7DQogICAgICAgICAgICAgICAgICAgICAg
ICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgcGhhbmRsZSA9IDwweDAwMDAwMDM2PjsNCiAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICAgICAgICAgIHNlcmlhbEAyMWMwNTAwIHsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLG5zMTY1NTAiLCAi
bnMxNjU1MGEiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
MDAwMDAwMDAgMHgwMjFjMDUwMCAweDAwMDAwMDAwIDB4MDAwMDAxMDA+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAw
MDAwIDB4MDAwMDAwMjAgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAg
ICAgICAgICBjbG9ja3MgPSA8MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAw
MDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gIm9r
YXkiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAw
MDAwMDM3PjsNCiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAg
IHNlcmlhbEAyMWMwNjAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIHhl
bixwYXNzdGhyb3VnaDsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZnNsLG5zMTY1NTAiLCAibnMxNjU1MGEiOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjFjMDYwMCAw
eDAwMDAwMDAwIDB4MDAwMDAxMDA+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwMjAgMHgwMDAw
MDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgw
MDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gIm9rYXkiOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDM4PjsNCiAgICAgICAgICAg
ICAgICB9Ow0KICAgICAgICAgICAgICAgIHNlcmlhbEAyMjYwMDAwIHsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGxzMTAy
MWEtbHB1YXJ0IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDww
eDAwMDAwMDAwIDB4MDIyNjAwMDAgMHgwMDAwMDAwMCAweDAwMDAxMDAwPjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAw
MDAwMCAweDAwMDAwMGU4IDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgY2xvY2tzID0gPDB4MDAwMDAwMDIgMHgwMDAwMDAwNCAweDAw
MDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrLW5hbWVz
ID0gImlwZyI7DQogICAgICAgICAgICAgICAgICAgICAgICBkbWEtbmFtZXMg
PSAidHgiLCAicngiOw0KICAgICAgICAgICAgICAgICAgICAgICAgZG1hcyA9
IDwweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAyMSAweDAwMDAwMDA4
IDB4MDAwMDAwMDEgMHgwMDAwMDAyMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICBsaXR0bGUtZW5kaWFuOw0KICAgICAgICAgICAgICAgICAgICAgICAg
c3RhdHVzID0gImRpc2FibGVkIjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IHBoYW5kbGUgPSA8MHgwMDAwMDAzOT47DQogICAgICAgICAgICAgICAgfTsN
CiAgICAgICAgICAgICAgICBzZXJpYWxAMjI3MDAwMCB7DQogICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxsczEwMjFhLWxwdWFy
dCI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAw
MCAweDAyMjcwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMTAwMD47DQogICAgICAg
ICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAgMHgw
MDAwMDBlOSAweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IGNsb2NrcyA9IDwweDAwMDAwMDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47
DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJpcGci
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgZG1hLW5hbWVzID0gInR4Iiwg
InJ4IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGRtYXMgPSA8MHgwMDAw
MDAwOCAweDAwMDAwMDAxIDB4MDAwMDAwMWYgMHgwMDAwMDAwOCAweDAwMDAw
MDAxIDB4MDAwMDAwMWU+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgbGl0
dGxlLWVuZGlhbjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9
ICJva2F5IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8
MHgwMDAwMDAzYT47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAg
ICAgICBzZXJpYWxAMjI4MDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gImZzbCxsczEwMjFhLWxwdWFydCI7DQogICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAyMjgwMDAw
IDB4MDAwMDAwMDAgMHgwMDAwMTAwMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDBlYSAweDAw
MDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNsb2NrcyA9IDww
eDAwMDAwMDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47DQogICAgICAgICAg
ICAgICAgICAgICAgICBjbG9jay1uYW1lcyA9ICJpcGciOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgZG1hLW5hbWVzID0gInR4IiwgInJ4IjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGRtYXMgPSA8MHgwMDAwMDAwOCAweDAwMDAw
MDAxIDB4MDAwMDAwMWQgMHgwMDAwMDAwOCAweDAwMDAwMDAxIDB4MDAwMDAw
MWM+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgbGl0dGxlLWVuZGlhbjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAw
M2I+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgc2Vy
aWFsQDIyOTAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0
aWJsZSA9ICJmc2wsbHMxMDIxYS1scHVhcnQiOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjI5MDAwMCAweDAwMDAw
MDAwIDB4MDAwMDEwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwZWIgMHgwMDAwMDAwND47
DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgwMDAwMDAw
MiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgY2xvY2stbmFtZXMgPSAiaXBnIjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7DQogICAgICAgICAgICAg
ICAgICAgICAgICBkbWFzID0gPDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAw
MDAwMDFiIDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAwMDFhPjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGxpdHRsZS1lbmRpYW47DQogICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDNjPjsNCiAg
ICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIHNlcmlhbEAyMmEw
MDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
ZnNsLGxzMTAyMWEtbHB1YXJ0IjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwweDAwMDAwMDAwIDB4MDIyYTAwMDAgMHgwMDAwMDAwMCAweDAw
MDAxMDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMg
PSA8MHgwMDAwMDAwMCAweDAwMDAwMGVjIDB4MDAwMDAwMDQ+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPDB4MDAwMDAwMDIgMHgwMDAw
MDAwNCAweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNs
b2NrLW5hbWVzID0gImlwZyI7DQogICAgICAgICAgICAgICAgICAgICAgICBk
bWEtbmFtZXMgPSAidHgiLCAicngiOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgZG1hcyA9IDwweDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAxOSAw
eDAwMDAwMDA4IDB4MDAwMDAwMDEgMHgwMDAwMDAxOD47DQogICAgICAgICAg
ICAgICAgICAgICAgICBsaXR0bGUtZW5kaWFuOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAzZD47DQogICAgICAgICAg
ICAgICAgfTsNCiAgICAgICAgICAgICAgICBzZXJpYWxAMjJiMDAwMCB7DQog
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxsczEw
MjFhLWxwdWFydCI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgwMDAwMDAwMCAweDAyMmIwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMTAwMD47
DQogICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAw
MDAwMDAgMHgwMDAwMDBlZCAweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGNsb2NrcyA9IDwweDAwMDAwMDAyIDB4MDAwMDAwMDQgMHgw
MDAwMDAwMT47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1l
cyA9ICJpcGciOw0KICAgICAgICAgICAgICAgICAgICAgICAgZG1hLW5hbWVz
ID0gInR4IiwgInJ4IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGRtYXMg
PSA8MHgwMDAwMDAwOCAweDAwMDAwMDAxIDB4MDAwMDAwMTcgMHgwMDAwMDAw
OCAweDAwMDAwMDAxIDB4MDAwMDAwMTY+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgbGl0dGxlLWVuZGlhbjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAg
ICBwaGFuZGxlID0gPDB4MDAwMDAwM2U+Ow0KICAgICAgICAgICAgICAgIH07
DQogICAgICAgICAgICAgICAgZG1hLWNvbnRyb2xsZXJAMjJjMDAwMCB7DQog
ICAgICAgICAgICAgICAgICAgICAgICAjc3RyZWFtLWlkLWNlbGxzID0gPDB4
MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgI2RtYS1jZWxs
cyA9IDwweDAwMDAwMDAyPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNv
bXBhdGlibGUgPSAiZnNsLHZmNjEwLWVkbWEiOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwMjJjMDAwMCAweDAwMDAw
MDAwIDB4MDAwMTAwMDAgMHgwMDAwMDAwMCAweDAyMmQwMDAwIDB4MDAwMDAw
MDAgMHgwMDAxMDAwMCAweDAwMDAwMDAwIDB4MDIyZTAwMDAgMHgwMDAwMDAw
MCAweDAwMDEwMDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGludGVy
cnVwdHMgPSA8MHgwMDAwMDAwMCAweDAwMDAwMDM4IDB4MDAwMDAwMDQgMHgw
MDAwMDAwMCAweDAwMDAwMDM4IDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgaW50ZXJydXB0LW5hbWVzID0gImVkbWEtdHgiLCAiZWRt
YS1lcnIiOw0KICAgICAgICAgICAgICAgICAgICAgICAgZG1hLWNoYW5uZWxz
ID0gPDB4MDAwMDAwMjA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2stbmFtZXMgPSAiZG1hbXV4MCIsICJkbWFtdXgxIjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIGNsb2NrcyA9IDwweDAwMDAwMDAyIDB4MDAwMDAwMDQg
MHgwMDAwMDAwMSAweDAwMDAwMDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47
DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAw
MDg+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgZ3Bp
b0AyMzAwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZnNsLGxzMTAyOGEtZ3BpbyIsICJmc2wscW9yaXEtZ3BpbyI7DQog
ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwMCAweDAy
MzAwMDAwIDB4MDAwMDAwMDAgMHgwMDAxMDAwMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAy
NCAweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGdwaW8t
Y29udHJvbGxlcjsNCiAgICAgICAgICAgICAgICAgICAgICAgICNncGlvLWNl
bGxzID0gPDB4MDAwMDAwMDI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0LWNvbnRyb2xsZXI7DQogICAgICAgICAgICAgICAgICAgICAg
ICAjaW50ZXJydXB0LWNlbGxzID0gPDB4MDAwMDAwMDI+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgbGl0dGxlLWVuZGlhbjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGdwaW8tbGluZS1uYW1lcyA9IFswMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCA1NCA0NCA0ZiAwMCA1NCA0MyA0YiAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMF07DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0g
PDB4MDAwMDAwM2Y+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAg
ICAgICAgZ3Bpb0AyMzEwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAg
IGNvbXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtZ3BpbyIsICJmc2wscW9yaXEt
Z3BpbyI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAw
MDAwMCAweDAyMzEwMDAwIDB4MDAwMDAwMDAgMHgwMDAxMDAwMD47DQogICAg
ICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAg
MHgwMDAwMDAyNCAweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgIGdwaW8tY29udHJvbGxlcjsNCiAgICAgICAgICAgICAgICAgICAgICAg
ICNncGlvLWNlbGxzID0gPDB4MDAwMDAwMDI+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7DQogICAgICAgICAgICAg
ICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDB4MDAwMDAwMDI+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgbGl0dGxlLWVuZGlhbjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGdwaW8tbGluZS1uYW1lcyA9IFswMCAwMCAw
MCAwMCAwMCAwMCA1NCA0ZCA1MyAwMCA1NCA0NCA0OSAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAw
MCAwMCAwMCAwMCAwMCAwMF07DQogICAgICAgICAgICAgICAgICAgICAgICBw
aGFuZGxlID0gPDB4MDAwMDAwMGE+Ow0KICAgICAgICAgICAgICAgIH07DQog
ICAgICAgICAgICAgICAgZ3Bpb0AyMzIwMDAwIHsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtZ3BpbyIsICJm
c2wscW9yaXEtZ3BpbyI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwMDAwMDAwMCAweDAyMzIwMDAwIDB4MDAwMDAwMDAgMHgwMDAxMDAw
MD47DQogICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4
MDAwMDAwMDAgMHgwMDAwMDAyNSAweDAwMDAwMDA0PjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICNncGlvLWNlbGxzID0gPDB4MDAwMDAwMDI+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LWNvbnRyb2xsZXI7DQogICAg
ICAgICAgICAgICAgICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDB4MDAw
MDAwMDI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgbGl0dGxlLWVuZGlh
bjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAw
MDA0MD47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICBj
cnlwdG9AODAwMDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICB4ZW4s
cGFzc3Rocm91Z2g7DQogICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZzbCxzZWMtdjUuMCIsICJmc2wsc2VjLXY0LjAiOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgZnNsLHNlYy1lcmEgPSA8MHgwMDAwMDAwYT47
DQogICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDww
eDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNl
bGxzID0gPDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
cmFuZ2VzID0gPDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAweDA4MDAwMDAwIDB4
MDAxMDAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4
MDAwMDAwMDAgMHgwODAwMDAwMCAweDAwMDAwMDAwIDB4MDAxMDAwMDA+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAw
MDAwIDB4MDAwMDAwOGIgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAg
ICAgICAgICBkbWEtY29oZXJlbnQ7DQogICAgICAgICAgICAgICAgICAgICAg
ICBwaGFuZGxlID0gPDB4MDAwMDAwNDE+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAganJAMTAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImZzbCxzZWMtdjUuMC1qb2ItcmluZyIsICJm
c2wsc2VjLXY0LjAtam9iLXJpbmciOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByZWcgPSA8MHgwMDAxMDAwMCAweDAwMDEwMDAwPjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDww
eDAwMDAwMDAwIDB4MDAwMDAwOGMgMHgwMDAwMDAwND47DQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDA0Mj47
DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAganJAMjAwMDAgew0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wYXRpYmxlID0gImZzbCxzZWMtdjUuMC1qb2ItcmluZyIs
ICJmc2wsc2VjLXY0LjAtam9iLXJpbmciOw0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MHgwMDAyMDAwMCAweDAwMDEwMDAwPjsN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9
IDwweDAwMDAwMDAwIDB4MDAwMDAwOGQgMHgwMDAwMDAwND47DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDA0
Mz47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAganJAMzAwMDAgew0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxzZWMtdjUuMC1qb2Itcmlu
ZyIsICJmc2wsc2VjLXY0LjAtam9iLXJpbmciOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAzMDAwMCAweDAwMDEwMDAw
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0
cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwOGUgMHgwMDAwMDAwND47DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAw
MDA0ND47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAganJANDAwMDAgew0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxzZWMtdjUuMC1qb2It
cmluZyIsICJmc2wsc2VjLXY0LjAtam9iLXJpbmciOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDA0MDAwMCAweDAwMDEw
MDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJy
dXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwOGYgMHgwMDAwMDAwND47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgw
MDAwMDA0NT47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgd2R0QGMwMDAwMDAgew0K
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhcm0sc3A4
MDUiLCAiYXJtLHByaW1lY2VsbCI7DQogICAgICAgICAgICAgICAgICAgICAg
ICByZWcgPSA8MHgwMDAwMDAwMCAweDBjMDAwMDAwIDB4MDAwMDAwMDAgMHgw
MDAwMTAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8
MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMGYgMHgwMDAwMDAwMiAw
eDAwMDAwMDA0IDB4MDAwMDAwMGY+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2stbmFtZXMgPSAiYXBiX3BjbGsiLCAid2RvZ19jbGsiOw0KICAg
ICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDQ2PjsN
CiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIHdkdEBjMDEw
MDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
YXJtLHNwODA1IiwgImFybSxwcmltZWNlbGwiOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwYzAxMDAwMCAweDAwMDAw
MDAwIDB4MDAwMDEwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xv
Y2tzID0gPDB4MDAwMDAwMDIgMHgwMDAwMDAwNCAweDAwMDAwMDBmIDB4MDAw
MDAwMDIgMHgwMDAwMDAwNCAweDAwMDAwMDBmPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGNsb2NrLW5hbWVzID0gImFwYl9wY2xrIiwgIndkb2dfY2xr
IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAw
MDA0Nz47DQogICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICBt
bWNAMjE0MDAwMCB7DQogICAgICAgICAgICAgICAgICAgICAgICAjc3RyZWFt
LWlkLWNlbGxzID0gPDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1lc2RoYyIsICJmc2ws
ZXNkaGMiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAw
MDAwMDAgMHgwMjE0MDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAw
IDB4MDAwMDAwMWMgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgICAg
ICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MHgwMDAwMDAwMD47DQogICAgICAg
ICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgwMDAwMDAwMiAweDAwMDAw
MDAyIDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgdm9s
dGFnZS1yYW5nZXMgPSA8MHgwMDAwMDcwOCAweDAwMDAwNzA4IDB4MDAwMDBj
ZTQgMHgwMDAwMGNlND47DQogICAgICAgICAgICAgICAgICAgICAgICBzZGhj
aSxhdXRvLWNtZDEyOw0KICAgICAgICAgICAgICAgICAgICAgICAgbGl0dGxl
LWVuZGlhbjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGJ1cy13aWR0aCA9
IDwweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1
cyA9ICJva2F5IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHNkLXVocy1z
ZHIxMDQ7DQogICAgICAgICAgICAgICAgICAgICAgICBzZC11aHMtc2RyNTA7
DQogICAgICAgICAgICAgICAgICAgICAgICBzZC11aHMtc2RyMjU7DQogICAg
ICAgICAgICAgICAgICAgICAgICBzZC11aHMtc2RyMTI7DQogICAgICAgICAg
ICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNDg+Ow0KICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgbW1jQDIxNTAwMDAgew0K
ICAgICAgICAgICAgICAgICAgICAgICAgI3N0cmVhbS1pZC1jZWxscyA9IDww
eDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGli
bGUgPSAiZnNsLGxzMTAyOGEtZXNkaGMiLCAiZnNsLGVzZGhjIjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwMDAwIDB4MDIxNTAw
MDAgMHgwMDAwMDAwMCAweDAwMDEwMDAwPjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAweDAwMDAwMDNmIDB4
MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stZnJl
cXVlbmN5ID0gPDB4MDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgY2xvY2tzID0gPDB4MDAwMDAwMDIgMHgwMDAwMDAwMiAweDAwMDAwMDAx
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHZvbHRhZ2UtcmFuZ2VzID0g
PDB4MDAwMDA3MDggMHgwMDAwMDcwOCAweDAwMDAwY2U0IDB4MDAwMDBjZTQ+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgc2RoY2ksYXV0by1jbWQxMjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIGJyb2tlbi1jZDsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIGxpdHRsZS1lbmRpYW47DQogICAgICAgICAgICAg
ICAgICAgICAgICBidXMtd2lkdGggPSA8MHgwMDAwMDAwOD47DQogICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQogICAgICAgICAg
ICAgICAgICAgICAgICBtbWMtaHMyMDAtMV84djsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIG1tYy1wd3JzZXEgPSA8MHgwMDAwMDAwYj47DQogICAgICAg
ICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNDk+Ow0KICAg
ICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgc2F0YUAzMjAwMDAw
IHsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNs
LGxzMTAyOGEtYWhjaSI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcg
PSA8MHgwMDAwMDAwMCAweDAzMjAwMDAwIDB4MDAwMDAwMDAgMHgwMDAxMDAw
MCAweDAwMDAwMDA3IDB4MDAxMDA1MjAgMHgwMDAwMDAwMCAweDAwMDAwMDA0
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJhaGNp
IiwgInNhdGEtZWNjIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGludGVy
cnVwdHMgPSA8MHgwMDAwMDAwMCAweDAwMDAwMDg1IDB4MDAwMDAwMDQ+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2tzID0gPDB4MDAwMDAwMDIg
MHgwMDAwMDAwNCAweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAgICAg
ICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNGE+Ow0KICAgICAgICAgICAgICAg
IH07DQogICAgICAgICAgICAgICAgcGNpZUAzNDAwMDAwIHsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtcGNp
ZSI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAw
MCAweDAzNDAwMDAwIDB4MDAwMDAwMDAgMHgwMDEwMDAwMCAweDAwMDAwMDgw
IDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAweDAwMDAyMDAwPjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIHJlZy1uYW1lcyA9ICJyZWdzIiwgImNvbmZpZyI7
DQogICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAw
MDAwMDAgMHgwMDAwMDA2YyAweDAwMDAwMDA0IDB4MDAwMDAwMDAgMHgwMDAw
MDA2ZCAweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGlu
dGVycnVwdC1uYW1lcyA9ICJwbWUiLCAiYWVyIjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDB4MDAwMDAwMDM+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgI3NpemUtY2VsbHMgPSA8MHgwMDAwMDAw
Mj47DQogICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VfdHlwZSA9ICJw
Y2kiOw0KICAgICAgICAgICAgICAgICAgICAgICAgZG1hLWNvaGVyZW50Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgaW9tbXUtbWFwID0gPDB4MDAwMDAw
MDAgMHgwMDAwMDAwYyAweDAwMDAwMDAwIDB4MDAwMDAwMDE+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgYnVzLXJhbmdlID0gPDB4MDAwMDAwMDAgMHgw
MDAwMDBmZj47DQogICAgICAgICAgICAgICAgICAgICAgICByYW5nZXMgPSA8
MHg4MTAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMDA4MCAw
eDAwMDEwMDAwIDB4MDAwMDAwMDAgMHgwMDAxMDAwMCAweDgyMDAwMDAwIDB4
MDAwMDAwMDAgMHg0MDAwMDAwMCAweDAwMDAwMDgwIDB4NDAwMDAwMDAgMHgw
MDAwMDAwMCAweDQwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IG1zaS1wYXJlbnQgPSA8MHgwMDAwMDAwZD47DQogICAgICAgICAgICAgICAg
ICAgICAgICAjaW50ZXJydXB0LWNlbGxzID0gPDB4MDAwMDAwMDE+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW1hcC1tYXNrID0gPDB4
MDAwMDAwMDAgMHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDc+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LW1hcCA9ICogMHgw
MDAwMDAwMDgyODAzYmVjIFsweDAwMDAwMGEwXTsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAg
ICAgfTsNCiAgICAgICAgICAgICAgICBwY2llQDM1MDAwMDAgew0KICAgICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1w
Y2llIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAw
MDAwIDB4MDM1MDAwMDAgMHgwMDAwMDAwMCAweDAwMTAwMDAwIDB4MDAwMDAw
ODggMHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDIwMDA+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgcmVnLW5hbWVzID0gInJlZ3MiLCAiY29uZmln
IjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgw
MDAwMDAwMCAweDAwMDAwMDcxIDB4MDAwMDAwMDQgMHgwMDAwMDAwMCAweDAw
MDAwMDcyIDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0LW5hbWVzID0gInBtZSIsICJhZXIiOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAwMz47DQog
ICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwMDAw
MDAyPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZV90eXBlID0g
InBjaSI7DQogICAgICAgICAgICAgICAgICAgICAgICBkbWEtY29oZXJlbnQ7
DQogICAgICAgICAgICAgICAgICAgICAgICBpb21tdS1tYXAgPSA8MHgwMDAw
MDAwMCAweDAwMDAwMDBjIDB4MDAwMDAwMDAgMHgwMDAwMDAwMT47DQogICAg
ICAgICAgICAgICAgICAgICAgICBidXMtcmFuZ2UgPSA8MHgwMDAwMDAwMCAw
eDAwMDAwMGZmPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJhbmdlcyA9
IDwweDgxMDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAweDAwMDAwMDg4
IDB4MDAwMTAwMDAgMHgwMDAwMDAwMCAweDAwMDEwMDAwIDB4ODIwMDAwMDAg
MHgwMDAwMDAwMCAweDQwMDAwMDAwIDB4MDAwMDAwODggMHg0MDAwMDAwMCAw
eDAwMDAwMDAwIDB4NDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgbXNpLXBhcmVudCA9IDwweDAwMDAwMDBkPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8MHgwMDAwMDAwMT47DQog
ICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbWFwLW1hc2sgPSA8
MHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwNz47
DQogICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHQtbWFwID0gKiAw
eDAwMDAwMDAwODI4MDNlNTAgWzB4MDAwMDAwYTBdOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCiAgICAgICAgICAg
ICAgICB9Ow0KICAgICAgICAgICAgICAgIHBjaWVAMWYwMDAwMDAwIHsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAicGNpLWhvc3Qt
ZWNhbS1nZW5lcmljIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAwMDAwMDAxIDB4ZjAwMDAwMDAgMHgwMDAwMDAwMCAweDAwMTAwMDAw
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDB4MDAwMDAwMDM+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgI3NpemUt
Y2VsbHMgPSA8MHgwMDAwMDAwMj47DQogICAgICAgICAgICAgICAgICAgICAg
ICBtc2ktcGFyZW50ID0gPDB4MDAwMDAwMGQ+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgZGV2aWNlX3R5cGUgPSAicGNpIjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGJ1cy1yYW5nZSA9IDwweDAwMDAwMDAwIDB4MDAwMDAwMDA+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgZG1hLWNvaGVyZW50Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgbXNpLW1hcCA9IDwweDAwMDAwMDAwIDB4
MDAwMDAwMGQgMHgwMDAwMDAxNyAweDAwMDAwMDBlPjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIGlvbW11LW1hcCA9IDwweDAwMDAwMDAwIDB4MDAwMDAw
MGMgMHgwMDAwMDAxNyAweDAwMDAwMDBlPjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgIHJhbmdlcyA9ICogMHgwMDAwMDAwMDgyODA0MDA0IFsweDAwMDAw
MGM0XTsNCiAgICAgICAgICAgICAgICAgICAgICAgIGV0aGVybmV0QDAsMCB7
DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzdHJlYW0taWQt
Y2VsbHMgPSA8MHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNvbXBhdGlibGUgPSAiZnNsLGVuZXRjIjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgw
MDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwMD47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoeS1oYW5kbGUgPSA8
MHgwMDAwMDAwZT47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBoeS1jb25uZWN0aW9uLXR5cGUgPSAic2dtaWkiOw0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAib2theSI7DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDA0
Yj47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAg
ICAgICAgICAgICAgZXRoZXJuZXRAMCwxIHsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgI3N0cmVhbS1pZC1jZWxscyA9IDwweDAwMDAwMDAx
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJmc2wsZW5ldGMiOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHgwMDAwMDEwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAg
MHgwMDAwMDAwMCAweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGh5LWhhbmRsZSA9IDwweDAwMDAwMDBmPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcGh5LWNvbm5lY3Rpb24tdHlw
ZSA9ICJyZ21paSI7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0YXR1cyA9ICJva2F5IjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDRjPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgICAgICAgICBldGhlcm5l
dEAwLDIgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImZzbCxlbmV0YyI7DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlZyA9IDwweDAwMDAwMjAwIDB4MDAwMDAwMDAgMHgwMDAw
MDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzdGF0dXMgPSAiZGlzYWJsZWQiOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAw
NGQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmaXhlZC1s
aW5rIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBzcGVlZCA9IDwweDAwMDAwM2U4PjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBmdWxsLWR1cGxleDsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAg
ICAgIH07DQogICAgICAgICAgICAgICAgICAgICAgICBtZGlvQDAsMyB7DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
ZnNsLGVuZXRjLW1kaW8iOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICByZWcgPSA8MHgwMDAwMDMwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAg
MHgwMDAwMDAwMCAweDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MHgwMDAwMDAwMT47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDB4MDAwMDAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwaGFuZGxlID0gPDB4MDAwMDAwNGU+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBldGhlcm5ldC1waHlANSB7DQogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDU+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBo
YW5kbGUgPSA8MHgwMDAwMDAwZT47DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGV0aGVybmV0LXBoeUA0IHsNCiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZWcgPSA8MHgwMDAwMDAwND47DQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gIm9rYXki
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBo
YW5kbGUgPSA8MHgwMDAwMDAwZj47DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgZXRoZXJuZXRAMCw0IHsNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsZW5l
dGMtcHRwIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MDAwMDA0MDAgMHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAw
MDAgMHgwMDAwMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGNsb2NrcyA9IDwweDAwMDAwMDAyIDB4MDAwMDAwMDQgMHgwMDAwMDAw
MD47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxpdHRsZS1l
bmRpYW47DQogICAgICAgICAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgc3dpdGNoQDAsNSB7DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibXNjYyxmZWxpeC1zd2l0
Y2giOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgwMDAwMDUwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAw
eDAwMDAwMDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwNWYgMHgwMDAwMDAw
ND47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRzIHsN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwweDAwMDAw
MDAwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBwb3J0QDAgew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDA+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVz
ID0gImRpc2FibGVkIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDA0Zj47DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0QDEg
ew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVnID0gPDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2Fi
bGVkIjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDA1MD47DQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwb3J0QDIgew0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVn
ID0gPDB4MDAwMDAwMDI+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHBoYW5kbGUgPSA8MHgwMDAwMDA1MT47DQogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwb3J0QDMgew0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAw
MDAwMDM+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RhdHVzID0gImRpc2FibGVkIjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUg
PSA8MHgwMDAwMDA1Mj47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwb3J0QDQgew0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDQ+Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc3RhdHVzID0gImRpc2FibGVkIjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAw
MDA1Mz47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmaXhlZC1saW5rIHsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3BlZWQgPSA8
MHgwMDAwMDNlOD47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGZ1bGwtZHVwbGV4Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsN
CiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Ow0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBvcnRA
NSB7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICByZWcgPSA8MHgwMDAwMDAwNT47DQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBldGhlcm5ldCA9IDww
eDAwMDAwMDEwPjsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwaGFu
ZGxlID0gPDB4MDAwMDAwNTQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZml4ZWQtbGluayB7DQogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHNwZWVkID0gPDB4MDAwMDAzZTg+Ow0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdWxsLWR1
cGxleDsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fTsNCiAgICAgICAgICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAg
ICAgICAgICAgICBldGhlcm5ldEAwLDYgew0KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCxlbmV0YyI7DQogICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweDAwMDAwNjAw
IDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDA+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSAi
ZGlzYWJsZWQiOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBw
aGFuZGxlID0gPDB4MDAwMDAwMTA+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmaXhlZC1saW5rIHsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzcGVlZCA9IDwweDAwMDAwM2U4PjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmdWxsLWR1
cGxleDsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfTsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgfTsN
CiAgICAgICAgICAgICAgICBpb21tdUA1MDAwMDAwIHsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIG1tdS1tYXN0ZXJzID0gPDB4MDAwMDAwNDkgMHgwMDAw
MDgwMCAweDAwMDAwMDU3IDB4MDAwMDAwMTIgMHgwMDAwMDA0YiAweDAwMDAw
NDE3IDB4MDAwMDAwNGMgMHgwMDAwMDQxOCAweDAwMDAwMDA4IDB4MDAwMDAw
MjA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJh
cm0sbW11LTUwMCI7DQogICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8
MHgwMDAwMDAwMCAweDA1MDAwMDAwIDB4MDAwMDAwMDAgMHgwMDgwMDAwMD47
DQogICAgICAgICAgICAgICAgICAgICAgICAjZ2xvYmFsLWludGVycnVwdHMg
PSA8MHgwMDAwMDAwOD47DQogICAgICAgICAgICAgICAgICAgICAgICAjaW9t
bXUtY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICBzdHJlYW0tbWF0Y2gtbWFzayA9IDwweDAwMDA3YzAwPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSAqIDB4MDAwMDAwMDA4
MjgwNDg2NCBbMHgwMDAwMDM2MF07DQogICAgICAgICAgICAgICAgICAgICAg
ICBwaGFuZGxlID0gPDB4MDAwMDAwMGM+Ow0KICAgICAgICAgICAgICAgIH07
DQogICAgICAgICAgICAgICAgZG1hLWNvbnRyb2xsZXJAODM4MDAwMCB7DQog
ICAgICAgICAgICAgICAgICAgICAgICAjc3RyZWFtLWlkLWNlbGxzID0gPDB4
MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJmc2wsbHMxMDI4YS1xZG1hIiwgImZzbCxsczEwMjFhLXFkbWEiOw0K
ICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgw
ODM4MDAwMCAweDAwMDAwMDAwIDB4MDAwMDEwMDAgMHgwMDAwMDAwMCAweDA4
MzkwMDAwIDB4MDAwMDAwMDAgMHgwMDAxMDAwMCAweDAwMDAwMDAwIDB4MDgz
YTAwMDAgMHgwMDAwMDAwMCAweDAwMDQwMDAwPjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAweDAwMDAwMDJi
IDB4MDAwMDAwMDQgMHgwMDAwMDAwMCAweDAwMDAwMGZiIDB4MDAwMDAwMDQg
MHgwMDAwMDAwMCAweDAwMDAwMGZjIDB4MDAwMDAwMDQgMHgwMDAwMDAwMCAw
eDAwMDAwMGZkIDB4MDAwMDAwMDQgMHgwMDAwMDAwMCAweDAwMDAwMGZlIDB4
MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0
LW5hbWVzID0gInFkbWEtZXJyb3IiLCAicWRtYS1xdWV1ZTAiLCAicWRtYS1x
dWV1ZTEiLCAicWRtYS1xdWV1ZTIiLCAicWRtYS1xdWV1ZTMiOw0KICAgICAg
ICAgICAgICAgICAgICAgICAgY2hhbm5lbHMgPSA8MHgwMDAwMDAwOD47DQog
ICAgICAgICAgICAgICAgICAgICAgICBibG9jay1udW1iZXIgPSA8MHgwMDAw
MDAwMT47DQogICAgICAgICAgICAgICAgICAgICAgICBibG9jay1vZmZzZXQg
PSA8MHgwMDAxMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICBxdWV1
ZXMgPSA8MHgwMDAwMDAwMj47DQogICAgICAgICAgICAgICAgICAgICAgICBz
dGF0dXMtc2l6ZXMgPSA8MHgwMDAwMDA0MD47DQogICAgICAgICAgICAgICAg
ICAgICAgICBxdWV1ZS1zaXplcyA9IDwweDAwMDAwMDQwIDB4MDAwMDAwNDA+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAw
MDU3PjsNCiAgICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIGdw
dUBmMGMwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgIHhlbixwYXNz
dGhyb3VnaDsNCiAgICAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUg
PSAiZnNsLGxzMTAyOGEtZ3B1IjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IHJlZyA9IDwweDAwMDAwMDAwIDB4MGYwYzAwMDAgMHgwMDAwMDAwMCAweDAw
MDEwMDAwIDB4MDAwMDAwMDAgMHg4MDAwMDAwMCAweDAwMDAwMDAwIDB4ODAw
MDAwMDAgMHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAgMHgwMzAw
MDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICByZWctbmFtZXMgPSAi
YmFzZSIsICJwaHlzX2Jhc2VhZGRyIiwgImNvbnRpZ3VvdXNfbWVtIjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAw
MCAweDAwMDAwMGRjIDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgIH07
DQogICAgICAgICAgICAgICAgYXVkaW8tY29udHJvbGxlckBmMTAwMDAwIHsN
CiAgICAgICAgICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8
MHgwMDAwMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRp
YmxlID0gImZzbCx2ZjYxMC1zYWkiOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwZjEwMDAwMCAweDAwMDAwMDAwIDB4
MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0
cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwNTIgMHgwMDAwMDAwND47DQogICAg
ICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgwMDAwMDAwMiAweDAw
MDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAw
MDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAw
MDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVzIiwgIm1jbGsxIiwgIm1jbGsy
IiwgIm1jbGszIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGRtYS1uYW1l
cyA9ICJ0eCIsICJyeCI7DQogICAgICAgICAgICAgICAgICAgICAgICBkbWFz
ID0gPDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAwMDA0IDB4MDAwMDAw
MDggMHgwMDAwMDAwMSAweDAwMDAwMDAzPjsNCiAgICAgICAgICAgICAgICAg
ICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAg
ICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNTg+Ow0KICAgICAgICAgICAg
ICAgIH07DQogICAgICAgICAgICAgICAgYXVkaW8tY29udHJvbGxlckBmMTEw
MDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICNzb3VuZC1kYWktY2Vs
bHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gImZzbCx2ZjYxMC1zYWkiOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwZjExMDAwMCAweDAwMDAw
MDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwNTIgMHgwMDAwMDAwND47
DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgwMDAwMDAw
MiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0
IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDEg
MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVzIiwgIm1jbGsxIiwg
Im1jbGsyIiwgIm1jbGszIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIGRt
YS1uYW1lcyA9ICJ0eCIsICJyeCI7DQogICAgICAgICAgICAgICAgICAgICAg
ICBkbWFzID0gPDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAwMDA2IDB4
MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAwMDA1PjsNCiAgICAgICAgICAg
ICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAgICAgICAg
ICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNTk+Ow0KICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgYXVkaW8tY29udHJvbGxl
ckBmMTIwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICNzb3VuZC1k
YWktY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAgICAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImZzbCx2ZjYxMC1zYWkiOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwZjEyMDAwMCAw
eDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwNTMgMHgwMDAw
MDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8MHgw
MDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAw
MDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAw
MDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVzIiwgIm1j
bGsxIiwgIm1jbGsyIiwgIm1jbGszIjsNCiAgICAgICAgICAgICAgICAgICAg
ICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7DQogICAgICAgICAgICAgICAg
ICAgICAgICBkbWFzID0gPDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAw
MDA4IDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAwMDA3PjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7DQogICAg
ICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNWE+Ow0K
ICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgYXVkaW8tY29u
dHJvbGxlckBmMTMwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAgICAgICNz
b3VuZC1kYWktY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCx2ZjYxMC1zYWkiOw0KICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAgMHgwZjEz
MDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAgICAgICAg
ICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAwMDAwNTMg
MHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBjbG9ja3Mg
PSA8MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAw
MiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0
IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDE+
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAiYnVz
IiwgIm1jbGsxIiwgIm1jbGsyIiwgIm1jbGszIjsNCiAgICAgICAgICAgICAg
ICAgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7DQogICAgICAgICAg
ICAgICAgICAgICAgICBkbWFzID0gPDB4MDAwMDAwMDggMHgwMDAwMDAwMSAw
eDAwMDAwMDBhIDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAwMDA5PjsN
CiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7
DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAw
NWI+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgYXVk
aW8tY29udHJvbGxlckBmMTQwMDAwIHsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MHgwMDAwMDAwMD47DQogICAgICAg
ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCx2ZjYxMC1zYWki
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAg
MHgwZjE0MDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAwIDB4MDAw
MDAwNTQgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgICAgICAgICBj
bG9ja3MgPSA8MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgw
MDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAw
MDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAw
MDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2stbmFtZXMg
PSAiYnVzIiwgIm1jbGsxIiwgIm1jbGsyIiwgIm1jbGszIjsNCiAgICAgICAg
ICAgICAgICAgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7DQogICAg
ICAgICAgICAgICAgICAgICAgICBkbWFzID0gPDB4MDAwMDAwMDggMHgwMDAw
MDAwMSAweDAwMDAwMDBjIDB4MDAwMDAwMDggMHgwMDAwMDAwMSAweDAwMDAw
MDBiPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNh
YmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxlID0gPDB4
MDAwMDAwNWM+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgICAgICAg
ICAgYXVkaW8tY29udHJvbGxlckBmMTUwMDAwIHsNCiAgICAgICAgICAgICAg
ICAgICAgICAgICNzb3VuZC1kYWktY2VsbHMgPSA8MHgwMDAwMDAwMD47DQog
ICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImZzbCx2ZjYx
MC1zYWkiOw0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAw
MDAwMDAgMHgwZjE1MDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAg
ICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAwMDAw
IDB4MDAwMDAwNTQgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgICAg
ICAgICBjbG9ja3MgPSA8MHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAw
MDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAw
MiAweDAwMDAwMDA0IDB4MDAwMDAwMDEgMHgwMDAwMDAwMiAweDAwMDAwMDA0
IDB4MDAwMDAwMDE+Ow0KICAgICAgICAgICAgICAgICAgICAgICAgY2xvY2st
bmFtZXMgPSAiYnVzIiwgIm1jbGsxIiwgIm1jbGsyIiwgIm1jbGszIjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGRtYS1uYW1lcyA9ICJ0eCIsICJyeCI7
DQogICAgICAgICAgICAgICAgICAgICAgICBkbWFzID0gPDB4MDAwMDAwMDgg
MHgwMDAwMDAwMSAweDAwMDAwMDBlIDB4MDAwMDAwMDggMHgwMDAwMDAwMSAw
eDAwMDAwMDBkPjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9
ICJkaXNhYmxlZCI7DQogICAgICAgICAgICAgICAgICAgICAgICBwaGFuZGxl
ID0gPDB4MDAwMDAwNWQ+Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAg
ICAgICAgICAgcmNwbUAxZTM0MDQwIHsNCiAgICAgICAgICAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiZnNsLGxzMTAyOGEtcmNwbSIsICJmc2wscW9y
aXEtcmNwbS0yLjErIjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9
IDwweDAwMDAwMDAwIDB4MDFlMzQwNDAgMHgwMDAwMDAwMCAweDAwMDAwMDFj
PjsNCiAgICAgICAgICAgICAgICAgICAgICAgICNmc2wscmNwbS13YWtldXAt
Y2VsbHMgPSA8MHgwMDAwMDAwNz47DQogICAgICAgICAgICAgICAgICAgICAg
ICBsaXR0bGUtZW5kaWFuOw0KICAgICAgICAgICAgICAgICAgICAgICAgcGhh
bmRsZSA9IDwweDAwMDAwMDE2PjsNCiAgICAgICAgICAgICAgICB9Ow0KICAg
ICAgICAgICAgICAgIHRpbWVyQDI4MDAwMDAgew0KICAgICAgICAgICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJmc2wsbHMxMDI4YS1mdG0tYWxhcm0i
Ow0KICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4MDAwMDAwMDAg
MHgwMjgwMDAwMCAweDAwMDAwMDAwIDB4MDAwMTAwMDA+Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgZnNsLHJjcG0td2FrZXVwID0gPDB4MDAwMDAwMTYg
MHgwMDAwMDAwMCAweDAwMDAwMDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwMCAw
eDAwMDA0MDAwIDB4MDAwMDAwMDAgMHgwMDAwMDAwMD47DQogICAgICAgICAg
ICAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDB4MDAwMDAwMDAgMHgwMDAw
MDAyYyAweDAwMDAwMDA0PjsNCiAgICAgICAgICAgICAgICAgICAgICAgIHBo
YW5kbGUgPSA8MHgwMDAwMDA1ZT47DQogICAgICAgICAgICAgICAgfTsNCiAg
ICAgICAgfTsNCiAgICAgICAgbWFsaWRwQGYwODAwMDAgew0KICAgICAgICAg
ICAgICAgIHhlbixwYXNzdGhyb3VnaDsNCiAgICAgICAgICAgICAgICBjb21w
YXRpYmxlID0gImFybSxtYWxpLWRwNTAwIjsNCiAgICAgICAgICAgICAgICBy
ZWcgPSA8MHgwMDAwMDAwMCAweDBmMDgwMDAwIDB4MDAwMDAwMDAgMHgwMDAx
MDAwMD47DQogICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDwweDAwMDAw
MDAwIDB4MDAwMDAwZGUgMHgwMDAwMDAwNCAweDAwMDAwMDAwIDB4MDAwMDAw
ZGYgMHgwMDAwMDAwND47DQogICAgICAgICAgICAgICAgaW50ZXJydXB0LW5h
bWVzID0gIkRFIiwgIlNFIjsNCiAgICAgICAgICAgICAgICBjbG9ja3MgPSA8
MHgwMDAwMDAxNyAweDAwMDAwMDE4IDB4MDAwMDAwMTggMHgwMDAwMDAxOT47
DQogICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAicHhsY2xrIiwgIm1j
bGsiLCAiYWNsayIsICJwY2xrIjsNCiAgICAgICAgICAgICAgICBhcm0sbWFs
aWRwLW91dHB1dC1wb3J0LWxpbmVzID0gWzA4IDA4IDA4XTsNCiAgICAgICAg
ICAgICAgICBwaGFuZGxlID0gPDB4MDAwMDAwNWY+Ow0KICAgICAgICAgICAg
ICAgIHBvcnQgew0KICAgICAgICAgICAgICAgICAgICAgICAgZW5kcG9pbnQg
ew0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5k
cG9pbnQgPSA8MHgwMDAwMDAxYT47DQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBoYW5kbGUgPSA8MHgwMDAwMDAxYz47DQogICAgICAgICAg
ICAgICAgICAgICAgICB9Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAg
IH07DQogICAgICAgIGhkcEBmMjAwMDAwIHsNCiAgICAgICAgICAgICAgICB4
ZW4scGFzc3Rocm91Z2g7DQogICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9
ICJmc2wsbHMxMDI4YS1kcCI7DQogICAgICAgICAgICAgICAgcmVnID0gPDB4
MDAwMDAwMDAgMHgwZjIwMDAwMCAweDAwMDAwMDAwIDB4MDAwZmZmZmY+Ow0K
ICAgICAgICAgICAgICAgIGludGVycnVwdHMgPSA8MHgwMDAwMDAwMCAweDAw
MDAwMGRkIDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAgICAgIGNsb2NrcyA9
IDwweDAwMDAwMDA3IDB4MDAwMDAwMDIgMHgwMDAwMDAwMiAweDAwMDAwMDAy
IDB4MDAwMDAwMWIgMHgwMDAwMDAxYiAweDAwMDAwMDFiIDB4MDAwMDAwMWIg
MHgwMDAwMDAxYj47DQogICAgICAgICAgICAgICAgY2xvY2stbmFtZXMgPSAi
Y2xrX2lwZyIsICJjbGtfY29yZSIsICJjbGtfcHhsIiwgImNsa19weGxfbXV4
IiwgImNsa19weGxfbGluayIsICJjbGtfYXBiIiwgImNsa192aWYiOw0KICAg
ICAgICAgICAgICAgIGZzbCxub19lZGlkOw0KICAgICAgICAgICAgICAgIHJl
c29sdXRpb24gPSAiMzg0MHgyMTYwQDYwIiwgIjE5MjB4MTA4MEA2MCIsICIx
MjgweDcyMEA2MCIsICI3MjB4NDgwQDYwIjsNCiAgICAgICAgICAgICAgICBs
YW5lX21hcHBpbmcgPSA8MHgwMDAwMDA0ZT47DQogICAgICAgICAgICAgICAg
ZWRwX2xpbmtfcmF0ZSA9IDwweDAwMDAwMDA2PjsNCiAgICAgICAgICAgICAg
ICBlZHBfbnVtX2xhbmVzID0gPDB4MDAwMDAwMDQ+Ow0KICAgICAgICAgICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsNCiAgICAgICAgICAgICAgICBwaGFuZGxl
ID0gPDB4MDAwMDAwNjA+Ow0KICAgICAgICAgICAgICAgIHBvcnQgew0KICAg
ICAgICAgICAgICAgICAgICAgICAgZW5kcG9pbnQgew0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZW1vdGUtZW5kcG9pbnQgPSA8MHgwMDAw
MDAxYz47DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBoYW5k
bGUgPSA8MHgwMDAwMDAxYT47DQogICAgICAgICAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICAgICAgICAgIH07DQogICAgICAgIH07DQogICAgICAgIGVt
bWMtcHdyc2VxIHsNCiAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm1t
Yy1wd3JzZXEtc2ltcGxlIjsNCiAgICAgICAgICAgICAgICByZXNldC1ncGlv
cyA9IDwweDAwMDAwMDFkIDB4MDAwMDAwMDIgMHgwMDAwMDAwMD47DQogICAg
ICAgICAgICAgICAgcGhhbmRsZSA9IDwweDAwMDAwMDBiPjsNCiAgICAgICAg
fTsNCiAgICAgICAgYnV0dG9uczAgew0KICAgICAgICAgICAgICAgIGNvbXBh
dGlibGUgPSAiZ3Bpby1rZXlzIjsNCiAgICAgICAgICAgICAgICBwb3dlci1i
dXR0b24gew0KICAgICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0LXBh
cmVudCA9IDwweDAwMDAwMDA5PjsNCiAgICAgICAgICAgICAgICAgICAgICAg
IGludGVycnVwdHMgPSA8MHgwMDAwMDAwNCAweDAwMDAwMDAwPjsNCiAgICAg
ICAgICAgICAgICAgICAgICAgIGxpbnV4LGNvZGUgPSA8MHgwMDAwMDA3ND47
DQogICAgICAgICAgICAgICAgICAgICAgICBsYWJlbCA9ICJQb3dlciI7DQog
ICAgICAgICAgICAgICAgICAgICAgICB3YWtldXAtc291cmNlOw0KICAgICAg
ICAgICAgICAgIH07DQogICAgICAgICAgICAgICAgc2xlZXAtYnV0dG9uIHsN
CiAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8
MHgwMDAwMDAwOT47DQogICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1
cHRzID0gPDB4MDAwMDAwMDUgMHgwMDAwMDAwMD47DQogICAgICAgICAgICAg
ICAgICAgICAgICBsaW51eCxjb2RlID0gPDB4MDAwMDAwOGU+Ow0KICAgICAg
ICAgICAgICAgICAgICAgICAgbGFiZWwgPSAiU2xlZXAiOw0KICAgICAgICAg
ICAgICAgICAgICAgICAgd2FrZXVwLXNvdXJjZTsNCiAgICAgICAgICAgICAg
ICB9Ow0KICAgICAgICB9Ow0KICAgICAgICBidXR0b25zMSB7DQogICAgICAg
ICAgICAgICAgY29tcGF0aWJsZSA9ICJncGlvLWtleXMtcG9sbGVkIjsNCiAg
ICAgICAgICAgICAgICBwb2xsLWludGVydmFsID0gPDB4MDAwMDAwYzg+Ow0K
ICAgICAgICAgICAgICAgIGxpZF9zd2l0Y2ggew0KICAgICAgICAgICAgICAg
ICAgICAgICAgbGludXgsaW5wdXQtdHlwZSA9IDwweDAwMDAwMDA1PjsNCiAg
ICAgICAgICAgICAgICAgICAgICAgIGxpbnV4LGNvZGUgPSA8MHgwMDAwMDAw
MD47DQogICAgICAgICAgICAgICAgICAgICAgICBncGlvcyA9IDwweDAwMDAw
MDFlIDB4MDAwMDAwMDQgMHgwMDAwMDAwMT47DQogICAgICAgICAgICAgICAg
ICAgICAgICBsYWJlbCA9ICJMaWQiOw0KICAgICAgICAgICAgICAgICAgICAg
ICAgcGhhbmRsZSA9IDwweDAwMDAwMDYxPjsNCiAgICAgICAgICAgICAgICB9
Ow0KICAgICAgICB9Ow0KICAgICAgICBjaGFyZ2VyIHsNCiAgICAgICAgICAg
ICAgICBjb21wYXRpYmxlID0gImdwaW8tY2hhcmdlciI7DQogICAgICAgICAg
ICAgICAgY2hhcmdlci10eXBlID0gImJhdHRlcnkiOw0KICAgICAgICAgICAg
ICAgIGdwaW9zID0gPDB4MDAwMDAwMWUgMHgwMDAwMDAwNiAweDAwMDAwMDAx
PjsNCiAgICAgICAgICAgICAgICBjaGFyZ2luZy1ncGlvID0gPDB4MDAwMDAw
MWUgMHgwMDAwMDAwNSAweDAwMDAwMDAxPjsNCiAgICAgICAgICAgICAgICBi
YXQtbG93LWdwaW8gPSA8MHgwMDAwMDAxZSAweDAwMDAwMDAzIDB4MDAwMDAw
MDE+Ow0KICAgICAgICB9Ow0KICAgICAgICBfX3N5bWJvbHNfXyB7DQogICAg
ICAgICAgICAgICAgY3B1MCA9ICIvY3B1cy9jcHVAMCI7DQogICAgICAgICAg
ICAgICAgY3B1MSA9ICIvY3B1cy9jcHVAMSI7DQogICAgICAgICAgICAgICAg
bDIgPSAiL2NwdXMvbDItY2FjaGUiOw0KICAgICAgICAgICAgICAgIENQVV9Q
VzIwID0gIi9pZGxlLXN0YXRlcy9jcHUtcHcyMCI7DQogICAgICAgICAgICAg
ICAgc3lzY2xrID0gIi9jbG9jay1zeXNjbGsiOw0KICAgICAgICAgICAgICAg
IG9zY18yN20gPSAiL2Nsb2NrLW9zYy0yN20iOw0KICAgICAgICAgICAgICAg
IGRwY2xrID0gIi9jbG9jay1kaXNwbGF5QGYxZjAwMDAiOw0KICAgICAgICAg
ICAgICAgIGFjbGsgPSAiL2Nsb2NrLWF4aSI7DQogICAgICAgICAgICAgICAg
cGNsayA9ICIvY2xvY2stYXBiIjsNCiAgICAgICAgICAgICAgICBoZHBjbGsg
PSAiL2Nsb2NrLWhkcGNvcmUiOw0KICAgICAgICAgICAgICAgIGdpYyA9ICIv
aW50ZXJydXB0LWNvbnRyb2xsZXJANjAwMDAwMCI7DQogICAgICAgICAgICAg
ICAgaXRzID0gIi9pbnRlcnJ1cHQtY29udHJvbGxlckA2MDAwMDAwL2dpYy1p
dHNANjAyMDAwMCI7DQogICAgICAgICAgICAgICAgc29jID0gIi9zb2MiOw0K
ICAgICAgICAgICAgICAgIGRkciA9ICIvc29jL21lbW9yeS1jb250cm9sbGVy
QDEwODAwMDAiOw0KICAgICAgICAgICAgICAgIGRjZmcgPSAiL3NvYy9zeXNj
b25AMWUwMDAwMCI7DQogICAgICAgICAgICAgICAgcnN0ID0gIi9zb2Mvc3lz
Y29uQDFlNjAwMDAiOw0KICAgICAgICAgICAgICAgIHNjZmcgPSAiL3NvYy9z
eXNjb25AMWZjMDAwMCI7DQogICAgICAgICAgICAgICAgY2xvY2tnZW4gPSAi
L3NvYy9jbG9jay1jb250cm9sbGVyQDEzMDAwMDAiOw0KICAgICAgICAgICAg
ICAgIHVzYjAgPSAiL3NvYy91c2JAMzEwMDAwMCI7DQogICAgICAgICAgICAg
ICAgdXNiMSA9ICIvc29jL3VzYkAzMTEwMDAwIjsNCiAgICAgICAgICAgICAg
ICBmc3BpID0gIi9zb2Mvc3BpQDIwYzAwMDAiOw0KICAgICAgICAgICAgICAg
IGkyYzAgPSAiL3NvYy9pMmNAMjAwMDAwMCI7DQogICAgICAgICAgICAgICAg
c2wyOGNwbGQgPSAiL3NvYy9pMmNAMjAwMDAwMC9zbDI4Y3BsZEA0YSI7DQog
ICAgICAgICAgICAgICAgcHdtMCA9ICIvc29jL2kyY0AyMDAwMDAwL3NsMjhj
cGxkQDRhL3B3bTBAYyI7DQogICAgICAgICAgICAgICAgcHdtMSA9ICIvc29j
L2kyY0AyMDAwMDAwL3NsMjhjcGxkQDRhL3B3bTFAZSI7DQogICAgICAgICAg
ICAgICAgY3BsZF9ncGlvMCA9ICIvc29jL2kyY0AyMDAwMDAwL3NsMjhjcGxk
QDRhL2dwaW8wQDEwIjsNCiAgICAgICAgICAgICAgICBjcGxkX2dwaW8xID0g
Ii9zb2MvaTJjQDIwMDAwMDAvc2wyOGNwbGRANGEvZ3BpbzFAMTUiOw0KICAg
ICAgICAgICAgICAgIGNwbGRfZ3BvMCA9ICIvc29jL2kyY0AyMDAwMDAwL3Ns
MjhjcGxkQDRhL2dwbzBAMWEiOw0KICAgICAgICAgICAgICAgIGNwbGRfZ3Bp
MCA9ICIvc29jL2kyY0AyMDAwMDAwL3NsMjhjcGxkQDRhL2dwaTBAMWIiOw0K
ICAgICAgICAgICAgICAgIGkyYzEgPSAiL3NvYy9pMmNAMjAxMDAwMCI7DQog
ICAgICAgICAgICAgICAgaTJjMiA9ICIvc29jL2kyY0AyMDIwMDAwIjsNCiAg
ICAgICAgICAgICAgICBpMmMzID0gIi9zb2MvaTJjQDIwMzAwMDAiOw0KICAg
ICAgICAgICAgICAgIGkyYzQgPSAiL3NvYy9pMmNAMjA0MDAwMCI7DQogICAg
ICAgICAgICAgICAgaTJjNSA9ICIvc29jL2kyY0AyMDUwMDAwIjsNCiAgICAg
ICAgICAgICAgICBpMmM2ID0gIi9zb2MvaTJjQDIwNjAwMDAiOw0KICAgICAg
ICAgICAgICAgIGkyYzcgPSAiL3NvYy9pMmNAMjA3MDAwMCI7DQogICAgICAg
ICAgICAgICAgZHNwaTAgPSAiL3NvYy9zcGlAMjEwMDAwMCI7DQogICAgICAg
ICAgICAgICAgZHNwaTEgPSAiL3NvYy9zcGlAMjExMDAwMCI7DQogICAgICAg
ICAgICAgICAgZHNwaTIgPSAiL3NvYy9zcGlAMjEyMDAwMCI7DQogICAgICAg
ICAgICAgICAgY2FuMCA9ICIvc29jL2NhbkAyMTgwMDAwIjsNCiAgICAgICAg
ICAgICAgICBjYW4xID0gIi9zb2MvY2FuQDIxOTAwMDAiOw0KICAgICAgICAg
ICAgICAgIGR1YXJ0MCA9ICIvc29jL3NlcmlhbEAyMWMwNTAwIjsNCiAgICAg
ICAgICAgICAgICBkdWFydDEgPSAiL3NvYy9zZXJpYWxAMjFjMDYwMCI7DQog
ICAgICAgICAgICAgICAgbHB1YXJ0MCA9ICIvc29jL3NlcmlhbEAyMjYwMDAw
IjsNCiAgICAgICAgICAgICAgICBscHVhcnQxID0gIi9zb2Mvc2VyaWFsQDIy
NzAwMDAiOw0KICAgICAgICAgICAgICAgIGxwdWFydDIgPSAiL3NvYy9zZXJp
YWxAMjI4MDAwMCI7DQogICAgICAgICAgICAgICAgbHB1YXJ0MyA9ICIvc29j
L3NlcmlhbEAyMjkwMDAwIjsNCiAgICAgICAgICAgICAgICBscHVhcnQ0ID0g
Ii9zb2Mvc2VyaWFsQDIyYTAwMDAiOw0KICAgICAgICAgICAgICAgIGxwdWFy
dDUgPSAiL3NvYy9zZXJpYWxAMjJiMDAwMCI7DQogICAgICAgICAgICAgICAg
ZWRtYTAgPSAiL3NvYy9kbWEtY29udHJvbGxlckAyMmMwMDAwIjsNCiAgICAg
ICAgICAgICAgICBncGlvMSA9ICIvc29jL2dwaW9AMjMwMDAwMCI7DQogICAg
ICAgICAgICAgICAgZ3BpbzIgPSAiL3NvYy9ncGlvQDIzMTAwMDAiOw0KICAg
ICAgICAgICAgICAgIGdwaW8zID0gIi9zb2MvZ3Bpb0AyMzIwMDAwIjsNCiAg
ICAgICAgICAgICAgICBjcnlwdG8gPSAiL3NvYy9jcnlwdG9AODAwMDAwMCI7
DQogICAgICAgICAgICAgICAgc2VjX2pyMCA9ICIvc29jL2NyeXB0b0A4MDAw
MDAwL2pyQDEwMDAwIjsNCiAgICAgICAgICAgICAgICBzZWNfanIxID0gIi9z
b2MvY3J5cHRvQDgwMDAwMDAvanJAMjAwMDAiOw0KICAgICAgICAgICAgICAg
IHNlY19qcjIgPSAiL3NvYy9jcnlwdG9AODAwMDAwMC9qckAzMDAwMCI7DQog
ICAgICAgICAgICAgICAgc2VjX2pyMyA9ICIvc29jL2NyeXB0b0A4MDAwMDAw
L2pyQDQwMDAwIjsNCiAgICAgICAgICAgICAgICBjbHVzdGVyMV9jb3JlMF93
YXRjaGRvZyA9ICIvc29jL3dkdEBjMDAwMDAwIjsNCiAgICAgICAgICAgICAg
ICBjbHVzdGVyMV9jb3JlMV93YXRjaGRvZyA9ICIvc29jL3dkdEBjMDEwMDAw
IjsNCiAgICAgICAgICAgICAgICBlc2RoYyA9ICIvc29jL21tY0AyMTQwMDAw
IjsNCiAgICAgICAgICAgICAgICBlc2RoYzEgPSAiL3NvYy9tbWNAMjE1MDAw
MCI7DQogICAgICAgICAgICAgICAgc2F0YSA9ICIvc29jL3NhdGFAMzIwMDAw
MCI7DQogICAgICAgICAgICAgICAgZW5ldGNfcG9ydDAgPSAiL3NvYy9wY2ll
QDFmMDAwMDAwMC9ldGhlcm5ldEAwLDAiOw0KICAgICAgICAgICAgICAgIGVu
ZXRjX3BvcnQxID0gIi9zb2MvcGNpZUAxZjAwMDAwMDAvZXRoZXJuZXRAMCwx
IjsNCiAgICAgICAgICAgICAgICBlbmV0Y19wb3J0MiA9ICIvc29jL3BjaWVA
MWYwMDAwMDAwL2V0aGVybmV0QDAsMiI7DQogICAgICAgICAgICAgICAgZW5l
dGNfbWRpb19wZjMgPSAiL3NvYy9wY2llQDFmMDAwMDAwMC9tZGlvQDAsMyI7
DQogICAgICAgICAgICAgICAgcGh5MCA9ICIvc29jL3BjaWVAMWYwMDAwMDAw
L21kaW9AMCwzL2V0aGVybmV0LXBoeUA1IjsNCiAgICAgICAgICAgICAgICBw
aHkxID0gIi9zb2MvcGNpZUAxZjAwMDAwMDAvbWRpb0AwLDMvZXRoZXJuZXQt
cGh5QDQiOw0KICAgICAgICAgICAgICAgIHN3aXRjaF9wb3J0MCA9ICIvc29j
L3BjaWVAMWYwMDAwMDAwL3N3aXRjaEAwLDUvcG9ydHMvcG9ydEAwIjsNCiAg
ICAgICAgICAgICAgICBzd2l0Y2hfcG9ydDEgPSAiL3NvYy9wY2llQDFmMDAw
MDAwMC9zd2l0Y2hAMCw1L3BvcnRzL3BvcnRAMSI7DQogICAgICAgICAgICAg
ICAgc3dpdGNoX3BvcnQyID0gIi9zb2MvcGNpZUAxZjAwMDAwMDAvc3dpdGNo
QDAsNS9wb3J0cy9wb3J0QDIiOw0KICAgICAgICAgICAgICAgIHN3aXRjaF9w
b3J0MyA9ICIvc29jL3BjaWVAMWYwMDAwMDAwL3N3aXRjaEAwLDUvcG9ydHMv
cG9ydEAzIjsNCiAgICAgICAgICAgICAgICBzd2l0Y2hfcG9ydDQgPSAiL3Nv
Yy9wY2llQDFmMDAwMDAwMC9zd2l0Y2hAMCw1L3BvcnRzL3BvcnRANCI7DQog
ICAgICAgICAgICAgICAgc3dpdGNoX3BvcnQ1ID0gIi9zb2MvcGNpZUAxZjAw
MDAwMDAvc3dpdGNoQDAsNS9wb3J0cy9wb3J0QDUiOw0KICAgICAgICAgICAg
ICAgIGVuZXRjX3BvcnQzID0gIi9zb2MvcGNpZUAxZjAwMDAwMDAvZXRoZXJu
ZXRAMCw2IjsNCiAgICAgICAgICAgICAgICB0bXUgPSAiL3NvYy90bXVAMWYw
MDAwMCI7DQogICAgICAgICAgICAgICAgY29yZV9jbHVzdGVyX2FsZXJ0ID0g
Ii9zb2MvdGhlcm1hbC16b25lcy9jb3JlLWNsdXN0ZXIvdHJpcHMvY29yZS1j
bHVzdGVyLWFsZXJ0IjsNCiAgICAgICAgICAgICAgICBjb3JlX2NsdXN0ZXJf
Y3JpdCA9ICIvc29jL3RoZXJtYWwtem9uZXMvY29yZS1jbHVzdGVyL3RyaXBz
L2NvcmUtY2x1c3Rlci1jcml0IjsNCiAgICAgICAgICAgICAgICBkZHJfY29u
dHJvbGxlcl9hbGVydCA9ICIvc29jL3RoZXJtYWwtem9uZXMvZGRyLWNvbnRy
b2xsZXIvdHJpcHMvZGRyLWNvbnRyb2xsZXItYWxlcnQiOw0KICAgICAgICAg
ICAgICAgIGRkcl9jb250cm9sbGVyX2NyaXQgPSAiL3NvYy90aGVybWFsLXpv
bmVzL2Rkci1jb250cm9sbGVyL3RyaXBzL2Rkci1jb250cm9sbGVyLWNyaXQi
Ow0KICAgICAgICAgICAgICAgIHNtbXUgPSAiL3NvYy9pb21tdUA1MDAwMDAw
IjsNCiAgICAgICAgICAgICAgICBxZG1hID0gIi9zb2MvZG1hLWNvbnRyb2xs
ZXJAODM4MDAwMCI7DQogICAgICAgICAgICAgICAgc2FpMSA9ICIvc29jL2F1
ZGlvLWNvbnRyb2xsZXJAZjEwMDAwMCI7DQogICAgICAgICAgICAgICAgc2Fp
MiA9ICIvc29jL2F1ZGlvLWNvbnRyb2xsZXJAZjExMDAwMCI7DQogICAgICAg
ICAgICAgICAgc2FpMyA9ICIvc29jL2F1ZGlvLWNvbnRyb2xsZXJAZjEyMDAw
MCI7DQogICAgICAgICAgICAgICAgc2FpNCA9ICIvc29jL2F1ZGlvLWNvbnRy
b2xsZXJAZjEzMDAwMCI7DQogICAgICAgICAgICAgICAgc2FpNSA9ICIvc29j
L2F1ZGlvLWNvbnRyb2xsZXJAZjE0MDAwMCI7DQogICAgICAgICAgICAgICAg
c2FpNiA9ICIvc29jL2F1ZGlvLWNvbnRyb2xsZXJAZjE1MDAwMCI7DQogICAg
ICAgICAgICAgICAgcmNwbSA9ICIvc29jL3JjcG1AMWUzNDA0MCI7DQogICAg
ICAgICAgICAgICAgZnRtX2FsYXJtMCA9ICIvc29jL3RpbWVyQDI4MDAwMDAi
Ow0KICAgICAgICAgICAgICAgIGRpc3BsYXkwID0gIi9tYWxpZHBAZjA4MDAw
MCI7DQogICAgICAgICAgICAgICAgZHAwX291dCA9ICIvbWFsaWRwQGYwODAw
MDAvcG9ydC9lbmRwb2ludCI7DQogICAgICAgICAgICAgICAgZGlzcGxheTEg
PSAiL2hkcEBmMjAwMDAwIjsNCiAgICAgICAgICAgICAgICBkcDFfb3V0ID0g
Ii9oZHBAZjIwMDAwMC9wb3J0L2VuZHBvaW50IjsNCiAgICAgICAgICAgICAg
ICBlbW1jX3B3cnNlcSA9ICIvZW1tYy1wd3JzZXEiOw0KICAgICAgICAgICAg
ICAgIGxpZF9zdyA9ICIvYnV0dG9uczEvbGlkX3N3aXRjaCI7DQogICAgICAg
IH07DQp9Ow0K

--8323329-2110900997-1605656680=:438--

