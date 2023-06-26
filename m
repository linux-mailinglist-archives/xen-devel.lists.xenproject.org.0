Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD4AC73DD85
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:31:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555443.867214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkQq-000816-Tl; Mon, 26 Jun 2023 11:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555443.867214; Mon, 26 Jun 2023 11:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkQq-0007y9-Qg; Mon, 26 Jun 2023 11:30:56 +0000
Received: by outflank-mailman (input) for mailman id 555443;
 Mon, 26 Jun 2023 11:30:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM71=CO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qDkQp-0007y1-9a
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:30:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e834d455-1414-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 13:30:53 +0200 (CEST)
Received: from MW4PR04CA0315.namprd04.prod.outlook.com (2603:10b6:303:82::20)
 by DM6PR12MB4137.namprd12.prod.outlook.com (2603:10b6:5:218::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 11:30:50 +0000
Received: from CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::8f) by MW4PR04CA0315.outlook.office365.com
 (2603:10b6:303:82::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 11:30:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT080.mail.protection.outlook.com (10.13.174.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 11:30:49 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:30:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:30:48 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 06:30:47 -0500
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
X-Inumbo-ID: e834d455-1414-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fLwEFL/SdpAUgdugWglQKntKT6AnsU2UoBYif0QMNq1KNS9gXlU2ZWZ87A52CRLb2OHGacyXkPuLvfXzqJ0Yf75EUcrJ7SStHK4KEkHU/vcXJaC6ECYlVWozebAjJqEGWQadfsiDfKvzg7wxRqy1iqiQYEifxTeUW9hvZvdZJGjmJCn+V0Kee3QT7ZVb79CGCTdXhC+YDLJvg4oXkY6DhBTCvGoWUMIt7T8hcbw2hHNZcera409ogQBYwgKJjZ+LK/rT2EP3jrCkwOjpDNOWF+ZfLuFsjPj0qySOntZ9dj+koXZihJPYBv5Huzg5935JuMO6LPoMIaM8inXpZoHRXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9eoC6BRxpy61KJY+ez9tmSMIB3a1ZQz02pGHY6ypFJ8=;
 b=Gtvh0k7KSM1nzChTLGl+vUL+6o8LR7xt5ciIUSyzW+ovZuDh8TptNeraBGq1WIn18SeIUrIlcColpC2hbf/V6J24GXOiu+5flzXxsHjIB1vJ8OBwMoSpzsrBuPC0fdR5nNk5SsheF4chrmvn5qfImbsERZKyO72KM02B/GrW7v2EkZWj68NXdosG9KEs0Co4F++KJu2ya9jr2/DdLZ5az8ICMejzptWYfmImT5woJMYuqPFx1AX43TSLnB9C/h72y5MtzOlQp/V024uRDDl7Y8TounYsPUn8p4Y9Xb7QLZELG45+/LKXBQ1CuQ04SP5SPIG1+S2Xh95S0JDHkX/cpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9eoC6BRxpy61KJY+ez9tmSMIB3a1ZQz02pGHY6ypFJ8=;
 b=KP3BfQ5RL1fnV/hk5G79wLfvS+LB6Wj9IAAYwDPSennxDaN7mGxH3qxOxYvNmofbXWHC/b+rdRihFPN6Mo056v5sXK8nUcqsCOOmIjKHcfP+xoZNiX4c63DvgkQToOXGzkK9z+TTOMXoUFRPst228J0Ib9WjglLYPSCNDTIKyao=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <3b118c75-2fa6-994a-2d5f-487a01ec4272@amd.com>
Date: Mon, 26 Jun 2023 13:30:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/9] xen/arm32: head: Don't map too much in boot_third
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Julien Grall
	<jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-4-julien@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-4-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT080:EE_|DM6PR12MB4137:EE_
X-MS-Office365-Filtering-Correlation-Id: 429499b6-8a7d-488a-296a-08db7638caed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GGUBDvwuvD2PjK3Z89PBJ4B9vlCiWirnUcuigl3AsBtf3uiE3LtdiYj0ZBvdeNhosI1hM9WndPsX6FLgGIntaDz4kSem9UoYrLjlTxMV6qDDGSEaGYkC82XaxLUlcwwh6s6RL3wl7YGE1Dje5xUOxSQ9xDwrGVQtEFCpBAzNiF5lSFVN3vV1DJkjLYtxHrAk8qw5jsJ5yQwjJPg4M786fmOVlyNV7+R2kWCyxVdjGqjhbdQxOrQB715MXyXaTPgUkc84BAJ3LhBc8blKRs/3V1I0MpGzqNr0abwZRPPfzNG0tvren8uNSYspzbecQoGFk9Fit5OjmrL6BI9y0mHbKoM0T1qMdLZcZWGAy9eTTTc9IBdk0mZWG5UqhHIPp4wvqxvSgjXZtKVMMGZ9rRm/DvU5ZDSqY6W4fJVDwu+B6G/VJbuiRnJekFgbaq8JY2i675Mx2onhEHYXR/iKy+lyLnnHuIf6LdnSnqG4275kXjybvQTzpZ3VI8Xz0GYlwhbBkpZmzhkGIwKc0KWRSoTMfXfVNHbmMPs2iNNORUkwotwEZMLim966lRq4I/g/Zs5dLmLN0UMWUdXj9047jr68kRk2JSDP5C5OSG37c7/p7fA9dkDduqVgwGCELpy869Hkm68yhMRBTevDjO7a7ipnFsKe6rtlE0vJcqN7Mi9A4FmTM9BgQJJ1pjTuzVeClm/w3KknKk1Ta69UgThEmU8y35p8OpGh8n8iBGKcxi4tJnykTKp1QxEHURIhcBkplKVb8YIA7MTRWCWUgNFEGbQlbvP8fhqE8BoWEsCsePVV6CXiI7iX4C0mX/qMSzcXHmjr
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(31686004)(36860700001)(82310400005)(36756003)(40460700003)(70206006)(5660300002)(356005)(44832011)(8936002)(8676002)(41300700001)(86362001)(81166007)(40480700001)(316002)(4326008)(31696002)(70586007)(82740400003)(47076005)(2906002)(26005)(53546011)(4744005)(186003)(478600001)(426003)(2616005)(83380400001)(336012)(16576012)(110136005)(54906003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:30:49.6281
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 429499b6-8a7d-488a-296a-08db7638caed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4137



On 25/06/2023 22:49, Julien Grall wrote:
> 
> 
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, we are mapping the size of the reserved area for Xen
> (i.e. 2MB) even if the binary is smaller. We don't exactly know what's
> after Xen, so it is not a good idea to map more than necessary for a
> couple of reasons:
>     * We would need to use break-before-make if the extra PTE needs to
>       be updated to point to another region
>     * The extra area mapped may be mapped again by Xen with different
>       memory attribute. This would result to attribue mismatch.
> 
> Therefore, rework the logic in create_page_tables() to map only what's
> necessary. To simplify the logic, we also want to make sure _end
> is page-aligned. So align the symbol in the linker and add an assert
> to catch any change.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
The same comments apply as for the previous patch. But all in all:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


