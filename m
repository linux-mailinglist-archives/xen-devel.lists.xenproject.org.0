Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4D28C97AD
	for <lists+xen-devel@lfdr.de>; Mon, 20 May 2024 03:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725783.1130114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8rzM-0003P4-GO; Mon, 20 May 2024 01:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725783.1130114; Mon, 20 May 2024 01:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8rzM-0003N2-Cp; Mon, 20 May 2024 01:38:56 +0000
Received: by outflank-mailman (input) for mailman id 725783;
 Mon, 20 May 2024 01:38:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jwTB=MX=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s8rzK-0003Mw-Oc
 for xen-devel@lists.xenproject.org; Mon, 20 May 2024 01:38:54 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2409::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b624c2fd-1649-11ef-909f-e314d9c70b13;
 Mon, 20 May 2024 03:38:53 +0200 (CEST)
Received: from SN7PR04CA0198.namprd04.prod.outlook.com (2603:10b6:806:126::23)
 by MW6PR12MB8735.namprd12.prod.outlook.com (2603:10b6:303:245::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Mon, 20 May
 2024 01:38:48 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:126:cafe::ff) by SN7PR04CA0198.outlook.office365.com
 (2603:10b6:806:126::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35 via Frontend
 Transport; Mon, 20 May 2024 01:38:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Mon, 20 May 2024 01:38:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 20:38:46 -0500
Received: from [172.31.124.47] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Sun, 19 May 2024 20:38:45 -0500
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
X-Inumbo-ID: b624c2fd-1649-11ef-909f-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xq3jdPSv91GKzyaci/FZlBKluSxitY4CZBjdcxUGBqErVLFhCRoL4SD5y9axFNtLLST4cJZaxoEDgHikA7OTNF14DRzxmnvyXpb8hX21qxWR2iIows7LNDfzZMNsZ9ARPYPjBTKW9h/OyjXaLpqx2+drk3fBLPPmPGfBVTVSIMAJ7Jbw3ywgMx/U3ISlsSm9wAGa8Zf9aYF8RZBSh9YET6JxaoAUDew1ELF5HlzYsFYdQ4m+J7lza/xnRdtPjtTOymIg4tCQsZlWQz8EitOflBZKCGduMYGHJQuX32QlWNKThf7jRpFgOqhxMk//DP+w+5PtkW8fRGW8w+8crsI+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E0YAPpV586Sp1/JSE7Lx2DUZD0CE4GcSsEhWCW/Pcxk=;
 b=JwRyhw3F+m48C3nvvnJVIHL9Wxt0y+4KD3GEbqmQ5N3eP7zPPaKbyy8LQ6nDC/Q0QCyR/8KDDn7nBTaL6XWUzm8nOxelBYAd/xNNOa/eaIHmSXU7cp6BLNOrnbeHFjCgLIqzZiFxZuLiycy7vGwLtySOOQEhF9b94b9DeWIuOEngkhsm1PPU1KWKZpXGWsKN6/ylNqxN+UCyzSNm/I6y2+xnT8GFpLndrojDAi6tNH6vwuSBcUucF2qWGQfpJHpQIRyG/STvWV0r7bPfwqST8v6Nf0jOai9UYfSA1Naby+X9m4Sje7B499HVCU5RSeD6gRawmlv85P3HAxh8GJOicQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0YAPpV586Sp1/JSE7Lx2DUZD0CE4GcSsEhWCW/Pcxk=;
 b=v4NHffNZAwEjHY+pn7Aqrw/5zOusMuaZquxK9YRohbEFPOWuTkuLsKKJVK1Jb0jdJ95c6/WIsbThuqfRtPEeUMMBHpxvVdB6M/fX3Q5Aegp569KKPGYQIXqVtGberlV2m+QffTv/w4kQoOCVxtLksmwgtaSI6bef7rsM0YTqtIk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <72303595-0b15-414b-8249-0d8021312356@amd.com>
Date: Mon, 20 May 2024 09:38:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm, doc: Add a DT property to specify IOMMU
 for Dom0less domUs
To: <xen-devel@lists.xenproject.org>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-4-xin.wang2@amd.com>
 <01825e63-3cf1-4539-85e4-d87fecbcfcf4@xen.org>
 <d208a4d6-8d3c-4bee-a77c-a3f4758ac9ae@amd.com>
Content-Language: en-US
From: Henry Wang <xin.wang2@amd.com>
In-Reply-To: <d208a4d6-8d3c-4bee-a77c-a3f4758ac9ae@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|MW6PR12MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b6a3f06-c8d5-4143-b41a-08dc786d97f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cWU1NDZSRlF5Y25CR0FNbnpIYmZVd1pZUjFQUENWYmVVNTVHY2ptMFN2TFps?=
 =?utf-8?B?TFRYOWRsZlUwTUVjRnJtRHVkMDRPY0Jxa2NpVGtvVzZ4UzZGSmNsakZqNHdj?=
 =?utf-8?B?dkI1d2xnMzI0b1ZZUVQxdkh2a1gyKzNHZTlFV1FwVUZvNEVPeGloV3dSU1ZX?=
 =?utf-8?B?Y2tzMzI3RVR6QWFaOHhoUGJPUlZxaTR5bTJ1NTN0cGNmb1N1YXZkbkV5NnNl?=
 =?utf-8?B?SDlBYjlucmFiUGowcXpsamVjR3EvOWxzNDE4UXYyTXFESXFMTmNqbDcveHcx?=
 =?utf-8?B?dkE1V3FlcWNueFB3SGlXM3A2S2VJQiszOXdKK2htQXl3TitlN081enJKSDcv?=
 =?utf-8?B?M0w4aDBTNi9CcWU5dHY3RkVuWk12QmRDWU1EUk9HQTArQ0I4QXdzdWdaUXEr?=
 =?utf-8?B?NkhxcHpwanhaTi80SThucVp5WDJiREE5RGlyWVlkMkZoVE9xNFRFMExnWGZp?=
 =?utf-8?B?RFppd2FlQnQ3QksxdFpLSlZoeHVTK0hRbllxTHJHNjNWeEhFc28rWGRWdkpN?=
 =?utf-8?B?b2c5a1RkSjhYUlhSbm5hOERZdzl6blZFR1RFTXdhS0JLbHIvNVRnY01yR1ph?=
 =?utf-8?B?ZjAyT3NEMExQSkNBRWp6c0Z5UHdsYXVveTRvZzIzdE5KamFoNEFrMldtV3hv?=
 =?utf-8?B?eVVZcWV3WGYrOUVpVWhMaExmai9ycFRWRjNTeUpsRzdsTGpXWXNqUWo3WlhJ?=
 =?utf-8?B?dzBQU3lMVHNjUXA0dEdMaStLcDdSSVc3WjgrbjZjdW1HTUl6K29vY2lha1c1?=
 =?utf-8?B?dkxCM2tURVl6SmtFRFFzYmpET0VTamU2R1pvUUtSdGZwbjdDNHVBWWxuZm1R?=
 =?utf-8?B?R1FZNlhoUjMxZ2xOckkraGQxLzRVMW9yMUVZREdiL0Z2QzcxT0lZWmJlcjZn?=
 =?utf-8?B?NHo4MC9oQmVmbWF0QXNFV0dEdnRFYUJMOGdtOXpNdG1PRzFoaHU3cHdLWlJz?=
 =?utf-8?B?M25WeEJmMTJWQ1BNaEZGM29qdTgyK09yQjVZT1BzbVNJWEEzNHZ6Q25rNDFV?=
 =?utf-8?B?K0NZM3c5bDJPT3BzMFJ6TDNncExtMHVSdHJYdUtESXlZTUV4MnV4dTNxSGlB?=
 =?utf-8?B?cW5KWnRTNGlmV0xud2lUY1d4M2U3R1hUaGFUOEFFZTIvdkZGSzU1ZlJIdHV4?=
 =?utf-8?B?elplZmtiYXBybTlCVzNjM1dvV3FBc0JFSDNpT1c5N1Z4d3BIbVFOakdhZUdJ?=
 =?utf-8?B?NG9pRVNaYnUxUVN4SVQ5a29kQlhzT0lxM0ZMaDQweVZ1Tyt6cU1LNmwvck90?=
 =?utf-8?B?VWdMWnpUTFBhQlBHWG9CenVPMHVUMkN3SEtPS1Z5cllCTEpTaC9pd2J4bE1u?=
 =?utf-8?B?OXNxME5yN2FHako0SDkrbDJaZWpxSGlKcFMxbGxrNWFNVFBrdDdpVE0wZSt4?=
 =?utf-8?B?c0ZFK1M5QW8zUy9LenJvempMRmp3UzY0N0d2NytZN0w3UkRRcFB3WVJIMW9U?=
 =?utf-8?B?NDBNRk5QeXJzSHVGNWJjY1dXY2JLS0h1TC9sUWprbWVWTFZIS3pzQUlYK3ha?=
 =?utf-8?B?cHZpdXJrVndqWDVlSjVURUFpc0NMRVN6NE9raThjcmxmQ3kzQXFMWHhJcWtK?=
 =?utf-8?B?M0xaVDNyT1hBbmFIL21tcjkvd2N3UHp4Zmw0YVMzQWZ6RWl1aXNPalhZd3gr?=
 =?utf-8?B?NFhJTUZUcUpxcHdUdnZRcEF2RFpLOGt1SkVDMXh4L2dtNFNJNGtvcnpCY2VH?=
 =?utf-8?B?cXZRNWlyZmZ0Vi8wUXpUWVAxWXV5TmphbTRwWWNMalVTNUR5YkRGeFB2c1RP?=
 =?utf-8?B?NkxyaUh3TER5ZmhYaUtneWtvT3VmK08zMDRtSXdWWlU1OGVwYVA1WklOZUN6?=
 =?utf-8?B?UmI1WGtXYkpXS0lFK0V4ZkQ0M2YyUDRlNS96Y2dNZVFDZ2QrVUQ3akdTaEJl?=
 =?utf-8?Q?GkJE4XgBYiB6S?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2024 01:38:47.5504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b6a3f06-c8d5-4143-b41a-08dc786d97f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8735

Hi Julien,

On 5/20/2024 8:41 AM, Henry Wang wrote:
> Hi Julien,
>
> Thanks for spending time on the review!
>
> On 5/19/2024 6:17 PM, Julien Grall wrote:
>> Hi Henry,
>>
>> On 16/05/2024 11:03, Henry Wang wrote:
>>> diff --git a/docs/misc/arm/device-tree/booting.txt 
>>> b/docs/misc/arm/device-tree/booting.txt
>>> index bbd955e9c2..61f9082553 100644
>>> --- a/docs/misc/arm/device-tree/booting.txt
>>> +++ b/docs/misc/arm/device-tree/booting.txt
>>> @@ -260,6 +260,19 @@ with the following properties:
>>>       value specified by Xen command line parameter 
>>> gnttab_max_maptrack_frames
>>>       (or its default value if unspecified, i.e. 1024) is used.
>>>   +- passthrough
>>> +
>>> +    A string property specifying whether IOMMU mappings are enabled 
>>> for the
>>> +    domain and hence whether it will be enabled for passthrough 
>>> hardware.
>>> +    Possible property values are:
>>> +
>>> +    - "enabled"
>>> +    IOMMU mappings are enabled for the domain.
>>> +
>>> +    - "disabled"
>>> +    IOMMU mappings are disabled for the domain and so hardware may 
>>> not be
>>> +    passed through. This option is the default if this property is 
>>> missing.
>>
>> Looking at the code below, it seems like the default will depend on 
>> whether the partial device-tree is present. Did I misunderstand?
>
> I am not sure if I understand the "partial device tree" in above 
> comment correctly. The "passthrough" property is supposed to be placed 
> in the dom0less domU domain node exactly the same way as the other 
> dom0less domU properties (such as "direct-map" etc.). This way we can 
> control the XEN_DOMCTL_CDF_iommu is set or not for each dom0less domU 
> separately.

Oh I think I get your points, you meant the XEN_DOMCTL_CDF_iommu will 
still be set if the passthrough dt property is "disabled", but user 
provides a partial device tree. Yes you are correct. I will update the 
doc to explain a bit more details as below. Thanks for pointing it out.

  - "enabled"
     IOMMU mappings are enabled for the domain. Note that this option is the
     default if the user provides the device partial passthrough device tree
     for the domain.

  - "disabled"
     IOMMU mappings are disabled for the domain and so hardware may not be
     passed through. This option is the default if this property is missing
     and the user does not provide the device partial device tree for 
the domain.

Kind regards,
Henry

