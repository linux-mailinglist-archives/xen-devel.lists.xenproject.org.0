Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A4F7D4793
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 08:38:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621689.968400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvB2s-0006ou-1n; Tue, 24 Oct 2023 06:37:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621689.968400; Tue, 24 Oct 2023 06:37:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvB2r-0006mb-V3; Tue, 24 Oct 2023 06:37:41 +0000
Received: by outflank-mailman (input) for mailman id 621689;
 Tue, 24 Oct 2023 06:37:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BZZr=GG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qvB2q-0006mV-H5
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 06:37:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eab::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2902a4d-7237-11ee-98d5-6d05b1d4d9a1;
 Tue, 24 Oct 2023 08:37:38 +0200 (CEST)
Received: from CY5PR15CA0039.namprd15.prod.outlook.com (2603:10b6:930:1b::11)
 by MW6PR12MB9020.namprd12.prod.outlook.com (2603:10b6:303:240::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 06:37:33 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::43) by CY5PR15CA0039.outlook.office365.com
 (2603:10b6:930:1b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33 via Frontend
 Transport; Tue, 24 Oct 2023 06:37:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Tue, 24 Oct 2023 06:37:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 24 Oct
 2023 01:37:28 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 24 Oct 2023 01:37:27 -0500
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
X-Inumbo-ID: d2902a4d-7237-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9Tf7LO4dX04zI5My0C4hBl18qHLlVqZp4NPsr+R/k2reW6RKXGbG6vscwK4Q6bVlBt6UkrhlCJ+TJUFNHV/U0cMeJ0WYdy30Yi1V1GzJAI1dL9cIkNEtyNQGTo1y0+Tv3RCz8YVpwJBre3Xu3HEfScpv/aPGh6iE0uTeJGIP1wpFhZOeRUcawkajWpU63McV6nREj6TU8IYG5fHtbU5UV5o7lwwuhgBK7idGPfQcWZxDzNbbhWpx0sPc6SQMA4aSX6NY0WX0Yoi3h2htO+55vHX1CgfjZHEBjuRwy0ytz9x0f2mrwk90mLkHaPESmYQIho1aI8TaaSTeCvexpNy/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V0OyHLFAMVWvfTwflnrLPnMe6GjNqDlrMsEd8ckEbkQ=;
 b=MQeYsu1mEaj3GcctOqF7my2QHCiLeUf2CnxasKuc4aR9tO1yydVISqL2UYQ8f60uvpSrfh4swjbXeREctRO9n17RGWMucgdfGAXIywOp2Euzed7HDDAISp5LHEM/4qbZ8gM2UVQOcBMazmSxL9JQUCzYQBcZTSokBSbB1IJWyu1xvs/OrJVJow6B2/N3fErwZYJwgj+Dd+xow/R0+cLgkyACsGWPs3aewc9rEcHVkGqO73AuQFnzj8LOC75vLfFcqEqmjNf6QiAXNkymxDgi6Mb/A+LbvisqRHcYTcKhT8P/zzOxolwzMN2loE6d3wz7BdtmtUGt7oIUTFgNRtLYSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V0OyHLFAMVWvfTwflnrLPnMe6GjNqDlrMsEd8ckEbkQ=;
 b=5a/Zmtf63konpnhfnr+iWsps/SHmNtUch7Ti0nbRVdQAJxa8Ir9ARe+lYE7COqeTVO8hcmSp4vGcgZKl7gnRxrkamyh29yEp6lf7m90nCEb9LXomFLaRnXjhtIcqUFhKnE3vHtirEUnWHksFXXrRXg5G5fQHmBFNY4uQvlQ2pSw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <0fc7a46c-24d3-480f-9f53-c8c68fb56a0f@amd.com>
Date: Tue, 24 Oct 2023 08:37:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: make Michal Orzel ARM Maintainer
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <bertrand.marquis@arm.com>,
	<Volodymyr_Babchuk@epam.com>, <Henry.Wang@arm.com>
References: <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <alpine.DEB.2.22.394.2310231356210.3516@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|MW6PR12MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: ce30186d-ec76-4a5f-01bf-08dbd45bb40b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	khBqSY4UCkOsZbXnZJzeliOOyUwUuFdz90TUWegg6atyaR2jfhZ8+3+5NnCT3MJ9YnTDsAHm3xMlvPepp604gyVIzwA0nZyzM8L4/BROKRpws8/Gah6FEYlPfczu+r1WEXgLl8tiVwl9/6D0lCd13sfp6QTFZnf34TsCjneCilUjENZg2l5f7h9TZM/Hb+6sQPr+7VL1ODk4YySL4ZEb8Zx0AWz+oaf724oAM/+SzHU8KjpmUt4kMwSntd3db02VOW9+c/LaT65bJn/iwcQhKBHXTbWCrxL3iZmQpz6T6eBYPfmEtM5w8c9AsFWgWK8OrEJieLMgT8azSsStKbDCgxZPJF0aHVL3izz2bhCa6FT4tUvvf4Xs6FwRi6Y9n9KtQZNzJ9Pa0bSSmkyAhdBm/1Y6yrZ3rA1lBDGyNQpyiUDxWylWAUVSdgxhgp0/1yy20sHBbdI0MaZm+Y+rUleIhBYCJc764QCBd5ruNKCx8H8WuAHwJhHckSx+l7RfaeRGAyauKi5gaHeaA9db8W880am/AEdvFJdNWxdiYWFRkXp+UehdBU6od8PejKWJczZpdRCEZHcC6HPQKRVZ/+FrWUz9C6SUqx+7+8+SxBk7W9jg701KJt/6T3GEggcq4eQH87u5eb+5TTzlo7C7jU84oPI3j1I0hYP8mNO6C3aObqqaELj8t35+sOoOVtmudMObWXxbef5bj3cCMYikOnZGdSRDakYVlTxnRGnjqgJ5fm+seEMQMkz015prjH5JjOf6uoAtKv8DmyBM2TlkDX2AJFBtF9a//04SSpTF5pSVJyN9cpjUagzPrqeVAnQ5oP12
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(186009)(451199024)(64100799003)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(44832011)(86362001)(4326008)(70586007)(8936002)(8676002)(54906003)(16576012)(316002)(31696002)(70206006)(110136005)(82740400003)(41300700001)(31686004)(5660300002)(478600001)(47076005)(40460700003)(40480700001)(2906002)(53546011)(6666004)(356005)(26005)(36756003)(426003)(336012)(2616005)(81166007)(36860700001)(558084003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 06:37:32.8914
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce30186d-ec76-4a5f-01bf-08dbd45bb40b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB9020

Hi Stefano,

Thanks!

On 23/10/2023 22:56, Stefano Stabellini wrote:
> 
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>

~Michal


