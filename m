Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B17CC597
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 16:08:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618261.961695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qskjh-00034f-By; Tue, 17 Oct 2023 14:07:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618261.961695; Tue, 17 Oct 2023 14:07:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qskjh-00032Z-8l; Tue, 17 Oct 2023 14:07:53 +0000
Received: by outflank-mailman (input) for mailman id 618261;
 Tue, 17 Oct 2023 14:07:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZPX=F7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qskjf-00032R-57
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 14:07:51 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20624.outbound.protection.outlook.com
 [2a01:111:f400:7e89::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cf8aa43-6cf6-11ee-98d4-6d05b1d4d9a1;
 Tue, 17 Oct 2023 16:07:49 +0200 (CEST)
Received: from CY8PR12CA0029.namprd12.prod.outlook.com (2603:10b6:930:49::17)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 17 Oct
 2023 14:07:44 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:930:49:cafe::cd) by CY8PR12CA0029.outlook.office365.com
 (2603:10b6:930:49::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Tue, 17 Oct 2023 14:07:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 17 Oct 2023 14:07:43 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 09:07:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 17 Oct
 2023 07:07:19 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 17 Oct 2023 09:07:17 -0500
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
X-Inumbo-ID: 8cf8aa43-6cf6-11ee-98d4-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHOCBYOaiBMK7I4WUzs8ikMvNpj2WLC5g8oBW5kQXCHhcltP8PXJLGlI8ffWdh3dvcZuypklO6ovIxLo6XKnwGFtQsugXhPbTtC+4VCNtOwKyfcdDM/9kIzZ/SYH+8KToOBcEtkfPqDq7nvbtLODYXi0eLHfWVgZbpUJksj6WRdA81GKwmzhst03PyZSjEUIgDu6v5SuRvT/Wa/v0F9w8CaMBE9mG9O8SmK2h1CyJYlEdb3OrP3qQ2y8o2RtZddsdm6iBO9ZNDQV/4CoEEgQy4daOb7EqEtxuf5iZdhsyRMer4hmusoclRcupgSDhPCB1QmN03+Ry+KKhHgOF0fFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsKVDvh2ecqYCHCl3DPVr8ayxOXgqnPZCxpgmjm0d/0=;
 b=AP0tdLGuo/CBJt0APlFpaYT4hK8+DDy+H9A2q1x6ZcDdJJeRlqdKLEIXYe/9YP2t3dyiVE50Aaqu4bira5KY2YqrfrMkkI5zvPiYzSKVRS1MA5ir+kaAS5Y7lCw9qTfLMjNkHyPEW+pO/EzpSwxQnhI8hT3qVEup0ldkZqwLThLO5bwx6WRSr39zPhB5+0UIASh4uvMDsk96UBBSeY5sEBpsrX+XlcYrzQ1h7xp4Wog+4ki9tWJd1VR/+BxGbiyhGR1vpbPSENrsTuHmQK37zGSPFGkteN1gM0sGWMs6d+BYPLFAKTVz/DvSiHFt7jS3AZI+j8NwLKy4ib6gLkGWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsKVDvh2ecqYCHCl3DPVr8ayxOXgqnPZCxpgmjm0d/0=;
 b=3vxC/IF8eYIdwkZsMJOzXxeLzDtOPDrYsD/9YeV55Q57yf3slVtShR7is0aO/nFapA808d78qrjtDvecRjEJq5LzSVeGsvSxLL3UaYQY604WeV4eqBwkVx0URcNjOzF0BMltm6L2rMzYbcn/o8dOmng+XfLHhqQZeZwoXHQRd1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <9487bcbc-fedd-4d0e-86a4-023480bc9c54@amd.com>
Date: Tue, 17 Oct 2023 16:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.19] xen/arm64: head: only use the macro load_paddr() in
 the MMU code
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <ayan.kumar.halder@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20231017125219.76626-1-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20231017125219.76626-1-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a1d58d1-98b5-4674-34cb-08dbcf1a6ecf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w1X5sUnB2mPMV7LkB6zAgv+3N3Ce1y5aHBEYVNkf3yCFVofQWZK9jiIF54ULWahIcSi4n0WP99zobkMX3X/+B8NwHxZSr+6U/APvJ7YbtvgP0+98F3jFHjYe764JlA54VZh37Hok+hpyVIWjp98Uwz8JOBm8fTmkVNgttA5CoWywy36bBi9GEm40HSuFciA6VUfsLuTEnB4jAMSDeotTYYafjMRwn4V4RFqYqLij2qA1XMtTpO0uzinJUdEOyRBlyynY1Sua8plJbNwYNoUDncWTHQqQj6h4azDt3KMvrcE8c9zyjt7hhbrHOxCxrzAT+3K3W25C9bcrLK4bz8eE2UtKjifZSlsG6vBrO7/6z7avc3oyCUBlcENUBsXaXs3UCmKQx8rDhqX6UHuOUv63mbdXMNSCw5CI16ZZ4oDFHiD2vKqoASoTIK4p992GH+kD5aMtV16W4cHaCzgB49ntFVFb/70Alnni36DtHl3xziailfxAQZcGAEXlxMPr0DbU/VyJyEK/V6Cp8aAu948lKEAcGnGLiflx4JicuZNkgc6OLS+HlfLgimcQaAsLyG7zt8gofz4vw8cjVbXc0s1P4sR6LnLrh0onug0dmp8c/9MoQyhKS7/UxaqVKwBMye47mfeHt0LxfvyP2YH/AWARTzQsIzUZyurK+at8Eme4WWcr7P6eJvh40V9KjwJL3n8ayFjjsuck26odKACzSACBFG1A76m+GPusF00ITUGX+MCvrYjHmUyqygm1ccWbI6byb/0xUZ9hEtVyHxcmwvj6UFgbowWnbQ3MiOWtAbhtZF8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(39860400002)(346002)(376002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799009)(46966006)(36840700001)(40470700004)(31686004)(426003)(2616005)(26005)(336012)(53546011)(5660300002)(41300700001)(16576012)(8936002)(8676002)(316002)(2906002)(4326008)(478600001)(110136005)(36756003)(70206006)(54906003)(70586007)(44832011)(40460700003)(40480700001)(82740400003)(31696002)(86362001)(356005)(81166007)(47076005)(36860700001)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 14:07:43.7135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a1d58d1-98b5-4674-34cb-08dbcf1a6ecf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

Hi Julien,

On 17/10/2023 14:52, Julien Grall wrote:
> 
> 
> The macro load_paddr() requires to know the offset between the
> physical location of Xen and the virtual location.
> 
> When using the MPU, x20 will always be 0. Rather than wasting
> a register for a compile-time constant value, it would be best if
> we can avoid using load_paddr() altogher in the common head.S code.
s/altogher/altogether/

> 
> The current use of load_paddr() are equivalent to adr_l() because
> the MMU is off.
> 
> All the use of load_paddr() in arm64/head.S are now replaced with
> adr_l(). With that, load_paddr() can now be moved in arm64/mmu/head.S.
> 
> For now, x20 is still unconditionally set. But this could change
> in the future if needed.
> 
> Signed-off-by: Julien Grall <julien@xen.org>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Side note:
Looking at all the uses of load_paddr(), none of them takes place after enabling MMU
which would indicate that we actually don't need this macro at all. Do you agree?

~Michal
 

