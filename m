Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3554875F98
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 09:34:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690154.1075918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVgI-0006ll-13; Fri, 08 Mar 2024 08:34:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690154.1075918; Fri, 08 Mar 2024 08:34:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riVgH-0006jl-U8; Fri, 08 Mar 2024 08:34:17 +0000
Received: by outflank-mailman (input) for mailman id 690154;
 Fri, 08 Mar 2024 08:34:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i+fI=KO=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1riVgG-0006jf-5h
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 08:34:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7e88::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4d46ed7-dd26-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 09:34:15 +0100 (CET)
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by MN6PR12MB8589.namprd12.prod.outlook.com (2603:10b6:208:47d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 08:34:09 +0000
Received: from SJ5PEPF000001D7.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::7d) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.28 via Frontend
 Transport; Fri, 8 Mar 2024 08:34:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D7.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 08:34:08 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 02:34:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 8 Mar
 2024 02:34:08 -0600
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 8 Mar 2024 02:34:06 -0600
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
X-Inumbo-ID: a4d46ed7-dd26-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uuss416UppmybuDGVMWsM9cCNsVXNnShImPsLUELW79Bl2sCiI45D9EKio35Y3pauc7L8f6i4ANrxBaNiQ5qH0yRZQeunf27d4DQfNbZ2TPVQjjUXfnfFuHP7ON7q2keBpKwHXx4QHlQHYLdQiFCzhJVD6omdzqXgRuO02xXGuk2uSk/JHi39Sx3dseV57WjGH/Hn0BluV67f2iQOVJ1AnOtDm+58i+6P4HsAvXsxkVrjxYRUvlTfZwQYbvzpbLuksGh0QlXlMlG2dYvsI1VMz8gOe6Ws/Imf/mzerTskm9EoJAzacneKpkThE4NFMeITKQdlMJSJe+4lmeGxLq19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5hmyfLLKk0cdTvnFCYAQ7vqWbo640poNRGcfmE9g+r4=;
 b=Zr0BaCyYC31kKTk5kumbmaY2alCMxq/ICiKwhrRC4WNeggAimGVPDuHdg3Q0U578XKtVxeGKXWa+IUWCblhH/gMsmAfozOjoeWQYkHK0yH7KbscDiUsKoShUWP8vcpImNCdQn2mZea3MvfRmW2xVedEkjm0k8j6+w6Qx3I3dp+3twtybqWnkTLpgXl9v0xmKBWIb2uhH7cmopLcRdgxfQyfztVZUidTcF8BNOMK3ICprZwCS27Q8o93KlBbakuRuC6UBF1BLY9ZL3YEU9gUcU8bk0OlqFarF3ATXujOAd6VarEKcPdgFGAOSGm1dOT+OCMaZVXinA9jD3S/i0JLrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hmyfLLKk0cdTvnFCYAQ7vqWbo640poNRGcfmE9g+r4=;
 b=EOKEN57Y4sIrR4n2FsmOB0VLHIjnV6ldWVGQvPSajYl+5HveHOAryv6vaqt5ETVZFPByvFgj7aT3FUWaiU+SefQ53EgxCxWNOq+sfKQ2RJ5oS92FhGeTs/Xhg0U6qKv+Yy4cwyrMsBTusLXjHWEHPAuvxH5Mk/yeVoVq0WthcJk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <b1f31e7f-c817-427e-8657-d36f0e8f04a3@amd.com>
