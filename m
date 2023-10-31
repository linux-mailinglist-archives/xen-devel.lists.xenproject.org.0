Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2C07DCEDD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Oct 2023 15:16:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625814.975487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpX6-0003DG-9m; Tue, 31 Oct 2023 14:15:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625814.975487; Tue, 31 Oct 2023 14:15:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxpX6-0003Ai-7A; Tue, 31 Oct 2023 14:15:52 +0000
Received: by outflank-mailman (input) for mailman id 625814;
 Tue, 31 Oct 2023 14:15:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcxJ=GN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qxpX4-00037Z-DR
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 14:15:50 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faeb790d-77f7-11ee-9b0e-b553b5be7939;
 Tue, 31 Oct 2023 15:15:46 +0100 (CET)
Received: from CY5PR13CA0023.namprd13.prod.outlook.com (2603:10b6:930::9) by
 IA0PR12MB7601.namprd12.prod.outlook.com (2603:10b6:208:43b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Tue, 31 Oct
 2023 14:15:41 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:930:0:cafe::20) by CY5PR13CA0023.outlook.office365.com
 (2603:10b6:930::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.17 via Frontend
 Transport; Tue, 31 Oct 2023 14:15:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.143) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Tue, 31 Oct 2023 14:15:40 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 31 Oct
 2023 09:15:39 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 31 Oct
 2023 09:15:39 -0500
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Tue, 31 Oct 2023 09:15:38 -0500
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
X-Inumbo-ID: faeb790d-77f7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WcCjNDtOtPcyhDIAkOU5zot/sV8Ju2VzZyPXWA5z/mABT75A2CKbRJAgzXzoeRIi1DPmqyGXAvVCXG5ysN3bFBtJA2OrSxPhhxPu6rDLUh8pQ9vpeqgXWK/5jD56MtJ14OdBZJVXp/TP7qhy4wCEylWNMKiOTup41ZqR5OAp/oK2SI8J3YnS3WDD7W06X+80uVmPAMA6M+V2hkKrtxD2v3GKNdrzOR93X/e/cidmr85r1sm8uI6nY7/ttFRNJ228FS1QwRX8wBpaYItLVmI5xKBXS8x5m+8hD/YL/qjUcDswQ5kNixUX0qbTcxOcU86wanjwQoDsx7GECk2PMSILug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r5YoK7P1dGjRWJBXzcEWlU5MbijPE5FJf86kXvhu1m4=;
 b=mz0eRzbOECWOYIzbFcKvpLeqdJ3jfUWAzF5XvlCM3bP7ciUrq9yTH9cNVTzUa5xSdW/kpPRQSfksG2sCHMR/C2lJMy7Sm1cr+3jP+UO9MyQNH+Gj6I14TQ+zIXWda15XApoIkwYfxdfS8xYdtlAaWjcGhSpZ0nQ/xICNPtNlPOkErDE/XRUZSIRq+sOjFwTvgdOn+PRZJqs6sM5P5ZGf7XVtbOboUe4lW+WGL+ZXMscCarXEMCjEpNjfOp8W+bF3zUmzMqtSmX2+z9DQ4I93XKod4u61j9uc82J7LB9vJqkBjzlfeNOaWPaawVGRfmGV1vkBmnU/FWO2FL3CY/IdeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r5YoK7P1dGjRWJBXzcEWlU5MbijPE5FJf86kXvhu1m4=;
 b=AAdLT7iVohzh3zFWhJcsjw7f+gCa0wC2d9UWziBf8EfY1Y7R4W+i1XPgP96c86R9UiKHKgPdd/A38hTqQEG8KrO+BdPDYsAFXKTe9e/Uj/BJfmcCUh+/ehCl+Dyp53kgozpBOL6Hf5fmUbuKrb2BnERIS6rbUPeM/ESW0jo8vmA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a31ebacb-b454-4636-8d75-df85d07f3399@amd.com>
