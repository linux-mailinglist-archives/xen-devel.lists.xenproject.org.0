Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307969F69A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Feb 2023 15:30:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499521.770688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUq7l-0000oh-7U; Wed, 22 Feb 2023 14:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499521.770688; Wed, 22 Feb 2023 14:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUq7l-0000mz-48; Wed, 22 Feb 2023 14:29:37 +0000
Received: by outflank-mailman (input) for mailman id 499521;
 Wed, 22 Feb 2023 14:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lMNX=6S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pUq7j-0000mt-LD
 for xen-devel@lists.xenproject.org; Wed, 22 Feb 2023 14:29:35 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50fa3b7b-b2bd-11ed-93b6-47a8fe42b414;
 Wed, 22 Feb 2023 15:29:29 +0100 (CET)
Received: from MW4P220CA0024.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::29)
 by CO6PR12MB5442.namprd12.prod.outlook.com (2603:10b6:5:35b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Wed, 22 Feb
 2023 14:29:26 +0000
Received: from CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::3c) by MW4P220CA0024.outlook.office365.com
 (2603:10b6:303:115::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 14:29:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT086.mail.protection.outlook.com (10.13.175.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6134.19 via Frontend Transport; Wed, 22 Feb 2023 14:29:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Feb
 2023 08:29:25 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 22 Feb 2023 08:29:24 -0600
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
X-Inumbo-ID: 50fa3b7b-b2bd-11ed-93b6-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9/TBGYkv3m+6nhf7S9pZgjMWfdIuPDbxleXux9Ao177tN68WqXADenY220446S/k+9hOjqgp/GfE2Atwh1YM3zw4WrM68FLon1cJ+JNz1zkKey8BKAgwYfNVkesPh4Ihkg+lJp8ASuH9daMAVYBBuqSdys6JcZMwtSb6ljqcAjAhmzuJNJFOc4VKH3Mbcxe1H/wgCqYkNXFEi+qM6I/fAcwdDyeMAuivjXC6vK5lf6XclZ73HdATSbTRcvkcYtx6SGAbJ2iK3CDQtup6W6tBcOwEZYgxn0F483kJ3fYMQ6QyN4l7MRpdytrbpjKZQLa0ETdn4Isz0zIuPa/G+eF4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=36096YKz37QqTUKhSoDa6xhVrBBx0hJAdhfhrB5Pr7s=;
 b=kgdBTyeKXhXTQILLstukIquQSHV6gV7110yLPl6l1ODlkpl+bT+QD7k30GwyIDPn/3GVQVV6yxpXPU5+sgU5BMN2D0nZ1ucoOtQtk5x9uwkL7DuZU6wsRTFZjQBnfs2UO5YKd7AsUO7x2c6ggkwQTmBBU8KEOkAk6iIPGdtbjbZMWnrvOpzFyskCbCjex2one+2rVF+TQrnkjb7oQdr+rx6XdPxE4Jg3p6ZC/iF9Kpa3/0kzzD32axoosYE39Ls6S/TEdjvyxr5yCRfkxw25xxjW+HcEi9p6wnHCBfu5g7hQXUHsJUTrg6Z0cEJ1QUmutV0+XZ260b5Um8N6l58QOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=36096YKz37QqTUKhSoDa6xhVrBBx0hJAdhfhrB5Pr7s=;
 b=oIqj6yiT4LaYWFQrGfS3jELP/rs6Z7yU0VsYkAxKSVFUmp50/qQjLjBMmA9hYvftmgwG51gA4qRzahbrRIbJ4hpaUcLP0Ugr0KPK6SiV+yw/LZoCo6Q0tFl5JuSwxoWSEglmtoSJdUMs1ktw8Et1Ffxa0sPvp9ISNMmLdocKtLo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <a513b888-33d4-2e24-a298-911bbbbb2008@amd.com>
Date: Wed, 22 Feb 2023 15:29:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] CI: Drop gettext from containers
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20230222141322.2376955-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230222141322.2376955-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT086:EE_|CO6PR12MB5442:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b030541-d295-4d1d-1a27-08db14e1333e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jt/DkRgnQR3b3/7/TdjTyEpwyzJADSyu3krmGyW6LbY1Vmj7GM1IqCkE1Be4ECPJnUuR4NqV/zxhpyWOYu5iGJ15qK22TzsJgG2/SDty5BBV8EvCvtFHMiiKZyCX1o/oXtcsdO9q93whTH7RfMO2vog4kn+eMx82/Gts6/1p3BG65kf1bCzdjvMG6EsSKVa7O25rw3sO0Wso0GnAbfd/s8bOH0ALfIS2lL3xhQY2u9MvmRxWM8KTIkJnDLfq3l6k6Agy8n6oyMcJnNLbtWH7Kyq3zfkZlCvfs7D+gsZGETNV8qsU/XOzY2yR3vPEMFPC3i24l1B4ni7kM+d64cBHLK6udr1O2fS1f2fGxIzCvvsRGbppziYW0WQRsLLr9btMm72HXvfMPc6f5bi6a0PgOlcoiP8+oYM69F3Yz+8T7zlQ8pU029zkG+m/XMgWRj5GxdyLc+usMMg4BYZUEK6eCbp16cXdSlDklbQAiQ3NhX63INsFtrbkoXhwcvia42+xhuomi5Ozapqj4lKNOqQIThLGolveb+N1cHKgWjF3+QehijUDhw8GmDu2qPoPl79COv3GcsJkuy5CbqSUjtODu89ThjyOt7bHPbbHbIvZAhhS3tTH3/2WGZ/haH9WkgEdFoa2C9wcYCm2aw9xdRYoFNnl6yEcq2eTgHLWEglo2FrT6GuZIMK/L7MJghR3eo/mBg8mYCC4Tf0alYY+nIYNLTYFq7VGTPG9p2G1vKj+68NtWXETwbg86PZbCTYdQyAasexKJup112NSark1RBydEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199018)(40470700004)(36840700001)(46966006)(44832011)(5660300002)(2906002)(36756003)(426003)(47076005)(26005)(40480700001)(186003)(336012)(2616005)(356005)(36860700001)(81166007)(82740400003)(70586007)(70206006)(316002)(40460700003)(16576012)(8676002)(4326008)(8936002)(558084003)(53546011)(54906003)(86362001)(478600001)(31696002)(110136005)(41300700001)(82310400005)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 14:29:26.0774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b030541-d295-4d1d-1a27-08db14e1333e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5442

Hi Andrew,

On 22/02/2023 15:13, Andrew Cooper wrote:
> 
> 
> Xen 4.13 is fully out of support now.  Drop this legacy build dependency.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


