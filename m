Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8797281CDE
	for <lists+xen-devel@lfdr.de>; Fri,  2 Oct 2020 22:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2327.6926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kORYf-0000IA-J0; Fri, 02 Oct 2020 20:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2327.6926; Fri, 02 Oct 2020 20:21:37 +0000
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
	id 1kORYf-0000Hl-G2; Fri, 02 Oct 2020 20:21:37 +0000
Received: by outflank-mailman (input) for mailman id 2327;
 Fri, 02 Oct 2020 20:21:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WIB7=DJ=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
 id 1kORYe-0000Hg-7R
 for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 20:21:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (unknown
 [40.107.93.50]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cd7c432c-5f8c-478f-8752-89fef17bc8c9;
 Fri, 02 Oct 2020 20:21:34 +0000 (UTC)
Received: from SN2PR01CA0047.prod.exchangelabs.com (2603:10b6:800::15) by
 MN2PR02MB6704.namprd02.prod.outlook.com (2603:10b6:208:1d6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Fri, 2 Oct 2020 20:21:32 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::23) by SN2PR01CA0047.outlook.office365.com
 (2603:10b6:800::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 20:21:32 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with Microsoft SMTP
 Server id 15.20.3412.21 via Frontend Transport; Fri, 2 Oct 2020 20:21:31
 +0000
Received: from [149.199.38.66] (port=57914 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1kORY6-00067A-3g; Fri, 02 Oct 2020 13:21:02 -0700
Received: from [127.0.0.1] (helo=localhost)
 by smtp.xilinx.com with smtp (Exim 4.63)
 (envelope-from <stefano.stabellini@xilinx.com>)
 id 1kORYZ-0008Sq-97; Fri, 02 Oct 2020 13:21:31 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 092KLPNw003319; 
 Fri, 2 Oct 2020 13:21:26 -0700
Received: from [10.23.123.31] (helo=localhost)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <stefanos@xilinx.com>)
 id 1kORYT-0008SG-R0; Fri, 02 Oct 2020 13:21:25 -0700
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WIB7=DJ=xilinx.com=stefanos@srs-us1.protection.inumbo.net>)
	id 1kORYe-0000Hg-7R
	for xen-devel@lists.xenproject.org; Fri, 02 Oct 2020 20:21:36 +0000
X-Inumbo-ID: cd7c432c-5f8c-478f-8752-89fef17bc8c9
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (unknown [40.107.93.50])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id cd7c432c-5f8c-478f-8752-89fef17bc8c9;
	Fri, 02 Oct 2020 20:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZOZ9C0uzv7vemfT0tAlbIYPqmCxa5zYSQG2pY0cdAkoCx715LErsisi+UJh256chVRvtOAxpAbKpRj8E4C4HhXSdCXJHWo2kYz/qV2ZlRDC+XTqagGjJL0MgxmE8yS2oEj2cACZPZuunraj4oOlOcu8zofeDk+HD9FBRsR+QpbywcppfnwpYed8Ed6aB96m0Feo1FWp5DQwvTCi4+a8gxqd2bep736t6SFSV03B1fqRW1406kX3b1KjLw8WGal5XFceR30OcrLHLPN56/b6GgnTdKu+gGJf1UEKAMhWzpxiYQagPkwcLY+V3H3Aj4MXstziwKszYy4i9w/PsMyfBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1sKfjfl6E0C1MGRjLxW/Z7cSOfeqva3SvzEf9ONgak=;
 b=Hu5/wln1emNdkIv6dZeGB8NgW7baZojPzkqUXGGmiI7xrFkH+1oK0G/l4aVYRqPBDNcZ6kjkB7lh7SRe8ph1THx23dRIPQl98Iw4t40MpiQJbc8w3OfD2++BTA+1a9jIJje81MVN7nRxrLHVAzDyVeC+6/XhPH8pEiLgP8qhLmTis8ay2M9ufbNsrInX8gpFNNoGjLmQJa5aYOMUXYvf8LPlgIwu5FXVFC9JNxJMet4YsOLEQlhxLSDdtbrW0vpbStc6w6EbGwWx0QFT0ArNack4Q5T7iftx1UHsUm9+8XBmrcY3KCk13UKEVFuWMWyxfcwSUYqfBcA86xkJ7aladw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.linux-foundation.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1sKfjfl6E0C1MGRjLxW/Z7cSOfeqva3SvzEf9ONgak=;
 b=iZR3Dod7hFtywYjczyK2oph4wZxyuH2pmAGz7nMkxqbB7dCDxOvSVslpVtYiY76SeTVYnynsq/3lJgBmeOBGtvbrz90IpDvCO5o5RvqlE1DOrYn4MruFpe03V15HjGJPAJnToqPDuebhjcNVF1DJpJeDVGCoDv9Re7VmqPTDaAo=
Received: from SN2PR01CA0047.prod.exchangelabs.com (2603:10b6:800::15) by
 MN2PR02MB6704.namprd02.prod.outlook.com (2603:10b6:208:1d6::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.32; Fri, 2 Oct 2020 20:21:32 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:800:0:cafe::23) by SN2PR01CA0047.outlook.office365.com
 (2603:10b6:800::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.32 via Frontend
 Transport; Fri, 2 Oct 2020 20:21:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.linux-foundation.org; dkim=none (message not
 signed) header.d=none;lists.linux-foundation.org; dmarc=bestguesspass
 action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with Microsoft SMTP
 Server id 15.20.3412.21 via Frontend Transport; Fri, 2 Oct 2020 20:21:31
 +0000
Received: from [149.199.38.66] (port=57914 helo=smtp.xilinx.com)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <stefano.stabellini@xilinx.com>)
	id 1kORY6-00067A-3g; Fri, 02 Oct 2020 13:21:02 -0700
Received: from [127.0.0.1] (helo=localhost)
	by smtp.xilinx.com with smtp (Exim 4.63)
	(envelope-from <stefano.stabellini@xilinx.com>)
	id 1kORYZ-0008Sq-97; Fri, 02 Oct 2020 13:21:31 -0700
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 092KLPNw003319;
	Fri, 2 Oct 2020 13:21:26 -0700
Received: from [10.23.123.31] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <stefanos@xilinx.com>)
	id 1kORYT-0008SG-R0; Fri, 02 Oct 2020 13:21:25 -0700
