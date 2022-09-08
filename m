Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFE95B1839
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 11:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402983.644931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDg2-0004SH-AJ; Thu, 08 Sep 2022 09:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402983.644931; Thu, 08 Sep 2022 09:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDg2-0004PX-7N; Thu, 08 Sep 2022 09:18:26 +0000
Received: by outflank-mailman (input) for mailman id 402983;
 Thu, 08 Sep 2022 09:18:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VI1a=ZL=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oWDg0-0004PR-Nj
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 09:18:24 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2070.outbound.protection.outlook.com [40.107.212.70])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fc889a7-2f57-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 11:18:23 +0200 (CEST)
Received: from MW4PR04CA0300.namprd04.prod.outlook.com (2603:10b6:303:89::35)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Thu, 8 Sep
 2022 09:18:20 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::89) by MW4PR04CA0300.outlook.office365.com
 (2603:10b6:303:89::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Thu, 8 Sep 2022 09:18:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Thu, 8 Sep 2022 09:18:19 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 04:18:19 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 8 Sep
 2022 02:18:19 -0700
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 8 Sep 2022 04:18:18 -0500
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
X-Inumbo-ID: 2fc889a7-2f57-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5SA2IuLQEQWvoSgmsyET3iRlJXTPYhrug+P3KZk7SUwBO1t9GIGA7PN9kFJxPqbuXdCBqw4H+kFjWOctmu4uBlBoXLxAcx8mKNNvHU703Cbx0mE8/g4j22xYSY/pcAfzfUFFKxR6szSqeaHm0Z/phc2P6sG/RY1rdu10EQp2+LCMWvTz+JnEaSV1bGzbc21kAucufpEN4jKcOcY6V6XnMgIni5iOpkRFoRn+gV44g6Ksz6Yq6gSZ9sYL2/5GsdCKdInzfDj6LGLSKh9IbqYfwZavoqX63QiGcH9grOKzgvwyML3eUM6C299icqWdCBbE5SgPMm1bm7ZGff06VV9uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JRfagLwxe8Mn4cKVjlgfmqszDxiPFDPL4PefAQpVJE=;
 b=fHKZq2lGhcbFNUL67VVd0C2oWQ0kImVYoeKStPZIb6oYRljlUSqA8LB9rndDvMnRHqCuq9EHozBCNQL27coNRJ51U5nTSrdlbbNB460vVmnU43XyQU3wflfC2tVi4WbVFIOeY42vTZGLiYLvgpVnNYfEgDhBwlNYUOhrLJXsf6KJjGPjoVphLJKQHCndJ3jGnCVxscikKUKZg3WiezShaO/cy3ew2jw4Vtqq8L4mlDB3bLQ3KS084y+xsQhtRxskQpxYzelL48nR5YGq/YXAlUo/XXzb9zLR57GWChRgm5hOb1e+0IVf1y6neDsLDK5GCce1X7o85l5DVTqdSWykSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JRfagLwxe8Mn4cKVjlgfmqszDxiPFDPL4PefAQpVJE=;
 b=c0yGIuCkPUk1MG84RKcQ2zSsdTft+jrRJXZxPrajzih/m/zfh150HHN5zAcSPaBc6f1LO9f5rh+DJKAEpb1Np9yVv3HQzPhuf/6r0Rj/ot6i0mT9rtSvChmeVz9918dj6bDlQXN1CdSVqh/f7tHf/KjUv3QBSdIrBzu8BE8qzus=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <86bf3f23-80ba-54a1-ff87-2fe45cd1c181@amd.com>
Date: Thu, 8 Sep 2022 11:18:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [for-4.17 1/3] automation: qemu-alpine-arm64-gcc: Use kernel 5.19
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Doug Goldstein <cardoe@cardoe.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20220902070905.1262-1-michal.orzel@amd.com>
 <20220902070905.1262-2-michal.orzel@amd.com>
 <2c2c0315-8694-d9ef-5f08-01c7bce3329a@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2c2c0315-8694-d9ef-5f08-01c7bce3329a@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|DM6PR12MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: 5453b115-aa9b-43d7-b35e-08da917b1235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lNpiz0hP/LFPQMpf6KZaxU/rQXTlxcW6nAJ2QVh9kQXplJcHandxvnsgN7MTZOZvgPyVrjEZazewe4knZ1CNyfULLBpXq1OFtfkG0puja26cydstQuSx2JCX0diCj4wZD85R+siVs1A0qD+JpYgk21kAoRbxl9D6pT5pmShXfVpWznV9qmLKyr8ACezyua+zaxaPuWoJhof7KkK+Rsi0nDiUonY9HvxZ7qNaiOMT4rDNzYL6pNgQYN5i/7Zcri0k1sr3tXoqog7OWwuHe7BTsvDlIL0C/Kvuw/4TaV0jqPRzGmjRhWXdagcCmBrVYwnde6rY09trKdI/h5a0oTJZHYrHSIFmvD/o/qyNsepAeL4+QbxRr/MI0v1+M0hSG7YEjyRfAcmyf+OmIGXS8zJh/6KOefsy3KpMbRA5xbx1TWytZWJwqNN1u5Ys31AvJJNIAZCjDa/1/WKJECpxRXClhCmBq7UJNpqhIKPV14+38cLNSR9hpyKFpj3Rx3Uea3nYcw8C7/MDsVdemw5VmwDlCT36y1As2rzvtdpXGWay0IypZKHxngBsAYlb+KW9V7JLUjM3grIhVVgFimYHviSNNn2D1C5e0Dt/x2nK91n15TZx4DPWlAvEthAe7sYCyc8mjwziwiOCSBR6/v2VYY+tl5BhVxHc+rrfRGbJGQMYd9f1K52v14zqoFLvILlYcrD1qa14k5ukBuYpfunBZjuHEoAAeA+0tDhIrvtJIbahTUmaas+BQHULUd5YwXkQZxqkMLAaICXP5cUnPKXfrj3NaUUadQQUPtCR7TooUJJcEgZ9tmcsZ4ME0tn0dggfq0Bm9UarTikrOfRSkh9YiYb3qA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(346002)(396003)(376002)(39860400002)(136003)(46966006)(40470700004)(36840700001)(70206006)(31696002)(2616005)(8676002)(44832011)(336012)(4326008)(86362001)(426003)(53546011)(47076005)(186003)(5660300002)(36756003)(31686004)(4744005)(40480700001)(70586007)(82310400005)(2906002)(8936002)(16576012)(110136005)(54906003)(316002)(478600001)(26005)(356005)(82740400003)(41300700001)(83380400001)(40460700003)(36860700001)(81166007)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 09:18:19.6985
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5453b115-aa9b-43d7-b35e-08da917b1235
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299

Hi Ayan,

On 08/09/2022 11:07, Ayan Kumar Halder wrote:
> Hi Michal,
> 
> On 02/09/2022 08:09, Michal Orzel wrote:
>> After qemu-smoke-arm64 was changed to use kernel 5.19 we end up having
>> two kernel configurations. This is something not needed and maintaining
>> a single kernel version is always easier. Modify qemu-alpine-arm64-gcc
>> to use kernel 5.19 and remove kernel 5.9 from tests-artifacts.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Ayan Kumar Halder <ayankuma@amd.com>
> 
> Question unrelated to the patch.
> 
> When do we decide that we need to upgrade the kernel version ?
Usually when we need a feature from the newer kernel version.
Upgrade to 5.19 was done so that we can test dom0less enhanced
as this kernel introduced late xenstore initialization.

~Michal

