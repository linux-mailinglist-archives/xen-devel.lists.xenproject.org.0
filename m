Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF37708A0A
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 23:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536530.834932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzknd-00025i-M5; Thu, 18 May 2023 21:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536530.834932; Thu, 18 May 2023 21:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzknd-00022L-Ii; Thu, 18 May 2023 21:04:37 +0000
Received: by outflank-mailman (input) for mailman id 536530;
 Thu, 18 May 2023 21:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yK0N=BH=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1pzknb-00022F-KX
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 21:04:35 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 957be541-f5bf-11ed-b22d-6b7b168915f2;
 Thu, 18 May 2023 23:04:32 +0200 (CEST)
Received: from BN9P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::34)
 by DS7PR12MB6006.namprd12.prod.outlook.com (2603:10b6:8:7d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19; Thu, 18 May
 2023 21:04:29 +0000
Received: from BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13e:cafe::f7) by BN9P220CA0029.outlook.office365.com
 (2603:10b6:408:13e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.19 via Frontend
 Transport; Thu, 18 May 2023 21:04:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT089.mail.protection.outlook.com (10.13.176.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.20 via Frontend Transport; Thu, 18 May 2023 21:04:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 May
 2023 16:04:28 -0500
Received: from [192.168.137.15] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 May 2023 16:04:27 -0500
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
X-Inumbo-ID: 957be541-f5bf-11ed-b22d-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBm/ad1XFmI9e9ONbz2YXpMzcE7pN7/SfxbvinL6RuluYmogJ3DwjbmO/sj9B1HzD/WE9dG7puOrhxJ/F3r32DmbSFapdfF0ZSpwCvPbmu8jFpzvKz6hj2otTkePbPuVebUHzv/QYFeOcpkeSnB0bLBbJKGwGPmkpHZ8XKQH3p99X0oDLTwpIyEBeBk8hg3CkJpf4E+qPE2q0Yw5E5bsV87bbXm0u1v+n1pHV/Z3ii1osXktTAKYj3uh1/44fM2SaMfbwPr1RMew2JdCSIoizApFgKoYCL1+h1Lt9lHH5ay2SmF7oLQMPD7v71msVy5+UBLLvLS+G1vSTnn/z1rUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T6+AhEIkwA9zB0CpYlpi2x/xWUDwNWP5GuE6V+/Cncw=;
 b=fP4GXaKg7SComkjdr4dMd6GkArpvAK0LLnhsrEWCPU3ZlfQzl8fKenA/6UUG3SRmXnIXDEulOu4kYtliTP3sfYQHMoiwBw3xLDKfOFukxtgUddfeRmRLFsQpZCYrj4mUFonsKwJuer7JxtsdqbFq1/Bq13bsiazntbb+/+zkiIBvGplaMUVLNif4ZPNnKFhpO2dEywwCcfQ2RNO9aJjPctvkmKxVuOKX5F45h22CEY/b0e/0Jqhdip7zt1wZ5MOppPtp5Nytp4psABx6agDcyuVmH432y866+N0h6ylBMalUgzfXnFOtDsp+LRNMQd17lwPQv3I1CMPdTn0dirpBEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T6+AhEIkwA9zB0CpYlpi2x/xWUDwNWP5GuE6V+/Cncw=;
 b=ep+QJRmSuKpjYoMLSznFDWbWzw6dxVMPO5owNytJv1kE+xeJkY0drm/P/oE/vZ5aUS9o9njnkO/9W5sECKV+LAASYwLQOj7swd8109q2P3DBaNPKuMEAoWQmd+eTrR7bwaPwfJrfm+SToK/tUaYHT/TPo9w9nGQPgHsu824+3GQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2810bdac-9c89-7373-3a5a-0365127a2928@amd.com>
Date: Thu, 18 May 2023 17:04:21 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 3/8] iommu/arm: Introduce iommu_add_dt_pci_device API
To: Jan Beulich <jbeulich@suse.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Paul Durrant
	<paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>
References: <20230511191654.400720-1-stewart.hildebrand@amd.com>
 <20230511191654.400720-4-stewart.hildebrand@amd.com>
 <71df3cfb-602d-e543-33bb-02e708e85f5e@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <71df3cfb-602d-e543-33bb-02e708e85f5e@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT089:EE_|DS7PR12MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: 818231c8-0317-44d6-728b-08db57e3784e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J2yb2tA4pQgoNqkCf2dzy0uCrNNrFRjPwOrD8MjJTCL4k4nzLqIVgYxlBEaC67W7WrsRzlK/2t1DmdDBwnLJSQXlw3S+0loaU2JYRbJe2UgozjEaKsQOOY7BuJeaLllHSVB0QBYTIN5OjZNGrmkU0uk+qBFwuiRLAAXPey5tyBZss/gK4dY1KECQuzoB7GNlofTZTZCpif4rTOzHwvV9XQ475MRk0mOjMBfy2rQfqCkaNO6pa/X2xh/EQSm7DIb022bZ0/kiRMdOALusaKvSxEs7iEKmaxJ86M9tZG4nQNV4fhAfF3261c6BVveCxW/cbGXUP7olH9Q53J3jGp8eiqbZ0x7kgM7HaLcYaK3t6kkg2Hje/TpS4MXxl9Q6cVPPGlCM0LPLYktAk4OLFtuDKUDlnnWt1zIJ33vFH9AVDCoLi85Yuu4FHM2NPvoFW42+gHK47LKS6ay/D1Q0Wa3s4eabU8mSaQT+3rz9YT21cW3L7Ab+mVQAhyLFX9H6Kxjs7S/HwkdyMlw83en3ohtsLBVeJPPV08kS5/JIXnAMMOEX+UBLhg68OeQMGH9k3iBZ5FvRYBjQrbaiWXxxbqBwv3b44ouaTgHe60xniZc6m8zvZ+kwZm5V0/5qldfIRPLIGxM3Jb704x33++W2SAm8FEuTT0w/p0//I8EiICh7RxJuep9SIuDF8CYBvgixdQOaBduz9OugjiDxXOhuCSCwyAaz3qc105bbjpot0ngPjqAj8/jEtUkAysYVy2r7hXhl9resXZjFVQ73jOXVmfpaACjqxjt4SMmTGwcL7H3BlsQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199021)(46966006)(36840700001)(40470700004)(26005)(40460700003)(53546011)(36860700001)(36756003)(426003)(47076005)(40480700001)(336012)(86362001)(31696002)(82310400005)(2616005)(356005)(81166007)(186003)(82740400003)(16576012)(54906003)(44832011)(5660300002)(478600001)(2906002)(4744005)(316002)(31686004)(6916009)(4326008)(8676002)(8936002)(41300700001)(70206006)(70586007)(6666004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 21:04:29.0188
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 818231c8-0317-44d6-728b-08db57e3784e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6006

On 5/12/23 03:05, Jan Beulich wrote:
> On 11.05.2023 21:16, Stewart Hildebrand wrote:
>> --- a/xen/include/xen/iommu.h
>> +++ b/xen/include/xen/iommu.h
>> @@ -219,7 +219,8 @@ int iommu_dt_domain_init(struct domain *d);
>>  int iommu_release_dt_devices(struct domain *d);
>>
>>  /*
>> - * Helper to add master device to the IOMMU using generic IOMMU DT bindings.
>> + * Helpers to add master device to the IOMMU using generic (PCI-)IOMMU
>> + * DT bindings.
>>   *
>>   * Return values:
>>   *  0 : device is protected by an IOMMU
>> @@ -228,6 +229,9 @@ int iommu_release_dt_devices(struct domain *d);
>>   *      (IOMMU is not enabled/present or device is not connected to it).
>>   */
>>  int iommu_add_dt_device(struct dt_device_node *np);
>> +#ifdef CONFIG_HAS_PCI
>> +int iommu_add_dt_pci_device(struct pci_dev *pdev);
>> +#endif
> 
> Is the #ifdef really necessary?

No, I will remove in v3

