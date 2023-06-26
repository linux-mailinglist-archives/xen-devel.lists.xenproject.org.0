Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC9473DD6A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 13:25:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555433.867194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkLF-0005wa-VU; Mon, 26 Jun 2023 11:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555433.867194; Mon, 26 Jun 2023 11:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDkLF-0005uv-Rh; Mon, 26 Jun 2023 11:25:09 +0000
Received: by outflank-mailman (input) for mailman id 555433;
 Mon, 26 Jun 2023 11:25:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tM71=CO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qDkLE-0005uo-Oc
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 11:25:08 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7eb2::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19c53b7f-1414-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 13:25:06 +0200 (CEST)
Received: from MW4PR04CA0059.namprd04.prod.outlook.com (2603:10b6:303:6a::34)
 by SJ0PR12MB6902.namprd12.prod.outlook.com (2603:10b6:a03:484::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Mon, 26 Jun
 2023 11:25:03 +0000
Received: from CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::70) by MW4PR04CA0059.outlook.office365.com
 (2603:10b6:303:6a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.33 via Frontend
 Transport; Mon, 26 Jun 2023 11:25:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT050.mail.protection.outlook.com (10.13.174.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.47 via Frontend Transport; Mon, 26 Jun 2023 11:25:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Mon, 26 Jun
 2023 06:25:01 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Mon, 26 Jun 2023 06:25:00 -0500
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
X-Inumbo-ID: 19c53b7f-1414-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoIlPHRpi6+aa3LbiXjXlSK0dc0qxd9OGAM88iYl5piptuhgJaqSW4BRz9WaghqqFHf20eqsrHXuh/bumPiKr9LUXTiwmGjPQE0O0W4OFyBWQJ3R9VLuEP5/taIfLOeaAN0XGFVLlYrOAGiOvHl7jvaewahr3j3Z1jTGTxWoXnAJrcZIjmQOscYGTfKC15K3Acnvxcpm6kjibMbC8XvVuMPhor2XYUCb4C7iobrMVTMsR48fYamN99cF0o1lq6fe4LzIpI+zjULKeiWTLtMVL1faZolJgO2e0gqBzn3YcAW5mHzkMQvMx/S8gUK1d5AkOnQ/Xc1k1LZkDWe0+/JOrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=75PuDGlVf5/qnqFXq4vjtQDZbcDiFxmbyDYQh2ee2Bk=;
 b=OvLlZYf2J/cWXLi+o8KI2fEROhOtlIfIIrtedVIptIY5qSPYbs6gBgD1wg4wR9I0iEg4Y1hcTBmMMgjZiduUVy+cB//uakd67qwzBkpj/mBHaGEeEdFSG9qWXIJEA24WEiWdUpenAmDB0IyBpp0bYEP9IJD8+Jxp2GVIdhCoYozGWDgijCVi8R5KHGNiKaEN07e6qKuxvwyA4mYc86z/Grx5K4ATt2e9BIcUtfp8gHd0Zw12Flx4Nh5xFWIZkyFCyvhfHLAdKOOG6ikfNDcYWvDoepLyAwXwpRCE3kG8cmkvGYr148o2y8LodyWky8IQFzquP9bm4+Cv6mED2gjLsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=75PuDGlVf5/qnqFXq4vjtQDZbcDiFxmbyDYQh2ee2Bk=;
 b=qrg8k1S+3IgZaY79GlI6HT4CHC7x7c4T96dzp9sTZS4lIuIAkTkJlm4k1bMf80tqJsCg43uEFd4P/Q5PEBDaQnMphb4kRcFVc1C9oLXdiqcDevqM8uMQlKc87+WvSACJrCzbvuZVzM6BXD5eHgWgTXZPxXrBpWY3OsqATGwP9J4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <e54f278b-8305-e278-6669-04857f50f38f@amd.com>
Date: Mon, 26 Jun 2023 13:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/9] xen/arm: Check Xen size when linking
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: <Luca.Fancellu@arm.com>, <Henry.Wang@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230625204907.57291-1-julien@xen.org>
 <20230625204907.57291-2-julien@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230625204907.57291-2-julien@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT050:EE_|SJ0PR12MB6902:EE_
X-MS-Office365-Filtering-Correlation-Id: 68fc914a-d445-4207-3e1e-08db7637fc10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B8k2RD1NXC1HINRvQanimq6IiOlzUZVYL7IUyQOzES/lWEhyJrhTb+nd972QO+MOQhlBLMJ4A3TSxAXMOkIffpyHD9MfRuzrXgq1r5+CIoVK1xObTQYAWryM6HHeWSItkhBbC9QhxrDwF/sadAUD5bZPh5rRd66pfX75YzpQWUJuvfhOZ50eoarFsUwZ9C8q54bYN4lLmDJkC5wqP/F3FNFr04/hpmyLiwnw76Tp8zsavNoSvey/HGrr3+WssgMpk1GmXr5At+ArBKgSQuOIlzoxlP94cLyqqHCvHVU16xK0ZyeK/m1wP0FPSfouUkj7GMoD/R/3kmNmHgJnHH7t+/HVTHI2ZY8meSIaiN0vrd1dN+75WemR9j/0i9SyVGfkpHYarlKsO+cLokOed58EWc4T6ZdLXlaSE6pW0BmO7f+UFIV32lAlNsOVRTpMS9KbToFzpMpz3510B1B5T+CaJswLdp3O3DzVt+PIrEx0OJXtJQxp/uF/2nxceZUQndqDk1Eub5bbJpkfoY7VgZ40kZk8ZwSY0Rf0vTCNBoKkgjrePFEcuLg0PeIIovmSmAkeuBVMgCuxs4TI4DrY6LhWRzLS7OvjxPk2/hPk60mD0fnUUank7N6SoRtfG042InWpAKyHGM42S5LH2tBqNf/nivB4STAskJnXs+K8y2e1U/L9BODBTIACjeGPacZHXrM2ra1Opit+sHaw1bE0TYUluxR/BNiFULdA1XQgbN+t4WONx+paY8TqBRiY3u+TMVl6Kd2G9OKUM6Zo4gyqmxXHhNKf67CReiIDv0BsVnVn3CrTYg77wEpZk/16Ty51bwQz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36840700001)(46966006)(40470700004)(44832011)(31686004)(5660300002)(70586007)(70206006)(4326008)(478600001)(36756003)(316002)(8676002)(8936002)(2906002)(40460700003)(40480700001)(36860700001)(110136005)(54906003)(16576012)(31696002)(86362001)(41300700001)(82310400005)(53546011)(336012)(426003)(26005)(47076005)(186003)(356005)(82740400003)(2616005)(83380400001)(81166007)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 11:25:02.5540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68fc914a-d445-4207-3e1e-08db7637fc10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6902



On 25/06/2023 22:48, Julien Grall wrote:
> 
> 
> The linker will happily link Xen if it is bigger than what we can handle
> (e.g 2MB). This will result to unexpected failure after boot.
> 
> This unexpected failure can be prevented by forbidding linking if Xen is
> bigger than the area we reversed.
s/reversed/reserved

> 
> Signed-off-by: Julien Grall <julien@xen.org>
> ---
>  xen/arch/arm/xen.lds.S | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index be58c2c39514..c5d8c6201423 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -241,3 +241,4 @@ ASSERT(IS_ALIGNED(__init_begin,     4), "__init_begin is misaligned")
>  ASSERT(IS_ALIGNED(__init_end,       4), "__init_end is misaligned")
>  ASSERT(IS_ALIGNED(__bss_start,      POINTER_ALIGN), "__bss_start is misaligned")
>  ASSERT(IS_ALIGNED(__bss_end,        POINTER_ALIGN), "__bss_end is misaligned")
> +ASSERT((_end - start) <= XEN_VIRT_SIZE, "Xen is too big")
Would it be possible to use _start so that we can have a consolidated way of calculating xen size
across arch linker scripts and C code? It makes it easier for grepping.

All in all,
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

