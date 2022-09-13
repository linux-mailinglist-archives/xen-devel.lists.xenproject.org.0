Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD05B6516
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 03:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406105.648505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXuh5-0006Jh-1L; Tue, 13 Sep 2022 01:26:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406105.648505; Tue, 13 Sep 2022 01:26:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oXuh4-0006Hu-Uf; Tue, 13 Sep 2022 01:26:30 +0000
Received: by outflank-mailman (input) for mailman id 406105;
 Tue, 13 Sep 2022 01:26:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxhT=ZQ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oXuh2-0006Ho-Tb
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 01:26:29 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15947438-3303-11ed-9760-273f2230c3a0;
 Tue, 13 Sep 2022 03:26:26 +0200 (CEST)
Received: from MW2PR16CA0009.namprd16.prod.outlook.com (2603:10b6:907::22) by
 MW4PR12MB7309.namprd12.prod.outlook.com (2603:10b6:303:22f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 01:26:23 +0000
Received: from CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::a9) by MW2PR16CA0009.outlook.office365.com
 (2603:10b6:907::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22 via Frontend
 Transport; Tue, 13 Sep 2022 01:26:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT089.mail.protection.outlook.com (10.13.175.179) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Tue, 13 Sep 2022 01:26:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 12 Sep
 2022 20:26:21 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 12 Sep 2022 20:26:15 -0500
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
X-Inumbo-ID: 15947438-3303-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3Hy4Ko6T+sV51jcS4v/HeaqSI05oke5o+S47xXef7lC8Whze5L4sI3CCriQlbDuQEMbHBQ748Z3NKLdBN0iiwnPR4MN5rbmrSnhCsnRZP5FaBtgfrO1DQt7NAcJbDJwJc6kB0mJhr0Z/BU/yo+z4DIT3IlmctNm8Q55aUMYbG0RHtocOCdvFWuaTBax8N8lOqxXZG2cR0Yc1cmziPz332y8J6X1su9Z2fL459KRg9VMDxt3fRQ0QGdFJ8JEFTOweY+2q24JJlMZM9ElNQPa9Mg+CjAr52Vr/59y2K0Uwn96QoRthPHirgmCiD5T0WsuvQZG4ldl57hb2bZVfB2ciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DGw8WgM1pmYZjd/VUQ46RxQx+DVsuLSMgpygrSdoM7Y=;
 b=Wz/AdboP+cU0ZEbmfqMq4+uhHPsfgZLNin0U21yjqD1YsST+f0CMO4wSg8shXX/dlr8shUCNXtwKJZrLzXT7y5IInWj9Xn0vXyxjU7rog46Oi4ipentrYH0UGX4TDn1AFGuJdsjo+z7N8pTxIY30CwiB0K6oyGEmc2gFbk268sd4eRJy+znjeJuhIbB4XikDNpONzaMkSxTEkfdXY6YuaAMoCA6t2OagDLV1tnENzC6ZlQqiPNm3pdzueOQLcclfoKQuVlR6wxGjYKd3fMoSAPh3wCbA08FhFA8tVrTxo6S8dz5dyIOJwiOcBjGgt4DRAXb70EK6C6+EKkQ5hMUg8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DGw8WgM1pmYZjd/VUQ46RxQx+DVsuLSMgpygrSdoM7Y=;
 b=vJo2TfSiA6byHf8ZwUUWt9N5DRnYLjuJ4kSHSKeI4Ft5eZFADpBsHsHQjf8wJQ/4EYoJi+5jTgK/eba113/ZA6fHUoBDOC17mE3iqSxXiXuytZTAd6rzh60r7P6HOX1Ccl4YE/ZRNIPZpulwt4sFxJOCTnbDaosSRMAr447Xxe8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Mon, 12 Sep 2022 18:26:14 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <JESHWANTHKUMAR.NK@amd.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>,
	<boris.ostrovsky@oracle.com>, <xen-devel@lists.xenproject.org>,
	<JESHWANTHKUMAR.NK@amd.com>, <Devaraj.Rangasamy@amd.com>,
	<Mythri.Pandeshwarakrishna@amd.com>, <SivaSangeetha.SK@amd.com>,
	<Rijo-john.Thomas@amd.com>, <jgross@suse.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop> <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com> <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT089:EE_|MW4PR12MB7309:EE_
X-MS-Office365-Filtering-Correlation-Id: 902716c4-e11b-4a17-a7c0-08da9526f866
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBZmUyHr1egRxbHdtVodLtq4hnueOPxkAOO7lFwvgNJGAefbLflGNEs2oa5Etekk6wXr4WmWgV3lngYZrc8w1LdoR57lQXCpPw5ozy9uUo+j/hC2Z3P8GU5xJo+6CrnQGBMDyX8Hs9w7fX697482x8rjdmxICkx7hlg/K5L1UOrg9Q6sCtZqBWdhRpn7vdocmNgR0zdELME/Y9X+gtlqnH1niWXKa8avKjDXRVvkBw5v42QRiTVAlfRLDUuE7qJ1ZAsG136zo8jeHF3K/YGEI0o3rBudlrJj4S4Ldsy7rjN7ATP3icZiZjjRR1rDsQEgBCygltW/6b0526uAihszpeyQKfLJFZjUR2ryIQofqZrFS20dR9RL7zU4iz08MZZcsaZEiiG+YcxovsH9cyW3fJGTSVu2tKUSDfJDsA2BY6h9v12mxenftk542W+4aGEJP9fhh5kQvq/ole2oNhRWv7X77WOF8GrEg3C0bCcI93FFTiUAVdrK7mQzljHUBQbHKqoqqsE7Tp2ZVitFEOxPEPPzIOFN6vn3rjjK02ZDydH/jqmORAlsutOR2XZsU/KQ7/pK4oJYh0iE9N1aQCrWs6QLZlZSSACC3lM5oiuUEbpFwEAkTV8ivhs+2JHixwqMlgLEtWYfQel1GvQ/rUwhV1CVjnKhIyKZGDmUiWl5Piv4ozE6K8Hgcf8+EGNhOn8MUPvQj5DnYTzJjHI1IOkwuL+6+uOiPNQiitggPsIV/o8UKfRYym742epWSrjsKzQYNcFQLu+s36xePL6EUgkzQtix9Epb0wMTspwKTqaPh98=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(7916004)(39860400002)(346002)(396003)(136003)(376002)(451199015)(40470700004)(36840700001)(46966006)(6862004)(316002)(2906002)(426003)(26005)(4326008)(70206006)(70586007)(47076005)(336012)(9686003)(82740400003)(356005)(6636002)(81166007)(82310400005)(41300700001)(8676002)(186003)(54906003)(44832011)(33716001)(86362001)(53546011)(83380400001)(8936002)(40480700001)(36860700001)(5660300002)(478600001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 01:26:23.3244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 902716c4-e11b-4a17-a7c0-08da9526f866
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7309

On Sat, 10 Sep 2022, Juergen Gross wrote:
> On 09.09.22 22:25, Stefano Stabellini wrote:
> > On Fri, 9 Sep 2022, Juergen Gross wrote:
> > > On 09.09.22 04:11, Stefano Stabellini wrote:
> > > > Adding more people in CC
> > > > 
> > > > On Thu, 8 Sep 2022, Stefano Stabellini wrote:
> > > > > Hi Juergen,
> > > > > 
> > > > > A colleague is seeing a failure on x86 in Linux Dom0. The failure is
> > > > > pin_user_pages_fast with addresses that correspond to foreign memory
> > > > > pages:
> > > > > 
> > > > > - QEMU maps a domU address using dma_memory_map (xen_map_cache)
> > > > > - QEMU calls an IOCTL to the TEE subsystem with the Virtual Address
> > > > >     returned by dma_memory_map
> > > > > - Linux tee_shm_register->pin_user_pages_fast Returns -14 -
> > > > > drivers/tee/tee_shm.c
> > > > > 
> > > > > Once upon a time it used to be the case that get_user_pages_fast would
> > > > > fail on Xen because we didn't have a struct page corresponding to
> > > > > foreign memory mappings. But that hasn't been the case for years now.
> > > > > 
> > > > > Any other ideas why it would fail?
> > > 
> > > I think we can expect that access_ok() isn't failing.
> > > 
> > > I assume the mapping was done allowing writes (sorry for paranoia mode)?
> >   I was told it was verified: QEMU could read and write to the VA returned
> > by dma_memory_map. From /proc/<qemu-pid>/maps, the VA assigned after the
> > mapping is pointing to /dev/xen/privcmd.
> > 
> > 
> > > Other than that I'm not having enough memory management skills. It might
> > > be
> > > related to mmap()-ed foreign pages having _PAGE_SPECIAL set, though.
> > 
> > Do we still set PAGE_SPECIAL for foreign mapped pages? It looks like it
> > is not there anymore? If PAGE_SPECIAL is not there, then they really
> > should look like regular pages?
> 
> See the call of pte_mkspecial() in remap_area_pfn_pte_fn() (mmu_pv.c).

The kernel version is 5.16 and the return code is -EFAULT. Is it
the following -EFAULT the one that triggers?

mm/gup.c:internal_get_user_pages_fast:

	if (unlikely(!access_ok((void __user *)start, len)))
		return -EFAULT;

