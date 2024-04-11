Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01C08A15A0
	for <lists+xen-devel@lfdr.de>; Thu, 11 Apr 2024 15:34:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.703946.1099971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruuYn-0004jm-DH; Thu, 11 Apr 2024 13:33:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 703946.1099971; Thu, 11 Apr 2024 13:33:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruuYn-0004i3-Ak; Thu, 11 Apr 2024 13:33:49 +0000
Received: by outflank-mailman (input) for mailman id 703946;
 Thu, 11 Apr 2024 13:33:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1M6P=LQ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ruuYm-0004hx-8P
 for xen-devel@lists.xenproject.org; Thu, 11 Apr 2024 13:33:48 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2417::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e8b7ee0-f808-11ee-94a3-07e782e9044d;
 Thu, 11 Apr 2024 15:33:46 +0200 (CEST)
Received: from BN9PR03CA0795.namprd03.prod.outlook.com (2603:10b6:408:13f::20)
 by DS7PR12MB5816.namprd12.prod.outlook.com (2603:10b6:8:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.53; Thu, 11 Apr
 2024 13:33:41 +0000
Received: from BN3PEPF0000B06B.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::79) by BN9PR03CA0795.outlook.office365.com
 (2603:10b6:408:13f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.21 via Frontend
 Transport; Thu, 11 Apr 2024 13:33:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06B.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7495.0 via Frontend Transport; Thu, 11 Apr 2024 13:33:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 08:33:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 11 Apr
 2024 06:33:40 -0700
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 11 Apr 2024 08:33:38 -0500
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
X-Inumbo-ID: 1e8b7ee0-f808-11ee-94a3-07e782e9044d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lb1c0/u2hv4+RsgESUIAqo5o1XbGxR3Llbbm75Gl626q4+nhKA7AjSzGxt/QZt5yPf5GfcjC07oHp4w9IInrZ8YwMao+bfLOcDii+Lxf9tDnxs3c1rsSOfJYRP5pV7tdJwhoChvtpTejlwnMXCCAHRdeRwXlrDi2uD+dUYU7AgIk3VTokjIRzKWIYXcO5G3wag5CQbnsdOvVMvAfgDd8Oj6ca3b2BJlZj5Yc+/LYMsyXNCUvfjv5uvgBTExMEqsAN13nGE5/rH9nefbaQXVgg9yOS5olqpcHe55nepJ/mNC4IMUp+wOBsd61xUmOKiicWht8GhgMNZUKWqRJOMAwJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLZfrGIJBUtElR6uQavfhF/pzO2vpb6tUTF3vAKf8GM=;
 b=HWH3tUJokhGOeMmCmd9/HtW6gG95e1v4G6sBgDsclSIR/Pms8pEaik1S9+1Vd9azE7FTuSfMaF1FFOPIkYlvxJkSldN+J1Z2jdkXB1jhvegrTO0hrRdUBQqcy6b3wZBA9091G5jrr8YxHcn17XPGQgzmL8yt36IhSblMyuweBfABQVPLQk6+JFlfkJqvQftOKKRvc43/NJGNOonWrj5VVBmEEPUd8Y6ztBjxjwLX1P4pZxvRQ75d1CBzDavjXZgIcvNS1mnSxlZvH/+nG4U+EoPHDPDZra3JWxWLpuFfC+1qefzHdYH8o0QZyRsXh96zs4lsBT+7l0F60zs4mGDpwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLZfrGIJBUtElR6uQavfhF/pzO2vpb6tUTF3vAKf8GM=;
 b=WXGEbq87wNLWqRUOFhOE44NPIqPEaNZjZjyLcRyz45eC1+fWWB3aUWcpjXBfigE52mot0jRTL6d+uMLq9IlBwBgMaY0v9UM/f33MRN33q6hGFtCdezeT6Zvnwm4k7UnwI3HptBGT7sUt8lcoNsGRHCo13DN9zA46WY/g80LeZU0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <d57ea031-6fc0-405f-b431-a217e16c2e6a@amd.com>
Date: Thu, 11 Apr 2024 15:33:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/include: move definition of ASM_INT() to
 xen/linkage.h
To: Juergen Gross <jgross@suse.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>
References: <20240403120323.18433-1-jgross@suse.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240403120323.18433-1-jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06B:EE_|DS7PR12MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 03686b8d-2413-438d-6d9e-08dc5a2c0045
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cMTRH/5y1eGJsLGCW8bfBDKQ0P16TrNkXTL4TmxmkUmc7NSA68/ZmE+ajLIf2kBy6J5q6qt+N0uS8Q6qGL3lOUifXlDteDxVh0yJqPUj1s8Av6YnvkWjf3otHm94uP+vw9He2RbYMtweT38n7QLg1DybsRlexoR9cwviHDPJLE7H8oTn++LdwziLve1oNHpwC7YSjzO4s9dyapRBoZbI5FUK2b7FDQiLspdmxoTu/Djk4IHlpXOpKiWuVCGgMiir/O7yzZb5NoH7tkH4hzNJfN2SajZAjNQqQQpDQbkkBsSwkpasS/MAjpvo/z5MZaVGzPvajBeOtlmTV9Fq4rRG0O6/UKboxo9QHjz5zAHs1JJnhDdcysChCyugXXNHjpIfXiOL+loR4W4LCU3X3eJ/WgRrzt5i/F/1u0dUgrX6oGkyOgenF96zctH9T/AbJ9E/9x9TBOiUqwjTBTqinq4ZPOt2PVcDFCGxrqyoU68rG84jxwHVH7Czz4cxd/Jc8GD9XHtUDOnnAtss46PYPgsWhZbc6f5/2UVUWkwcVSdZ3WrF8GYYARDUR3/91iFTTPuxA/IQs/fOYS2HZuyizqvguIwWfEo1YGIvDUpl08K1Rsj4czoKJaNXd+FRZQKVrwFV8gadSiaNOZH56lnKWvZTkhKOvDe6LAsUe4akl/ACgnVp/rb861UAjo9+sXfaBPx4ZEl+VRLSoDBJ+b5JCC8T17m1FIHZv++vcZjTyhpsI56G+QRWo0hnUw+Pcf4/jZju
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(7416005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2024 13:33:40.9066
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03686b8d-2413-438d-6d9e-08dc5a2c0045
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06B.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5816



On 03/04/2024 14:03, Juergen Gross wrote:
> 
> 
> ASM_INT() is defined in arch/[arm|x86]/include/asm/asm_defns.h in
> exactly the same way. Instead of replicating this definition for riscv
> and ppc, move it to include/xen/linkage.h, where other arch agnostic
> definitions for assembler code are living already.
> 
> Adapt the generation of assembler sources via tools/binfile to include
> the new home of ASM_INT().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