Date: Tue, 31 Oct 2023 10:15:38 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] [FUTURE] xen/arm: enable vPCI for domUs
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
References: <20231030235240.106998-1-stewart.hildebrand@amd.com>
 <20231030235240.106998-5-stewart.hildebrand@amd.com>
 <2f828bd2-e6f8-15b5-b226-33e2b33ebba8@suse.com>
 <784fa30f-cdce-4d0b-97d1-a22ac52aa8c9@xen.org>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <784fa30f-cdce-4d0b-97d1-a22ac52aa8c9@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|IA0PR12MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 04e627d5-664f-4371-c8c3-08dbda1bdccb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+C7T/RJYjS+DBtGJK5/QhThxLQHY0cDnOmSFtbn3EKSt94CIZqMcLD0pTLSTt6oWO7U646SMVgOiOqSFEVZW0uuE3Ma+oRPpaFfekNRvWQGrBnZqQ2AP713VleaUCRhPKeSMf4x+QYx10Ibl14c5dkHbvyPGRT/x6yqVnYzJPwF97IoqNLw0FeMg6cfYi8Q0VLYpsHjgpabcL3jPJWszEMd3EdRWW/qtpvm51b86RhXezUwSr2mGrUwv7zjALLDmZl3fH2sjJBGCSuyDRkoKb9JjkOTQdNmzEe5bppIfy+UwH2195yDPqacnxw4FZoCkic1/GvI2hlqiA4JK8XYDcrxQ+Yu0JRcABgjCNLcR2Sf90OIMKHfsLHELBp6ZCaxKyeqYVTvLpZE6GbyJ07ysr+v4xujLeaVEztjmonNzMU2AnafqZFkvlL3viI1P1AfyQ3Z1zGrysHaRDJEEwe6R9K0qTmvtBG17HN3jCyqt/LjvgD0nvTwSxhqbFtvCrMp6CF49IKwVP7OUqJTjnDY513oQoDQ3Mk7NZ9tqFumymUw60guHnNDrtQPQUKRMAhMsxvByYyjLf2qxNZWmbmHsu8QUBLyMKXWDJOzhGxDl2eh+kSUElTwxjsgtBDWIbFonYshm4DBcZIWepdcwu1PMaDdz2FQeLZMMU10Ai1eXIKx1xD0qE5jxNqelY31vo1yHTyMbwW9O4ISmOW4uUpKRN/ZjmS2fbjRo0AqqfLwfitvsUkgsMe/IqNUr4V0RWrKmKxiHlX3v6clHIXOtPP8LpfC8iiM3LnJNVIUigh80UQE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(230922051799003)(64100799003)(82310400011)(1800799009)(186009)(451199024)(36840700001)(40470700004)(46966006)(36756003)(86362001)(31696002)(31686004)(40460700003)(40480700001)(2906002)(478600001)(8676002)(44832011)(4326008)(41300700001)(53546011)(8936002)(54906003)(16576012)(426003)(26005)(5660300002)(47076005)(70206006)(70586007)(2616005)(110136005)(316002)(82740400003)(356005)(81166007)(336012)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 14:15:40.5434
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e627d5-664f-4371-c8c3-08dbda1bdccb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7601

On 10/31/23 09:17, Julien Grall wrote:
> Hi,
> 
> On 31/10/2023 11:03, Jan Beulich wrote:
>> On 31.10.2023 00:52, Stewart Hildebrand wrote:
>>> --- a/xen/drivers/passthrough/pci.c
>>> +++ b/xen/drivers/passthrough/pci.c
>>> @@ -1618,6 +1618,16 @@ int iommu_do_pci_domctl(
>>>           bus = PCI_BUS(machine_sbdf);
>>>           devfn = PCI_DEVFN(machine_sbdf);
>>>   +        if ( IS_ENABLED(CONFIG_ARM) &&
>>> +             !is_hardware_domain(d) &&
>>> +             !is_system_domain(d) &&
>>> +             (!IS_ENABLED(CONFIG_HAS_VPCI_GUEST_SUPPORT) || !has_vpci(d)) )
>>
>> I don't think you need the explicit ARM check; that's redundant with
>> checking !HAS_VPCI_GUEST_SUPPORT.

Currently that is true. However, this is allowing for the possibility that we eventually may want to enable PCI passthrough for PVH domU using vPCI (e.g. hyperlaunch, or eliminating qemu backend), in which case we may want to enable CONFIG_HAS_VPCI_GUEST_SUPPORT=y on x86.

>> It's also not really clear why you
>> need to check for the system domain here.

xl pci-assignable-add will assign the device to domIO, which doesn't have vPCI, but it is still a valid assignment. Perhaps an in code comment would be helpful for clarity?

> 
> I might be missing but I wouldn't expect the domain to have vPCI enabled if CONFIG_HAVE_VPCI_GUEST_SUPPORT=n. So why can't this simply be:
> 
> if ( !has_vcpi(d) )
> {
>    ...
> }

Right, the CONFIG_HAVE_VPCI_GUEST_SUPPORT check here is not strictly needed because this case is already caught by the other half of this patch in xen/arch/arm/vpci.c. This simplifies it to:

    if ( IS_ENABLED(CONFIG_ARM) &&
         !is_hardware_domain(d) &&
         !is_system_domain(d) /* !domIO */ &&
         !has_vpci(d) )

On x86, unless I misunderstood something, I think it's valid to assign PCI devices to a domU without has_vpci().

BTW, it's valid for has_vpci() to be true and CONFIG_HAVE_VPCI_GUEST_SUPPORT=n for dom0.

