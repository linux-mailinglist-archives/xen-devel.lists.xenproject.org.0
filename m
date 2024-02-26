Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289F8867233
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 11:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685452.1066195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYdM-0008MZ-MV; Mon, 26 Feb 2024 10:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685452.1066195; Mon, 26 Feb 2024 10:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reYdM-0008Kn-JQ; Mon, 26 Feb 2024 10:54:56 +0000
Received: by outflank-mailman (input) for mailman id 685452;
 Mon, 26 Feb 2024 10:54:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fECz=KD=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1reYdK-0008Kd-E6
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 10:54:54 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76f4bb0e-d495-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 11:54:51 +0100 (CET)
Received: from BL0PR0102CA0015.prod.exchangelabs.com (2603:10b6:207:18::28) by
 DS0PR12MB9060.namprd12.prod.outlook.com (2603:10b6:8:c4::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.34; Mon, 26 Feb 2024 10:54:49 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:207:18:cafe::73) by BL0PR0102CA0015.outlook.office365.com
 (2603:10b6:207:18::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 10:54:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 10:54:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 04:54:47 -0600
Received: from [10.65.148.173] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 04:54:46 -0600
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
X-Inumbo-ID: 76f4bb0e-d495-11ee-98f5-efadbce2ee36
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faUl4LFR8YwFVwKmcrgDE5FPKpzzi4tKyqhMrdxyi7Fqw1XABY8m6kxshSub0v4rgGQqGohOqKqZWa1H/hjiI5GQDVgISytxiVyRXfKMRDvitXY07+MMZDSFBEK+rYNQJyteVyL5Wg4Hrm/6N3c6+bBRK1TKqktuFCjWvCum9O3ThFJ8P5TpuIWed8/RwMGvm33TParFYzJWUkz0GZ4V52AiC0Uii53XsV2nsY1izwAaG+YB6FLk210zcFjqE6qppsba2Pq9/s56pI0ZPsXqGbMwpswA7MAUVGe+FufxotMOhyIJ/ORfJ1pkFZKjNBZA+N6QX88FV5HfFma7tu9XxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTcY3MjSx4LU/IzmIoFgBTZJC2kZ2k0EUf/dwknBL7I=;
 b=YfpQYa5zZqQru/vswb/gHsFEgkLPrZzWurwsCuIjdNErJAZ7BANrh+8kMvwkQnwgElD8f/h6/+vwWD/3i0fOEc3Scc04rhGaHn1hWdnuo6j6Lpw+hq1uXKrON2hJhTID1so2YlsYZ3No5NdTJtE5/kGt81YAiFroMs9vWv+8oIQd5MQGRtBnxXRzTfieyIhIXGLbesI5ka6rtYDA4LJuXbFc5SiBgS6dEXitOdooAuwepL2fdX+7KWOLLy9c4EU5l+jFbpOnf1tC7Z1L8hwzX8C1J1PvSqVfftdJSzMHaOmYeUnTaVmwu87VI1+Ko7HxgVv8Yqx0s4IKeNAEql38zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTcY3MjSx4LU/IzmIoFgBTZJC2kZ2k0EUf/dwknBL7I=;
 b=XFE/EhJ2lzHZHpA0vfpJE0GOIuk9O1oAaIfX1E3WmUmu1EWJf4m1Ro0IZxXYyyAi35Af66d6TpMzTY7pX8rNEEKEVcUptoS8r0E3xxFgnJjc/98QNP24xCGvHSphI8YsGpq3a/90mLV4fclbPTFbnSqf8q6YSYaHBgzOOdgkpJI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <61789c6a-c306-40fa-b6ef-9b5b5b32e1b7@amd.com>
Date: Mon, 26 Feb 2024 18:54:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Set correct per-cpu cpu_core_mask
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240226030146.179465-1-xin.wang2@amd.com>
 <de4c6988-7051-4d44-9b44-e850ad4b4cc1@amd.com>
 <DS0PR12MB9448472A793F33228BE6A185A15A2@DS0PR12MB9448.namprd12.prod.outlook.com>
 <e5cad59d-9c3f-4e4c-8b97-5e0fbd4eeda2@amd.com>
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <e5cad59d-9c3f-4e4c-8b97-5e0fbd4eeda2@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|DS0PR12MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: b98cda1d-2062-4436-dbf0-08dc36b95a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NifDSP/WtPoolJUJUQuya3ys3Q0eBaDFpatsSOgqvTYkhyguew3bq9atQVdOQTyx4nhhkl1zoyDpf9XvP3c8Yxx98aIL4rUkq11RDLeDxzKviPO49E7VP/UMcjS5WIAlbdjrJ2/cgO9ZIFhDxcvQygjKC3zzXrkkDddrdBVz4li/K14pqxAIY5ymCgSoYst1qakPkfAXn+zri8+o1XAQZqUpaVPgGz51GQzK8gvD91p2WCFDonqRACvAsaEyVb458vGYen9bomXRgALkQx/rG+gAza2P6EaP1MOcE2wDiISZLd4vhwEvtXFllVLVPxRP5kLuOtVKF+aTmpPoZQvlwZ86GRc+MyKIrRy7Yn6q7GXWV/jidu1bI8EaSV5/I13/+8jcY58SZQJa25NRXzdAEM35CLPuR1/W1sT/+JqxCaUQUMmbTnup0K2c7ODT2NQhgm1tC2Yu9WuDQ/P5ma+s0V7Cql5+yoZ565sjPqoj4yTQXZuR6PiqdXVXk+ZlC0Fc0ZQ1ObI/UYWhv71Yg4o5l0ddgCVNORxCEXG/i3S/dSrK6M6sRGwla4Rc8sUy5Bt7Fei4vidWk1wSRNcK5ZrWcC8JgjV2SjW7X8qAoJXsAgZ10v8AX8Sk4Pv98Z/+TdEWtt2Uqc9i58v6bFwDhwY85eWsikMhVm201DQcZrppAGBy5h5SDbc8tuCJE7GHtKPpn4z83tt1Rvrt6lO7T4+NYKXP2ziMSDvgDGO1fjewof8RVSgnaRuf47IrA44E9VzD
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 10:54:48.7616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b98cda1d-2062-4436-dbf0-08dc36b95a27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9060

Hi Michal,

On 2/26/2024 6:43 PM, Michal Orzel wrote:
> On 26/02/2024 10:54, Wang, Henry wrote:
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

You made a point. So I think we can wait a bit more for others to share 
their thoughts and I will change accordingly after.

Just taking a note from the chat that we just had - maybe remove the if 
check and add an ASSERT() of the non-MT would also be a good idea (not 
sure if this change will break some existing HW setups though).

Kind regards,
Henry

> ~Michal


