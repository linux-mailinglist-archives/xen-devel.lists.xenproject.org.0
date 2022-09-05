Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78ED95AD20F
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 14:05:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398776.639720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAqC-0003gw-JB; Mon, 05 Sep 2022 12:04:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398776.639720; Mon, 05 Sep 2022 12:04:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVAqC-0003eX-GL; Mon, 05 Sep 2022 12:04:36 +0000
Received: by outflank-mailman (input) for mailman id 398776;
 Mon, 05 Sep 2022 12:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZxbR=ZI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVAqA-0003e8-Uy
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 12:04:35 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2057.outbound.protection.outlook.com [40.107.100.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e6993845-2d12-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 14:04:33 +0200 (CEST)
Received: from BN9PR03CA0140.namprd03.prod.outlook.com (2603:10b6:408:fe::25)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Mon, 5 Sep
 2022 12:04:29 +0000
Received: from BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::cb) by BN9PR03CA0140.outlook.office365.com
 (2603:10b6:408:fe::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Mon, 5 Sep 2022 12:04:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT057.mail.protection.outlook.com (10.13.177.49) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Mon, 5 Sep 2022 12:04:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 07:04:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 5 Sep
 2022 07:04:26 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 5 Sep 2022 07:04:25 -0500
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
X-Inumbo-ID: e6993845-2d12-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp+s7wyMNPsptLieyDaBq3W20FfRw0AD6c0ouJpxI6+GQhnID4u9vK/8MYTrg50ZcJUdLJVZahirVzUElLoVuZ2eZY3WShMkLuZsbNpgoIKRw0nGjzvCfzUxyg3ziWj7sVllMqU2F4AXkJ5jP+6nORaL+5gZqIfoPU+lz5bEcuXSiF+ZUEyw7u95BonIhCYpQRbnGJJ1bf7gewDCoiVjFJbu+uCFRvyF+0IRHyxaDHtaFHrL/u3RrS+9ct3EdzEd1D4IcLdfolNhtScC5sAh8VcmmGWIiw+4f9a8Ce62PMbZT33iypKb1605Fqa6Ch3UFhb0LJKz5TmG9F6d5wKrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj8RwooBFay5ImDaoLqnb0VynjqAuZ3CV+5rX8NPc20=;
 b=IEWpMgUE087DRTqZg+7sF/0G5K/sP2hQFn+bQlnHLqmUCThI/GeFAeU3jryiVRqz4nCkwWTLQzvupRo4M8ZFq9D/kcdB0pe1LyhLWvf0JTZG/VJHZDuneCZn0M4U40CofLYQSySixcXqbeLTMUbxEau9C04eDz9yU4u888VRiATA7YQYyd0j2/4/ZQ6txbsWXkgagrzy/HALgbFUlarh+qf0WLFG2L/EYgxV0A8dD39jUUsYuj0B6rOfo5D2nqeW+oJkgDbVZ1pynF8KtJkEZ2emI2Qw7ewtAmxPmfy+WnPMpNmTzyBjVkGcwGP+nTlPH5A5SNL5h/j40aLpfVVbAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj8RwooBFay5ImDaoLqnb0VynjqAuZ3CV+5rX8NPc20=;
 b=PbMYYtyrgQPYJMWsOs2uQcF3SqfxNoFWK7pPPMC3VSrUl5jCqvgjtS1x1DNxADFOVAJlsqUuzZMUza3unZeVFgLjwQP6MxNkCC5pQuwVZuslSBa6RAigUzDvfn4XoIUVTkJt1zHrG9p8kjDZGov77AjqY1MbYXPqwxkGafUB9j0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d62add1a-3e05-7aaf-f44e-f2b3c8c0cfca@amd.com>
Date: Mon, 5 Sep 2022 14:04:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/4] docs, xen/arm: Introduce reserved heap memory
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Penny
 Zheng" <penny.zheng@arm.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-2-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220905072635.16294-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5313e51-8fb7-4a37-d629-08da8f36c8a5
X-MS-TrafficTypeDiagnostic: MW4PR12MB7119:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rrzxzhZ6A8Z0SShBlaqbjcODFLcWXuejVNBg+UJJgfQE/Q9N340fhOAoRW3BEGeAKzrl60iJZgOHo/81wNt2QTA+xTvBzlFk8oRWcbA6YtbU8SB1CrJtocdQQzsERFxXo0Y5PBn4cjcSDjggLDHN99pSXWcyzphpgwgwgebL15UYcZcTE1ynO3duD3qIrZY5iVTDGyDaZyTQ9y+CQ2s4msB5NOW3VmGJyahEpxX64du/azVYio2mJpE2EqYQvf1X836rrmtYqmrTVr06ABvQPfG4X4o1q8LANPgsYRojy4bltSl+depHonJXcVIQKlOW7Trtk6jiqj1ON+OTi0OiHbsQWqHTjJ+VOM1EKjdyMo+epyoj8lSz1To/N1qRP1SjP1AxM5vRaiDr41iD2J/83eDe313NCSP/feHRpd0EMntKcUGYo6RWnjfAhWSwPZNO6Y2OQTn+LG/uWwFevO6zVuG1RgGYXR5S+hW5+dkTL/YnZ8Bbh/sQcfAkFXISFigQknTypoKGwFjeZOHOy3tTShE58eV/9ozatAw+nqc1X7pvBZfitUEXfMoZ4HgCHmGu0MeI3O4NHeb7Aa9vB/iN+NllnRB809x7WW/323YQtjL9T54iWI20cisTVGKpz5mfAzeNxDGTV/v6O363s/150WxmS13yggOKzT05pGPFYRr4aYdVA6w1Y4hQFwqpAEmLiAtCTNOXsXIeyjdtDSOjeaYwgyfSsdrziyLHvfX8VsUFybfatLdg4f1u5oJwCxzetjUZqM8hTRA+f8pUoHzPD2YC3LIUMpNmuuASCyQWXYZJ3wgT9dJQ0+qR8pBJCzD9ADtKI821S5eqlZdJq6J8WQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(136003)(396003)(376002)(46966006)(36840700001)(40470700004)(82740400003)(44832011)(4326008)(8676002)(5660300002)(478600001)(8936002)(4744005)(53546011)(86362001)(31696002)(40460700003)(41300700001)(36860700001)(356005)(81166007)(82310400005)(26005)(2906002)(40480700001)(47076005)(426003)(2616005)(16576012)(83380400001)(70586007)(70206006)(336012)(316002)(36756003)(31686004)(186003)(54906003)(110136005)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 12:04:28.2882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5313e51-8fb7-4a37-d629-08da8f36c8a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119

Hi Henry,

On 05/09/2022 09:26, Henry Wang wrote:
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 5815ccf8c5..d0cc556833 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -22,11 +22,16 @@ typedef enum {
>      BOOTMOD_UNKNOWN
>  }  bootmodule_kind;
> 
> +typedef enum {
> +    MEMBANK_MEMORY,
> +    MEMBANK_XEN_DOMAIN, /* whether the memory bank is bound to a Xen domain. */
> +    MEMBANK_RSVD_HEAP, /* whether the memory bank is reserved as heap. */
> +} membank_type;
Whereas the patch itself looks ok (it must be modified anyway given the comments for patch #2),
MEMBANK_XEN_DOMAIN name is quite ambiguous to me, now when it is part of membank_type enum.
Something like MEMBANK_STATIC or MEMBANK_STATICMEM would be much cleaner in my opinion
as it would directly indicate what type of memory we are talking about.

~Michal

