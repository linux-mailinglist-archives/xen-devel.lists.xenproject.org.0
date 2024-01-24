Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1237583A0E7
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 06:08:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670719.1043675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSVUW-0000sQ-Vu; Wed, 24 Jan 2024 05:08:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670719.1043675; Wed, 24 Jan 2024 05:08:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSVUW-0000pu-Rl; Wed, 24 Jan 2024 05:08:00 +0000
Received: by outflank-mailman (input) for mailman id 670719;
 Wed, 24 Jan 2024 05:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=87Ys=JC=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rSVUV-0000po-QA
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 05:07:59 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8937d9dc-ba76-11ee-98f5-6d05b1d4d9a1;
 Wed, 24 Jan 2024 06:07:58 +0100 (CET)
Received: from DS7PR05CA0065.namprd05.prod.outlook.com (2603:10b6:8:57::10) by
 IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.37; Wed, 24 Jan
 2024 05:07:53 +0000
Received: from DS2PEPF00003445.namprd04.prod.outlook.com
 (2603:10b6:8:57:cafe::70) by DS7PR05CA0065.outlook.office365.com
 (2603:10b6:8:57::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.21 via Frontend
 Transport; Wed, 24 Jan 2024 05:07:53 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003445.mail.protection.outlook.com (10.167.17.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 24 Jan 2024 05:07:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 23:07:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 23 Jan
 2024 23:07:30 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 23 Jan 2024 23:07:29 -0600
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
X-Inumbo-ID: 8937d9dc-ba76-11ee-98f5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L/CsqmI6xQ1u9J+TChrM13XqHI8r2WNuqM9T+HWVmkiljwb5TXB34goX97Bi8XDVPeh2VKM8pnQ5TT8OrppfClleVmIwLrJYsf8VrFt3uCcORljGK0fSgnZDjpyZXyK6kH/mGX74+tuhZvdopkIXhhoEIXbX5MzIEwnNEvIFDOvFvM/xq60gf83Lqn6aiO7YzqVP4V33g2O5u8D0/altoSGSOqGkE63eTfe1kVti4Y16UU0vHz7Tm6tZ5rbdViSWIRYiBFR/8eS5nrcEnoi/sVge2LnE6def9sxeiCS/kkk8JzGtsawTsaRso2Vkfi5Joav1IExkJtLILrTz4EYUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p7OQkgaHwt2qt3q0A5mrs+QCPeRPZNHKYNn+J+Chwu4=;
 b=liFhjt3LThU8JbySdiaP8KEWxbzohVUPt7Rvv1HP7aJCygpNaiM1kaCdlLr7IqW1+Q/tFjQSlvkzPmWWVOCGFx4pQ7LJgOVTsoQKrjBxt6TyyEwRmwg1mUvobEz69vdaxZEh4hkiJ67qnu1H0eXD8koVxpyI3pBY7ZjERZpzpbfupGEv4EmAdZQ1K5kfv8sPse3xpXMd0ZySwJ1vcnKg/gS4V+7W9q/bhsmNSuEXDdpiDvbHuUFNl7g5MBOxLimVQK1uU2wEaVbb9wPrhxJupTI4sOvCnUuDQ+UZe9z4eT5DZMvcrRKskkv95WqLV0xSRe5XwsD25Mey5IhVnTyWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p7OQkgaHwt2qt3q0A5mrs+QCPeRPZNHKYNn+J+Chwu4=;
 b=ILpgiMWLx9CfcVzXrQTa1+Y6+lGAgGopY5tBETusssyjDEXzyRvUjuOj4KwtwJCuuAs+xaxnlzmzBYoeXXwoySoU5ZVCb8Ts+s17R3uq1qYKsrfJwoqkURgAgmWCmppMBOTuMnWnVY7B2byDYvqyUiLKd5RA5MZ5DCsQa0XC7ng=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e05e63ab-a86f-45c4-bd80-2b7d6b99aa3d@amd.com>
Date: Wed, 24 Jan 2024 00:07:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12.2 01/15] vpci: use per-domain PCI lock to protect vpci
 structure
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>, <xen-devel@lists.xenproject.org>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-2-stewart.hildebrand@amd.com>
 <20240115194309.45683-1-stewart.hildebrand@amd.com>
 <7e936e6a-3218-4c4a-ac68-a58cd363a11d@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <7e936e6a-3218-4c4a-ac68-a58cd363a11d@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003445:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: be886803-73d8-4bbe-d163-08dc1c9a6b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FixAuo4ZpyT4LsTNkGhOiwCKwdsReiHQUeacYvCMd0uTsA1b/gq/XLZ67fRlTkpgZtm+k8GKiLTXmfigVHlno4iIsqLQ1WI+IgN62/cXjxLy79vsOVTm+FEyi8NNjmzE5AOldP+xpRNuilpD3S59I4mAqj372DQyWTMzMsal6LJKsi9n1zMKlBzvGukoxEzgV+3O7J3rAIV+zPMn1CXoKbVUKP8aOhhlkujUozc+QK5WlKlzI6MPxI4onPakn2e7/BxEZOQbV9CZVWWIEm88oJoGcfECBzOSlScbUo9Lns4yubIP1jCDOfmgfpmoYMpipZCAkG+opf5IzrDERQylAQNVyiSPh+ijgVkjRwmxqIMrXw/W6Hla/yKpzJB/ESxID8E6pCQVCPQiPJX9JJpnBjMOVzgUMHSUxgqL1woT9Tw8sJJ1O8zXgScMMaQ7a2Hveqd/re7mnDjm07iDaJxCN7lj8sX494UoKDksXrAkZTxOUNMkyC/NLTvow8J+f1RGg7mIEJJKxhxP4WE7JWZQom4lsqerkcT2Q45hiDQnonaXW6HtHDlIdF6kbG8B41OLx2yHhLz1bOraUbXNCc7clpHH4rcbzvaHK/cTkBCKRUZf98Iltf/NoL+Ii8+DJNCgsK7XO1hqheh8QjTMxaFrRKF3aiiPpTwMx7TmFPINHwck3FGtlDwAQQtbc/B9Lhnd/1GqPKbk5bLsenDEEapMEJ4aQyfapN4sAznv3xjIZxA9BSfLknHnFJH33f8wqA4iJCyAH/NFRXBWfsMn+IqBwSHTzeyF7IaLk27BQ7RFXYY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(64100799003)(186009)(1800799012)(82310400011)(451199024)(36840700001)(46966006)(40470700004)(36860700001)(2906002)(81166007)(40460700003)(40480700001)(82740400003)(5660300002)(41300700001)(31686004)(7416002)(47076005)(44832011)(86362001)(70586007)(70206006)(356005)(54906003)(31696002)(36756003)(966005)(16576012)(6916009)(426003)(8676002)(316002)(8936002)(4326008)(478600001)(26005)(2616005)(53546011)(83380400001)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 05:07:52.9568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be886803-73d8-4bbe-d163-08dc1c9a6b4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003445.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494

On 1/23/24 09:29, Jan Beulich wrote:
> On 15.01.2024 20:43, Stewart Hildebrand wrote:
>> @@ -1043,11 +1043,11 @@ static int __pci_enable_msix(struct pci_dev *pdev, struct msi_info *msi,
>>  {
>>      struct msi_desc *old_desc;
>>  
>> -    ASSERT(pcidevs_locked());
>> -
>>      if ( !pdev || !pdev->msix )
>>          return -ENODEV;
>>  
>> +    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));
>> +
>>      if ( msi->entry_nr >= pdev->msix->nr_entries )
>>          return -EINVAL;
> 
> Further looking at this - is dereferencing pdev actually safe without holding
> the global lock?

Are you referring to the new placement of the ASSERT, which opens up the possibility that pdev could be dereferenced and the function return before the ASSERT? If that is what you mean, I see your point. The ASSERT was placed there simply because we wanted to check that pdev != NULL first. See prior discussion at [1]. Hmm.. How about splitting the pdev-checking condition? E.g.:

    if ( !pdev )
        return -ENODEV;

    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));

    if ( !pdev->msix )
        return -ENODEV;


[1] https://lore.kernel.org/xen-devel/85a52f8d-d6db-4478-92b1-2b6305769c96@amd.com/

