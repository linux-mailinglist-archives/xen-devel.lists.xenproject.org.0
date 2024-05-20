Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0DB8C978F
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 02:42:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725756.1130094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8r5Z-0005Zo-BC; Mon, 20 May 2024 00:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725756.1130094; Mon, 20 May 2024 00:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8r5Z-0005XC-81; Mon, 20 May 2024 00:41:17 +0000
Received: by outflank-mailman (input) for mailman id 725756;
 Mon, 20 May 2024 00:41:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s8r5Y-0005X6-LR
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 00:41:16 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a64c5bb1-1641-11ef-b4bb-af5377834399;
 Mon, 20 May 2024 02:41:09 +0200 (CEST)
Received: from BLAPR03CA0150.namprd03.prod.outlook.com (2603:10b6:208:32e::35)
 by PH7PR12MB5760.namprd12.prod.outlook.com (2603:10b6:510:1d3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Mon, 20 May
 2024 00:41:05 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:32e:cafe::b8) by BLAPR03CA0150.outlook.office365.com
 (2603:10b6:208:32e::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.30 via Frontend
 Transport; Mon, 20 May 2024 00:41:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 00:41:05 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 19:41:04 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 19 May 2024 19:41:03 -0500
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
X-Inumbo-ID: a64c5bb1-1641-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FaUveT7HkVTse8/kaqjtfWkHT+lBWd/2s25tDq6BzdezW3yzl77z8vErKbhuY74kyUZH33uqRIkqzgG7uip1vS4+5eEmuv9ukkwzBVCVpW6a5i1FC4c2Xo9x2XgaNnMTcO3vs/RCUSKHksFMq6RaqUn4iQ49VTA7tOGjV1OPDCNHyqATUhu5UZO2DPw39ToCS7auTQ1uwVCaG+NiDHeGO9VsDj3Z1Vvh/36P8O8u3GwUU70a4T5VDgdwRkR8uA+U87+piPJIjHjJpzJMnNbD5u1uGnpo3vbusK/9MDDr4E6/FzXLWkQEZykKz1fSnEKXvdJmF9Ylh02yEFUEMkhk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xpNV1czfTjyWsHWrjwN22EkhMlaADqWr442PdeSCqQ=;
 b=lswjHEhTJmt3UIjA8GoRcPiNahi+FXodpInEYxfNLW6KTJ5x0AQBv4MltnBXeXNluYyOPzLEDIzvxAe+Rb1NT7zDFmn8jP2xywW3yJU3lYDzIhJ/4LVp1kiI69zaT59xLwh6bMroPn3oo5j9Xp2ZwMoKuu634FUZ5xYHavlXDxkL15EcJDBrFvChijZjKMlYWvkdIH6D5djGfHzC+wzAbSoYgzWbBaBbaSGsu3K1cYKMLMhCDm2FFTDMwuoqVde8wOOBJNCNiov1EqOhC8BrxUUZ+28FpC9nrW90+8Ie1BsD6cjlr+4nCVHQ8n3Vqd54w1iYi0D6GQjufqCxoLCQLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2xpNV1czfTjyWsHWrjwN22EkhMlaADqWr442PdeSCqQ=;
 b=bdDJv1stzbVxrxzdFF+htaooBCtsDJrDDvIHoloWvXChJTRDK5XAwDJVS9TgU0HfAu7qdDh+VYiBYoJS/ngdkcPDAactoMhVyk06lYWxJNO/z+rLNSMaPFu9YryNdhCFAlp1tBo4PGcqr/DU9o+XX9EC7xJhlG04bU2cb8gxhtg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <d208a4d6-8d3c-4bee-a77c-a3f4758ac9ae@amd.com>
Date: Mon, 20 May 2024 08:41:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm, doc: Add a DT property to specify IOMMU
 for Dom0less domUs
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-4-xin.wang2@amd.com>
 <01825e63-3cf1-4539-85e4-d87fecbcfcf4@xen.org>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <01825e63-3cf1-4539-85e4-d87fecbcfcf4@xen.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|PH7PR12MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: 111171a0-ebd4-4a90-c39c-08dc78658847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eERzanArM1BQdFIxeGRyYzNIZjNrR1RFOGthbmxkSks3K01maUVlZkhrL3gy?=
 =?utf-8?B?ZER3L25PWG1zREZ3c0x5K1lMNjFLeXdHSUErTUw3dDZDd09UNzNZekdFcUor?=
 =?utf-8?B?ZG8wRlNMRVhrdFF3bkhrWWpnakhoS1hrUElYemZQVFlsenNSRHI1MkJGbnhV?=
 =?utf-8?B?ZDZZUm9Hd1VBL0oxdW1YQ3d4SWQ1Q2grSG9iQUJ2TU1LdXA5VDVIU2orNnB1?=
 =?utf-8?B?dGkyT1ArNU1WbzFReGdPUndSZXlIRktHMVdId24rWUM3MUtMVlU4cHBGRmFV?=
 =?utf-8?B?RXphZ1VlTS8wUnplMlQ2UE9LVk0wTkZSU3RSWlY0Z2d1aFpYZDRqdWxhUjVG?=
 =?utf-8?B?RlFsL3RvelhKemU2TFNaNFpaTk1BbEtJTnNqOFQ5WFFWTWhjNnFXZGN3dVpt?=
 =?utf-8?B?WVNzWjB2YXp4UmwzVXhwM1dneUlDZ3F2TlNyR3FtbVpUay84b1RYZjBybXc4?=
 =?utf-8?B?WjdnSjZST0RMU2YzT0pPR0NWM21oK2RPTi91T3N5aUM2bDRNYURvMm5GWGVt?=
 =?utf-8?B?WTVkLzI3cTBYKythaWUxakMwM2FkTjRjT3lOKzV1L0tmcTJJUnhrUUkxZTlp?=
 =?utf-8?B?WEFtNkNlejBhWC8zT2xQSmxvaE5lZzlSZ3hmeXBSUVc5NksxTWtYMmp0STIx?=
 =?utf-8?B?L0lOSXdrZVAraTZyd0diazdLVVFMcHpHV2RWS2llOG9KTTF4M2V3VGlCcTg4?=
 =?utf-8?B?VHZoOWtvbk1EblRWcGlJejhPTDZFSEJnU1dPRy9UdXJwV0dTNEQ2Rjh5UElj?=
 =?utf-8?B?NTlCN3JKenh0UjliRnF5Q05QalYyTThMUTVnck5sSk1mdVZpQkRoOWJ6WUg1?=
 =?utf-8?B?WWZyMzFKSTNTekozVDAyM0lQS2VUSENUTEV3VE1HVkM3aW43ZWJzSmNpRTg2?=
 =?utf-8?B?OXFZUFNuaVBKTHhicTFuUnU1OVdFUzFMcC9YZ1l4elZmc1pEeUp4NGZ1c2VC?=
 =?utf-8?B?bklwVG5KMFJmSU0yeWp6cEtjSDFjTnkzblVaYkhzZ3NwM3hFY1g5cVNYZFI0?=
 =?utf-8?B?djBQRGtyUGowbUk5bllLV09kZWhPUnhZd3dxZ1FnMzZmYTBQRWQreHIzVlZS?=
 =?utf-8?B?UWRvOHd1cCttR0VoQzRQbXd6VmpJTVRPWUxLSHNuRm1RN2NLbEFTMVNtYmIv?=
 =?utf-8?B?TnFVZUQ4RVJIdDlOaXhZZzZSK0QrdUhNRjY3aDNjMXMzd2NkbFAraDJRR2tC?=
 =?utf-8?B?UGUrM1c0YjFLLzBRQ0kzTTZZM05UdHFPSTlxSytla3ZLZEtOYTZVazBWYTJs?=
 =?utf-8?B?eHlHb0hhaytISVdwYkpxT2xyQklQOUF2L2hNZk0xRHRFYlVUT2JCVEhReVIz?=
 =?utf-8?B?TDBkL0tPemk3amJHa2x6aEQzSnlPUllpbTNuMlY5N3ZCUHJuMGtZTlBRSHMv?=
 =?utf-8?B?RnUxT0hLSHJJdlRXVk50T2xXeHpTY1AvZFRFc3NCWnhzVkwxZDNQYVVMYW9j?=
 =?utf-8?B?bDVuVkE1OTgrQjFGV2lLSUhHY0hDMjBjeWN0Qm1QeXluRnVxWXZDYjZ0QktD?=
 =?utf-8?B?TFpMZTAraFJHeU5oeU5Ndy9DalN6aUNzcXRWL21NMysvV2RzMUxGQWQ2WUoz?=
 =?utf-8?B?ZWQwVVZpSHRCM2s1ajJKS0poSEtXVTBIRVhvODEvUFd3eTZQaUVja0F6cFc3?=
 =?utf-8?B?RWpZZDFkczlaNWFOT1ZpYndMTlM3TlZ0cDdLNyttdVlqRlBPcGF1N0E5ZERO?=
 =?utf-8?B?RWpZa0tiYVFsbW00REVJNndGa1c3d2NJZTN2cXp4T1d5NVpwTElOVnRwTER4?=
 =?utf-8?B?QllmU2pwKy9ENGdqcHc3ckJVNmFwZENMV0hFMG1HcmFLTHF2bjBHaDhOTU5l?=
 =?utf-8?B?RmVhd1EwMmRSNTdkdkxXU0svZ0lpQ2hVaU5pb29FYnJQVkg4MSt1ZlptMnRx?=
 =?utf-8?Q?kSgxpGFOQAiKX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 00:41:05.2733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 111171a0-ebd4-4a90-c39c-08dc78658847
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5760

Hi Julien,

Thanks for spending time on the review!

On 5/19/2024 6:17 PM, Julien Grall wrote:
> Hi Henry,
>
> On 16/05/2024 11:03, Henry Wang wrote:
>> diff --git a/docs/misc/arm/device-tree/booting.txt 
>> b/docs/misc/arm/device-tree/booting.txt
>> index bbd955e9c2..61f9082553 100644
>> --- a/docs/misc/arm/device-tree/booting.txt
>> +++ b/docs/misc/arm/device-tree/booting.txt
>> @@ -260,6 +260,19 @@ with the following properties:
>>       value specified by Xen command line parameter 
>> gnttab_max_maptrack_frames
>>       (or its default value if unspecified, i.e. 1024) is used.
>>   +- passthrough
>> +
>> +    A string property specifying whether IOMMU mappings are enabled 
>> for the
>> +    domain and hence whether it will be enabled for passthrough 
>> hardware.
>> +    Possible property values are:
>> +
>> +    - "enabled"
>> +    IOMMU mappings are enabled for the domain.
>> +
>> +    - "disabled"
>> +    IOMMU mappings are disabled for the domain and so hardware may 
>> not be
>> +    passed through. This option is the default if this property is 
>> missing.
>
> Looking at the code below, it seems like the default will depend on 
> whether the partial device-tree is present. Did I misunderstand?

I am not sure if I understand the "partial device tree" in above comment 
correctly. The "passthrough" property is supposed to be placed in the 
dom0less domU domain node exactly the same way as the other dom0less 
domU properties (such as "direct-map" etc.). This way we can control the 
XEN_DOMCTL_CDF_iommu is set or not for each dom0less domU separately.

>> +
>>   Under the "xen,domain" compatible node, one or more sub-nodes are 
>> present
>>   for the DomU kernel and ramdisk.
>>   diff --git a/xen/arch/arm/dom0less-build.c 
>> b/xen/arch/arm/dom0less-build.c
>> index 74f053c242..1396a102e1 100644
>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -848,6 +848,7 @@ static int __init construct_domU(struct domain *d,
>>   void __init create_domUs(void)
>>   {
>>       struct dt_device_node *node;
>> +    const char *dom0less_iommu;
>>       const struct dt_device_node *cpupool_node,
>>                                   *chosen = 
>> dt_find_node_by_path("/chosen");
>>   @@ -895,8 +896,10 @@ void __init create_domUs(void)
>>               panic("Missing property 'cpus' for domain %s\n",
>>                     dt_node_name(node));
>>   -        if ( dt_find_compatible_node(node, NULL, 
>> "multiboot,device-tree") &&
>> -             iommu_enabled )
>> +        if ( iommu_enabled &&
>> +             ((!dt_property_read_string(node, "passthrough", 
>> &dom0less_iommu) &&
>> +               !strcmp(dom0less_iommu, "enabled")) ||
>> +              dt_find_compatible_node(node, NULL, 
>> "multiboot,device-tree")) )
>
> This condition is getting a little bit harder to read. Can we cache 
> the "passthrough" flag separately?

Yes sure. Will do this in v3.

> Also, shouldn't we throw a panic if passthrough = "enabled" but the 
> IOMMU is enabled?

I take the above "enabled" should be "disabled"? Actually we already 
have several checks to do that: Firstly, the above if condition checks 
the "iommu_enabled", so if IOMMU is disabled, the XEN_DOMCTL_CDF_iommu 
is never set. Also, in later on domain config sanitising process, i.e. 
domain_create() -> sanitise_domain_config(), there is also a check and 
panic to check if XEN_DOMCTL_CDF_iommu is somehow set but IOMMU is 
disabled. So I think these are sufficient for us. Did I understand your 
comment correctly?

Kind regards,
Henry

>>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>             if ( !dt_property_read_u32(node, "nr_spis", 
>> &d_cfg.arch.nr_spis) )
>
> Cheers,
>


