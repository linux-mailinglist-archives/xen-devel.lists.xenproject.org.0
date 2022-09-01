Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 182AE5A996E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 15:53:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396645.636869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkdV-0000g4-2r; Thu, 01 Sep 2022 13:53:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396645.636869; Thu, 01 Sep 2022 13:53:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTkdU-0000dg-VF; Thu, 01 Sep 2022 13:53:36 +0000
Received: by outflank-mailman (input) for mailman id 396645;
 Thu, 01 Sep 2022 13:53:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sEHC=ZE=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oTkdT-0000dD-8e
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 13:53:35 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75d90ecc-29fd-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 15:53:32 +0200 (CEST)
Received: from MW4PR02CA0030.namprd02.prod.outlook.com (2603:10b6:303:16d::18)
 by DM4PR12MB6423.namprd12.prod.outlook.com (2603:10b6:8:bd::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.11; Thu, 1 Sep 2022 13:53:28 +0000
Received: from CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::50) by MW4PR02CA0030.outlook.office365.com
 (2603:10b6:303:16d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Thu, 1 Sep 2022 13:53:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT097.mail.protection.outlook.com (10.13.175.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Thu, 1 Sep 2022 13:53:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 1 Sep
 2022 08:53:26 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 1 Sep 2022 08:53:25 -0500
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
X-Inumbo-ID: 75d90ecc-29fd-11ed-82f2-63bd783d45fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J8MJ86/FeVl114m7dcXVLhLkwWvMY4LKxeVOHfMnanvumXXgwxxp8diOVWQEW5Mok/hz7dgSa1Hp2TXd/YHN31oStSeoMfAabghEuSFYQ1mOjtxnGZWUDbz5l7Ea53lCkuYAvC0zvFmcfqEyZQCVps//vnm616bSNTYBc/ZHyahR9VE6tApkSIRioBucqz7pUk1MNhMadtrUBWEtQhCFSeG3QxNScSw6rjGqRqIpAQCn+7hVLD0tbrqKanUP4uTTgJsPCtevBkORJe+56vrtOdcs2aXcJhi3FafJkgukS9JsFCk43LAnqyNZZQqrvgHb2xKDICLL4jHAZoQ8sniR0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lx3tJ9cpj9Ag3aU8VPbTK8ECXjkWWHeQ09wBQmrRHSI=;
 b=MsgNluJIU1dTuIWqAGZbpujmGGx9ZB3QU8DJUKt91PrLTZEY4RTFe/VKnLu8c/suGQI4oGJrIIi6tMjtoWz77sumSgpHw9kGd/WUswngi1fP5QEvWkfxAJ6Kr9NRfA5wWJ8sCdperJ+x1dmx4fFV9xLDhyqTsmVgOcIhxvmVyvy+DnQi6WF46cm+bFnhhovPZ1LLiTyW6SIS4Ce3CYuUCOJD58AvHaIATJKNsuwkifQkKv4IDpi17xmxhdgleXspsx9d8hgCQVxDmcmBMIOC89qgXIdWqtXkP5qUZ/T6+so78rSgfgJbrDMju5uKcm4INDCN7htfDVnh+fk3Q6/pBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lx3tJ9cpj9Ag3aU8VPbTK8ECXjkWWHeQ09wBQmrRHSI=;
 b=mRL1XhVedzFXSm01K/Iu2fG+2chdKT0yJjr//qW85CK3s9/TbNIdRKXKotyd6bxchefJpXmx1oqqM/okUk/cdqqRv2mQhojDj7MtsUwx+zOgG6HVueIp8rfjXzCuDAv8a6TlMnoBDb83lqpbYvB3DMaGXPxHV8Dl3LlemHOu3Wc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <99eff10e-6b7b-df74-5017-7628c0b0bd7a@amd.com>
Date: Thu, 1 Sep 2022 15:53:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 3/7] xen/evtchn: restrict the maximum number of evtchn
 supported for domUs
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, <xen-devel@lists.xenproject.org>
CC: <bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662023183.git.rahul.singh@arm.com>
 <4ae16201df27aee274a3d740128812b118c252b3.1662023183.git.rahul.singh@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4ae16201df27aee274a3d740128812b118c252b3.1662023183.git.rahul.singh@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d57e5a0-dccb-4e7d-cb0a-08da8c215907
X-MS-TrafficTypeDiagnostic: DM4PR12MB6423:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MDZNAxiP07mrRREXOJoOI2C5GSwVrMwsxq1TxQZjUiFebAvVQRN7NZpt/GuYy97RhxRz8NC38e39W9UMIb5s1DtOdwaI6KLWd4YLF6xmFKKMIpfGmBw1A1rJbzN8AXaIN18an7E0uOUSzVN2UJ6gZ+wNNrLNFTQR0sxKd8aKq7FOApNFW0czedMBKji/QL8nCKSRvjeJjKlFgATXnYZMWZDEUGy/ulgmEKdfbWDa6J7SrJWG/Y8bonuEL/LZwd4H5olfySNhJgwxOvYK+pTMTiQk2jeDVYPFAmbySUfXJGnmnS7sR2954qBggYtbtEvMjxzgAs7jLf23oxVU10Wqb4f6ubyER+/nOFRAS/uNIIaQeWS03RwQIdo2025ym3uoALQZjehHbaqpRz5g+xvngM2F0A/uSwgUlosV+nOKO41s/PiMK7ES7PIPz8Q46K/8jZQhH8DUImsssenaw9GJ3JcmDZO4f2DVnDNxijoqYLg1Ah9Sy8Hg+1Q8vQy1wJhrge7UE5h94M5T7M867o14Pra8j7zJZJ4Dal0+8TWqzDFvSn4AtN/OJcNz/yPiuGEzdHiRleLOSO/ABaYUnN3Y0zImDGIrqZKMzaKYpyeZiGRbQ3gOk+dHl7mT3rzO/bA1mnZMMbkMJ/n0bQBj58wZD6mI/QDfSXo/GpJPmjD9pOTHss50A3k7C4ADyRPgWeYczuNQ4HGEsx0h47yRO5WLaKXg0Q8NW2P2824QfazS9lrYkRj4nYThgCxapeY4yZPnaQG5oygxvX8h3KH2ayQVEBSAdySXdmzyp0a7wjYyZDouLrIz3ro+l7tvg1a3t4wzMOsVzZ+nE6aDYStAhE1epA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(136003)(39860400002)(36840700001)(40470700004)(46966006)(82310400005)(40480700001)(82740400003)(16576012)(110136005)(316002)(4326008)(8676002)(478600001)(70206006)(70586007)(36756003)(54906003)(31686004)(4744005)(8936002)(336012)(5660300002)(41300700001)(44832011)(31696002)(86362001)(2616005)(356005)(186003)(47076005)(426003)(40460700003)(81166007)(36860700001)(26005)(2906002)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2022 13:53:28.0120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d57e5a0-dccb-4e7d-cb0a-08da8c215907
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT097.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6423

Hi Rahul,

On 01/09/2022 11:13, Rahul Singh wrote:
> 
> Restrict the maximum number of evtchn supported for domUs to avoid
> allocating a large amount of memory in Xen.
> 
> Set the default value of max_evtchn_port to 1023. The value of 1023
> should be sufficient for domUs guests because on ARM we don't bind
> physical interrupts to event channels. The only use of the evtchn port
> is inter-domain communications.
Following the previous discussion, I think the only missing piece is
an explanation that 1023 was chose to follow the default behavior of libxl.

Apart from that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

