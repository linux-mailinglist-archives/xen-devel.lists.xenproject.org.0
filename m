Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F553D25948
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 17:04:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1205484.1519726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPpt-0005SY-HS; Thu, 15 Jan 2026 16:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1205484.1519726; Thu, 15 Jan 2026 16:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgPpt-0005QC-Eh; Thu, 15 Jan 2026 16:04:37 +0000
Received: by outflank-mailman (input) for mailman id 1205484;
 Thu, 15 Jan 2026 16:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lorT=7U=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1vgPpr-0005OL-K8
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 16:04:35 +0000
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170100009.outbound.protection.outlook.com
 [2a01:111:f403:c107::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfe5377e-f22b-11f0-b15e-2bf370ae4941;
 Thu, 15 Jan 2026 17:04:31 +0100 (CET)
Received: from BN9PR03CA0220.namprd03.prod.outlook.com (2603:10b6:408:f8::15)
 by SA1PR12MB9548.namprd12.prod.outlook.com (2603:10b6:806:458::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 16:04:26 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:f8:cafe::c8) by BN9PR03CA0220.outlook.office365.com
 (2603:10b6:408:f8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Thu,
 15 Jan 2026 16:04:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 15 Jan 2026 16:04:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 15 Jan
 2026 10:04:24 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Jan
 2026 10:04:23 -0600
Received: from [172.19.137.210] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 15 Jan 2026 10:04:22 -0600
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
X-Inumbo-ID: dfe5377e-f22b-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIHOGM8ffH2h/+VWKJpC0kKVtbK6PPVUYntm8xZRRzSqNLVHzbIUIYG18TYXIWJecgFVtJA4vrOcFarG6NBxTS2XSnyRVkxjhVLoLNiXmWQP+6mSAetQYMyOhikqDCtShS+2fmPKAXx18ssRAQ4B94ZiRbhXMF9xkf5MpD3OoBosPfalvwQp3XDsNiROeZG+WRwTgnZVcNZMdkBKclP0SVTUQ9cXT+8EFwzcNaTg/B6ObWBJzDwI64hQyFnkObx9e9sK22y70pZfgpfcRShevm5KbhDbgbrRh8rxZ9U/3NBAlDNLkh5IptPw1R6kdqd0JcE4an0XuXkywXUnA1/tQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T46NP2Enpxn6nDBpKzEtQfdn+lkTPsqFLGevnirD5fI=;
 b=EY3vNhIEE8HjxekLSpnjhHOMSeNiuyIIXpQ/l1dRxJjPRF6VK5ZsbYE6rKbWI566D5YuYyaxrkeUIjYN1py3gPhAPbD39l8X8OEd/wnb8bqQf6klIL2ygFfXwLFYg5n1F6BRj2hp6Dbv5xKfMBzTWXAWVVlweLZNWiDeREY1u1InEy0NDTlh1PzhF91hDWdgdOPB9GB3Cx3L1dhHwjScctOJ96xQpxEBbDsE0Brp9KwfC1vS0LdadlIse9wgSx2cTj5TGUBMoWA6rYRpOUZ4/03mn0PaKx4rkDtAidHcRhLQDWvII1CHsECVF/t5bcZ/plws0bEBVAkFrudZECNmBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T46NP2Enpxn6nDBpKzEtQfdn+lkTPsqFLGevnirD5fI=;
 b=jRv1RwT/I/kVTOxWqKWkLFf0lq3V3a+42/2pZbC4E+FsHnB1ebSQFnnsQzPWVyeSMuRzKmUMQqVfnNMhKVp+Lpqb2AD938kZpObJibx1RNK+pK5vAT4dVbp/f+LPx7JvyGNQKqhNM9/o+rVMg8tfhvBQ7bA6XqlD8WCvtldHCNw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <74199039-494c-4120-93f9-bcdbab52818a@amd.com>
Date: Thu, 15 Jan 2026 11:04:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] PCI: determine whether a device has extended config
 space
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <05bc9acd-3054-4c5a-be87-cfd8d7bfa0f8@suse.com>
 <52eb1293-b5d4-4f7a-b53b-285e4dd274a5@suse.com>
 <cf24b83d-517f-4cd8-b7c0-94f60738dc50@amd.com>
 <e573cbe5-858c-4a7e-953b-f371c174125c@suse.com>
 <5d4aec52-03af-4de6-9625-b972ffb5e5b7@suse.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <5d4aec52-03af-4de6-9625-b972ffb5e5b7@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|SA1PR12MB9548:EE_
X-MS-Office365-Filtering-Correlation-Id: 6459bae2-d9ec-4e88-0c03-08de544fc0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tkh6ODlUc0JxV3hyN1QwUEtkYXNFMzg3S3FXczEwUVRER0hUUlRYTG9LSUNs?=
 =?utf-8?B?WGh5MnZCajRtNUtWR090UldIcGgxaHQ4WmFGdktIdFpDaUdOWmZTT2wxczR4?=
 =?utf-8?B?NjBGUkdxUjlNenVESUhRa1hqVE9oaVZlYVJhNTV4NEx0Qi9pWWtwL1hrMXBX?=
 =?utf-8?B?ZVUva3g0MkU1cXZPb2dySzJacmg2dzNreGRLTndrNERSSitjaE1JS3ZVYjVK?=
 =?utf-8?B?TVNiTGFZQi9jazdnZHNibzM0WWt1RGJ1TGl5REZ1N2JweHZYbnp4YjBLdjZW?=
 =?utf-8?B?MTltSkkzcHZhZFUyNDJTSFY0VlFGNEpuOThFb1o1Ukpmb05EMkMzQkRoVVU4?=
 =?utf-8?B?Uy9GRUpRcUVaek1tY1lmbEVrKzVhaExEZnhVRlJJZTRQWEZMYnVmZmNJTksr?=
 =?utf-8?B?TTl3ZkNNdG5lWnVQZUNDYXFMZjRzTlh0RGZQSmc1eU9IdnpaSnNkQVhLMFF1?=
 =?utf-8?B?OW1kNXVIMmlWVHJrUktIdml6NnQ5Y3cwcVJVSk5EZ3U4MlNaNUJ6VTJZYXRS?=
 =?utf-8?B?U3lXMk9yOVZSdG5CeldTNUhHVjJKR1lxQmlwdElGSE9iMGJRMVJIME0rNzdN?=
 =?utf-8?B?aXR2azdSWHJxNWtVd1B1S3Z6NkREUjJqMWZLSnJVTFdIN0VxajNHMHFJMDM5?=
 =?utf-8?B?ZWJhZXhHdncwRHBqWXRlSXNES1RTbzdWSXptME5WdE82U25tRXVSMy9sSFhQ?=
 =?utf-8?B?WTl2c3ZXeWtZQWpPcnExL2NJQVY2VGs0SStUVk5YSGhrRU5teC81Y0lTNVd1?=
 =?utf-8?B?ZkR2dnZUVVZvZjFmL1drZmNqanJpR0s2c2E2L29ERVpzSEpTY0JvSXNORnRD?=
 =?utf-8?B?Z0NLRURtVXFsSU5BN3hwTzMyRW05ZEFhWVJKcGpHcTBoUWtROVBscnJhWFVV?=
 =?utf-8?B?NkJrTXdPckkrN2t6cXplZ0hPVXVLTWhtdHdsS0dNaUFvSS9RQy9TS2paUThL?=
 =?utf-8?B?cG1JWUZUOTQvMDA2Y241NWxxZWpqR0NBV2ZZQVJXMmEwNWhzMGRTWjBLRXdr?=
 =?utf-8?B?ZHJBR0pHS3RRTjNRaUhwV1RqNVRXcmhkcWlhNTZEL1NuNkdDL3ZtY3Q3emQ1?=
 =?utf-8?B?Nmh3ejNJNVV3NVlrN1JiS0VGbjllQkI2NXdMTFBsVEp6NGVlUGRNSkl3MHU5?=
 =?utf-8?B?TUl2R2JlaC9hc0FaY3FFd1RYYWp0WEdDdG1VOXRwVlZZdW1NMVQ4aFQvbGxq?=
 =?utf-8?B?MEdtUkxsUHJaZWkxNXgyYXJmY1lqRGpRQm15Q0M4TFVHT01vOFU5aW9kNkFL?=
 =?utf-8?B?NFRpSjNVS3dpYnIrN3Z4WERnSnQ3eWVUSDhQc2Z2VDRwVTJHRy9yc3FPNDFF?=
 =?utf-8?B?bTlIaFh0djhHU2kwZ0JNMHFWTmdWM1YzY1k4dVBnVThpeWlKbzFsUklpZ3RK?=
 =?utf-8?B?dVVKTDZJSWFMMks5QWhNSlVLdEc1OTVlU1l5M1hNWmZvVzM5SXJ5QzJ2Yi9Q?=
 =?utf-8?B?VFNFZ2pkNnlWY3k0dWZqUlhFZHBsV0JrMEg3NHhoNzZBWDdyTkJkN2loQ0ZI?=
 =?utf-8?B?ZFRzRGdEY3g5TzZuQ0lrNEdSNlFIVHBlalZpWWxBNDI1MnE5UHVLVzBTUjYx?=
 =?utf-8?B?T2Y1Szh2M0lQaGliOWJRVTB3RFpXdEpuN3I1OVZFMWF1L2VIQ2g3azFKTmxB?=
 =?utf-8?B?RXMwak1XelFoRnROZlV0UHZQMjN0c1hFUG1ST3E3Qmd2TGxzU3RzMldvK2k0?=
 =?utf-8?B?SEEyVXVIeEpwcDJkR2p5cUl4N1AyaEJmbmFucGpSY0trckl1ZlI2NEZ1aDlp?=
 =?utf-8?B?RGtkNU9HdXYzcXRSdUUxNzFpUzM2S0JncWhyaHpGcHlXMFZjZlN3eHVweDJx?=
 =?utf-8?B?Ty9ua3l0RDFSREtCeDVGQStMR1JxYmx3S0NvNTdkZUx5RHdHUzJVUTlhanR2?=
 =?utf-8?B?NHFhL1pac2dxVmg3Z0xuWFlwVElqT2lLNWx5emxrbk5Qd2NyT2dZYnRXeFV6?=
 =?utf-8?B?MFZJOEVvRE9EZDQ5MGFwSU5FRUtkMmlaaVBOVTBMZExJem9hbU9VYUwycGJC?=
 =?utf-8?B?QW1wcDBVRTJ6R0cyNFI2SERsS3h5aEdwSkhmcEhNeWROMnBQMURJTVpmMDQr?=
 =?utf-8?B?Y0RkT2FuVkVSLzBmQ3ZYTmJlb2Nra3pTY2wvQjFiMGl0cVVpVnJwaWpLZmM3?=
 =?utf-8?B?VnFBSElMVW9oR2ZRY2tKaFFvZ0l5dEhKTjNoWWlBTndZVGpiVVk0MWhlV0lW?=
 =?utf-8?B?WDhsRDFmTVE3TGdzbWs1bTNWSFdLeUo3YVd0b0FuN3hob2pwK01hS0Y4QWFW?=
 =?utf-8?B?MkF0ZEFJZWp1SHRnL0x6K2MrZ0R3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:04:24.8794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6459bae2-d9ec-4e88-0c03-08de544fc0ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9548

On 1/15/26 05:43, Jan Beulich wrote:
> On 13.01.2026 11:46, Jan Beulich wrote:
>> On 12.01.2026 22:07, Stewart Hildebrand wrote:
>>> On 1/6/26 08:47, Jan Beulich wrote:
>>>> @@ -420,6 +467,19 @@ static struct pci_dev *alloc_pdev(struct
>>>>              break;
>>>>      }
>>>>  
>>>> +    if ( pdev->ext_cfg &&
>>>> +         /*
>>>> +          * Regular PCI devices have 256 bytes, but PCI-X 2 and PCI Express
>>>> +          * devices have 4096 bytes.  Even if the device is capable, that
>>>> +          * doesn't mean we can access it.  Maybe we don't have a way to
>>>> +          * generate extended config space accesses, or the device is behind a
>>>> +          * reverse Express bridge.  So we try reading the dword at
>>>> +          * PCI_CFG_SPACE_SIZE which must either be 0 or a valid extended
>>>> +          * capability header.
>>>> +          */
>>>> +         pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) == 0xffffffffU )
>>>> +        pdev->ext_cfg = false;
>>>
>>> I'm using a machine where
>>> xen/arch/x86/x86_64/mmconfig-shared.c:is_mmconf_reserved() will initially return
>>> false during Xen boot:
>>>
>>> (XEN) PCI: MCFG configuration 0: base f0000000 segment 0000 buses 00 - 3f
>>> (XEN) PCI: Not using MCFG for segment 0000 bus 00-3f
>>>
>>> Then, during dom0 boot, dom0 will call PHYSDEVOP_pci_mmcfg_reserved, after which
>>> MCFG becomes enabled in Xen:
>>>
>>> (XEN) PCI: Using MCFG for segment 0000 bus 00-3f
>>>
>>> On such machines where mmcfg/ECAM is initially disabled, this will effectively
>>> set ->ext_cfg to false for all devices discovered at Xen boot.
>>>
>>> I'm not really sure if I have any good suggestions, but perhaps we could add a
>>> macro or small function that returns something like
>>>    ( pdev->ext_cfg && pci_conf_read32(pdev->sbdf, PCI_CFG_SPACE_SIZE) != 0xffffffffU )
>>> to allow this checking to happen dynamically (but this still wouldn't handle the
>>> aliasing quirk). Maybe re-run the ext_cfg detection logic at the end of
>>> PHYSDEVOP_pci_mmcfg_reserved?
>>>
>>> Regardless, I'd be happy to provide my R-b without this addressed, but I am
>>> curious if others think this as an issue?
>>
>> Hmm, no, I forgot to consider that case (which in principle I'm well aware of).
>> Will need to fix in v2.
> 
> My reply yesterday was actually not quite sufficient. On a system like yours,
> isn't it the case that PVH Dom0 then also doesn't work quite right (yet), due
> to parts of vPCI depending on extended config space accesses now? All of what
> we presently do during boot, and which requires extended config space access,
> would need re-doing once extended config space access becomes available (or
> goes away) for a (sub)set of devices.

Right, e.g. rebar will fail to initialize. One possible approach might be to do
some variation of this at the end of PHYSDEVOP_pci_mmcfg_reserved (untested):

    for_each_pdev ( hardware_domain, pdev )
        vpci_reset_device(pdev);

This would be better than nothing IMO, however, as you point out, it may only be
needed for a subset of devices.

