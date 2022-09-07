Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E55B0030
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 11:19:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401059.642735 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrDF-0006aN-1v; Wed, 07 Sep 2022 09:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401059.642735; Wed, 07 Sep 2022 09:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVrDE-0006Xq-VP; Wed, 07 Sep 2022 09:19:12 +0000
Received: by outflank-mailman (input) for mailman id 401059;
 Wed, 07 Sep 2022 09:19:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiom=ZK=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oVrDD-0006Xk-EU
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 09:19:11 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2086f2b0-2e8e-11ed-a016-b9edf5238543;
 Wed, 07 Sep 2022 11:19:09 +0200 (CEST)
Received: from BN9PR03CA0338.namprd03.prod.outlook.com (2603:10b6:408:f6::13)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.11; Wed, 7 Sep
 2022 09:19:05 +0000
Received: from BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::b3) by BN9PR03CA0338.outlook.office365.com
 (2603:10b6:408:f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14 via Frontend
 Transport; Wed, 7 Sep 2022 09:19:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT056.mail.protection.outlook.com (10.13.177.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5612.13 via Frontend Transport; Wed, 7 Sep 2022 09:19:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 7 Sep
 2022 04:19:02 -0500
Received: from [10.71.192.107] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 7 Sep 2022 04:19:01 -0500
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
X-Inumbo-ID: 2086f2b0-2e8e-11ed-a016-b9edf5238543
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTbWXUXMAnsiWmvgABQp40E0J8mC5hTr87JO95eszGApjd8hIeVqUuIDSnT/klkzANf4XUwy7buo02+3k+gezhfPbVigyYTtbRzB0Y/dfjQCYmLaSjK0Uz/svzyBubM9I2nkR1nQfMvNNVhtlFlUGvxWlhL9IOvTnJnx2IeevV77XBaBVEQ+bl4PMOlAmxIRJAgOX1b09cGRmmr8mvjq3X+WESfEfvaK1oXXDlumqyahML1pXYLO5EQzfZQLYslpkK4qsiEl6YyHwN0znMJdflE/b7ViMIIK/AYqrXXwbN20gIYgLuQE7Z6jpqMkx5ljW2mOl8lajtfTJ0uxvAYLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMkUD4kdRzoyJFP3dJbCO2HK4yhpZNDxiqLu8+myk/c=;
 b=RJZE1dhtHhy+MBb+MfTYLOynd1cv5cKVbhiOD0BZRVpSDyWv9/K92jmhXrVqEBsQ8Mke0xEa5dZNfayAzoScd5HKOkOm+j+WNhRRacohi2PeLz9ctoES4nMAi3Qjo0j9Nw6S7LZJ3ctBIY3n/+iR7N/Opg0Jl5ijFc7rLPmKPSgDDuW9yUy3u+9qkbRgHWbmooLyQblEejqH13XZdYG/a0RPEt6KzDH/LlwKrzJ6Q39x7/3PM6zRnarhoBwbXOnB2JRHlxfX0fpy1ttrBcum6xPgkxMN3HhF60fmvArLQ+OS726zeXdvMKIUhsf0VEihiLpr7Wgc2BAU5th5Qqf/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMkUD4kdRzoyJFP3dJbCO2HK4yhpZNDxiqLu8+myk/c=;
 b=jJqFWFJT6TNqBmeq0kOlaKkYiOrRBQBUBIJb9xB/+S+epElLbGaL0oDa2F8eKdH7e2up93DN3K0uSVdtxWw7EKylYT7s7BrUwuZyc43JE30z5FND6GKsbmPepq/NcsIpqG1ASsmIRt7f587Yvf81HsphjxyJuR3PbbHx9zgbxbc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <cac1453a-d61c-deb0-121c-f49ecaee5423@amd.com>
Date: Wed, 7 Sep 2022 11:19:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 1/4] xen/arm: bootfdt: Make process_chosen_node()
 return int
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen
	<wei.chen@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-2-Henry.Wang@arm.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20220907083643.20152-2-Henry.Wang@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT056:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: b14c7c00-ba6b-4dab-d54e-08da90b20285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nsDG4iuMe4ExgLWUc532ckspYK+zBFmO3OGjWQcS107eZAChzv53sZ1WWqn4wMgAIgFo7XaxSJXBgAj2bX3uGQhjSq27dXnnWAuxR688+3+t87dN1z5U0UH+Ism/dsf1VOWE315bwjsyHIJpcxNzy58jj+weCWvTH1ikJjKwJNNnk3KhH7CwvJaB+xvqo3vqwMnWshm3sG78gSapYn0DXtPvLhZ7ErP8hHgHWDX92y5vb2SGtsGFUshy/Wo99MHUL9FI7UJQZx6yObTeicRoSzAqNfL/obUSZYme6qvGETyNLBmSO1aa5gckyUELLEAQDO6pmb1RnOvOTxvfWRYDKnABcWeoZd6CaS+wpkBAp21bdD3Dha8kd+PIA36JQBo1B19Iy/tvDfNcrqg7BxnPrw+N3tTISC9xrTqlbeGvp4oNAY/ashlT4IdxD+80sXfmhYVzLnOWPjCsRulXLKzjN9j1diojBR/xNOnwd3azFb5XAluRGOI5bXpKXv2D5U4zqIp6VqwW1iIkt72qZUwT/e+QlOhiCeAwDLShXXcM5yVF8ievXJI9jj75eNgp3qFBtDKDMGbVR/WF5h7MWHNXwpWfM+9pJgZ5Di0JOwNZXANfMwTPLc+X+rFsE/PMDEJIQeRgqd0p8HErIH9ePlrr0QuQRI+E3FIwq9LMyzp1Sq2aKtkrZp0qucYAElYGuA/WSLt4dGtW+j4EZ0GaEles7xqKIbqdhbbjihPhV9nQHKbVSxHSiBOVzjxUV1rKYXUH3+z4AnA+sBBUylHZ2JIiuZI7D+ZTJONTxAFDk/qsD97/R1RNEkyG4yizPAs2hD8M+CtaxDPJrnzD//nE4UBnFQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(396003)(376002)(39860400002)(346002)(136003)(46966006)(40470700004)(36840700001)(31696002)(36860700001)(70586007)(356005)(82740400003)(110136005)(16576012)(82310400005)(8676002)(70206006)(4326008)(316002)(54906003)(40460700003)(81166007)(2906002)(336012)(4744005)(40480700001)(44832011)(426003)(5660300002)(2616005)(8936002)(53546011)(47076005)(186003)(41300700001)(478600001)(31686004)(86362001)(26005)(36756003)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 09:19:04.6625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b14c7c00-ba6b-4dab-d54e-08da90b20285
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT056.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606

Hi Henry,

On 07/09/2022 10:36, Henry Wang wrote:
> 
> At the boot time, it is saner to stop booting early if an error occurs
> when parsing the device tree chosen node, rather than seeing random
> behavior afterwards. Therefore, this commit changes the return type of
> the process_chosen_node() from void to int, and return correct errno
> based on the error type.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

