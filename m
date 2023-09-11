Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C59BF79A68C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 11:04:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599177.934467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcqU-0007mD-U7; Mon, 11 Sep 2023 09:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599177.934467; Mon, 11 Sep 2023 09:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfcqU-0007jn-RJ; Mon, 11 Sep 2023 09:04:38 +0000
Received: by outflank-mailman (input) for mailman id 599177;
 Mon, 11 Sep 2023 09:04:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yA6l=E3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qfcqT-0007jh-5D
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 09:04:37 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39b16437-5082-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 11:04:35 +0200 (CEST)
Received: from DM6PR18CA0026.namprd18.prod.outlook.com (2603:10b6:5:15b::39)
 by CY8PR12MB7730.namprd12.prod.outlook.com (2603:10b6:930:85::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Mon, 11 Sep
 2023 09:04:30 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:5:15b:cafe::5e) by DM6PR18CA0026.outlook.office365.com
 (2603:10b6:5:15b::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35 via Frontend
 Transport; Mon, 11 Sep 2023 09:04:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.11 via Frontend Transport; Mon, 11 Sep 2023 09:04:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:04:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 11 Sep
 2023 04:04:29 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 11 Sep 2023 04:04:28 -0500
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
X-Inumbo-ID: 39b16437-5082-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtkOrKo/xTyGvBRwey5eIWYYZMmrtH2V3j8S4nkayOOMzOPgAvBOs9dAeJjA8Pe5tdS3xow4GJxCtD6smAQ599sJ2nyzNFrp+lEo7+p/o6VT8M+rbLklAVQUejrycUdwCTp2/kaY3jEMC2C3Fc3cV0zjXwZRBhvagfIP7EIyAM+cx4mDlruEflnd0DxRf0VX37FGcoimeCFexXmg58+u83VxOXIqHUdKcDmJq+TcZgquOhZKpO+zayYBjlnFU1GJYIYt67D+Da+gHJY/LWQF9kByF0CHurPs+omoSE62zFfMRFQ5gWPazb0jq7toAp8O1UnL5y9vvrYgIuZ01VBqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RJgpPLNQEonIYiUt2PIDQYTvJpB+/ucMbEplRud3raE=;
 b=CDBgQ4JIlQs0Qx8TrUT0Pu7o0CweZNt6YiGrnIGvbtrLY62oGtxWGlRu2AZW2xizzBIYmpmQUMab7RrgFCBfYUWg0apiBpQ7xL5/57q+HPQT4oS/AzNB67xC8jLE7Q6XeCcznjktVgVBGkAN6/5iC2QsQVeB/c3Ux5Wu1vfLlStthh5h9kjMlc2iVjWo3DEUy/IQww4T/IjCuH9KYaptVCj/Hk9AJA4u3URMAZiO/1xKENWRBH9fvFJbn+B7LM5xzPdiEzDZqBhjYdkSAn4X218Op5LLSk7yX353ZsqF3/ftYP9s9IBXl6qQghkfrsm+irHKfDnjfohBiwB/EdaNLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RJgpPLNQEonIYiUt2PIDQYTvJpB+/ucMbEplRud3raE=;
 b=YnnZlW+ECvmIb5MwHj3Vkl+nLqlJ+jeMQDWCNlbyNtTlyNN0sZfpusgxyVUtFRJDlaUoX1lbRhNVYlYNDLNQ6xWPn/VZme3yF2USbu5MbXQ2OYM3OL+JuQ6yrpYHIxVKLE8rY2TWp6UdqQHVgP8A0MIzktATtMkZvkBFEOIBpA8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <f4d9a537-5a87-57b3-3db8-35c6dc564a9e@amd.com>
Date: Mon, 11 Sep 2023 11:04:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 01/10] xen/arm: remove stale addr_cells/size_cells in
 assign_shared_memory
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
 <20230911040442.2541398-2-Penny.Zheng@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230911040442.2541398-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|CY8PR12MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f187566-b75c-482d-262a-08dbb2a61be5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UuBFjY3F4ZtAddOanWsF/Qa4qo4FLtvqOrOAqkwXis1ugqUaF23+xFAns1tuVF8wYqn2XXh+kDp3gAiMY1v3+f25ps/e3yJ01oTI+QFMhSrvfTtvdLQD1iJjqtYNDcfhoIuwg3G6ybkeZ/xqzwmmHw3Megm184XKReiRpckDXW0wz2bXme35Saa+soAAXgXnjB0/w5MAToDpWDoDNisCH0tUWI+EmSmnLBCkMo0uXIQ0gUyWgxjyzaOSgMIbdufdfYkBLiJ9+uSMjhNVfo/gRBniJi54+nCPLrnfxoIN2JH/qkxx2Dy0a+WLSaG2le4wEh1NnBRB8ofxcFbbkeCBJTLVra7lAKEl8C/OPAnkajsqKjJKDRz8geGxP7P9PIfS10gqOGk8UVRMNxZAJZqs4diGqwHrglCzrgbDYAQ083MnAANzBXyiiAHhwExqo8+Qp6AAzNybt10JCH1Wuof5ygzjPdJYF8on7qqJ2Di7F5wmgT1KYdL80TpJI0C8JoVFlNaEk1PjDAV3M5qcSVOWaPNyHw0tPMojnbu+nMuIakaMzzm8tq66MdZIZLX/jPBXFeb2QPTPNNlfmXfP/knLNw6WMBBMjH5FSME8bKE3q3yQ02Z8m2doDm2TskkMNUZTSbnqZL8VPS33zelRe5Nv51B9KJfug3EGQ+GT9qZeW2m97xOh5GDT6h3lsItM0jQaqDHLc2Uwp/elTNYpGat0qWDlT05rLqpvhMoFqP6ipy5Ue6KP3q6P8+C7w9DU7n0j0cOGcKf3GxKf+PWkDUMQp40rO6qVovrKkktVePLaYHpSa3Yn8LzQXJ56kh2BF0zE
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(396003)(39860400002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(316002)(54906003)(16576012)(70206006)(70586007)(110136005)(336012)(426003)(26005)(2616005)(47076005)(36756003)(53546011)(81166007)(356005)(86362001)(31696002)(82740400003)(558084003)(36860700001)(40480700001)(478600001)(40460700003)(2906002)(8676002)(31686004)(5660300002)(41300700001)(4326008)(8936002)(44832011)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 09:04:30.4437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f187566-b75c-482d-262a-08dbb2a61be5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7730

Hi Penny,

On 11/09/2023 06:04, Penny Zheng wrote:
> 
> 
> Function parameters {addr_cells,size_cells} are stale parameters in
> assign_shared_memory, so we shall remove them.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


