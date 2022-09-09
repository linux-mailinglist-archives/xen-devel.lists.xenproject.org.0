Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D71085B409F
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 22:26:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404524.647021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWkZQ-00026P-H7; Fri, 09 Sep 2022 20:25:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404524.647021; Fri, 09 Sep 2022 20:25:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWkZQ-00024a-E2; Fri, 09 Sep 2022 20:25:48 +0000
Received: by outflank-mailman (input) for mailman id 404524;
 Fri, 09 Sep 2022 20:25:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mxBE=ZM=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oWkZO-000248-0R
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 20:25:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2043.outbound.protection.outlook.com [40.107.223.43])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940740d4-307d-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 22:25:43 +0200 (CEST)
Received: from MWH0EPF00056D03.namprd21.prod.outlook.com
 (2603:10b6:30f:fff2:0:1:0:d) by MN0PR12MB5905.namprd12.prod.outlook.com
 (2603:10b6:208:379::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Fri, 9 Sep
 2022 20:25:39 +0000
Received: from CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::206) by MWH0EPF00056D03.outlook.office365.com
 (2603:1036:d20::b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.6 via Frontend
 Transport; Fri, 9 Sep 2022 20:25:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT095.mail.protection.outlook.com (10.13.174.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Fri, 9 Sep 2022 20:25:38 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 15:25:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 9 Sep
 2022 13:25:37 -0700
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 9 Sep 2022 15:25:36 -0500
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
X-Inumbo-ID: 940740d4-307d-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z0Wqqmo/JP5u1RHPk8GU+0kL140C0xicjygWj8LsQ2lhZcwWpAsP30lz385au+nbhkgWpVmu6x7SjhGrDUMIYgB5KEixN+2dRfkqJUgQjYIbJyOnfDSHPXBOIulJtalFFKZg2VLn2vcZJfHJQpHR0nqsIzJEHVN1vIQAR9jfS+thCvCTzpz+yvvSL9clsweZ/F75J/pwV6a/L7oFkCVGPkG5zp+dIoSJLSZnp9seIKw1q8JaqagijVSlSnoHAmJsOFPR8R0Y8FSTgTZm8BfAh7KVuU96OQh32C6nGi5Z7ieh+DLrYnytNni5CKt2cHG4XDAloxfgnANfdpMUXhmXCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mroN2LYISOz1p+YklRyyQtahsx+nKrF2HvLfBkIooS0=;
 b=LtZMlBA9FI3MmfJG6Oet78npGnhjYX5sV7M2FqAwVdRnYyEW2vpqM01NTaR8VAlut1BDao96bgbvrOMT4cvqww3xcv6HrEak66mb9lXTW/aHZlNl0+PHk0bnPUpN9w8qsrT9uqaMfJVQ1W7KPR9AqDtgr2l94tSOSKBZITD8HkTDUcmbMDELQ1dAkFLJP2iQhUMwyIwpO6f2SldgmdK2RU+YkJsXJR3Ap3DnAc1YdBaKmnAY5RLf1BMg+oQLVW2BiCdLpHktC0mG5poGp7a+dirgqqH2NsCl7n/HIKYthRHtdd5TFLI6ZiTFfv1yvcrbA46AIcxjY82pGouqSg2Plg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mroN2LYISOz1p+YklRyyQtahsx+nKrF2HvLfBkIooS0=;
 b=htHGj4JUZo2d7onnkZBhQ92oeSkZpgoz0QtazFBOp63GsSqSf15JD54YBg/pV0pecaxiqaymAJhwr0Q+1DRnmtlksXfbteLhU7ZbBhWPeiaQ0Yu2RjGy/yQopZ+9Oi7MQzVnmCHlin0rKdfow9koE0uyNRvDw0NGGdcPscpYDYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Fri, 9 Sep 2022 13:25:35 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>,
	<JESHWANTHKUMAR.NK@amd.com>, <Devaraj.Rangasamy@amd.com>,
	<Mythri.Pandeshwarakrishna@amd.com>, <SivaSangeetha.SK@amd.com>,
	<Rijo-john.Thomas@amd.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop> <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT095:EE_|MN0PR12MB5905:EE_
X-MS-Office365-Filtering-Correlation-Id: a8a6c574-f754-44b0-7a74-08da92a175aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xc270pNgzrfJGhWPV4w2xYamiqMcEi81jueRl3z2YzF6hb/UTdwdwlOAeGTPEjPcBFvYL84HJ+4TcY3shCgzTVOpT8DvB4jwOUP5pKnOi0Jgn8EwKjpi74h31N9/wwVtihuheGKi88bvXs/gBpdM1BqaymLY6PSw4O5FR8pAV+u6+KRq3QI4uCyerd5T99zIQDbRLNjOtuzcv7l0eziyFeHGjspykp94dNKNG4EOtAtPeib3sa8bj8GMoqo1nBPa00uM8etGy1Lu7rcx6WIMBaREPKf9WPdVkcRf/g9zbtfI6cqkaXRnIoRCuGENZL2jiapXw/MEge8G0yFmSh78mb6aWSAk8EcCD0/Hu9hZRIVcXkwSvr3x1RbYt13yP/UVJpy5iLd1e2nESzP2IXmMnw7+OOuMiwtR3HdKWrNprGuRoaYVZEnAxPelB4fOB6R7bWYbhgZZ/rPSqXCeV7lfbgtqaC2P9FDJrSTxXECZGx3EFAqmGtU1s37X7p0+AHtY2sjsOsMVKFka17m4SG5m85c6c//mESWvFCscKR/Tj0EdAsLKjOg5KsLWX+ChOBlAeZqhGcUEd/svzABPueZNy4YTpuIDiqPm/4LNPwU2pDnTWaDFLys3azDdu2lEkiH/5KlHbxhG1WvDfbTzgnhrMCMuINZIF+/X6yen+do1RRqVca1Zt86dXb3REon6eKZB1fSM6ehT00W2gYE1zFPilaVvspMuGWoBCq2NHp5Q9o6ih8YvO+wZwYnFB5EEv8W3vZqi8mlg9zrUA0r9zYjyGePf+cMtk6K8u8A8NGl3srM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(7916004)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(40470700004)(8936002)(9686003)(336012)(40460700003)(5660300002)(41300700001)(478600001)(4326008)(86362001)(53546011)(82310400005)(316002)(8676002)(36860700001)(44832011)(33716001)(2906002)(26005)(81166007)(40480700001)(356005)(426003)(82740400003)(70206006)(47076005)(83380400001)(70586007)(186003)(54906003)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 20:25:38.5968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8a6c574-f754-44b0-7a74-08da92a175aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT095.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5905

On Fri, 9 Sep 2022, Juergen Gross wrote:
> On 09.09.22 04:11, Stefano Stabellini wrote:
> > Adding more people in CC
> > 
> > On Thu, 8 Sep 2022, Stefano Stabellini wrote:
> > > Hi Juergen,
> > > 
> > > A colleague is seeing a failure on x86 in Linux Dom0. The failure is
> > > pin_user_pages_fast with addresses that correspond to foreign memory
> > > pages:
> > > 
> > > - QEMU maps a domU address using dma_memory_map (xen_map_cache)
> > > - QEMU calls an IOCTL to the TEE subsystem with the Virtual Address
> > >    returned by dma_memory_map
> > > - Linux tee_shm_register->pin_user_pages_fast Returns -14 -
> > > drivers/tee/tee_shm.c
> > > 
> > > Once upon a time it used to be the case that get_user_pages_fast would
> > > fail on Xen because we didn't have a struct page corresponding to
> > > foreign memory mappings. But that hasn't been the case for years now.
> > > 
> > > Any other ideas why it would fail?
> 
> I think we can expect that access_ok() isn't failing.
> 
> I assume the mapping was done allowing writes (sorry for paranoia mode)?
 
I was told it was verified: QEMU could read and write to the VA returned
by dma_memory_map. From /proc/<qemu-pid>/maps, the VA assigned after the
mapping is pointing to /dev/xen/privcmd.


> Other than that I'm not having enough memory management skills. It might be
> related to mmap()-ed foreign pages having _PAGE_SPECIAL set, though.

Do we still set PAGE_SPECIAL for foreign mapped pages? It looks like it
is not there anymore? If PAGE_SPECIAL is not there, then they really
should look like regular pages?

