Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF9777B2AB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 09:39:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583271.913389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSAk-00068J-9C; Mon, 14 Aug 2023 07:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583271.913389; Mon, 14 Aug 2023 07:39:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVSAk-00065l-6W; Mon, 14 Aug 2023 07:39:30 +0000
Received: by outflank-mailman (input) for mailman id 583271;
 Mon, 14 Aug 2023 07:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ZCf=D7=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1qVSAi-0005XG-Pz
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 07:39:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20613.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1e3bfc1-3a75-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 09:39:27 +0200 (CEST)
Received: from CY8PR11CA0045.namprd11.prod.outlook.com (2603:10b6:930:4a::28)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.24; Mon, 14 Aug
 2023 07:39:24 +0000
Received: from CY4PEPF0000EE33.namprd05.prod.outlook.com
 (2603:10b6:930:4a:cafe::13) by CY8PR11CA0045.outlook.office365.com
 (2603:10b6:930:4a::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.33 via Frontend
 Transport; Mon, 14 Aug 2023 07:39:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE33.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.12 via Frontend Transport; Mon, 14 Aug 2023 07:39:24 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 02:39:24 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 14 Aug
 2023 00:39:23 -0700
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Mon, 14 Aug 2023 02:39:22 -0500
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
X-Inumbo-ID: b1e3bfc1-3a75-11ee-b288-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z+i5W1zppJxwLzUEdCcg/z+ILzTYpGPrXxbG1cwes6/k9LZY0Yh94pZ1V8B0R3Eq5oddzJqY5h111llSDRICis70UUqu2Tie50QjrZ1d60bcl68gvPMtLSH6EHPqp+WZCxFueNZIB21/Jku1SO4NQapwARwWlBGTZkJT6jrzSahOcith+63t045GFGsAzaoa+xJZzDXji0msv/4yBLysUrbyVponCNgtdL0zz4wrJrIQ6nXTb8di2um3ulDxR8wkRaZRo5Pa8vQHRfQg4vvUzhXF7afhye3ljdR1Jy1OTL43Y1CbSCLAU3UqmZ6RGne26wD9JyDg1C7ks1at3YpzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B/6A32jYUGtatRb6O6Wzf8V1PLTria3E+8SIVNe2AkE=;
 b=R36iLizYtRPMl1OCmZq2w508RoNq6CAB64Y3e1OfXSErQs9jtEmH8OgSUNTqjR/TuOyYZxOS51mt1TcNGA8+yBlZbSlw5fzQMz/6JcM3d3uilkdtBc5ngdfTlQUVuoZikeDjfrO8CWAhW67gPfEh1Pgeeoct+Yl7GGKEszYwReqG3RKK0IbOn9rnmdzPDAHoTjujT3cXx06Fow5NFS4ugf/77cG3j6VFF6n2MECJ8GqMCMF7rzSBVbACb/fsa/ysGNwkZzA6roApX2S1hsp8IPDm/spmJMcJL/KAD5tWFBozZSIPkhutzbrooHB8GfuP9B6NsBvfpzBM+JKMaRnAHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B/6A32jYUGtatRb6O6Wzf8V1PLTria3E+8SIVNe2AkE=;
 b=yGwJN5ovsQVmigK6YQQGuu0HJ4g/oc0UX4sehny26Di0QO80Cc7pNdLigOVovRW0HLMYk/Y6zA6Tzcru9rfH/itPkcAzVRUdKTx46UOTjcsnr4AW2UsQOn/JBAgrr+F68yC3CAi01IOd70eYrTfDnOXPVxx9VkFRp/gU5IAOXJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <51cc5a2a-579f-b2ac-45a4-ff334c490993@amd.com>
Date: Mon, 14 Aug 2023 09:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] automation: update jobs to use Debian Bookworm
 instead of unstable
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
CC: <cardoe@cardoe.com>, Stefano Stabellini <stefano.stabellini@amd.com>
References: <alpine.DEB.2.22.394.2308111842430.6458@ubuntu-linux-20-04-desktopa>
 <20230812020651.11608-3-sstabellini@kernel.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20230812020651.11608-3-sstabellini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE33:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 33cf05d5-42c7-435d-9d5f-08db9c999524
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Idcw9FbH4c5OR5td+4fv66JxE8z71G0FNFX+9ZPhZqs5yUe2/Npoe73ArfLvFwvXbozcd63rnA7uP/Gi8rMHULs2nZ9wdafAMtfe97fSLlk0MwGSH++ARiO7aiJQxVlOExxCwi9LaCk0bZmlBWGuB53k1x1ft6+B9zAQJnZd3hr/GjjbHqob4UW/SApN2+ZZKWGDcAqZOz+6oFAit7pDmHFqhMOByW0Nj5eep4uoGl0+/eHIgnbX8sh5I9UWRRVbNDManqq9A4bKhElxqPXPT2dIbCarrqU0TGp84w9WCaoWv8pRCQ+Q26quCEFOGQsjIyiscwAd7bJ9RPz8dGY0Xr4sfKC2Nv8Fxkim3H1uVhudMa2QfqPhV8uAI3pyLp+ZM9YkGfIQ5A03ByZlPn/QOoJj4ZRhXLJihcTq5ebWxWzkK4Gy2Vr+BYhvRCq58G8mNLSoc9UEsw8UyybEiYfD14vMumJkaLTovGeSxgdUTJLm8iVHNHgGRFmPGKAHbNjwhyIpsVE/AkSgbtI1tLi0+GCJccgr99vnYjC1MFx/kQ5mo9BqKJZ77ca1sNeOHn2oarGvxEZyeMp1gMQ1DQYXGEwRtQmg0LdtWwRqlS+h+LrWl2B+aeGzKpjxDKZQQatwxj51V59wsnmb0oXzkA/rGTY0pnUJ0i921nPvxyB7oF31LV0H0cgFwoui0aSn4IdJYajMKfc4LkPx1FvdM210Hy2fjMLY5RpbIQ/v17C+O1CYoIJG4w7KOW094Tw46omQcRdB5rXnyQQMdTEUd1s08A8Z4nYzTQt/gi3yhePvzp757LEwo0i+0W6n4UlkbFO/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(186006)(1800799006)(82310400008)(451199021)(46966006)(40470700004)(36840700001)(53546011)(26005)(41300700001)(336012)(8936002)(70206006)(70586007)(316002)(8676002)(16576012)(36860700001)(31686004)(2616005)(47076005)(426003)(6666004)(81166007)(40460700003)(478600001)(40480700001)(110136005)(54906003)(44832011)(31696002)(36756003)(558084003)(86362001)(4326008)(82740400003)(356005)(5660300002)(2906002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2023 07:39:24.8097
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33cf05d5-42c7-435d-9d5f-08db9c999524
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE33.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340



On 12/08/2023 04:06, Stefano Stabellini wrote:
> 
> 
> From: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


