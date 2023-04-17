Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4588E6E41B8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 09:56:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.521806.810697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJiX-0008LG-Ro; Mon, 17 Apr 2023 07:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 521806.810697; Mon, 17 Apr 2023 07:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poJiX-0008Im-Oi; Mon, 17 Apr 2023 07:56:05 +0000
Received: by outflank-mailman (input) for mailman id 521806;
 Mon, 17 Apr 2023 07:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ncOi=AI=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1poJiX-0008Ie-1F
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 07:56:05 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b1e0ba3-dcf5-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 09:56:01 +0200 (CEST)
Received: from MW4PR03CA0009.namprd03.prod.outlook.com (2603:10b6:303:8f::14)
 by SN7PR12MB6690.namprd12.prod.outlook.com (2603:10b6:806:272::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 07:55:58 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8f:cafe::14) by MW4PR03CA0009.outlook.office365.com
 (2603:10b6:303:8f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.46 via Frontend
 Transport; Mon, 17 Apr 2023 07:55:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6319.19 via Frontend Transport; Mon, 17 Apr 2023 07:55:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 02:55:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 17 Apr
 2023 02:55:56 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 17 Apr 2023 02:55:55 -0500
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
X-Inumbo-ID: 4b1e0ba3-dcf5-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gIzMKriHIw1pwJXyN41W3UHHjL98WYqa3s6nR5B8ll2x4qbV1YG3Gbr5JXLqsj9lnqkh0dJyn2on467/h/lUexTiYRKTrsheunHnwehiAJ1ZRhgZxgprnh634YBOHq9H4fdFsD6WdtR2umCENjq/Osi4JpbgeXj18iYktTOddQBHl1zmzLBWXyjwIzom5cFysD9zl32Sxqanbxta5Lemp88v2IZshIDCpkwb+D7YDmHZirFUCL2/OyKgdzmyDh9uPoMEpVzA56SzMNa7DJ715X+wf/9wtLop1DLzH13mrwX7gD6YtwcR3ba5kA1HmUq06d+Bv8gvn8BOQ/+FcVsE3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chtbllMr7ZTnyDLWO1/uN42rbRkqjZQuW7DSLEy2yJ0=;
 b=hjfI+iiKzBuK8e8nMwAa9bjMlZsjTqZCCJb9yovOPI9grraM2lBbs+7r/fuDZSerPVh8/9Tsd0yoSOoInhORZ2gtWj0RQzNPmfprtJgIqX1Y82xVxLTCa/GakpTjnW1aJ5+oWscX0ngS/lglrk3VJ2QCA9oh1ASbfzCejrg16pOSKxclMQUP7eb/C8JD8i1ydFyuI4er1uiBpi0CZ0oKRGeuuc0VjdqHk9Ik9lfXjUFjiYhwZtY+Tu7NEOfI9K+ply+cgLPFrll4sizq/xZjiDr/iAHn3moJeIUGoyXFVI7r3Q3jJwwWibOy+MP1W0m+hazrEfBEaHkbg84iNF0mew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chtbllMr7ZTnyDLWO1/uN42rbRkqjZQuW7DSLEy2yJ0=;
 b=GhMMNP+RRVkEpriaNPaaeQBdky02FmWx1bAQcpsh83esU7IsXszyLwrdiOXC0F7NuhICpG9VG+5AQz778ODOGLm6pN6k2hZMew619mptuZXpY3U/PhJmx2D3/e13FB4Xqf3yYGrT7FgofQBM61kdBTH7Lx6DDil1YCz7O1FxrhM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3a011582-f6e4-9c28-509c-1d552e7ff903@amd.com>
Date: Mon, 17 Apr 2023 09:55:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 3/5] xen/arm64: mm: Introduce helpers to
 prepare/enable/disable the identity mapping
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, Julien Grall <jgrall@amazon.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230416143211.72227-1-julien@xen.org>
 <20230416143211.72227-4-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230416143211.72227-4-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT038:EE_|SN7PR12MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 56076d87-c395-4144-7c6b-08db3f192dcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rox9AEy+ORxOaRSvhBsG2o5GmJHlq5hPmbJfvCQ1XRdxo5QixLi2psV2hmkheAxLdeNJJWxk4DOmf+d14sxJh0HnbJBN3JGpWUqRkRly01FA9UdY/MH13O3BXxZc9AQyoyTYOgK71B34tnXxlGv+TU0Rl9LNYX3iXimw/0wNc1f6QMRaVLCAGZeVDSc0ziMLlnf9LAlTsSED8Z2pgZHXfNp+63j1ax1YjzzVN1swPtS1YPSmlFIcqoSljTKbKu269wLvoiFaGDXb7hpezUPk9U/6iJuPvPj+ZHo7aFIIMCfiqo9CmKIHxhXuOVVjHukS44i9lBfwuy31Re+3kudCzcviebFO8I4TZ+/F/e6Y3hfg4bH2He+bU1vzYncbnMojeRtvepVsQNXTxDwOWxFYZDglBihIJixWJ86NQtH9uPH2wGalB/4/iMHDJE0NkclljGJIpvT2XfAcqd1DsEmITg823MPzoh+KknbCHQPuhDzGTNoCbSG9TE6TXa3v7UyAYMlu3h1blE/jl4AheHKdvt3qZfzwtqA2bPQO1XTDE6oHo3bE0ftZcJXpu6A8QXos+lGSkMF9EY9LBmApxc/Zg+0kTKPCPmVuXC+UHuSaV5y5IJbYrSQLFuzBwPKvZyAIsQ7sPT15XPQjgr3UaqwFXEJamCob/TGY/RxekT9C3mmi9N+O0KbAqv2erNLtuskzT4tHgE2EhRbRhYA31SQHYjT00HuAjmqLEJ+LIRMXxRjnaOAYoCysFcn/sXb/jON1PBnFK3T83msCdQMji8rnGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(2906002)(4744005)(31696002)(4326008)(86362001)(8936002)(41300700001)(8676002)(70586007)(70206006)(5660300002)(31686004)(44832011)(110136005)(316002)(16576012)(54906003)(356005)(82740400003)(478600001)(82310400005)(81166007)(40460700003)(2616005)(47076005)(26005)(426003)(186003)(36756003)(36860700001)(53546011)(83380400001)(336012)(40480700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 07:55:57.6537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56076d87-c395-4144-7c6b-08db3f192dcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6690


On 16/04/2023 16:32, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> In follow-up patches we will need to have part of Xen identity mapped in
> order to safely switch the TTBR.
> 
> On some platform, the identity mapping may have to start at 0. If we always
> keep the identity region mapped, NULL pointer dereference would lead to
> access to valid mapping.
> 
> It would be possible to relocate Xen to avoid clashing with address 0.
> However the identity mapping is only meant to be used in very limited
> places. Therefore it would be better to keep the identity region invalid
> for most of the time.
> 
> Two new external helpers are introduced:
>     - arch_setup_page_tables() will setup the page-tables so it is
>       easy to create the mapping afterwards.
>     - update_identity_mapping() will create/remove the identity mapping
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


