Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DBE780611
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 09:03:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585801.916988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWtVY-0002zN-1S; Fri, 18 Aug 2023 07:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585801.916988; Fri, 18 Aug 2023 07:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWtVX-0002x7-Un; Fri, 18 Aug 2023 07:02:55 +0000
Received: by outflank-mailman (input) for mailman id 585801;
 Fri, 18 Aug 2023 07:02:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sb/K=ED=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qWtVX-0002wz-2y
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 07:02:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20630.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 400405bd-3d95-11ee-877e-cb3800f73035;
 Fri, 18 Aug 2023 09:02:53 +0200 (CEST)
Received: from SA0PR12CA0003.namprd12.prod.outlook.com (2603:10b6:806:6f::8)
 by IA1PR12MB7616.namprd12.prod.outlook.com (2603:10b6:208:427::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.29; Fri, 18 Aug
 2023 07:02:49 +0000
Received: from SN1PEPF0002636A.namprd02.prod.outlook.com
 (2603:10b6:806:6f:cafe::4d) by SA0PR12CA0003.outlook.office365.com
 (2603:10b6:806:6f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Fri, 18 Aug 2023 07:02:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636A.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 18 Aug 2023 07:02:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 02:02:48 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 02:02:47 -0500
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
X-Inumbo-ID: 400405bd-3d95-11ee-877e-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BnRHVIhU8FLRJpDBVBr+tDgKvJHZECjy2k6KjB2PqF9SZvrv7Ng6tvH0VbuHcFKbkTbWu0dla07sjO0XPA3I/Cxm1I2lG8I2UE2hcIf74LAcEe5UAJjd+dehMiFPxSZhw+xT4d5H4l1GMyuXkcvLLIw3sa13fHkvPYt8V3IftCbt4LALhdokmHIZ0C+aFCC5Bp96/V+59HhKTr2rs2oIFQL+Th8bGwOLwCPNMk07dmUPwPxRuaNf1yzzz9afMnlZpNNGSJMGPk4QKRutvCkWHUSrrNN6ZEN22Q2QH3be1hpULiD6iSUccIFuvsrsNP0coateK1CST4kejMMdVbI8DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JAKrpvgdMwKNxemFf7MSsdZWjuNYAwyagXvDGouy83I=;
 b=RUJMeF9i3JOVD2O34Dke+sX5VYN8WV7/nULmTIqItBn8R2h2GnNDQe5p+NCD5mNSSRg+fL6uEqKEu2hqhijO4TpfZOLhwHtnmcQ7WeyWeGEAkBtpPJjMEGDQ8iQwdaOD9YDrhN+r/BOZ+25y//yeA2gijSMBx1vP59p72DtmiyIJEkVxlkbElcbuz1S0d0LsY2fM159cNpgL7U1ZGcMIY7oKTIJGpnHpB9OZFcnBU5kIZTRwE20FE6PaiJNvmPyl1IuDm/lnfYlSYb8VwaPzYk+iw5+VbUo4jCrUIcIyZVUvaDXpU8LHfwH0QiRrFRCsB9MKK5DPpNNdcTe61QBvqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JAKrpvgdMwKNxemFf7MSsdZWjuNYAwyagXvDGouy83I=;
 b=A9tXpN8bmVQf0ipl3xzVOisQSDud2o86WnLaHRHbFH0WLuziVwQsjyRl/A896/9rAV3xGim6Wv4AJ2a/RPUM1B+nZLQcszydacVt1sz9dMzC9y1s6BCLBlUOEUW036CAFfmSSxmunGmvI00LY5H0RWvc5gzUz0t6AxYYD15uzAk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <e3258b25-99fe-5c4a-e539-06b08fe85e2f@amd.com>
Date: Fri, 18 Aug 2023 09:02:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] xen/arm: vgic: Use 'unsigned int' rather than 'int'
 whenever it is possible
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230817214356.47174-1-julien@xen.org>
 <20230817214356.47174-3-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230817214356.47174-3-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636A:EE_|IA1PR12MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ec1513b-0c2f-49c3-5981-08db9fb921e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8a75dLAhktdJN82edjfreRw6Tv3Iy0vM1qctGniMxcco5+Pl5LouDtwgHn1aNaNLznBAZ77MMnvh3KZ9AJHS3b6vWk6MhBjj4mTazeJgctX+Wa4MFRXDY+87yYzSTtgT3Ia7O9sC2SKK/EHikclDpQxZoWq2VETvAEEUnlCbmu7F3Qb2AQCPnxbm0HhCzb8Cwh4EhYLzGCVzGxhem9yVaVjRbG9dvUXXfwHd4NkVfFFl8IYo2i004Ne7DuvHB8tEiaj7X5kg5rNehy+ItgCIMpHS+wlawEQQsomF8DHuMqVDkfrJCtPX/XAAzfxS+rgnQFpgs6SRP6zGCDzvdh6EXCd9BxkucCK49Qzyu3JVe7yGD+WcEpCJFTk7Bd8Yi/DFxYBh0CyXzTH5vcaQLkYvVCT5cI5tcwZdAjwaC3P8mAPNJj1VrLTcJ5eYXdLkPT5P/UyJliuMzA8ZnmqKFCmLv8mcgEbxviUN/66aYy9FLnpa6y49QoFYzCa+0tRECBzSajbJEk/3pdXcIwFYu42d4DPFwkbpem/24CRwRL5yA+gSCcuRDQgehISVouMnUF+et6RzJmQgJvfplsS//kos1Xea/+4d/3EWH9wX60ju9TcO6smGJZ+wKNln+9RZRKXkIoK2jfSsvwcDi6tBpBRnSK/fEqkQP66OLfelNTubOWjhFLYo6Hmhiq8PxhLzZKTuceslRm2DQbZhf6ytGVWbxM/9FdILR+1ZbA8+UqP+5VSb5urNlZJ8sYBRkNjwN0G5wrTy0QZQ4kk0SfNQS4VteRbaBKxsnUiO+8nIJGysoSD+SGbYo5ufbCFnCPaveTU/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(31696002)(2906002)(40460700003)(4744005)(83380400001)(26005)(86362001)(336012)(40480700001)(478600001)(426003)(6666004)(2616005)(53546011)(36756003)(44832011)(5660300002)(36860700001)(41300700001)(70586007)(16576012)(82740400003)(356005)(54906003)(70206006)(81166007)(316002)(110136005)(31686004)(4326008)(8936002)(8676002)(47076005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 07:02:48.8549
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ec1513b-0c2f-49c3-5981-08db9fb921e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7616

Hi Julien,

On 17/08/2023 23:43, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> Switch to unsigned int for the return/parameters of the following
> functions:
>     * REG_RANK_NR(): 'b' (number of bits) and the return is always positive.
>       'n' doesn't need to be size specific.
>     * vgic_rank_offset(): 'b' (number of bits), 'n' (register index),
>       's' (size of the access) are always positive.
>     * vgic_{enable, disable}_irqs(): 'n' (rank index) is always positive
>     * vgic_get_virq_type(): 'n' (rank index) and 'index' (register
>       index) are always positive.
It looks like you forgot to mention the modification done to 'vgic_get_rank()'
With this addressed:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

