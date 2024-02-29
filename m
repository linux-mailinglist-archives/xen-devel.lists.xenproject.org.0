Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F586CAE8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:04:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687148.1070118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfh0f-0002iP-Qw; Thu, 29 Feb 2024 14:03:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687148.1070118; Thu, 29 Feb 2024 14:03:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfh0f-0002fZ-O0; Thu, 29 Feb 2024 14:03:41 +0000
Received: by outflank-mailman (input) for mailman id 687148;
 Thu, 29 Feb 2024 14:03:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kRMo=KG=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rfh0e-0002eU-7c
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:03:40 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 55c2817e-d70b-11ee-afd8-a90da7624cb6;
 Thu, 29 Feb 2024 15:03:39 +0100 (CET)
Received: from CH2PR03CA0022.namprd03.prod.outlook.com (2603:10b6:610:59::32)
 by MN2PR12MB4319.namprd12.prod.outlook.com (2603:10b6:208:1dc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 14:03:35 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::6a) by CH2PR03CA0022.outlook.office365.com
 (2603:10b6:610:59::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.28 via Frontend
 Transport; Thu, 29 Feb 2024 14:03:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Thu, 29 Feb 2024 14:03:35 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 08:03:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 29 Feb
 2024 06:03:34 -0800
Received: from [172.30.63.250] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 29 Feb 2024 08:03:34 -0600
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
X-Inumbo-ID: 55c2817e-d70b-11ee-afd8-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRmk7iOfuR2wDiQuGeGvxtgSHJ4JxVRhW47EL6bgvciIDwXC4Hxy7Wip9Q+GJu83mwiD32VkuYetesYs04Xkdy9pDh28GYkXK2Q/B0j6XUZ0pwXnoyI0PYFGAA1JytmzGOXty6g5uxAvCZxcJOdW9ibnKrSy1qGFsOG6n/VVsgqdBZCTze1x/wTdUex8YnlrDuMAOXxKXA+WI+61LIn/c70xcpGo/8McPIlbCNfeNHNCCnhMQEShZ5He9Nfi+DKYUtPmnzqNzSlI6jb8VLbja8LjOFwPhUWL/bnF+hR3syXPt1aqMMkkr2UvKurkqERneDYQuXEGb1VkGCYZ8GH+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/4J5McUmXEV6SeAVg8/yzDPAv8aLMQpiOom1ClSKdag=;
 b=YxMY7tSbl7bmedebburTNXmjjKPnl6Wmsr6Zx5oI8mUL8ia5WZjpdvHGF3JiOCPtrB/Inh3mW7V49oszazLOHXEpdwt6VkvAzF8ocszEhpbTOpkq/cWKGeLdHQ0QGBoolO4d/xwoh0+sXz2S5+E27mcrue4hFLdXcI+DH/4o6iIqewCzGkDFDakG8sOYPv0z9cSPJMFHP37f0f5RmwDN0Xu1VIulzm7vUFn3T8U2gEEbPjezxHjbAgizSmLMDxjr/+4NiJZ4FzzqfmK4IVPJUg45CbBeaGPo5cM0bSYQyBRLHCO8Ptd/7CfE8BmY3XoAyq8DcOOqALi3XGl6A6i+LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/4J5McUmXEV6SeAVg8/yzDPAv8aLMQpiOom1ClSKdag=;
 b=4qVAKkvUXf4hNTZYfutMC+iWRXL2BlcPR/1brC3UWdJY7oq7UK0XPG177UySpLf8VRlt9+iviLqC+Iow7XcWl0TU4r28He2eAdsWRITCKLtZLL3DKd0I0J394ddPBLz+0YuSBQ3YnisM9H3JUWoPe1NuFUF0GNJFebE1Ky6icak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <80a5de29-0215-4100-b5a3-85ed4639f00e@amd.com>
Date: Thu, 29 Feb 2024 09:03:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pci: fix locking around vPCI removal in
 pci_remove_device()
To: Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
CC: Paul Durrant <paul@xen.org>, <xen-devel@lists.xenproject.org>
References: <20240229131525.19099-1-roger.pau@citrix.com>
 <29bebf83-a78b-440f-a642-0ec9aa40c0d7@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <29bebf83-a78b-440f-a642-0ec9aa40c0d7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|MN2PR12MB4319:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d8f64c-6ece-44d7-bc7b-08dc392f38a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kH9EJXhdtRmEnfIbvmQm0aYq53BpCv+0MAWyU+6tNL+PzdX36YHaVsIBCIq0vIkyr8tvwv3jKFZQBjYY4mW1ijXLqKwffbg9Nlswh4snf7pzhA9rktozhryFEhVQzh/Zb0H24/4cYaeniJxSnB43wHnmvgctMoMpFnhbyUMBa61ROOddN9I1P7i+DxI8FFhnmz35C06uw4E+gntc5U/TiUdpoLY8ktMF2ceFFdN41d2QdqsZ0UMdaf4AGY0eQiT84Vx3vtngGLNM3KqkMobCxQcl/R+MYtshcDJucZuah2v3g7f9cng5f9RVhlvetM/+DbNwzYdIio0KHeJX1KSCmAgKbwtad32crbcNC9yAjknP7crNHIBl1rZhgrPOxEfh69XXOx0vj1sx57vE5AmEA6an9LVMosxhKrBlpKpBoPe9rL28uz+Ca62BKT1MLCit5rKbF8Tk3h0Io1ltVRonzVR1xHJ9viZL9TvOQPuaOXSYnWHuCjk4RjKHcAhVAesIggSK2A83pCWBScsBKH1kX4zfbK2rFiL7+BDu4hI9tFjeoFAza/+UxuXgmKlM1pULUMsSDGs1EvIZRBpqxvxEi4uSW2afYOBITZsHsIzp7xmigAnfIqCKVlJmHHaNbJCa9zSxuDT9VCfdXik5C7nx0Wh48Oxb9txWDlwvqEEGDmFKFA2yiNdDZz3ZNswcrEGPUmFa3+RZIvsCnHnlhjZBG4ZahyNM1HA36Xcj/g9Td6mIYk1TS1nxw7KhhrT+vH0z
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 14:03:35.5421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d8f64c-6ece-44d7-bc7b-08dc392f38a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4319

On 2/29/24 08:23, Jan Beulich wrote:
> On 29.02.2024 14:15, Roger Pau Monne wrote:
>> Currently vpci_deassign_device() is called without holding the per-domain
>> pci_lock in pci_remove_device(), which leads to:
>>
>> Assertion 'rw_is_write_locked(&pdev->domain->pci_lock)' failed at ../drivers/vpci/vpci.c:47
>> [...]
>> Xen call trace:
>>    [<ffff82d040260eac>] R vpci_deassign_device+0x10d/0x1b9
>>    [<ffff82d04027932f>] S pci_remove_device+0x2b1/0x380
>>    [<ffff82d040260bd0>] F pci_physdev_op+0x197/0x19e
>>    [<ffff82d04032272d>] F do_physdev_op+0x342/0x12aa
>>    [<ffff82d0402f067a>] F pv_hypercall+0x58e/0x62b
>>    [<ffff82d0402012ba>] F lstar_enter+0x13a/0x140
>>
>> Move the existing block that removes the device from the domain pdev_list ahead
>> and also issue the call to vpci_deassign_device() there.  It's fine to remove
>> the device from the domain list of assigned devices, as further functions only
>> care that the pdev domain field is correctly set to the owner of the device
>> about to be removed.
>>
>> Moving the vpci_deassign_device() past the pci_cleanup_msi() call can be
>> dangerous, as doing the MSI cleanup ahead of having removed the vPCI handlers
>> could lead to stale data in vPCI MSI(-X) internal structures.
>>
>> Fixes: 4f78438b45e2 ('vpci: use per-domain PCI lock to protect vpci structure')
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Thanks

