Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5973B875C38
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 03:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690095.1075797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPbk-0007XP-6i; Fri, 08 Mar 2024 02:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690095.1075797; Fri, 08 Mar 2024 02:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPbk-0007Uk-3U; Fri, 08 Mar 2024 02:05:12 +0000
Received: by outflank-mailman (input) for mailman id 690095;
 Fri, 08 Mar 2024 02:05:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riPbi-0007Ue-W4
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 02:05:10 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a1c949d-dcf0-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 03:05:10 +0100 (CET)
Received: from BY5PR16CA0002.namprd16.prod.outlook.com (2603:10b6:a03:1a0::15)
 by PH7PR12MB9176.namprd12.prod.outlook.com (2603:10b6:510:2e9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Fri, 8 Mar
 2024 02:05:06 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::13) by BY5PR16CA0002.outlook.office365.com
 (2603:10b6:a03:1a0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 02:05:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 02:05:05 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 20:05:04 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 18:05:04 -0800
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 20:05:02 -0600
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
X-Inumbo-ID: 4a1c949d-dcf0-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCn96wmVrCWJZXeGCR04Cq7hyzKDIdgAuQnX0i43Qy8MChoCHLFhMYYiv1va2/nPGXRFBEfYqw6O5mH28K8oKMlhH9SKI3dhft4YziXaAvNsNByMKcDt8Bdvm3P2zWB0o/TZZ62alXjmbtTSxghayjpR1zIaOezTKtvPBTC9k4iKQSVv/YKfnxYZQyUT55XYnHk8ZusVbmkuKQHDY0MoSGFNSUZ5N9u8xRcmkiqDAAf1d1iRX+0p8gkU8Q6KF9gPWQgJoTdRO+mjV8UnO019rl+hVN8WrKd153H80c3Y4JhxtuLkqQSy41ehgEaV6VtmBwhpcaU3fDVRS+76UYdZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWht1MNQ3Gq4RBQho9LuB0HNOJ172OUQAVl2sl/yOVc=;
 b=nGdNrZHyXomfRpm5fsHomH6jSGhGQA+jF+9irg3CRNesLoeOeMxi8yrzDdZKXrA6iwBEMbR61ZrkN5Ai7uWWW30mHFE0FKHE1Qy906ma1FV6T7IhGK20+Hr86018pcTZWOxlwLIXi3p0hEkf4MvDvIg21eZo/pFoxuK9AuddUuUxUwrDsDehx4WFW2FPaD6VKcxLwsAEPcb8GIbZGsvgBOtbocXD0twOGYBjsmsfnwBjX/V5iMVfK04Ofdq/ntp5pjSLvlOrq3mHcKkZh7ncJxS9e/uOtA1/y6U1oY1jyq5yiITEoqe+5k60E8cjUfOA30ShfCI7cBuAKdNM5KHm6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWht1MNQ3Gq4RBQho9LuB0HNOJ172OUQAVl2sl/yOVc=;
 b=NpDqNBNqs34UBnbDiZgz6x7+z5dfXjqdMn9uBHaiZEGX7Vsq01/sUm7I3ylgQsj7RxfNWqP1AahCjXXdLRNS7WuRDbYZT0A/lBDGToqpY15t/asUikfMZkRQK5to+yP2i/hjvGtxNNiSA+QZmBuviFnyWk2cmnXlqeYATUEKfyg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <800eaf87-053a-424d-ad0e-2b725a37de89@amd.com>
Date: Fri, 8 Mar 2024 10:05:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
To: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
References: <20240226030146.179465-1-xin.wang2@amd.com>
 <de4c6988-7051-4d44-9b44-e850ad4b4cc1@amd.com>
 <DS0PR12MB9448472A793F33228BE6A185A15A2@DS0PR12MB9448.namprd12.prod.outlook.com>
 <e5cad59d-9c3f-4e4c-8b97-5e0fbd4eeda2@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <e5cad59d-9c3f-4e4c-8b97-5e0fbd4eeda2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|PH7PR12MB9176:EE_
X-MS-Office365-Filtering-Correlation-Id: 736e2ed2-dc66-4a0d-4ef6-08dc3f142c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zLrKSvoJftUOCbhgdYsaoVWnFwIli0xYAyRKIWeRE6Ai+e1908wpqTrfsxU2M2FpoPF0O9wm9L6ARrJO0WzNkMiAAOVMcnRpsiX24ltMTPfne69rAPFmHfr1WmWV6K/qkcgCtp4Fd903LOKInKEZ+Md0Hq4YxN3Mb05wYP31S8pwXBJ9Cff/cdDei/B7rbzfOjxxQebKtHMdYZleDcA/RwtbZRDXP4Q9pZXyd2ExXL913bUhu3pPQcdnhBNbikNrAmCxbmgVIjY/Vv/LTKde3vZpOg+NGWdW/V66yabvhRysR83yREbJ9l+8WULwLkuu+uRXz7LBIRzMbIB4Oj2LnVPTFjT35KdR0H+bt86I2KrmefQT5qbbwhkianqsX7O9F8gShumdCGXzd2WN+26JiGsGYqbfbLjIn7/QCfGn8ANFw1EC7/15tpge8qPl41tCP7eGR41+quRzoolJ2/QskboO1BnQAsEsixA+WIj17PSOLtJ9dV1lhfJhBVCT3ocQJVBag5/UVcD7ygVIwcmhP0wM51g/oxKnsxl3cQ4P8oHr+OOU6N7DASX3yQe5ATAkANuUh1tijCb83jh54fku6kb16kFNDbEWbbwUtO97B5R7uXeo29hfAsCeDaWgM34G2qP7NjGKw3igzuHhpzvzcsxhKcHc3wTTxMkyF4I2k2xTDQ4lkiiaQ7vnEZcwWG6NM2GN5/7WrJ9SwTf04Soq6g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(376005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 02:05:05.2039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736e2ed2-dc66-4a0d-4ef6-08dc3f142c34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9176

Hi everyone,

On 2/26/2024 6:43 PM, Michal Orzel wrote:
>>>>   xen/arch/arm/smpboot.c | 6 +++++-
>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>
>>>> +    /* PE not implemented using a multithreading type approach. */
>>>> +    if ( system_cpuinfo.mpidr.mt == 0 )
>>> Do we need this check? It mt was true, cpu_sibling_mask would be incorrect
>>> anyway (it would still be 1).
>> I added this check for playing safe, because I only want to do the correct thing
>> in this patch and avoid make things worse for MT case. With this patch, non-MT
>> case can be improved and the MT case is remain unchanged.
>>
>> But I agree with you, and I would be more than happy if I can run a MT setup and
>> finish the "else" part with this patch or follow-ups. Do you know maybe qemu can
>> allow me to emulate a MT setup so that I can fix it properly in v2? Thanks!
> A65 is the only Arm CPU with SMT and I'm not aware of Qemu being able to emulate it.
> AFAICT, in Xen on Arm we assume no SMT, hence my question about your check. With or without it,
> some parts would still be incorrect (like cpu_sibling_mask), so what's the point in having a partial check.
> I would keep your solution without the check. Others may have a different opinion though.

Since there isn't much discussion followed-up in this thread, I am 
wondering do we have more inputs/opinions on this topic? If everyone 
agrees, I've followed Michal's suggestion in v2 [1].

[1] 
https://lore.kernel.org/xen-devel/20240228015822.56108-1-xin.wang2@amd.com/

Kind regards,
Henry

> ~Michal


