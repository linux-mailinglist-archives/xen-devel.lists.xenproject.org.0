Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8BC84B9F7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Feb 2024 16:44:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677016.1053410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNcK-00017v-N4; Tue, 06 Feb 2024 15:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677016.1053410; Tue, 06 Feb 2024 15:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXNcK-00015P-JY; Tue, 06 Feb 2024 15:44:12 +0000
Received: by outflank-mailman (input) for mailman id 677016;
 Tue, 06 Feb 2024 15:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6vd=JP=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rXNcI-00015J-Hc
 for xen-devel@lists.xenproject.org; Tue, 06 Feb 2024 15:44:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8feef67d-c506-11ee-8a48-1f161083a0e0;
 Tue, 06 Feb 2024 16:44:08 +0100 (CET)
Received: from SA1PR05CA0006.namprd05.prod.outlook.com (2603:10b6:806:2d2::10)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.14; Tue, 6 Feb
 2024 15:44:03 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::4a) by SA1PR05CA0006.outlook.office365.com
 (2603:10b6:806:2d2::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.17 via Frontend
 Transport; Tue, 6 Feb 2024 15:44:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 6 Feb 2024 15:44:02 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 6 Feb
 2024 09:44:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 6 Feb
 2024 07:44:01 -0800
Received: from [172.23.114.18] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 6 Feb 2024 09:43:59 -0600
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
X-Inumbo-ID: 8feef67d-c506-11ee-8a48-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IwHKLgJBvmpC0YzBpPTi+hwV828OIdVdPvAIkm6CN8tl/caH9cQrdhbIFpeb2ngsVDvR4rsMYUeobuPcyNSHjEM6GgtbtPbKMwPoBY+jou2zuX2DXqt+OgOnGyLMhPkK/hAdCIQlWxgzRsCISuEgcAjb2kHf7dEJZkXG3bHUzjwyoz/KfRD8Pg1ATsk6dRSqmWh9U0w2aIecdaClE+P8D5Tg3T1sf2gMXsy+g3Wr0qevQXrYrGc1Xr8wjPBJZMjgGzf7UyeLz9aNJBjLLceggJ3dVlgsiv5chUFYPCeQ/gPNKMTCAMCTlCxbOS3AmJE0wKkXNBqivJsfdUTA9GbwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uW+dyA4uXT1vZWzti66UCaFqrNJtNdR9zsDv9KTJ3eY=;
 b=BhNCUUVKoS+Yyw/FtzcoLnYMEaY6dU6PelaFx5U0TZ6bjCbNakzKxfaOFpkxBKQIp2Rocdb611a5pHs4uDLcJd/jUlrr3zu4/ta7put/gIYWZ08U+cSzntftFNveMZusI3Q5M8XwTI48iuTmLnItUgyKdz+aBmSfaKDni6uPAwTbemvAilq8hohKeaX5fN2TQk6mAkGhmGeeBl/2FxdMXxkEjtlwHuD9khQhXUqk9SsIHncZVKI53u4YnLynHBOS9ji3UDIBpK36ETA81vDwUWTUt0L9sGA9GWysv3wQwYUnEBLJipFH+M/QSzVoqZBEXkgcDlorHyCrc4aAInBg0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uW+dyA4uXT1vZWzti66UCaFqrNJtNdR9zsDv9KTJ3eY=;
 b=iETKXN4DhY5ELucE175SoAcrjFE2FilfN24V6sUi199Tfd8E2Jr+cAjeb/zEEeDnJw33QIbSirJ/ELKkKZsXjY6pjZLeurgVwSxY04hCGxCb80ohFfzm2nER0d0ErauxUSiTnijW5GytufWNM9r5Y5uVbaCx1nyIqXnCX+XDQiM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b9d8ddcd-cdf1-414f-9990-7c2fd3d88f4b@amd.com>
Date: Tue, 6 Feb 2024 10:43:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 01/14] vpci: use per-domain PCI lock to protect vpci
 structure
