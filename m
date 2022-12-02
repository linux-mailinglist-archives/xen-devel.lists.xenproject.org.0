Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21964056E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 12:02:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451823.709616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13o5-0007he-It; Fri, 02 Dec 2022 11:02:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451823.709616; Fri, 02 Dec 2022 11:02:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p13o5-0007fC-Fm; Fri, 02 Dec 2022 11:02:13 +0000
Received: by outflank-mailman (input) for mailman id 451823;
 Fri, 02 Dec 2022 11:02:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NC9X=4A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p13o3-0007f2-FF
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 11:02:11 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3b4a785-7230-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 12:02:10 +0100 (CET)
Received: from BN9PR03CA0421.namprd03.prod.outlook.com (2603:10b6:408:113::6)
 by CH2PR12MB4037.namprd12.prod.outlook.com (2603:10b6:610:7a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Fri, 2 Dec
 2022 11:02:06 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::d7) by BN9PR03CA0421.outlook.office365.com
 (2603:10b6:408:113::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Fri, 2 Dec 2022 11:02:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Fri, 2 Dec 2022 11:02:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Dec
 2022 05:02:05 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Dec 2022 05:02:04 -0600
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
X-Inumbo-ID: c3b4a785-7230-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d6fbSNy4F5L7yKJ9oRWpdU6L9V88p1bG+6ZQu6rz/cbtXmVP5Qgq8iK/KA3mb/+sx5EdGJk77Koe58RGpkxCfz/M8I1Vh/9EE8PLFbLHZ7WX5dxV0Luhkd3XZFvHdQqPAK/mVFLDRPl3XRGVh3PTIaIdFRtCs3t7c1I7TEAefoVN3AqYRjidft+Yerp7+giiuoEasHx9Te6Q54/rjCyDOFk1nSNOSEafWjHiQlH7RE+FOFJ6R4h9ZuFpRPl2y+Z67gRNrY+wR2GRyJC8QQrklCownVXy15eCUN10OcrxbtPeBE01zMxMFdS/I/F6qT9bCxzCW/RwGkK+47UNeLykwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yr8c4JrpoIOWWEM2RhraY4ayOenBz/ERD4THBPmAmYc=;
 b=OzSBc89BclBtldbR88CVDz5/lnaBb0oygABbz8xDsL0QaHTPVaA/H09K/Yh8vT8mLaYI8wEMzlAvMMoT0g5HeSsXVTpvLnFK7Xu2ouUkXtf7xSKUjBGgMSggjykXYq2VimM0j6dAl6j/SzMnQA3qW7DDL8kaVX5hKxMxUKeLc/Tw+Cr6l1nHMpIi56AjaCC/E2oUtNd7RyQmbbWtk2TSRiGv9CytJwLTypqJ3dNjqm+TwbG3oyIpaGOYKn1+bDtvXPIG7i2ax5pIMDe2GxUY7mtIy7DW6pd7oTdoZvRAcmOT0vYjPdYDgs2Z0fc9l9C/N1ZEnjdwwAGEfzTVfAOMEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yr8c4JrpoIOWWEM2RhraY4ayOenBz/ERD4THBPmAmYc=;
 b=CLiyXJMS+8BhLw7uzQk+I5Uf/tJsawPAfIwf76FmC6VaNKMdg3I65JSW9bExltDeZyHcaIqYIVNU3Si8XZJUeNawd2uHk0gouFiYRXsVVoJP85WB1kgiZS1dyAKPTId9nK4GeJC7kU2q592QNTLsoe+GkAViQjw5uuJ5smMpDjI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <14ca1062-09eb-4647-807d-1b465dad8374@amd.com>
Date: Fri, 2 Dec 2022 12:01:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v6 2/3] automation: Add a clean rule for containers
Content-Language: en-US
To: Bertrand Marquis <bertrand.marquis@arm.com>,
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <cover.1669904508.git.bertrand.marquis@arm.com>
 <b802d2523af791acfdb68b6f8603ff2f0f8573d6.1669904508.git.bertrand.marquis@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <b802d2523af791acfdb68b6f8603ff2f0f8573d6.1669904508.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT008:EE_|CH2PR12MB4037:EE_
X-MS-Office365-Filtering-Correlation-Id: 348e1728-2c79-4d2e-0d26-08dad454a658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUwo8y4WDPpteMZrJEscK0NW6q+mpU7y8w3zjRcpNmjhp2jQrUmyK8tgONxTxBoLs7coHGNzoqmMjiDUHATa/hEvzuiNsBLIeoW/lBpo+DOrz7SF8TtUSo/ANl+iLIC2z+OSqveHY2HszNeLQW22/KxCXCyp0ZNU6GHTaWv/y2swjwaqdn0VkfPQ4R8B+zc0VvdDWuwlVYyLRg4/kgW6e+40+B1RMgYDOCGJukcVZaTlNnMKhiwzpxkL4+8hg57FUGdW6Xj/5b7sXZy2NrRNG9wA14YFIGugZpIGP2iNwdDYduvKRnDfmBDT54EDosjbC5m5dw2z9tsFcjKmwwVP+Bfy0CiHMBPbr4e2ilPuY6A4xGogNwbR3epwAhgU5pGeYgpO1FyyGDhLs5dNKYxCLA8tjviOzypozshAStOAp3WG80DX1WO1s5rPkajTXR+rP4NdSDHkSlUjfKajXIbhPjzwZh3TiDaVLbLy95ogh4Aju8p8btZ8f4F88honUOzgFezfoboJDctf8FHgxxyFm/wDPEYV0VnmiTx/tDt0+BGlsUxPiDCwwA4vuTkgQBX5zvbTp+cl6vs438bgnz/JI+o9BqL6SaMisS9prwfWN5Fr+tzmiqPDWm1Ee/ok7Xy6dYF99/JXRrvtQQkGl2Gl0wPb2H2+Ri7nTlplZTQwoZpbNwI+lZdhL4Vf01g7/WQsXxBU6Yoz8zvH/i0zILXnwuk1HJAUdqLQ8xLV05A9N4uY1Yq0oQuADn8JNWLxiLAKhSpUfmthdqF/EVNj7vzAtw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(356005)(81166007)(2616005)(82310400005)(86362001)(110136005)(31696002)(41300700001)(36756003)(6666004)(40480700001)(54906003)(5660300002)(70206006)(8936002)(478600001)(316002)(2906002)(70586007)(4326008)(8676002)(16576012)(53546011)(186003)(4744005)(36860700001)(82740400003)(47076005)(40460700003)(44832011)(26005)(426003)(336012)(31686004)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 11:02:05.9007
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 348e1728-2c79-4d2e-0d26-08dad454a658
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4037

Hi Bertrand,

On 01/12/2022 15:25, Bertrand Marquis wrote:
> 
> 
> Add make clean support to remove the containers from the local docker
> registry.
> make clean-<image_name> must be called to remove an image:
> make clean-yocto/kirkstone-qemuarm: remove yocto kirkstone for qemuarm
> image
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


