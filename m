Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBC8A8323
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 14:27:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707459.1105387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4N3-00059O-Cw; Wed, 17 Apr 2024 12:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707459.1105387; Wed, 17 Apr 2024 12:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx4N3-000573-AM; Wed, 17 Apr 2024 12:26:37 +0000
Received: by outflank-mailman (input) for mailman id 707459;
 Wed, 17 Apr 2024 12:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R6tE=LW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rx4N2-00056x-HA
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 12:26:36 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20601.outbound.protection.outlook.com
 [2a01:111:f403:2407::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba9b0c7a-fcb5-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 14:26:35 +0200 (CEST)
Received: from PH1PEPF000132F1.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::34)
 by PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.54; Wed, 17 Apr
 2024 12:26:31 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2a01:111:f403:f912::) by PH1PEPF000132F1.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Wed, 17 Apr 2024 12:26:31 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.206) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 17 Apr 2024 12:26:31 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 17 Apr
 2024 07:26:30 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 17 Apr 2024 07:26:29 -0500
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
X-Inumbo-ID: ba9b0c7a-fcb5-11ee-b909-491648fe20b8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWv2wtK8Pk4jZCWz/aooVgo/RU2hmEt7vJxWjyWmT4tNWgmZvfOHE6Hqaejl/KoGc+tyo9CIetgYQsynZSASQYwfsD6TgJVg1EdlovXnYIixIT3T54Z0+mSwOr/UMeE3LuFdX4TsmXfASa6YaH4TGUciffj2/EzovCIh5crS4mkN+8nKPIUKWsKlLL59pt6tFJ8PJfXicEty9vvwXxMMQ+O/qU5MBX8ovxwLqD2f0fz3MuQuLGlz7kM2HHQadps1rE0kGIhrpiVlpox2c0Sz7kEqKoA2J/LTFCR88PnwUK0f2PAHgf09TuK4DG10lEYb0ClTzu4mWvJ9+IJFtYnwVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVNZGxRMNj9pOBLe90Vkr1scHYK/sfyg9wLGMccFcrE=;
 b=Ya84pg+G8e4SVaGP/jwaWSeYtX35dN2WZBNyCvYVJhr1M9wee1sSGYPZTxDwt77dU/2C+nLWSXHwuI96eZlyfS0X+rgZudWEExqTdQ6PJj2CEmZPaz+gZrLL4UBA51ipS8h5pGlSJ04RAh4TxHxhZ456o3RET1Vnkjk/yuSBpx6LIiKpkCLE3yMpG+2qBT4ui5wvUX0v4om269WnPGZLmCRo/YyuLavVqekOmP7ap0QMT29JJe4nyJF7GFs/uvkOQ0Fghz9/Ag0VLGEObaDfLo0D9+B780n+p8UHyVg+ekRSa50whdMHDP6bfo9sw+ObVPP+WlQ5e2y58+2T5yG3aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVNZGxRMNj9pOBLe90Vkr1scHYK/sfyg9wLGMccFcrE=;
 b=U2Myz0GTi05QvLFJjEkWJMKUPmjMAix+72PuKbjr059yNLxPHVtniIxrMBsbbD26OPMmmB1WJS8nimIHKdYswLI+0G4O85w5XCKoRleO1LEjb9fqCez9uQXREzK4WIs5biSERgz40mKU9bHJIf6QEIYVKuTifv5wmKd5JaagjJE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2c450a07-59dc-458d-bfdd-e0ca5cba4114@amd.com>
Date: Wed, 17 Apr 2024 14:26:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [ImageBuilder 1/5] uboot-script-gen: Update to deal with uImage
 which is not executable
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>
References: <20240417120741.2453431-1-olekstysh@gmail.com>
 <20240417120741.2453431-2-olekstysh@gmail.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240417120741.2453431-2-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|PH8PR12MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b3a531b-a2f2-4036-43bc-08dc5ed99ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZsNzk9sLgbLilfQI8Hu6aU1nU9krtfDSdvB96raI0fr/iGlpYh4ozsDGWYnX2VxdZO1Zcy5kwnbqaRTBMAJBylAJPQqy9rMJxB9BQGl7z0bmjQzDbQUB4eDP5ZR4ecaJNVTBaihYF/DFucnfRim1EwVe8znXaUwXzPA+tgFNoDLaUKD8nRyC9Knbb3uVQGI+aKmnxLfleAtimcw1ca2bj/VQ9j8a6V/FscM4q6D1GN1/FzV0LIAf5E3iiW49+DozvA+TXOqCJaQh94kI161GEPr7g9BbmOErouRFf5T96vUmjyJq5Nks7Wj6pqgDiINHwqAnupYkxtWs9lgUQv3nMOFHzrMJy29NndA+P9D9ukAnYiUhdWN0xiwzBvHRtrxf+8tXymhvo1N8gpfLpon23j2Icwyt8i0myjBNeSNOyaJ3Ucu6utD8AHOzoLDIrx5cn+VpoxHU2Ihf1NNXOBpqEvHVFcd9mM64O1GGwyp2yjotFZqVxIcpaQeq2MSo5SsdoQJ6esSIc662BSHnow8+Pr4YCU2cRLF3OyeR7T0q5XWwwG+WRx5cCNo1RRN3suQ6bRY2/Qt2kG/p8LN+FfrZmZADWeYZ/YfEBE+qDBAZ0mlF3rlZ296aV9Hkhmox1dQs9wf91eC3uvoDkrfow28Y0UWo9bYN+FA4BGF7jL94IDOwyicpD6MDWcUiKcgwy/Yp2oKTrmgLdaR37b1OdgTyNxUpfxwvMaavJre2wwSHV9stnOB5ommG0Ifd6sRPyXmG
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 12:26:31.1924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b3a531b-a2f2-4036-43bc-08dc5ed99ce6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7277



On 17/04/2024 14:07, Oleksandr Tyshchenko wrote:
> 
> 
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> uImage is the Image that has a U-Boot wrapper, it doesn't contain
> "executable" string which subsequent "file" command is looking for
> when inspecting it.
> 
> Below the proof:
> 
> otyshchenko@EPUAKYIW03DD:~/work/xen_tests/input$ file -L binaries/uImage.gz
> binaries/uImage.gz: u-boot legacy uImage, Linux Kernel Image, Linux/ARM 64-bit,
> OS Kernel Image (gzip), 9822180 bytes, Fri Sep 29 15:39:42 2023, Load Address: 0X40000000,
> Entry Point: 0X40000000, Header CRC: 0XE1EF21BF, Data CRC: 0XC418025
> 
> otyshchenko@EPUAKYIW03DD:~/work/xen_tests/input$ file -L binaries/uImage
> binaries/uImage: u-boot legacy uImage, Linux Kernel Image, Linux/ARM 64-bit,
> OS Kernel Image (Not compressed), 23269888 bytes, Fri Sep 29 15:40:19 2023,
> Load Address: 0X40000000, Entry Point: 0X40000000, Header CRC: 0XA0B7D051,
> Data CRC: 0X42083F51
> 
> Suggested-by: Stefano Stabellini <stefano.stabellini@amd.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

