Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7203C82FF17
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jan 2024 04:03:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.668228.1040264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPwD0-0001VZ-Iu; Wed, 17 Jan 2024 03:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 668228.1040264; Wed, 17 Jan 2024 03:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPwD0-0001U4-FU; Wed, 17 Jan 2024 03:03:18 +0000
Received: by outflank-mailman (input) for mailman id 668228;
 Wed, 17 Jan 2024 03:03:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9KYf=I3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rPwCz-0001Tw-1D
 for xen-devel@lists.xenproject.org; Wed, 17 Jan 2024 03:03:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4c8ea69-b4e4-11ee-9b0f-b553b5be7939;
 Wed, 17 Jan 2024 04:03:14 +0100 (CET)
Received: from PR1P264CA0119.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2cd::13)
 by DM4PR12MB5817.namprd12.prod.outlook.com (2603:10b6:8:60::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23; Wed, 17 Jan
 2024 03:03:08 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10a6:102:2cd:cafe::dd) by PR1P264CA0119.outlook.office365.com
 (2603:10a6:102:2cd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.23 via Frontend
 Transport; Wed, 17 Jan 2024 03:03:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Wed, 17 Jan 2024 03:03:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 16 Jan
 2024 21:03:04 -0600
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 16 Jan 2024 21:03:04 -0600
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
X-Inumbo-ID: f4c8ea69-b4e4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWEQAC4O313hRsMLHITeT6KAFNZqY8z5IJpsWZ5IMfrd+u3YmYXlOWpkB3CsiSz76q+eEK9H4w4ucX/YcaYnI94bWiGjmzMu31zdOuA8+cjhd/QQalWSEgoZphb36EyqfJ/vzYJM8t5tFd6E9GNItNRmRvf8R0MVN5foBw1peHQN46Tb7bPOCE4O2qMz+91G9Gbssy9uiomzxElYoBofzbBioy8huBBjAwUbwNsp2jjARZViw6KvIPWYrx5wovQZe/ZcnF0pISar8CNGigxuW0s2ObIeNS4KqIh7mdfZ8ZwkUGKIzuQKOR2yWlV9U2Yk4Fa50kkjS8NL9YCDaYKofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TgK3/fqvNtzRx5ymRjoZzYE9tpcScNMsBYu5BL/usIs=;
 b=EOAu8VX+mixokUFj6lLZOeNpltJssBjS3lBgzaHh2AfKkzHj0SKu50SWqOIL8TWRwYnV/TKJHTmbw5whRgg4Q8lZRINH7jVnbRfS+Be/7LKBQH7Rm+sIZO1k8ey/uduL/RyHdxGFkNV5bS8Wth8MZ542XpHO40V7gEPx6QVS5F7cnfOc19z+1SgAo1uaa0N7PrJ94fQeK37biQ8y94JLzGQoWZv0AgSes6WDyQuNfYovT5qGKYLSQUCUIXYDhY8+LrW1TVBi2O9dl+7Z7zADJEdd8PBGAXsLiOlObYP6P2LNDkhywp+nt1ohXXSnRZo6hxuYzdI6JKuuOIYNZqSSYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TgK3/fqvNtzRx5ymRjoZzYE9tpcScNMsBYu5BL/usIs=;
 b=SjUPaif9K69StO2gB4HyqMW4PUNnu7yXDSZz/rtl6244oqQfR2THzgdM1Qikpk06BWTJbgo85yEhkrlt8VHzje+wn2tDrwmpa/vM/TbqtYqzxjxzB99ZF7uSmc8Ei/n7DZ1TG5kM86u+hqly1FyXYAtJOchmY3PLBCeoLE5QzQY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8259a7f9-3e90-449c-9ca2-cd5dd013dbcc@amd.com>
Date: Tue, 16 Jan 2024 22:03:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/15] xen/arm: vpci: permit access to guest vpci
 space
Content-Language: en-US
To: <xen-devel@lists.xenproject.org>
References: <20240109215145.430207-1-stewart.hildebrand@amd.com>
 <20240109215145.430207-15-stewart.hildebrand@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240109215145.430207-15-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DM4PR12MB5817:EE_
X-MS-Office365-Filtering-Correlation-Id: e568565b-7c9b-409e-7011-08dc1708d433
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nQKPQYPev0OyXAr/FZTtYUTGTYefVh3ooQll40EUZmrs+Ur+B6oq5LcJLlyxQlAN1G7ED6MUb7326J0/NgcOufgjhj6YFfu88kUgbI2LNHak+aVLHS686nynAssB84pn3gV8+2Mnj57FbbtJDIsSL4O1X2bNoRJWQRWpFl+Kf44KjDLVu9qj6JMIkzrF5fm599de1DXpePwSB9EXbRykEa2mohN0lr3h5IelYMoI7/ZxiQGxZ4YoKBps6bv6VJ87aNcHMXShyOnLdYkUm7SQ5pEqsPHqkxnSmXt3dBH/T0epDLEOO4sXfoUULO725qXeQ8SO5OHneDj6RSaZerCX+hoRcC1IzO5ZNrAghMJzljvTSWv0tVKHHkRr+ckaUPWlQWuCK7I4zACvNR38tQzsiy5lpdlxVRC1Nxhz6dhbc98YmFNBGzFW3nen650OaiWi2SyTvLY9vS0octvDNx1p4XYbO5UqXz0QLlQ1fZ6SzPtGqUTCsW1Lbzlr4UjgJ7a98H94nolJQdJc+eRX97MXmIhjHKPjx9R2clrM0XH5qEmwJBDNJ9mc3KYaKuqmwxy60O9mn7APqKT+qI4rabBpvX1+1ZWFapElj9lSLg8OMXl/I2aLNj4k3ePObrSohFMwTX7PJ9pzOMIpKYmS3gGeYoGOsSKZ3ytVIgflYGHOzpx2J4SEggSW2Bz662DxEVJecDxcTDuvsa6lQeoVkzOGRAuIQWRIK+n6iSV/S2781Z+SDqOO18GnkptHo+hel0C+NXCElyYcq/XAWNtrrxB9H7qajkC39GimHZrs0QKRiyFalWl0UrM38f/n8H0HCXCa
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(31686004)(40480700001)(40460700003)(53546011)(47076005)(83380400001)(44832011)(6916009)(316002)(478600001)(70586007)(2616005)(70206006)(26005)(336012)(8676002)(8936002)(426003)(82740400003)(16576012)(81166007)(356005)(36860700001)(2906002)(5660300002)(41300700001)(36756003)(4744005)(86362001)(31696002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 03:03:06.6460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e568565b-7c9b-409e-7011-08dc1708d433
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5817

On 1/9/24 16:51, Stewart Hildebrand wrote:
> Move iomem_caps initialization earlier (before arch_domain_create()).
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Since the iomem_access_permitted() check over in ("vpci/header: program p2m with guest BAR view") was changed to use MFNs (it used GFNs in an earlier rev) this whole patch should be dropped. The toolstack already does what this patch was trying to do with XEN_DOMCTL_iomem_permission.

