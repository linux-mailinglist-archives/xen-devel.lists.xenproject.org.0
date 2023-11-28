Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252937FC024
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 18:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643370.1003511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81it-0003XZ-Dj; Tue, 28 Nov 2023 17:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643370.1003511; Tue, 28 Nov 2023 17:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r81it-0003VW-Ay; Tue, 28 Nov 2023 17:18:11 +0000
Received: by outflank-mailman (input) for mailman id 643370;
 Tue, 28 Nov 2023 17:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DME+=HJ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r81ir-0003Js-V6
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 17:18:09 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1967e2c9-8e12-11ee-98e3-6d05b1d4d9a1;
 Tue, 28 Nov 2023 18:18:09 +0100 (CET)
Received: from BL1P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::32)
 by BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Tue, 28 Nov
 2023 17:18:06 +0000
Received: from BL6PEPF0001AB4E.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::91) by BL1P221CA0002.outlook.office365.com
 (2603:10b6:208:2c5::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29 via Frontend
 Transport; Tue, 28 Nov 2023 17:18:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4E.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Tue, 28 Nov 2023 17:18:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 11:18:06 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 28 Nov
 2023 11:18:05 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Tue, 28 Nov 2023 11:18:04 -0600
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
X-Inumbo-ID: 1967e2c9-8e12-11ee-98e3-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEfxfvSkI7Usb9ZFkvuDPE6N/QjFTbxYf04x5VI/V1UZLp3HIMvEeHUC3g0yIr/c06MgmOkLk8UPqqUUbg9jRUBplutIljruhevjuUWbVXNaACySKPHtOuqRLf4icSLKS5u6WILcEm8XJdIYV3GYmTn7tFcKoUWo7SeaE1s/AEZJUDsc+qhkXbJCD2jkJkhhXo+6DnDapJOUvgHSnU3gZET8YaZEY7tmINEeTrnyFm3FCsqnu3PhU1wMuikZ8WkuVzGkLya2W/4bHTRsIfIcNJqVAYnQgAYXeGE9W0gWtmxjY6JSy7UV777ns45q4Pj5qmy4aovrufIXbeEtA/ZOfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2g4BE85qk8wyCCP7jMD9iYWdmpV4+e9Gw7pD0pLouI=;
 b=Q1kN8yKq1D7WcwgD9klWkv3sabDhSMxlgB+qaX5+pgIztMpLSt3uF+dykMrFaIAdOz0DwD+4DyIVr7U5LKWH2jgVmShwCMJOCPF3RuOa+cvzZ1ee0c1VmPdGRngQGdqJldgc1y5ec9emW0GUVFIoJYu1yfX8wEJazvo3afm0Ro4mo/S5Y6zeAIN+ZORHsb93R44izounmCgvd3+6PrWZk+EuARNXaV8/e9A0a6DRaJHyT6hXd/yNyumIUrNqVTWQFWnk3TYazGdLw3yrCMdPyEW3MzDqkubMxJKfjH528ncApJs3tTsF11oyXH4b+QK1QP2AvyaUXwlCANCWzHF8LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2g4BE85qk8wyCCP7jMD9iYWdmpV4+e9Gw7pD0pLouI=;
 b=pjYIwb2WUX9K3SWr1Bc4KgGWh+EKUtJBRaU2rU/5KCtZ0A+CkUaUx9paxD+TTS8kQ9TfdIGptvxGummMxLauYrQ0LVm4aE/LPFcefN42gTz401HiAi0RMqDjjRWHQzUcCvemXg7uFzPdChtrWenEWYi0VP5bGMJ4dP0ysqniMdc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <9621c813-ee09-4314-9402-196a14227044@amd.com>
Date: Tue, 28 Nov 2023 18:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubsan: Introduce CONFIG_UBSAN_FATAL to panic on UBSAN
 failure
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
References: <20231127144156.361656-1-michal.orzel@amd.com>
 <4d4ad755-46f3-4c1d-adfe-8716672e7f38@citrix.com>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <4d4ad755-46f3-4c1d-adfe-8716672e7f38@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4E:EE_|BL0PR12MB5506:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d4e3f15-5417-4fb9-3f6a-08dbf035fc9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1asVGfks47sA+jS+MKj5UrKM/ndxi2FLZC38LyZ1q7JScftwQ+e5MF7w/jIVE2318dWyACshX9noQ9odhh8UyP+40XkfcwGIx1zbtx92V60jf5NTvQT/SyHF61K2pIravHWI7s7LEIZ3bgV7Q+5yhpisGu09hVYwEyOLY8ZoBtQLruC3JQ2ZevhdaPLrlF9nkcwPnLHUlYIuEmKMk18D0pMYf/MPtiyETjKdk6Bd7kGVuYVC46xfnNUTIe4762r0RRnY2t7HMesRDQCfzegENCEJ7SYU1Aw3FT/LxFi+gQor6GLt4yyeWAWpBkNus1cHfbCPMIFNDHdBT1xRcp2EXFTmWtSvFBTQK7w8q76byvm05WxAQs/mawRLlg4JmzcQ+LpuyBTLQRRXmxWGpdOjZMsWWEzAmHPZU7cvhbrcMBXWOPthZ5nDudvyFYituECEoraB1UhLUm0RtrtQUf7Jp+SlhnSGISwmXQTYxVCA3/PvzXbNCP3BFE6pNcAm03S9R0Y9XnpsJPicUBLZNu2jpelGyvIqIzCXBVZs45aNqA6LM9Md0LokHf3wCSdJKo0z48gZY4DT5QkbBc/Ru26+50VBufSHaEZ2xZtbd6Pgn07wakCA7m4c5McDjovhHTKQQCalrU/+ZKRHCwnUwHI2lUq02amyaHXgCbE9xONOAeXxaOgGE6F9uik3mewweQMCpYiCdrsqbVBd7ZpkYbzumkatKEFppqerrzkLcc78YJRZuRT3h7wNgPiLNAmUhUK+QGvl1G7sKoEWNU59wjHeHJEq7oHFuO56TVKWRtjSFtNvWUwmAsc0xlFL9g0qAYqa
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(451199024)(64100799003)(186009)(82310400011)(1800799012)(40470700004)(46966006)(36840700001)(8936002)(4326008)(8676002)(53546011)(54906003)(110136005)(70586007)(70206006)(316002)(16576012)(478600001)(40460700003)(36860700001)(81166007)(4744005)(47076005)(356005)(36756003)(41300700001)(31686004)(86362001)(44832011)(2906002)(26005)(31696002)(40480700001)(2616005)(83380400001)(426003)(336012)(82740400003)(5660300002)(43740500002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 17:18:06.4750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d4e3f15-5417-4fb9-3f6a-08dbf035fc9e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5506



On 28/11/2023 18:15, Andrew Cooper wrote:
> 
> 
> On 27/11/2023 2:41 pm, Michal Orzel wrote:
>> diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
>> index a3a80fa99eec..dd5ee0013648 100644
>> --- a/xen/common/ubsan/ubsan.c
>> +++ b/xen/common/ubsan/ubsan.c
>> @@ -174,6 +174,10 @@ static void ubsan_epilogue(unsigned long *flags)
>>               "========================================\n");
>>       spin_unlock_irqrestore(&report_lock, *flags);
>>       current->in_ubsan--;
>> +
>> +#ifdef CONFIG_UBSAN_FATAL
>> +     panic("UBSAN failure detected\n");
>> +#endif
> 
> if ( IS_ENABLED(CONFIG_UBSAN_FATAL) )
>     panic("UBSAN failure detected\n");
> 
> please.  Happy to fix on commit.
Sounds good to me, thanks.

~Michal

