Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF427DA79C
	for <lists+xen-devel@lfdr.de>; Sat, 28 Oct 2023 16:55:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624761.973388 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwkhd-0000d2-ME; Sat, 28 Oct 2023 14:54:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624761.973388; Sat, 28 Oct 2023 14:54:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwkhd-0000ad-JW; Sat, 28 Oct 2023 14:54:17 +0000
Received: by outflank-mailman (input) for mailman id 624761;
 Sat, 28 Oct 2023 14:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IE94=GK=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qwkhb-0000aC-QQ
 for xen-devel@lists.xenproject.org; Sat, 28 Oct 2023 14:54:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9ecd789-75a1-11ee-9b0e-b553b5be7939;
 Sat, 28 Oct 2023 16:54:11 +0200 (CEST)
Received: from BLAPR03CA0079.namprd03.prod.outlook.com (2603:10b6:208:329::24)
 by CY8PR12MB8363.namprd12.prod.outlook.com (2603:10b6:930:7a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Sat, 28 Oct
 2023 14:54:08 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::5) by BLAPR03CA0079.outlook.office365.com
 (2603:10b6:208:329::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.26 via Frontend
 Transport; Sat, 28 Oct 2023 14:54:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Sat, 28 Oct 2023 14:54:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sat, 28 Oct
 2023 09:54:07 -0500
Received: from [172.28.214.164] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Sat, 28 Oct 2023 09:54:05 -0500
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
X-Inumbo-ID: d9ecd789-75a1-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3dwHQLkhzxTqM6Pn3CM1dshSUkZeeLm2MmLaxuaWKUAem3vgfFZbOI+THfKayAuRnGIxQy3wyQERXllu29wHnN3yBzSd6fovlZe27PLScAayf9/FWWLSHvMg33dtaIGpTpmVT5+N1JC/6XBteTJjVLCwGJ6/tXZ2jbSVOcGDC1mIgUxhlCzUws0Z8IrJq202WYHwoggKzxpmuMsPjdVpfwa9zlVV00aJOvDG1z8m0X+aSZrQ5PCBrjjq76o8FIdzo6iUIfASUJlTGo0MjM3/Kchof4gTgVVPu2MoSExtfynaO3y2J9Km5qlM4go85uKJWyzQ/ItVAfrjNQj385Ucw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZC3B/ZD83xXgRJuYAFVx9TYHCGNdgcnn/fu4C3+kc3o=;
 b=SEtuIJf5iIG3McSSwNdKSNTAWBiPpHBaeZKk7ITu0cE8WETYBkAsNvbYIbUABxPD3UlWCOVkShoNXJQDDnOCUXaFfhf36yIonCgd7Fv880abpSXGfPTQn5mo58YDZXsA+DMV1EvJ79M/AFKBCDga49c/xg3FyqCMcG7HKBfBnQC3gdJcO2F8l/HtouAGNCzWnwx9o53tfiUNq8P+pzy4FyYX+rygXIMV9kxchOtCi46OhCResDkS3aFxXA/Rq5BhsQCmaKAy3yTH5r/E7YqZuec+TV0mODy6HqULsAxStFVf7C8DMtpqKmcd9DvWLgzcNpQ180FvzpDUYfhvZsRKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZC3B/ZD83xXgRJuYAFVx9TYHCGNdgcnn/fu4C3+kc3o=;
 b=5ujf4vo06bamaN8GR7GVB24oxrLzbsTz6jw036h6UOG161/CHPk9urFaBpy4QbSEoQhZmja0nh6arSdByUsyuMJny57ziHwu1F79xC+TjHGH+JlUsQS7P/+tGWJ+EzbAgjlgxfSBvkylKGo5hsvSGUJXfcI9CPrOAWKHIJI6/ZA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <23a1f0f2-dd1d-4040-be19-41b6e5e53e20@amd.com>
Date: Sat, 28 Oct 2023 10:54:04 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] [FUTURE] xen/arm: enable vPCI for domUs
To: Anthony PERARD <anthony.perard@citrix.com>
CC: <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Juergen Gross
	<jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231009195747.889326-1-stewart.hildebrand@amd.com>
 <20231009195747.889326-6-stewart.hildebrand@amd.com>
 <3e1d47e7-4f69-4402-9136-1dee0511915f@perard>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <3e1d47e7-4f69-4402-9136-1dee0511915f@perard>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|CY8PR12MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: ee25fcd8-6918-423d-1b68-08dbd7c5bc95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yLpTzAKJiZIgE+xs75TKBU8s9eQ8V40kAlCWo1+nKNWqhM0D6ehPRjA/bflTSoWyLJmDQlfFCrtep6srxVZ/J3/JtHJ7lRPxwxhNCSmP91VxKxvW4my+ke7BXeG2oiR56fp3RTgiTrq2GqvIa2rtK2iFTfYSou67cc9A5AzdbC3ZDQbnI+t/mwtHjPwY7zfI5ECAYkag67Bh3wpl3YMlYVs5/1V7ZbJxdG5904FSlGsK6aKOyiviPohOFImGqBn7U2tzGd8JpjDrQjfXCeadCW1qEk2FpdA3iSWWpS8qHZdcSHHcv8lkDH4Pjbs4Om07Z+EePNL1Dkx2+kPrpdtC+xwdaN5UC4kwbaI2GwWXZCtDCYnlEeJzDFgnOzs/RMwNllhoeZkIK60GzfaiRMuGnQopylo7vlbH91leW8hJn0gLWG7qjyNI+VR6LM3acMU2PLr5g4/+4I5yFLJZhoQ2dNR1IP3dYannJS2Nz5PNTF9zwEz6gDz9tELMqQOM4SZpP5rT04A1Sz9QsCVPv6bZlImGQPqDWJidazIHYvZj6L81qM+Qq3tq09YDKX6D8bgcJ8om1mHTkJ7YNyXY7Ylo3eKBrLJ4QGD7ZN7srEW4W8Z0J1dc3YfXwDSiW7Oypq9EmdtOq03QRon9eO6+E0my08VzxYySowO50CL4Djrs/E48oXtZ8TP5D5tysNzQ8/fqa+eHkQIGDDVSpBwAZ7l8K8gMzdH8IP2MrSZLE+Q2i0nI1p76M650VimuSgB8ADdAelo6R7jqtJDgePpE7gd7QHTSFpDkYxHBV/z8KaVLTvs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(376002)(396003)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(46966006)(40470700004)(36840700001)(5660300002)(31696002)(8936002)(4326008)(36756003)(8676002)(86362001)(44832011)(41300700001)(40480700001)(40460700003)(2906002)(53546011)(2616005)(336012)(26005)(426003)(966005)(83380400001)(478600001)(356005)(81166007)(31686004)(82740400003)(47076005)(36860700001)(70586007)(70206006)(316002)(54906003)(16576012)(6916009)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2023 14:54:07.5006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee25fcd8-6918-423d-1b68-08dbd7c5bc95
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8363

