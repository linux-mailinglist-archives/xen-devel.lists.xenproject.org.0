Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794017E05AE
	for <lists+xen-devel@lfdr.de>; Fri,  3 Nov 2023 16:39:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627226.978154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywGj-0003l3-VF; Fri, 03 Nov 2023 15:39:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627226.978154; Fri, 03 Nov 2023 15:39:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qywGj-0003iM-SD; Fri, 03 Nov 2023 15:39:33 +0000
Received: by outflank-mailman (input) for mailman id 627226;
 Fri, 03 Nov 2023 15:39:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AOuS=GQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qywGh-0003i7-Rv
 for xen-devel@lists.xenproject.org; Fri, 03 Nov 2023 15:39:32 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2cc5f90b-7a5f-11ee-98d8-6d05b1d4d9a1;
 Fri, 03 Nov 2023 16:39:30 +0100 (CET)
Received: from DS7PR03CA0075.namprd03.prod.outlook.com (2603:10b6:5:3bb::20)
 by PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Fri, 3 Nov
 2023 15:39:25 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::3c) by DS7PR03CA0075.outlook.office365.com
 (2603:10b6:5:3bb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.22 via Frontend
 Transport; Fri, 3 Nov 2023 15:39:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Fri, 3 Nov 2023 15:39:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 3 Nov
 2023 10:39:25 -0500
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Fri, 3 Nov 2023 10:39:23 -0500
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
X-Inumbo-ID: 2cc5f90b-7a5f-11ee-98d8-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hueivS4yX5fMJ4myFGzTAFehGkKaP0HfQ5ZWZ3gXjFYdXADrj09dslHa1FqDiWqjb1NexHCx8uRoLziI97PJZEuuErF+JDJpjQSsmLQwNfWKxq/kqVk9Wo8ycxk0SS+Whn1Vy3R3xrTgBMKnv06VWFuAxqFzZZXMOI7l5jM20I0AhXZLWYZLLYfriVgUJkiLMQA2UPfojgp23DnSGIf1Vunals9CrW+iAKNOag5X7HzmDRcSCzz+ugqc60LuHt53AaeX5zZsiHD5/ywiZyeqPsUgpOYeLUdFrFHdYN8FvCzy6eLVdNLoMSHd7rBBMe+9PAX1QByM/B/FAZt4zIZ+XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKNexmUa3jn9+hTtdgPh/NPObG01v0Fc/Xv7Cqhhkfk=;
 b=KuEHzGMO5rqNjDqDDqnHZRc+eGfWHohYvRrC11zIWnTerM6f8+M6mJu7OWG1oXosc9lggSZRRLiExv4mQh/d4NkkloXIkCnfYFXhCITGda3YO/hAbiimivdQ8/u8sAZ+wJ53O07CkN/N+P0/HZUf+ANJPj8LoSpVzq83iKCR61DFm2BXDp0LWMkWHBU33MFVIRPXE3xePiVtnJTAluYVxixurq1/u5d42PRn6N3yTZ+eY9AC2rGa31hu4I89P76B3EGWjrdJXaSD6/i9c4VnaKYz41vDpsjAbcu/U2eUyMg4juLhGcEqWoB9WPbZxaY7OYoRd0mquNhmYq839Gg0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=epam.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKNexmUa3jn9+hTtdgPh/NPObG01v0Fc/Xv7Cqhhkfk=;
 b=reR7WKyOS8AO635sjxBR8WlmCBYwmQk/7nv4zz84lNXQsf01fYBP+u/wf/4F0OFu7b9AbPazvA4e22D6W6Y355ZHyql2h3ykCIBkwPFmGnTP/vweeC0O5sZYEv8oLC9GXUNEkAL+NDgxsBNWkvVSxOasIxxJoTyIob121hJQirc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <cc409ec3-bf77-4f47-bff5-ee9c0d2bc83e@amd.com>
Date: Fri, 3 Nov 2023 11:39:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 03/17] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>, Paul Durrant <paul@xen.org>
References: <20231012220854.2736994-1-volodymyr_babchuk@epam.com>
 <20231012220854.2736994-4-volodymyr_babchuk@epam.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20231012220854.2736994-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c429b08-c3ee-4578-023e-08dbdc830f35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LN1MMm9MIteIwEXPyuTvWgTvHIe484Fcn1GOZBU3mYW+JCqAxUC8rvgs+jL0c8sZWrLDeNxupyd4VKO73VGnKF3qK293orW3vdD03fk5k00EVI7Q3Hy1/Ey+d/DSFHURd6RCwAflXmZp0w2JMhmIJ15HuG4M/7mFt20ZI4PnmjnZfKRynG7XW9rdjUayND4ZCQrW9Yjq8tGxr4pP4eStM3hutKD8nFNHKHvtemxyCGaZ1Q6fNdg9vVUE/60Knw1fLIPMhEaq4y3qYGK0KNe4rlxkX6vkRqHYQpWlGhPvI/Jui4RoIWkMb9krostVbLgE1wS+NqxZJS4YfoSE0u6ksW5fNL98bmTtwqvB2eZhwEG6qPn3RJAJ74EMQLzfvgM8kBTt4ULmA4l6HyLooyJo2K4fNaiAtnqg1dN0Ot8hFoobZavudpj9uQldL0A3nvcAFlQRn/ZNSO/GRmIXwnOgm1QdSc4iFSxlD/2B/a4+Y3Gz6kp9uOeTCu5mtBdcMmvIwDqmv+67XVCkrn+6dhub6tsyyE6t6Q42uOU3V/tvp7R2An+a5DNhyq9VfP3tIk+jpTnvGtIaqDbEv+Q2jb4qmHwLFzoizBz+PZRCpnsjn5/fpGpIi2MqYmMUaL9ZQMpK/V25HwjTRpsZAL8MyCUnPBdkEcnsOFmIvC04YaJup53+7S2X7xbg1q4Uidci7r56baPsPpEigr420pFvzsq/M/zi+2OCTfR9BOep4F0rfqQL/A7M2Kcrj5XotmsdiPboHliQop+PffrC/HP4k0E7Z+J92yLbAuuFGoLN8OoUkhY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(31686004)(2616005)(26005)(40480700001)(40460700003)(36756003)(31696002)(81166007)(86362001)(82740400003)(356005)(83380400001)(426003)(7416002)(47076005)(5660300002)(336012)(53546011)(2906002)(36860700001)(478600001)(4326008)(54906003)(16576012)(8676002)(316002)(8936002)(110136005)(70586007)(70206006)(44832011)(41300700001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2023 15:39:25.6234
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c429b08-c3ee-4578-023e-08dbdc830f35
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428

On 10/12/23 18:09, Volodymyr Babchuk wrote:
> 6. We are removing multiple ASSERT(pcidevs_locked()) instances because
> they are too strict now: they should be corrected to
> ASSERT(pcidevs_locked() || rw_is_locked(&d->pci_lock)), but problem is
> that mentioned instances does not have access to the domain
> pointer and it is not feasible to pass a domain pointer to a function
> just for debugging purposes.

...

> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 20275260b3..466725d8ca 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -988,8 +988,6 @@ static int __pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
>  {
>      struct msi_desc *old_desc;
> 
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev )
>          return -ENODEV;

I know it is mentioned in the commit message, so the ASSERT removal above may be okay. However, just to mention it: as we are passing pdev to this function now, we can access the domain pointer here. So the ASSERT can be turned into (after the !pdev check):

    ASSERT(pcidevs_locked() || rw_is_locked(&pdev->domain->pci_lock));

In which case pdev->domain != NULL might also want to be checked.

> 
> @@ -1043,8 +1041,6 @@ static int __pci_enable_msix(struct msi_info *msi, struct msi_desc **desc,
>  {
>      struct msi_desc *old_desc;
> 
> -    ASSERT(pcidevs_locked());
> -
>      if ( !pdev || !pdev->msix )
>          return -ENODEV;

Same here.

> 
> @@ -1154,8 +1150,6 @@ int pci_prepare_msix(u16 seg, u8 bus, u8 devfn, bool off)
>  int pci_enable_msi(struct msi_info *msi, struct msi_desc **desc,
>                    struct pci_dev *pdev)
>  {
> -    ASSERT(pcidevs_locked());
> -
>      if ( !use_msi )
>          return -EPERM;
> 

