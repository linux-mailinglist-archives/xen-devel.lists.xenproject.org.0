Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBB6F6D72
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 16:03:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529791.824583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZXl-0001Tt-8o; Thu, 04 May 2023 14:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529791.824583; Thu, 04 May 2023 14:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puZXl-0001RZ-5j; Thu, 04 May 2023 14:02:49 +0000
Received: by outflank-mailman (input) for mailman id 529791;
 Thu, 04 May 2023 14:02:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=evI0=AZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1puZXk-0001RS-18
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 14:02:48 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57974971-ea84-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 16:02:45 +0200 (CEST)
Received: from MW4PR04CA0141.namprd04.prod.outlook.com (2603:10b6:303:84::26)
 by SJ2PR12MB8034.namprd12.prod.outlook.com (2603:10b6:a03:4c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Thu, 4 May
 2023 14:02:42 +0000
Received: from CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:84:cafe::c8) by MW4PR04CA0141.outlook.office365.com
 (2603:10b6:303:84::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26 via Frontend
 Transport; Thu, 4 May 2023 14:02:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT021.mail.protection.outlook.com (10.13.175.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.26 via Frontend Transport; Thu, 4 May 2023 14:02:41 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 09:02:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 07:02:29 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 09:02:27 -0500
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
X-Inumbo-ID: 57974971-ea84-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nJRHdZQmxg0Es0JNCevGX8G2QRF48Blkqr8RKMYwZnWYmIbPSXXV/hL+gv8gquSQFhM3WdOd3Ay9eQL5Fi84e1T52iDUJtPddH5Olb3yYrH3c1U6RFGslPQzB/+Pxyp4PfRbuxNOUuCOuEXFSJzPddWqHXJ8ZGSPaH7+nVeNVJLXlAx51nb+JNPZPUETPoR0ozx4rGeTdOCm9y1mS46/KPzdjJEqnR8mRFw/73b2q0wEoaAMP/FHpp92qPyzLz6Wqqb0EWfc9YxQHm3WpID5xG7NcmCEqfUC3OHX3+NNve+6IJs+KlhtyFN4sM7mentxOQyEs3w1pBpzJy4ansbpHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7oE9mA49/oLEJUa5lypAPBMHC8yVI2C9QFL9UWflj8=;
 b=i8hAokqmN1I8/l3aqQ7adZFb6fycX/ePDJ8pU7k5AJ3D3GMTPvpuhWn9RJKP+4rb/83zUBsfxSDP6/hIadR6bJBJYtkzTXqJqq2QeKJsKZAR91bSgVAqxxTRFAYAWhxTL0SCW7GB08UNkOTfVcJ/CfCM2bJgSeWWBcIWGNz8UXX8XiHY2WYIqZGF2XWpLQVCG8HnO2KZIOnEBTQehkIKTMPEPsMbhL7nswIyUEKhftjcK3FvL3WEXZ2pEkkb8DwxZaKzY5gas4jJcR9PuNcUTS6S5Oq19qQjIxHpQxR9U/YWMikwfXfJWurAiugRfQ82R4YI/p83cdILsGqRdbU5OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7oE9mA49/oLEJUa5lypAPBMHC8yVI2C9QFL9UWflj8=;
 b=cIxrvC7MNAdSF2yFPL3xujWKcvjVJeW92p1RkDjqGrBXV+2wWcqkyJW3MgWZMCVelmEUUXTY/INMQEpn61Cql5inku0C5Bea1Om2nrbwEGQaks4zSiszCD7r4IDx7eyMsRltvE+yE5tyyejZp/siMF9nN6VWfdh3Jeaqy7OYz6k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <2f45ce2b-32f1-7289-005a-edbb694a36be@amd.com>
Date: Thu, 4 May 2023 16:02:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [XEN v6 10/12] xen/arm: domain_build: Check if the address fits
 the range of physical address
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <rahul.singh@arm.com>
References: <20230428175543.11902-1-ayan.kumar.halder@amd.com>
 <20230428175543.11902-11-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230428175543.11902-11-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT021:EE_|SJ2PR12MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: dd76ec00-cd36-486f-707b-08db4ca83a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bekhy7+hLM8TbDX9vu6EFljfO6TOX47l5m2N9b4YJdN1NzW8Yntc61NHA+otsztDsh3fP3dpyuBbnWwgNL6NSOLXys/ZSZjM3mxjS8xM+pAzatk/fV9xdTmIxO/uUzU+BJaElwfWYiqbWQSVfWh9zGhq6RU1sh43b1T1GD78CFpKEBAraeG5t+JKZeoLrRYXzvmZ+iTco1BQJvEsZqBggLqJgioGnSxV2vqcTJNmg5wkL3YScDiRez1n3s/IDgtfkOH3Gc9oA7XS4uj0lW3P7rNPnHi+MU7BovHAhfl7JShMVbWvnAHmTo6xhmzRaCewE7ml0+epMAZv/or9tdUUvCghWteVqjVKQ31Eh0KE7yqmLzsnpTfnPP9hHQMS/JYzkDt7FyKt5WLuvAzoszR0gGxOqcH0qapH9p4Xh2kEnKrnmpJ1uZdgMfzUVOi0wNKuXv3mLdOkZ110Biv7ObJJ8lI4DHskyxkWi2PxSuCYyq0A9vfvSAoocmnyykBzX/ZZ7ER/1vX4erhifE4hi4dP9TK4/UloUGNrIjp3sR9Aie4VRRhBXxuErZ+dtunpUYsGnp8Je6lDlsLvp+N2YQL9iQYqj8odCE1z8t7dYI/BwR/CCeDylK2RA40IpSOpFFWp2mjGCbCc6MTQpk003cWYpsOPADPFiAod47vo83HZklltLL7jMMSCT9AcnDm6ZAk20Py2+sb+4fN3lmJNmvtS5t8DvdZYCbPaLFfsKqTmeGpQ6Rwk2jq+ZVHSePiPNxBbyoZgglMor5Lx/9ssxNswhQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(46966006)(36840700001)(40470700004)(44832011)(54906003)(8936002)(36756003)(186003)(16576012)(8676002)(110136005)(7416002)(31686004)(5660300002)(26005)(426003)(53546011)(40460700003)(41300700001)(81166007)(2906002)(356005)(40480700001)(316002)(70586007)(47076005)(31696002)(2616005)(70206006)(36860700001)(478600001)(82310400005)(4326008)(82740400003)(83380400001)(86362001)(336012)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 14:02:41.8717
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd76ec00-cd36-486f-707b-08db4ca83a5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8034



On 28/04/2023 19:55, Ayan Kumar Halder wrote:
> 
> 
> handle_pci_range() and map_range_to_domain() take addr and len as uint64_t
> parameters. Then frame numbers are obtained from addr and len by right shifting
> with PAGE_SHIFT. The frame numbers are expressed using unsigned long.
> 
> Now if 64-bit >> PAGE_SHIFT, the result will have 52-bits as valid. On a 32-bit
> system, 'unsigned long' is 32-bits. Thus, there is a potential loss of value
> when the result is stored as 'unsigned long'.
> 
> To mitigate this issue, we check if the starting and end address can be
> contained within the range of physical address supported on the system. If not,
> then an appropriate error is returned.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from :-
> v1...v4 - NA. New patch introduced in v5.
> 
> v5 - 1. Updated the error message
> 2. Used "(((paddr_t)~0 - addr) < len)" to check the limit on len.
> 3. Changes in the prototype of "map_range_to_domain()" has been
> addressed by the patch 8.
> 
>  xen/arch/arm/domain_build.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9865340eac..719bb09845 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1643,6 +1643,13 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
>      paddr_t start, end;
>      int res;
> 
> +    if ( addr != (paddr_t)addr || (((paddr_t)~0 - addr) < len) )
Given that you enclose the second condition in parenthesis, I would expect the same for the first.

> +    {
> +        printk(XENLOG_ERR "%s: [0x%"PRIx64", 0x%"PRIx64"] exceeds the maximum allowed PA width (%u bits)",
> +               dt_node_full_name(dev), addr, (addr + len), PADDR_BITS);
> +        return -ERANGE;
> +    }
> +
>      start = addr & PAGE_MASK;
>      end = PAGE_ALIGN(addr + len);
>      res = rangeset_remove_range(mem_holes, PFN_DOWN(start), PFN_DOWN(end - 1));
> @@ -2337,6 +2344,13 @@ int __init map_range_to_domain(const struct dt_device_node *dev,
>      struct domain *d = mr_data->d;
>      int res;
> 
> +    if ( addr != (paddr_t)addr || (((paddr_t)~0 - addr) < len) )
Same here.

Other than that:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