Date: Fri, 2 Oct 2020 13:21:25 -0700 (PDT)
From: Stefano Stabellini <stefano.stabellini@xilinx.com>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Christoph Hellwig <hch@lst.de>
cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
        Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
        xen-devel@lists.xenproject.org, iommu@lists.linux-foundation.org
Subject: Re: xen-swiotlb vs phys_to_dma
In-Reply-To: <20201002123436.GA30329@lst.de>
Message-ID: <alpine.DEB.2.21.2010021313010.10908@sstabellini-ThinkPad-T480s>
References: <20201002123436.GA30329@lst.de>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7ce0efb-933a-43af-1ebe-08d86710c043
X-MS-TrafficTypeDiagnostic: MN2PR02MB6704:
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB6704143E24A1D6CCD5D1B9C2A0310@MN2PR02MB6704.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	r1zBRk3209SYXRmyDcyzGa4vWfwiztIJnO2AAvN03JioxKopFBHwp8SCr8Ac6UNygK5a2OPAbIDrvB5fteZUMQ+XCajwu4bptHTEZ57XAy4s2efXyHDLNv44B3llFLCvVrYtrc6N+jJbAXdudO7gRmCfvM1ndcKSj/PDp3JXYYhRSiOTTDo2jpNVxfDTzen8G+Lzf27Y3dx9dY1vHgg91rlH3s0IJ7O1PkSRL7PVdvhiKCHJ/C6ndIwCIihtZveH6RDQf2/uvu3LtsF/vtUoYlxe4Cb1akJSRnavhvJAFyso9FbJNBhbZSduLRoD+aAq2hb4DE8aYvg/ZOjzOnTYQCO82DYVRZowNvxlo8BLa0OOn07Zt2sApvrm6w+3eI0lsCUuH/exGMQCZqvagU07TbBDLr31aM/JIV6CUUpzZmEQTzvZGFX1ELkiNfGCi4Jc2+zEJfYEaRcuFEqGSXGf0ZyQ6xJhVef5Y/P/vvGFv5pGBG/Y61xZ3mPd1mFRcNvM
X-Forefront-Antispam-Report:
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFS:(7916004)(396003)(39860400002)(376002)(136003)(346002)(46966005)(2906002)(8676002)(9786002)(70586007)(70206006)(82310400003)(6916009)(47076004)(4326008)(316002)(8936002)(9686003)(54906003)(426003)(26005)(44832011)(83380400001)(336012)(966005)(33716001)(83080400001)(186003)(81166007)(356005)(82740400003)(5660300002)(478600001)(6606295002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2020 20:21:31.5637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7ce0efb-933a-43af-1ebe-08d86710c043
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6704

On Fri, 2 Oct 2020, Christoph Hellwig wrote:
> Hi Stefano,
> 
> I've looked over xen-swiotlb in linux-next, that is with your recent
> changes to take dma offsets into account.  One thing that puzzles me
> is that xen_swiotlb_map_page passes virt_to_phys(xen_io_tlb_start) as
> the tbl_dma_addr argument to swiotlb_tbl_map_single, despite the fact
> that the argument is a dma_addr_t and both other callers translate
> from a physical to the dma address.  Was this an oversight?

Hi Christoph,

It was not an oversight, it was done on purpose, although maybe I could
have been wrong. There was a brief discussion on this topic here: 

https://marc.info/?l=linux-kernel&m=159011972107683&w=2
https://marc.info/?l=linux-kernel&m=159018047129198&w=2

I'll repeat and summarize here for convenience. 

swiotlb_init_with_tbl is called by xen_swiotlb_init, passing a virtual
address (xen_io_tlb_start), which gets converted to phys and stored in
io_tlb_start as a physical address at the beginning of swiotlb_init_with_tbl.

Afterwards, xen_swiotlb_map_page calls swiotlb_tbl_map_single. The
second parameter, dma_addr_t tbl_dma_addr, is used to calculate the
right slot in the swiotlb buffer to use, comparing it against
io_tlb_start.

Thus, I think it makes sense for xen_swiotlb_map_page to call
swiotlb_tbl_map_single passing an address meant to be compared with
io_tlb_start, which is __pa(xen_io_tlb_start), so
virt_to_phys(xen_io_tlb_start) seems to be what we want.

However, you are right that it is strange that tbl_dma_addr is a
dma_addr_t, and maybe it shouldn't be? Maybe the tbl_dma_addr parameter
to swiotlb_tbl_map_single should be a phys address instead?
Or it could be swiotlb_init_with_tbl to be wrong and it should take a
dma address to initialize the swiotlb buffer.