On 10/23/23 06:27, Anthony PERARD wrote:
> On Mon, Oct 09, 2023 at 03:57:44PM -0400, Stewart Hildebrand wrote:
>> Select HAS_VPCI_GUEST_SUPPORT in Kconfig for enabling vPCI in domUs.
>>
>> Set the pci flags in xen_arch_domainconfig to enable vPCI if a pci device has
>> been specified in the xl domain config file.
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>> ---
>> As the tag implies, this patch is not intended to be merged (yet).
>>
>> Note that CONFIG_HAS_VPCI_GUEST_SUPPORT is not currently used in the upstream
>> code base. It will be used by the vPCI series [1]. This patch is intended to be
>> merged as part of the vPCI series. I'll coordinate with Volodymyr to include
>> this in the vPCI series or resend afterwards. Meanwhile, I'll include it here
>> until the Kconfig and xen_arch_domainconfig prerequisites have been committed.
>>
>> v2->v3:
>> * set pci flags in toolstack
>>
>> v1->v2:
>> * new patch
>>
>> [1] https://lists.xenproject.org/archives/html/xen-devel/2023-08/msg02361.html
>> ---
>>  tools/libs/light/libxl_arm.c | 3 +++
>>  xen/arch/arm/Kconfig         | 1 +
> 
> Can we have two different patch? One for the hypervisor, one for the
> tools.

Yes.

> Or does the both depends on each other, somehow?

They will both be needed for enabling vPCI in a domU on ARM with assigned PCI device(s).

> 
> Is guest creation going to fails if we set XEN_DOMCTL_CONFIG_PCI_VPCI
> without HAS_VPCI_GUEST_SUPPORT ?

No, currently the guest will still run, it just won't be able to probe any assigned PCI devices.

> 
> Is the guest is going to fail to run, or fail at creation if the
> hypervisor HAS_VPCI_GUEST_SUPPORT, but we didn't set
> XEN_DOMCTL_CONFIG_PCI_VPCI?

Assuming num_pcidevs > 0, the guest will be created but fail to boot as it will try to access the vPCI configuration space, but it will trap and panic.

In both cases, I think I can do more on the hypervisor side to check for an invalid configuration and refuse the domain creation with a helpful error message.

In either case, if a user does not try to assign a PCI device (i.e. num_pcidevs == 0), then the guest will run fine.

> 
> Thanks,
> 
> --
> Anthony PERARD