Content-Language: en-US
To: <xen-devel@lists.xenproject.org>
CC: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, Paul Durrant
	<paul@xen.org>, Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <20240202213321.1920347-1-stewart.hildebrand@amd.com>
 <20240202213321.1920347-2-stewart.hildebrand@amd.com>
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240202213321.1920347-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f966c06-e0b3-4cc9-9a7e-08dc272a7177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7MMACuPhJEhnZ1V6gCoC/C0miSB8ujupGsoVg87urkkujswFbxI2lNDzAQkbANry/utQEKaKtEZ0pYTLbo4hgUXyE2kxA8qrEkqGM8kt7enI5ZlYnG0+nJhCA/Tn9HYkzfpRwlUCOyjlUnWhb0Iqcw3WuCSH45+OKzwC8zrSOX0B6x0xXiF/njkYu9l05nVD9qYOoOALNAv6eI65HenRrBmx8boJRHU6docQY3ZFc0C5cyUhBV5N0Pqjb/K9OglHV/MdQOBgLh+7VABuOI0v259pCiuLobFMk+tPDc9t/7Lgfags2ZKeED7mA5ak5OrH85pqg/EIG2OlakzHgSmOODsNn5/8Cc62UPQ5zoxAwx41XVOEZqNyCLGN5oQeVAFf9TAk6VoOAgDnSoaYxqWkomQ1Vn8B5ro/ZtIDqF8Gf057+lwER7LnYO4Qz12y2moQdbMyPCff3j4XqcRvGM8hQjoWBgx3Y4TFCVYJS4+KYYky5IA+f+1h5AvhfSyBnMseG7VOhsTP624PqS0mXKYAegy80S9slBOUs9luEtcPhwAj06/ZT9E77I8iSbwCiGD1dqvWCdHLPIldpYErzVTTgtzToH7rlBj4CnPXC9NLGrcLv+j5MvP+98JHPA6d+kPCDNIM3BxAIk7AzH9QNJDEcJ8xNO0j/U5zgMaoY/zxhzGOxISFj1sEYxqhSIptxXPTR/8sND/afk34YiESePY0Z99WewdERtCYhpquGyrik3Vmdl3T/Hws+WNvPqW0cyZs+6g8jqhugHhDkwyeUTERmwIK6Ct1OutkKPECjY0fipk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(64100799003)(451199024)(186009)(82310400011)(1800799012)(36840700001)(46966006)(40470700004)(6666004)(26005)(2616005)(31696002)(83380400001)(70586007)(70206006)(356005)(41300700001)(82740400003)(336012)(36860700001)(966005)(426003)(8676002)(8936002)(316002)(2906002)(16576012)(6916009)(81166007)(54906003)(4326008)(44832011)(5660300002)(7416002)(86362001)(47076005)(53546011)(478600001)(36756003)(40460700003)(40480700001)(31686004)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2024 15:44:02.5073
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f966c06-e0b3-4cc9-9a7e-08dc272a7177
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

On 2/2/24 16:33, Stewart Hildebrand wrote:
> ---
> Changes in v13:
>  - hold off adding Roger's R-b tag even though it was provided on v12.2
>  - use a wrapper construct to ease readability of odd-looking ASSERTs
>  - new placement of ASSERT in __pci_enable_msix(), __pci_enable_msi(),
>    and pci_enable_msi(). Rearrange/add pdev NULL check.
>  - expand commit description with details about using either
>    pcidevs_lock() or d->pci_lock
> 
> Changes in v12.2:
>  - drop Roger's R-b
>  - drop both locks on error paths in vpci_msix_arch_print()
>  - add another ASSERT in vpci_msix_arch_print(), to enforce the
>    expectation both locks are held before calling vpci_msix_arch_print()
>  - move pdev_done label in vpci_dump_msi()
>  - update comments in vpci_dump_msi() to say locks (plural)

Here's a patchew link to show just the diff-of-diff from v12.2 (where
Roger had given a R-b) to v13.

https://patchew.org/Xen/20240115194309.45683-1-stewart.hildebrand@amd.com/diff/20240202213321.1920347-2-stewart.hildebrand@amd.com/

