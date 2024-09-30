Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9B098A69C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 16:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807424.1218866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svH1g-00019v-4J; Mon, 30 Sep 2024 14:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807424.1218866; Mon, 30 Sep 2024 14:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svH1g-00017L-1K; Mon, 30 Sep 2024 14:05:24 +0000
Received: by outflank-mailman (input) for mailman id 807424;
 Mon, 30 Sep 2024 14:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbcU=Q4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1svH1e-00017F-CG
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 14:05:22 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2417::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06be2d16-7f35-11ef-a0ba-8be0dac302b0;
 Mon, 30 Sep 2024 16:05:20 +0200 (CEST)
Received: from CH0PR04CA0006.namprd04.prod.outlook.com (2603:10b6:610:76::11)
 by SJ2PR12MB9005.namprd12.prod.outlook.com (2603:10b6:a03:53d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 14:05:14 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::23) by CH0PR04CA0006.outlook.office365.com
 (2603:10b6:610:76::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27 via Frontend
 Transport; Mon, 30 Sep 2024 14:05:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8026.11 via Frontend Transport; Mon, 30 Sep 2024 14:05:14 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 30 Sep
 2024 09:05:13 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 30 Sep 2024 09:05:12 -0500
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
X-Inumbo-ID: 06be2d16-7f35-11ef-a0ba-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJJpUwQHocqocwaxPDuQWIrEqQJjTol5ZySjDvlIJEUokcQ+86ZuCZyPi20HQfv7NdQZ/skXZhS3BUcnN4Yh1chafayCIsGqdF9tjOlibSsqe/DP8v9Oi6E4hvbNZM7jpP9EcmyM8MdzAu5xvTY2ccvsVOdOOLomVpVpIQ1LUtqfrXvVXdcgvtI09M21EFfSXUfm6px+pTG37aYrmXhqsz693eE++10WlR212rFuTXFXqY3mQJWDio7jOrX52SBy3l3or1lSpJ1et1jg/5gyH0Y94ifzJQyZWkQr3j7x/rhnflJe+dUNRQAAUnHrEPaJ8hpH6hb2RbCdT+k9jjtuig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/Cihx+mOiWwNiDdPgqjRJfU+bp0JRfWWwnxfI/UAFM=;
 b=BX0FE2/rbZ45mV1gZG9txEgJ81Qi+ayyjUNNJyApm4/ANyp+AjnhWW3PEfo8TiaJ5HF3Kp+PCMun+oPY/03Ub+DJsbwnDKEXDHOtQ/O12scwYWXAg4VzqHLMhgGZfq3X38xpii4wwp6tn4Ua9KxrEhWGDYlY46cA9Zuw/8a/kD1Zr6boT0GxREWg/5unGnaq8F2SDr8bqVTV2T3apNigm2+VYp+8qN6+OxAD9cBK7n/7a0YiQlLYyskjA1SEmO8G4ON8iIyOLob673vy9Ev7s1HXhvDNuMxvTh5pi8kCXNeawazUqQh8/OSBpwSOdcLqegYQzVdzNrnYsnmC6U1meQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/Cihx+mOiWwNiDdPgqjRJfU+bp0JRfWWwnxfI/UAFM=;
 b=WXA7A3h6C2s+ckI9tEeRqrRjBALu1luEixvFSUM30mB/lMXle3DeiII7Mok7XyCjtP5dSu8Y3m9YEVHwcLPCstvj88Jw2o6NTjJ0wNQDlQharbaLXQvPNOe2ODPk3FQ1o8sKl4D1VRghez9OjvAL4dnexcfjmaIfAdDSibsOmgs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d41c1433-95cf-4ae0-b1e8-008b374f468a@amd.com>
Date: Mon, 30 Sep 2024 16:04:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-overlay: Fix NULL pointer dereference
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
References: <20240919104238.232704-1-michal.orzel@amd.com>
 <20240919104238.232704-2-michal.orzel@amd.com>
 <72bd286a-9ed9-43f0-8935-fb9e07e180cd@xen.org>
 <74bddc2d-59f2-4961-b226-76ce62376c37@amd.com>
 <a104a49e-07f8-4485-ab03-9fe1dcf41f33@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <a104a49e-07f8-4485-ab03-9fe1dcf41f33@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SJ2PR12MB9005:EE_
X-MS-Office365-Filtering-Correlation-Id: dd51ac99-f324-47d4-3c45-08dce158e7b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V01CM2NVSUlMNWUrTHVDSkdtNXFUODk5Q09ZeTRvZVJJSFZTeEQzcmE0VjFX?=
 =?utf-8?B?WmlhaEcxeWJFSnFDc1BtOFVmcFd0dkEwSXc1dzYwVmFvaTVnNHJlUGRxdEk5?=
 =?utf-8?B?STZ1MHhGemZKRys3UlA5aG05TE1xaDlCVzlYc29qOG00ckFrM21FNXZIVFJU?=
 =?utf-8?B?VzZhdWc1M05UMlhpTE5wMkh2Y2VIYVBZMGlBcUR1OVViUnRPK3UxWkFncmNy?=
 =?utf-8?B?TDdiY2FHcWZTUTNWRGFtMWRUQWZLczNjZ3JONE1tdDBuZHMzdEIzWWt3ZHk2?=
 =?utf-8?B?cDR3UWVuZTRCMzRxSmk2a3ZheGVJR0NoVDBlTllUWnhDemJ4Y0J5b3B6MHFD?=
 =?utf-8?B?YWNlZGNuQ3VDVUNLN29kaWRtVHBpU3p0U2M3aEVVYXpEakVjOHkvNEI4UjhQ?=
 =?utf-8?B?dHozMnZPMVhsS3NZS3d0NGM3ZTVUdXNBWTdFNmJqUEJSRm1EeFBzek4rUWl0?=
 =?utf-8?B?Q2s4ZGtoSWRPemlOQmhQRDNqTXBSMGJZbGtvWkVMOEFsN3hNNWtkYTBlb0dU?=
 =?utf-8?B?dExyOU1hMDRyNGlaYW1Ec0tiTDN2eHV0VHJGVXk3b1FWcU9iNThEa0FXQ245?=
 =?utf-8?B?Vllsa2s1NEpUWkRsNGZpOFhrdXU1U3A0TmFqSFlibTZRaXg3bWdVTTRLZE5y?=
 =?utf-8?B?bStOSE1sMlZscEt3TW02ZWdmbHFiNWw2cFNqeXRiaENCc05kR2YvNEVha0Vm?=
 =?utf-8?B?M3kvcmw0N0xGMlFTK21xS3hLZWE2elJXeW9Tc0ZYYWFLbUNZM0MrSHM2a3dj?=
 =?utf-8?B?R25RV2x6OHdqa3JoQ1J0RTB4NGlhYWc4Y3gvU2ZqMDZlMzNySGExYkRHYktv?=
 =?utf-8?B?cmMzbU0xYnBmZ2I4bUZSNVZNYWw4ZkZMUkM4clNrUHhoaHRmUnNpVEJGaWJN?=
 =?utf-8?B?S3BreURTWVV1NW5zalo3VXl5N2dJekJLUDRIQlVoUi9MclJJSWxpc28rTEhs?=
 =?utf-8?B?UG5nQ3BjZGFTWkluQldXaXduUVNMdTNhSDhhNm5Na3NXbklUb3R2eFc2c1dV?=
 =?utf-8?B?eHlnSmY0L1B2SW51ZVNHMUJYbnl3VjM3U1ZnbjlSTjVOT0tPZ1orekVGUlZK?=
 =?utf-8?B?RWJYV2ppT0o4Zm5XdmVUVWlEbkpmaHRaa2lQMmUwdlZrLzVLWXVKWTczbnds?=
 =?utf-8?B?Y2Z3K0lQYzBGWDJZZGh5cTZkVjVEdzdqOGs5WkY3c2llWENzcnlxamV2cUxl?=
 =?utf-8?B?RWZJdHBWcE9zRCt6M0cxWmtaN2pWSlFnRC9jWWEwbnA2S2VLNnV0MXJ5R0lM?=
 =?utf-8?B?b0JjL3REUm96Mi9IVmJjUHVQdkF2cmROTDlDZU55NXh1bWdreElWMEhYWk5C?=
 =?utf-8?B?RmF5bkZRdnlqOVdpa2FxSkFuYXNlMjBRMmlzMXNiemt0L3Jqck04TTk5bXBD?=
 =?utf-8?B?RFlDa2pTSHZock1XZFVKMks4N3NPZEpEL1RPNzE2YnNqRXRwcXdaNlhLUExH?=
 =?utf-8?B?bTNZMVU1L1h1MUFwenQwYjVVQTlwd2RFWTNlUFQveG5zQXRYTzZrYUhRK0FN?=
 =?utf-8?B?QUQzTWZNcnpRUkVTWitCRlhySDR1UEkyYmpMRjVEbWFVOTJJRnRjMWNQZWRa?=
 =?utf-8?B?VHErZ3BaYk9jbWZyVmY2VFJpK1ZuR01qVFRmUEhMaExSVkt3WFV4cCsxWnlu?=
 =?utf-8?B?Q29vUjh5eXN0M0NuRTgrS3pUWFRYRnRINFlsalc5TVpTYXpiUTBRbU52S0o1?=
 =?utf-8?B?bTd0Zno1djJMbGV2RVRQVmczSldPT25lNTNBcUl0M0ZoYmdCSmhVZUxlVGJW?=
 =?utf-8?B?QS9DV1piR2N2WkZpR0RRT0dUMFgxeFBpcFJ1bFFGTGVuUjZLRFo2S0VPekRW?=
 =?utf-8?B?OXpaSmFUUFhyaitnRzhBWjcrVSs2Tm1LWlhvb2pQeXU4ZGtBTStzVmU5LzRl?=
 =?utf-8?Q?Evph9GwkNp+yc?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 14:05:14.0034
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd51ac99-f324-47d4-3c45-08dce158e7b9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9005

Hi Julien,

On 30/09/2024 12:37, Julien Grall wrote:
> 
> 
> On 23/09/2024 12:05, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>> On 20/09/2024 10:29, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 19/09/2024 12:42, Michal Orzel wrote:
>>>> Attempt to attach an overlay (xl dt-overlay attach) to a domain without
>>>> first adding this overlay to Xen (xl dt-overlay add) results in an
>>>> overlay track entry being NULL in handle_attach_overlay_nodes(). This
>>>> leads to NULL pointer dereference and the following data abort crash:
>>>>
>>>> (XEN) Cannot find any matching tracker with input dtbo. Operation is supported only for prior added dtbo.
>>>> (XEN) Data Abort Trap. Syndrome=0x5
>>>> (XEN) Walking Hypervisor VA 0x40 on CPU0 via TTBR 0x0000000046948000
>>>> (XEN) 0TH[0x000] = 0x46940f7f
>>>> (XEN) 1ST[0x000] = 0x0
>>>> (XEN) CPU0: Unexpected Trap: Data Abort
>>>> (XEN) ----[ Xen-4.20-unstable  arm64  debug=y  Not tainted ]----
>>>> ...
>>>> (XEN) Xen call trace:
>>>> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (PC)
>>>> (XEN)    [<00000a0000208b30>] dt_overlay_domctl+0x304/0x370 (LR)
>>>> (XEN)    [<00000a0000274b7c>] arch_do_domctl+0x48/0x328
>>>>
>>>> Fixes: 4c733873b5c2 ("xen/arm: Add XEN_DOMCTL_dt_overlay and device attachment to domains")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>>    xen/common/dt-overlay.c | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
>>>> index d53b4706cd2f..8606b14d1e8e 100644
>>>> --- a/xen/common/dt-overlay.c
>>>> +++ b/xen/common/dt-overlay.c
>>>> @@ -908,8 +908,11 @@ static long handle_attach_overlay_nodes(struct domain *d,
>>>>     out:
>>>>        spin_unlock(&overlay_lock);
>>>>
>>>> -    rangeset_destroy(entry->irq_ranges);
>>>> -    rangeset_destroy(entry->iomem_ranges);
>>>> +    if ( entry )
>>>> +    {
>>>> +        rangeset_destroy(entry->irq_ranges);
>>>> +        rangeset_destroy(entry->iomem_ranges);
>>>> +    }
>>>
>>> While looking at the error paths in handle_attach_overlay_nodes(), I
>>> noticed we don't revert any partial changes made by handle_device().
>>>
>>> In this case, I am wondering whether it is correct to destroy the
>>> rangeset. How would you be able to revert the changes?
>> I guess the same story applies as for the partial add/remove which was stated by Vikram
>> in the commit msg of 7e5c4a8b86f12942de0566b1d61f71d15774364b meaning partial success withe some
>> failures may lead to other failures and might need a system reboot. I did not carefully look into
>> this series, my plan was to fix the issues without changing the functional behavior.
> 
> Do you mean in this series or forever? If the former, would you be able
> to outline what you expect after the end of this series? What should
> work? What should not work?
The goal of this series is to fix the issues I encountered while doing some other DT overlay work
as stated in the patch 0. The goal of each patch is clearly outlined in the commit message
by stating what is being fixed and why. The first 3 patches contain "Fixes" tag, therefore there
is no functional behavior change - only fixing what should have been fixed by the original series.
Patch 4 does not have "Fixes" tag although in theory it could. There is no doc mentioning that adding
nodes right into "/" is forbidden. Linux supports it so I added support for Xen as well.

After end of *this* series I expect the issues mentioned in each patch to be fixed + the ability to add
nodes directly under root node.

It's definitely not the end of fixes for this series. I have already written at least 1 more fix that allows
to have other nodes in the overlay tree that should be ignored (at the moment the code assumes that each node
one level below root, needs to specify target-path. This is wrong as we can have __fixups__, __symbols__, and other
nodes that we should simply ignore according to docs.

> 
>> FWICS, we do not
>> yet support detachment (only add/remove and attach) and removal of nodes and ranges is only
>> possible if the nodes are assigned to hwdom.
> 
> I need some clarifications. By "we do not yet support detachment", do
> you mean while a guest is running or do you also include a domain
> shutting down?In order to reason about detachment we need to go back to see what is supported in terms of attachment.
At the moment, we can only attach dtbo to 1:1 domUs, therefore we can stop talking about libxl domUs for now.
For dom0less domUs, we also cannot really shut down them. So it leaves us with dom0 whose reboot implies system
reboot. At the moment there is no code that would release IRQs and unmap MMIOs.

~Michal

