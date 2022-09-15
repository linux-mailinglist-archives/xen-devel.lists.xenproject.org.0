Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A94F95B9212
	for <lists+xen-devel@lfdr.de>; Thu, 15 Sep 2022 03:19:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407185.649595 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYdWa-0005QK-Aa; Thu, 15 Sep 2022 01:18:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407185.649595; Thu, 15 Sep 2022 01:18:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oYdWa-0005Nb-7M; Thu, 15 Sep 2022 01:18:40 +0000
Received: by outflank-mailman (input) for mailman id 407185;
 Thu, 15 Sep 2022 01:18:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mu3q=ZS=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1oYdWY-0005NV-BK
 for xen-devel@lists.xenproject.org; Thu, 15 Sep 2022 01:18:38 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50d68eb5-3494-11ed-a31c-8f8a9ae3403f;
 Thu, 15 Sep 2022 03:18:36 +0200 (CEST)
Received: from MW2PR16CA0017.namprd16.prod.outlook.com (2603:10b6:907::30) by
 BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Thu, 15 Sep
 2022 01:18:30 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:907:0:cafe::67) by MW2PR16CA0017.outlook.office365.com
 (2603:10b6:907::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.14 via Frontend
 Transport; Thu, 15 Sep 2022 01:18:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 01:18:30 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 14 Sep
 2022 20:18:29 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 14 Sep 2022 20:18:28 -0500
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
X-Inumbo-ID: 50d68eb5-3494-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RgxdrfDDuicq2VjnRv4jcbfmVPFIQoM3JyzcKW2qQDK4lbmhWPWcCLpRraFpcs2b3X78joY6Uu0QjtLVVsJkhbJ9fh7529N7e94lDV7Iu9WoAfQSasa9xvBpgkd4ZwCFd3T/UKemTUYOvRbVsTweR4cPyDku0Q5F4xY5EQeolPM25pJxIbgoiR1gN0r7vR6n3RQZOXSfJ2NKNy1y/hQjNb3tafde7i4KG+yWx/Q362P/UTD6jp67yG+4ujjFJ/w2n38WOIhdcAizzE2w04UiTPjXDtiGWO4O7YycsYvLgNlBiFhbcFov/dmmlO/NjAV4sf9TJLNyrJD9jQpHTTfcug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4jBzfq64zbmPoO+yKEshyOUcrteWknczyvtCfQcmjcQ=;
 b=XAiIhU3quFhvtWE0CwmeWzD5RzJ7HPUzpaP5MTwPEJzTxQHcsM30qIdCw04nhymIGI3st2G2p2b1JXCJcRFLEeUbZ4NBWvACoLzemLBt/ZJGCCc49ljGjZ/hO+aCgJlpEYMHAVEsS6H2+blcU7ErZSIqMQuIqVOdTQWILTD777eBVxEeev5XXLKrQoCQBHVht2g6OQ/r/DmjvNxpeC27rMPjdFNGn75c16Z2gSYo0QHbXAA13V2dxm99B8HGxCiOrnvQnLogv826KIxEuXdFUYlfVVH0BePMgrK/D4tQ9TwB1o1XHcjfZuMpBD2+ImKDm+YSe8QxHWafBj3bZ5qGGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4jBzfq64zbmPoO+yKEshyOUcrteWknczyvtCfQcmjcQ=;
 b=DKV0eouucYJKnFjhx6FIl0lsMSD2z82tq83WTProwl+nOClhUCwvQxyM3u68uI2X2fno1JH748Y+ZyEskswZg1Ne07GJ8P7Q3ID+zw7jZ/Vz7+qYECIrZDBqN9JnLy/msP3MJM1XpSjD9v0E5DrTdIHrBjr/vsc12vij+5SFGPM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Date: Wed, 14 Sep 2022 18:18:28 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, "NK, JESHWANTHKUMAR
 (JESHWANTH KUMAR)" <JESHWANTHKUMAR.NK@amd.com>, "boris.ostrovsky@oracle.com"
	<boris.ostrovsky@oracle.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Rangasamy, Devaraj"
	<Devaraj.Rangasamy@amd.com>, "Pandeshwara krishna, Mythri"
	<Mythri.Pandeshwarakrishna@amd.com>, "SK, SivaSangeetha (Siva Sangeetha)"
	<SivaSangeetha.SK@amd.com>, "Thomas, Rijo-john" <Rijo-john.Thomas@amd.com>,
	"jgross@suse.com" <jgross@suse.com>
Subject: Re: Linux pin_user_pages_fast fails on Xen
In-Reply-To: <3c1eccfe-3ca5-32d8-ee5a-cf8e7b23d587@suse.com>
Message-ID: <alpine.DEB.2.22.394.2209141749460.157835@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2209081905010.157835@ubuntu-linux-20-04-desktop> <alpine.DEB.2.22.394.2209081910340.157835@ubuntu-linux-20-04-desktop> <017b8061-110b-a77f-6f0c-9f5679b7df13@suse.com> <alpine.DEB.2.22.394.2209091314430.157835@ubuntu-linux-20-04-desktop>
 <9f11a181-75cb-aadf-2ce8-8bb6737af9ac@suse.com> <alpine.DEB.2.22.394.2209121819430.157835@ubuntu-linux-20-04-desktop> <DM6PR12MB4564760C66FFA15ADAE2B014E6479@DM6PR12MB4564.namprd12.prod.outlook.com> <DM6PR12MB4564E946E0E08F71B1CC125CE6479@DM6PR12MB4564.namprd12.prod.outlook.com>
 <alpine.DEB.2.22.394.2209131629370.157835@ubuntu-linux-20-04-desktop> <3c1eccfe-3ca5-32d8-ee5a-cf8e7b23d587@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT054:EE_|BL0PR12MB4946:EE_
X-MS-Office365-Filtering-Correlation-Id: 8671795a-313a-4dd3-806f-08da96b83349
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G72KHCbhq+11t/+Oh/S0ekVAP3hyGnKcrzIidWH8qjWS3k3ZKcjPC2oDowQmNIjuDCulOgz8b4/RDCYD6sVcSA+aE8cP4Iboz+RVswLt01bIWJKkSqU/ry3Of/TFebCcOlgqTUbjy1ajfYuLIRuJb608xQ18H5+TbDRXDhd0H19TX9RTWQGULaVf6s9Vt1BfkzHQvKBZ6oAtEB6EETqyT+aV25qK55MH45CCcZk/dL/x5WKFg+etmj0+r/sp84qehVjgcRe9pna/ERDvUZwMAhrKVg4n/VwOXaT73iMhFrTSV0fiwh/j9WuxgaP9BtY5V0bi39Qob0qG41T+dRBdXts1RKlQhnp0puMSWZ5HsVblDqkUb+NLpW++VpusQvVO2ejBm5p3sD5lnDryD+D/483a7UuJWDT/TKRlUpeC0LcFXh9k2UViDrfiuoKfjg1xtHTxG94XebxhPhJmwvdZk09nYW/74OgGIKPmQlPt3JMXOZYqvdbt5l/peCxbT3jzGT67xXgBU4UyH592Mi6wkcPCuWXWNaxmxdEtQM4ViX4aVix+Z5UD+rcNl9bvALI5h3BYBXVAd3vcBE3L2Trg58VfaOFL1kWViQ1Cj2M4+8sy0ELuWG9qdCVHzc3qQ6R03txbFGNxCcC9zn69UvMgExYqec3/uieoXMzC2fso/fcVNc+6ErJI2VyM4Wvbkh225HxPg9gfo5wNXyWQHC9Z7R/VXIm87G2nxKENGLBkLXNMMLzwaT3z2x8OUjOR0hOKdEJ8xdZ9YAOTivTlsJWljyS3aVpI71CL93qsNLQvO2xsTeCbub443CUeZvk0DGoD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(136003)(39860400002)(376002)(346002)(451199015)(36840700001)(46966006)(40470700004)(8936002)(186003)(47076005)(40480700001)(9686003)(356005)(86362001)(81166007)(316002)(53546011)(41300700001)(426003)(82740400003)(478600001)(54906003)(33716001)(4326008)(83380400001)(6916009)(70206006)(40460700003)(70586007)(336012)(5660300002)(44832011)(36860700001)(26005)(8676002)(82310400005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 01:18:30.3075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8671795a-313a-4dd3-806f-08da96b83349
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946

On Wed, 14 Sep 2022, Jan Beulich wrote:
> On 14.09.2022 01:31, Stefano Stabellini wrote:
> > The problem is that drivers/xen/privcmd.c:privcmd_mmap sets VM_IO |
> > VM_PFNMAP, and either flag would cause check_vma_flags to return
> > -EFAULT.
> > 
> > Do you know if it works if you remove VM_IO | VM_PFNMAP from
> > privcmd_mmap?
> 
> My Linux MM knowledge is certainly rusty, but I don't think this can
> work, at the very least not without further changes elsewhere.

The definition of VM_PFNMAP is:

    Page-ranges managed without "struct page", just pure PFN

So it made perfect sense to use VM_PFNMAP back in the day when we were
using address ranges without "struct page" for foreign mappings.


However, nowadays Linux drivers typically call
xen_alloc_unpopulated_pages to get local pages to be used for foreign
mappings. xen_alloc_unpopulated_pages should work for both PV and
autotranslated guests. So the local pages should have a regular "struct
page" backing them.

I noticed that privcmd calls
alloc_empty_pages->xen_alloc_unpopulated_pages only for autotranslated
guests. Do you guys think it is intentional? In theory,
xen_alloc_unpopulated_pages should work for PV guests too.

After that, privcmd calls xen_remap_domain_gfn_array, which calls
xen_xlate_remap_gfn_array or xen_remap_pfn depending on
PV or autotranslated.

But then I can see the following at the top of xlate_remap_gfn_array:

	/* Kept here for the purpose of making sure code doesn't break
	   x86 PVOPS */
	BUG_ON(!((vma->vm_flags & (VM_PFNMAP | VM_IO)) == (VM_PFNMAP | VM_IO)));

and a similar one in arch/x86/xen/mmu_pv.c:xen_remap_pfn:

	BUG_ON(!((vma->vm_flags & (VM_PFNMAP | VM_IO)) == (VM_PFNMAP | VM_IO)));


Given that the pages passed to xen_xlate_remap_gfn_array and
xen_remap_pfn could have been allocated with
xen_alloc_unpopulated_pages, why the BUG_ON?

Is this just legacy? In the sense that the following could work?

- privcmd calls xen_alloc_unpopulated_pages for both PV & autotranslated
- no setting VM_PFNMAP | VM_IO
- no BUG_ON in xlate_remap_gfn_array
- no BUG_ON in xen_remap_pfn

Am I missing something?


> I did look some at the specific use by the TEE subsystem, and it looks
> to me as if their "shared memory" machinery simply isn't meant to be
> used with non-local memory.

Any more info?