Date: Fri, 8 Mar 2024 09:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
To: Henry Wang <xin.wang2@amd.com>, Julien Grall <julien@xen.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240226030146.179465-1-xin.wang2@amd.com>
 <de4c6988-7051-4d44-9b44-e850ad4b4cc1@amd.com>
 <DS0PR12MB9448472A793F33228BE6A185A15A2@DS0PR12MB9448.namprd12.prod.outlook.com>
 <e5cad59d-9c3f-4e4c-8b97-5e0fbd4eeda2@amd.com>
 <800eaf87-053a-424d-ad0e-2b725a37de89@amd.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <800eaf87-053a-424d-ad0e-2b725a37de89@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D7:EE_|MN6PR12MB8589:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ad79f6-97c3-4cf5-6e0d-08dc3f4a8622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QwFP2S/oYRNWcSinT0CVUyHkYmxApPKc35DOEGalq00sPAGKviwOYNjbJOsGI4yTJsO9D5k16+q0eZQ1YozT3iO86IyDt/hBcsEwOSiN51dpZkCv4oYWuM/1tZ+JqLiJPDwZ+82rGhDpFh/WMVpjTzOb4kXWg9d371tZQKQLIV5UF3SKZepfYUA/g3oGRR8oS+c78lpfsQJIiRh4bDYxiEJaxCtRzv1G4zmEm2uYMW7ODQpHr7p63X0ZDvWV0bsL5o2Ac9Lo07WhZkDx8v0fgmtlgL3y+/lrikVRylsOlBvfsLsv3B5SVw5O/NF2AGsYzda8nvUdBaCbhLCPjITiNffdcyv/RqKwH+oy3hn0Qs9gqk/oaidPahTQG7mLaz1u7QJUpkkAXcrbOuQ4QoHYep0kFOd+Ne4RA6mBxX2JCVkRicNh91c2hoaxOebB3q5D40uQXfscz9L/EJ1ZZBfXGga4L83ziBJwyBPo+6DZtTjp9ul4eG1qxHfJTKoXPITQsitTzMgrE4z9QX7ZDIXR9wSSKQflWCSG6zAoku3eGS9kklY9RVoa65UWrtoVeQwtS1hMlKMt6z+zWeT82FBOu0aKs7edo4WrxguSa+2TIEqIfQ705KB7uIZazbCQ6dtgvZ036VYjOkoNfU1rSK9Q/1QmiA1mL3ivcdGjdV/TSYjSH9QhRG4pc3AuDs3hgEVpWx5FRrbolZLvgLftb60cktWb4aKwRDkJXWwzW8CnIe/6B4Wy9mYPSiyhyuPOFaNR
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 08:34:08.8894
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ad79f6-97c3-4cf5-6e0d-08dc3f4a8622
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8589

Hi Henry,

On 08/03/2024 03:05, Henry Wang wrote:
> Hi everyone,
> 
> On 2/26/2024 6:43 PM, Michal Orzel wrote:
>>>>>   xen/arch/arm/smpboot.c | 6 +++++-
>>>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>>>
>>>>> +    /* PE not implemented using a multithreading type approach. */
>>>>> +    if ( system_cpuinfo.mpidr.mt == 0 )
>>>> Do we need this check? It mt was true, cpu_sibling_mask would be incorrect
>>>> anyway (it would still be 1).
>>> I added this check for playing safe, because I only want to do the correct thing
>>> in this patch and avoid make things worse for MT case. With this patch, non-MT
>>> case can be improved and the MT case is remain unchanged.
>>>
>>> But I agree with you, and I would be more than happy if I can run a MT setup and
>>> finish the "else" part with this patch or follow-ups. Do you know maybe qemu can
>>> allow me to emulate a MT setup so that I can fix it properly in v2? Thanks!
>> A65 is the only Arm CPU with SMT and I'm not aware of Qemu being able to emulate it.
>> AFAICT, in Xen on Arm we assume no SMT, hence my question about your check. With or without it,
>> some parts would still be incorrect (like cpu_sibling_mask), so what's the point in having a partial check.
>> I would keep your solution without the check. Others may have a different opinion though.
> 
> Since there isn't much discussion followed-up in this thread, I am 
> wondering do we have more inputs/opinions on this topic? If everyone 
> agrees, I've followed Michal's suggestion in v2 [1].
I clearly forgot to say in v2 that I'm ok with this change, so:
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal

