Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B49843FCD
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:59:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674024.1048690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVAAk-0004xL-Jq; Wed, 31 Jan 2024 12:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674024.1048690; Wed, 31 Jan 2024 12:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVAAk-0004vI-GE; Wed, 31 Jan 2024 12:58:34 +0000
Received: by outflank-mailman (input) for mailman id 674024;
 Wed, 31 Jan 2024 12:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vX7o=JJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rVAAi-0004vC-Tz
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:58:32 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e902f4e-c038-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 13:58:30 +0100 (CET)
Received: from PH0P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::8) by
 LV8PR12MB9336.namprd12.prod.outlook.com (2603:10b6:408:208::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Wed, 31 Jan
 2024 12:58:24 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::37) by PH0P220CA0008.outlook.office365.com
 (2603:10b6:510:d3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Wed, 31 Jan 2024 12:58:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 12:58:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:58:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 31 Jan
 2024 04:58:22 -0800
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 31 Jan 2024 06:58:21 -0600
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
X-Inumbo-ID: 6e902f4e-c038-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFfKNLm+vdK0t7k/CRKEfuwuwLMcHXbOjDpfx5xSbch7Cq49BJfYsH6Tw4OFkGPOayeOcV/5Ym/B3WjGbdWAuJTUPKkGV4rfxzRfJX+yy3uPAsyidmv1CIWQxFxtgmcwxWqjVL9YFiXnrFOxkHOprC4WBtNx3gu3gojcShIrokyLuf/fxebardp8yAHHiA9F3EzFgjCo7H1X7HyG1b2Z4ydtRSB4NUc0KA6xgX85rX5paeSe7B4JQZAUavQAmAogmfWqbn36nORinaEh2/a0Fu2987Fl3H65iaex8n3ftMJ9O2wQ0vsIYy77w/6w4wpYF//sQ/BetYCm4OlpsI6FgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SOs0RA9iZStVkQsMH3cUqJBay5MIUiLHOpqUtU7/R1A=;
 b=MoFpIrc3n9FBd0i023wva6oNMC9VJRt8h5iEw/uopChQ1yLlTrC4irIkbp92XNGSTiUfW2Cx9vThD9wXdwknFBOU9piCEiFApChrFkjO1Zj4NcZlwZUAmDBS0p4uC6dI7rDqhcCwB4pBPMcf1ODDyyCz7eqpV9i4/tjiLSSgFTC+5JS+P0dKLvPb5ZhISESYiH6PiXMbCXH1i1wzqS/GekQHVV9N+61pLQ0YxH9HvbW6Vnm9o9chKlYgamZRGkeWU5+WlHtIalU/dAihryGKbOQYuO44oTaoZKskF6CP5sfgiuxuUocza5+dUSMwtY7kOeVczkZq9BKlvOWbu770cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOs0RA9iZStVkQsMH3cUqJBay5MIUiLHOpqUtU7/R1A=;
 b=PMYL7FrtLdqQ5fakknj0VSmbfVH4yCRxDtJYQ3YZIB1aQSIVhF5ZKwrtdG6+EqOKG0ECRlhwOyT6Ig9AVdd8u3oK+v1CU9bNk6VOc3swJvED9Z6JzQHv8KwlsdJ5t6uN3g3xKLgPD7fxr/nb3bkXOym/WBg2736FXp8stx5ISNo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <44afb871-8a00-4781-82c9-115ea40a8e03@amd.com>
Date: Wed, 31 Jan 2024 13:58:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN v4 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer
 Registers
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<luca.fancellu@arm.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
 <20240131121049.225044-3-ayan.kumar.halder@amd.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240131121049.225044-3-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|LV8PR12MB9336:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7f2850-08df-4c44-7347-08dc225c4ee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Aa2Xq4HYp68xwpU+6Mv7SxP4/IPbYy7j2d0hiRQ2FoY483uLPKEtJ/2vYVK079cu5MqambLIdTh+LyfNqWdPIvSkG1pOrIChAMzKfvGO1NsmoNxsRQvXSv/Nno/cMoqPPmRYFynEor36WVgTUd/Ipy1FYyy0s+bMdeB97Laziss6hN2PWqHcZ/qrcgdOy63Og9UN0qRf7ZQ0jUfchGyTOt2wft1kUxH3uDAU5Kb3pSleWG218qePP3vL+pjG8LK7SewTkaQD8xgm0lthKmBknxyzCare0E2Sc/vi46jc+toNDG3HLuPf2oJWsK+2GeB/yhxZwg1h+2CEc1PAMDL5WvARYyLyMnkJRhSzYEO2b7qcbTYlyNA75MugCCAHNzbAYqeMK50133pq+68fKwnCsE68CcZ6A9riNOc6JneEQaZH8q5zhfyJURq1QhgkrJHvKg//hk5l1VmVUFbEZ7TX5lynyyNOsDtBIy/beVcHauWmlB668QBA7Rxrvbq/+hAgmarw/lCbLE16HyGery1dGm/vIRSR8tjcOyxLaAzqhWRT1Zil/5cOoMtuaganzfvXdpyxn8P9f/DybZjux9pSkXJnhf8fFCD//Qn5WJGgtrl2nA/4Yelo8dhASouY3s87h8T6JG8tTO2I1WRqlvmyzEXfiQIW3JpNSIck07oCh2VYWyg3TKH0rv90L1h32TEJg5HYnQ2m1blBaP3hYdiH4gMiEzTpdlTry3cLvUAASzTIRrH/Sw6jcYL62lwTHuiF7ZImGM2EkUkNalR2aS69B0motGPUkCgWM9UyNy92eY276JMNEtHZMYwifU7iJ+tc
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(1800799012)(82310400011)(186009)(40470700004)(46966006)(36840700001)(44832011)(316002)(16576012)(356005)(2906002)(40460700003)(40480700001)(54906003)(36860700001)(8936002)(36756003)(8676002)(4326008)(47076005)(86362001)(31696002)(110136005)(31686004)(5660300002)(70206006)(81166007)(70586007)(82740400003)(83380400001)(26005)(426003)(336012)(2616005)(41300700001)(478600001)(53546011)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 12:58:23.5047
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7f2850-08df-4c44-7347-08dc225c4ee6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9336

Hi Ayan,

On 31/01/2024 13:10, Ayan Kumar Halder wrote:
> From: Michal Orzel <michal.orzel@amd.com>
> 
> Currently, if user enables HVC_DCC config option in Linux, it invokes access
> to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
> arm32). As these registers are not emulated, Xen injects an undefined
> exception to the guest and Linux crashes.
> 
> To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
> (these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.
> 
> Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
> "If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".
> 
> Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
> using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
> and returns -ENODEV in case TXfull bit is still set after writing a test
> character. This way we prevent the guest from making use of HVC DCC as a
> console.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


