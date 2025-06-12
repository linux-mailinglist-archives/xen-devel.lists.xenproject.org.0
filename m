Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EB1AD7590
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 17:18:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013232.1391739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjhC-0001zu-VR; Thu, 12 Jun 2025 15:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013232.1391739; Thu, 12 Jun 2025 15:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPjhC-0001xW-Ro; Thu, 12 Jun 2025 15:18:26 +0000
Received: by outflank-mailman (input) for mailman id 1013232;
 Thu, 12 Jun 2025 15:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FA4y=Y3=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPjhB-0001xQ-JT
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 15:18:25 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ab9b42d-47a0-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 17:18:24 +0200 (CEST)
Received: from MW4PR03CA0093.namprd03.prod.outlook.com (2603:10b6:303:b7::8)
 by MW6PR12MB8959.namprd12.prod.outlook.com (2603:10b6:303:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 15:18:20 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:303:b7:cafe::45) by MW4PR03CA0093.outlook.office365.com
 (2603:10b6:303:b7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Thu,
 12 Jun 2025 15:18:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Thu, 12 Jun 2025 15:18:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Jun
 2025 10:18:09 -0500
Received: from [172.26.5.4] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 12 Jun 2025 10:18:08 -0500
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
X-Inumbo-ID: 7ab9b42d-47a0-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nx2yWgqeEZX7HyFQbtvxhcNDeqfhPyVPu56EQGkSBr50zxW6/0cyaoz64TD4ENA0MrVFu6CllLaiVymkNr+I87dB61D17CoaOtTGYMkcHctczA03t4WtUCj5I843flvTVg+0sT0MHFkonqYQaKsg5n+DuVJ0QzXfUEf/w+gQPwVBX3TsccEKuaJK6xDyxEeAPuTfqc797pNaZ62ei0bIQIT4K+6fxVVzxAEFXgk1vhxUmpt2EpaxbrKOIieEdP4BHp8YD9dAHG4RdzLoa2DaQw2Hx6VCEhuOCDAt3oXSga6ppYnSpV+NH7Tmq0dz4BcKSVn5GBCTjwlxkeRm913uVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PpmyO498KurqBMzpZ40/Dzk/cJ1/+tNzBSoGHX+GDcg=;
 b=y09Z1/v5PXySqBQcjL/48kpKW6Za4d5M1eaK/gUxnoCcNd4noHVhLGz37cNHQiQZJkGF6zkUCUZWKCKEF6z4fSBU6Z0LgXppIeX2Uh7J+nNQnADdBVGaPUoy9bugRG1ZMWoRw8zWeQcFLP2H/WQO1XBfxGctveusIJG1PBJ9RJrY3yUQpCDiZyhI/HtGTa02fX95E4m1Ib+zCi8OheU/v5Z4tNbGbPNPS9wPowhixS0WGucpFdHzTeZw637T4OmwIaLe3DaaFze25/NfeCD56cHuHeiFkwvEUBaQcWcNPIc/JImd44azd2S2u0mDxjCpRn6gc0ZwUUNnHNKvW4heAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PpmyO498KurqBMzpZ40/Dzk/cJ1/+tNzBSoGHX+GDcg=;
 b=BUYI5j3ksetgdBqYPscBk3clNp5YZblq7FIChuR34L9EzVSlSIPLxpTnLzJjr2ovfC1nVN8BCtsecjuLsJ4SOQ2sWVRfNKw8RYrJSUTiVlIVYttN0AaMH3t9s9luA19X8zeEX88VuNvdgpek06/jD/UKss6a9E4HnU9ILKF4oJ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <2150be73-e23a-4caa-91a7-8f7c139e4e87@amd.com>
Date: Thu, 12 Jun 2025 11:18:07 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option
To: Jan Beulich <jbeulich@suse.com>
CC: Rahul Singh <rahul.singh@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, <xen-devel@lists.xenproject.org>
References: <20250610174635.203439-1-stewart.hildebrand@amd.com>
 <6ac8ffbc-5bd3-4bea-9ade-f31710747291@suse.com>
 <3a203b96-94e3-47c3-92b6-b68141ea3794@amd.com>
 <fb7ce573-f827-49d8-9cb4-31439db46564@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <fb7ce573-f827-49d8-9cb4-31439db46564@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|MW6PR12MB8959:EE_
X-MS-Office365-Filtering-Correlation-Id: af897f24-6c34-4a33-5b85-08dda9c45d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGFZMlZkV3FTcC9vUi9saU9xWVRsWVZCeUZvdmJvaHhWbFQ4bnptSFJDNkhP?=
 =?utf-8?B?dHcybENmSUZjaFdSMmI4Nit3Tnp5bjE5VFBQbzhuQWsxMjMyWlNtYTVJTWp1?=
 =?utf-8?B?SG84eTRGd1QxblcycVJab2toZ2NuUm9BTjVXY2xhZ0VnbzZmbzVhN3JBKzdP?=
 =?utf-8?B?SFJ4V1lBSkUwV21jalEvY2hBSEI4OElqY0FLdDcxRHljTE43T2greE1jM29n?=
 =?utf-8?B?WGFDd0NRT3FNdktYcFRFNHErZnJ2aW5wN1k1L2ZaQkhjWlpuVHpqdkpWVUsx?=
 =?utf-8?B?WERNbjBaZ1dPcXg2WVo4bjdiWUZaSWNOVU91cVpqbTI3ZXVjQlpYeW1NN3U0?=
 =?utf-8?B?KzdBZnBHSTJ2d3BTaGV1WWVQanZSbGJmbGFrY2wrOGxic3RYU0J2OTZYODNy?=
 =?utf-8?B?bllrL2NmK29BeDlKeXJTYm9Id3J0YkwyMDR0K0U2ajFGd0pEREFET0RyOGV5?=
 =?utf-8?B?RGQ0MUFhdUJhQnZabldpN1FnVHdCNkp3SXVBUmhKa3ZvY0hjNWV5NGQza0lq?=
 =?utf-8?B?Z3grd2l2NEJKQURMNnlIT0lkd1ptcXU5N3NEQzY0NVVHTmRpNXFwUnVVemJI?=
 =?utf-8?B?N1pqL0FiSy9TRURYL25OdmtXZ09ZbDA0Y2JPVDQyVzZwVDcxVWFWV2k3aG9V?=
 =?utf-8?B?Y09DVDBBZE1SVlBwK1dXWm8ySHgyYVRMYjJjelYwUXorRnB0UGpLM09EOTgy?=
 =?utf-8?B?UEhVb3R3M08yZC9xTzdSSWJqUEFKTk1ScW1hY1Ixems5TXJvSzNKNHN2d3U2?=
 =?utf-8?B?Tml0RlYxd0VyN0tXVXB2VEsxdEErK1RvWmlNMng5cGhGRSs3Tytyd2drbkZI?=
 =?utf-8?B?QnRpV2paLzBzOHpCTWxSdXFMd2U2OFFQeWs0YTd1bVFxd2xMbU1iaDFSL2tz?=
 =?utf-8?B?R1N0R3VrQUp0NE9zVXRSVlpOdnYvN2ZMYWwwRjlsOGwxZEVHSU1lRUhkOHJk?=
 =?utf-8?B?a1NHNkRVNDhacW1kNHovN3p2UjBBUEZIK0tpT3d3UmdPd3pZZ1c1WDhSalhm?=
 =?utf-8?B?Ym5zMFBxN09wTjVaUkNJbVRvbnFHdGtFTTNVVGlvMnJ1Zlg1a2lmbTJORHlW?=
 =?utf-8?B?dENYcEpRdUJ4ZXErTGQ1SFNMWmFGbXhsbWhoUERjZ0RpZkxNUWNRbDZXRmt5?=
 =?utf-8?B?TnRmRjkrVmpLYjdrRUJOUzlzbXNxNmNYejVFY09zTG0xbjcvY1dTQUUzNXlu?=
 =?utf-8?B?cTd4OHZLUi91QkphZWhPTnZDZXlVL1U0MFl3OHl2eHlUZWZXblhKRHc2c1Nx?=
 =?utf-8?B?dEgxWkFXSFREalVyTWNnK1htUEdENXVqZkdNSkthQ1k5U1VudGk0OUY1SEZs?=
 =?utf-8?B?Vlh0ZFhGNkUxNmxEcjExbnlob3VXekV4Ums3RlYvNDFncFppOCtCc3RYemxa?=
 =?utf-8?B?eXZhY2ZORHM0MGIzcENzcWxiVUhpV01qaFJzOXZiWjlscFlqL3ByRDdDVjNN?=
 =?utf-8?B?ODhaWmNTNnl3VVdsdmt4ZlZwRGV4eEFHOU1RZDN6Y1NJSkNtWjNOd3ZZNExi?=
 =?utf-8?B?T0Q0RDdiMnFXVjQvclVjRXdKRXFyTXY3M241UERjT3RUcHllaUhqZWtxRGhX?=
 =?utf-8?B?NDYrSlg4NzZXVTEwdjdyRnNxczRPejRpY0YwbGpFN3FLQjZsL2p3c1QyZnJj?=
 =?utf-8?B?T2ZDcWhoMU4vekcwTlBzbWtSRk9DcVRNOSttRmFFYXpQTldUY3BXYmU1SFdw?=
 =?utf-8?B?bmNRVVRLWDlNQmFuQW5meVJDSnpRTnhlQ0htaDFIL0dNSHdETmJ0bkVMYTVx?=
 =?utf-8?B?RnFabzhKMUgyNitPYkxMNlVLWS92RllVT3U1MVM4MkxWZXliRGVoT2pPN0la?=
 =?utf-8?B?NVBYaXByVmtxaC9IT1dlQ3g0OVpsbCs3NUFreVR3TXFqRkhxWnRjNklmbXUy?=
 =?utf-8?B?cllwOG9DUWtONktOWWF4bVJtaEdnc2lNVzEvQkVlSWJyZlhpRFVRQXdTeFhK?=
 =?utf-8?B?YUF2SkE4Yi9GWi9lT0oxSTZZL1hLcWx3MHZJRm8wR0hPZlZHYTg0YTdvalNX?=
 =?utf-8?B?eWNTWHdqVnpHcWRoQTN1V0NYUllnRFNDRitsWFhpbUtwVHl5TjhDdFNNc0Ux?=
 =?utf-8?Q?+SmTv4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 15:18:19.8132
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af897f24-6c34-4a33-5b85-08dda9c45d3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8959

On 6/12/25 10:58, Jan Beulich wrote:
> On 12.06.2025 15:39, Stewart Hildebrand wrote:
>> On 6/11/25 01:23, Jan Beulich wrote:
>>> On 10.06.2025 19:46, Stewart Hildebrand wrote:
>>>> --- a/xen/arch/arm/Kconfig
>>>> +++ b/xen/arch/arm/Kconfig
>>>> @@ -258,6 +258,16 @@ config PARTIAL_EMULATION
>>>>  
>>>>  source "arch/arm/firmware/Kconfig"
>>>>  
>>>> +config PCI_PASSTHROUGH
>>>> +	bool "PCI passthrough" if EXPERT
>>>> +	depends on ARM_64
>>>> +	select HAS_PCI
>>>> +	select HAS_VPCI
>>>> +	select HAS_VPCI_GUEST_SUPPORT
>>>
>>> What about HAS_PASSTHROUGH? Seeing that being selected by MMU, what about
>>> that connection here?
>>
>> Hm, yes. I'm not sure if depends or select would be better?
>>
>> 	depends on ARM_64 && HAS_PASSTHROUGH
>>
>> or
>>
>> 	select HAS_PASSTHROUGH
> 
> Actually, thinking of it: HAS_* shouldn't be selected based on user choices,
> imo. Perhaps unless the HAS_* is a sub-feature of the dependent (as in e.g.
> "select HAS_VPCI if HVM" as we have it for x86). In which case all the
> select-s here might be wrong to use.

How about something like this:

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3f25da3ca5fd..95a2cd3d006d 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,6 +8,8 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
+	select HAS_VPCI_GUEST_SUPPORT if PCI_PASSTHROUGH
+	select HAS_PASSTHROUGH if PCI_PASSTHROUGH
 
 config ARM
 	def_bool y
@@ -258,6 +260,12 @@ config PARTIAL_EMULATION
 
 source "arch/arm/firmware/Kconfig"
 
+config PCI_PASSTHROUGH
+	bool "PCI passthrough" if EXPERT
+	depends on ARM_64
+	help
+	  This option enables PCI device passthrough
+
 endmenu
 
 menu "ARM errata workaround via the alternative framework"
diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index 20050e9bb8b3..0c376704ddc9 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -13,6 +13,7 @@ source "drivers/pci/Kconfig"
 source "drivers/video/Kconfig"
 
 config HAS_VPCI
+	select HAS_PCI
 	bool
 
 config HAS_VPCI_GUEST_SUPPORT

