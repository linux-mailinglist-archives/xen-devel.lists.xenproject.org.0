Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2FFCE676B
	for <lists+xen-devel@lfdr.de>; Mon, 29 Dec 2025 12:10:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1193981.1512488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaB8s-0001Fq-RL; Mon, 29 Dec 2025 11:10:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1193981.1512488; Mon, 29 Dec 2025 11:10:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaB8s-0001Dz-OO; Mon, 29 Dec 2025 11:10:26 +0000
Received: by outflank-mailman (input) for mailman id 1193981;
 Mon, 29 Dec 2025 11:10:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rHFx=7D=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vaB8r-0001Dr-7v
 for xen-devel@lists.xenproject.org; Mon, 29 Dec 2025 11:10:25 +0000
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c111::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f799d02f-e4a6-11f0-9ccf-f158ae23cfc8;
 Mon, 29 Dec 2025 12:10:22 +0100 (CET)
Received: from PH8P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:345::24)
 by SA1PR12MB8988.namprd12.prod.outlook.com (2603:10b6:806:38e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 11:10:18 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:510:345:cafe::62) by PH8P220CA0004.outlook.office365.com
 (2603:10b6:510:345::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Mon,
 29 Dec 2025 11:10:12 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Mon, 29 Dec 2025 11:10:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 29 Dec
 2025 05:10:17 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Dec
 2025 05:10:17 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 29 Dec 2025 03:10:15 -0800
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
X-Inumbo-ID: f799d02f-e4a6-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeQubH514eXMgZt47R8/lqtdJRqhA2Wfdl/lwQrnBcedYwo+l1o84Xcv2GXLDC1kZegkVEvEqBJxOAqUnUTLNWcK4gJ/JHMVzSYSYva7dhRkP6uIw6KQjwQUt+Xkp8kWr70P0W0gM/p1wNxsO1ExWWPJlKfTfpxMl4pGfsP8KzduGRg86JGAOVoUKLJefCImOPwVqBzSkQuKllNyHTStYhhx2aaFrRugPGViHeKDUQ3/YrYVV1B8ohgGuCKUVDkfOqdZSffHmO+a+q3Yr7RBFgE9rimS70e0FpY7EpV7ijigPU8PifrO6zu3Uh7YyNI9rFRvl0rz4iL+LaoXe2kN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0cV5rV+xQPEWNXLpe0WxtftRePmtn+2wnrRtPWXJ0w=;
 b=noKctoP4dbyW0qMJmTSdttxyS+iK7oYY8NyFy/q5MU8xbCyD1WfU6FYIOG8GF6LMTNZT7swyyBMl5jWGMwmLA1d/VIstDYXbGpAHyAxJeiiwVdHN3V8x8xANFYrInrft57J+hZ72KPaKXgbfRNkGn9229w2k3ZI7Coc9xs+UYJofB4tvuHt3qxq0lQifSXQuvSXk5lpU3ooeWOyQgIXJIAaoaJZW4eGXsrij435O+LUi/VK7EevOflhzQj4LrarwfNWRpmD/7SdURlvtOjPitpax0G1S5QV7JRqihxmtGLJ3TFMm6ADFZNySu81zR5D0baYe+8gIjb4MT/zIs+ecvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0cV5rV+xQPEWNXLpe0WxtftRePmtn+2wnrRtPWXJ0w=;
 b=ZLHjVZc/P5bchwWWEJKLJH8srXLxKPv333wFpSdSzj4JbcRnoJ74NX9T/n91XccY9d3GsJtDmrIyM8VVcfshx721/rmjoICWWp3DxZLBNsmpeOEU49hY6uYcC4mK7SBtcOPrI07dwkGtm9rnesZIdZPJKjyj5TahsECGtV4p4qI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <9f343323-2743-4bd6-82de-afe3b48adb70@amd.com>
Date: Mon, 29 Dec 2025 12:10:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] xen/arm: optimize the size of struct vcpu
From: "Orzel, Michal" <michal.orzel@amd.com>
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
References: <cover.1766504313.git.oleksii.kurochko@gmail.com>
 <0756ee97dd47f6acdefe593694b743eb6bfefacb.1766504313.git.oleksii.kurochko@gmail.com>
 <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
Content-Language: en-US
In-Reply-To: <9f2c9e4a-64e3-4e5e-b5da-976ab433f6cd@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|SA1PR12MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: a28739f6-0f1b-4ecc-d38a-08de46cad976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?REdNOS8xYlhtZytzUGdvdEJDbEVYdGh6akcxMGg2OElxc2hpL0Q5QkZBS3VP?=
 =?utf-8?B?VytEYjBqSUFzOXBxNGlCeEZ0QUx2S3hYb3FLWnltakViMStxeW1KOER5Yk11?=
 =?utf-8?B?YVlGbGUrbjl4WmU2czUwcWVLWktsQXplaXRzUjJ1bTJFQ1luOVNsWGNyakll?=
 =?utf-8?B?ZGRYYmh0NSsraTliYlB3S1JlZFAzbWpvN1BuNVdwWk9qejZZa21JN2pVS2tU?=
 =?utf-8?B?dmhnOERVUmplS2oyUlI4UUozeFFwQ05IaDVaM3IxUUpDbnYxWm5RNCtUV2xP?=
 =?utf-8?B?MitiWmlUQS9FRy9IUjhRaEYwRHp5OHJJeHhYTkxRZlBvOGZtcGVnUnp6eTFL?=
 =?utf-8?B?U3BZSGtGTllyczhiU25IS1JYa1drNlozNTJLc0pjeFRWZUtOaExTZ1MyWS9v?=
 =?utf-8?B?N28yYllMRTdvN3puNVBHbmxwMmJBaWhJYUNFaDh5TjJCVnFaUWNTWUtqdTFa?=
 =?utf-8?B?MStyUFRHaDRCQVhWOUQ3MERCanAyNkMzYWxEeW9mZmpBb3B1a0dTK01mbjNF?=
 =?utf-8?B?eHc2NDNXeGJtVmZJN2pzMU5QR3lsVWJHLzVTK0JTY0FqWlFSZ2hpUEhuOTUz?=
 =?utf-8?B?YWVPK1hydzk5am1kYUZha3pkT2wzMmF2T3c3c2JUQ3YvN1dHTGJUL2pCZUEx?=
 =?utf-8?B?WlEwcVh0NHlxelNsUGJCZWxLOXZ2cjJWZnFsYVVJM2VyQWJHOXJ0Y3dwYUlD?=
 =?utf-8?B?azVmbEFOY1lxc1A1QVFncU9HWk9SK3V3eEFlYysyMVR4bjVFaW5SQVFIemY3?=
 =?utf-8?B?MVowZ0N5WUdxeUV5MnJlcTRHckRJdmxoRE5ZRzQ0OUQ4MnBocTErRGxSSDZQ?=
 =?utf-8?B?cGYrSVhDVFYvK2xWK05OZlJtN0ZCTzhWSmVwSHc1VTV4ZTJpSXNRcnFmQXd0?=
 =?utf-8?B?dTBNN0hRc3JUMlR5UjF4dStpRngycEMveUoxTHV1K0pQRGVzZ2Y1TjFuMHZi?=
 =?utf-8?B?dFJ1VXRkeWZuRlZLQXdOWkkrRXFpbTFGY1FVWGl4bTBUNzllb2Z5NlN0Mjd2?=
 =?utf-8?B?R3V3YUttcE5PR2I3d3BJQmtJTnluazZ2VHlob01xUVRNSXhhSTlPTDZ0UWVj?=
 =?utf-8?B?ZlNaTjFYS2hIQkRteWdnT0pwQzdyRll2SXpaZ1lTbnNhcTlIS0dRN2NqdUx3?=
 =?utf-8?B?VGFucTdMZUpsY0RycXFSTEdYeDUzQThxOFBWZTlRRmtGODgyVGV5VDBwSVBX?=
 =?utf-8?B?Qk5GN0VlR0lhZUZFeGtFVk10RzgxYkcwWGJpUXl5WlkvWDdQK2JsTXg2UUov?=
 =?utf-8?B?U2twQUFNandpK3d1SFVJcWphd1BOcTF2K3FpUmRXUC9Rak1FNVYyaGlXdGkr?=
 =?utf-8?B?cmxLV1BvOEFPMmZUMFY5ZVAyMmp6aVNHOEFDUFljMktHRmgwSXpKYzliTlVP?=
 =?utf-8?B?aFpxbmI1eUVxNXQ4MjNKMXZodDJQOFRTeGtRZVlucmNXdU9lalRqaC9MRjJK?=
 =?utf-8?B?REx1NXVoNnN3S1VBS0M0L3J3K2tad016UHE5c2NvTElOVC91dSsra1l4Tzhm?=
 =?utf-8?B?SGE4a0UzWFhNVXhwcmRIOUNlcWtMQS9lTkFxSXk3Z2JaZW5XNUVxRXZvSjIv?=
 =?utf-8?B?YWEyanFsNHZKOUlOMi9oYkNuNVM2UmpiUS85MDVGdFBQcUdJOGRZdTk2akF3?=
 =?utf-8?B?Yko2UGo3c1FvTUtyNko4K1BiOVg3VWx2U1pyR2lEcXpnTTI1Mi9qMytVSk9h?=
 =?utf-8?B?NzNkVW1XTGdFaFduQXFzdUxHNzRzMi9yUFdXemV4VXJ2L3NXT1VKUUtnNjE5?=
 =?utf-8?B?dUticHpGbVowcHdBZDZFaVM0MjRnQlFIeWpiUHNtdzJ1ZDNxY1dyL2hwd3Vj?=
 =?utf-8?B?WUJIckJtQVR1THJyUjVGUkpGclRzeW95TFNKR2F0RmNJaVNIM05ZZitYc2E1?=
 =?utf-8?B?eWQ1ejhUZlZMTUhqcVlxSDJBTEQzSThuZGF1eTFIOVg3dThkaE5tVTZPK1pV?=
 =?utf-8?B?OEloR3QxNHQyUkwwNFRTN1NXYzl1MWJLZFFYODdpTTNYY3hDV3UxNW1XZFUw?=
 =?utf-8?B?cFJoc3FJQlo2VE56aE83bHlHdllJbWZoUzlxbjk1SGtoV21pL1JsWWEreFRh?=
 =?utf-8?B?LzBUSlI3SW5lOHRwT2NDcitod1QrQWxuK0RQQXhUUGI2aThseDE1dWhIS3NM?=
 =?utf-8?Q?cDXM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 11:10:17.8325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a28739f6-0f1b-4ecc-d38a-08de46cad976
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8988



