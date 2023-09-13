Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB18479F9A2
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 06:46:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601496.937937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgeEb-0004MR-D8; Thu, 14 Sep 2023 04:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601496.937937; Thu, 14 Sep 2023 04:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgeEb-0004F8-9o; Thu, 14 Sep 2023 04:45:45 +0000
Received: by outflank-mailman (input) for mailman id 601496;
 Wed, 13 Sep 2023 16:21:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+cg=E5=amd.com=Yazen.Ghannam@srs-se1.protection.inumbo.net>)
 id 1qgScN-0002R7-RM
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 16:21:31 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e88::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97f10705-5251-11ee-8786-cb3800f73035;
 Wed, 13 Sep 2023 18:21:30 +0200 (CEST)
Received: from BN8PR12MB3108.namprd12.prod.outlook.com (2603:10b6:408:40::20)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.39; Wed, 13 Sep
 2023 16:21:26 +0000
Received: from BN8PR12MB3108.namprd12.prod.outlook.com
 ([fe80::377c:b288:3718:408b]) by BN8PR12MB3108.namprd12.prod.outlook.com
 ([fe80::377c:b288:3718:408b%7]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 16:21:26 +0000
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
X-Inumbo-ID: 97f10705-5251-11ee-8786-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AbAM/ijDNfYDw+PpL+PSBDEOQxx2+Jal8dRl5bhLOhnP/lfBnerivvmZr7em0SkNPoW0o+YyDXOGAyqZX/d4peWeOECIG/SPPRoerCiC6LIMSiBPhRhkKjD4D31v+r32lR+U9RA4+5yU31j/4HMo74rpcaYQkkHgkVoOqWd25P0aK4w5yI8zKhow/umgzt0KaGpeLEMd9kHhtPaeypYMS0kGA7lV19A6TdjVCJNTsIpxv6uqH9Jcq9De2nFZxD7CnNk3gfFQJfTOIEn9MubwN+w4uJK3CkL6iXyikR3y7ExAOmshRFa+SsDIwTnDb06g6pLDOXsNU5hp1uRiaDPqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFv0IXU+8fmxne5lj6aVNbdmZ4YdZI8WomzU/KcoQzk=;
 b=NjzrcPELBQsK49YlXDoWgYUvGiuCEKTQY5VLu+n4i2EvmwhuFQET+wK9+Fv3BUbQmIzJOgzkDfqD0lHtnPwwwzsqiPdmrLDBjz1uD/YsWZxYX34MnScnVYAOIzFIzVln3ZR27N+C2/yY/yUVI4IAS32ppcD6TXQDoqOJkxnWtq6M7OvO+IIOmuA2iC2zECfSNuMG5d10QewEkpl5qfQjUY9xNKDFqonh3iBL1YAAQMEjXMoizaR9Rwtka6KHzC+BLjeGdITUKXkjNvpyMsMk18JdjqU6TGSPb7pz7a55tlvHdm5BMyWqwHgp2sdRauqRnrvyWC6YGkTSyr0lbqfSEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFv0IXU+8fmxne5lj6aVNbdmZ4YdZI8WomzU/KcoQzk=;
 b=Sw+JPDCOv0bypOzlRL2LUavn3GT8Mzge5cgYg/PFJjX8bA4V9UPq6M6Y7XDeJ9BtNlH+xDbUD3AubXUYs/t5p3dOkXYLSVY6g7f0ytWxzGr4ese95jDTWQtTK6Iku5/CrJwhB2vf36w4aw5OBTczHLZenfjLfoNT1lTq/wdyWNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <fa5ec285-4d0f-4635-a35d-d290fd73ddfa@amd.com>
Date: Wed, 13 Sep 2023 12:21:23 -0400
User-Agent: Mozilla Thunderbird
Cc: yazen.ghannam@amd.com,
 "smita.koralahallichannabasappa@amd.com"
 <smita.koralahallichannabasappa@amd.com>,
 "linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "rric@kernel.org" <rric@kernel.org>,
 "james.morse@arm.com" <james.morse@arm.com>
Subject: Re: [PATCH] Revert "EDAC/mce_amd: Do not load edac_mce_amd module on
 guests"
Content-Language: en-US
To: "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 Elliott Mitchell <ehem+xen@m5p.com>
References: <20210628172740.245689-1-Smita.KoralahalliChannabasappa@amd.com>
 <ZPqQEHXgmak1LMNh@mattapan.m5p.com>
 <20230908035911.GAZPqcD/EjfKZ0ISrZ@fat_crate.local>
 <40d3399a-b260-4ffa-a503-40c61468a189@amd.com>
 <SJ1PR11MB6083BDC4D10D139EF28E0058FCF0A@SJ1PR11MB6083.namprd11.prod.outlook.com>
From: Yazen Ghannam <yazen.ghannam@amd.com>
In-Reply-To: <SJ1PR11MB6083BDC4D10D139EF28E0058FCF0A@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:408:ea::33) To BN8PR12MB3108.namprd12.prod.outlook.com
 (2603:10b6:408:40::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3108:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c6245f-3876-4d3b-4fae-08dbb4757a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	e0QOr5AAvHS9bx/ywNJw22AsQpIkW/14aEs1PYKq0vvWfBuZZ5eRC/mg6+ZUVhbkY3gnmP0B81M53K6vzfoalHnhNBvHCjDg37Xczduaed3kqJEN3rmjEW2Yzx0GLkkjo56tMGDDD2pP0AGh8fm3mubJKFqWXJYAzP1ZQeBMBKVcUXjOlkSfp15133G/o9qn+DBPFfCRCxYH/isI/HDrMyCy7o3ChIg3ufy6xNGhRLQEAMRDPrsP3RxAWMDrodD9Ief2Gx6iAKDz7H1KDUzJxdWsJBiI4HgNivONup1r/M1ucqcSil5/P9oxTTsHQGPukBiVgpEAnY5OVLxdESLPs9BeLmy4dvxxKOPRC2av6pDv1sxP7Kh2fggPkhH9yr5oAbrQn6bxAUmJ0F0bonq/2Fm0M3n1S87F4OZBwpayQ2ubTIKUMZ1L7h3KA9mJZuh/IZ8sDz7IXQ4eSPVL0xx0c73WREEMteaJhgYMrr+6XTZTt4onUZlxdzxhx2D14Ohd1CmOK91iEaKr4cFSOvnshVQ2/yozTUhSSxQ5rYxuAgrZV+4ijF4E06OQdHUvPlv906uAJpRn9S187JGbwmTSaIwWYuy+0t6AesUEpWxUODrynxGp/9wD3bWht9mTR0WG+t2EtS2N/fjhCv4M2NAAZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3108.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(451199024)(1800799009)(186009)(2906002)(83380400001)(6512007)(26005)(2616005)(66946007)(66476007)(316002)(44832011)(54906003)(66556008)(110136005)(8676002)(8936002)(4326008)(41300700001)(5660300002)(6666004)(6486002)(6506007)(53546011)(478600001)(38100700002)(31696002)(36756003)(31686004)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEhKQVBraGNLcVlybHBZbE0yeFVnNTVKT1ArMVo0d1RGRDNHM3FHVVNBd0pm?=
 =?utf-8?B?aWJmSFIvQWFzb0RwN3JBQ1dvRmJsQlA4SHArL1JZSS9YNXdpb3BCRHRGZk9B?=
 =?utf-8?B?MmM4QVNvZXB0UzdWMnFJSVVuQUNQU2EvQVVUbUdDSTdicURmVlVkOVVxTmtP?=
 =?utf-8?B?bVJQellVUHZqWUV2V2lML2UzRE5DWlhMOFVRQ0cxSGF6L2JOR2FtZnNNWnpT?=
 =?utf-8?B?amdLSUtlTUhKdUJ2YWVJYTlBVkJENlhTN3ROM1dHQjVvYy81TUJ3MUhGSkVs?=
 =?utf-8?B?azJlMTlmRDhuYkNjUGM3OVZJWE5NTXFiaFNiTTBwZkVFNDB4VGZFZDZ1UXN5?=
 =?utf-8?B?bll0SlBtcnYvcFF3QktscC9iMkJrSkRJMk1TeklKcitDeE1QNEF2S1ljWnNn?=
 =?utf-8?B?YmwrT0RFMXR3UW4yM0ZhTHlYMmM1dlVlS3VmSXNNQnFpaEFMRHlmMkI5L3Z6?=
 =?utf-8?B?Qys0OWNrUHF2MDV4ZTU1ZGdOR1RTRmpFYWFMTVVIY1RSZmZiWkt0Qi9Tb2RL?=
 =?utf-8?B?eS92UlZzcW5mY2gzMW9hOTJwUnpEMWRCK2ZnUFZvUlFSL1RwS0RIV2RvTnRL?=
 =?utf-8?B?Uzc0bDdZaURlS3IwamFoOTRGTUdOL2lBYnZLYUlaQUV0dlZsbkNoeEw2UFdz?=
 =?utf-8?B?OFVjZENBK2k4VDRUWWpuWFdNRE5jNzZrTW1hcmltRlhkZHBwTGcvUEwrbmFJ?=
 =?utf-8?B?eXhXdHNBSjk3aWtBL2VtQXFlQUZadW1xNjlnTm9WeUlvc2V2MkJMdDUxS001?=
 =?utf-8?B?Zmx5TEkvaWllNW93Q0k4UFJUOUhMOEtBT2lHK1FYZ0YzVlNBL0ZucFVVU2FB?=
 =?utf-8?B?TEZtenIyaEpaUnFtaGEybEtXYUhFbFFqc1RYRjdVb25rekdYYkM2blg2VERY?=
 =?utf-8?B?NWVZaG56OFBhRnZPOVZYbFZ1VTU5cGdLL0JiSEF5RFd4azI3VVRZZUVMK0t2?=
 =?utf-8?B?VmRCaDYrSmRIbnhSRWQxTk5aUUR5eFV0ZDYzcVdhalVFZzhTZjBMbmp3VU0z?=
 =?utf-8?B?ZHlMS0luUld6U3ArZDREaERTWnJaV0E4V2Z2YmtRNnpTN2lETFJTTkhydXBl?=
 =?utf-8?B?Y0t1cTN1MHJVa28xbHc0K1pXOUFmUkd2dHcrY2FJR0FrbnNLOWFvT0tpSkdP?=
 =?utf-8?B?Q3dmSGRYMmdZVXNYVG5xVkFNSEsyOFhHbHJ0L0RpbUVWcFRPYklZMldpM1A2?=
 =?utf-8?B?Mjlwc01sUUlwem1IWjBFeGpiSnkrWjhzWjBxQ2V6Ui9CNlJUZjZYeVFyeWdE?=
 =?utf-8?B?ckVrT2JNNHduZTVkMmlTTnNpNDFKWGxLSDlObmhxQjRjb1A2NUhmSzZFbmZP?=
 =?utf-8?B?TldoNHlSbXRQaTF5VUVJVlZ5ZHJlSVZadEZQSVpHN2g3eUtiVkVjdjgwUHlU?=
 =?utf-8?B?OGhVempkYnNubzg3TjUreTlQVnBsbU1CbkpVVFFGZzZLRXRjYjYwSjkzM1E3?=
 =?utf-8?B?Wmh4N1ZldmVxZnM5M3ZhTy9FZUFRT2MxcnhiZ2I5elFneEt2QlNGWWJ6VERI?=
 =?utf-8?B?dVNtUDhRZ20rMUIxZUE4VXlsczRHajlySFo1YnZHZVA1Um00dmE5Z05TUTNi?=
 =?utf-8?B?Z1laWlg5WjlyQkhmd1ZRRXNBVTJvSVRiMTNvSDRvNzBVZ2dyaWxmVHNxWnYy?=
 =?utf-8?B?VXdXYkt6MXB0N2wxVzBmQkVBc29WczZWRFJ1TTVZd0pHVkpnRU10SlZ0c251?=
 =?utf-8?B?Q2tKMi8xeVlCSUdzaTlKdVhlZnhSbnQ3R05rNVBOT3U4aGpyZlhLY0ZEcWEv?=
 =?utf-8?B?QllaLzJQc05kcHF3Tm5tYkJzaTRiY0xNVGVVd21OekYwSGlHR0RJTVUwbFVo?=
 =?utf-8?B?dVVlKzBEMnBzUzNDc1N3bFM2YVVVSFN4RDdLRENRdXZISFFJb2FHdWZyMXRs?=
 =?utf-8?B?UEFEZVM4R0p4bnoxd3JOR2hJWFZPbnc1ME5vMUFldGNXQjRaVmNlcXY3eFdH?=
 =?utf-8?B?UDdMMGcybk5KMXFVRXlMSTFSYmY0MXE3VmR5Q1ZqRjYrQVhBSWlYQWQ2THB4?=
 =?utf-8?B?VENMWk1FQVlDTklOd3kvNFQyWnZ0Yzh6Rk0vN0g3VUc3YnI4ekdwZ2FhZ0hB?=
 =?utf-8?B?QmozOGpFRkdhOXR0K3RzTkdJSVVxdS9MZ1doL3FwaThVU3laZngyU1hxV1Qz?=
 =?utf-8?Q?qKhM19IYfkcNZkYsWm+AH6BXR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c6245f-3876-4d3b-4fae-08dbb4757a5d
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3108.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 16:21:26.3277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QEOwIid6TlGyo5wKepY4BxOWbaMgOVudwVSb0V7ZEpidXhOjiLivf1Dhy0Copp8InrAojhJ22KyV5bDSBAbPBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215

On 9/13/23 11:50 AM, Luck, Tony wrote:
>> Also, please note that the EDAC modules don't handle MCE events
>> directly. They act on information passed from the MCE subsystem.
>>
>> Furthermore, there are other EDAC modules that have the same !hypervisor
>> check, so why change only this one?
> 
> The older Intel EDAC drivers translated system physical addresses to DIMM
> addresses by digging around in the CONFIG and MMIO space of the memory
> controller devices. It would seem unwise for a VMM to give access to those
> addresses to a guest (in general ... perhaps OK for a Xen style "DOM0" guest that is
> handling many tasks for the VMM?).
> 
> What system resources do AMD EDAC drivers need access to? Could they
> work inside a guest?
>

The MCE decoder may access some newer MCA registers, or request info
from the MCE subsystem. But this is for informational error decoding. It
won't support any actions that a guest could take.

The AMD64 EDAC module reads system-specific memory controller registers
through non-architectural interfaces. So also unwise or not useful for a
guest to access.

Thanks,
Yazen

