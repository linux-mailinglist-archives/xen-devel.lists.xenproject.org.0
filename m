Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2628B7F7483
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 14:04:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640679.999255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VrS-0000W9-7a; Fri, 24 Nov 2023 13:04:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640679.999255; Fri, 24 Nov 2023 13:04:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6VrS-0000TJ-3L; Fri, 24 Nov 2023 13:04:46 +0000
Received: by outflank-mailman (input) for mailman id 640679;
 Fri, 24 Nov 2023 13:04:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u6gD=HF=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r6VrQ-0000T4-WD
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 13:04:45 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 08138c1d-8aca-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 14:04:43 +0100 (CET)
Received: from DS7PR03CA0057.namprd03.prod.outlook.com (2603:10b6:5:3b5::32)
 by BY5PR12MB4113.namprd12.prod.outlook.com (2603:10b6:a03:207::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.22; Fri, 24 Nov
 2023 13:04:39 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::43) by DS7PR03CA0057.outlook.office365.com
 (2603:10b6:5:3b5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.20 via Frontend
 Transport; Fri, 24 Nov 2023 13:04:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Fri, 24 Nov 2023 13:04:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 24 Nov
 2023 07:04:38 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Fri, 24 Nov 2023 07:04:36 -0600
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
X-Inumbo-ID: 08138c1d-8aca-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KS4QuOHpHERfAIz1gTwYY9OLGDOzZnOuFdBKav2iEYWTUhi3Mh9vTMbV22RiPLU5RSmXYRuJsZ5sQw6aYBKafPxXzYMbrE9itkB42oLt3kyuj+UQzo/Q1pMv0kj9eNJhShCBuiTx380R/Baq13A5yUrSa4Au7F3RPLcbW/wXdV26DPbUhPL3e8LuEQ5pLVgaVABv3hrnE7B1kS8t9zQr1dYwyjoCs3/rZqvQWpgZWd7ebEi2V7kgM0LCDxBfL8bHcpRGtvJBozCE8xRKt57hrdg6CfId8GcGZCnVszYDTreDBxqgpXb3gkNE0mrX5/MTl6oL9txj2kFaoAbEDfpPvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f6yHv2FbX5bmSiHz9aprPTQAUGyPsfIp5cb1QNJOO3o=;
 b=fwmpAQAQGg/LYsh+8WkOXofrXlIHdzr8kTKGgRu8kKxHcTzhkbpESYppdFNtlsSmZc2V/LuV2dgKjraJH068VlaNd9kxxCAtpPjoK6DfT56i3wHl2fRIPhCMn3k1c8W3JrGEj3WNP8Kod8js8ertNG2lzlHHtnrT5id5IT3rEmnFNCZU18+Yni1lTZz9AXRJ+N4C66yFBLbJUS1SFhHamWEy2hosoncmXUkZ8tWCUAwMRW2XiCueJSldQuKzjraA5psN6HwwVdu1Atd2XIbcgxb4hMZAXDZZhQP2qIdCI8FDEJ/ByPSmkFx2s0gDI1645XwqsTiyeG6X9BCCv+xEHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f6yHv2FbX5bmSiHz9aprPTQAUGyPsfIp5cb1QNJOO3o=;
 b=fhwOK/NTHzW2XmumDkDJHmuH84/qammOLWnbjKCA+j4j5YrOrP9U8WT1ygpYF2Oru5AkTxyR5YgqnK9F0RNjH9+MMkJoXQhhLItWBSva1sgF8hGI7d/FDtycyVhFE791V7L45iSnMMKZMjB0/OHVh0y6OdNr3gMCYkNZc9fZjls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <14c1f186-bbe9-4a66-b6ad-e89d85fef8ae@amd.com>
Date: Fri, 24 Nov 2023 14:04:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] xen/asm-generic: introduce stub header softirq.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Shawn Anastasio
	<sanastasio@raptorengineering.com>
References: <cover.1700221559.git.oleksii.kurochko@gmail.com>
 <8b1969350a4f05758969058d47ac3ec10d80db50.1700221559.git.oleksii.kurochko@gmail.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <8b1969350a4f05758969058d47ac3ec10d80db50.1700221559.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|BY5PR12MB4113:EE_
X-MS-Office365-Filtering-Correlation-Id: dfd56358-0c2b-4d25-2f24-08dbecedea86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xZsnWz2hwnrgJqIbQzTYtXZDrGfFroIK3l6wbXabIHy5wo295BXYWbhsHdtcSKfSclVAFAA7lrE4qd2v49rb0pcSUhJL5GRDKS8p2nYBuHlQ7A6cEWNNc2U87hme5IRKdz7O57dQO3Fau/ZbJSgATuTuDrM1gHKD3cIwqMBt+bSOrvo5KwpYA3IUnSp/Y8QITPzj8SbgdX/ztav5+un98s7jwsB53yjDBFkUl+9PO4VkXleFGiuZW95nB1b7lfi5ohpJSV0/i+nnZbzsB8KTLaJiXz+haUxXuPmp0cHbhlXS/J/mcfB3U4sRKc9r2sD2oNjGqEHpmVhPPy6XFOflQl0qusxf2CaVRQFXuqK5gMd8twcU8/9DoJB8gQuozHVTTCzzLM73m3jFWWTIG/9yG6OCNTb86IrhvICPeO3o7jLmY5qVAJLg0/jGGs5AW2VcPHZu7tqEoK4SxL/se1F2DeWzU9NDcG9hbhdHvQPny+ldtzuO/cFoKOgZMCWcNUNcEyWFheZnu6NbyHeBMkkgus/806V+JoJ81wgkednOtYR98nzm74NtWLeNjdMmzSOCR565puFO1Mz3/HAoKSf+PU0HB2R3W9K47CJlk/brdBX8eNmKg8jaQaw3ZvYY+Tsl93AL57/vMFOIjbIypbASGud0+mi2/k9YI/PZLmbyJeafh0Q5rgoHGJ8OhQrpqCmFNXxx9iT/dakcljwOUYVwOnHw//JNBAyqEpecCMeQEUXBhWc55UBxfTNoKmC/t0ypTSGrq3XVVWZUR98B77R0Hd6RSzAZj7twrfW7D0AXw3cjPF2b/I3bxMXmBvk3gwFOUU0RLiPun/ES0C7goVIGPw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39850400004)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(46966006)(40470700004)(36840700001)(558084003)(110136005)(70206006)(70586007)(54906003)(16576012)(316002)(478600001)(40460700003)(7416002)(5660300002)(86362001)(2906002)(4326008)(8676002)(8936002)(31696002)(44832011)(82740400003)(81166007)(356005)(47076005)(426003)(336012)(26005)(31686004)(36756003)(36860700001)(41300700001)(40480700001)(2616005)(53546011)(41533002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2023 13:04:38.8186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd56358-0c2b-4d25-2f24-08dbecedea86
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4113

Hi,

On 17/11/2023 13:24, Oleksii Kurochko wrote:
> 
> 
> <asm/softirq.h> is common between Arm, PPC and RISC-V so it is
> moved to asm-generic.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