On 29/12/2025 12:08, Orzel, Michal wrote:
> 
> 
> On 23/12/2025 18:01, Oleksii Kurochko wrote:
>> When CONFIG_NEW_VGIC=y and CONFIG_ARM_64=y, the size of struct vcpu
>> exceeds one page, which requires allocating two pages and led to the
>> introduction of MAX_PAGES_PER_VCPU.
Also, I think it would be better to drop MAX_PAGES_PER_VCPU in this patch.

~Michal

>>
>> To remove the need for MAX_PAGES_PER_VCPU in a follow-up patch, the vgic
>> member of NEW_VGIC's struct vgic_vcpu member private_irq is changed to a
> s/vgic_vcpu/vgic_cpu/
> s/private_irq/private_irqs/
> 
>> pointer to struct vgic_irq.
>> As a result, the size of struct vcpu for Arm64 is reduced to 2176 bytes,
>> compared to 3840 bytes (without these changes and with CONFIG_ARM_64=y)
>> and 4736 bytes (without these changes and with both CONFIG_ARM_64=y and
>> CONFIG_NEW_VGIC=y).
> You only touch new vGIC, so there should be no size reduction without it but the
> paragraph reads as if the change affected both old and new vGIC. Also I would
> mention that probably you provided the numbers based on a defconfig target.
> 
>>
>> Since the private_irqs member is now a pointer, vcpu_vgic_init() and
>> vcpu_vgic_free() are updated to allocate and free private_irqs instance.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Other than that:
> Acked-by: Michal Orzel <michal.orzel@amd.com>
> 
> ~Michal
> 
> 


