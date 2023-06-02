Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B92871FACF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 09:15:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542965.847458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4z0f-0001dC-Nc; Fri, 02 Jun 2023 07:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542965.847458; Fri, 02 Jun 2023 07:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4z0f-0001ao-Kr; Fri, 02 Jun 2023 07:15:41 +0000
Received: by outflank-mailman (input) for mailman id 542965;
 Fri, 02 Jun 2023 07:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0i3i=BW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q4z0e-0001aT-3p
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 07:15:40 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e88::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46e1e8bc-0115-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 09:15:39 +0200 (CEST)
Received: from DS7PR03CA0053.namprd03.prod.outlook.com (2603:10b6:5:3b5::28)
 by SN7PR12MB8604.namprd12.prod.outlook.com (2603:10b6:806:273::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Fri, 2 Jun
 2023 07:15:35 +0000
Received: from DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::a8) by DS7PR03CA0053.outlook.office365.com
 (2603:10b6:5:3b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 07:15:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT018.mail.protection.outlook.com (10.13.172.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.26 via Frontend Transport; Fri, 2 Jun 2023 07:15:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 2 Jun
 2023 02:15:33 -0500
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 2 Jun 2023 02:15:32 -0500
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
X-Inumbo-ID: 46e1e8bc-0115-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik9PAUH2ER59trU6qI1AK9A7s2r6dUUwIqXmpdztfsURT12RXYhI9HWNTbo0t/nvmP22tQOKSWvXw9M3vD4+26cBNrwDW2J5Mv2faG28tHb/m0XqB+QfmURFeyADbOLTLWDI66FY0mb/B70Jnc5ajNsbkg3NOIkirqUI9YzyUpI5lvMJMxq/cbWVEr3oIFE7Q1Gz5zq0AzC2pc8/v+N8ZBPgHRyrYMhiNiTQPaJszihlzrKyqKjMHHlaA4v2HoyBJ4hXJEQUfpeEuk8G8xkQUX6Qzjujyjbw9T3VEII+XlnKJ5j3gNXFnW1OIGp/NN87v2l92kPd1Prza3iyFqpO4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wt5Rn66YiJBlqZsbSlbNk4FsfyGdWeejA0kQB/xLMrY=;
 b=OS4Ow0Vc/AdyfHbFQ46gtw1+LbInV/Uef+ZYX/20Zp4BZd8d5YqtAkvEOQ4t6xmU0e0etH7VeNnMMd8UTujNo42iU6EEWefj9+hFGQOFit9uLho7lReVCr037b0AVRGuAu2tAYxfsrpITerydKCiMpQUO6Z1uvuevtr39DiHnVfRui1P2PSbsjZeu8GjPGSJtvtSnMJtGIyLJiPUy8hnTLniePumQOPQtC4l9ZQv/OP5y5bhpZhIDpNR8SBcHRY+dO99NpBUP+JEQPhDvNXhN11sAF/PmI8gDMuW0VMUuNaOsdXlvO/HJQ5Dzy3u/H6z71C48d+xNj8vT1pJCiljWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wt5Rn66YiJBlqZsbSlbNk4FsfyGdWeejA0kQB/xLMrY=;
 b=x9PbORDMjPJtVBkp4RjR3DmvOI3FMZ7oT7iPDkZpKGakaDekAUebcPSbEZHJwq+yPTLGCOzISf/27hxu8ZzKRy+eTUL07Tb8NNhH4MyHHCNHQEEgDAsbNUrmr2h5Fg3psHeObVN7wP/pN6jKPek5F/jvwjR5RY3Z/u/KUnnj1ag=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2370b2ac-e11b-6772-bb7c-097aefca2492@amd.com>
Date: Fri, 2 Jun 2023 09:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [XEN][PATCH v7 04/19] common/device_tree: change
 __unflatten_device_tree() type
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-5-vikram.garhwal@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230602004824.20731-5-vikram.garhwal@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT018:EE_|SN7PR12MB8604:EE_
X-MS-Office365-Filtering-Correlation-Id: ac05a6f5-a8c9-4b9a-4917-08db633928fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gE/9e8BujozfdK4ZCuJ4Dwcb2O3x8kAKYQXQOsiQnnasGWndl7i0jfpCRCq8bRhtHbUVnZwUH9FS3p9HixOxk0AtyPLMpEVeTBVjWPFImys85dyi8dDU2Uox8VoZB1oVm97tFHVPOXhHT8qEonmR6TvNpxDL94t54C0pqh/x9MfO7rm2uKrh4BtNFfKdcI9ke3E6tToxRxjfWMe/LQTXZwSxBYK19LXnibJxxK6GOaYduGpO7UEMjZDaFgoYTE0NibdqGAbVGyXbWwpK1Ms/iadDFUbwpTkrYdpq0DZOiNTXhBZD20QYe1BH1vaPsdWNYE61Yh8Obx20YnK0+3vHK/5Ztx9wEjJTF+Z80b9R88dM9t/nvGCVUvjM+FdNOvPyLbr8IeWmIf4bejiI475dejLF9VEP17aXnwknjibQP6R6rz3lZoIvCV/wwixW6t8Jz6/NyZDNabcz1VH1yqRgFLLyQouPFzduG14CkiVy9cXmGvj3DP3TI/0c9N+CqpyNTJd/kYXfjt4jQnoxFkNqSyTjTtpCOrif3QusUwZXSYfbWPcRCMGhHFjQ0M7JBZRWwUdW1ry9I2isfj/MMvrKxf3BLEwkYnbcwxF337mSvLV732ri0AwBNjHi6kf+29C3Eyg+uXyCnGi1Il50Af8ybT46ibXbAuYVtIYHZlxLfEOV+S0Q9Cc+RmKY64btBcgCYheIYBs98GH8orps61uZTEHs/WQn3wGn/8xoVl0vwLR/nwIT9c3VB+PEKr8EXRhyOOzf9lxxqz9KUprhWQQpodRTVNIE5LWw8jPif5K1fYGfCC4I4qR5hqMmmnUrSWp2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(40460700003)(47076005)(316002)(81166007)(6666004)(70206006)(5660300002)(4326008)(70586007)(82310400005)(8936002)(44832011)(41300700001)(86362001)(31696002)(8676002)(356005)(36756003)(40480700001)(82740400003)(110136005)(54906003)(2616005)(2906002)(4744005)(16576012)(186003)(31686004)(53546011)(478600001)(26005)(336012)(426003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 07:15:35.4249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac05a6f5-a8c9-4b9a-4917-08db633928fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8604


On 02/06/2023 02:48, Vikram Garhwal wrote:
> Following changes are done to __unflatten_device_tree():
>     1. __unflatten_device_tree() is renamed to unflatten_device_tree().
>     2. Remove __init and static function type.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


