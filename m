Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA87665B2F8
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 14:58:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470318.729782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLJu-0005QV-AH; Mon, 02 Jan 2023 13:57:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470318.729782; Mon, 02 Jan 2023 13:57:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCLJu-0005NU-71; Mon, 02 Jan 2023 13:57:42 +0000
Received: by outflank-mailman (input) for mailman id 470318;
 Mon, 02 Jan 2023 13:57:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7CY=47=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCLJs-0005NO-KE
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 13:57:40 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2087.outbound.protection.outlook.com [40.107.95.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6949fb15-8aa5-11ed-b8d0-410ff93cb8f0;
 Mon, 02 Jan 2023 14:57:37 +0100 (CET)
Received: from MN2PR20CA0012.namprd20.prod.outlook.com (2603:10b6:208:e8::25)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 13:57:34 +0000
Received: from BL02EPF00010208.namprd05.prod.outlook.com
 (2603:10b6:208:e8:cafe::61) by MN2PR20CA0012.outlook.office365.com
 (2603:10b6:208:e8::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Mon, 2 Jan 2023 13:57:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010208.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Mon, 2 Jan 2023 13:57:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 07:57:33 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 07:57:33 -0600
Received: from [10.71.193.33] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 2 Jan 2023 07:57:31 -0600
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
X-Inumbo-ID: 6949fb15-8aa5-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W2VACdSmDz5iLDl0kP+sKe7hWiU6YDRc1rVINaLagfuz2xO6h8wpOBGQUvZScfP9B65z8RLn8z6QiJFnpALDqOW/7HoHUyVFRQc2VT92s4eCgGQdOJM7lOEeKOsHOjOZj9NrgxXyji/GJSsDPv7n9/04ksHQgksl+IIKODUvniwqxZFR4t+S0ovg7InKRf3GtqjfQ2eV9vqS6a0PZk5vEj6NZM/r3ZyNgfZdlVMPcDFVv9QSw6eVKPTZGnrVZ5mBkbRcBRV+vSVtuqBPmaAtaeSuFiqAC1axxbh23UBnWl6aXb7Jox1AQlwX18gimuIVibs3fWI/Ga3Kt7r4h2HvQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kOiwgzj1hlD6HA/7tnUM8GQZQVyFlg4Pd1hXLiTyrPs=;
 b=PfwAjgafJQ4wE19tbbhz4SupNPCIu6JvU4qRcprGSEGE74R9/U9xJ2lt4S2ru5o87oSFfnXNjB+O8Xy7h29O9sdrbZWrGI6YhkaVjvNLnx16Oe8SR9uPAQnJdmEZE62U6S3rkZVPFy9fVkHiYDPjwkGqzrY7XizPvrDtqRIvUL80QkGCotRGlM2y+c0YHJbDT5tVyWbSyHa9vrz4ZROFHzn9ypUWS5BSnPFWg2OW8bbJ/Fq2Wjdv6Gr6BLWnoJW1gh26s1Y8eEux2u2eewpYuLy+ufpiarlNbSqkcff9MKQELZep02Kg5yfuF+O++s8qqOYhzcQGRCFiRkxTk4Q28Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kOiwgzj1hlD6HA/7tnUM8GQZQVyFlg4Pd1hXLiTyrPs=;
 b=V648YDqu/sZKWeT7uxbJEkxoDrsDuP2r3tF+6PyO5z4+84k+Pi+/puGv9YYtZ1gkbsz/XB+jjVVVe4ukN2qGyrSXsGu2NS5KQSwg0sT45E5geZpgwUVbVy/Be+Z+f76G2f34KryawlL3xUX1AS4lwLcM7eC7HS6MADHf1AImjDU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <8f26f8fd-ec65-57c9-4ab3-7cb411580b6c@amd.com>
Date: Mon, 2 Jan 2023 14:57:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] CI: Drop automation/configs/
To: Andrew Cooper <andrew.cooper3@citrix.com>, Xen-devel
	<xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>,
	"Oleksii Kurochko" <oleksii.kurochko@gmail.com>
References: <20221230003848.3241-1-andrew.cooper3@citrix.com>
 <20221230003848.3241-2-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20221230003848.3241-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010208:EE_|BL0PR12MB4961:EE_
X-MS-Office365-Filtering-Correlation-Id: 65123726-f4a4-43bf-ec5d-08daecc94c5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5MDAEZPX9//T8/0czxw1hwJ1Mrqw03IEZsi/OJ9zHV/+qfhJ3E2qQf5nAxRkUUqdJBqF0V+G6RxW8l3uDX7R/M3xe3xSCqtrO3o/SgEVCpCFZ0KaOXL/SGxkxFLiPDTTE6nzYVhxHGHC1Vl+PBQQLnBSkGFPPzdVUeZxF0OG2Nks5kZnKHPKU1cC1K/M1/xtv5QS8fILQKbYfAAbxCIjj1wZVf3CRlusdw4pkwIUrh4HLh9VyRx/4GArm/H90ZW5aVyAVAwmru3lqDiUHEFsB94JqwEJ3TgS2pl3YyYXFkLEurYsJ00K/Ma1eKtDK7AuuAu20zV5YizrM5+ysd7QSIXHhUM0hssBAX9NAkF1kIOr9d2qfiIVvhT6P+qtIb+/Ptjzaj8rcsNcnmWTgM2TtRFa6ud5tiBU3urxGaP0VDJHkHZtkxPjD9nLrVgrbtafV32n7DdOjkSGPK4Lz2/59oizEZT5GueWnwqjhG63+dzKLuQX6/4zZzNwnFjtYSTmkVz0pb+jke/8haL4/gxVKPCJxvHX0nSgooW1BoWo/I7U++Gnh5PDbsSnArFsXE4Lr9wVNUfLB9fHWvPmap/tHIRAGZyULFpGV3mtoy+Z9kj5B2StMj4S2EH9SmZTsEoIaqbpIYkLmr8k6hT3UIJSJCRFC2at2UFzVgpfGw73cpOesxE+Irml1i+ccCCnOhc5SQIPxC0aTFKLAS0lT+vHE7p1YULyNCvqYnuc/gN0LMVXk9jtDOoUIu1Cf124dqUee4jWz/mdNbaM2Gm+zQLhWw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(451199015)(36840700001)(46966006)(5660300002)(2906002)(4744005)(44832011)(8936002)(8676002)(4326008)(41300700001)(54906003)(70206006)(316002)(70586007)(16576012)(110136005)(478600001)(31686004)(53546011)(6666004)(26005)(82310400005)(336012)(40480700001)(83380400001)(47076005)(426003)(82740400003)(81166007)(356005)(186003)(2616005)(31696002)(86362001)(36756003)(36860700001)(22166006)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 13:57:33.9814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65123726-f4a4-43bf-ec5d-08daecc94c5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00010208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961

Hi Andrew,

On 30/12/2022 01:38, Andrew Cooper wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Having 3 extra hypervisor builds on the end of a full build is deeply
> confusing to debug if one of them fails, because the .config file presented in
> the artefacts is not the one which caused a build failure.  Also, the log
> tends to be truncated in the UI.
> 
> PV-only is tested as part of PV-Shim in a full build anyway, so doesn't need
> repeating.  HVM-only and neither will come up frequently in randconfig, so
> drop all the logic here to simplify things.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

