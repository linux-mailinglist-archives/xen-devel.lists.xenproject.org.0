Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E93006F65B2
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 09:28:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529575.824086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTN1-0007mn-PC; Thu, 04 May 2023 07:27:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529575.824086; Thu, 04 May 2023 07:27:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puTN1-0007jm-MQ; Thu, 04 May 2023 07:27:19 +0000
Received: by outflank-mailman (input) for mailman id 529575;
 Thu, 04 May 2023 07:27:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evI0=AZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1puTN0-0007jg-8p
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 07:27:18 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 171caca3-ea4d-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 09:27:14 +0200 (CEST)
Received: from DM6PR13CA0003.namprd13.prod.outlook.com (2603:10b6:5:bc::16) by
 CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.31; Thu, 4 May 2023 07:27:11 +0000
Received: from DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::94) by DM6PR13CA0003.outlook.office365.com
 (2603:10b6:5:bc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.9 via Frontend
 Transport; Thu, 4 May 2023 07:27:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT064.mail.protection.outlook.com (10.13.172.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 07:27:11 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 02:27:10 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 02:27:10 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 02:27:08 -0500
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
X-Inumbo-ID: 171caca3-ea4d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NwPyUoFiPLy79x+V3gAUVNnuJ2u0KI35vP94nwvM/SaJBXAWZb9c37jU2Pokch9tRiD2GdxUhp3RO5CnVKKIXPmr4E28b8NSwFfcfdhxmzKZ2AMdxhgcqmmxCDeNX8nBOzQ6MCwIDaaeCQHGz4Rv8EysxCPlJTKzjJ1ynsEP7lrzIGgS/C5NYCazPZaVsqLbAYjO6xABrIv1KW59+7ySHjp6X3+a0S5wMGuOfZbA7hRmtT1aGfdgIfaDL6Y3sWX2urooLvF/oTwnwui4Cx1JL2nC4/i3Onr1MXzJXxXuapngnBMu+4CMb4+tMnOKDlZHEGiWpISsZdN/+fzL22Ql2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piNITOBU4G5juGieXw/xT3ryw6m2OzxAGcoOcWNc/iw=;
 b=HHaj8lxxAIK2tFW68v0PHujjDhshCHYqhRkprRY7urzOJmeZvuCEpGuqNvfAJ9c62zilsYGl1s3nbN32KRxa6DEUskgNa7sr/1bXrJWiqCuu/0lm5pa8wKvlTS7wSUwEYCRxWd4beSbyYoyCVKU6y/NFBeB/0zYy+J/MGnip9Dqw6vLsj3GC3BKZWgb678GXRi9Rb+w5+0aqbZFsxiaOC/3G66t7ej+fhe055CmQlGKzWAL9wwyHINEkiHuUCu/PXJ4EMM+aNofs87pn3zN8/fl9y3EzGkDekeNhsG90/jp+KOwf7avDZd6ac1v4RNnzLZ46CzgpXn+SYQGa0UMJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piNITOBU4G5juGieXw/xT3ryw6m2OzxAGcoOcWNc/iw=;
 b=OBZhlXOw8V74WbQ6zZcl/o9w1qQXUpmx1bPGfzrlLL8Jsl6pdGqFlhY8xTYAJP7DWc59DjQtKceV5gfVRxMmoBjvQTFOovO6wqMevWmkyGRwh3p288wyUpQ2L6sTUNB4zLf6RQDurBcUF66jQzxt4wZmsaQ2nz4UIWH7ebmI0+c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <a5aae4d8-ffe8-bde5-9f3a-d1489e31b0d2@amd.com>
Date: Thu, 4 May 2023 09:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN v6 02/12] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-3-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230428175543.11902-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT064:EE_|CY5PR12MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: f634efe8-35b0-43aa-009e-08db4c70f9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uk5LriQ8imUIgWFcpf5KoiCMPj0Rf0so0oPeAFhQJL7tpUr34CnJmUYAqxMJY5S6erwe0Xl/2AkWamXG68SrABUSx0Ynw7oyi26edk5K/dNFuV/XoppVqMrhZBTRUZLxQnlo0P3Ypw8C83rTSzw+UF9CBhSXJH0JU1tThWqjjKW6g/Q0lCrXGNkwiZyM3ejfQRcLZMDz0owHvyl9DNITtKYQ+2/L0lF1IA3AgoNQZHIcBbcGZ7zuvZRui/tqbYOzD3bb8DccM8AQaGvmc2XsFuB2UMq+qt3tVUTbiZoOxscHtPequQ0wd0GHUN2hczrWUl73Q4Yn2R+WaaNR9MX8YZC5JmF/7S6gShWEfdXyOeQ7RsSGv58RFqvmCTS8kyNxisLt2QvOTyPuPDk1mgT/G+gykePIci1LSSBNuFFmh9vyxr9w4C9rCgZmW5AvY7uiV+0VIADDgeSI2cv/J9GB3C3xei3sOTzag0GrtmkJGf4f+BoqP2OYE4LpSimT06NpegZht33zdFxldxhkMSzzDbjX+zzcFXoyok+q176mmLlEGwEUkpzEMkW2BoaTKW4LjzZwIjq9v5mOVFnYyQB/4dtIvazYB8GsTXBFWt0REqfOKN6UsUKFUaOQoAU5k59p0zudwSZ73SX9/hgVjDKXQS2kV7iXpn6MzpJyHqv+i9CCM7FCNqRTw8kUJm8G+aWxQkmgPwpzQGNsTrJqHZX2otyq6KfmHhaLEYvARApU/++SpDVQclY+Lx9LsNfqRtBDF4/eck5OsTywoSggLVFcjA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(451199021)(40470700004)(36840700001)(46966006)(70586007)(70206006)(82740400003)(356005)(316002)(4326008)(40460700003)(16576012)(478600001)(82310400005)(31696002)(110136005)(54906003)(36756003)(86362001)(186003)(40480700001)(53546011)(26005)(36860700001)(2616005)(5660300002)(44832011)(31686004)(7416002)(83380400001)(426003)(8676002)(8936002)(336012)(41300700001)(81166007)(47076005)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 07:27:11.2761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f634efe8-35b0-43aa-009e-08db4c70f9c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT064.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405



On 28/04/2023 19:55, Ayan Kumar Halder wrote:
> 
> 
> The DT functions (dt_read_number(), device_tree_get_reg(), fdt_get_mem_rsv())
> currently accept or return 64-bit values.
> 
> In future when we support 32-bit physical address, these DT functions are
> expected to accept/return 32-bit or 64-bit values (depending on the width of
> physical address). Also, we wish to detect if any truncation has occurred
> (i.e. while parsing 32-bit physical addresses from 64-bit values read from DT).
> 
> device_tree_get_reg() should now be able to return paddr_t. This is invoked by
> various callers to get DT address and size.
> 
> For fdt_get_mem_rsv(), we have introduced a wrapper named
> fdt_get_mem_rsv_paddr() which will invoke fdt_get_mem_rsv() and translate
> uint64_t to paddr_t. The reason being we cannot modify fdt_get_mem_rsv() as it
> has been imported from external source.
> 
> For dt_read_number(), we have also introduced a wrapper named dt_read_paddr()
> dt_read_paddr() to read physical addresses. We chose not to modify the original
> function as it is used in places where it needs to specifically read 64-bit
> values from dt (For e.g. dt_property_read_u64()).
> 
> Xen prints warning when it detects truncation in cases where it is not able to
> return error.
> 
> Also, replaced u32/u64 with uint32_t/uint64_t in the functions touched
> by the code changes.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


