Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F07255B7D84
	for <lists+xen-devel@lfdr.de>; Wed, 14 Sep 2022 01:31:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406676.649060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYFNL-0008Pc-2N; Tue, 13 Sep 2022 23:31:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406676.649060; Tue, 13 Sep 2022 23:31:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYFNK-0008M9-VO; Tue, 13 Sep 2022 23:31:30 +0000
Received: by outflank-mailman (input) for mailman id 406676;
 Tue, 13 Sep 2022 23:31:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yxhT=ZQ=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oYFNJ-0008M3-Ku
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 23:31:29 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2fd5208b-33bc-11ed-9761-273f2230c3a0;
 Wed, 14 Sep 2022 01:31:27 +0200 (CEST)
Received: from DM6PR02CA0068.namprd02.prod.outlook.com (2603:10b6:5:177::45)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Tue, 13 Sep
 2022 23:31:24 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::a6) by DM6PR02CA0068.outlook.office365.com
 (2603:10b6:5:177::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.12 via Frontend
 Transport; Tue, 13 Sep 2022 23:31:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Tue, 13 Sep 2022 23:31:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 18:31:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 13 Sep
 2022 18:31:23 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 13 Sep 2022 18:31:22 -0500
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
X-Inumbo-ID: 2fd5208b-33bc-11ed-9761-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NHDuGO44ST1aD1iZ5Eyif8BG8RNk67h8Upg9hZH+zD6QDCxPxTY09DS1M8rDCpdWMdBHoE8cUXTGPkaPHMfbTjuYK+F3V/hB1J+i8MdPWm/bNYWfYOg9+zAIJ4/LY+IjOpHJTAmaGa4SrisuVnp4c8FzOm4xoFpXmkwx4EHHrqj8yvojNXA0HHOq+HxJKeAUCfcC1HAEr5eES1jpTNZBr9IyfKJdTVp9Bo51TNBmpuZaMpQL690me1UiRnmko3/DHhR2TIfnhYUHo1QElQd8dA8c4XkZP1JAC+ip0SfSj6YGJDL+D4KM5EOo6WcoKAo7guz8Rl6SCpW5UTpMcI5Aag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QCPA0ryzlmb4HnFaXCJB1t+nX8fM+ivDm5BLBBIaYDI=;
 b=JB0xswc86nZDekwoiCM8dIqXCHrpK8+61XCAz2UOUeGSaPARD4mcI1RNtyt+HyBrVXXhPNMPyDfLxOzesiDDZ5wXTVRSORJkhzTfedjEhtiNkw4Fr7w21/gjTyJ4w9OtuJMjBTLd9caabhI2fz8E17TM3NBSHTDXCRXdepKXD8RFaJIeIjwpkrO5pI4nAzDMC8Pj0P5Z7Omoeu6uQar3qS1eKFl6ShNX5izjWxhfYykKfnOcyVpGDLND9Wpe8LY0+6wLIrV84rqM2pNV5wn3yw77etvHA1GJBpYzXB5TAHztgL91/95VpZ6i9TtEC1X1HfUyYTOI2Jb2h/iksam95w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oracle.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QCPA0ryzlmb4HnFaXCJB1t+nX8fM+ivDm5BLBBIaYDI=;
 b=ekfgdisxwThzr0eeW36ECIIC/sQgQBipLf/MvL1CGQadd1Az/LB+ZqMsYS6diIshmccPZzAOUaUbbo3ZfOu8EUuP1DyZiLQRZXb5eqYLdCV77d8ynTaDNFMBUPgQHzuKVkbslf0sJv5dPQ56241Pi8meNjLubMDke5Nera4W4eI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Tue, 13 Sep 2022 16:31:21 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "NK, JESHWANTHKUMAR (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>
CC: "Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"Rangasamy, Devaraj" <Devaraj.Rangasamy@amd.com>, "Pandeshwara krishna,
 Mythri" <Mythri.Pandeshwarakrishna@amd.com>, "SK, SivaSangeetha (Siva
 Sangeetha)" <SivaSangeetha.SK@amd.com>, "Thomas, Rijo-john"
	<Rijo-john.Thomas@amd.com>, "jgross@suse.com" <jgross@suse.com>
Subject: RE: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop> <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com> <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com> <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop> <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT081:EE_|DM6PR12MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f58bc28-270b-40aa-fe8a-08da95e01299
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cIaHVIe6qxYeWOqXOLI8hKUoCocnbZJpzoySgrt7QTD5o+HSQYyWtn9vrWTb0aSPJs624UcvZjT1ba9/by+vAxV2hsfOzUxTSFL/FA2x8HhWXODaZNudAlNWsNvB3wmYln5u1mfPnbXa58pa/a+TAmHhWoJSlxVRvvJYSlM363FTAFQnZkA/B3bbZT/KuiNbBctKYu0FNRDOI/I+JaupNoFwQpv2rfHT/l2d7LnQkrly4rJ8wRNpcyvG3x8FNpEPydd655B3sIHYTisYkkKbt2LRc5CG36A5zeW6sz7Wq4l4V89oHaE4Su1eADnSnhkEK9sFZ4tHRnm4OqpGyiHFxwz+xGGFX4gkA0iEEzkyRCVUNhrilnAxT4MiDwyXUs5fZKzYK3uiks6NeQB5yEXN4SmT41V2+sZ1tn4FgKnaP+uvF7NnW29tSKdr5YoYBH51P/Y6iCXG/3Bjpg9jVAXKQ9O/aE1RUn92e3gitj9NwRqGZtGmFMpzQkND8DOHtDNVwdTjThFZGG4F8rBdeNIXwTNGnNxrlk675sLRzs2ltJfD5WwX4z7pjRy5gIXJHaMiwPu9L9jV4o4qVQKFFNK4zquoOAZgFrOeRSZuZ+cVwOv1v/VTzs8vFSq29NiNnQ1LawTxFiEG51zY5W75trcfJXSd2CsmXJXJNpKao7ntH2r6wDNk5pAcqKWC2IfF1d4njW7kWsb+u4LI4I14DNl8PdZ6+8o17ej2FobF5jo1hXXrmAhP/NLPNl3QWa9ohAJZZnDFIj8RZYQQqW2DO0JuFUEfp66h247zP/8qZ64BT/mb2M8AX3ItnKTXDX9yow1YUi/ww2I/wBWOLewZZX3fXw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(36840700001)(46966006)(40470700004)(41300700001)(70586007)(70206006)(44832011)(86362001)(8676002)(40460700003)(81166007)(40480700001)(53546011)(4326008)(6636002)(82310400005)(47076005)(2906002)(186003)(9686003)(6862004)(5660300002)(8936002)(54906003)(26005)(36860700001)(33716001)(426003)(83380400001)(316002)(478600001)(82740400003)(356005)(336012)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 23:31:24.2704
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f58bc28-270b-40aa-fe8a-08da95e01299
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468

The problem is that drivers/xen/privcmd.c:privcmd_mmap sets VM_IO |
VM_PFNMAP, and either flag would cause check_vma_flags to return
-EFAULT.

Do you know if it works if you remove VM_IO | VM_PFNMAP from
privcmd_mmap?

Juergen, do you think the flags are necessary and useful? Any
suggestions?


On Mon, 12 Sep 2022, NK, JESHWANTHKUMAR (JESHWANTH KUMAR) wrote:
> Missed to update the Flag details:
> 
> Flag for DMA Mapped VA - 0x0C0644BB
> Flag for Local VA 	   -  0x08100073
> 
> 
> VM_IO and VM_PFNMAP  - Set in DMA mapped VA but not in local VA.
> 
> Regards,
> Jeshwanth
> 
> -----Original Message-----
> From: NK, JESHWANTHKUMAR (JESHWANTH KUMAR) 
> Sent: Tuesday, September 13, 2022 11:05 AM
> To: 'Stefano Stabellini' <stefano.stabellini@amd.com>
> Cc: Stabellini, Stefano <stefano.stabellini@amd.com>; boris.ostrovsky@oracle.com; xen-devel@lists.xenproject.org; Rangasamy, Devaraj <Devaraj.Rangasamy@amd.com>; Pandeshwara krishna, Mythri <Mythri.Pandeshwarakrishna@amd.com>; SK, SivaSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Rijo-john <Rijo-john.Thomas@amd.com>; jgross@suse.com
> Subject: RE: Linux pin_user_pages_fast fails on Xen
> 
> [AMD Official Use Only - General]
> 
> Hi Stefano,
> 
> https://elixir.bootlin.com/linux/v5.16/source/mm/gup.c#L975 is the -EFAULT returning for our current use case.
> 
> access_ok is fine.
> 
> Regards,
> Jeshwanth
> 
> -----Original Message-----
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> Sent: Tuesday, September 13, 2022 6:56 AM
> To: NK, JESHWANTHKUMAR (JESHWANTH KUMAR) <JESHWANTHKUMAR.NK@amd.com>
> Cc: Stabellini, Stefano <stefano.stabellini@amd.com>; boris.ostrovsky@oracle.com; xen-devel@lists.xenproject.org; NK, JESHWANTHKUMAR (JESHWANTH KUMAR) <JESHWANTHKUMAR.NK@amd.com>; Rangasamy, Devaraj <Devaraj.Rangasamy@amd.com>; Pandeshwara krishna, Mythri <Mythri.Pandeshwarakrishna@amd.com>; SK, SivaSangeetha (Siva Sangeetha) <SivaSangeetha.SK@amd.com>; Thomas, Rijo-john <Rijo-john.Thomas@amd.com>; jgross@suse.com
> Subject: Re: Linux pin_user_pages_fast fails on Xen
> 
> On Sat, 10 Sep 2022, Juergen Gross wrote:
> > On 09.09.22 22:25, Stefano Stabellini wrote:
> > > On Fri, 9 Sep 2022, Juergen Gross wrote:
> > > > On 09.09.22 04:11, Stefano Stabellini wrote:
> > > > > Adding more people in CC
> > > > > 
> > > > > On Thu, 8 Sep 2022, Stefano Stabellini wrote:
> > > > > > Hi Juergen,
> > > > > > 
> > > > > > A colleague is seeing a failure on x86 in Linux Dom0. The 
> > > > > > failure is pin_user_pages_fast with addresses that correspond 
> > > > > > to foreign memory
> > > > > > pages:
> > > > > > 
> > > > > > - QEMU maps a domU address using dma_memory_map
> > > > > > (xen_map_cache)
> > > > > > - QEMU calls an IOCTL to the TEE subsystem with the Virtual Address
> > > > > >     returned by dma_memory_map
> > > > > > - Linux tee_shm_register->pin_user_pages_fast Returns -14 - 
> > > > > > drivers/tee/tee_shm.c
> > > > > > 
> > > > > > Once upon a time it used to be the case that 
> > > > > > get_user_pages_fast would fail on Xen because we didn't have a 
> > > > > > struct page corresponding to foreign memory mappings. But that hasn't been the case for years now.
> > > > > > 
> > > > > > Any other ideas why it would fail?
> > > > 
> > > > I think we can expect that access_ok() isn't failing.
> > > > 
> > > > I assume the mapping was done allowing writes (sorry for paranoia mode)?
> > >   I was told it was verified: QEMU could read and write to the VA 
> > > returned by dma_memory_map. From /proc/<qemu-pid>/maps, the VA 
> > > assigned after the mapping is pointing to /dev/xen/privcmd.
> > > 
> > > 
> > > > Other than that I'm not having enough memory management skills. It 
> > > > might be related to mmap()-ed foreign pages having _PAGE_SPECIAL 
> > > > set, though.
> > > 
> > > Do we still set PAGE_SPECIAL for foreign mapped pages? It looks like 
> > > it is not there anymore? If PAGE_SPECIAL is not there, then they 
> > > really should look like regular pages?
> > 
> > See the call of pte_mkspecial() in remap_area_pfn_pte_fn() (mmu_pv.c).
> 
> The kernel version is 5.16 and the return code is -EFAULT. Is it the following -EFAULT the one that triggers?
> 
> mm/gup.c:internal_get_user_pages_fast:
> 
> 	if (unlikely(!access_ok((void __user *)start, len)))
> 		return -EFAULT;
> 

