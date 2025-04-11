Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D82A86093
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 16:29:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947452.1345076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3FNB-0006CA-Vi; Fri, 11 Apr 2025 14:28:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947452.1345076; Fri, 11 Apr 2025 14:28:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3FNB-0006A1-Sy; Fri, 11 Apr 2025 14:28:49 +0000
Received: by outflank-mailman (input) for mailman id 947452;
 Fri, 11 Apr 2025 14:28:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4v6j=W5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u3FNA-00069v-GM
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 14:28:48 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2407::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 464fb8e9-16e1-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 16:28:46 +0200 (CEST)
Received: from BN9PR03CA0395.namprd03.prod.outlook.com (2603:10b6:408:111::10)
 by MN6PR12MB8592.namprd12.prod.outlook.com (2603:10b6:208:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 14:28:42 +0000
Received: from BL02EPF0001A0FA.namprd03.prod.outlook.com
 (2603:10b6:408:111:cafe::26) by BN9PR03CA0395.outlook.office365.com
 (2603:10b6:408:111::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.26 via Frontend Transport; Fri,
 11 Apr 2025 14:28:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FA.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 14:28:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 09:28:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 09:28:41 -0500
Received: from [172.17.237.105] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Apr 2025 09:28:40 -0500
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
X-Inumbo-ID: 464fb8e9-16e1-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9oS62osuDQP9jW2A6t/twQhgHiQjyC2EqG4wLOVQs2IxYClYo1S10A2GXfhxJZtQINLugYd+ouicRUl+tm84ERms5HHBn9LdgLfnH4vRhd9dUPAjFKRav4lEP33wZXi8LVphZrN1I9uAk1blYYAYrIw2wnqdV5dr7ucfER2riF44VTw9Jp+iUdB3I/ZeL0WpzSQuULQfCo6NPpaAJdedTbUPAekd6rwyvtQiYoH1y1D1GdBDWxfCPRlQeItq3/rM3BhmEeqt2Z6cQpy9pA5lidpdp0jOHRUIyQb7Ap6Anscms10VkgZhXg71tfAmcbDFuY3u7srCvN/iOLO5nbILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JdF8TtXG0mMAcfOsIIUipK7qCEU/CIXwfpBZM3xMX2s=;
 b=hNjgXr7uGUS8r649/cquXP2T9HPJxOqkeBatyGDxIP4XayMzfEwoYy7UY90ugz4tsc1lOVOQdAZzhwlYG5sD0sM062w9ASha522EGEGKantzc/tCaNicMLAB4N8SWFA0YrKN4tSiYTeVTh8/kjnrd+d9ctNgLFX+Wvha/Bvvzl/DV71es4EbgWbWQouyTq3k1vKcXtblomeHljFpc2y5hFlOM+1Cn6yVclXMpvmR/y9+EqX1ZUKe7Ym4A8kZ2JIGr3R+A4FM9UQdircALcKzxhPXZUrsLox1vh2uSQ8byhVhImGnPKqKaa2uwG4EGV1LdtGqYSQ02L3Q8GltydMc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JdF8TtXG0mMAcfOsIIUipK7qCEU/CIXwfpBZM3xMX2s=;
 b=Yb2zNEnWW/StdSoZCYAXUOMA/2bDWVJ+rtlaWBg3IwHkpKwKyxyo8uXjNLwVoolP3/w3YyqV6WAsUoNOlRAUe18eAjHLHFeEYrLWaDUYBmiXALZWBZBS7vmHtGSesS49kLuBpaucN1dYO8VMJgcsyhhKgNnlcIlZsYNYPgB/ZgA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <8d2bfccc-37e9-4f36-8909-58c398938ea4@amd.com>
Date: Fri, 11 Apr 2025 10:28:41 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/xen: Fix PVH dom0 xen_hypercall detection
To: Ard Biesheuvel <ardb@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>
CC: <agarciav@amd.com>, <jgross@suse.com>, <anthony.perard@vates.tech>,
	<marmarek@invisiblethingslab.com>, <michal.orzel@amd.com>,
	<roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>
References: <D9366FPHFS9F.2OP8KH7C8OJTF@amd.com>
 <20250410195012.363658-1-jason.andryuk@amd.com>
 <84c03f50-638b-4df4-af52-8f79bf00dc20@citrix.com>
 <CAMj1kXGCSSHvokAB5bq4vJv-xPPQf1P468dvoBmpJ-0kNsm6Dg@mail.gmail.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <CAMj1kXGCSSHvokAB5bq4vJv-xPPQf1P468dvoBmpJ-0kNsm6Dg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FA:EE_|MN6PR12MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d67b9d9-0981-4fc2-a8a8-08dd790528f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U1c3M216elpYbk84ZWFHUjkzZWxHSnJYT2dkVmx6dVhROWpoeWkvOVV3TXMz?=
 =?utf-8?B?NE5lc1NPL2JSOUVkcHF5UEZqWnlrYlAwMDdOU2RLdGtTSUkvdllVL09ZdS9S?=
 =?utf-8?B?ZmRKaVNSOFVrb3VPYWlZUHRCRkI5bGdvYUl5MTNPdDFZM3FXVmVmR0hMcHZh?=
 =?utf-8?B?L1duY3lkNlFyNGVGOUtxZ2VnU1pCVnp2RWpuR3FmdWMyWTI5c0Jwalp6c2Fo?=
 =?utf-8?B?OTl2c0RvemdjU0hCMituZ0RYK05OSHIrYjVjTlRNWmduMExjbVhHZWphZHMy?=
 =?utf-8?B?WWlIWVZnOGlrbDIwVk5KL01BRXBSM2FQSVdTRWRIbG5yVStVQS9FTjY0bzZH?=
 =?utf-8?B?ekw4bktscCt5RFlsV0ZrUFQxMUJSS1hvd2cyT3hDaUhKd2w1a1oyQjZ6ZlFi?=
 =?utf-8?B?cGVXdXRVUGRLRFNqZVJzVm52dStLMko4VG1FbEhmY0djeHJQMlo2ejNuMi9j?=
 =?utf-8?B?bUVKendpMGNPRkR1QW94cTlYdFZwQk5qRU5kb0NsR2cyOWxpYVZmRDN0OXEv?=
 =?utf-8?B?UmJvZnJzVG5VMDg4eWhEb1hGWXdmeTZzQUhFS3hQa1NYTDlOdkZQeUZ1Zy9Z?=
 =?utf-8?B?N1RGRDdzQVFESkJmY1hReGxvL2twcWwxY2NvWitWOVBjMnBKKyt0TEIwanla?=
 =?utf-8?B?RG0zZkk3cmJ5OW4rVkV3bEFpMnIxeTNRVk5FQWFhWFk4VEVKYUxhM3crZTFm?=
 =?utf-8?B?ZEhpV0FiUkE1RjdhdTRqeFhOZElWekpSdVM1MGxmNFhTUGpKUHJydlhVVUhS?=
 =?utf-8?B?N1dzTTNlV2g1bmNHUFp0TnZMUVlCcFlDSFhrY1dDajZYVjJDdTdPd21oQ09P?=
 =?utf-8?B?b2tOV1Zmc1Y1cW1UN2QwK1ZXRGpFeStWVmJmUXU3c1RzWmkrNTVraXFzN2RO?=
 =?utf-8?B?UVdTSzRQZ0UrNlJTVnpCRU9uVi9xR0l1M1dwWHowZnZGdDliWjFTSDJKMnJS?=
 =?utf-8?B?Y2xSeGhkN1dtV0hhclAxWVRhZDM1OENBZmxiYkt2TWI1MkM4azNHcnJuaXcy?=
 =?utf-8?B?OFFZMWJVREF2dDNHSUs1cFA3OUZvdDFkNzdjQ3l0Y1p0SVRPN0s5TU9Eb29a?=
 =?utf-8?B?T1lKL09Oc25EMEdNR2oyenI2S3B6VElrQ0ltdE1LMktLOGg0Z3NrZWlDVFRn?=
 =?utf-8?B?V1BNRHN3blVsMm5qRCtZNStqc2R1NkhSMjh3b2UwYktvOWxMVmRDOTlhNzZr?=
 =?utf-8?B?M0NLUWhSWlF6VzFXbFVRMGdHSGJJeFd1blVuV2VOQ3BLMUsrWU9OZGpvT01i?=
 =?utf-8?B?VHNRN0ZmM3lPSm1QR1dXRTdMWERvWVNoZDBaVW93RXpGcmp4TU85SUhudVZx?=
 =?utf-8?B?OFRzQjdRcE5GU2U1cDJNNk1TMzQzemd4NkxUbU1BN0Z2ZkRnNVdDQzVhcDhX?=
 =?utf-8?B?NmZDKytXMERiUHdsMzRTVnhVVU0vSzFISUx3UnpwYVV0Vkp0aU4yZDdlM1Q3?=
 =?utf-8?B?NTBSWXB1Q3hGekdMeGNoZnV5dzdvSjRlZFJMVU1adlNsN1NtOE1raWtmR0tv?=
 =?utf-8?B?R0NUNHpaNmhRRDF2SFowL2Z3ejIzVWMwY28rSUMrbzhibEpWRzRxY3BLd2JU?=
 =?utf-8?B?bzJqTW1PSVlCWEJqN1I0RmVpY0k2WnFYQzFrL0lqemJkanBwdDR2SmM0anVP?=
 =?utf-8?B?MU5zRWFuQUZaQ0hFOCtwK3pYMGdxYkgrWk9FVW81VHRVUzdPNVVUVSswQ0o2?=
 =?utf-8?B?UkwyZGFsclUvZGRheGRRekpoMTZJNjdtdUQxTGRiWktwTTg0dmUwa0diNlVp?=
 =?utf-8?B?Q2wrRnlJVG5saWRxek5jdUV2QkJPUW5DdzVXbDZLYlpQYlh6Zkc5V3VCcUl3?=
 =?utf-8?B?VHRVWk5QSUE2NjZSU3BtQXA5U3gyL2lzN1RqbTBmemJnYU4yM2M2RzFtV3Nk?=
 =?utf-8?B?MlBuV0xmQnhaY1ErZ05zT0RYMFJtclQ2VWtDanVsVEI1Z21FVGpXTFY4SUs4?=
 =?utf-8?B?NWFaelp0NWtGMko4SXVIM0hxRlc3T0dhbW13Nm5CWiswRzZGWTRldWxNOTg4?=
 =?utf-8?B?OHBGRFRvY0hUcmxDZEs4MUgrdDV3STU1K3QyakFJWFNjZU1zbDFkM25YUEV4?=
 =?utf-8?Q?q/s2BQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 14:28:42.5126
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d67b9d9-0981-4fc2-a8a8-08dd790528f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592



On 2025-04-11 07:35, Ard Biesheuvel wrote:
> On Thu, 10 Apr 2025 at 23:49, Andrew Cooper <andrew.cooper3@citrix.com> wrote:
>>
>> On 10/04/2025 8:50 pm, Jason Andryuk wrote:
>>> A Xen PVH dom0 on an AMD processor triple faults early in boot on
>>> 6.6.86.  CPU detection appears to fail, as the faulting instruction is
>>> vmcall in xen_hypercall_intel() and not vmmcall in xen_hypercall_amd().
>>>
>>> Detection fails because __xen_hypercall_setfunc() returns the full
>>> kernel mapped address of xen_hypercall_amd() or xen_hypercall_intel() -
>>> e.g. 0xffffffff815b93f0.  But this is compared against the rip-relative
>>> xen_hypercall_amd(%rip), which when running from identity mapping, is
>>> only 0x015b93f0.
>>>
>>> Replace the rip-relative address with just loading the actual address to
>>> restore the proper comparision.
>>>
>>> This only seems to affect PVH dom0 boot.  This is probably because the
>>> XENMEM_memory_map hypercall is issued early on from the identity
>>> mappings.  With a domU, the memory map is provided via hvm_start_info
>>> and the hypercall is skipped.  The domU is probably running from the
>>> kernel high mapping when it issues hypercalls.
>>>
>>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>>> ---
>>> I think this sort of address mismatch would be addresed by
>>> e8fbc0d9cab6 ("x86/pvh: Call C code via the kernel virtual mapping")
>>>
>>> That could be backported instead, but it depends on a fair number of
>>> patches.
>>
>> I've just spoken to Ard, and he thinks that it's standalone.  Should be
>> ok to backport as a fix.
>>
> 
> I've tried building and booting 6.6.y with the patch applied - GS will
> still be set to the 1:1 mapped address but that shouldn't matter,
> given that it is only used for the stack canary, and we don't do
> address comparisons on that afaik.

Yes, it seems to work - I tested with dom0 and it booted.  I removed the 
use of phys_base - the diff is included below.  Does that match what you 
did?

>>> Not sure on how getting a patch just into 6.6 would work.  This patch
>>> could go into upstream Linux though it's not strictly necessary when the
>>> rip-relative address is a high address.
>>
>> Do we know which other trees are broken?  I only found 6.6 because I was
>> messing around with other bits of CI that happen to use 6.6.
>>
> 
> I'd assume all trees that had the hypercall page removal patch
> backported to them will be broken in the same way.

Yes, I think so.  Looks like it went back to 5.10 but not to 5.4.

Ard, I can submit the stable request unless you want to.

Regards,
Jason

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index c4365a05ab83..9bf4cc04f079 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -100,7 +100,11 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
         xor %edx, %edx
         wrmsr

-       call xen_prepare_pvh
+       /* Call xen_prepare_pvh() via the kernel virtual mapping */
+       leaq xen_prepare_pvh(%rip), %rax
+       addq $__START_KERNEL_map, %rax
+       ANNOTATE_RETPOLINE_SAFE
+       call *%rax

         /* startup_64 expects boot_params in %rsi. */
         mov $_pa(pvh_bootparams), %rsi


